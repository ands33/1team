package kca.cbt.subtrahend;

public class SubtrahendVO {
	private int num;
	private String member_name;
	private String member_id;
	private String review;
	private String reviewer;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getReviewer() {
		return reviewer;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	@Override
	public String toString() {
		return "SubtrahendVO [num=" + num + ", member_name=" + member_name + ", member_id=" + member_id + ", review="
				+ review + ", reviewer=" + reviewer + "]";
	}

}