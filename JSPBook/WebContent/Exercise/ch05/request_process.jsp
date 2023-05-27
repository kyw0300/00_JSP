<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	String login = request.getQueryString();
	out.println("전송된 요청 파라미터 : " + request.getQueryString());
%>