<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file/list.jsp</title>
<jsp:include page="../fragment/resource.jsp"></jsp:include>
<style>
	.header{
		height: 40px;
		background-color: yellow;
	}
	.footer{
		height: 100px;
		background-color: pink;
	}
	a, a:hover, a:link{
		text-decoration: none;
	}
</style>
</head>
<body>
<%
	List<FileDto> list = FileDao.getInstance().getList();
%>
<jsp:include page="../fragment/header.jsp"></jsp:include>
<a class="btn btn-primary" href="insertform.jsp">파일 올리기</a>
<table class="table table-hover table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>파일명</th>
			<th>크기</th>
			<th>등록일</th>
			<th>다운로드</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<%for(FileDto tmp:list){ %>
		<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getWriter() %></td>
			<td><%=tmp.getTitle() %></td>
			<td><%=tmp.getOrgFileName() %></td>
			<td><%=tmp.getFileSize() %></td>
			<td><%=tmp.getRegdate() %></td>
			<td><a class="btn btn-success" href="download.jsp?num=<%=tmp.getNum() %>">다운로드</a></td>
			<td><a class="btn btn-danger" href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
		</tr>
	<%} %>
	</tbody>
</table>
<jsp:include page="../fragment/footer.jsp"></jsp:include>
</body>
</html>