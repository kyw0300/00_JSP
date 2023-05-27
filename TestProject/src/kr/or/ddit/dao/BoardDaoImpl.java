package kr.or.ddit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.SearchInfoVO;

public class BoardDaoImpl implements IBoardDao {
	private static IBoardDao instance;
	private BoardDaoImpl() {}
	
	public static IBoardDao getInstance() {
		if(instance == null) instance = new BoardDaoImpl();
		return instance;
	}

	@Override
	public List<BoardVO> selectBoardList(SearchInfoVO searchVO) {
		SqlSession session = null;
		List<BoardVO> boardList = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			boardList = session.selectList("board.selectBoardList",searchVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return boardList;
	}

	@Override
	public int countBoardList(SearchInfoVO searchVO) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("board.countBoardList",searchVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}	
	
	@Override
	public int insertBoard(BoardVO boardVO) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("board.insertBoard",boardVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public BoardVO selectDetailBoard(String bo_no) {
		SqlSession session = null;
		BoardVO boardVO = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			boardVO = session.selectOne("board.selectDetailBoard",bo_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return boardVO;
	}

	@Override
	public int updateHit(String bo_no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("board.updateHit",bo_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteBoard(String bo_no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("board.deleteBoard",bo_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("board.updateBoard",boardVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}



}
