package kca.cbt.exam_subjects;

public class Exam_subjectVO {
	
	private String member_id;
	private int subject_code;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getSubject_code() {
		return subject_code;
	}
	public void setSubject_code(int subject_code) {
		this.subject_code = subject_code;
	}
	@Override
	public String toString() {
		return "Exam_subjectVO [member_id=" + member_id + ", subject_code=" + subject_code + "]";
	}
	
	
	
}
