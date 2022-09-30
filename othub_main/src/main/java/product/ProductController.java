package product;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Inject
	ProductService productService;
	
	
	 private static final Logger logger =
	  LoggerFactory.getLogger(ProductController.class);
	  
	
	 //전체
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getList(@RequestParam("c") int category_id, Model model) throws Exception {
	  logger.info("get llist");
	  
	  List<ProductDTO> list = null;
		list = productService.list(category_id);
	 
	  model.addAttribute("list", list);
	 }
	 
	 
	 //좋아요순
	 @RequestMapping(value = "/listlike", method = RequestMethod.GET)
	 public void getListLike(@RequestParam("c") int category_id, Model model) throws Exception {
	  logger.info("get llike");
	  
	  List<ProductDTO> like = null;
		like = productService.orderByLike(category_id);
	 
	  model.addAttribute("like", like);
	 }
	 
	 //최신순
		 @RequestMapping(value = "/listrecent", method = RequestMethod.GET)
		 public void getListRecent(@RequestParam("c") int category_id, Model model) throws Exception {
		  logger.info("get lrecent");
		  
		  List<ProductDTO> recent = null;
		  recent = productService.orderByRecent(category_id);
		 
		  model.addAttribute("recent", recent);
		 }
	 
	 
	 
	}
	
		
		


