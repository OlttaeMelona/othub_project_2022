package order;

import java.io.Console;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
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
	public void insertOrder(OrderDTO dto) {
		//OrderDTO dto;
		String m_id = dto.m_id;
		int amount = dto.amount;
		System.out.println(m_id);
		System.out.println(amount);
		service.insertOrder(dto);
		//return "1";
		//return 1;
	}
	
	
	
	@RequestMapping(value = "/ordermain2")
	public ModelAndView start(HttpServletRequest request) {
		ModelAndView  mv = new ModelAndView();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int o_id = service.getOrderid();
		int p_id = service.getProductid(o_id);
		OrderDTO productdetail = service.getProductdetail(p_id);
		OrderDTO ordersdetail = service.getOrders(o_id);
		OrderDTO memberdetail = service.getMember(m_id);
		mv.setViewName("order/ordermain");
		mv.addObject("order_id", o_id);
		mv.addObject("product_id", p_id);
		mv.addObject("productdetail", productdetail);
		mv.addObject("ordersdetail", ordersdetail);
		mv.addObject("memberdetail", memberdetail);
		return mv;
	}
	@RequestMapping("/doOrder")
	public String doOrder(int order_id) {
		service.doOrder(order_id);
		return "main/index";
	}
	
	@RequestMapping("/cancleOrder")
	public String cancleOrder(int order_id) {
		service.cancleOrder(order_id);
		return "main/index";
	}
	
	
}
