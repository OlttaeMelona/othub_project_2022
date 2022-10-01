package productdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import shop.ShopDTO;

@Controller
public class ProductdetailController {

	@Autowired
	@Qualifier("productdetailservice")
	ProductdetailService service;
	
	
	@ResponseBody
	@RequestMapping(value="/productdetail", produces = {"application/json;charset=utf-8"})
	public ModelAndView productdetail(int p_id) {
		ProductdetailDTO productdetail = service.getProductdetail(p_id);
		
		//컨트롤러 - 결전달(model) 출력 - view
		ModelAndView mv = new ModelAndView();
		mv.addObject("productdetail", productdetail );
		mv.setViewName("productdetail/productdetailmain");
		
		return mv;
	}
	
	
	
}
