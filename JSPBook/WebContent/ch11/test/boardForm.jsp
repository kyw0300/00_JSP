<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시판 등록 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 
	작성자 : 
	내용 :
	─────────────────────────────
	첨부파일 : [파일 선택 ]
	─────────────────────────────
	[ 등록  ] [ 목록  ]
	
	2. 등록 버튼 클릭 시, 게시글 등록(boardInsert.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 게시판 목록 페이지(boardList.jsp)로 이동해주세요

 -->
<h1>게시글 등록</h1>
<form action="boardInsert.jsp" name="insertForm" method="post" enctype="multipart/form-data">
제목 : <input type="text" name="title"><br/>
작성자 : <input type="text" name="writer"><br/>
<!-- 내용 : <input type="text" name="content"><br/> -->
내용 : <textarea rows="5" cols="30" wrap="soft" placeholder="내용을 입력해주세요." name="content"></textarea><br/>
첨부파일 : <input type="file" name="filename"><br/>
<input type="submit" value="등록">
<a href="boardList.jsp"><input type="button" value="목록"></a>
</form>
</body>
</html>