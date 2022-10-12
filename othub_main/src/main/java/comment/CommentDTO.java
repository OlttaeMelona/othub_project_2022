package comment;

public class CommentDTO {
	
	int b_seq;
	int cm_seq;
	String cm_writer;
	String cm_contents;
	String cm_writingtime;
	

	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public int getCm_seq() {
		return cm_seq;
	}
	public void setCm_seq(int cm_seq) {
		this.cm_seq = cm_seq;
	}
	public String getCm_writer() {
		return cm_writer;
	}
	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}
	public String getCm_contents() {
		return cm_contents;
	}
	public void setCm_contents(String cm_contents) {
		this.cm_contents = cm_contents;
	}
	public String getCm_writingtime() {
		return cm_writingtime;
	}
	public void setCm_writingtime(String cm_writingtime) {
		this.cm_writingtime = cm_writingtime;
	}
	
	
}
