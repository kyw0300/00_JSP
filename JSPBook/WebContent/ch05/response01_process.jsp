<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 페이지에서 입력한 한글을 처리하도록 request 내장 객체의 setCharacterEncoding 메소드에
	// 문자 인코딩 유형 UTF-8로 작성
	request.setCharacterEncoding("utf-8");
	
	// 입력된 아이디, 비밀번호를 폼 태그로부터 전송받도록 request 내장 객체의 getParameter() 메소드를 작성
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 폼 태그로부터 전송받은 아이디와 비밀번호와 일치하면 response01_success.jsp 페이지로 이동
	if(id.equals("admin") && pw.equals("1234")) {
		// 로그인 성공
		response.sendRedirect("response01_success.jsp");
	} else { // 일치하지 않으면 response01_failed.jsp 페이지로 이동
		// 로그인 실패
		response.sendRedirect("response01_failed.jsp");
	}
%>