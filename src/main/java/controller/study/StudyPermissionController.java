package controller.study;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import bean.Alram;
import bean.Study;
import dao.AlramDao;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import dao.StudyDao;

@Controller
public class StudyPermissionController {
	private ModelAndView mav = null;

	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;

	public StudyPermissionController() {
		this.mav = new ModelAndView();
	}

	@GetMapping("permission.st")
	public ModelAndView doGet(@RequestParam(value = "mid") String askmid, // 승인 요청중인 아이디
			@RequestParam(value = "seq_study") int seq_study, HttpSession session) {
		System.out.println(getClass() + " doGet");
		Member member = (Member)session.getAttribute("loginfo");
		if (member == null) {
			this.mav.setViewName("redirect:/main.co");
			return this.mav;
		}

		this.mav.addObject("seq_study", seq_study);
		// 호스트 아이디 불러오기
		Member hostMember = this.mdao.SelectHostOne(seq_study);

		if (hostMember.getMid().equalsIgnoreCase(member.getMid())) {
			// 로그인 아이디와 스터디 호스트 아이디가 같음
			// 레벨 1로 올리기(그냥 +1로 했음)
			int cnt = -999;
			cnt = this.sdao.UpdateLevel(askmid, seq_study);
		}
		Study study = sdao.SelectStudyOne(seq_study);
		adao.InsertJoinAlram(askmid, study.getSubject(), "가입신청이 수락되었습니다.");
		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		if(member != null) {
			List<Study> studySBSCR = this.sdao.SelectMyList(member.getMid());

			this.mav.addObject("mystudylist", studySBSCR) ;
			session.setAttribute("mystudylist", studySBSCR);
		}
		this.mav.setViewName("redirect:/post.st");
		return this.mav;
	}
}
