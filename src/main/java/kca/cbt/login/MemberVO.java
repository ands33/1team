package kca.cbt.login;

public class MemberVO {

	private String member_id;
	private String pw;
	private String member_name;
	private String member_type;
	private int subject_code;
	private String subject_name;
	private String memberA;
	private String memberB;
	private String aff;
	

	public String getAff() {
		return aff;
	}

	public void setAff(String aff) {
		this.aff = aff;
	}

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

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	
	
	public String getMemberA() {
		return memberA;
	}

	public void setMemberA(String memberA) {
		this.memberA = memberA;
	}

	public String getMemberB() {
		return memberB;
	}

	public void setMemberB(String memberB) {
		this.memberB = memberB;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", pw=" + pw + ", member_name=" + member_name + ", member_type="
				+ member_type + ", subject_code=" + subject_code + "]";
	}

}
