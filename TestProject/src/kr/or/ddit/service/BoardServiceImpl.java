package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.dao.BoardDaoImpl;
import kr.or.ddit.dao.IBoardDao;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.SearchInfoVO;

public class BoardServiceImpl implements IBoardService {
	private IBoardDao dao;
	private static IBoardService instance;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	
	public static IBoardService getInstance() {
		if(instance == null) instance = new BoardServiceImpl();
		return instance;
	}
	
	@Override
	public List<BoardVO> selectBoardList(SearchInfoVO searchVO) {
		return dao.selectBoardList(searchVO);
	}
	
	@Override
	public int countBoardList(SearchInfoVO searchVO) {
		return dao.countBoardList(searchVO);
	}
	
	@Override
	public int insertBoard(BoardVO boardVO) {
		return dao.insertBoard(boardVO);
	}

	@Override
	public BoardVO selectDetailBoard(String bo_no) {
		return dao.selectDetailBoard(bo_no);
	}

	@Override
	public int updateHit(String bo_no) {
		return dao.updateHit(bo_no);
	}

	@Override
	public int deleteBoard(String bo_no) {
		return dao.deleteBoard(bo_no);
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		return dao.updateBoard(boardVO);
	}



}
