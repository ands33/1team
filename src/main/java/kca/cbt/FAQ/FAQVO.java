package kca.cbt.FAQ;

import java.util.Date;

public class FAQVO {
    private int seqNumber;
    private String question;
    private byte[] fileData;
    private String author;
    private Date createDate;
    private int views;
    private String faqId;
    private String answerId;
    private String content;
	public int getSeqNumber() {
		return seqNumber;
	}
	public void setSeqNumber(int seqNumber) {
		this.seqNumber = seqNumber;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getFaqId() {
		return faqId;
	}
	public void setFaqId(String faqId) {
		this.faqId = faqId;
	}
	public String getAnswerId() {
		return answerId;
	}
	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

    // 생성자, Getter, Setter 메서드는 생략하였습니다.
    // 필요에 따라 추가하여 사용하세요.
}
