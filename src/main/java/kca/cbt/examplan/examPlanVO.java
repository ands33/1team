package kca.cbt.examPlan;

public class examPlanVO {
	
	private int num;
	private String diff;
	private String member_name;
	private String member_id;
	private int idx;
	private String status;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDiff() {
		return diff;
	}
	public void setDiff(String diff) {
		this.diff = diff;
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "examPlanVO [num=" + num + ", diff=" + diff + ", member_name=" + member_name + ", member_id=" + member_id
				+ ", idx=" + idx + ", status=" + status + "]";
	}
}
