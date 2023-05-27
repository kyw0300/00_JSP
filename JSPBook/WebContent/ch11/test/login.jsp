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
		1. 로그인 페이지를 작성해주세요.
		** 아래 처럼 만들어주세요.
		아이디 : _________
		비밀번호 : __________
		[  로그인   ]
		
		2. 로그인 처리는 login_process.jsp 로 요청해주세요.
		> 회원가입을 진행하지 않고, 특정 아이디/비밀번호를 정해서 로그인 처리해주세요.
	 -->
	<h1>로그인</h1>
	<form action="login_process.jsp" method="post">
		아이디 : <input type="text" name="id"/><br/>
		비밀번호 : <input type="text" name="pw"/><br/>
		<input type="submit" value="로그인">
	</form>
</body>
</html>