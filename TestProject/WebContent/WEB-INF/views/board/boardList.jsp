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
<style type="text/css">
#search_div,#listTable,h2,h5,#page_div1{
	margin: 10px;
}
#search_div{
	width: 70%;
	display: flex;
    justify-content: space-between;
}
#listTable,#page_div1{
	width: 70%;
}
th,td,#page_div1{
	text-align: center;
}
ul{
	justify-content: center;
}
li{
	display: inline-block;
}
</style>
</head>
<body>
	<c:if test="${param.updateCnt eq '1'}">
		<script type="text/javascript">
			alert("게시글 수정 성공!!");
		</script>
	</c:if>
	<c:if test="${param.deleteCnt eq '1'}">
		<script type="text/javascript">
			alert("게시글 삭제 성공!!");
		</script>
	</c:if>
	<c:if test="${param.insertCnt eq '1'}">
		<script type="text/javascript">
			alert("게시글 등록 성공!!");
		</script>
	</c:if>

<c:set value="${sessionScope.loginVO }" var="loginVO"/>
<c:set value="${boardList }" var="bList"/>

<c:set var="page" value="${empty param.page ? '1' : param.page }"/>
<c:set var="startPage" value="${page-(page-1)%5}"/>
<c:set var="lastPage" value="${fn:substringBefore(Math.ceil(cnt/5),'.')}"/>

<h2>게시판 목록</h2>
<h5>${loginVO.mem_name }님 환영합니다!</h5>

<div id="search_div">
	<div>
		<form action="${pageContext.request.contextPath }/boardList.do" method="get">
			<select name="field">
				<option value="bo_title" ${param.field eq 'bo_title'?'selected':'' }>제목</option>
				<option value="bo_writer" ${param.field eq 'bo_writer'?'selected':'' }>작성자</option>
			</select>
			<input type="text" name="searchWord" value="${param.searchWord }">
			<input type="submit" value="검색" class="btn btn-outline-primary btn-sm" style="margin-bottom:2px;">
		</form>
	</div>
	<div>
		<a href="${pageContext.request.contextPath }/insertBoardPage.do?id=${loginVO.mem_id}"><input type="button" value="글 등록" class="btn btn-outline-primary btn-sm"></a>
		<input type="button" class="btn btn-outline-primary btn-sm" value="로그아웃" onclick="logout()">
	</div>
</div>
<table class="table table-bordered table-hover" id="listTable">
	<thead class="table-primary">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${!empty bList }">
			<c:forEach items="${bList }" var="board">
				<tr>
					<td>${board.bo_no }</td>
					<td><a href="${pageContext.request.contextPath }/detailBoard.do?bo_no=${board.bo_no }">${board.bo_title }</a></td>
					<td>${board.bo_writer }</td>
					<td>${board.bo_regdate }</td>
					<td>${board.bo_hit }</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5">조회하실 게시글이 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>
<div id="page_div1">
		<ul class="pagination pagination-sm">
		
			<li class="page-item">
			<c:if test="${startPage > 1 }">
				<a class="page-link" href="?page=${startPage-1}&field=${param.field}&searchWord=${param.searchWord}">이전</a>
			</c:if>
			<c:if test="${startPage <= 1 }">
				<a class="page-link" onclick="alert('이전 페이지가 없습니다!')">이전</a>
			</c:if>
			</li>
			
				<c:forEach begin="0" end="4" var="i">
					<li class="page-item">
						<c:if test="${(startPage + i) <= lastPage}">
							<a class="page-link ${page eq (startPage+i) ? 'active':''}" href="?page=${startPage + i}&field=${param.field}&searchWord=${param.searchWord}">${startPage + i}</a>
						</c:if>
					</li>
				</c:forEach>
				
			<li class="page-item">
			<c:if test="${startPage+5 <= lastPage}">
				<a class="page-link" href="?page=${startPage+5}&field=${param.field}&searchWord=${param.searchWord}">다음</a>
			</c:if>
			<c:if test="${startPage+5 > lastPage}">
				<a class="page-link" onclick="alert('다음 페이지가 없습니다!')">다음</a>
			</c:if>
			</li>
		</ul>
</div>

<div>

</div>
<script type="text/javascript">
function logout(){
	window.location.href = "${pageContext.request.contextPath }/logout.do";
}
</script>
</body>
</html>