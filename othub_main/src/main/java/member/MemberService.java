package member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("memberservice")
public class MemberService  {
	
	@Autowired
	@Qualifier("memberdao")
	MemberDAO dao;

	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
	}

}
