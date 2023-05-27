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

	$('.dtext').on('click',function(){
		if(flag == 1) {
			flag = 0;
			target2 = $(this);
			n2 = target2.text();
			
			temp = n1;
			n1 = n2;
			n2 = temp;
			
			target1.text(n1);
			target2.text(n2);
			
		} else {
			flag = 1;
			target1 = $(this);
			n1 = target1.text();
		}
		
		var divId = $(this).attr('id');
		
		$('#history').append(divId + "가 클릭되었습니다!<br/>");
// 		$('#history').scrollTop($('#history')[0].scrollHeight);
		var ele = $('#history');
		ele.scrollTop = ele.scrollHeight;
	})
	
	$('#pBtn').on('click',function(){
// 		var selectedVal = $('select option:selected').val();
		var selectedVal = $('#boxSelect').val();
		var content = $('#content').val();
		
		if(selectedVal == 1) {
// 			$("#firstDiv").html("[1번째 박스]" + content);
			$("div:eq(0)").html("[1번째 박스]" + content);
		} else if(selectedVal == 2) {
			$("div:eq(1)").html("[2번째 박스]" + content);
		} else if(selectedVal == 3) {
			$("#thirdDiv").html("[3번째 박스]" + content);
		} else if(selectedVal == 4){
			$("#fourDiv").html("[4번째 박스]" + content);
		} else {
			// eq(i) 사용해서 for문 돌릴 수 있음
			$("#firstDiv").html("[1번째 박스]" + content);
			$("#secondDiv").html("[2번째 박스]" + content);
			$("#thirdDiv").html("[3번째 박스]" + content);
			$("#fourDiv").html("[4번째 박스]" + content);
		}
		
		// 방법2
// 		if(parseInt(selectedVal) < 5) {
// 			$("div:eq(" + (parseInt(selectedVal)-1) +")").html(content);
// 		} else { // 모든 박스를 선택했을때
// 			for(var i=0; i<4; i++) {
// 				$("div:eq(" + i +")").html("[" + (i+1) + "번째 박스]" + content);
// 			}
// 		}
	})
})
</script>
<style type="text/css">
div{
	border: 1px solid black;
	width: 400px;
	height: 100px;
}
</style>
</head>
<body>
	<!-- 
		총 4가지의 div가 있습니다.
		제일 먼저 선택한(클릭) div에 있는 텍스트를 
		두번째 눌린 div로 옮기는데 이때, 서로 박스에 들어있는 텍스트를 교체한다.
	 -->
	<div class="dtext" id="firstDiv">[첫번째 박스]</div>
	<div class="dtext" id="secondDiv">[두번째 박스]</div>
	<div class="dtext" id="thirdDiv">[세번째 박스]</div>
	<div class="dtext" id="fourDiv">[네번째 박스]</div>
	
	<br/>
	<hr/>
	<br/>
	
	<div style="overflow-y: scroll;" id="history"></div>
	<!-- 
		아래 select box에 있는 박스 순서를 선택하고
		출력 할 텍스트를 입력 후에 출력 버튼을 클릭 시,
		내가 입력한 텍스트가 선택한 div 박스안에 
		내가 입력한 텍스트가 추가로 출력되게 해주세요.
	 -->
	<select id="boxSelect">
		<option value="1">첫번째 박스</option>
		<option value="2">두번째 박스</option>
		<option value="3">세번째 박스</option>
		<option value="4">네번째 박스</option>
		<option value="5">모든 박스</option>
	</select>
	<input type="text" id="content"/>
	<input type="button" value="출력" id="pBtn"/>
</body>
</html>