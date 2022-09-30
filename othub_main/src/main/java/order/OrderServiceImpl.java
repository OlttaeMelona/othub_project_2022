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
}
