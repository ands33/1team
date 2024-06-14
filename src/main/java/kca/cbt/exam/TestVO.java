package kca.cbt.exam;

import java.sql.Date;
import java.util.concurrent.TimeUnit;

public class TestVO {
	private int test_num;
	private String subject;
	private String test_type;
	private String status;
	private Date requestDate;
	private Date comRequestDate;
	private int curSituation;
	private int pledge;
	private int reqLetter;

	public int getTest_num() {
		return test_num;
	}

	public void setTest_num(int test_num) {
		this.test_num = test_num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTest_type() {
		return test_type;
	}

	public void setTest_type(String test_type) {
		this.test_type = test_type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public Date getComRequestDate() {
		return comRequestDate;
	}

	public void setComRequestDate(Date comRequestDate) {
		this.comRequestDate = comRequestDate;
	}

	// Method to calculate date difference
	public long getDateDifference() {
		long diffInMillies = comRequestDate.getTime() - System.currentTimeMillis();
		return (TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS))+1;
	}

	public int getCurSituation() {
		return curSituation;
	}

	public void setCurSituation(int curSituation) {
		this.curSituation = curSituation;
	}

	public int getPledge() {
		return pledge;
	}

	public void setPledge(int pledge) {
		this.pledge = pledge;
	}

	public int getReqLetter() {
		return reqLetter;
	}

	public void setReqLetter(int reqLetter) {
		this.reqLetter = reqLetter;
	}

	@Override
	public String toString() {
		return "TestVO [test_num=" + test_num + ", subject=" + subject + ", test_type=" + test_type + ", status="
				+ status + ", requestDate=" + requestDate + ", comRequestDate=" + comRequestDate + ", curSituation="
				+ curSituation + ", pledge=" + pledge + ", reqLetter=" + reqLetter + "]";
	}

}
