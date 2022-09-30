package order;

public interface OrderService {
	//주문table insert
	public void insertOrder(OrderDTO dto);
	
	//product 조회
	public OrderDTO getProductdetail(int p_id);
	
	//orderid 조회
	public int getOrderid();
}
