<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
h2{
	margin: 10px;
}
#detail_div{
	width: 70%;
}
#conTd{
	width: 200px;
}
td:first-child{
	font-weight: bold;
	padding-left: 10px;
}
.uploadFile{
	 color:blue;
	 text-decoration-line: none;
	 font-weight: bold;
}
</style>
</head>
<body>

<c:set value="${sessionScope.loginVO }" var="loginVO"/>
<c:set value="${loginVO.mem_id }" var="loginID"/>

<c:set value="${detailVO }" var="detailVO"/>
<c:set value="${detailVO.bo_writer }" var="bo_writer"/>

<h2>${detailVO.bo_no }번 게시판 상세정보</h2>

<div id="detail_div">
<table class="table">
	<tr>
		<td>제목</td>
		<td>${detailVO.bo_title }</td>
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
		<td id="conTd">내용</td>
		<td>${detailVO.bo_content}</td>
<%-- 		<td>${fn:replace(detailVO.bo_content,'\\n','<br/>')}</td> --%>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<c:if test="${empty detailVO.bo_fileNames }">
				첨부파일이 없습니다.
			</c:if>
			<c:forTokens items="${detailVO.bo_fileNames }" delims="," var="fileName" varStatus="stat">
				<a href="${pageContext.request.contextPath }/fileDownload.do" class="uploadFile">${fileName}</a>
				<c:if test="${not stat.last }">
					/
				</c:if>
			</c:forTokens>
		</td>
	</tr>
</table>
<a><input type="button" value="수정" id="updateBtn" class="btn btn-outline-primary btn-sm"></a>
<a><input type="button" value="삭제" id="DeleteBtn" class="btn btn-outline-primary btn-sm"></a>
<a href="${pageContext.request.contextPath }/boardList.do"><input type="button" value="목록" 
		class="btn btn-outline-primary btn-sm"></a>
</div>

<script>
$(function(){
	$('#updateBtn').on('click',function(){
		if('${loginID}' != '${bo_writer}') {
			alert("수정 권한이 없습니다!");
			return false;
		}
		window.location.href = '${pageContext.request.contextPath }/updateBoardPage.do?bo_no=${detailVO.bo_no }';
	})
	
	$('#DeleteBtn').on('click',function(){
		if('${loginID}' != '${bo_writer}') {
			alert("삭제 권한이 없습니다!");
			return false;
		}
		window.location.href = '${pageContext.request.contextPath }/deleteBoard.do?bo_no=${detailVO.bo_no }';
	})
})
</script>
</body>
</html>