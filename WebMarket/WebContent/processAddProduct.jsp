<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 업로드 다렉토리가 웹 서비스 디렉토리 하위에 존재
	// D:\A_TeachingMaterial\6_JspSpring\00_JSP\workspace_jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebMarket\resources\images
	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String encType = "UTF-8";  // 인코딩 타입
	
	int maxSize = 5 * 1024 * 1024;  // 최대 업로드 될 파일의 크기(5MB)
	
	File file = new File(realFolder);
	if(!file.exists()) {
		file.mkdirs(); // 없으면 해당 경로에 들어있는 폴더 전부를 만들어주세요!
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	String productId = "";
	String name = "";
	String unitPrice = "";
	String description = ""; 
	String manufacturer = ""; 
	String category = ""; 
	String unitsInStock = ""; 
	String condition = "";
	String fileName = "";
	
	while(params.hasNext()) {
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()) {
			String fieldName = item.getFieldName();
			if(fieldName.equals("productId")) {
				productId = item.getString(encType);
			} else if(fieldName.equals("name")) {
				name = item.getString(encType);
			} else if(fieldName.equals("unitPrice")) {
				unitPrice = item.getString(encType);
			} else if(fieldName.equals("description")) {
				description = item.getString(encType);
			} else if(fieldName.equals("manufacturer")) {
				manufacturer = item.getString(encType);
			} else if(fieldName.equals("category")) {
				category = item.getString(encType);
			} else if(fieldName.equals("unitsInStock")) {
				unitsInStock = item.getString(encType);
			} else if(fieldName.equals("condition")) {
				condition = item.getString(encType);
			} 
		} else { // 폼 페이지에서 전송된  요청 파라미터가 파일이라면...
			String fileFieldName = item.getFieldName(); // 요청 파라미터 이름
			fileName = item.getName(); // 저장 파일의 이름
			String contentType = item.getContentType(); // 파일 콘텐츠 유형
			String originalFileName = fileName;
			long fileSize = item.getSize();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile); // 파일 복사
		}
	}

// 	String productId = request.getParameter("productId"); 
// 	String name = request.getParameter("name"); 
// 	String unitPrice = request.getParameter("unitPrice"); 
// 	String description = request.getParameter("description"); 
// 	String manufacturer = request.getParameter("manufacturer"); 
// 	String category = request.getParameter("category"); 
// 	String unitsInStock = request.getParameter("unitsInStock"); 
// 	String condition = request.getParameter("condition"); 

	Integer price;
	
	if(unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
%>