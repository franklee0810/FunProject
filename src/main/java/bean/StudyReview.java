package bean;

import java.util.Date;

public class StudyReview {
	private int seq_review;
	private int seq_study;
	private String mid;
	private int grade;
	private String content;
	private String inputdate;

	private Member Member;

	public int getSeq_review() {
		return seq_review;
	}
	public void setSeq_review(int seq_review) {
		this.seq_review = seq_review;
	}
	public int getSeq_study() {
		return seq_study;
	}
	public void setSeq_study(int seq_study) {
		this.seq_study = seq_study;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
	public bean.Member getMember() {
		return Member;
	}
	public void setMember(bean.Member member) {
		Member = member;
	}

	@Override
	public String toString() {
		return "StudyReview{" +
				"seq_review=" + seq_review +
				", seq_study=" + seq_study +
				", mid='" + mid + '\'' +
				", grade=" + grade +
				", content='" + content + '\'' +
				", inputdate='" + inputdate + '\'' +
				", Member=" + Member +
				'}';
	}
}

