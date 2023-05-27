package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class MemLogin
 */
@WebServlet("/memLogin.do")
public class MemLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 아래 2개는 정확히 언제 사용??
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberVO memVO = new MemberVO();
		
		memVO.setMem_id(id);
		memVO.setMem_pw(pw);
		
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO loginMember = service.selectMember(memVO);
		
		HttpSession session = request.getSession();
		String boardURL = "";
		if(loginMember != null) {
			// 1. ID와 PW를 담는다
//			session.setAttribute("ID", id);
//			session.setAttribute("PW", pw);
			
			// 2. VO를 담는다?
			session.setAttribute("loginVO", loginMember);
			
			response.sendRedirect("/boardList.do");
		} else { // 로그인 정보가 없거나 잘못됐을 때
			boardURL = "/WEB-INF/views/login.jsp?error=1";
			RequestDispatcher dispatcher = null;
			dispatcher = request.getRequestDispatcher(boardURL);
			dispatcher.forward(request, response);
		}
	}
}
