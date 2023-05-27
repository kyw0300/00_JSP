<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String fileUploadPath = "C:\\upload";
	
	File tempFile = new File(fileUploadPath);
	if (!tempFile.exists()) {
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	while (params.hasNext()) {
		FileItem fileItem = (FileItem) params.next();
	
		if (!fileItem.isFormField()) {
			String fileFieldName = fileItem.getFieldName(); // 요청 파라미터 이름
			String fileName = fileItem.getName();
			String contentType = fileItem.getContentType(); // 파일 콘텐츠타입(Mime Type)
			long fileSize = fileItem.getSize();				// 파일 크기
			
			File file = new File(fileUploadPath + "/" + fileName);
			fileItem.write(file);
			
			out.println("요청 파라미터 이름 : " + fileFieldName + "<br/>");
			out.println("저장 파일 이름 : " + fileName + "<br/>");
			out.println("파일 콘텐츠 타입 : " + contentType + "<br/>");
			out.println("파일 크기 : " + fileSize + "<br/>");
		}
	}
%>