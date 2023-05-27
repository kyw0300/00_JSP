<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
	<%
		String Shopping_cartId = "";
		String Shopping_name = "";
		String Shopping_shoppingDate = "";
		String Shopping_country = "";
		String Shopping_zipCode = "";
		String Shopping_addressName = "";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("Shopping_cartId")) {
					Shopping_cartId = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
				if(n.equals("Shopping_shoppingDate")) {
					Shopping_shoppingDate = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
			}
		}
	%>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은	<%out.println(Shopping_shoppingDate);%>에 배송될 예정입니다!!	
		<p>주문번호 : <%out.println(Shopping_cartId);%>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
	</div>
	<%
		session.invalidate();
		
		for(int j=0; j<cookies.length; j++) {
			Cookie tCookie = cookies[j];
			String n = tCookie.getName();
			
			if(n.equals("Shopping_cartId")) {
				tCookie.setMaxAge(0);
			}
			if(n.equals("Shopping_name")) {
				tCookie.setMaxAge(0);
			}
			if(n.equals("Shopping_shoppingDate")) {
				tCookie.setMaxAge(0);
			}
			if(n.equals("Shopping_country")) {
				tCookie.setMaxAge(0);
			}
			if(n.equals("Shopping_zipCode")) {
				tCookie.setMaxAge(0);
			}
			if(n.equals("Shopping_addressName")) {
				tCookie.setMaxAge(0);
			}
			
			response.addCookie(tCookie);
		}
	%>
</body>
</html>