package controller.wish;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Study;
import bean.WishStudy;
import dao.WishDao;

@Controller
public class WishStudyController {
	
	@Autowired
	@Qualifier("wdao")
	private WishDao wdao;
	
	private ModelAndView mav;

	public WishStudyController() {

		this.mav = new ModelAndView();
	}
	
	@GetMapping(value = "wish.wi")
	public ModelAndView doGet(HttpSession session) {
		System.out.println(getClass() + " doGet");
		Member member = (Member) session.getAttribute("loginfo");
		if(member == null){
			this.mav.setViewName("redirect:/main.co");
			return this.mav;
		}
		List<Study> lists = this.wdao.SelectList(member.getMid());
		
		this.mav.addObject("wishlists",lists);
		this.mav.setViewName("/studyscrap");
		return this.mav;
	}
	
	
	@PostMapping(value = "wish.wi")
	public void doPost(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		System.out.println(getClass() + " doPost");
		Member member = (Member) session.getAttribute("loginfo");
		int seq_study = Integer.parseInt(request.getParameter("seq_study"));

		PrintWriter writer = response.getWriter();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");

		WishStudy wishStudy = this.wdao.SelectListCheck(member.getMid(),seq_study);
		
		if(wishStudy == null) {
			int cnt= -999;
			wishStudy = new WishStudy();
			wishStudy.setSeq_study(seq_study);
			wishStudy.setSubject(request.getParameter("subject"));
			wishStudy.setMid(member.getMid());

			wdao.InsertWishList(wishStudy);

			System.out.println("스터디를 찜 목록에 추가하였습니다");
			out.println("<script>alert('스터디를 찜 목록에 추가하였습니다');history.go(-1);</script>");
			out.flush();
		}else {
			System.out.println("이미 찜 목록에 넣었음");
			out.println("<script>alert('이미 찜 목록에 넣어져있습니다');history.go(-1);</script>");
			out.flush();
		}
	}
}