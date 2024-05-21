package board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Autowired
	BoardDaoInter daoInter;
	
	public void insertboard(BoardDto dto) {
		
		daoInter.save(dto);
	}
	
	public List<BoardDto> getAllDatas() {
		
		//최신글 위로 올라오게
		return daoInter.findAll(Sort.by(Sort.Direction.DESC,"num"));
	}
	
	public BoardDto getData(Long num) {
		
		return daoInter.getReferenceById(num);
	}
	
	public void updateboard(BoardDto dto) {
		
		daoInter.save(dto);
	}
	
	public void deleteboard(Long num) {
		
		daoInter.deleteById(num);
	}
}
