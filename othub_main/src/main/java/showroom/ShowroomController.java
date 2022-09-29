package showroom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowroomController {
	
	//전체 게시물 조회
	@RequestMapping("/showroom")
	public String main() {
		return "showroom/sr_main";
	}
}
