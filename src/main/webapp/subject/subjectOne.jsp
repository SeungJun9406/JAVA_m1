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
		
	// 상세 페이지에 표시할 subject 객체
	Subject one = sDao.selectSubjectOne(subjectNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subjectOne</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>과목 상세</h1>
		<div class="d-grid">
			<a href="<%=request.getContextPath()%>/subject/subjectList.jsp">
				<button type="button" class="btn btn-dark btn-block">목록으로</button>
			</a>
		</div>
		<form action="<%=request.getContextPath()%>/subject/updateSubject.jsp" method="post">
			<table class="table table-bordered">
				<tr>
					<th class="table-dark">이름</th>
					<td>
						<input type="hidden" name="subjectNo" value="<%=one.getSubjectNo()%>">
						<%=one.getSubjectName()%>
					</td>
				</tr>
				<tr>
					<th class="table-dark">시수</th>
					<td><%=one.getSubjectTime()%></td>
				</tr>
				<tr>
	
					<th class="table-dark">개설날짜</th>
					<td><%=one.getCreatedate()%></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-dark btn-block">수정</button>
		</form>
	</div>
</body>
</html>