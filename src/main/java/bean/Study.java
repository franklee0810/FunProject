package bean;

public class Study {
	private int seq_study;
	private String subject;
	private String intrd;
	private String time_from;
	private String time_to;
	private int personnel;
	private int like ;
	private String image;
	private String city;
	private String borough;
	private String topic;
	private double avg_grade;
	private String mid ;

	private Member host;

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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getIntrd() {
		return intrd;
	}
	public void setIntrd(String intrd) {
		this.intrd = intrd;
	}
	public String getTime_from() {
		return time_from;
	}
	public void setTime_from(String time_from) {
		this.time_from = time_from;
	}
	public String getTime_to() {
		return time_to;
	}
	public void setTime_to(String time_to) {
		this.time_to = time_to;
	}
	public int getPersonnel() {
		return personnel;
	}
	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getBorough() {
		return borough;
	}
	public void setBorough(String borough) {
		this.borough = borough;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public double getAvg_grade() {
		return avg_grade;
	}
	public void setAvg_grade(double avg_grade) {
		this.avg_grade = avg_grade;
	}
	public Member getHost() {
		return host;
	}
	public void setHost(Member host) {
		this.host = host;
	}
}
