package controller.study;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.Alram;
import dao.AlramDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.PostStudy;
import dao.PostStudyDao;

@Controller
public class StudyPostUpdateController {
	private ModelAndView mav = null;

	@Autowired
	@Qualifier("psdao")
	private PostStudyDao psdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;

	public StudyPostUpdateController() {
		this.mav = new ModelAndView();
	}

	@PostMapping("updateHostPost")
	public ModelAndView updateHostPost(HttpSession session,
									   @RequestParam("seq_study") String seq_study,
									   @RequestParam("seq_post") String seq_post,
									   @RequestParam("content") String content){
		System.out.println(getClass() + " updateHostPost");

		Member member = (Member) session.getAttribute("loginfo");
		Member writer = psdao.selectPostWriter(Integer.parseInt(seq_study), Integer.parseInt(seq_post));

		if(!member.getMid().equalsIgnoreCase(writer.getMid())){
			mav.setViewName("redirect:/post.st?seq_study=" + seq_study);
			return mav;
		}
		PostStudy post = new PostStudy();
		post.setContent(content);
		post.setMid(member.getMid());
		post.setSeq_post(Integer.parseInt(seq_post));
		psdao.UpdateContent(post);
		mav.setViewName("redirect:/post.st?seq_study=" + seq_study);

		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		return mav;
	}

	@PostMapping("updatePost")
	public ModelAndView updatePost(HttpSession session,
								   @RequestParam("seq_study") String seq_study,
								   @RequestParam("seq_post") String seq_post,
								   @RequestParam("content") String content) {
		System.out.println(getClass() + " updatePost");

		Member member = (Member) session.getAttribute("loginfo");
		Member writer = psdao.selectPostWriter(Integer.parseInt(seq_study), Integer.parseInt(seq_post));

		if(!member.getMid().equalsIgnoreCase(writer.getMid())){
			mav.setViewName("redirect:/post.st?seq_study=" + seq_study);
			return mav;
		}
		PostStudy post = new PostStudy();
		post.setContent(content);
		post.setMid(member.getMid());
		post.setSeq_post(Integer.parseInt(seq_post));
		psdao.UpdateContent(post);
		mav.setViewName("redirect:/post.st?seq_study=" + seq_study);
		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		return mav;
	}
}
