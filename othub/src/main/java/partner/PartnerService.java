package partner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("partnerservice")
public class PartnerService {
	@Autowired
	@Qualifier("partnerdao")
	PartnerDAO dao;
	
	//insert
	public void insertPartner(PartnerDTO dto) throws Exception{
		dao.insertPartner(dto);
	};
	//전체 조회
	public List<PartnerDTO> partnerList() throws Exception{
		return dao.PartnerList();
	};
	//ocr test img 등록
	public void insertTestOCRImg(OCRDTO ocrdto) throws Exception{
		dao.insertTestOCRImg(ocrdto);
	};
	//ocr test img 가져오기
	public OCRDTO getTestOCRImg(OCRDTO ocrdto) throws Exception{
		return dao.getTestOCRImg(ocrdto);
	};
	
	
}
