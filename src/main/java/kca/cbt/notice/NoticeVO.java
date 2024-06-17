package kca.cbt.notice;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private String c_type;
	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date createdate;
	private int views;
	private String searchCondition; // 검색조건 저장 제목 또는 내용
	private String searchKeyword; // 검색어
	private MultipartFile uploadFile;
	private String filename;

	public String getC_type() {
		return c_type;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getcCeatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public int getviews() {
		return views;
	}

	public void setviews(int views) {
		this.views = views;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}


	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "NoticeVO [c_type=" + c_type + ", seq=" + seq + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", createdate=" + createdate + ", views=" + views + "]";
	}

}
