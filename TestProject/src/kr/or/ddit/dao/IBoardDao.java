package kr.or.ddit.dao;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.SearchInfoVO;

public interface IBoardDao {
	
	public List<BoardVO> selectBoardList(SearchInfoVO searchVO);
	
	public int countBoardList(SearchInfoVO searchVO);
	
	public int insertBoard(BoardVO boardVO);
	
	public BoardVO selectDetailBoard(String bo_no);

	public int updateHit(String bo_no);
	
	public int deleteBoard(String bo_no);
	
	public int updateBoard(BoardVO boardVO);
}
