<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	input 태그의 기능과 사용법(form)
                                    </h6>
                                </div>
                                <div class="card-body">
                                <h3>javascript 버전</h3>
                                	<form action="" name="loginForm" method="post">
                                		아이디 : <input type="text" name="id"><br/>
                                		비밀번호 : <input type="text" name="pw"><br/>
                                		<input type="submit" value="전송" onclick="Checkform()"/>
                                	</form>
                                	
                                <hr/>
                                	
                                <h3>jquery 버전</h3>
                                	<form action="" method="post" id="loginForm2">
                                		아이디 : <input type="text" name="id2"><br/>
                                		비밀번호 : <input type="text" name="pw2"><br/>
                                		<input type="submit" value="전송" id="submitBtn"/>
                                	</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!--     <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script> -->
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
<script type="text/javascript">
function Checkform(){
	alert("아이디 : " + document.loginForm.id.value + "\n" + 
			"비밀번호 : " + document.loginForm.pw.value);
	// 입력한 아이디, 비밀번호가 alert 창으로 나타나고 뒤이어 submit 이벤트가 발생한다.
}

// jquery 선언
$(function(){
	var submitBtn = $("#submitBtn");	// 전송 버튼  element 얻어오기
	var loginForm2 = $("#loginForm2");	// 전송 버튼  element 얻어오기
	
	// 방법1
// 	submitBtn.on("click", CheckFormJquery);
	
// 	function CheckFormJquery(){
// 		alert("아이디 : " + $("input[name=id2]").val() + "\n" + 
// 				"비밀번호 : " + $("input[name=pw2]").val());
// 	}

	// 방법2
// 	submitBtn.on("click",function(event){
// 		event.preventDefault();	// 입력값이 남아있게 해준다.
// 		console.log("방법2를 이용한 submitBtn 클릭...!")
		
// 		alert("아이디 : " + $("input[name=id2]").val() + "\n" + 
// 			    "비밀번호 : " + $("input[name=pw2]").val());
// 	});
	
	// 방법3
	loginForm2.submit(function(){
		event.preventDefault();
		console.log("loginForm2 submit event...!")
		
		if($("#id2").val() == "") {
			alert("아이디 : " + $("input[name=id2]").val() + "\n" + 
				    "비밀번호 : " + $("input[name=pw2]").val());
			return false;			
		} else {
			alert("아이디 : " + $("input[name=id2]").val() + "\n" + 
				    "비밀번호 : " + $("input[name=pw2]").val());
			return false;
		}
		
		loginForm2.submit();	// 둘 중 하나 선택 가능
// 		$(this).submit();
	});
})
</script>
</html>