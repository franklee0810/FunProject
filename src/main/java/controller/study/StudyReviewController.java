package controller.study;

 
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Alram;
import bean.Member;
import dao.AlramDao;
import dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import bean.Study;
import bean.StudyReview;
import dao.StudyDao;


@RestController
@RequestMapping(produces = "application/json; charset=utf8")
public class StudyReviewController {
	private final String command = "/insertReview.st" ; 
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("sdao")
	private StudyDao sdao ;

	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao ;

	@Autowired
	@Qualifier("adao")
	private AlramDao adao;

	public StudyReviewController() {
		this.mav = new ModelAndView();
	}
	
	
	@PostMapping("insertReview.st")
	@ResponseBody
	public ModelAndView InsertStudyReview(
			@RequestParam("seq_study") String seq_study,
			@RequestParam("content") String content,
			@RequestParam("ratingScore") String grade,
			HttpSession session) throws Exception {

		//현재 접속중인 사용자 아이디
		System.out.println(this.getClass() + " InsertStudyReview");
		Member member = (Member)session.getAttribute("loginfo") ;

		StudyReview studyreview = new StudyReview();
		studyreview.setGrade(Integer.parseInt(grade.substring(0,1)));
		studyreview.setSeq_study(Integer.parseInt(seq_study));
		studyreview.setContent(content);
		studyreview.setMid(member.getMid());

		sdao.InsertStudyReview(studyreview);
		this.studyGradeModify(seq_study);
		mav.setViewName("redirect:/detailview.st?seq_study=" + seq_study);
		if(member != null) {
			List<Alram> alrams = adao.SelectAlramById(member.getMid());
			this.mav.addObject("alrams", alrams);
		}
		return mav;
	}
	
	// 버전 1
	@RequestMapping(value="/listReview.st",method=RequestMethod.POST)
	public List GetStudyReviewList(@RequestBody Map<String, Object> param) throws Exception{
		int seq_study = StringUtils.isEmpty(param.get("seq_study")) ? 1 : Integer.parseInt( (String) param.get("seq_study"));
		
		System.out.println(getClass() + " listReviewPost");
		System.out.println(param.get("seq_study"));
		
		//Map<String, List<StudyReview>> list = new HashMap<String, List<StudyReview>>();
		
		List<StudyReview> lists_ = sdao.GetStudyReviewList(seq_study);
		List<StudyReview> lists = new ArrayList<>();
		for(StudyReview studyReview : lists_){
			studyReview.setMember(mdao.selectWriterMember(studyReview.getMid()));
			lists.add(studyReview);
		}

 		System.out.println("데이터 view 로 전달 직전 ");
 		System.out.println(lists);
		
 		this.mav.addObject("lists", lists);
 		this.mav.setViewName("studydetail3");

 		return lists;
	}
	
	@RequestMapping(value ="/deleteReview.st", method=RequestMethod.POST )  
	public ModelAndView DeleteStudyReviewList(@RequestParam("seq_review") String seq_review,
											  @RequestParam("seq_study") String seq_study) throws Exception{
		System.out.println("삭제 컨트롤러 도착 ");
		System.out.println(seq_review);
		
		int result = 0;
		if(sdao.DeleteStudyReviewList(Integer.parseInt(seq_review)) == 1 ) {
			result = 1;
		} else {
			result = 0;
		}
		this.studyGradeModify(seq_study);
		System.out.println("로직완료");
		mav.setViewName("redirect:/detailview.st?seq_study=" + seq_study);
		return mav;
	}
	
	@PostMapping("modifyReview.st")
	@ResponseBody
	public ModelAndView ModifyStudyReviewList(@RequestParam("content") String content,
											  @RequestParam("seq_review") String seq_review,
											  @RequestParam("seq_study") String seq_study,
											  HttpServletResponse response) throws Exception {
		System.out.println("수정 컨트롤러 도착 ");

		System.out.println("seq_review : " + seq_review);
		System.out.println("content : " + content);

		StudyReview studyreview = new StudyReview();

		studyreview.setSeq_review(Integer.parseInt(seq_review));
		studyreview.setContent(content);

		int result = sdao.ModifyStudyReviewList(studyreview);
		this.studyGradeModify(seq_study);
		mav.setViewName("redirect:/detailview.st?seq_study=" + seq_study);
		return mav;
	}

	private void studyGradeModify(String seq_study){
		sdao.UpdateStudyGrade(seq_study);
	}
}
