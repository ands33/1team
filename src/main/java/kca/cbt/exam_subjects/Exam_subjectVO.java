package kca.cbt.exam_subjects;

public class Exam_subjectVO {
	
	private int subject_code;
	private  String subject_name;
	private String member_id;
	
	public int getSubject_code() {
		return subject_code;
	}
	public void setSubject_code(int subject_code) {
		this.subject_code = subject_code;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "Exam_subjectVO [subject_code=" + subject_code + ", subject_name=" + subject_name + ", member_id="
				+ member_id + "]";
	}
	
	
}
