<%@page import="ch11.test.BoardVO"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시판 수정 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 제목입니다1
	작성자 : 홍길동
	내용 : 내용입니다1
	─────────────────────────────
	[ 수정  ] [ 목록 ]
	
	2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
 -->
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardRepository dao = BoardRepository.getInstance();
	BoardVO vo = dao.getBoardById(no);
%>
<c:set value="<%=vo %>" var="bvo"/>

<h1>게시글 수정</h1>
<hr/>
<form action="boardUpdate.jsp?no=${bvo.no }" method="post">
	제목 : <input type="text" name="title" value="${bvo.title }"><br/>
	작성자 : <input type="text" name="writer" value="${bvo.writer }"><br/>
<%-- 	내용 : <input type="text" name="content" value="${bvo.content }"><hr/> --%>
	내용 : <textarea rows="5" cols="30" wrap="soft" name="content">${bvo.content }</textarea><hr/>
	<input type="submit" value="수정">
	<a href="boardList.jsp"><input type="button" value="목록"></a>
</form>
</body>
</html>