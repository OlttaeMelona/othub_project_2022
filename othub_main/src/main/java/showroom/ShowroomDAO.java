package showroom;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Mapper
@Repository("showroomdao")
public interface ShowroomDAO {
	//전체 게시물 조회
	public List<ShowroomDTO> showroomList() throws Exception;
	
	//최신순
	public List<ShowroomDTO> newList(int seq) throws Exception;
	
	//조회순
	public List<ShowroomDTO> viewCountList(int seq) throws Exception;
	
	//게시물 총 갯수
	public int TotalCountShowroom() throws Exception;
	
	//조회수 업데이트
	public void viewCount(int sr_num) throws Exception;
	
	//게시물 등록
	public ShowroomDTO insertShowroom(ShowroomDTO dto) throws Exception;
	
	//게시물 수정
	public void updateShowroom(ShowroomDTO dto) throws Exception;
	
	//게시물 삭제
	public void deleteShowroom(int sr_num) throws Exception;
}
