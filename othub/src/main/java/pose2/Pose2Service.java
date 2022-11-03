package pose2;

import java.util.List;

import org.json.simple.JSONObject;

public interface Pose2Service {
	public String test(String posePath, String image);
	
	//public JSONObject getJSONObjectFromSring(String jsonStr);
	
	public void insertPose(int p_id);
	
	public void updatePose(int pose_x, int pose_y, int posedata_id, int seq);
	
	public Pose2DTO findProduct(int p_id);
	
	public List<Pose2DTO> findProductId();
	
	public int countProduct();
	
	public int findPose();
	
	public void updateRatio(Pose2DTO dto);
	
	public void insertUserRatio(Pose2DTO dto);
	
	public double findUserRatio(String m_id);
	
	public List<Pose2DTO> findProductRatio(double min_ratio, double max_ratio);
	
	public Pose2DTO getProductdetail(int p_id);	

	public String getName(String m_id);
}
