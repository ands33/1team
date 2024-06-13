package kca.cbt.FAQ;

import java.sql.Date;

public class FAQVO {
	private String Q;
    private int SEQ_NUMBER;
    private String FILE_DATA;
    private String TITLE;
    private Date CREATE_DAY;
    private String MEMBER_ID;
    private String ANSWER_ID;
    private String CONTENT_ID;
    private String VIEWS;
    
	public String getQ() {
		return Q;
	}

	public void setQ(String q) {
		Q = q;
	}

	public int getSEQ_NUMBER() {
		return SEQ_NUMBER;
	}

	public void setSEQ_NUMBER(int sEQ_NUMBER) {
		SEQ_NUMBER = sEQ_NUMBER;
	}

	public String getFILE_DATA() {
		return FILE_DATA;
	}

	public void setFILE_DATA(String fILE_DATA) {
		FILE_DATA = fILE_DATA;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public Date getCREATE_DAY() {
		return CREATE_DAY;
	}

	public void setCREATE_DAY(Date date) {
		CREATE_DAY = date;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getANSWER_ID() {
		return ANSWER_ID;
	}


	public void setANSWER_ID(String aNSWER_ID) {
		ANSWER_ID = aNSWER_ID;
	}



	public String getCONTENT_ID() {
		return CONTENT_ID;
	}



	public void setCONTENT_ID(String cONTENT_ID) {
		CONTENT_ID = cONTENT_ID;
	}



	public String getVIEWS() {
		return VIEWS;
	}



	public void setVIEWS(String vIEWS) {
		VIEWS = vIEWS;
	}



	@Override
	public String toString() {
		return "FAQVO [Q=" + Q + ", SEQ_NUMBER=" + SEQ_NUMBER + ", FILE_DATA=" + FILE_DATA + ", TITLE=" + TITLE
				+ ", CREATE_DAY=" + CREATE_DAY + ", MEMBER_ID=" + MEMBER_ID + ", ANSWER_ID=" + ANSWER_ID
				+ ", CONTENT_ID=" + CONTENT_ID + ", VIEWS=" + VIEWS + "]";
	}

	public Object getFAQList() {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateFAQ(FAQVO vo) {
		// TODO Auto-generated method stub
		
	}
}
