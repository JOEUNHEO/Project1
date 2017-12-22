<%@page import="test.users1.dao.Users1Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users1/private/delete.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	
	boolean isSuccess = Users1Dao.getInstance().delete(id);
			
%>
<%if(isSuccess){
	session.invalidate();
%>
	<script>
		alert("<%= id%>회원님 탈퇴 처리가 완료 되었습니다. 그 동안 이용 해 주셔서 감사합니다:)");
		location.href="${pageContext.request.contextPath}/";
	</script>
<%}else{ %>
	<script>
		alert("탈퇴 처리가 실패했습니다.");
		location.href="info.jsp";
	</script>
<%} %>
</body>
</html>