<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fragment/header.jsp</title>
<style>
	a{
		display: inline-block;
		padding: 0 10px;
		inline-height: 20px;
	}
	a, a:hover, a:link{
		text-decoration: none;
	}
	ul{
		margin: 0;
	}
	li{
		list-style: none;
	}
	ul:after {
		content: '';
		display: block;
		clear: both;
	}
	.head_util ul{
		float: right;
		font-size : 20px;
	}
	.inner{
		position : relative;
		margin: 0 auto;
	}
	.head_util ul > li:first-child{
		padding: 0;
		background: none;
	}
	.head_util ul > li:first-child:before{
		display: none;
	}
	.head_util ul > li:before{
		content: '';
		display : inline-block;
		width: 1px;
		height : 20px;
		vertical-align : middle;
	}
	.head_util ul > li{
		float: left;
	}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
<div class="header head_util">
	<div class="inner">
		<ul>
			<%if(id == null){%>
				<li><a href="${pageContext.request.contextPath }/users1/login_form.jsp">로그인</a></li>
				<li><a href="${pageContext.request.contextPath }/users1/signup_form.jsp">회원가입</a></li>
			<%}else{ %>
				<li><a href="${pageContext.request.contextPath }/users1/private/info.jsp"><%=id %>님 로그인중...</a></li>
				<li><a class="btn btn-default" href="${pageContext.request.contextPath }">Home</a></li>
				<li><a class="btn btn-warning" href="${pageContext.request.contextPath }/users1/logout.jsp">로그 아웃</a></li>
			<%} %>
		</ul>
	</div>
</div>
</body>
</html>