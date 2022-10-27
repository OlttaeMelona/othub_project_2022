package pose2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.othub.NaverInform;

@Service("pose2service")
public class Pose2ServiceImple implements Pose2Service {

	@Autowired
	Pose2DAO dao;
	
	@Override
	public String test(String image) {
		String result ="";
		StringBuffer reqStr = new StringBuffer();
        String clientId = NaverInform.id;//애플리케이션 클라이언트 아이디값";
        String clientSecret = NaverInform.key;//애플리케이션 클라이언트 시크릿값";

        try {
            String paramName = "image"; // 파라미터명은 image로 지정
            String imgFile = NaverInform.path2+image;
            
           // String imgFile = "/images/"+image;
            System.out.println(imgFile);
            File uploadFile = new File(imgFile);
            String apiURL = "https://naveropenapi.apigw.ntruss.com/vision-pose/v1/estimate"; // 사람 인식
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            // multipart request
            String boundary = "---" + System.currentTimeMillis() + "---";
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            OutputStream outputStream = con.getOutputStream();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
            String LINE_FEED = "\r\n";
            // file 추가
            String fileName = uploadFile.getName();
            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"").append(LINE_FEED);
            writer.append("Content-Type: "  + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush();
            FileInputStream inputStream = new FileInputStream(uploadFile);
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            writer.append(LINE_FEED).flush();
            writer.append("--" + boundary + "--").append(LINE_FEED);
            writer.close();
            BufferedReader br = null;
            int responseCode = con.getResponseCode();
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            }
            String inputLine;
            if(br != null) {
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                //System.out.println(response.toString());
                result = response.toString();
                //result2 = response;
            } else {
                System.out.println("error !!!");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
		return result;
		
		
	}
	/*
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
	*/
	
	public void insertPose(int p_id) {
		dao.insertPose(p_id);
	}
	
	public void updatePose(int pose_x, int pose_y, int posedata_id, int seq) {
		if(seq == 0) {
			dao.updatePose0(pose_x, pose_y, posedata_id);
		}
		else if(seq == 1) {
			dao.updatePose1(pose_x, pose_y, posedata_id);
		}
		else if(seq == 2) {
			dao.updatePose2(pose_x, pose_y, posedata_id);
		}
		else if(seq == 3) {
			dao.updatePose3(pose_x, pose_y, posedata_id);
		}
		else if(seq == 4) {
			dao.updatePose4(pose_x, pose_y, posedata_id);
		}		
		else if(seq == 5) {
			dao.updatePose5(pose_x, pose_y, posedata_id);
		}
		else if(seq == 6) {
			dao.updatePose6(pose_x, pose_y, posedata_id);
		}
		else if(seq == 7) {
			dao.updatePose7(pose_x, pose_y, posedata_id);
		}
		else if(seq == 8) {
			dao.updatePose8(pose_x, pose_y, posedata_id);
		}
		else if(seq == 9) {
			dao.updatePose9(pose_x, pose_y, posedata_id);
		}
		else if(seq == 10) {
			dao.updatePose10(pose_x, pose_y, posedata_id);
		}
		else if(seq == 11) {
			dao.updatePose11(pose_x, pose_y, posedata_id);
		}
		else if(seq == 12) {
			dao.updatePose12(pose_x, pose_y, posedata_id);
		}
		else if(seq == 13) {
			dao.updatePose13(pose_x, pose_y, posedata_id);
		}
		else if(seq == 14) {
			dao.updatePose14(pose_x, pose_y, posedata_id);
		}
		else if(seq == 15) {
			dao.updatePose15(pose_x, pose_y, posedata_id);
		}
		else if(seq == 16) {
			dao.updatePose16(pose_x, pose_y, posedata_id);
		}
		else if(seq == 17) {
			dao.updatePose17(pose_x, pose_y, posedata_id);
		}
	}
	
	@Override
	public Pose2DTO findProduct(int p_id) {
		return dao.findProduct(p_id);
	}
	
	@Override
	public int countProduct() {
		return dao.countProduct();
	}
	
	@Override
	public int findPose() {
		return dao.findPose();
	}
}
