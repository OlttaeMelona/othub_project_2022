package cs;

import java.util.Date;

public class CSDTO {
	
	//product table colums
		private int cs_seq;
		private String cs_writer;
		private String cs_pw;
		private String cs_title;
		private String cs_question;
		private String cs_answere;
		private Date cs_regdate;
		
		public CSDTO() {
			
		}



//매개변수 있는 생성자
	public CSDTO(int cs_seq, String cs_writer, String cs_pw, String cs_title,
			 String cs_question, String cs_answere, Date cs_regdate) {
		
		this.cs_seq = cs_seq;
		this.cs_writer = cs_writer;
		this.cs_pw = cs_pw;
		this.cs_title = cs_title;
		this.cs_question = cs_question;
		this.cs_answere = cs_answere;
		this.cs_regdate = cs_regdate;
		
	}



	public int getCs_seq() {
		return cs_seq;
	}



	public void setCs_seq(int cs_seq) {
		this.cs_seq = cs_seq;
	}



	public String getCs_writer() {
		return cs_writer;
	}



	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}



	public String getCs_pw() {
		return cs_pw;
	}



	public void setCs_pw(String cs_pw) {
		this.cs_pw = cs_pw;
	}



	public String getCs_title() {
		return cs_title;
	}



	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}



	public String getCs_question() {
		return cs_question;
	}



	public void setCs_question(String cs_question) {
		this.cs_question = cs_question;
	}



	public String getCs_answere() {
		return cs_answere;
	}



	public void setCs_answere(String cs_answere) {
		this.cs_answere = cs_answere;
	}



	public Date getCs_regdate() {
		return cs_regdate;
	}



	public void setCs_regdate(Date cs_regdate) {
		this.cs_regdate = cs_regdate;
	}



	@Override
	public String toString() {
		return "CSDTO [cs_seq=" + cs_seq + ", cs_writer=" + cs_writer + ", cs_pw=" + cs_pw + ", cs_title=" + cs_title
				+ ", cs_question=" + cs_question + ", cs_answere=" + cs_answere + ", cs_regdate=" + cs_regdate + "]";
	}
	
	
	
}
