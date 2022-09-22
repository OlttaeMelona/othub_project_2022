package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	
	//로그인 페이지
		@RequestMapping("/login")
		public String loginform() {
			return "member/login";
		}
	//로그인
		
	
	//회원가입폼 이동
		@GetMapping("/signin")
		public String signin() {
			return "member/singinform";
		}
		
	//회원가입
		//회원가입
		@RequestMapping(value = "/signin", method = RequestMethod.POST)
		public String insertMember(MemberDTO dto) {
			
				service.insertMember(dto);
				
				return "member/login";

		}

	}
















