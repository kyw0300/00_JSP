<%@page import="kr.or.ddit.vo.BoardVO"%>
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
h2{
	margin: 10px;
}
#update_div{
	width: 70%;
}
td:first-child{
	width: 200px;
	font-weight: bold;
	padding-left: 10px;
}
</style>
</head>
<body>

<c:set value="${detailVO }" var="detailVO"/>

<h2>${detailVO.bo_no }번 게시판 수정</h2>
<!-- 왜 post로 해줘야만 bo_no가 넘어가는지? -->
<div id="update_div">
<form action="${pageContext.request.contextPath }/updateBoard.do?bo_no=${detailVO.bo_no }" method="post"
		enctype="multipart/form-data">
<table class="table">
	<tr>
		<td>제목</td>
		<td><input type="text" value="${detailVO.bo_title }" name="title"></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${detailVO.bo_writer }</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${detailVO.bo_regdate }</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${detailVO.bo_hit }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="5" cols="30" name="content">${detailVO.bo_content }</textarea></td>
	</tr>
	<tr>
		<td>파일 업로드</td>
		<td>
			<input type="file" name="upFile1" multiple><br/>
		</td>
	</tr>
</table>
<a><input type="submit" value="수정" id="updateBtn"></a>
<a href="${pageContext.request.contextPath }/detailBoard.do?bo_no=${detailVO.bo_no }"><input type="button" value="뒤로가기"></a>
</form>
</div>
</body>
</html>