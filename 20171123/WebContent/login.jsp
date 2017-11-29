<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
function checkVlaue(){ 
	var id=document.getElementById("id").value; 
	var pwd=document.getElementById("pwd").value;
	//window.alert("id="+id+",pwd="+pwd);
	if(id.trim()==""){ //if(id=="")로 하면, 공백을 한개초과입력했을떄 비밀번호로 넘어가진까 안됌! trim(=공백지우기)붙여주기.
		alert("ID를 입력해주세요.");
		id.focus();
		return false; 
	}
	if(pwd.trim()==""){//위에getElementById여기다가 .value 안하면, 여기 공백확인 if문에 해줘야함.
		alert("비밀번호를 입력해주세요.");
		pwd.focus();
		return false;
	}
	return true;
}
</script>
<form method="Post" action="/test.login" onsubmit="return checkVlaue()"><br>
아이디 : <input type="text" name="id" id="id">
비밀번호 : <input type="password" name="pwd" id="pwd" >
<input type="submit" value="login">
</form>


</body>
</html>