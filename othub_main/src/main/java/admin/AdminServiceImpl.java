package admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("adminservice")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	@Qualifier("admindao")
	AdminDAO dao;
	
	//관리자 로그인
	@Override
	public AdminDTO adminLogin(AdminDTO dto) throws Exception {
		return dao.adminLogin(dto);
	}
	//관리자 정보조회
	@Override
	public AdminDTO adminInfo(AdminDTO dto) throws Exception{
		return dao.adminInfo(dto);
	}
	//관리자 정보수정
	@Override
	public AdminDTO updateAdmin(AdminDTO dto) throws Exception{
		return dao.updateAdmin(dto);
	}
	//관리자 계정삭제
	@Override
	public void deleteAdmin(String a_id) throws Exception{
		dao.deleteAdmin(a_id);
	}

}
