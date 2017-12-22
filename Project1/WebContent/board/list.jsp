<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
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
	List<BoardDto> list = BoardDao.getInstance().getList();
%>
<jsp:include page="../fragment/header.jsp"></jsp:include>
<a class="btn btn-primary" href="insertform.jsp">새글 작성</a>
<table class="table table-hover table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>자세히 보기</th>
		</tr>
	</thead>
	<tbody>
	<%for(BoardDto tmp:list){%>
		<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getWriter() %></td>
			<td><%=tmp.getTitle() %></td>
			<td><%=tmp.getRegdate() %></td>
			<td><a class="btn btn-info" href="detail.jsp?num=<%=tmp.getNum() %>">자세히 보기</a></td>
		</tr>
	<%} %>
	</tbody>
</table>
<jsp:include page="../fragment/footer.jsp"></jsp:include>
</body>
</html>