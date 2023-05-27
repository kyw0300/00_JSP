<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
h2,#insert_div{
	margin-left: 10px;
}
#insert_div{
	width: 70%;
}
</style>
</head>
<body>
<c:set value="${sessionScope.loginVO }" var="loginVO"/>

<h2>게시판 등록</h2>
<div id="insert_div">
	<form action="${pageContext.request.contextPath }/insertBoard2.do?id=${loginVO.mem_id }" method="post" enctype="multipart/form-data">
		제목 : <input class="form-control" type="text" name="title" placeholder="작성할 제목을 입력하세요">
		내용 : <textarea class="form-control" rows="5" cols="30" name="content" placeholder="작성할 내용을 입력하세요"></textarea><br/>
		파일 업로드 : <input type="file" name="upFile1" multiple>
		<br/><br/>
		<input type="submit" class="btn btn-outline-primary btn-sm" value="등록">
		<a href="${pageContext.request.contextPath }/boardList.do"><input type="button" class="btn btn-outline-primary btn-sm" value="목록"></a>
	</form>
</div>
</body>
</html>