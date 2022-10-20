package cs;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CSDAOImpl implements CSDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "cs";

	@Override
	public List<CSDTO> cslist() throws Exception {
		return sql.selectList(namespace + ".cslist");
	}

	@Override
	public void cswrite(CSDTO dto) throws Exception {
		sql.insert(namespace + ".cswrite", dto);
		
	}

	@Override
	public CSDTO cswview(int cs_seq) throws Exception {
		return sql.selectOne(namespace + ".csview", cs_seq);
	}

	@Override
	public void csmodify(CSDTO dto) throws Exception {
		sql.insert(namespace + ".csmodify", dto);
		
	}

	@Override
	public void csdelete(int cs_seq) throws Exception {
		sql.delete(namespace + ".csdelete", cs_seq);
		
	}

	@Override
	public int cscount() throws Exception {
		return sql.selectOne(namespace + ".cscount"); 
	}

	@Override
	public List<CSDTO> cslistPage(int displayPost, int postNum) throws Exception {
		HashMap data = new HashMap();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		return sql.selectList(namespace + ".cslistPage", data);
	}


}
