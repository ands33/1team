package kca.cbt.qna;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
	private String q;
	private int seq_number;
	private String title;
	private String atitle;
	private String a_content;
	private MultipartFile a_file;
	private MultipartFile file_data;
	private String member_id;	
	private Date create_day;
	private String answer_id;
	private int views;
	
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public MultipartFile getFile_data() {
		return file_data;
	}
	public void setFile_data(MultipartFile file_data) {
		this.file_data = file_data;
	}
	
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public int getSeq_number() {
		return seq_number;
	}
	public void setSeq_number(int seq_number) {
		this.seq_number = seq_number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public MultipartFile getA_file() {
		return a_file;
	}
	public void setA_file(MultipartFile a_file) {
		this.a_file = a_file;
	}
	public Date getCreate_day() {
		return create_day;
	}
	public void setCreate_day(Date create_day) {
		this.create_day = create_day;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(String answer_id) {
		this.answer_id = answer_id;
	}
	@Override
	public String toString() {
		return "QnaVO [q=" + q + ", seq_number=" + seq_number + ", title=" + title + ", atitle=" + atitle
				+ ", a_content=" + a_content + ", a_file=" + a_file + ", file_data=" + file_data + ", member_id="
				+ member_id + ", create_day=" + create_day + ", answer_id=" + answer_id + ", views=" + views + "]";
	}
	
	
	
	
	
	

}
