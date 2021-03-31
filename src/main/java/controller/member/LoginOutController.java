package controller.member;

import bean.MyStudy;
import bean.Study;
import dao.MemberDao;
import dao.StudyDao;
import bean.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginOutController {
    private ModelAndView mav = null;

    @Autowired
    @Qualifier("mdao")
    private MemberDao mdao;

    @Autowired
    @Qualifier("sdao")
    private StudyDao sdao;

    public LoginOutController() {
        this.mav = new ModelAndView();
    }

    @PostMapping("login.me")
    public ModelAndView Login(
            @RequestParam(value = "mid") String mid,
            @RequestParam(value = "password") String password,
            HttpSession session) {
        System.out.println(getClass() + " Login");
        Member member = this.mdao.selectMember(mid,password);
        System.out.println("mid : " + mid + ", password : " + password);
        if(member != null) {
            List<Study> studySBSCR = this.sdao.SelectMyList(mid);

            this.mav.addObject("mystudylist", studySBSCR) ;
            session.setAttribute("mystudylist", studySBSCR);
        }

        System.out.println(member);
        this.mav.setViewName("redirect:/main.co");

        session.setAttribute("loginfo", member);
        return this.mav;
    }
    
    @GetMapping("logout.me")
    public ModelAndView Logout(HttpSession session) throws Exception {
    	System.out.println(getClass() + " Logout");
    	session.invalidate();
    	this.mav.setViewName("redirect:/main.co");
    	return this.mav;
    }
}
