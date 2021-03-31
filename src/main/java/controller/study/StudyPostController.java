package controller.study;

import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import dao.AlramDao;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import dao.PostStudyDao;
import dao.StudyDao;

@Controller
public class StudyPostController {
	private ModelAndView mav = null;
	private String path;


	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;

	@Autowired
	@Qualifier("psdao")
	private PostStudyDao psdao;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;

	public StudyPostController() {
		this.mav = new ModelAndView();
	}

	@GetMapping("post.st")
	public ModelAndView doGet(@RequestParam(value = "seq_study") int seq_study, HttpSession session, HttpServletRequest request) {
		System.out.println(getClass() + " doGet");
		Member member = (Member)session.getAttribute("loginfo");
		if(member == null){
			mav.setViewName("redirect:/main.co");
			return mav;
		}
		mav.addObject("seq_study", seq_study);

		// 스터디 만든이
		Member hostMember = this.mdao.SelectHostOne(seq_study);
		System.out.println("Login ID : " + member.getMid() + " & Host ID :  " + hostMember.getMid());

		// 한줄 게시판 불러오기
		List<PostStudy> postList_ = this.psdao.selectPostList(seq_study, hostMember.getMid());
		List<PostStudy> postList = new ArrayList<>();
		for(PostStudy post : postList_){
			post.setWriter(mdao.selectWriterMember(post.getMid()));
			post.setFileList(psdao.selectPostFileList(post.getSeq_post()));
			postList.add(post);
		}
		this.mav.addObject("postList", postList);

		// 가입한 맴버 목록
		List<Member> StudyMemberList = this.mdao.SelectStudyMemberList(seq_study);

		this.mav.addObject("StudyMemberList", StudyMemberList);

		// hostname 다 수정할것
		this.mav.addObject("hostMember", hostMember);

		// 스터디 참가 신청자 목록
		List<Member> subscriptionlist = this.mdao.SelectSubscription(seq_study);
		this.mav.addObject("subscription", subscriptionlist);

		// 스터디 리더 글 불러오기
		List<PostStudy> leaderPost_ = this.psdao.selectHostPostList(seq_study, hostMember.getMid());
		List<PostStudy> leaderPost = new ArrayList<>();
		for(PostStudy post : leaderPost_){
			post.setFileList(psdao.selectPostFileList(post.getSeq_post()));
			leaderPost.add(post);
		}

		this.mav.addObject("leaderPost", leaderPost);

		// 파일 리스트 가져오기
		List<ShareFile> filelist = this.psdao.SelectFileList(seq_study);
		this.mav.addObject("filelist", filelist);

		this.mav.setViewName("study/studypost");

		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		if(member != null) {
			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}
		return this.mav;
	}

	@PostMapping("post.st")
	public ModelAndView doPost(@RequestParam(value = "content") String content,
							   @RequestParam(value = "seq_study") String seq_study,
							   HttpSession session,
							   HttpServletRequest request,
							   MultipartHttpServletRequest mhsRequest) {
		System.out.println(getClass() + " doPost");
		System.out.println("content : " + content);
		System.out.println("seq_study : " + seq_study);
		this.mav.setViewName("redirect:/post.st");
		// 작성 파트
		Member member = (Member) session.getAttribute("loginfo");

		// 로그인 한 사람 가입 승인 여부 확인
		List<MyStudy> mylist = this.sdao.SelectLevel(member.getMid(), Integer.parseInt(seq_study));

		if (mylist.isEmpty()) {
			System.out.println("가입 아직 허락 안받음");
			return this.mav;
		} else {
			int cnt = -999;
			cnt = this.psdao.InsertData(content, member.getMid(), Integer.parseInt(seq_study));

			// 일반 회원 한줄 전용
			List<PostStudy> lists = this.psdao.SelectList(Integer.parseInt(seq_study));
			// 스터디 리더 전용
			Member hostMember = this.mdao.SelectHostOne(Integer.parseInt(seq_study));
			List<PostStudy> leaderlist = this.psdao.SelectHostList(Integer.parseInt(seq_study), hostMember.getMid());

			int seq_post = 0;
			
			if(member.getMid().equalsIgnoreCase(hostMember.getMid())) {
				//로그인 아이디와 스터디 리더의 아이디가 같다면, seq_post 구해오기
				seq_post = leaderlist.get(0).getSeq_post();
			}else {
				// 일반 회원이라면, 공유 파일 seq_post 넣을 스터디 포스트 seq_post 구해오기
				seq_post = lists.get(0).getSeq_post();
			}

			List<MyStudy> alramMembers = sdao.SelectPostAlramMember(member.getMid(), seq_study);
			Study study = sdao.SelectStudyOne(Integer.parseInt(seq_study));
			for(MyStudy alramMember : alramMembers){
				adao.InsertJoinAlram(alramMember.getMid(), study.getSubject(), "새 글이 포스트되었습니다.");
			}

			List<MultipartFile> fileList = mhsRequest.getFiles("file");
			path = request.getRealPath("uploadFile/file/"); // 저장위치

			if(fileList.size() == 0) {
				System.out.println("fileList.size() : 0일때 인데... " + fileList.size());
			}else {
				System.out.println("fileList.size() : 0아닐때 인데... " + fileList.size());
				
				for(MultipartFile multipartFile : fileList){
					String originFileName = multipartFile.getOriginalFilename();
					if(originFileName.isEmpty())
						break;
					long fileSize = multipartFile.getSize();

					System.out.println("originFileName : " + originFileName);
					System.out.println("fileSize : " + fileSize);

					String safeFile = path + System.currentTimeMillis() + originFileName;
					System.out.println("safeFile : " + safeFile);

					StudyFile studyFile = new StudyFile();
					studyFile.setSeq_post(seq_post);
					studyFile.setFile(safeFile.substring(safeFile.indexOf("file")+5));
					try {
						multipartFile.transferTo(new File(safeFile));
						psdao.insertFile(studyFile);
					}catch (IllegalStateException e){
						e.printStackTrace();
						return this.mav;
					} catch (IOException e){
						e.printStackTrace();
						return this.mav;
					}
				}
			}
		}
		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		return this.mav;
	}

	@GetMapping(value = "download.st")
	public void downloadFile(
			@RequestParam(name = "file") String fileName,
			HttpServletRequest request, HttpServletResponse response
			) {
		System.out.println(getClass() + " downloadFile");
		System.out.println("fileName : "+ fileName);

		String saveDir = request.getSession().getServletContext().getRealPath("uploadFile/file/");
		System.out.println("saveDir : " + saveDir);

		File file = new File(saveDir + fileName);

		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;

		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();

			String reFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;

			if(isMSIE){
				reFilename = URLEncoder.encode("이미지 파일.jpg", "utf-8");
				reFilename = reFilename.replaceAll("\\+", "%20");
			}else {
				reFilename = new String("이미지 파일.jpg".getBytes("utf-8"), "ISO-8859-1");
			}

			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attachment;filename=\""+reFilename+"\"");
			response.setContentLength((int)file.length());

			int read = 0;
			while((read = bis.read()) != -1) {
				sos.write(read);
			}
		}catch (IOException e){
			e.printStackTrace();
		}finally {
			try {
				sos.close();
				bis.close();
			}catch (IOException e){
				e.printStackTrace();
			}
		}
	}
}
