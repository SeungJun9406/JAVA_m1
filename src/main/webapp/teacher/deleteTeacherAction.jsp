<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 요청값 유효성 검사
	if(request.getParameter("teacherNo") == null  
		|| request.getParameter("teacherNo").equals("")) {
		// teacherList.jsp으로
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	// 요청값 변수에 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// sql 메서드들이 있는 클래스의 객체 생성
	TeacherDao tDao = new TeacherDao();
	// 과목 삭제 메서드 실행
	int row = tDao.deleteTeacher(teacherNo);
	
	if(row == 1){
		System.out.println("과목 삭제 성공");
	}
	// teacherList.jsp으로
	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
%>