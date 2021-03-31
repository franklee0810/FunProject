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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ModifyController {
    private ModelAndView mav = null;

    @Autowired
    @Qualifier("mdao")
    private MemberDao mdao;

    public ModifyController() {
        this.mav = new ModelAndView();
    }
    
    @ModelAttribute("member")
    public Member album(){
        return new Member();
    }

    @GetMapping("modify.me")
    public ModelAndView doGet(HttpSession session){
        System.out.println(getClass() + " modifyGet");
        if(session.getAttribute("loginfo")==null){
            mav.setViewName("common/main");
        }else {
            mav.setViewName("member/modify");
            mav.addObject("member", (Member)session.getAttribute("loginfo"));
        }
        return mav;
    }

    @PostMapping("modify.me")
    public ModelAndView doPost(@ModelAttribute(value = "member") Member member, HttpSession session, MultipartHttpServletRequest request){
        System.out.println(getClass() + " doPost");

        Member mem = (Member)session.getAttribute("loginfo");
        member.setMid(mem.getMid());
        member.setName(mem.getName());

        if(member.getPassword().isEmpty()){
            member.setPassword(mem.getPassword());
        }

        MultipartFile multifile = request.getFile("uploadimage");
        if(multifile.getOriginalFilename().equals("") && mem.getProfile().equalsIgnoreCase("user-default.png")){
            member.setProfile("user-default.png");
        }else if(multifile.getOriginalFilename().equals("") && !mem.getProfile().equalsIgnoreCase("user-default.png")){
            member.setProfile(mem.getProfile());
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
        mdao.updateMemberOne(member);
        session.setAttribute("loginfo", member);
        mav.setViewName("common/main");
        return mav;
    }
}
