package bean;

import java.util.List;

public class PostStudy {
	private int seq_post;
	private String mid;
	private int seq_study;
	private String content;
	private String inputdate;
	private String nickname;

	private String file;

	private Member writer;
	private List<StudyFile> fileList;

	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getSeq_post() {
		return seq_post;
	}
	public void setSeq_post(int seq_post) {
		this.seq_post = seq_post;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getSeq_study() {
		return seq_study;
	}
	public void setSeq_study(int seq_study) {
		this.seq_study = seq_study;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public List<StudyFile> getFileList() {
		return fileList;
	}
	public void setFileList(List<StudyFile> fileList) {
		this.fileList = fileList;
	}
}
