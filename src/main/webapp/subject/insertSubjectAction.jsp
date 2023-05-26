<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 요청값 유효성 검사
	if(request.getParameter("subjectName") == null 
		|| request.getParameter("subjectTime") == null 
		|| request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime").equals("")) {
		// insertSubject.jsp으로
		response.sendRedirect(request.getContextPath() + "/subject/insertSubject.jsp");
		return;
	}
	// 요청값 변수에 저장
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	// sql 메서드들이 있는 클래스의 객체 생성
	SubjectDao sDao = new SubjectDao();
	// Subject 객체 생성하여 요청값 저장
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	// 과목 추가 메서드 실행
	int row = sDao.insertSubject(subject);
	
	if(row == 1){
		System.out.println("과목 추가 성공");
	}
	// subjectList.jsp으로
	response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
%>