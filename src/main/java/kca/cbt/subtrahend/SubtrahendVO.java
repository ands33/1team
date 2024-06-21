package kca.cbt.subtrahend;

public class SubtrahendVO {
	private int num;
	private String diff;
	private String member_name;
	private String member_id;
	private int idx;
	private String e_status;
	private String name;
	private String category1;
	private String category2;
	private String category3;

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

	public String getE_status() {
		return e_status;
	}

	public void setE_status(String e_status) {
		this.e_status = e_status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	// . 앞의 숫자만 추출하여 "1-2" 형식의 문자열을 반환하는 메서드
	public String getCategoryNumbers() {
		return extractNumberBeforeDot(category1) + "-" + extractNumberBeforeDot(category2) + "-" + extractNumberBeforeDot(category3);
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

	@Override
	public String toString() {
		return "SubtrahendVO [num=" + num + ", diff=" + diff + ", member_name=" + member_name + ", member_id=" + member_id
				+ ", idx=" + idx + ", status=" + e_status + "]";
	}

}