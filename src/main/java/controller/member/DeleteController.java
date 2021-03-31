package controller.member;

import bean.Member;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class DeleteController {
    private ModelAndView mav = null;

    @Autowired
    @Qualifier("mdao")
    private MemberDao mdao;

    public DeleteController() {
        this.mav = new ModelAndView();
    }

    @GetMapping("deleteMember")
    public ModelAndView doPost(HttpSession session){
        Member member = (Member)session.getAttribute("loginfo");
        mdao.deleteMemberOne(member.getMid());
        session.invalidate();
        this.mav.setViewName("redirect:/main.co");
        return mav;
    }
}
