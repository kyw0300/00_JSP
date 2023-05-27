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
</head>
<body>

<c:set value="${param.error }" var="err"/>
<c:set value="${cnt }" var="cnt"/>

<c:if test="${cnt eq '1' }">
	<script type="text/javascript">
		alert("회원가입 성공!!");
	</script>
</c:if>

<h2>로그인</h2>

<div class="col-xs-2">
<form action="${pageContext.request.contextPath }/memLogin.do" method="post" name="loginForm">
	아이디 : <input type="text" class="form-control" name="id"><br/>
	비밀번호 : <input type="text" class="form-control" name="pw"><br/><br/>
	<c:if test="${err == '1' }">
		<p style="font-size:12px; color:red;">** 존재하지 않는 회원입니다.</p>
	</c:if>
	<br/>
	<input type="submit" value="로그인" id="loginBtn">
	<a href="${pageContext.request.contextPath }/joinPage.do"><input type="button" value="회원가입"></a>
</form>
</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(function(){
	var loginBtn = $("#loginBtn");
	
	loginBtn.on("click",function(){
		event.preventDefault();
		console.log("로그인 시도");
		
		var id = $("input[name=id]").val();
		var pw = $("input[name=pw]").val();
		
		if(id == null || id == "") {
			alert("아이디를 입력해주세요!");
			$("input[name=id]").focus();
			return false;
		}
		if(pw == null || pw == "") {
			alert("비밀번호를 입력해주세요!");
			$("input[name=pw]").focus();
			return false;
		}
		
		$("form[name=loginForm]").submit();
	})
})

</script>
</html>