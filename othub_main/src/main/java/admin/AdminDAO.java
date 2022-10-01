package admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import member.MemberDTO;

@Mapper
@Repository("admindao")
public interface AdminDAO {
	//관리자 로그인
	public AdminDTO adminLogin(AdminDTO dto) throws Exception;
	
	//관리자 정보 조회
	public AdminDTO adminInfo(AdminDTO dto) throws Exception;
	
	//관리자 정보 수정
	public AdminDTO updateAdmin(AdminDTO dto) throws Exception;
	
	//관리자 탈퇴
	public void deleteAdmin(String a_id) throws Exception;
	
	//회원 리스트 조회
	public List<MemberDTO> selectMemberList() throws Exception;

}
