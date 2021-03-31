package bean;

public class Member {
	private String mid;
	private String password;
	private String nickname;
	private String name;
	private short gender;
	private short age;
	private String profile;
	private String email;

	public Member() {}

	public Member(String mid, String password, String nickname, String name, short gender, short age, String profile, String email) {
		this.mid = mid;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.profile = profile;
		this.email = email;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public short getGender() {
		return gender;
	}

	public void setGender(short gender) {
		this.gender = gender;
	}

	public short getAge() {
		return age;
	}

	public void setAge(short age) {
		this.age = age;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Member{" +
				"mid='" + mid + '\'' +
				", password='" + password + '\'' +
				", nickname='" + nickname + '\'' +
				", name='" + name + '\'' +
				", gender=" + gender +
				", age=" + age +
				", profile='" + profile + '\'' +
				", email='" + email + '\'' +
				'}';
	}
}
