<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users1/login_form.jsp</title>
<jsp:include page="../fragment/resource.jsp"></jsp:include>
</head>
<body>
<%
	//로그인 후 리다일렉트 이동할 url 주소를 읽어온다.
	String url = request.getParameter("url");
	if(url == null){//만일 없으면
		//인덱스 페이지로 이동 될 수 있도록
		url = request.getContextPath();
		
	}
	
	//쿠키에 저장된 아이디를 담을 변수
	String savedId = "";
	
	//request 객체에 담겨서 전달된 쿠키 목록을 읽어온다.
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null && cookies.length > 0){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("savedId")){
				//쿠키 value 를 읽어와서 변수 savedId에 담는다.
				savedId = tmp.getValue();
			}
		}
	}
	

%>
<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
		<form action="login.jsp?url=<%=url %>" method="post">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" class="form-control" value="<%=savedId %>" />
				<p class="help-block">반드시 입력하세요</p>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" class="form-control" />
			</div>
			<div class="checkbox">
				<label>
					<input type="checkbox" name="isSave" value="yes" />
					아이디 저장
				</label>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</form>
	</div>	
</div>

</body>
</html>