package showroom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("showroomservice")
public class ShowroomServiceImpl implements ShowroomService {
	@Autowired
	@Qualifier("showroomdao")
	ShowroomDAO dao;
	
	//전체 게시물 조회
	@Override
	public List<ShowroomDTO> showroomList() throws Exception {
		return dao.showroomList();
	}
	
	//조회순
	@Override
	public List<ShowroomDTO> newList(int seq) throws Exception {
		return dao.newList(seq);
	}
	
	//최신순
	@Override
	public List<ShowroomDTO> viewCountList(int seq) throws Exception {
		return dao.viewCountList(seq);
	}
	
	//게시물 총 갯수
	@Override
	public int TotalCountShowroom() throws Exception {
		return dao.TotalCountShowroom();
	}
	
	//조회수 업데이트
	@Override
	public void viewCount(int sr_num) throws Exception {
		dao.viewCount(sr_num);
	}
	
	//게시글 등록
	@Override
	public void insertShowroom(ShowroomDTO dto) throws Exception {
		dao.insertShowroom(dto);
	}
	
	//게시글 수정
	@Override
	public void updateShowroom(ShowroomDTO dto) throws Exception {
		dao.updateShowroom(dto);
	}
	
	//게시글 삭제
	@Override
	public void deleteShowroom(int sr_num) throws Exception {
		dao.deleteShowroom(sr_num);
	}

}
