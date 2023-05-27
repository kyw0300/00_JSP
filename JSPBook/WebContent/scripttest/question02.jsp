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
flag = 0;
target1 = "";
target2 = "";
n1 = "";
n2 = "";

	$('td').on('click',function(){
		if(flag == 1) {
			flag = 0;
			target2 = $(this);
			n2 = target2.text();
// 			console.log("n2",n2);
			
			temp = n1;
			n1 = n2;
			n2 = temp;
			
// 			console.log("n1",n1);
// 			console.log("n2",n2);
			
			target1.text(n1);
			target2.text(n2);
			target1.css('background-color','white');
			
		} else {
			flag = 1;
			target1 = $(this);
			target1.css('background-color','yellow');
			n1 = target1.text();
// 			console.log("n1",n1);
// 			console.log(flag);
		}
	})
	
	$('#print').bind('click',function(){
// 		console.log("printBtn");

		result = "<table border='1'>";
		for(i=0; i<4; i++) {
			result += "<tr>"
			for(j=0; j<9; j++) {
				result += "<td style='width:50px;'>" + $('tr').eq(i).find('td').eq(j).text() + "</td>";
			}
			result += "</tr>";
		}
		result += "</table>";
		
		$('#output').html(result);
	})
})
</script>
<style>
tr{height: 50px;}
td{text-align: center;}
</style>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td></td>
			<td>전지혜</td>
			<td>신현근</td>
			<td>이지영</td>
			<td style="width: 200px;"></td>
			<td>김지완</td>
			<td>신국현</td>
			<td>이성일</td>
			<td></td>
		</tr>
		<tr>
			<td>고영우</td>
			<td>정재균</td>
			<td>황지현</td>
			<td>박윤수</td>
			<td></td>
			<td>변정민</td>
			<td>정은지</td>
			<td>박정수</td>
			<td>조성희</td>
		</tr>
		<tr>
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
		<tr>
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
	
	<hr/>
	<input type="button" value="현재 자리 출력하기" id="print">
	<p id="output">출력란!</p>
</body>
</html>