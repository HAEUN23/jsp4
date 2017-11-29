<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
if(id==null){
%>
<form method="get" action="">
아이디 : <input type="text" name="id" id="id">
비밀번호 : <input type="password" name="pwd" id="pwd" >
<input type="submit" value="login">
<%
}else{
	out.write(id+"님 환영합니다.");
}
%>
</form>
</body>
</html>