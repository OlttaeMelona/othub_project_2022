package member;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {

	String m_id; 
	String m_pw;
	String m_name;
	String m_address; 
	String m_phone; 
	String m_email; 
	String m_sex;
	String m_regdate;
	
	public MemberDTO(){ }
	
	public MemberDTO(String m_id, String m_pw, String m_name,String m_address, String m_phone, String m_email, String m_sex ,String m_regdate) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_address = m_address;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_sex = m_sex;
		this.m_regdate = m_regdate;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	
	
	
}
