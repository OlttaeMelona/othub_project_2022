package cart;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {

	@Autowired
	@Qualifier("cartservice")
	CartService cartservice;
	
	CartDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/insertCart" , method = RequestMethod.POST)
	public void inserCart(CartDTO dto) {
		cartservice.insertCart(dto);
	}
	
	@RequestMapping("/goCart")
	public String goCart() {
		return "/cart/cartmain";
	}
}
