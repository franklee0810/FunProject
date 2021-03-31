package controller.study;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Alram;
import bean.Member;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bean.Search;
import bean.Study;
import dao.StudyDao;

@RestController
@RequestMapping(produces = "application/json; charset=utf8")
public class StudySearchController {

	private ModelAndView mav = null ;

	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao ;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	public StudySearchController() {
		this.mav = new ModelAndView();
	}

	@RequestMapping(value = "/searchStudyByArea.st", method=RequestMethod.POST)
	public List SearchedStudyList(@RequestBody Map<String, Object> param) throws Exception{
		System.out.println(getClass() + " SearchedStudyList");
		
		String city = param.get("city").equals("시/도 선택") ? null : (String) param.get("city");
		String borough = param.get("borough").equals("구/군 선택") ? null : (String) param.get("borough");
		String topic = param.get("topic").equals("분야") ? null : (String) param.get("topic");

		System.out.println(city);
		System.out.println(borough);
		System.out.println(topic);
 
		Map<String, String> map = new HashMap<>();
		if(city!=null){
			map.put("city", city);
		}
		if(borough!=null){
			map.put("borough", borough);
		}
		if(topic!=null){
			map.put("topic", topic);
		}
		
		List<Study> lists_ = sdao.SearchStudyListByArea(map);
		List<Study> lists = new ArrayList<>();
		for(Study study : lists_){
			study.setHost(mdao.selectHostMember(study.getSeq_study()));
			lists.add(study);
		}
		
		this.mav.addObject("lists", lists);
		this.mav.setViewName("study/studylist");
		
		return lists;

	}

	@RequestMapping(value = "/searchStudy.st", method = RequestMethod.GET)
	public ModelAndView SearchedStudyList(@RequestParam(required = false) String keyword
			) throws Exception {
		System.out.println(getClass() + " SearchedStudyList");

		List<Study> lists_ = sdao.SearchStudyList(keyword);
		List<Study> lists = new ArrayList<>();
		for(Study study : lists_){
			study.setHost(mdao.selectHostMember(study.getSeq_study()));
			lists.add(study);
		}
 		this.mav.addObject("lists", lists);
 		this.mav.setViewName("study/studylist");
 		
		System.out.println("완료 ");
		return this.mav;

	}

	

 	
	
}
