<%@page import="java.util.Iterator"%>
<%@page import="com.test.jsp.common.ListExam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!--크기 순서: page < request < session < application -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Test</title>
</head>
<body>
<c:set var="test" value="테스트" scope="page"/> <!-- 그냥 값넣을거면 scope안해줘도 됨. 디폴트값페이지 --> <!-- 페이지는 내 페이지에서만 가능 -->
<!-- var:변수명 value: 그변수에들어간값  -->
test :${test}
<%-- <% //jsp 예전우리 방식대로 했으면 아래와 같음 --%>
<!-- String str="test";  -->
<!-- out.println(str); -->
<%-- %> --%>


<c:set var="s_test" value="세션테스트" scope="session"/> <br> <!-- 세션(브라우저와 서버간의 연결된거)은 내 세션내에 모든곳에서 가능 --> 
session test:${s_test}

<c:set var="a_test" value="어플리케이션테스트" scope="application"/><br> <!-- 한서버에 application은 한개 가능함. 세션보다 큰 거임! 그래서 용량이크고 과부하올 수 있음.-->
application test:${a_test}
</body>
</html>