package partner;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.othub.NaverInform;


@Controller
public class PartnerController {
	@Autowired
	@Qualifier("ocrservice")
	OCRService ocrservice;
	
	@Autowired
	@Qualifier("partnerservice")
	PartnerService pt_service;
	
	//입점신청서 페이지
	@RequestMapping("/partner")
	public String partnerPage(){
		return "partner/entryapplicationform";
	}
	
	//ocr페이지 호출
	@ResponseBody
	@RequestMapping("/ocr")
	public ModelAndView ocrPage(@RequestParam("ocr_img") MultipartFile file, OCRDTO ocrdto)throws Exception{
		 ModelAndView mv = new ModelAndView();
		//저장경로
		String savePath =NaverInform.OCR_path;
		//파일업로드 
		String result = "";
		MultipartFile mf1 = ocrdto.getOcr_img();
		if(!mf1.isEmpty()) {
			String originalname1 = mf1.getOriginalFilename(); 
			String beforeext1 = originalname1.substring(0, originalname1.indexOf(".")); //a
			String ext1 = originalname1.substring(originalname1.indexOf(".")); // .txt
			String newname1 = beforeext1+"("+UUID.randomUUID().toString()+")"+ext1;
			File servefile1 = new File(savePath+newname1); 
			System.out.println(savePath+newname1);
			mf1.transferTo(servefile1);
			ocrdto.setOcr_imgname(newname1);
			
			result = ocrservice.test(newname1);
			mv.addObject("result", result);
			mv.addObject("ocrpath", savePath);
			mv.setViewName("partner/entryapplicationform");
		}
		
		pt_service.insertTestOCRImg(ocrdto);
		OCRDTO ocrimg = pt_service.getTestOCRImg(ocrdto);
		mv.addObject("ocrimg", ocrimg);
		return mv;
	}
	
	
	//입점 신청 process
	@PostMapping("/partnerRegist")
	public String partnerRegist(@ModelAttribute("dto") PartnerDTO dto, Model model) throws Exception{
		//저장경로
		String savePath =NaverInform.OCR_path;
		//파일업로드
		String result = "";
		MultipartFile mf1 = dto.getPt_companyRegistNumImg();
		if(!mf1.isEmpty()) {
			String originalname1 = mf1.getOriginalFilename(); 
			String beforeext1 = originalname1.substring(0, originalname1.indexOf(".")); //a
			String ext1 = originalname1.substring(originalname1.indexOf(".")); // .txt
			String newname1 = beforeext1+"("+UUID.randomUUID().toString()+")"+ext1;
			File servefile1 = new File(savePath+newname1); 
			System.out.println(savePath+newname1);
			mf1.transferTo(servefile1);
			dto.setPt_Imgname1(newname1);
			result = ocrservice.test(newname1);
			model.addAttribute("result", result);
		}
		//mysql insert
		pt_service.insertPartner(dto);
		return "partner/entryapplicationform";
	}
	
	//관리자 입점신청 조회
	@RequestMapping("/partnerlist")
	public String partnerList(Model model) throws Exception{
		List<PartnerDTO> ptlist = pt_service.partnerList();
		model.addAttribute("ptlist", ptlist);
		return "partner/adminptlist2";
	}
	
	
}
