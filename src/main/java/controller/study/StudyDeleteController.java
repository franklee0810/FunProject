package controller.study;

import java.util.List;

import bean.Alram;
import bean.Study;
import dao.AlramDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import dao.MemberDao;
import dao.StudyDao;

import javax.servlet.http.HttpSession;

@Controller
public class StudyDeleteController {
	private ModelAndView mav = null ;

	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;

	@ModelAttribute("study")
	public Study mystudy() {
		System.out.println("@ModelAttribute(\"Study\")");
		return new Study();
	}

	public StudyDeleteController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping(value= "deletestudy.st")
	public ModelAndView doGet(
			@RequestParam(value = "seq_study")int seq_study,
			HttpSession session) {
		System.out.println(getClass() + " doGet");

		// 호스트 아이디 불러오기
		Member hostMember = this.mdao.SelectHostOne(seq_study);
		Member member = (Member) session.getAttribute("loginfo");
		
		//호스트를 통해서 지우기 
		if(member.getMid().equalsIgnoreCase(hostMember.getMid())) {
			//로그인 아이디와 해당 호스트 아이디가 같음
			int cnt = -999;
			cnt = this.sdao.DeleteStudy(seq_study);
			
			this.mav.setViewName("redirect:/main.co");

			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}else {
			this.mav.setViewName("redirect:/post.st?seq_study="+seq_study);
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
		return this.mav;
	}
}
