package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/memJoin.do")
public class MemJoin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		// memberVO 생성 후 담아서 service 호출
		MemberVO memVO = new MemberVO();
		memVO.setMem_id(id);
		memVO.setMem_pw(pw);
		memVO.setMem_name(name);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.insertMember(memVO);
		
//		forward로 보내는 상황에서 setAttribute -> getAttribute와
//		?cnt=1 로 보내서 getParameter("cnt")로 받는거 차이?
		
		String mainURL = "main.do?cnt="+cnt;
		response.sendRedirect(mainURL);
		
		// ↑↑ 왜 sendRedirect로는 안되는지???
//		String mainURL = "/WEB-INF/views/login.jsp?cnt="+cnt;
//		RequestDispatcher dispatcher = null;
//		dispatcher = request.getRequestDispatcher(mainURL);
//		dispatcher.forward(request, response);
		
	}

}
