<%@page import="test.users1.dao.Users1Dao"%>
<%@page import="test.users1.dto.Users1Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users1/private/updateform.jsp</title>
<jsp:include page="../../fragment/resource.jsp"></jsp:include>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	Users1Dto dto = Users1Dao.getInstance().getData(id);
%>
<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
		<form action="update.jsp" method="post" id="updateForm">
			<div class="form-group">
				<input type="hidden" name="id" value="<%=id %>" class="form-control"/>
				<label for="id">아이디</label>
				<input type="text" id="id" value="<%=id %>" disabled="disabled" />
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" value="<%=dto.getPwd() %>" class="form-control" />
			</div>
			<div class="form-group">
				<label for="pwd2">비밀번호 확인</label>
				<input type="password" id="pwd2" value="<%=dto.getPwd() %>" />
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" name="email" id="email" value="<%=dto.getEmail() %>" class="form-control" />
			</div>
			<button type="submit" class="btn btn-primary">수정 확인</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</form>
	</div>
</div>
<script>
	$("#updateForm").submit(function(event){
		var inputPwd = $("#pwd").val();
		var inputPwd2 = $("#pwd2").val();
		if(inputPwd != inputPwd2){
			alert("비밀번호를 확인 하세요!");
			event.preventDefault();//폼전송 막기
		}
	});
</script>
</body>
</html>