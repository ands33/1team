package kca.cbt.notice;

import java.sql.Date;

public class NoticeVO {
	private String c_type;
	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date createdate;
	private int views;
	
	
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
	public Date getcreatedate() {
		return createdate;
	}
	public void setcreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public int getviews() {
		return views;
	}
	public void setviews(int views) {
		this.views = views;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [c_type=" + c_type + ", seq=" + seq + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", createdate=" + createdate + ", views=" + views + "]";
	}
	
	
	
}














