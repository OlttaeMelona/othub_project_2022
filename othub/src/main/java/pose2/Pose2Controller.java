package pose2;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.othub.NaverInform;

@Controller
public class Pose2Controller {

	@Autowired
	@Qualifier("pose2service")
	Pose2Service pose2service;
	
	@Autowired
	Pose2DAO dao;
	
	@Autowired
	Pose2DTO dto;// = new Pose2DTO();
	
	public JSONObject getJSONObjectFromSring(String jsonStr) {
		JSONObject jsonObject = new JSONObject();
		JSONParser jsonParser = new JSONParser();
		try {
			jsonObject = (JSONObject) jsonParser.parse(jsonStr);
		}
		catch(org.json.simple.parser.ParseException e){
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public boolean existtest(int [] x, int y) {
		boolean z = false;
		for(int i = 0; i < x.length; i++) {
			if(x[i] == y) {			 	
				z = true;				
			}			
		}		
		return z;
	}
	
	public double lengthCalc(double x1, double y1, double x2, double y2) {
		double z = Math.sqrt( Math.pow(x1 - x2, 2) + Math.pow(y1 - y2, 2) );
		return z;
	}
	
	@RequestMapping("/datacenter")
	public ModelAndView datacenter() {
		int count = pose2service.countProduct();
		String [][] data_list = new String [count][6];
		List<Pose2DTO> pid_list = new ArrayList<>();
		//int [] pid_list = new int [count];
		pid_list = pose2service.findProductId();
		System.out.println(pid_list.get(1).p_id);
		for(int i = 0; i < pid_list.size(); i++) {
			int p_id = pid_list.get(i).p_id;
			String p_name = pose2service.findProduct(p_id).p_name;
			String path_0 = pose2service.findProduct(p_id).p_thumb;
			String path_1 = pose2service.findProduct(p_id).p_image1;
			String path_2 = pose2service.findProduct(p_id).p_image2;
			String path_3 = pose2service.findProduct(p_id).p_image3;
			data_list[i][0] = Integer.toString(p_id);
			data_list[i][1] = p_name;
			data_list[i][2] = path_0;
			data_list[i][3] = path_1;
			data_list[i][4] = path_2;
			data_list[i][5] = path_3;
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("data_list", data_list);
		mv.setViewName("pose2/pose2input2");
		return mv;
	}	
	
	@RequestMapping("/pose2result3")
	public ModelAndView poseresult2(String image, String p_id) {
		//String posePath = NaverInform.pose_path2;
		String posePath = NaverInform.pose_path1;
		String jsonresult = pose2service.test(posePath, image);
		ModelAndView mv = new ModelAndView();
		JSONObject jsonObject = getJSONObjectFromSring(jsonresult);
		JSONArray a = (JSONArray)jsonObject.get("predictions");
		int q_id = Integer.parseInt(p_id);
		mv.addObject("pose2result", jsonresult);
		System.out.println(a.get(0));
		mv.addObject("testtest", a.get(0));
		mv.addObject("p_id", q_id);
		mv.setViewName("pose2/pose2result3");//  var a = ${pose2result};
		
			return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/pose2result4" , method = RequestMethod.POST)
	public void test2(@RequestParam String posejson, int u, int p_id) {//String jsonpose
		String [] possArr1 = posejson.split(",");
		int [] possArrK = new int [u];
		int [] possArrX = new int [u];
		int [] possArrY = new int [u];
		for(int i = 0; i < possArr1.length; i++) {
			}
		for(int i = 0, j = 0; i < possArr1.length; i = i+3, j++) {
			if(j == 0) {				
			possArrK[j] = Integer.parseInt(possArr1[i].substring(3, possArr1[i].length()-1)) ;
			}
			else {
			possArrK[j] = Integer.parseInt(possArr1[i].substring(2, possArr1[i].length()-1)) ;
			}
			//System.out.println(possArrK[j]);
		}
		for(int i = 1, j = 0; i < possArr1.length; i = i+3, j++) {
			possArrX[j] = (int)(Double.parseDouble((possArr1[i]))*10000); 
		}

		for(int i = 2, j = 0; i < possArr1.length; i = i+3, j++) {
			if(j != u - 1) {
			possArrY[j] = (int)(Double.parseDouble(possArr1[i].substring(0, possArr1[i].length()-1))*10000) ;
			}
			else {
			possArrY[j] = (int)(Double.parseDouble(possArr1[i].substring(0, possArr1[i].length()-2))*10000) ;
			}
			//System.out.println(possArrY[j]);
		}
		
		boolean fail = true;
		double h = 0; //머리길이
		double body = 0; //몸통길이
		double shoulderToButt = 0;//어깨to엉덩이
		double buttToFoot = 0;//엉덩이to
		double noseToNeck = 0; //코to목
		if(existtest(possArrK,0) && existtest(possArrK,1)) {//코 to 목
			double x0 = (double) possArrX[0];
			double y0 = (double) possArrY[0];
			double x1 = (double) possArrX[1];
			double y1 = (double) possArrY[1];
			//noseToNeck = Math.sqrt( Math.pow(noseX - neckX, 2) + Math.pow(noseY - neckY, 2) );
			noseToNeck = lengthCalc(x0, y0, x1, y1);
			h = noseToNeck;
		}
		else {fail = false;}
		
		if(existtest(possArrK,2) && existtest(possArrK,8) && existtest(possArrK,10) && existtest(possArrK,5) && existtest(possArrK,11) && existtest(possArrK,13)) {
			double x2 = (double) possArrX[2];
			double y2 = (double) possArrY[2];
			double x8 = (double) possArrX[8];
			double y8 = (double) possArrY[8];
			double x10 = (double) possArrX[10];
			double y10 = (double) possArrY[10];
			double x5 = (double) possArrX[5];
			double y5 = (double) possArrY[5];
			double x11 = (double) possArrX[11];
			double y11 = (double) possArrY[11];
			double x13 = (double) possArrX[13];
			double y13 = (double) possArrY[13];
			shoulderToButt = (lengthCalc(x2, y2, x8, y8) + lengthCalc(x5, y5, x11, y11)) / 2;
			shoulderToButt = shoulderToButt * 13 / 8;
			buttToFoot = (lengthCalc(x8, y8, x10, y10) + lengthCalc(x11, y11, x13, y13)) / 2;
			body = shoulderToButt + buttToFoot;

		}
		
		else if(!existtest(possArrK,2) || !existtest(possArrK,8) || !existtest(possArrK,10)) {
			if(existtest(possArrK,5) && existtest(possArrK,11) && existtest(possArrK,13)) {
				double x5 = (double) possArrX[5];
				double y5 = (double) possArrY[5];
				double x11 = (double) possArrX[11];
				double y11 = (double) possArrY[11];
				double x13 = (double) possArrX[13];
				double y13 = (double) possArrY[13];
				shoulderToButt = lengthCalc(x5, y5, x11, y11);
				shoulderToButt = shoulderToButt * 13 / 8;
				buttToFoot = lengthCalc(x11, y11, x13, y13);
				body = shoulderToButt + buttToFoot;
			}
			else if(!existtest(possArrK,5) || !existtest(possArrK,11) || !existtest(possArrK,13)) {
				fail = false;
			}				
		}
		else if(!existtest(possArrK,5) || !existtest(possArrK,11) || !existtest(possArrK,13)) {
			if(existtest(possArrK,2) && existtest(possArrK,8) && existtest(possArrK,10)) {
				double x2 = (double) possArrX[2];
				double y2 = (double) possArrY[2];
				double x8 = (double) possArrX[8];
				double y8 = (double) possArrY[8];
				double x10 = (double) possArrX[10];
				double y10 = (double) possArrY[10];
				shoulderToButt = lengthCalc(x2, y2, x8, y8);
				shoulderToButt = shoulderToButt * 13 / 8;
				buttToFoot = lengthCalc(x8, y8, x10, y10);
				body = shoulderToButt + buttToFoot;
			}
			else if(!existtest(possArrK,2) || !existtest(possArrK,8) || !existtest(possArrK,10)) {
				fail = false;
			}
		}
		double ratio = 0;
		if(fail) {
			ratio = body/h;
		}
		System.out.println(fail);

		
		pose2service.insertPose(p_id);
		int posedata_id = pose2service.findPose(); 
		for(int i = 0; i < u; i++) {
			int seq = possArrK[i];
			//dto.ratio = ratio;
			//dto.posedata_id = posedata_id;
			pose2service.updatePose(possArrX[i], possArrY[i], posedata_id, seq);
			
		}
		if(fail) {
			//2개변수set ㅇdto객
			dto.ratio = ratio;
			dto.posedata_id = posedata_id;
			pose2service.updateRatio(dto); 
		}
	}
	
	@RequestMapping("/pose2inputU")
	public String pose2inputU() {
		return("/pose2/pose2inputU");
	}
	
	@PostMapping("/pose2resultU")
	public ModelAndView pose2resultU(HttpServletRequest request, Pose2DTO dto) throws IOException{
		
		String user = request.getParameter("user");
		//String posePath = NaverInform.pose_path2;
		String posePath = NaverInform.pose_path2;
		MultipartFile pose_image1 = dto.getPose_image();
		String originalname1 = pose_image1.getOriginalFilename();
		String beforeext1 = originalname1.substring(0, originalname1.indexOf("."));
		String ext1 = originalname1.substring(originalname1.indexOf(".")); 
		String newname1 = user+beforeext1+ext1;
		File servefile1 = new File(posePath+newname1); 
		pose_image1.transferTo(servefile1);
		dto.setPose_imagename(newname1);
		System.out.println(originalname1);
		System.out.println(beforeext1);
		System.out.println(ext1);
		System.out.println(newname1);
		System.out.println(servefile1);
		
		String jsonresult = pose2service.test(posePath, newname1);
		ModelAndView mv = new ModelAndView();
		JSONObject jsonObject = getJSONObjectFromSring(jsonresult);
		JSONArray a = (JSONArray)jsonObject.get("predictions");
		
		String jspPath = "pose2/" + newname1;
		mv.addObject("pose2result", jsonresult);
		mv.addObject("testtest", a.get(0));
		mv.addObject("jspPath", jspPath);
		mv.setViewName("pose2/pose2resultU");//  var a = ${pose2result};
		
			return mv;
		
		//return("/pose2/pose2resultU");
	}
	
	@ResponseBody
	@RequestMapping(value = "/pose2resultU2")
	public void testUser(@RequestParam String posejson, int u, HttpServletRequest request) {//String jsonpose
		String [] possArr1 = posejson.split(",");
		int [] possArrK = new int [u];
		int [] possArrX = new int [u];
		int [] possArrY = new int [u];
		for(int i = 0; i < possArr1.length; i++) {
			}
		for(int i = 0, j = 0; i < possArr1.length; i = i+3, j++) {
			if(j == 0) {				
			possArrK[j] = Integer.parseInt(possArr1[i].substring(3, possArr1[i].length()-1)) ;
			}
			else {
			possArrK[j] = Integer.parseInt(possArr1[i].substring(2, possArr1[i].length()-1)) ;
			}
			//System.out.println(possArrK[j]);
		}
		for(int i = 1, j = 0; i < possArr1.length; i = i+3, j++) {
			possArrX[j] = (int)(Double.parseDouble((possArr1[i]))*10000); 
		}

		for(int i = 2, j = 0; i < possArr1.length; i = i+3, j++) {
			if(j != u - 1) {
			possArrY[j] = (int)(Double.parseDouble(possArr1[i].substring(0, possArr1[i].length()-1))*10000) ;
			}
			else {
			possArrY[j] = (int)(Double.parseDouble(possArr1[i].substring(0, possArr1[i].length()-2))*10000) ;
			}
			//System.out.println(possArrY[j]);
		}
		
		boolean fail = true;
		double h = 0; //머리길이
		double body = 0; //몸통길이
		double shoulderToButt = 0;//어깨to엉덩이
		double buttToFoot = 0;//엉덩이to
		double noseToNeck = 0; //코to목
		if(existtest(possArrK,0) && existtest(possArrK,1)) {//코 to 목
			double x0 = (double) possArrX[0];
			double y0 = (double) possArrY[0];
			double x1 = (double) possArrX[1];
			double y1 = (double) possArrY[1];
			//noseToNeck = Math.sqrt( Math.pow(noseX - neckX, 2) + Math.pow(noseY - neckY, 2) );
			noseToNeck = lengthCalc(x0, y0, x1, y1);
			h = noseToNeck;
		}
		else {fail = false;}
		
		if(existtest(possArrK,2) && existtest(possArrK,8) && existtest(possArrK,10) && existtest(possArrK,5) && existtest(possArrK,11) && existtest(possArrK,13)) {
			double x2 = (double) possArrX[2];
			double y2 = (double) possArrY[2];
			double x8 = (double) possArrX[8];
			double y8 = (double) possArrY[8];
			double x10 = (double) possArrX[10];
			double y10 = (double) possArrY[10];
			double x5 = (double) possArrX[5];
			double y5 = (double) possArrY[5];
			double x11 = (double) possArrX[11];
			double y11 = (double) possArrY[11];
			double x13 = (double) possArrX[13];
			double y13 = (double) possArrY[13];
			shoulderToButt = (lengthCalc(x2, y2, x8, y8) + lengthCalc(x5, y5, x11, y11)) / 2;
			shoulderToButt = shoulderToButt * 13 / 8;
			buttToFoot = (lengthCalc(x8, y8, x10, y10) + lengthCalc(x11, y11, x13, y13)) / 2;
			body = shoulderToButt + buttToFoot;

		}
		
		else if(!existtest(possArrK,2) || !existtest(possArrK,8) || !existtest(possArrK,10)) {
			if(existtest(possArrK,5) && existtest(possArrK,11) && existtest(possArrK,13)) {
				double x5 = (double) possArrX[5];
				double y5 = (double) possArrY[5];
				double x11 = (double) possArrX[11];
				double y11 = (double) possArrY[11];
				double x13 = (double) possArrX[13];
				double y13 = (double) possArrY[13];
				shoulderToButt = lengthCalc(x5, y5, x11, y11);
				shoulderToButt = shoulderToButt * 13 / 8;
				buttToFoot = lengthCalc(x11, y11, x13, y13);
				body = shoulderToButt + buttToFoot;
			}
			else if(!existtest(possArrK,5) || !existtest(possArrK,11) || !existtest(possArrK,13)) {
				fail = false;
			}				
		}
		else if(!existtest(possArrK,5) || !existtest(possArrK,11) || !existtest(possArrK,13)) {
			if(existtest(possArrK,2) && existtest(possArrK,8) && existtest(possArrK,10)) {
				double x2 = (double) possArrX[2];
				double y2 = (double) possArrY[2];
				double x8 = (double) possArrX[8];
				double y8 = (double) possArrY[8];
				double x10 = (double) possArrX[10];
				double y10 = (double) possArrY[10];
				shoulderToButt = lengthCalc(x2, y2, x8, y8);
				shoulderToButt = shoulderToButt * 13 / 8;
				buttToFoot = lengthCalc(x8, y8, x10, y10);
				body = shoulderToButt + buttToFoot;
			}
			else if(!existtest(possArrK,2) || !existtest(possArrK,8) || !existtest(possArrK,10)) {
				fail = false;
			}
		}
		double ratio = 0;
		if(fail) {
			ratio = body/h;
		}
		else {
			ratio = 0;
		}
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");

		
		

			//2개변수set ㅇdto객
			dto.ratio_user = ratio;
			dto.m_id = m_id;
			pose2service.insertUserRatio(dto);

		
	}
		@RequestMapping("/pose2resultU3")
		public ModelAndView findc(HttpServletRequest request) {
			HttpSession session = request.getSession();
			String m_id = (String)session.getAttribute("m_id");
			String m_name = pose2service.getName(m_id);
			double user_ratio = pose2service.findUserRatio(m_id);
			double min_ratio = user_ratio - 0.3;
			double max_ratio = user_ratio + 0.3;		
			
			List<Pose2DTO> pid_list = new ArrayList<>();
			pid_list = pose2service.findProductRatio(min_ratio, max_ratio);
			
			for(int i = 0; i < pid_list.size(); i++) {
				Pose2DTO productdetail = pose2service.getProductdetail(pid_list.get(i).p_id);
				pid_list.get(i).p_thumb = productdetail.p_thumb;
				pid_list.get(i).p_name = productdetail.p_name;
				}
			
			double head = Math.round(user_ratio*10)/10.0;

			ModelAndView mv = new ModelAndView();
			mv.addObject("m_id", m_id);
			mv.addObject("head", head);
			mv.addObject("pid_list", pid_list);
			mv.addObject("number", pid_list.size());
			mv.addObject("m_name", m_name);
	
			if(head == 0) {
				mv.setViewName("/pose2/pose2inputU");
			}
			else {
				mv.setViewName("/pose2/pose2resultU3");
			}
			return mv;
		}
		
}


