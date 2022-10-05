package order;

public interface OrderService {
	//주문table insert
	public void insertOrder(OrderDTO dto);
	
	//product 조회
	public OrderDTO getProductdetail(int p_id);
	
	//orderid 조회
	public int getOrderid();
	
	//product id 조회
	public int getProductid(int o_id);
	
	//orders table 조회
	public OrderDTO getOrders(int o_id);
	
	//member table 조회
	public OrderDTO getMember(String m_id);
	
	//주문 완료
	public void doOrder(int order_id);
	
	//주문 삭제
	public void cancleOrder(int order_id);
}
