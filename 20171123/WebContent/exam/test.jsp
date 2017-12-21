<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
저는 테스트1입니다.
<%//jsp태그 -> jsp는 자바로 바뀜. 그러면서 자바파일이 생성되고, 그때 this는 자기 자신을 가르킴.
RequestDispatcher reqD=this.getServletContext().getRequestDispatcher("/exam/test2.jsp");
request.setAttribute("babo","화이팅!");//request는 페이지에서 페이지 넘어갈때 쓰는거
session.setAttribute("babo2","화이팅!");//세션단위로 다 공유가능함
reqD.forward(request, response);
%>
</body>
</html>