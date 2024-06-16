package kca.cbt.login;

public class loginMemberVO {
	
	private String member_id;
	private String pw;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	@Override
	public String toString() {
		return "loginMemberVO [member_id=" + member_id + ", pw=" + pw + "]";
	}
}
