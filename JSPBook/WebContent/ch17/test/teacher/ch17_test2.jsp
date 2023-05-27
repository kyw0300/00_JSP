<%@page import="java.util.HashMap"%>
<%@page import="com.sun.javafx.collections.MappingChange.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
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
    <link href="${pageContext.request.contextPath }/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
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
                                	<c:set value="홍길동,홍길순,유재석,정형돈,정준하,하동훈,박명수,길성준,노홍철" var="names"/>
                                	<c:set value="${fn:split(names, ',') }" var="name"/>
                                	
                                	<%
                                		List<String> list = new ArrayList<String>();
                                		String[] names = {"홍길동","홍길순","유재석","정형돈","정준하","하동훈","박명수"," 길성준","노홍철"};
                                		for(int i = 0; i<names.length; i++){
                                			list.add(names[i]);
                                		}
                                		
                                		HashMap<String, Integer> map = new HashMap<String, Integer>();
                                	%>
                                	<c:set value="<%=map %>" var="map"/>
                                	<c:forEach items="<%=list %>" var="item">
                                		<c:out value="${item }"/>
                                	</c:forEach>
                                	
                                	<c:forEach items="<%=list %>" var="item">
                                		<c:choose>
                                			<c:when test="${map.get(fn:substring(item,0,1)) == null }">
                                				${map.put(fn:substring(item,0,1), 1) }
                                			</c:when>
                                			<c:otherwise>
                                				${map.put(fn:substring(item,0,1), map.get(fn:substring(item,0,1)) + 1) }	
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                	
                                	<c:forEach items="<%=map.keySet() %>" var="item">
                                		<c:out value="${item }"/>씨 성을 가진 사람 수 : ${map.get(item) } 명
                                	</c:forEach>
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




