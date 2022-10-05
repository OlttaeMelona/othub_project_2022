package cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cartservice")
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO dao;
	
	//cart에 추가
	@Override
	public void insertCart(CartDTO dto) {
		dao.insertCart(dto);
	}
	
	//cart 조회
	@Override
	public List<CartDTO> getCart(String m_id) {
		return dao.getCart(m_id);
	}
}
