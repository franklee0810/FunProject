package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Search;
import bean.StudyReview;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.MyStudy;
import bean.Study;

@Component("sdao")
public class StudyDao {
	//studt랑 mystudy 관련이 묶여있음 
	private final String namespace = "MapperStudy.";
	
	@Autowired
	SqlSessionTemplate abcd;

	public List<Study> SelectList() {
		System.out.println("스터디 다오 목록 불러오기 입니다.");
		List<String> lists = new ArrayList<String>();
		return this.abcd.selectList(namespace+"SelectList",lists);
	}

	public int InsertData(String mid, int seq_study, String nickname,int level1) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("seq_study", seq_study);
		map.put("nickname", nickname);
		map.put("level1", level1);
		
		return this.abcd.insert(namespace + "InsertData", map);
	}

	public List<Study> SelectMyList(String mid) {
		return this.abcd.selectList(namespace+"SelectMyList",mid);
	}

	public Study UpdatePersonnel(int seq_study) {
		System.out.println(getClass() + " UpdatePersonnel");
		return this.abcd.selectOne(namespace + "UpdatePersonnel", seq_study);
	}

	public List<MyStudy> SelectListByNum(int seq_study,String mid) {
		System.out.println(getClass() + " SelectListByNum");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("seq_study", seq_study);
		System.out.println(map);
		return this.abcd.selectList(namespace+"SelectListByNum", map);
	}

	public List<MyStudy> SelectLevel(String mid,int seq_study) {
		System.out.println(getClass() + " SelectLevel");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("seq_study", seq_study);
		return this.abcd.selectList(namespace+"SelectLevel",map);
	}

	public int UpdateLevel(String askmid, int seq_study) {
		System.out.println(getClass() + " UpdateLevel");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mid", askmid);
		map.put("seq_study", seq_study);
		return this.abcd.update(namespace+"UpdateLevel",map);
	}

	public int DeleteStudy(int seq_study) {
		System.out.println(getClass() + " DeleteStudy");
		return this.abcd.delete(namespace+"DeleteStudy",seq_study);
	}

	public List<Study> getStudyList() {
		System.out.println(getClass() + " getStudyList");
		return this.abcd.selectList(namespace + "GetStudyList");
	}

	public int InsertStudy(Study study) {
		System.out.println(getClass() + " InsertStudy");
		return this.abcd.insert(namespace + "InsertStudy", study);
	}

	public Study GetStudyListByPk(int seq_study) {
		System.out.println(getClass() + " GetStudyListByPk");
		return this.abcd.selectOne(namespace + "GetStudyListByPk", seq_study);
	}

	// studyReview
	public void InsertStudyReview(StudyReview studyReview) {
		System.out.println(getClass() + " InsertStudyReview");
		abcd.insert(namespace+ "InsertStudyReview", studyReview);
	}

	public List<StudyReview> GetStudyReviewList(int seq_study) throws Exception{
		System.out.println(getClass() + " GetStudyReviewList");
		return abcd.selectList(namespace + "GetStudyReviewList", seq_study);
	}

	public int DeleteStudyReviewList(int seq_review) {
		System.out.println(getClass() + " DeleteStudyReviewList");
		return abcd.delete(namespace + "DeleteStudyReviewList", seq_review);
	}

	public int ModifyStudyReviewList(StudyReview studyreview) {
		System.out.println(getClass() + " ModifyStudyReviewList");
		return abcd.update(namespace + "ModifyStudyReviewList", studyreview);
	}

	public List<Study> SearchStudyList(String keyword) {
		System.out.println(getClass() + " SearchStudyList");
		return abcd.selectList(namespace + "SearchStudyList", keyword);
	}

	public List<Study> SearchStudyListByArea(Map map) {
		System.out.println(getClass() + " SearchStudyListByArea");
		return abcd.selectList(namespace + "SearchStudyListByArea", map);
	}

	public List<Study> GetStudyListByAvg_grade() {
		System.out.println(getClass() + " GetStudyListByAvg_grade");
		return abcd.selectList(namespace + "GetStudyListByAvg_grade");
	}

    public int selectStudyImage(String image) {
		System.out.println(getClass() + " selectStudyImage");
		return abcd.selectOne(namespace + "selectStudyImage", image);
    }

    public List<Study> selectSBSCRStudy(String mid) {
		System.out.println(getClass() + " selectSBSCRStudy");
		return abcd.selectList(namespace + "selectSBSCRStudy", mid);
    }

	public void UpdateStudyGrade(String seq_study) {
		System.out.println(getClass() + " UpdateStudyGrade");
		abcd.update(namespace + "UpdateStudyGrade", seq_study);
	}

    public Study SelectStudyOne(int seq_study) {
		System.out.println(getClass() + " SelectStudyOne");
		return abcd.selectOne(namespace + "SelectStudyOne", seq_study);
    }

	public List<MyStudy> SelectPostAlramMember(String mid, String seq_study) {
		System.out.println(getClass() + " selectHostPostList");
		Map<String, String> map = new HashMap<>();
		map.put("mid", mid);
		map.put("seq_study", seq_study);
		return this.abcd.selectList(namespace + "SelectPostAlramMember", map);
	}
}
