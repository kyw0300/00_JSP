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
                                <h3>회원가입</h3>
                                	<form action="validation05_process.jsp" name="member" method="post">
                                		아이디 : <input type="text" name="id"><br/>
                                		비밀번호 : <input type="text" name="pw"><br/>
                                		이름 : <input type="text" name="name"><br/>
                                		연락처 : 
                                			<select name="phone1">
												<option value="010">010</option>	                                			
												<option value="011">011</option>	                                			
												<option value="016">016</option>	                                			
												<option value="017">017</option>	                                			
												<option value="019">019</option>	                                			
                                			</select> - 
                                			<input type="text" name="phone2" size="4" maxlength="4"/> -
                                			<input type="text" name="phone3" size="4" maxlength="4"/><br/>
                                		이메일 : <input type="text" name="email"/><br/>
                                		<input type="button" value="가입" onclick="CheckMember()"/>
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
<!--     <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<!--     <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script> -->
<!--     <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script> -->
</body>
<script type="text/javascript">
function CheckMember(){
	// 1. 아이디는 영문 대문자와 소문자, 한글, 한글의 자음과 모음만 검사하도록 정규 표현식 작성
	var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	
	// 2. 비밀번호는 숫자만 검사하도록 정규 표현식을 작성
	var regExpPasswd = /^[0-9]*$/;
	
	// 3. 이름은 한글만 검사하도록 정규 표현식 작성
	var regExpName = /^[가-힣]*$/;
	
	// 4. 전화번호는 전화번호 형태(숫자)인지 검사하도록 정규 표현식 작성
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/
	
	// 5. 이메일은 이메일 형식인지 검사하도록 정규 표현식 작성
	// 처음 시작이 숫자, 영소대문자이고 특수문자 -_/. 나올수도 있고 안나올수도 있고
	// 그 다음에 숫자, 영소대문자가 0개 이상이 나온다.
	// @ 이메일 형식과 같은 내용을 @를 기준으로 이어서~
	// 숫자, 영소대문자, -_/.이 나올수도 있고 안나올수도 있고 숫자, 영소대문자가 0번 이상 반복
	// .이후 영소대문자 2,3자
	var regExpEmail = /^[0-9a-zA-Z]([-_/.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_/.]?[0-9a-zA-Z]*\.[a-zA-Z]{2,3}$)/i;
	
	// i : Ignore Case, 문자열의 대문자와 소문자를 구별하지 않고 검증합니다.
	// g : Global, 문자열 내의 모든 패턴을 검증합니다.
	// m : MultiLine, 문자열에 줄 바꿈 행이 있는지 검출합니다.
	
	var form = document.member;
	
	var id = form.id.value;
	var pw = form.pw.value;
	var name = form.name.value;
	var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value; // 핸드폰번호
	var email = form.email.value; // 이메일
	
	if(!regExpId.test(id)) {
		alert("아이디는 영문 대문자와 소문자, 한글, 한글의 자음과 모음으로 시작해주세요.");
		form.id.select();
		return false;
	}
	if(!regExpPasswd.test(pw)) {
		alert("비밀번호는 숫자만 입력해주세요!");
		form.pw.select();
		return false;
	}
	if(!regExpName.test(name)) {
		alert("이름은 한글만 입력해주세요!");
		form.name.select();
		return false;
	}
	if(!regExpPhone.test(phone)) {
		alert("연락처 형식에 맞춰 입력해주세요!");
		return false;
	}
	if(!regExpEmail.test(email)) {
		alert("이메일 형식에 맞춰 입력해주세요!");
		form.email.select();
		return false;
	}
	
	form.submit();
}
</script>
</html>