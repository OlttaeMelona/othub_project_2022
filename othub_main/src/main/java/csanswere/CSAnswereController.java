package csanswere;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CSAnswereController {
	
	@Inject
	private CSAnswereService service;
	
	// 답변 작성
	@RequestMapping(value = "/answere", method = RequestMethod.POST)
	public String posttWirte(CSAnswereDTO dto) throws Exception {
	    
	    service.answerewrite(dto);
	    
	    return "redirect:/csview?cs_seq=" + dto.getCs_seq();
	}
	

}
