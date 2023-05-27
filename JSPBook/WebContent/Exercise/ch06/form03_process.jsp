<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String[] fruit = request.getParameterValues("fruit");
	
%>
<h3>선택한 과일</h3>
<%
	for(int i=0; i<fruit.length; i++) {
%>
	<%=fruit[i] %>&nbsp;
<%
	}
%>