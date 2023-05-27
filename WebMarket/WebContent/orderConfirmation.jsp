<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="vo.Product"%>
<%@ page import="dao.ProductRepository"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("UTF-8");
		String cartId = session.getId();
		
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
				if(n.equals("Shopping_name")) {
					Shopping_name = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
				if(n.equals("Shopping_shoppingDate")) {
					Shopping_shoppingDate = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
				if(n.equals("Shopping_country")) {
					Shopping_country = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
				if(n.equals("Shopping_zipCode")) {
					Shopping_zipCode = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
				if(n.equals("Shopping_addressName")) {
					Shopping_addressName = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
			}
		}
		
	%>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 : <%out.println(Shopping_name); %><br> 
				우편번호 : <%out.println(Shopping_zipCode);%><br> 
				주소 : <%out.println(Shopping_addressName);%>(<%out.println(Shopping_country);%>)<br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>배송일: <%out.println(Shopping_shoppingDate);%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if(cartList == null) {
					cartList = new ArrayList<Product>();
				}
				
				for(int i=0; i<cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total; // 총액 계산
				
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname()%> </em></td>
				<td class="text-center"><%=product.getQuantity()%></td>
				<td class="text-center"><%=product.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> </strong></td>
			</tr>
			</table>			
				<a href="./shoppingInfo.jsp?cartId=<%=Shopping_cartId %>"class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp?cartId=<%=Shopping_cartId %>"  class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			
		</div>
	</div>	
</body>
</html>
