<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/detail.jsp</title>
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
	int num = Integer.parseInt(request.getParameter("num"));

	BoardDto dto = BoardDao.getInstance().getData(num);
%>
<jsp:include page="../fragment/header.jsp"></jsp:include>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title"><%=num %> 번 글의 정보 입니다.</h3>
	</div>
	<div class="panel-body">
		<p>작성자 : <strong><%=dto.getWriter() %></strong></p>
		<p>제목 : <strong><%=dto.getTitle() %></strong></p>
		<p>내용</p>
		<textarea name="content" cols="30" rows="10" disabled><%=dto.getContent() %></textarea>
		<p>작성일 : <strong><%=dto.getRegdate() %></strong></p>
	</div>
	<div class="panel-footer">
		<a class="btn btn-warning" href="updateform.jsp?num=<%=dto.getNum() %>">수정</a>
		<a class="btn btn-danger" href="javascript:isDelete()">삭제</a>
	</div>
</div>
<jsp:include page="../fragment/footer.jsp"></jsp:include>
<script>
	function isDelete(){
		var result = confirm("삭제 하시겠습니까?");
		
		if(result){//확인을 눌렀을 때 삭제 되도록 한다.
			location.href="delete.jsp?num=<%=dto.getNum() %>";
		}
	}
</script>
</body>
</html>