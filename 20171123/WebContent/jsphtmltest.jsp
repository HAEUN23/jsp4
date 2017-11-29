<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
한줄입니다 //himl <br> 
<%="한줄입니다" %> //jsp <br> 
<% out.println("한줄입니다<br>"); 
String str1="문자열1";
String str2="문자열2";
%>
html에선 // 이거랑 == 이거  안먹힘
<input type="text" name="str" id="str1" value="<%= str1%>"> //name과 value가 중요, id는 나중에 자바스크립트에서 사용.
<input type="text" name="str" id="str2" value="<%= str2%>">
<input type="button" value="확인">
</body>
</html>