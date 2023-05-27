package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main.do")
public class Main extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cnt = request.getParameter("cnt");
		request.setAttribute("cnt", cnt);
		
		String mainURL = "/WEB-INF/views/login.jsp";
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher(mainURL);
		dispatcher.forward(request, response);
	}
}
