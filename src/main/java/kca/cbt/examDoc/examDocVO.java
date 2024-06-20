package kca.cbt.examDoc;

public class examDocVO {
	private int num;
	private String diff;
	private String memeber_name;
	private int idx;
	private String status;
	private String category1;
	private String category2;
	private String category3;
	private String member_type;

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

	public String getMemeber_name() {
		return memeber_name;
	}

	public void setMemeber_name(String memeber_name) {
		this.memeber_name = memeber_name;
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

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getCategory3() {
		return category3;
	}

	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	
	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	@Override
	public String toString() {
		return "examDocVO [num=" + num + ", diff=" + diff + ", memeber_name=" + memeber_name + ", idx=" + idx
				+ ", status=" + status + ", category1=" + category1 + ", category2=" + category2 + ", category3="
				+ category3 + ", member_type=" + member_type + "]";
	}

	// . 앞의 숫자만 추출하여 "1-2" 형식의 문자열을 반환하는 메서드
	public String getCategoryNumbers() {
		return extractNumberBeforeDot(category1) + "-" + extractNumberBeforeDot(category2) + "-"
				+ extractNumberBeforeDot(category3);
	}

	// 문자열에서 . 앞의 숫자만 추출하는 헬퍼 메서드
	private String extractNumberBeforeDot(String str) {
		if (str != null && str.contains(".")) {
			String[] parts = str.split("\\.");
			if (parts.length > 0) {
				return parts[0].replaceAll("[^0-9]", ""); // . 앞의 숫자 부분만 반환
			}
		}
		return ""; // .가 없는 경우 빈 문자열 반환
	}
}
