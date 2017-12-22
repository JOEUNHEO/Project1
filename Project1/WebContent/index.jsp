<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="fragment/resource.jsp"></jsp:include>
<style>
	.header{
		height: 35px;
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
<jsp:include page="fragment/header.jsp"></jsp:include>
<%
	//세션 영역에 "id" 라는 키값으로 저장된 값이 있는지 불러오기
	String id = (String)session.getAttribute("id");
%>
<div class="container">
	<a class="btn btn-success" href="board/list.jsp">글 목록보기</a>
	<a class="btn btn-info" href="file/list.jsp">자료실</a>
</div>
<jsp:include page="fragment/footer.jsp"></jsp:include>
</body>
</html>