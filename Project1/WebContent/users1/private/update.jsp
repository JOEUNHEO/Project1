<%@page import="test.users1.dao.Users1Dao"%>
<%@page import="test.users1.dto.Users1Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users1/private/update.jsp</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	Users1Dto dto = new Users1Dto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	boolean isSuccess = Users1Dao.getInstance().update(dto);
%>
<%if(isSuccess){%>
	<script>
		alert("수정되었습니다.");
		location.href="info.jsp";
	</script>
<%}else{ %>
	<script>
		alert("회원 정보 수정에 실패했습니다.");
		location.href="info.jsp";
	</script>
<%} %>
</body>
</html>