<%@page import="ch11.test.BoardVO"%>
<%@page import="ch11.test.BoardRepository"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시글 등록을 처리해주세요.
		> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 게시글 등록 실패 시, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = request.getServletContext().getRealPath("/resources/files");
	String encType = "UTF-8";

	int maxSize = 5 * 1024 * 1024;  // 최대 업로드 될 파일의 크기(5MB)
	
	File file = new File(realFolder);
	if(!file.exists()) {
		file.mkdirs();
	}

	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	String title = "";
	String writer = "";
	String content = "";
	String fileName = "";
	String contentType = "";
	
	while(params.hasNext()) {
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()) {
			String fieldName = item.getFieldName();
			if(fieldName.equals("title")) {
				title = item.getString(encType);
			} else if(fieldName.equals("writer")) {
				writer = item.getString(encType);
			} else if(fieldName.equals("content")) {
				content = item.getString(encType);
			}
		} else { // 폼 페이지에서 전송된  요청 파라미터가 파일이라면...
// 			String fileFieldName = item.getFieldName(); // 요청 파라미터 이름
			fileName = item.getName(); // 저장 파일의 이름
			contentType = item.getContentType(); // 파일 콘텐츠 유형
// 			System.out.println(contentType);
// 			String originalFileName = fileName;
// 			long fileSize = item.getSize();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile); // 파일 복사
		}
	}
	BoardRepository dao = BoardRepository.getInstance();
	dao.plusNo();
	int no = dao.getNo();
	
	String regDate = dao.getCurrenTime();
	
	BoardVO board = new BoardVO();
	board.setNo(no);
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setRegDate(regDate);
	board.setFileName(fileName);
	board.setContentType(contentType);
	
	dao.addBoard(board);
	
	response.sendRedirect("boardView.jsp?no="+no);
%>
</body>
</html>