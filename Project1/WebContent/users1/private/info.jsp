<%@page import="test.users1.dao.Users1Dao"%>
<%@page import="test.users1.dto.Users1Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users1/private/info.jsp</title>
<jsp:include page="../../fragment/resource.jsp"></jsp:include>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	Users1Dto dto = Users1Dao.getInstance().getData(id);
%>
<table class="table table-hover table-striped">
	<thead>
		<tr>
			<th>항목</th>
			<th>정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>아이디</td>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</tbody>
</table>
<a class="btn btn-warning" href="updateform.jsp">가입정보 수정</a>
<a class="btn btn-danger" href="javascript:deleteConfirm()">회원 탈퇴</a>
<script>
	function deleteConfirm(){
		var isDelete = confirm("정말 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>