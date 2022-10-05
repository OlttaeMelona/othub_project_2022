package cart;

import java.util.List;

public interface CartService {
	
	//cart에 추가
		public void insertCart(CartDTO dto);
		
	//cart 조회
	public List<CartDTO> getCart(String m_id);
}
