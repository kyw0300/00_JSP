<%@page import="ch11.test.BoardVO"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시글 수정을 처리해주세요.
		> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardRepository dao = BoardRepository.getInstance();
	BoardVO vo = dao.getBoardById(no);
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	
	dao.updateBoard(vo);
	
	response.sendRedirect("boardView.jsp?no="+no);
%>
</body>
</html>