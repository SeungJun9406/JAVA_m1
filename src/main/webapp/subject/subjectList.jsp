<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 현재페이지
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	// sql 메서드들이 있는 클래스의 객체 생성
	SubjectDao sDao = new SubjectDao();
	// 전체 행의 수
	int totalRow = sDao.selectSubjectCnt();
	// 페이지 당 행의 수
	int rowPerPage = 10;
	// 시작 행 번호
	int beginRow = (currentPage-1) * rowPerPage;
	// 마지막 페이지 번호
	int lastPage = totalRow / rowPerPage;
	// 표시하지 못한 행이 있을 경우 페이지 + 1
	if(totalRow % rowPerPage != 0) {
		lastPage = lastPage + 1;
	}
	// 현재 페이지에 표시 할 리스트
	ArrayList<Subject> list = sDao.selectSubjectListByPage(beginRow, rowPerPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subjectList</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
	<h1>과목 리스트</h1>
	<div class="d-grid">
		<a href="<%=request.getContextPath()%>/subject/insertSubject.jsp">
			<button type="button" class="btn btn-dark btn-block">추가</button>
		</a>
	</div>
		<table class="table table-bordered">
			<tr>
				<th class="table-dark">이름</th>
				<th class="table-dark">시수</th>
				<th class="table-dark">삭제</th>
			</tr>
			<%
				for(Subject s : list) {
			%>
					<tr>
						<td>
							<a href="<%=request.getContextPath()%>/subject/subjectOne.jsp?subjectNo=<%=s.getSubjectNo()%>">
								<%=s.getSubjectName()%>
							</a>
						</td>
						<td><%=s.getSubjectTime()%></td>
						<td>
							<div class="d-grid">
								<a href="<%=request.getContextPath()%>/subject/deleteSubjectAction.jsp?subjectNo=<%=s.getSubjectNo()%>">
									<button type="button" class="btn btn-dark btn-block">삭제</button>
								</a>
							</div>
						</td>
					</tr>
			<%		
				}
			%>
		</table>

	<%
		// 페이징 수
		int pagePerPage = 10;
		// 최소 페이지
		int minPage = (currentPage-1) / pagePerPage * pagePerPage + 1;
		// 최대 페이지
		int maxPage = minPage + pagePerPage - 1;
		// 최대 페이지가 마지막 페이지 보다 크면 최대 페이지 = 마지막 페이지
		if(maxPage > lastPage) {
			maxPage = lastPage;
		}
		// 이전 페이지
		// 최소 페이지가 1보타 클 경우 이전 페이지 표시
		if(minPage>1) {
	%>
			<a href="<%=request.getContextPath()%>/subjectList.jsp?currentPage=<%=minPage-pagePerPage%>">이전</a>
	<%			
		}
		// 최소 페이지부터 최대 페이지까지 표시
		for(int i = minPage; i<=maxPage; i=i+1) {
			if(i == currentPage) {	// 현재페이지는 링크 비활성화
	%>	
			<%=i%>
	<%			
			}else {					// 현재페이지가 아닌 페이지는 링크 활성화
	%>	
				<a href="<%=request.getContextPath()%>/subjectList.jsp?currentPage=<%=i%>"><%=i%></a>
	<%				
			}
		}
		// 다음 페이지
		// 최대 페이지가 마지막 페이지와 다를 경우 다음 페이지 표시
		if(maxPage != lastPage) {
	%>
			<a href="<%=request.getContextPath()%>/subjectList.jsp?currentPage=<%=minPage+pagePerPage%>">다음</a>
	<%	
		}
	%>
	</div>
</body>
</html>