package member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberdao")
public interface MemberDAO {
	
	
	//회원가입
	public void insertMember(MemberDTO dto) ;
	
	//로그인체크
	public String insertCheck(MemberDTO dto) ;
	
	//회원정보조회
	public MemberDTO selectOneMember(String m_id);
	
	//회원정보수정
	public void updateMember(MemberDTO dto);
	
	//아이디체크
	public int checkId(String m_id);

	//회원탈퇴
	public void deleteMember(String m_id);
	
	//회원 리스트 조회(가입일자 순)
	public List<MemberDTO> selectMemberList();
	
	//회원 리스트 조회(아이디 순)
	public List<MemberDTO> selectMemberListId();
	
	//회원 리스트 조회(이름 순)
	public List<MemberDTO> selectMemberListName();
}





