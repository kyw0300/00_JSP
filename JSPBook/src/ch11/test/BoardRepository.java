package ch11.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class BoardRepository {
	private static int no = 0;
	private ArrayList<BoardVO> listOfBoard = new ArrayList<BoardVO>();
	private static BoardRepository instance = new BoardRepository();
	
	public static BoardRepository getInstance() {
		return instance;
	}
	
	// 게시판 목록 전체 가져오기
	public ArrayList<BoardVO> selectBoardList(){
		return listOfBoard;
	}
	
	// 게시글 1개 가져오기
	public BoardVO getBoardById(int no) {
		BoardVO vo = null;
		for(BoardVO board : listOfBoard) {
			if(board.getNo() == no) {
				vo = board;
			}
		}
		
		return vo;
	}
	
	// 게시글 삭제
	public void deleteBoard(int no) {
		int index = no - 1;
		listOfBoard.remove(index);
	}
	
	// 게시글 수정
	public void updateBoard(BoardVO board) {
		int no = board.getNo();
		int index = no - 1;
		listOfBoard.set(index, board);
	}
	
	// 게시글 추가
	public void addBoard(BoardVO board) {
		listOfBoard.add(board);
	}
	
	// 게시글 번호 가져오기
	public int getNo() {
		return no;
	}
	public void plusNo() {
		BoardRepository.no += 1;
	}
	
	// 조회수 증가
	public void plusHit(BoardVO detailVO) {
		int hit = detailVO.getHit();
		hit += 1;
		detailVO.setHit(hit);
	}
	
	// 날짜 출력할때 활용
	public String getCurrenTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(cal.getTime());
	}
}
