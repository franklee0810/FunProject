package controller.common;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Alram;
import bean.Member;
import bean.Study;
import dao.AlramDao;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.StudyDao;

import java.util.ArrayList;
import java.util.List;


@Controller
public class MainController {
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;


	public MainController() {
		
		this.mav = new ModelAndView();
	}
	@GetMapping("main.co")
	public ModelAndView doGet(HttpSession session) {
		System.out.println(getClass() + "doGet");
		Member member = (Member) session.getAttribute("loginfo");
		//전체 스터디 리스트
		List<Study> lists_ = sdao.getStudyList();
		List<Study> lists = new ArrayList<>();
		for(Study study : lists_){
			study.setHost(mdao.selectHostMember(study.getSeq_study()));
			lists.add(study);
		}

		//avg_grade 가 높은 순으로 정렬된 스터디 리스트
		List<Study> listsByAvg_grade_ = sdao.GetStudyListByAvg_grade();
		List<Study> listsByAvg_grade = new ArrayList<>();
		for(Study study : listsByAvg_grade_){
			study.setHost(mdao.selectHostMember(study.getSeq_study()));
			listsByAvg_grade.add(study);
		}

		this.mav.addObject("listsByAvg_grade", listsByAvg_grade);
		this.mav.addObject("lists", lists);
		this.mav.setViewName("/main");

		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		if(member != null) {
			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}

		System.out.println(lists);
		System.out.println(listsByAvg_grade);
		return this.mav;
	}
}
