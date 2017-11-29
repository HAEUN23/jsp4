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
String testId="test";
String testPwd="1234";
String testName="홍길동";

String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
if(id==null){
%>
<script>
function checkVlaue(){ 
	var id=document.getElementById("id"); //var id=document.getElementById("id").value; 
	var pwd=document.getElementById("pwd");//.value붙어야 "id"이거로 인해, id와 pwd가 스트링변수인거 된다. 
	//window.alert("id="+id+",pwd="+pwd);
	if(id.value.trim()==""){ //if(id=="")로 하면, 공백을 한개초과입력했을떄 비밀번호로 넘어가진까 안됌! trim(=공백지우기)붙여주기.
		alert("ID를 입력해주세요.");
		id.focus();
		return false; 
	}
	if(pwd.value.trim()==""){//위에getElementById여기다가 .value 안하면, 여기 공백확인 if문에 해줘야함.
		alert("비밀번호를 입력해주세요.");
		pwd.focus();
		return false;
	}
	return true;
}
</script>
<form method="get" action="" onsubmit="return checkVlaue()">//on은 이벤트 on-- : --이벤트, --은 제출, 버튼 등등있음 <br>
아이디 : <input type="text" name="id" id="id">
비밀번호 : <input type="password" name="pwd" id="pwd" >
<input type="submit" value="login">
</form>
<%
}else{
	String msg="";
	if(id.equals(testId)){
		if(pwd.equals(testPwd)){
		out.println(testName+"님 로그인에 성공하셨습니다!");
		}else{
			msg="입력하신 비밀번호를 확인해주세요.";
		}
	}else{
		msg="입력하신 id["+id+"]는 없는 아이디입니다.";		
	}
	if(!msg.equals("")){ //페이지뤼케스트세션어플리케이션
%>
<script>
	alert("<%=msg%>");
	location.href="login.jsp"; //아이디와비번둘다틀리면, 다시 로그인화면으로 옴
</script>
<%		
	}
}
%>
</body>
</html>