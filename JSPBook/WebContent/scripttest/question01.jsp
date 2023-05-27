<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	function click(obj){
		var value = $(obj).html();
		console.log(value)
		
		$('#output').text(value);
	}
	
	$('td').on('click',function(){
		click(this);
	})
})
</script>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<tr>
			<td>10</td>
			<td>네이버윅스 비정기 업데이트 소식</td>
			<td>관리자</td>
			<td>2022-11-16</td>
			<td>1455</td>
		</tr>
		<tr>
			<td>9</td>
			<td>[프로모션 공지]네이버윅스 X 워크플레이스 결합 서비스</td>
			<td>관리자</td>
			<td>2022-11-15</td>
			<td>1420</td>
		</tr>
		<tr>
			<td>7</td>
			<td>[중요] 네이버윅스 v3.5 정기 업데이트 소식</td>
			<td>관리자</td>
			<td>2022-11-14</td>
			<td>12000</td>
		</tr>
		<tr>
			<td>6</td>
			<td>[프로모션 사전 공지] 네이버윅스 X 워크플레이스 결합 서비스 20% 추가 할인</td>
			<td>관리자</td>
			<td>2022-11-13</td>
			<td>1111</td>
		</tr>
		<tr>
			<td>5</td>
			<td>드라이브 서비스DB 업그레이드 작업 사전 안내</td>
			<td>관리자</td>
			<td>2022-11-12</td>
			<td>2345</td>
		</tr>
	</table>
	
	<hr/>
	<h3>선택한 td안에 있는 글자를 아래 p태그에 출력해주세요!</h3>
	<p id="output">출력란!</p>
</body>
</html>