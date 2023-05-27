<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="vo.MemberVO"%>
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
		1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서
		일반데이터와 파일명을 저장하여 회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트에 저장하여
		목록 페이지에서 리스트 데이터를 활용할 수 있도록 해주세요.
		 - DAO, VO 활용
		
		2. 회원가입이 완료되면, total_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
	 -->

	<%	
		Map<String, String> joinMap = new HashMap<>();
		String value = null;	
		String fileName = null;
	
// 		String fileUploadPath = "C:\\upload";
// 		String fileUploadPath = request.getRealPath("/resources/images"); // 유지보수 끝 아래로 써야함

		// 내가 사용중인 프로젝트의 contextPath 경로(JSPBook/resources/images 경로)
		// 이클립스 상에서의 폴더 경로가 아닌 이클립스에서 만들어낸 프로젝트가 배포되서 생성되는 배포 경로가 되겠다!
		String fileUploadPath = request.getServletContext().getRealPath("/resources/images");
// 		String fileUploadPath = "D:\\A_TeachingMaterial\\6_JspSpring\\00_JSP\\workspace_jsp\\JSPBook\\WebContent\\ch07\\test\\images";

		File tempFile = new File(fileUploadPath);
		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}
		
		DiskFileUpload upload = new DiskFileUpload();
	
		upload.setSizeMax(5 * 1024 * 1024); // 업로드 할 파일의 최대 크기(byte)
		upload.setSizeThreshold(4096); // 메모리상에 저장할 최대 크기(byte)
		upload.setRepositoryPath(fileUploadPath); // 업로드된 파일을 임시로 저장할 경로
	
		List items = upload.parseRequest(request);
		Iterator params = items.iterator();
		
		// 4MB
		int maxSize = 4 * 1024 * 1024; // 파일 업로드 시 1개의 파일 당 사이즈(최대 사이즈)
		while (params.hasNext()) {
			FileItem fileItem = (FileItem) params.next();
	
			if (fileItem.isFormField()) { // 폼 페이지에서 전송된 요청 파라미터가 일반 데이터일 때
				String name = fileItem.getFieldName(); // 파라미터의 이름
				value = fileItem.getString("UTF-8");
				
				joinMap.put(name, value);
			} else {
				fileName = fileItem.getName(); // 파일명
				long fileSize = fileItem.getSize(); // 파일 크기
	
				File file = new File(fileUploadPath + "/" + fileName);
				if (maxSize < fileSize) {
			out.println("파일 크기를 초과하였습니다!<br/>");
				} else {
			fileItem.write(file); // 파일업로드
				}
			}
		}
		
		MemberDAO dao = MemberDAO.getInstance();
		
		MemberVO vo = new MemberVO();
		String loginID = joinMap.get("id");
// 		System.out.println(loginID);
		vo.setMem_id(loginID);
		vo.setMem_pw(joinMap.get("pw"));
		vo.setMem_name(joinMap.get("name"));
		vo.setMem_sex(joinMap.get("gender"));
		vo.setFilename(fileName);
	
		dao.insertMember(vo);
		
// 		request.getRequestDispatcher("total_signin.jsp").forward(request, response);
		response.sendRedirect("total_signin.jsp");
	%>
</body>
</html>