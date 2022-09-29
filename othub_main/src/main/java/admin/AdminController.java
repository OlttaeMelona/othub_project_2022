package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("adminservice")
	AdminServiceImpl adminservice;
	
	//관리자 로그인화면
	@RequestMapping("/admin_login")
	public String adminLoginPage() {
		return "admin/adminlogin";
	}
	//관리자 페이지
	@RequestMapping("/adminpage")
	public String adminPage() {
		return "admin/adminpage";
	} 
	
	//관리자 로그인
	@PostMapping("/adminloginprocess")
	public ModelAndView adminLogin(AdminDTO dto, HttpSession session, HttpServletRequest request) throws Exception{
		AdminDTO resultdto = adminservice.adminLogin(dto);
		ModelAndView mv = new ModelAndView();
		
		if(resultdto != null) { // 로그인 성공
			session.setAttribute("a_id", resultdto.getA_id());
			session.setAttribute("a_name", resultdto.getA_name());
			System.out.println("세션정보 = "+session);
			System.out.println(resultdto);
			mv.setViewName("main/index");
		}
		else { //로그인 실패
			mv.setViewName("admin/adminlogin");
			mv.addObject("message", "error");
		}
		return mv;
	}
	
	//관리자 로그아웃
	@RequestMapping("/adminlogout")
	public String adminLogout(HttpSession session,HttpServletRequest request) throws Exception{
		session.invalidate();
		System.out.println("정상적으로 로그아웃 되었습니다");
		return "main/index";
	}
	
}
