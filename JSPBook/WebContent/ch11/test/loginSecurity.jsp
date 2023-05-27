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
	1. 시큐리티 보호자원 이동 시, 인증 페이지를 작성해주세요.
	
	[출력 예시]
	아이디 : ________
	비밀번호 : _________
	[ 로그인  ]
 -->
<h2>관리자 확인</h2>
	<form action="j_security_check" method="post" name="loginForm">
		아이디 : <input type="text" name="j_username"/><br/>
		비밀번호 : <input type="text" name="j_password"/><br/>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>