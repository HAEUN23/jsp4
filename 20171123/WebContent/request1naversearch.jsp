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
String str=request.getParameter("str");//str에 " "값을 저장
String str1=request.getParameter("str1");
String str2=request.getParameter("str2");
out.print("str1:"+str1);//크롬에다가 아래처럼 치면 나옴
out.print("str2:"+str2);//http://localhost/requestnaversearch.jsp?str1=ba&str2=bo

	%>
<input type="text" name="str" id="str1" value="<%= str1%>"> 
<input type="text" name="str" id="str2" value="<%= str2%>">
<input type="button" value="확인">
</body>
</html>