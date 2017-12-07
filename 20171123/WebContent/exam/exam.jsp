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
<%ListExam le=new ListExam();
ArrayList<HashMap<String,String>> userlist =le.getUserList();
%>
<table border="1";>
	<tr>
<!-- 		<th>이름</th> -->
<!-- 		<th>나이</th> -->
		<th>유저번호</th>
		<th><%=str1%></th>
		<th><%=str2%></th>
		<th>주소</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>부서</th>
		<th>부서특징</th>
	</tr>
<!-- 20171206방식말고 아래는 : 값을 뿌려주긴하는데 Map이라는게 순서 딱히 없이 저장했으니까 뿌리는것도 지 맘대로여서 문제임  -->
<!-- 그래서 뿌리고 난 뒤, 그 후에 메뉴탭을 뿌리는 방법으로 해결 할 수 있음 -->
<%
for(HashMap<String,String> hm:userlist){
	out.println("<tr>");
	Iterator<String> it=hm.keySet().iterator();
	while(it.hasNext()){
		String key=it.next();
		out.println("<td>"+hm.get(key)+"</td>");
	}
	out.println("</tr>");
}
%>
</table>
</body>
</html>