<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setHeader("Refresh", "5");
	
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sim = new SimpleDateFormat("HH:mm:ss a");
		String a = sim.format(cal.getTime());
	%>
	현재 시간은 <%=a %>
	<br/><br/>
	<a href="response_data.jsp">Google 홈페이지로 이동하기</a>
</body>
</html>