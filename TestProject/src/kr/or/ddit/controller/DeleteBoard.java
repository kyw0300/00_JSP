package kr.or.ddit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.BoardServiceImpl;
import kr.or.ddit.service.IBoardService;

/**
 * Servlet implementation class DeleteBoard
 */
@WebServlet("/deleteBoard.do")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bo_no = request.getParameter("bo_no");
		
		IBoardService service = BoardServiceImpl.getInstance();
		int deleteCnt = service.deleteBoard(bo_no);
		
//		Map<String, Integer> cntMap = new HashMap<String, Integer>();
//		cntMap.put("insertCnt", 0);
//		cntMap.put("deleteCnt", 0);
//		cntMap.put("updateCnt", 0);
//		
//		cntMap.put("deleteCnt", deleteCnt);
		
//		request.setAttribute("cntMap", cntMap);
//		
//		String mainURL = "/WEB-INF/views/board/boardList.jsp";
//		RequestDispatcher dispatcher = null;
//		dispatcher = request.getRequestDispatcher(mainURL);
//		dispatcher.forward(request, response);
		
		response.sendRedirect("/boardList.do?deleteCnt="+deleteCnt);
	}

}
