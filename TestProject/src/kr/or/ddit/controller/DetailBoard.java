package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.BoardServiceImpl;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

/**
 * Servlet implementation class DetailBoard
 */
@WebServlet("/detailBoard.do")
public class DetailBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bo_no = request.getParameter("bo_no");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		// 조회수 증가 메서드
		int cnt = service.updateHit(bo_no);
		
		// 게시판 상세정보 가져오기
		BoardVO detailVO = service.selectDetailBoard(bo_no);
		String con = detailVO.getBo_content();
		String newCon = con.replaceAll("\n", "<br/>");
		detailVO.setBo_content(newCon);
		
		request.setAttribute("detailVO", detailVO);
		
		String boardURL = "/WEB-INF/views/board/detailBoard.jsp";
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher(boardURL);
		dispatcher.forward(request, response);
	}

}
