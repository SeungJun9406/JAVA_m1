<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 인코딩 설정
	request.setCharacterEncoding("utf-8");

	// 요청값 유효성 검사
	if(request.getParameter("subjectNo") == null 
		|| request.getParameter("subjectNo").equals("")) {
		// subjectList.jsp으로
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
		return;
	}
	// 요청값 변수에 저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	// 요청값 유효성 검사
	if(request.getParameter("subjectName") == null 
		|| request.getParameter("subjectTime") == null 
		|| request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime").equals("")) {
		// updateSubject.jsp으로
		response.sendRedirect(request.getContextPath() + "/subject/updateSubject.jsp?subjectNo="+subjectNo);
		return;
	}
	// 요청값 변수에 저장
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	// sql 메서드들이 있는 클래스의 객체 생성
	SubjectDao sDao = new SubjectDao();
	// Subject 객체 생성하여 요청값 저장
	Subject subject = new Subject();
	subject.setSubjectNo(subjectNo);
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	// 과목 수정 메서드 실행
	int row = sDao.updateSubject(subject);
	
	if(row == 1){
		System.out.println("과목 수정 성공");
	}
	// subjectOne.jsp으로
	response.sendRedirect(request.getContextPath() + "/subject/subjectOne.jsp?subjectNo="+subjectNo);
%>