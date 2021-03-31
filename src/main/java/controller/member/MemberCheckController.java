package controller.member;

import bean.Member;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberCheckController {

    @Autowired
    @Qualifier("mdao")
    private MemberDao mdao;

    @PostMapping("nicknameCheck.me")
    @ResponseBody
    public String nicknameCheck(@RequestParam("nickname") String nickname) throws Exception{
        System.out.println(getClass() + "ninicknameCheck");
        Member member = mdao.selectMemberNickname(nickname);
        String result;

        if(member==null){
            result = "Y";
        } else {
            result = "N";
        }

        return result;
    }

    @PostMapping("midCheck.me")
    @ResponseBody
    public String midCheck(@RequestParam("mid") String mid) throws Exception{
        System.out.println(getClass() + "midCheck");
        Member member = mdao.selectMemberMid(mid);
        String result;

        if(member==null){
            result = "Y";
        } else {
            result = "N";
        }

        return result;
    }
}
