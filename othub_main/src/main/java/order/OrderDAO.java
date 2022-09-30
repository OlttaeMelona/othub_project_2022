package order;

import productdetail.ProductdetailDTO;

public interface OrderDAO {

	//order table에 입력
	public void insertOrder(OrderDTO dto);
	
	//product 조회
	public OrderDTO getProductdetail(int p_id);
	
	//orderid 조회
	public int getOrderid();
}
