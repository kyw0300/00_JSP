package kr.or.ddit.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.or.ddit.service.BoardServiceImpl;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

@WebServlet("/insertBoard2.do")
public class InsertBoard2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String encType = "UTF-8";
		
		String id = request.getParameter("id");
		String title = "";
		String content = "";
		String fileName = "";
		
		StringBuilder builder = new StringBuilder();
		
		//---------------------------------------------------------------------------
		String fileUploadPath = "C:/testProjectFile/uploadFiles";
//		String realFolder = request.getServletContext().getRealPath("/resources/images");
		
		File tempFile = new File(fileUploadPath);
		if(!tempFile.exists()) {
			tempFile.mkdirs();
		}
		
		DiskFileUpload upload = new DiskFileUpload();

		List items = null;
		
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
		
		// DiskFileUpload 대체(deprecated)
//		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
//		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		
//		try {
//			items = upload.parseRequest(request);
//		} catch (FileUploadException e) {
//			e.printStackTrace();
//		}
		
		Iterator params = items.iterator();
		
		upload.setSizeMax(5 * 1024 * 1024); // 업로드 할 파일의 최대 크기(byte)
		upload.setSizeThreshold(4096); 		// 메모리상에 저장할 최대 크기(byte)
		upload.setRepositoryPath(fileUploadPath); // 업로드된 파일을 임시로 저장할 경로
		
		// 4MB
		int maxSize = 4 * 1024 * 1024; // 파일 업로드 시 1개의 파일 당 사이즈(최대 사이즈)
		while(params.hasNext()) {
			FileItem item = (FileItem) params.next();
			
			if(item.isFormField()) {
				String fieldName = item.getFieldName();
				if(fieldName.equals("title")) {
					title = item.getString(encType);
				} else if(fieldName.equals("content")) {
					content = item.getString(encType);
				} 
			} else { // 폼 페이지에서 전송된  요청 파라미터가 파일이라면...
				String fileFieldName = item.getFieldName(); // 요청 파라미터 이름
				fileName = item.getName(); // 저장 파일의 이름
				builder.append(fileName);
				builder.append(",");
				String contentType = item.getContentType(); // 파일 콘텐츠 유형
				String originalFileName = fileName;
				long fileSize = item.getSize();
				File saveFile = new File(fileUploadPath + File.separator + fileName);
				
				try {
					item.write(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				} // 파일 복사
			}
		}
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBo_title(title);
		boardVO.setBo_content(content);
		boardVO.setBo_writer(id);
		
		if(builder.toString()!=null && !builder.toString().equals("")) {
			builder.delete(builder.length()-1, builder.length());
			boardVO.setBo_fileNames(builder.toString()); // 실제 파일명을 VO에 저장
		}
		
		IBoardService service = BoardServiceImpl.getInstance();
		int insertCnt = service.insertBoard(boardVO);
		
		response.sendRedirect("/boardList.do?insertCnt="+insertCnt);
	}
}
