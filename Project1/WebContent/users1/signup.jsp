<%@page import="test.users1.dto.Users1Dto"%>
<%@page import="test.users1.dao.Users1Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users1/signup.jsp</title>
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
	
	boolean isSuccess = Users1Dao.getInstance().insert(dto);
	
%>
<%if(isSuccess){
	//가입과 동시에 로그인후 리다일렉트 이동할 url 주소를 읽어온다.
	String url = request.getParameter("url");
	if(url == null){//만일 없으면
		//인덱스 페이지로 이동 될 수 있도록
		url = request.getContextPath();
	}
%>
	<script>
		alert("<%=id %>님 회원 가입을 축하합니다^^");
		location.href="login.jsp?url=<%=url %>&&id=<%=id%>&&pwd=<%=pwd%>";
	</script>
<%}else{ %>
	<script>
		alert("회원 가입에 실패했습니다. ㅠㅠ");
		location.href="${pageContext.request.contextPath }/";
	</script>
<%} %>
</body>
</html>