<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	
	StringBuffer sb = new StringBuffer(name);
	StringBuffer sb1 = new StringBuffer(addr);
	StringBuffer sb2 = new StringBuffer(email);
%>
아이디 : <%=sb.toString()%><br/>
주소 : <%=sb1.toString()%><br/>
이메일 : <%=sb2.toString()%>