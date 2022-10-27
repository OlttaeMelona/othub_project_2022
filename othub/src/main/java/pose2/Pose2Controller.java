package pose2;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.othub.NaverInform;

@Controller
public class Pose2Controller {

	@Autowired
	@Qualifier("pose2service")
	Pose2Service pose2service;
	
	@Autowired
	Pose2DAO dao;
	
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
	
	@RequestMapping("/datacenter")
	public ModelAndView datacenter() {
		int count = pose2service.countProduct();
		String [][] data_list = new String [count][6];
		for(int p_id = 1; p_id < count + 1; p_id++) {
			int i = p_id - 1;
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
		String jsonresult = pose2service.test(image);
		ModelAndView mv = new ModelAndView();
		JSONObject jsonObject = getJSONObjectFromSring(jsonresult);
		JSONArray a = (JSONArray)jsonObject.get("predictions");
		int q_id = Integer.parseInt(p_id);
		mv.addObject("pose2result", jsonresult);
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
		}
		pose2service.insertPose(p_id);
		int posedata_id = pose2service.findPose(); 
		for(int i = 0; i < u; i++) {
			int seq = possArrK[i];
			pose2service.updatePose(possArrX[i], possArrY[i], posedata_id, seq);

		}
	}
	
}
