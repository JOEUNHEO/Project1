<%@page import="test.users1.dao.Users1Dao"%>
<%@page import="test.users1.dto.Users1Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users1/login.jsp</title>
</head>
<body>
<%
	//1. 폼 전송되는 아이디, 비밀번호를 읽어와서
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	Users1Dto dto = new Users1Dto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	//2. 유효한 정보인지 확인해서
	boolean isValid = Users1Dao.getInstance().isValid(dto);
	
	if(isValid){//가입이 되어 있으면,
		//아이디 저장 checkbox 를 체크 했으면,
		String isSave = request.getParameter("isSave");
		
		if(isSave != null){
			//쿠키 객체를 생성
			Cookie cookie = new Cookie("savedId", id);
			//최대 유지시간 초단위로 설정
			cookie.setMaxAge(60);
			//쿠키 응답 하기
			response.addCookie(cookie);
		}
		
	}
	
	//3. 로그인 성공 후 이동할 주소
	String url = request.getParameter("url");
	
	//4. 응답한다.
	
%>
<%if(isValid){
	//세션에 로그인 정보를 담는다.
	session.setAttribute("id", id);
	%>
	<script>
		alert("<%=id %>회원님 로그인 되었습니다.");
		location.href="<%=url %>";
	</script>
<%}else{ %>
	<script>
		alert("아이디 혹은 비밀 번호가 틀려요");
		location.href="login_form.jsp?url=<%=url%>";
	</script>
<%} %>	
</body>
</html>