<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
exception 내장 객체 변수<br/>
<%
	exception.printStackTrace(new PrintWriter(out));
%>
<hr/>
<br/>
<a href="/main.jsp">메인화면</a>