<!-- 이 header.jsp는 절때 java파일로 바뀌지 않음. 유일! 액션태그쓰면 java로 만들 수도...-->
<%@page import="com.test.jsp.dto.UserInfo"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- @는 지시자임 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl시작! -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP4</title>
</head>
<% //여긴jsp니까 서버단임!!
String rootPath = request.getContextPath();
UserInfo user = null;
user = (UserInfo) session.getAttribute("user");
String menu = "login";
String url = rootPath+"/user/login.jsp";
if(user!=null){
	menu = "logout";
	url = rootPath+"/user/logout.user?cmd=logout";
}
%>

<script src="<%=rootPath%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=rootPath%>/js/ajax_util.js"></script>
<script src="<%=rootPath%>/ui/btsp3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.3.2/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/common.css"/>
<body>
<script>
$(document).ready(function(){
	$("table[id='menu'] tr td").click(function(){
		location.href=this.getAttribute("data-url");
	})
	//$div(navbar)' ul li a[class=<logout>'"]).click(function()) //아래 부분말고 여기에 logout()넣으면 좋은 방법 
})
/* function logout(){ //이 방법은 나중에 좋지 않음. 서버단과화면단의 구분...?
if(confirm("진짜로 로그아웃 하시곘습니까?")){
	location.href="abc.user?cmd=logout";
}} */
</script>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar">home</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=rootPath%>/">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<%=rootPath%>/">Home</a></li>
            <li><a href="<%=url%>"><%=menu%></a></li>
            <li><a href="<%=rootPath%>/user/join.jsp">join us</a></li>
            <li><a href="<%=rootPath%>/user/list.jsp">User List</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<br><br><br>
