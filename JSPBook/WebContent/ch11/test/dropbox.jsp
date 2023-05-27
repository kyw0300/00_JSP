<%@page import="ch11.test.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
<!-- 
	첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.
	- 자료실을 구성하는데 필요한 내용 모두는 board를 작성했던 방식을 참고하여 작성한다.
	
	1. 파일의 유형에 따라 유형에 맞는 default 이미지로 리스트를 구성하세요.
	
	[출력 예]
	
	자료실
	[pdf]	[excel]	[excel]	[ppt]
	[image] [txt]	[word]	[txt]
	[etc]	[etc]	[pdf]	[ppt]
	[...]
	
	목록 
 -->
<h1>자료실</h1>
<%
	BoardRepository dao = BoardRepository.getInstance();
	ArrayList<BoardVO> listOfBoard = dao.selectBoardList();
	
	if(listOfBoard == null || listOfBoard.size() == 0) {
%>
		<h3>저장된 파일 목록이 하나도 없습니다.</h3>
<%		
	} else {
		for(BoardVO vo : listOfBoard) {
		
			if(vo.getContentType().equals("text/plain")) {
%>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/txt.png">
				<%=vo.getFileName() %><br/><br/>
<%
			} else if(vo.getContentType().equals("application/pdf")) {
%>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/pdf.png">
				<%=vo.getFileName() %><br/><br/>
<%			
			} else if(vo.getContentType().equals("image/jpeg")) {
%>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/image-gallery.png">
				<%=vo.getFileName() %><br/><br/>
<%
			} else if(vo.getContentType().equals("application/haansoftpptx")) {
%>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/ppt.png">
				<%=vo.getFileName() %><br/><br/>
<%			
			} else if(vo.getContentType().equals("application/haansoftxlsx")) {
%>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/excel.png">
				<%=vo.getFileName() %><br/><br/>
<%			
			} else if(vo.getContentType().equals("application/haansoftdocx")) {
%>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/word.png">
				<%=vo.getFileName() %><br/><br/>
<%			
			} else {
%>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/more.png">
				<%=vo.getFileName() %><br/><br/>
<%			
			}
		}
	}
%>
<br/>
<a href="menu.jsp"><input type="button" value="메뉴"></a>
</body>
</html>