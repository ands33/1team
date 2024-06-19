package kca.cbt.question_card;

public class CardVO {
	private int subject_code;
	private String subject_name;
	private String qualification_code;
	
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
	public String getQualification_code() {
		return qualification_code;
	}
	public void setQualification_code(String qualification_code) {
		this.qualification_code = qualification_code;
	}
	
	@Override
	public String toString() {
		return "CardVO [subject_code=" + subject_code + ", subject_name=" + subject_name + ", qualification_code="
				+ qualification_code + "]";
	}
	
	
	
}
