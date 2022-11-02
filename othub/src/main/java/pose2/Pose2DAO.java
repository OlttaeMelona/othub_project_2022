package pose2;

import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;


public interface Pose2DAO {

	public JSONObject getJSONObjectFromSring(String jsonStr);
	
	public void insertPose(int p_id);
	
	public void updatePose0(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose1(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose2(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose3(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose4(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose5(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose6(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose7(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose8(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose9(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose10(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose11(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose12(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose13(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose14(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose15(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose16(int pose_x, int pose_y, int posedata_id);
	
	public void updatePose17(int pose_x, int pose_y, int posedata_id);
	
	public Pose2DTO findProduct(int p_id);
	
	public List<Pose2DTO> findProductId();
	
	public int countProduct();
	
	public int findPose();
	
	public void updateRatio(Pose2DTO dto);
	
	public void insertUserRatio(Pose2DTO dto);
	
	public double findUserRatio(String m_id);
	
	public List<Pose2DTO> findProductRatio(double min_ratio, double max_ratio);
	
	public Pose2DTO getProductdetail(int p_id);
}
