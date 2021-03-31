package controller.study;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import bean.Alram;
import bean.Member;
import dao.AlramDao;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bean.Study;
import dao.StudyDao;
@Controller
public class StudyCreateController {
	
	private final String command = "/create.st" ; 
	private ModelAndView mav = null ;

	
	@ModelAttribute("study")
	public Study mystudy() {
		System.out.println("@ModelAttribute(\"Study\")");
		return new Study();
	}
	
	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;
	
	public StudyCreateController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		
		this.mav.setViewName("studylist");
		return this.mav;
	}
	
	@RequestMapping(value="create.st", method=RequestMethod.POST) 
	public ModelAndView doPost(MultipartHttpServletRequest request, HttpSession session) {

		System.out.println("create.st 도착 ");
		Study study = new Study();
		study.setSubject(request.getParameter("subject"));
		study.setIntrd(request.getParameter("intrd"));
		study.setTime_from(request.getParameter("time_from"));
		System.out.println(request.getParameter("time_from"));
		study.setTime_to(request.getParameter("time_to"));
		System.out.println(request.getParameter("time_to"));
		study.setPersonnel(Integer.parseInt(request.getParameter("personnel")));
		study.setCity(request.getParameter("city"));
		study.setBorough(request.getParameter("borough"));
		study.setTopic(request.getParameter("topic"));

// 			like 일단 제외......
		MultipartFile multifile = request.getFile("image");
		String path = request.getRealPath("uploadFile/study"); // 저장위치
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(today) + multifile.getOriginalFilename().substring(multifile.getOriginalFilename().indexOf(".")); // 업로드 파일명
		File uploadFile = new File(path +"//" + fileName); //복사위치
		try {
			multifile.transferTo(uploadFile); //업로드
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e2) {
			e2.printStackTrace();
		}

		study.setImage(fileName);

		System.out.println(fileName);
		System.out.println(uploadFile);

		sdao.InsertStudy(study);

		mdao.insertStudyHost((Member)session.getAttribute("loginfo"), sdao.selectStudyImage(fileName));

		Member member = (Member) session.getAttribute("loginfo");
		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		if(member != null) {
			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}
		this.mav.setViewName("redirect:/list.st");
  
		return this.mav;
	}
	
	
}
