package showroom;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ShowroomController {
	//sr_service
	@Autowired
	@Qualifier("showroomservice")
	ShowroomServiceImpl sr_service;
	
	
	//쇼룸 메인페이지
	@RequestMapping("/showroom")
	public String main() {
		return "showroom/sr_main";
	}
	
	//글쓰기 폼
	@RequestMapping("/sr_writing")
	public String srWriting(Model model) throws Exception{
		int totalpost = sr_service.TotalCountShowroom()+1;
		model.addAttribute("totalpost", totalpost);
		return "showroom/sr_writingform";
	}
	
	//
	
	//게시글 등록(파일업로드)
	@PostMapping("/uploadpost")
	public String writingprocsee(@ModelAttribute("dto") ShowroomDTO dto) throws Exception{
		
		//저장경로-각자 pc에 맞는 경로로 변경
		String savePath ="C:\\ai_platfrom\\workspace_boot\\othub_space\\src\\main\\resources\\static\\images\\showroom\\user_img\\";
		//파일업로드
		MultipartFile[] mf = {dto.getSr_image1(),dto.getSr_image2(),dto.getSr_image3(),dto.getSr_image4(),dto.getSr_image5()};
		String[] originalnames = new String[5];
		String[] beforeexts = new String[5];
		String[] exts = new String[5];
		String[] newnames = new String[5]; 
		File[] servefiles = new File[5];
		for(int i = 0; i < mf.length; i++) {
			if(!mf[i].isEmpty()) {
				originalnames[i] = mf[i].getOriginalFilename(); //.jpg
				beforeexts[i] = originalnames[i].substring(0, originalnames[i].indexOf(".")); 
				exts[i] = originalnames[i].substring(originalnames[i].indexOf(".")); //.jpg
				newnames[i] = beforeexts[i]+"("+UUID.randomUUID().toString()+")"+exts[i];
				servefiles[i] = new File(savePath+newnames[i]);
				System.out.println(savePath+newnames[i]);
				mf[i].transferTo(servefiles[i]);
				dto.setImgNamePath(newnames[0], newnames[1], newnames[2], newnames[3], newnames[4]);
			}
			else {
				if(newnames[1] == null) {
					dto.setImgNamePath(newnames[0],"","","","");
				}
				else if(newnames[2] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],"","","");
				}
				else if(newnames[3] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],newnames[2],"","");
				}
				else if(newnames[4] == null) {
					dto.setImgNamePath(newnames[0],newnames[1],newnames[2],newnames[3],"");
				}
			}
		}
		//mysql insert
		sr_service.insertShowroom(dto);
		return "showroom/sr_main"; 
	}
	
	
	
	
	
}
