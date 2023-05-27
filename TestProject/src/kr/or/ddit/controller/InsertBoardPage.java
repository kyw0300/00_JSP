package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertBoard
 */
@WebServlet("/insertBoardPage.do")
public class InsertBoardPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mainURL = "/WEB-INF/views/board/insertBoard.jsp";
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher(mainURL);
		dispatcher.forward(request, response);
	}

}
