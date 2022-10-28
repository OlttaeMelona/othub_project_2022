package pose;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.othub.NaverInform;



@Controller
public class PoseController {
	@Autowired
	@Qualifier("poseservice")
	PoseService service;
	
	
	@RequestMapping("/poseresult")
	public ModelAndView poseresult(String image) {
		String jsonresult = service.test(image);
		ModelAndView mv = new ModelAndView();
		mv.addObject("poseresult", jsonresult);
		mv.setViewName("pose/poseresult");

		return mv;
	}
}












