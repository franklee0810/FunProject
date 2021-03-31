package controller.study;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Alram;
import bean.Study;
import dao.AlramDao;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.MyStudy;
import dao.PostStudyDao;
import dao.StudyDao;

@Controller
public class StudyJoinController {
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@Autowired
	@Qualifier("psdao")
	private PostStudyDao psdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;
	
	public StudyJoinController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("my.st")
	public void doGet(
			@RequestParam(value = "seq_study")int seq_study,
			HttpSession session, HttpServletResponse response) throws Exception {
		Member member = (Member)session.getAttribute("loginfo");
		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		if(member != null) {
			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}
		PrintWriter writer = response.getWriter();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");

		if(member == null){
			System.out.println("로그인이 되어있지않음");
			out.println("<script>alert('참가를 위해선 로그인이 필요합니다');history.go(-1);</script>");
			out.flush();
		}else {
			String mid = member.getMid();
			int level1 = 0;
			System.out.println("조인 컨트롤러");
			System.out.println(mid);

			//List<PostStudy> postlist = this.psdao.SelectList(num);
			List<MyStudy> mylist = this.sdao.SelectListByNum(seq_study,mid);
			System.out.println("데이터 베이스가 눌이냐?"+mylist);

			if(mylist.isEmpty()) {
				List<Member> lists = new ArrayList<Member>();
				lists.add((Member) session.getAttribute("loginfo"));
				for(Member bean : lists) {
					int cnt = -999;
					cnt = this.sdao.InsertData(bean.getMid(),seq_study,bean.getNickname(),level1);
				}
				this.sdao.UpdatePersonnel(seq_study);

				this.mav.addObject("seq_study",seq_study);


				List<Study> mystudylists = this.sdao.SelectMyList(mid);

				this.mav.addObject("mystudylist", mystudylists);
				Member hostMember = mdao.selectHostMember(seq_study);
				Study study = sdao.SelectStudyOne(seq_study);
				this.adao.InsertJoinAlram(hostMember.getMid(), study.getSubject(), "가입 신청자가 있습니다.");

				System.out.println("스터디에 참여 신청했습니다");
				out.println("<script>alert('스터디에 참여 신청했습니다');location.href='/main.co';</script>");
				out.flush();

			}else {
				System.out.println("이미 가입한 스터디입니다");
				out.println("<script>alert('이미 가입신청한 스터디입니다');history.go(-1);</script>");
				out.flush();
			}
		}
	}
}
