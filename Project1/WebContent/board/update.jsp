<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/update.jsp</title>
</head>
<body>
<%
	// 1. 폼 전송되는 수정할 글의 정보를 읽어와서
	
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// 2. DB 에 반영하고
	BoardDto dto = new BoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = BoardDao.getInstance().update(dto);
	// 3. 응답한다.
%>
<%if(isSuccess){ %>
	<script>
		alert("<%=dto.getNum() %>번의 글 정보를 수정했습니다.");
	</script>
<%}else{ %>
	<script>
		alert("<%=dto.getNum() %>번의 글 정보를 수정하지 못했습니다.");
	</script>
<%} %>
	<script>
		location.href="list.jsp";
	</script>
</body>
</html>