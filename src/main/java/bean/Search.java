package bean;

public class Search {

	private String keyword;
	private String city;
	private String borough;
	private String topic;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", city=" + city + ", borough=" + borough + ", topic=" + topic + "]";
	}
	
	 
	
}
