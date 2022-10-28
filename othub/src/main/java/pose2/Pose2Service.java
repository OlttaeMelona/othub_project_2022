package pose2;

import org.json.simple.JSONObject;

public interface Pose2Service {
	public String test(String image);
	
	//public JSONObject getJSONObjectFromSring(String jsonStr);
	
	public void insertPose(int p_id);
	
	public void updatePose(int pose_x, int pose_y, int posedata_id, int seq);
	
	public Pose2DTO findProduct(int p_id);
	
	public int countProduct();
	
	public int findPose();
}
