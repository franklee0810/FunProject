package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("psdao")
public class PostStudyDao {
	private final String namespace = "MapperPostStudy.";
	
	@Autowired
	SqlSessionTemplate abcd;

	public List<PostStudy> SelectList(int seq_study) {
		System.out.println(getClass() + " SelectList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_study", seq_study);
		return this.abcd.selectList(namespace+"SelectList", map);
	}

	public List<PostStudy> selectPostList(int seq_study, String hostMid) {
		System.out.println(getClass() + " selectPostList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_study", seq_study);
		map.put("mid", hostMid);
		return this.abcd.selectList(namespace+"selectPostList", map);
	}

	public List<StudyFile> selectPostFileList(int seq_post) {
		System.out.println(getClass() + " selectPostFileList");
		return this.abcd.selectList(namespace+"selectPostFileList", seq_post);
	}

	public int InsertData(String content, String mid, int seq_study) {
		System.out.println(getClass() + " InsertData");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("seq_study", seq_study);
		map.put("content", content);
		return this.abcd.insert(namespace + "InsertData", map);
	}

	public int InsertFile( String  file1,int seq_post,String type, String saveFileName,int size) {
		System.out.println(getClass() + " InsertFile");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file1", file1);
		map.put("seq_post", seq_post);
		map.put("type", type);
		map.put("location", saveFileName);
		map.put("size", size);
		return this.abcd.insert(namespace + "InsertFile", map);
	}

	public List<PostStudy> SelectHostList(int seq_study, String hostMid) {
		System.out.println(getClass() + " SelectHostList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_study", seq_study);
		map.put("mid", hostMid);
		return this.abcd.selectList(namespace+"SelectHostList",map);
	}

	public int DeletePost(int seq_post) {
		System.out.println(getClass() + " DeletePost");
		return this.abcd.delete(namespace+"DeletePost",seq_post);
	}

	public int UpdateContent(PostStudy post) {
		System.out.println(getClass() + " UpdateContent");
		return this.abcd.update(namespace + "UpdateContent", post);
	}

	public List<ShareFile> SelectFileList(int seq_study) {
		System.out.println(getClass() + " SelectFileList");
		return this.abcd.selectList(namespace+"SelectFileList",seq_study);
	}

	public int DeleteFile( int seq_post) {
		System.out.println(getClass() + " DeleteFile");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_post", seq_post);
		return this.abcd.delete(namespace+"DeleteFile",map);
	}

	public List<ShareFile> SelectFileListForDownLoad(int seq_file) {
		System.out.println(getClass() + " SelectFileListForDownLoad");
		return this.abcd.selectList(namespace+"SelectFileListForDownLoad",seq_file);
	}

    public Member selectPostWriter(int seq_study, int seq_post) {
		System.out.println(getClass() + " selectPostWriter");
		Map<String, Integer> map = new HashMap<>();
		map.put("seq_study", seq_study);
		map.put("seq_post", seq_post);
		return this.abcd.selectOne(namespace+"selectPostWriter", map);
    }

	public void insertFile(StudyFile studyFile) {
		System.out.println(getClass() + " insertFile");
		this.abcd.insert(namespace+"insertFile", studyFile);
	}

	public List<PostStudy> selectHostPostList(int seq_study, String hostMid) {
		System.out.println(getClass() + " selectHostPostList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_study", seq_study);
		map.put("mid", hostMid);
		return this.abcd.selectList(namespace+"selectHostPostList", map);
	}
}
