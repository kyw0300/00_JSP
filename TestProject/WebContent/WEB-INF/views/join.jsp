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
<h1>회원가입</h1>

<form action="${pageContext.request.contextPath }/memJoin.do" method="post" id="joinForm" name="joinForm">
	아이디 : <input type="text" name="id"><br/>
	비밀번호 : <input type="text" name="pw"><br/>
	이름 : <input type="text" name="name"><br/>
	<input type="submit" value="등록" id="joinBtn">
	<a href="${pageContext.request.contextPath }/main.do"><input type="button" value="뒤로가기"></a>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(function(){
	var joinBtn = $("#joinBtn");
	
// 	joinForm.submit(function(){ 로하면 왜 무한루프?
	joinBtn.on("click",function(){
		event.preventDefault();
		console.log("joinForm submit event...!")
		
		var id = $("input[name=id]").val();
		var pw = $("input[name=pw]").val();
		var name = $("input[name=name]").val();
		
		
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
		if(name == null || name == "") {
			alert("이름을 입력해주세요!");
			$("input[name=name]").focus();
			return false;
		}
		
		$("form[name=joinForm]").submit();
	});
})
</script>
</body>
</html>