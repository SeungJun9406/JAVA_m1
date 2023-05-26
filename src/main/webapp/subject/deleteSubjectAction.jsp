<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 요청값 유효성 검사
	if(request.getParameter("subjectNo") == null  
		|| request.getParameter("subjectNo").equals("")) {
		// subjectList.jsp으로
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
		return;
	}
	// 요청값 변수에 저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	// sql 메서드들이 있는 클래스의 객체 생성
	SubjectDao sDao = new SubjectDao();
	// 과목 삭제 메서드 실행
	int row = sDao.deleteSubject(subjectNo);
	
	if(row == 1){
		System.out.println("과목 삭제 성공");
	}
	// subjectList.jsp으로
	response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
%>