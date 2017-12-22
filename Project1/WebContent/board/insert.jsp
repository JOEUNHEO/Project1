<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/insert.jsp</title>
</head>
<body>
<%
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = BoardDao.getInstance().insert(dto);
	
%>
<%if(isSuccess) {%>
	<script>
		alert("새글 정보를 저장했습니다.");
	</script>
<%}else{ %>
	<script>
		alert("새글 정보 저장에 실패했습니다.");
	</script>
<%} %>
	<script>
		location.href="list.jsp";
	</script>
</body>
</html>