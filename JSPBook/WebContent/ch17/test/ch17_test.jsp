<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                                    	JSTL이 제공하는 태그의 종류와 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
								<!-- 
									문제)
									이름은 이와같이 넣는다.
									> 홍길동,홍길순,유재석,정형돈,...
									
									406호 전원의 이름을 ','로 구분하여 각각 나눈 후,
									아래와 같이 출력해주세요!
									----------------------------------------------
									'김'씨 성을 가진 사람 몇 명: 3 
									'박'씨 성을 가진 사람 몇 명: 4 
									'이'씨 성을 가진 사람 몇 명: 5
									...
									...
									----------------------------------------------
									[출력 예]
									
									** 406호 전원의 이름을 넣을 때 스크립틀릿을 활용해도 무관
									      또는 JSTL로 바로 값을 넣어도 무방
									1. JSTL을 이용하여 작성해주세요.
								 -->
									<c:set value="전지혜,김현근,이지영,김지완,신국현,이성일,고영우,정재균,황지현,박윤수,변정민,정은지,박정수,조성희,김민정,박승우,김동혁,이수진,홍기태,김민욱,진현성,오미나,구기현,오대환,전다미,배문기,유이현" var="names"/> 	
								 	<c:set value="${names }" var="str406"/>
								 	<c:set value="${fn:split(names,',')}" var="arr406"/>
<%-- 								 	<c:out value="${fn:join(str406,'-')}"/> --%>

								 	<c:set value="0" var="kim"/>
								 	<c:set value="0" var="e"/>
								 	<c:set value="0" var="park"/>
								 	<c:set value="0" var="oh"/>
								 	<c:set value="0" var="ko"/>
								 	<c:set value="0" var="etc"/>
								 	
								 	** 406호 학생들 **<br/>
								 	<c:forEach items="${arr406}" var="name" varStatus="stat">
								 		<c:out value="${name}"/>
<%-- 								 		<c:out value="${fn:substring(name,0,1)}"/> --%>
									 	<c:choose>
									 		<c:when test="${fn:substring(arr406[stat.index],0,1) eq '김'}">
										 		<c:set value="${kim+1}" var="kim"/>
									 		</c:when>
									 		<c:when test="${fn:substring(arr406[stat.index],0,1) eq '이'}">
										 		<c:set value="${e+1}" var="e"/>
									 		</c:when>
									 		<c:when test="${fn:substring(name,0,1) eq '박'}">
										 		<c:set value="${park+1}" var="park"/>
									 		</c:when>
									 		<c:when test="${fn:substring(name,0,1) eq '오'}">
										 		<c:set value="${oh+1}" var="oh"/>
									 		</c:when>
									 		<c:when test="${fn:substring(name,0,1) eq '고'}">
										 		<c:set value="${ko+1}" var="ko"/>
									 		</c:when>
									 		<c:otherwise>
										 		<c:set value="${etc+1}" var="etc"/>
									 		</c:otherwise>
									 	</c:choose>
								 	</c:forEach>
								 	<br/><br/>
								 	김씨 성을 가진 사람 : ${kim} 명<br/>
								 	이씨 성을 가진 사람 : ${e} 명<br/>
								 	박씨 성을 가진 사람 : ${park} 명<br/>
								 	오씨 성을 가진 사람 : ${oh} 명<br/>
								 	고씨 성을 가진 사람 : ${ko} 명<br/>
								 	기타 성을 가진 사람 : ${etc} 명<br/>
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
</html>