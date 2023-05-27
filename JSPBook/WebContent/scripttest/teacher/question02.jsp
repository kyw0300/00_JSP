<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
	<caption>앞(SEM PC 자리)</caption>
	<table width="100%" border="1" style="text-align:center; font-size:24px;">
		<tr width="100%" height="80px">
			<td width="10%"></td>
			<td width="10%">전지혜</td>
			<td width="10%">신현근</td>
			<td width="10%">이지영</td>
			<td width="20%"></td>
			<td width="10%">김지완</td>
			<td width="10%">신국현</td>
			<td width="10%">이성일</td>
			<td width="10%"></td>
		</tr>
		<tr height="80px">
			<td>고영우</td>
			<td>정재균</td>
			<td>황지현</td>
			<td>박윤수</td>
			<td></td>
			<td>번정민</td>
			<td>정은지</td>
			<td>박정수</td>
			<td>조성희</td>
		</tr>
		<tr height="80px">
			<td>김민정</td>
			<td>박승우</td>
			<td>김동혁</td>
			<td>이수진</td>
			<td></td>
			<td>홍기태</td>
			<td>김민욱</td>
			<td>진현성</td>
			<td>오미나</td>
		</tr>
		<tr height="80px">
			<td></td>
			<td>구기현</td>
			<td>오대환</td>
			<td>전다미</td>
			<td></td>
			<td>배문기</td>
			<td>유이현</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<hr/><br/>
	<button type="button" id="clickBtn">현재 자리 출력하기</button>
	<div id="output"></div>
</body>
<script type="text/javascript">
$(function(){
	var textBox = "";	// 텍스트 저장 공간
	var elementBox;		// Element 저장 공간
	var flag = false;	// 스위칭 역할 담당(첫번째 클릭/두번째 클릭)
	
	$("td").on("click", function(){
		if(flag){	// 두번째 요소가 클릭됐을때
			flag = false;	// 두번째 요소가 클릭됨!
			
			// 첫번째 요소와 두번째 요소의 값과 엘리멘트가 서로 바뀐다
			elementBox.html($(this).html());
			$(this).html(textBox);
			
			textBox = "";
			elementBox = null;
			$("td").css("background-color", "white");
		}else{		// 첫번째 요소가 클릭됐을때
			flag = true;	// 첫번째 요소가 클릭됨!
			textBox = $(this).html();
			elementBox = $(this);
			$(this).css("background-color", "yellow");
		}
	});
	
	$("#clickBtn").on("click", function(){
		$("#output").html("");	// 초기화
		
		var tds = document.getElementsByTagName("td");
		var html = "<table border=''>";
		
		html += "<tr>";
		for(var i = 1; i <= tds.length; i++){
			html += "<td width='10%'>" + tds[i-1].innerText + "</td>";
			if(i % 9 == 0){
				html += "</tr><tr>";
			}
		}
		html += "</tr>";
		html += "</table>";
		
		$("#output").html(html);
	});
});
</script>
</html>





















