<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updateform.jsp</title>
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
<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
		<form action="update.jsp" method="post">
			<div class="form-group">
				<input type="hidden" name="num" value="<%=num %>" class="form-control"/>
				<label for="num">번호</label>
				<input type="text" id="num" value="<%=num %>" disabled="disabled" />
			</div>
			<div class="form-group">
				<label for="writer">작성자</label>
				<input type="text" name="writer" id="writer" value="<%=dto.getWriter() %>" class="form-control" />
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="<%=dto.getTitle() %>" class="form-control" />
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10" class="form-control"><%=dto.getContent() %></textarea>
			</div>
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</form>
	</div>
</div>
<jsp:include page="../fragment/footer.jsp"></jsp:include>
</body>
</html>