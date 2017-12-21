<%@page import="java.util.Iterator"%>
<%@page import="com.test.jsp.common.ListExam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Test</title>
</head>
<body>
test :${test}
<br>
session test:${s_test}
<br>
application test:${a_test}
<br>
<%//원래는 이런 for문으로 했는데
for(int num=1;num<=100;num++){out.println(num+",");}
%>
<br>
<c:forEach var="num" begin="1" end="100" step="1"> <!-- 1부터 100까지 스템1으로 돌자는 의미 -->
${num}, </c:forEach> 
<%
String[] strs={"1","2","3"};
request.setAttribute("strArray",strs);
%>
<br>
<%
UserInfo[] userList=new UserInfo[3];
UserInfo ui= new UserInfo();
ui.setUserName("test1");
ui.setUserAge(23);
userList[0]=ui;//jsp로 값을 보내는 거임.
ui= new UserInfo();//ui를 new해줘야 값 덮어쓰기 안됨.  
ui.setUserName("test2");
ui.setUserAge(24);
userList[1]=ui;
ui= new UserInfo();//ui를 new안해주면, test3 test3 test3 나옴 
ui.setUserName("test3");
ui.setUserAge(25);
userList[2]=ui;
request.setAttribute("userList",userList);//request를 통해, jstl
%>
<c:forEach var="str" items="${strArray}">
${str},
</c:forEach>

<table border="1">
	<tr>
		<th>유저이름</th>
		<th>유저나이</th>
	</tr>
	<c:forEach var="ui" items="${userList}">
	<tr>
 		<td>${ui.userName}</td><%--jstl --%>
		<td>${ui.userAge}</td>
	</tr>
	</c:forEach>	 
</table>
</body>
</html>