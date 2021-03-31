package controller.wish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.WishDao;

@Controller
public class WishStudyDeleteController {

	@Autowired
	@Qualifier("wdao")
	private WishDao wdao;
	
	private ModelAndView mav;

	public WishStudyDeleteController() {

		this.mav = new ModelAndView();
	}
	
	@GetMapping(value = "deletewish.wi")
	public ModelAndView doGet(
			@RequestParam(value ="mid")String mid,
			@RequestParam(value = "seq_study")int seq_study) {
		int cnt = -999;
		System.out.println("mid : "+mid);
		System.out.println("seq_study : "+seq_study);
		cnt = this.wdao.DeleteWishList(mid,seq_study);
		
		this.mav.addObject("mid",mid);
		this.mav.addObject("seq_study",seq_study);
		
		this.mav.setViewName("redirect:/wish.wi");
		return this.mav;
	}
}
