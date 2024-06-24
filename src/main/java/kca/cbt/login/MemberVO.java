package kca.cbt.login;

public class MemberVO {
	
	private String member_id;
	private String pw;
	private String member_name;
	private String member_type;
	private int subject_code;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPw() {
		return pw;
	}
	public int getSubject_code() {
		return subject_code;
	}
	public void setSubject_code(int subject_code) {
		this.subject_code = subject_code;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", pw=" + pw + ", member_name=" + member_name + ", member_type="
				+ member_type + ", subject_code=" + subject_code + "]";
	}
	
	
	
}
