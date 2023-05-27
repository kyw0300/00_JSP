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
 * Servlet implementation class UpdateBoard
 */
@WebServlet("/updateBoardPage.do")
public class UpdateBoardPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bo_no = request.getParameter("bo_no");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		// 게시판 상세정보 가져오기
		BoardVO detailVO = service.selectDetailBoard(bo_no);
		
		// 여기서 setAttribute or 수정페이지에서 <% %>에서 bo_no으로 조회
		request.setAttribute("detailVO", detailVO);
		
		// 수정페이지로 이동
		String updateURL = "/WEB-INF/views/board/updateBoard.jsp";
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher(updateURL);
		dispatcher.forward(request, response);
	}

}
