package order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.convert.DtoInstantiatingConverter;
import org.springframework.stereotype.Service;

@Service("orderservice")
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO dao;
	
	@Override
	public void insertOrder(OrderDTO dto) {
		dao.insertOrder(dto);
		//return dao.주소조회메소드();
	}
	
	@Override
	public OrderDTO getProductdetail(int p_id) {
		return dao.getProductdetail(p_id);
	}
	
	@Override
	public int getOrderid() {
		return dao.getOrderid();
	}
	
	@Override
	public int getProductid(int o_id) {
		return dao.getProductid(o_id);
	}
	
	@Override
	public OrderDTO getOrders(int o_id) {
		return dao.getOrders(o_id);
	}
	
	@Override
	public OrderDTO getMember(String m_id) {
		return dao.getMember(m_id);
	}
	
	@Override
	public void doOrder(int order_id) {
		dao.doOrder(order_id);
	}
	
	@Override
	public void cancleOrder(int order_id) {
		dao.cancleOrder(order_id);
	}
}
