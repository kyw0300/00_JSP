package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/joinPage.do")
public class JoinPage extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardURL = "/WEB-INF/views/join.jsp";
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher(boardURL);
		dispatcher.forward(request, response);
	}

}
