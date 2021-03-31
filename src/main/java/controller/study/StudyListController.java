package controller.study;

import java.util.ArrayList;
import java.util.List;

import bean.Alram;
import bean.Member;
import dao.AlramDao;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Study;
import dao.StudyDao;

@Controller
public class StudyListController {
	private final String command = "/list.st" ;
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	public StudyListController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("find.st")
	public ModelAndView doGet() {
		List<Study> lists = this.sdao.SelectList();
		this.mav.addObject("lists", lists) ;
		this.mav.setViewName("study/stList");
		return this.mav;
	}

	@GetMapping(command)
	public ModelAndView doGetList() {
		List<Study> lists_ = sdao.getStudyList();
		List<Study> lists = new ArrayList<>();
		for(Study study : lists_){
			study.setHost(mdao.selectHostMember(study.getSeq_study()));
			lists.add(study);
		}
		System.out.println("dao에서 데이터 가져옴 ");
		this.mav.addObject("lists", lists);
		this.mav.setViewName("study/studylist");

		System.out.println("가져오기 직전!! ");
		System.out.println(lists);
		return this.mav;

	}
}
