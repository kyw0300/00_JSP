<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                                    	taglib 디렉티브 태그의 기능과 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
                                	<h5>1. 변수 k가 1부터 10까지 1씩 증가하도록 JSTL의 Core태그 반복문을 작성</h5>
                                	<c:forEach var="i" begin="1" end="10" step="1">
                                		<c:out value="${i}"/>
                                	</c:forEach>
                                	<br/><br/>
                                	
                                	<p># 짝수 일때만 출력</p>
                                	<c:forEach var="j" begin="1" end="10" step="1">
                                		<c:if test="${j % 2 ==0}">
	                                		<c:out value="${j}"/>
                                		</c:if>
                                	</c:forEach>
                                	<br/><br/>
                                	<hr/>
                                	
                                	<h5>2. 스크립틀릿과 표현문/JSTL을 통해 str출력</h5>
                                	<p># 스크립틀릿으로 선언</p>
                                	<%
                                		String str = "스크립틀릿으로 선언한 짱구할아버지";
                                	%>
                                	<%=str %>
                                	<br/><br/>
                                	
                                	<p># JSTL의 Core 태그 out으로 선언</p>
                                	<c:set value="Core태그로 선언한 짱구할아버지" var="str"/>
                                	<c:out value="${str}"/>
                                	<br/><br/>
                                	<hr/>
                                	
                                	<h5>3. 스크립틀릿과 표현문/JSTL을 통해 Collection 출력</h5>
                                	<p># 스크립틀릿으로 선언</p>
                                	<%
                                		List<String> list = new ArrayList<String>();
                                		list.add("개똥이");
                                		list.add("김철수");
                                		list.add("메뚜기");
                                	%>
                                	<%=list %>
                                	<br/><br/>
                                	
                                	<p># JSTL의 Core 태그 forEach를 통해 Collection 출력</p>
                                	<c:forEach items="<%=list %>" var="item" varStatus="stat">
                                		<p>[count : ${stat.count } / index : ${stat.index }] - ${item }</p>
                                	</c:forEach>
                                	<br/><br/>
                                	<hr/>
                                	
                                	<h5>4. JSTL을 통해 범위 내 값 출력</h5>
                                	<c:set value="5000" var="money" scope="page"/>
                                	<p>내가 가진 돈은 ${money }원 입니다.</p>
                                	<c:choose>
                                		<c:when test="${money <= 0 }">
											무일푼
                                		</c:when>
                                		<c:when test="${money >= 5000 and money <= 10000 }">
											커피 한잔의 여유 가능
                                		</c:when>
                                		<c:otherwise>
                                			밥먹자!
                                		</c:otherwise>
                                	</c:choose>
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

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>