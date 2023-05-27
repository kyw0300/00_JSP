<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{
	width: 150px;
	height: 150px;
}
td:nth-child(2){
	width: 250px;
}
</style>
</head>
<body>
	<!-- 
		1. 로그인 성공 후, 넘어왔을때 'a001님! 환영합니다!' 메시지 출력을 완성해주세요.
		
		2. 회원 목록에 저장되어 있는 회원 모두를 출력해주세요.
		
			-----------------------------------------------
				이미지	|	회원정보		|	버튼
			-----------------------------------------------
						| 아이디 : a001   |
				이미지	| 비밀번호 : 1234	|	[상세정보]
						| 이름 : 고영우	|
						| 성별 : 남자		|
			-----------------------------------------------
			...
			
		3. 회원등록 버튼을 클릭 시, 회원 가입 페이지로 이동하여 회원 등록을 진행할 수 있도록 해주세요.
	 -->
	 <%
	 	request.setCharacterEncoding("UTF-8");
	 	response.setCharacterEncoding("UTF-8");
	 	
	 	String loginID = request.getParameter("loginID");
// 	 	StringloginID = (String) request.getAttribute("loginID");

	 	System.out.println(loginID);
	 	if(loginID != null) {
	 %>
	 	<c:set value="<%=loginID %>" var="member"/>
	 	<h3>${member }님! 환영합니다!</h3>
	 
	 <%
	 	}
	 %>
	 
	 <%
	 	MemberDAO dao = MemberDAO.getInstance();
	 	
	 	ArrayList<MemberVO> memList = dao.getMemberList();
	 %>
	 <a href="total_signup.jsp"><input type="button" value="회원가입"></a>
	 <table border="1">
	 <%	
	 	for(int i=0; i<memList.size(); i++) {
	 %>
	 	<tr>
	 		<td>
	 			<img alt="ㅎㅎ" src="images/<%=memList.get(i).getFilename()%>">
	 		</td>
	 		<td>
	 			아이디 : <%=memList.get(i).getMem_id() %><br/>
			 	비밀번호 : <%=memList.get(i).getMem_pw() %><br/>
			 	이름 : <%=memList.get(i).getMem_name() %><br/>
			 	성별 : <%=memList.get(i).getMem_sex() %><br/>
			 	파일이름 : <%=memList.get(i).getFilename() %><br/>
			 	
	 		</td>
	 		<td>
	 			<a href="">상세정보</a>
	 		</td>
	 	</tr>
	 <%
	 	}
	 %>
	 </table>
</body>
</html>