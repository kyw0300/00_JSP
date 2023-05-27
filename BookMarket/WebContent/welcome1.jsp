<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%!
		String greeting = "도서 웹 쇼핑몰";
		String tagline = "Welcome to Book Market!";
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline %>
			</h3>
			
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>