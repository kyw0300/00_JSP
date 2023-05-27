<%@page import="ch11.test.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	1. 게시글 상세보기를 출력해주세요.
		> JSTL을 활용해주세요. 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	[ 수정  ] [ 삭제  ] [ 목록  ]
	
	2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
	3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
	4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
 -->
<%
 	String no = request.getParameter("no");
	int index = Integer.parseInt(no);
 	BoardRepository dao = BoardRepository.getInstance();
 	ArrayList<BoardVO> listOfBoard = dao.selectBoardList();
 	
 	BoardVO detailVO = listOfBoard.get(index-1); // 아래 for문이 필요없어짐
 	dao.plusHit(detailVO);
 	String content = detailVO.getContent();
 	String nContent = content.replaceAll("\n", "<br/>");
%>

<c:set value="<%=no %>" var="no"/>
<c:set value="<%=listOfBoard %>" var="bList"/>
<c:set value="<%=nContent %>" var="nContent"/>

<h1>게시판 상세보기</h1>
<hr/>

<c:forEach items="${bList }" var="board">
	<c:if test="${board.no == no}">
		<c:set value="${board }" var="boardVO"/>
		글 번호 : <c:out value="${board.no }"/>번<br/>
		제목 : <c:out value="${board.title }"/><br/>
		작성자 : <c:out value="${board.writer }"/><br/>
		작성일 : <c:out value="${board.regDate }"/><br/>
		조회수 : <c:out value="${board.hit }"/>회
		<hr/>
		내용>
		<br/>
		${nContent }
		<hr/>
		파일 이름 : <c:out value="${board.fileName }"/><br/>
		contentType : <c:out value="${board.contentType }"/><br/>
	</c:if>
</c:forEach>


<input type="button" value="수정" id="updateBtn" onclick="updateBoard()">
<input type="button" value="삭제" id="deleteBtn" onclick="deleteBoard()">
<a href="boardList.jsp"><input type="button" value="목록"></a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
function updateBoard(){
	window.location.href = "boardUpdateForm.jsp?no="+${boardVO.no};
}

function deleteBoard(){
	if (confirm("정말로 삭제하시겠습니까??") == true) {    //확인
		window.location.href = "boardRemove.jsp?no="+${boardVO.no};
	} else {   //취소
		return false;
	}
}
</script>
</body>
</html>