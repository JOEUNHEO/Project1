<%@page import="test.users1.dao.Users1Dao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	boolean isValid = Users1Dao.getInstance().checkId(id);
%>
<%if(isValid){%>
	{"response":true}
<%}else{ %>
	{"response":false}
<%} %>