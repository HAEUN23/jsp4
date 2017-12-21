<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
//location.href="./test.jsp";
function afterView(result){
	for(var key in result)
	{ 								//jquery selec사용한거임 // #을 사용함으로써 userServicImp에 있는 ui.get---키값과 같은 내용을 
		$("#"+key).val(result[key]); //아래 form > label > input의 id를 userId, userPwd...로 맞춰놓았으니까 key값 받아서 잘 가지고 옴
	}
	//alert(result.userName);
}
$(document).ready(function(){ //여기는 브라우저단임, 서버에 요청을 하긴 함
	var url="join.user"; 
	var param={};
	param["cmd"]="view"; 
	param["userno"]="<%=request.getParameter("userno")%>"; 
	$.ajax({
		type:"post",
		url:url,
		dataType:"json",
		data:param,
		success:afterView,
		error:function(xhr,status){alert("에러:"+xhr.responxeText);}
	});
});
</script>
<form class="form-signin" > <!--sumit버튼사용할거아니니까 action="/login.user" method="post" 이거 삭제 -->
		<h2 class="form-signin-heading ">회원정보</h2> 
		<label for="id" class="sr-only">ID</label> 
		<input type="text-center" id="userId" name="id" class="form-control" placeholder="ID" required autofocus disabled> 
		
		<label for="pwd" class="sr-only">Password</label>
		<input type="password" name="pwd" id="userPwd" class="form-control" placeholder="Password" required disabled>
		
		<label for="id" class="sr-only">이름</label> 
		<input type="text" id="userName" name="name" class="form-control" placeholder="이름" required autofocus disabled> 
		
		<label for="id" class="sr-only">나이</label> 
		<input type="text" id="userAge" name="age" class="form-control" placeholder="나이" required autofocus disabled> 
		
		<label for="id" class="sr-only">주소</label> 
		<input type="text" id="userAddress" name="address" class="form-control" placeholder="주소" required autofocus disabled> 
		
		<%
		if(user!=null && user.getUserNo().toString().equals(request.getParameter("userno"))){//이런게 jsp 
		%>
		<input type="text" id="checkPwd" name="checkPwd" >
		<input type="button" value="회원수정" id="btnUpdate">
		<input type="button" onclick="deleteUser()" value="회원탈퇴" >
<script>
function afterCheckPwd(result){//json을 사용해서 함. jstl으로 값을 집어넣고 하는거 대기업들만 틀지켜서함.
	if(result.result=="ok"){//자바스텐다드 태그 라이브러리(=jstl). jsp은 더러우니까, jstl으로 해봅시다~!
		$("#userName").removeAttr("disabled");
		$("#userPwd").removeAttr("disabled");
		$("#userAge").removeAttr("disabled");
		$("#userAddress").removeAttr("disabled");
	}else{alert(result.msg);}
}
$("#btnUpdate").click(function(){
	//alert($("#checkPwd").val());
	var url="d.user"; 
	var param={};
	param["cmd"]="checkPwd"; 
	param["checkPwd"]=$("#checkPwd").val();
	$.ajax({
		type:"post",
		url:url,
		dataType:"json",
		data:param,
		success:afterCheckPwd,
		error:function(xhr,status){alert("에러:"+xhr.responxeText);}
	});
})
function afterDelete(result){
	alert(result.msg);
	if(result.result=="ok"){ location.href=result.url;}	
}
function deleteUser(){
	var url="d.user"; 
	var param={};
	param["cmd"]="delete"; 
	param["checkPwd"]=$("#checkPwd").val();
	$.ajax({
		type:"post",
		url:url,
		dataType:"json",
		data:param,
		success:afterDelete,
		error:function(xhr,status){alert("에러:"+xhr.responxeText);}
	});
}
</script>
		<%
		}
		%>
	</form>
</body>
</html>