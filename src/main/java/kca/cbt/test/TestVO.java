package kca.cbt.test;

public class TestVO {
	private int num;
	private int idx;
	private int grade;
	private String behavioral;
	private String diff;
	private String name;
	private String category1;
	private String category2;
	private String category3;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String option5;
	private int answer;
	private String answerEx;
	private int corrRate;
	private String questionBack;
	private String reference;
	private String authorYear;
	private String page;
	private String e_status;
	private String createDate;
	private String aff;
	private String writtenName;
	private String examName;
	private String member_id;
	private String reviewer;
	private String review;
	private String exam_type;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getBehavioral() {
		return behavioral;
	}

	public void setBehavioral(String behavioral) {
		this.behavioral = behavioral;
	}

	public String getDiff() {
		return diff;
	}

	public void setDiff(String diff) {
		this.diff = diff;
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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getOption5() {
		return option5;
	}

	public void setOption5(String option5) {
		this.option5 = option5;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	public String getAnswerEx() {
		return answerEx;
	}

	public void setAnswerEx(String answerEx) {
		this.answerEx = answerEx;
	}

	public int getCorrRate() {
		return corrRate;
	}

	public void setCorrRate(int corrRate) {
		this.corrRate = corrRate;
	}

	public String getQuestionBack() {
		return questionBack;
	}

	public void setQuestionBack(String questionBack) {
		this.questionBack = questionBack;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getAuthorYear() {
		return authorYear;
	}

	public void setAuthorYear(String authorYear) {
		this.authorYear = authorYear;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getE_status() {
		return e_status;
	}

	public void setE_status(String e_status) {
		this.e_status = e_status;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getAff() {
		return aff;
	}

	public void setAff(String aff) {
		this.aff = aff;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getWrittenName() {
		return writtenName;
	}

	public void setWrittenName(String writtenName) {
		this.writtenName = writtenName;
	}

	public String getReviewer() {
		return reviewer;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getExam_type() {
		return exam_type;
	}

	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
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

	public String getSubQuestion() {
		if (question != null) {
			return question.replace("\n", "<br>");
		}
		return question;
	}

	public String getSubQuestionBack() {
		if (questionBack != null) {
			return questionBack.replace("\n", "<br>");
		}
		return questionBack;
	}

	public String getSubReference() {
		if (reference != null) {
			return reference.replace("\n", "<br>");
		}
		return reference;
	}

	public String getSubAuthorYear() {
		if (authorYear != null) {
			return authorYear.replace("\n", "<br>");
		}
		return authorYear;
	}

	public String getSubPage() {
		if (page != null) {
			return page.replace("\n", "<br>");
		}
		return page;
	}

	public String getSubAnswerEx() {
		if (answerEx != null) {
			return answerEx.replace("\n", "<br>");
		}
		return answerEx;
	}

	public String getSubAnswer() {
		if (answer == 1) {
			return "①";
		}

		if (answer == 2) {
			return "②";
		}

		if (answer == 3) {
			return "③";
		}

		if (answer == 4) {
			return "④";
		}

		if (answer == 5) {
			return "⑤";
		}

		else {
			return "유효하지 않은 값입니다";
		}
	}

	@Override
	public String toString() {
		return "TestVO [num=" + num + ", idx=" + idx + ", grade=" + grade + ", behavioral=" + behavioral + ", diff="
				+ diff + ", name=" + name + ", category1=" + category1 + ", category2=" + category2 + ", category3="
				+ category3 + ", question=" + question + ", option1=" + option1 + ", option2=" + option2 + ", option3="
				+ option3 + ", option4=" + option4 + ", option5=" + option5 + ", answer=" + answer + ", answerEx="
				+ answerEx + ", corrRate=" + corrRate + ", questionBack=" + questionBack + ", reference=" + reference
				+ ", authorYear=" + authorYear + ", page=" + page + ", status=" + e_status + ", createDate="
				+ createDate + ", aff=" + aff + ", examName=" + examName + "]";
	}

}
