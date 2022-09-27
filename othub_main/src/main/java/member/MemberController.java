package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		@PostMapping("/loginprocess")
		public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session, HttpServletRequest request) {
			String name = service.insertCheck(dto);
			ModelAndView mv = new ModelAndView();
			session = request.getSession();
			
			if (name != null) { // 로그인 성공 시
				session.setAttribute("m_id", dto.getM_id());
				mv.setViewName("member/main");
			} else { // 로그인 실패 시
				mv.setViewName("member/login");
				mv.addObject("message", "error");
			}
			return mv;
		}
		
	//로그아웃
		@RequestMapping("/logout")
		public String logout(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.invalidate();
			return "main/index";
		}
		
	 
	//회원가입폼 이동
		@GetMapping("/signin")
		public String signin() {
			return "member/singinform";
		}
		

		
	//회원가입
	      @RequestMapping(value = "/signin", method = RequestMethod.POST)
	      public String insertMember(MemberDTO dto) {
	            service.insertMember(dto);
	            return "main/index";
	      }
		
	//마이페이지 접속
		@RequestMapping("/mypage")
		public String mypage() {
			return "member/mypage";
		}
		
	//회원정보수정 폼
		@RequestMapping("/updateform")
		public ModelAndView updateMember(String m_id, HttpServletRequest request) {
			HttpSession session = request.getSession();
			m_id = (String)session.getAttribute("m_id");
			MemberDTO dto = service.selectOneMember(m_id);
			System.out.println(dto.getM_id()+"현재아이디");
			ModelAndView mv = new ModelAndView();
			mv.addObject("memberdto",dto);
			mv.setViewName("member/updateform");
			return mv;
		}
	// 회원정보수정
		@PostMapping("/updatemember")
		public String updateBoard(MemberDTO dto) {
			service.updateMember(dto);
			return "member/mypage";
		}
		
	//아이디중복확인 - 하.. 안댐
		@RequestMapping("/idCheck")
		@ResponseBody
		public int idCheck(@RequestParam("m_id") String m_id) {
			int cnt = service.checkId(m_id);
			return cnt;
		}
	
	//회원탈퇴
		@RequestMapping("/deletemember")
		public String deleteprocess(String m_id, HttpServletRequest request) {
			HttpSession session = request.getSession();
			m_id = (String) session.getAttribute("m_id");
			service.deleteMember(m_id);
			session.invalidate();
			return "main/index";
		}
		
}














