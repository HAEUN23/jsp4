<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/signin.css"/>
<%
if(user!=null){
out.println(user.getUserName() + "님 환영해요~~");
out.println(user.getUserAge() + "살 이시네요");
}else{
%>
<div class="container">
	<form class="form-signin" action="/login.user" method="post">
		<h2 class="form-signin-heading">Please login</h2>
		
		<label for="inputEmail" class="sr-only">ID</label> 
		<input type="text" id="id" name="id" class="form-inline" placeholder="ID" required autofocus> 
		
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" name="pwd" id="pwd" class="form-inline" placeholder="Password" required>
		
		<input  class="btn btn-sm btn-primary" type="button" id="loginBtn" value="Login">
		
		<div class="checkbox">
			<label> <input type="checkbox" value="remember-me"> 
				Remember me
			</label>
		</div>
		
		<input type="hidden" name="command" value="login"/>
		
	</form>
</div>
<script>
function afterLogin(obj){ //function afterLogin(re){ <-원래이건데 변경
	//var obj = JSON.parse(re); //이거 할 필요 없음. 아래 dataType:"json"으로 타입 설정해줬으니까 
	alert(obj.msg);
	if(obj.result=='ok'){
		location.reload();
	}
}
$("#loginBtn").click(function(){ //jquery를 다운 받았으니까. 아래  login()함수 방법 안쓰고 다른 방법으로 할거임.
	var url="list.user";
	var id=$("#id").val();
	var pwd=$("#pwd").val();
	var params={};
	params["id"]=id;
	params["pwd"]=pwd;
	params["cmd"]="login";
	$.ajax({ //페이지에서 원하는 부분만 바꾸는 기능 ajax
		type:"post",
		url:url,
		dataType:"json",
		data:params,
		success:afterLogin,
		error:function(xhr,status){alert("에러:"+xhr.responxeText);}
	});
});
function login(){
	var url = 'list.user';
	var id = document.getElementById("id");
	var pwd = document.getElementById("pwd");
	var param = '?cmd=login&id=' + id.value + '&pwd=' + pwd.value;
	var au = new AjaxUtil(url,param);
	au.changeCallBack(afterLogin);
	au.send();
}
</script>
<%
}
%>
</body>
</html>