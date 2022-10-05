package cart;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

	@Autowired
	@Qualifier("cartservice")
	CartService cartservice;
	
	@Autowired
	@Qualifier("productdetailservice")
	productdetail.ProductdetailService productdetailservice;
	
	
	CartDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/insertCart" , method = RequestMethod.POST)
	public void inserCart(CartDTO dto) {
		cartservice.insertCart(dto);
	}
	
	@ResponseBody
	@RequestMapping("/goCart")
	public ModelAndView goCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<CartDTO> cart_list = cartservice.getCart(m_id);
		//productdetail.ProductdetailDTO productdetail = productdetailservice.getProductdetail(m_id);
		ModelAndView mv = new ModelAndView();
		//mv.addObject("productdetail", productdetail);
		mv.addObject("cart_list", cart_list);
		mv.setViewName("/cart/cartmain");
		return mv;
	}
}
