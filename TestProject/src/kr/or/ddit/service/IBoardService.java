package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.SearchInfoVO;

public interface IBoardService {
	
	/**
	 * 게시판 리스트 조회(검색 포함)
	 * @return
	 */
	public List<BoardVO> selectBoardList(SearchInfoVO searchVO);
	
	/**
	 * 게시글 개수 조회(검색 포함)
	 * @param searchVO
	 * @return
	 */
	public int countBoardList(SearchInfoVO searchVO);
	
	/**
	 * 게시글 작성
	 * @param boardVO
	 * @return
	 */
	public int insertBoard(BoardVO boardVO);
	
	/**
	 * 상세 페이지 조회
	 * @param bo_no
	 * @return
	 */
	public BoardVO selectDetailBoard(String bo_no);
	
	/**
	 * 조회수 증가
	 * @param bo_no
	 * @return
	 */
	public int updateHit(String bo_no);
	
	/**
	 * 게시글 삭제
	 * @param bo_no
	 * @return
	 */
	public int deleteBoard(String bo_no);
	
	/**
	 * 게시글 수정
	 * @param boardVO
	 * @return
	 */
	public int updateBoard(BoardVO boardVO);
}
