package controller.study;

import javax.servlet.http.HttpSession;

import bean.Alram;
import bean.Member;
import dao.AlramDao;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Study;
import dao.StudyDao;

import java.util.List;

@Controller
public class StudyDetailController {
	private final String command = "/detailview.st" ; 
	private ModelAndView mav = null ;

	
	@ModelAttribute("study")
	public Study mystudy() {
		System.out.println("@ModelAttribute(\"Study\")");
		return new Study();
	}
	
	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao ;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao ;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;
	
	public StudyDetailController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "seq_study", required = true) int seq_study,
			HttpSession session) {
		
		Study study = sdao.GetStudyListByPk(seq_study);
		Member member = mdao.selectHostMember(seq_study);
		
		// study 리스트 바인딩 
		mav.addObject("study", study);
		mav.addObject("host", member);
		mav.addObject("seq_study", seq_study);
		this.mav.setViewName("study/studydetail");
		
		System.out.println("seq_study에 따른 study 객체를 가져옴");

		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		if(member != null) {
			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}
		return this.mav ;
	}
	
	
	 
}
