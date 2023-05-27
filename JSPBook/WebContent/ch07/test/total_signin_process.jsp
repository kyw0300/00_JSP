<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.
		
		2. 전달받은 아이디, 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
		 - DAO, VO를 활용하여 진행할 수 있도록 합니다.
		 - DAO, VO까지는 제가 제공해드릴게요.
		
		3. 전달받은 아이디 비밀번호에 해당하는 회원인 경우엔 total_memberList.jsp로 이동하여
		      회원 목록 페이지를 완성해주세요.
		    - 회원 목록 페이지로 넘어가서 해당 목록 페이지에서 'a001님! 환영합니다!' 메시지를 출력해주세요.
		
		4. 전달받은 아이디 비밀번호에 해당하지 않는 회원인 경우엔 total_signin.jsp로 이동하여
		      다시 로그인을 진행할 수 있도록 해주시고, 에러 메세지를 출력해주세요! 
	 -->
	 
	 <%
	 	String loginID = request.getParameter("id");
	 	String loginPW = request.getParameter("pw");
	 	
	 	MemberDAO dao = MemberDAO.getInstance();
	 	
	 	ArrayList<MemberVO> memList = dao.getMemberList();
	 	String path = "";
	 	if(!memList.isEmpty()) {
		 	for(MemberVO memVo : memList) {
		 		String id = memVo.getMem_id();
		 		String pw = memVo.getMem_pw();
		 		
		 		if(loginID.equals(id) && loginPW.equals(pw)) {
// 		 			request.setAttribute("loginID", loginID);
// 		 			request.getRequestDispatcher("total_memberList.jsp").forward(request, response);
		 			path = "total_memberList.jsp?loginID="+loginID;
// 		 			response.sendRedirect("total_memberList.jsp?loginID="+loginID);
		 		} else {
// 		 			request.setAttribute("ok", "1");
// 		 			request.getRequestDispatcher("total_signin.jsp").forward(request, response);
		 			path = "total_signin.jsp?ok="+"1";
// 		 			response.sendRedirect("total_signin.jsp?ok=1");
		 		}
		 	}
	 	} else {
// 	 		request.setAttribute("ok", "1");
//  			request.getRequestDispatcher("total_signin.jsp").forward(request, response);
 			path = "total_signin.jsp?ok="+"1";
// 	 		response.sendRedirect("total_signin.jsp?ok=1");
	 	}
	 	response.sendRedirect(path);
// 	 	request.getRequestDispatcher("total_signin.jsp").forward(request, response);
	 %>
</body>
</html>