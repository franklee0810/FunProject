package controller.member;

import bean.Member;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class RegisterController {
    private ModelAndView mav = null;

    @Autowired
    @Qualifier("mdao")
    private MemberDao mdao;

    public RegisterController() {
        this.mav = new ModelAndView();
    }

    @ModelAttribute("member")
    public Member member() { return new Member(); }

    @GetMapping("registMember")
    public ModelAndView doGet(){
        System.out.println(getClass() + " doGet");
        mav.setViewName("member/signup");
        return mav;
    }

    @PostMapping("registMember")
    public ModelAndView doPost(@ModelAttribute("member") Member member, MultipartHttpServletRequest request, HttpSession session){
        System.out.println(getClass() + " doPost");

        MultipartFile multifile = request.getFile("uploadimage");
        if(multifile.getOriginalFilename().equals("")){
            member.setProfile("user-default.png");
        }else {
            String path = request.getRealPath("uploadFile/user"); // 저장위치
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
            member.setProfile(fileName);
        }

        System.out.println(member);
        mdao.insertMemberOne(member);
        session.setAttribute("loginfo", member);
        mav.setViewName("redirect:/main.co");
        return mav;
    }
}
