<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("UTF-8");

		Enumeration paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String name = (String) paramNames.nextElement();
			String paramValue = request.getParameter(name);
			
			out.println(name + " : " + paramValue + "<br/>");
		}
	%>
