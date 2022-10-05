package order;

import java.io.Console;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import productdetail.ProductdetailDTO;

@Controller
public class OrderController {
	@Autowired
	@Qualifier("orderservice")
	OrderService service;
	
	OrderDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/ordermain" , method = RequestMethod.POST)
	public int insertOrder(OrderDTO dto) {
		service.insertOrder(dto);
		//int order_id = dao.getOrderid();
		//return order_id;
		return 1;
	}
	
	@RequestMapping(value = "/ordermain2")
	public ModelAndView start() {
		OrderDTO productdetail = service.getProductdetail(2);
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("order/ordermain");
		mv.addObject("productdetail", productdetail);
		return mv;
	}
	
	
	
}
