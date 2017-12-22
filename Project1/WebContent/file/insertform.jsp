<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file/insertform.jsp</title>
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
	String id = (String)session.getAttribute("id");
%>
<jsp:include page="../fragment/header.jsp"></jsp:include>
<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
		<form action="insert.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input type="hidden" name="writer" value="<%=id %>" />
				<label for="writer">작성자</label>
				<input type="text" id="writer" class="form-control" value="<%=id %>" disabled="disabled" />
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" name="title" id="title" class="form-control" />
			</div>
			<div class="form-group">
				<label for="myFile">첨부</label>
				<input type="file" name="myFile" id="myFile" class="form-control" />
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</form>
	</div>
</div>
<jsp:include page="../fragment/footer.jsp"></jsp:include>
</body>
</html>