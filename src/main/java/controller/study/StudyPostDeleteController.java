package controller.study;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import bean.Alram;
import bean.Study;
import dao.AlramDao;
import dao.MemberDao;
import dao.StudyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import dao.PostStudyDao;

@Controller
public class StudyPostDeleteController {
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("psdao")
	private PostStudyDao psdao;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;

	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;

	public  StudyPostDeleteController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("deletepost.st")
	public ModelAndView PostDelete(
			@RequestParam(value = "seq_study") int seq_study,
			@RequestParam(value = "seq_post")int seq_post,
			HttpSession session) {
		System.out.println(getClass() + " PostDelete");
		System.out.println("seq_post : " + seq_post + " , seq_study : " + seq_study);

		//작성자와 로그인 한 사람이 일치하는지 안하는지 확인
		Member writer = psdao.selectPostWriter(seq_study, seq_post);
		Member studyHost = mdao.selectHostMember(seq_study);
		Member member = (Member) session.getAttribute("loginfo");

		if(member == null) {
			this.mav.setViewName("redirect:/main.co");
			return mav;
		}

		if(member.getMid().equalsIgnoreCase(writer.getMid())){
			System.out.println("로그인한 아이디와 작성자가 같습니다.");
			//글삭제
			this.psdao.DeletePost(seq_post);
			//파일 삭제
			this.psdao.DeleteFile(seq_post);

			this.mav.setViewName("redirect:/post.st?seq_study=" + seq_study);
			return this.mav;
		}else if(member.getMid().equalsIgnoreCase(studyHost.getMid())){
			System.out.println("스터디 운영자가 시도한 삭제입니다.");
			//글삭제
			this.psdao.DeletePost(seq_post);
			//파일 삭제
			this.psdao.DeleteFile(seq_post);

			this.mav.setViewName("redirect:/post.st?seq_study=" + seq_study);
			return this.mav;
		}else {
			System.out.println("로그인 아이디와 작성자가 다릅니다.");
			this.mav.setViewName("redirect:/post.st?seq_study=" + seq_study);

			if(member != null) {
				List<Alram> alrams = adao.SelectAlramById(member.getMid());
				this.mav.addObject("alrams", alrams);
			}

			return this.mav;
		}
	}

	@GetMapping("deleteHostpost.st")
	public ModelAndView hostPostDelete(
			@RequestParam(value = "seq_study") int seq_study,
			@RequestParam(value = "seq_post")int seq_post,
			HttpSession session) {
		System.out.println(getClass() + " hostPostDelete");
		System.out.println("seq_post : " + seq_post + " , seq_study : " + seq_study);

		//작성자와 로그인 한 사람이 일치하는지 안하는지 확인
		Member writer = psdao.selectPostWriter(seq_study, seq_post);
		Member member = (Member) session.getAttribute("loginfo");

		if(member == null) {
			this.mav.setViewName("redirect:/main.co");
			return mav;
		}

		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		if(member != null) {
			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}

		if(member.getMid().equalsIgnoreCase(writer.getMid())){
			System.out.println("로그인한 아이디와 작성자가 같습니다.");
			//글삭제
			this.psdao.DeletePost(seq_post);
			//파일 삭제
			this.psdao.DeleteFile(seq_post);

			this.mav.setViewName("redirect:/post.st?seq_study=" + seq_study);
			return this.mav;
		}else {
			System.out.println("로그인 아이디와 작성자가 다릅니다.");
			this.mav.setViewName("redirect:/post.st?seq_study=" + seq_study);



			return this.mav;
		}
	}
}
