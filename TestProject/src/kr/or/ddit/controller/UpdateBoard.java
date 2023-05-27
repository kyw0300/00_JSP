package kr.or.ddit.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.ddit.service.BoardServiceImpl;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

@WebServlet("/updateBoard.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 100)
public class UpdateBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int bo_no = Integer.parseInt(request.getParameter("bo_no"));
//		String bo_no = request.getParameter("bo_no");
		String newTitle = request.getParameter("title");
		String newContent = request.getParameter("content");
		
		//--------------------------------------------------------------
		// 파일 처리 부분
		// 업로드된 파일이 저장될 폴더 설정
		String uploadPath = "C:/testProjectFile/uploadFiles";
				
		// 저장될 폴더가 없으면 새로 만든다.
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		// 수신 받은 파일 데이터 처리하기
		String fileName = "";  // 파일명이 저장될 변수 선언
		
		StringBuilder builder = new StringBuilder();
		
		// 전체 Part객체 개수만큼 반복 처리하기
		for(Part part : request.getParts()) {
			fileName = extractFileName(part);
			
			// 찾은 파일명이 빈문자열("")이면 이것은 파일이 아닌 일반 파라미터 데이터라는 의미
			if(!"".equals(fileName)) { // 파일인지 검사
				System.out.println("filename: " + fileName);
				builder.append(fileName);
				builder.append(",");
				
				// 수신 받은 파일 내용을 저장한다.
				try {
					// part.write()메서드 ==> Upload된 파일을 저장하는 메서드
					part.write(uploadPath + File.separator + fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//--------------------------------------------------------------
		System.out.println("선택안했을때 파일명 : " + builder.toString());
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBo_no(bo_no);
		boardVO.setBo_title(newTitle);
		boardVO.setBo_content(newContent);
		
		if(builder.toString()!=null && !builder.toString().equals("")) {
			builder.delete(builder.length()-1, builder.length());
			boardVO.setBo_fileNames(builder.toString());
		}
		
		IBoardService service = BoardServiceImpl.getInstance();
		int updateCnt = service.updateBoard(boardVO);
//		System.out.println(updateCnt);
		
		response.sendRedirect("/boardList.do?updateCnt="+updateCnt);
	}

	// Part구조 안에서 파일명을 찾는 메서드
	private String extractFileName(Part part) {
		String fileName = ""; // 반환할 파일명이 저장될 변수
		String headerValue = part.getHeader("content-disposition"); // 헤더의 '키값'을 이용하여 값을 구한다.
			
		String[] items = headerValue.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
			
		return fileName;
	}
}
