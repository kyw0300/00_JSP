package kr.or.ddit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.BoardServiceImpl;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.SearchInfoVO;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/boardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page_ = request.getParameter("page");
		String field_ = request.getParameter("field");
		String searchWord_ = request.getParameter("searchWord");
		
		int page = 1;
		if(page_ != null && !page_.equals("")) {
			page = Integer.parseInt(page_);
		}
		
		String field = "bo_title";
		if(field_ != null && !field_.equals("")) {
			field = field_;
		}
		
		String searchWord = "";
		if(searchWord_ != null && !searchWord_.equals("")) {
			searchWord = searchWord_;
		}
		
//		System.out.println(page);
//		System.out.println(field);
//		System.out.println(searchWord);
		
		int startNum = 1 + (page-1)*5;
		int lastNum = page*5;
		
		SearchInfoVO searchVO = new SearchInfoVO();
		searchVO.setPage(page);
		searchVO.setField(field);
		searchVO.setSearchWord(searchWord);
		searchVO.setStartNum(startNum);
		searchVO.setLastNum(lastNum);
		
		IBoardService service = BoardServiceImpl.getInstance();
		List<BoardVO> boardList = service.selectBoardList(searchVO);
		int cnt = service.countBoardList(searchVO);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("cnt", cnt);
		
		String boardURL = "/WEB-INF/views/board/boardList.jsp";
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher(boardURL);
		dispatcher.forward(request, response);
	}
}
