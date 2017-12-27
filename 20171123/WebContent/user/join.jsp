<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!-- 부트스트랩임. 그냥 table아님--> 
<%-- <link rel="stylesheet" href="<%=rootPath%>/ui/signin.css"/> --%>
<link rel="stylesheet" href="<%=rootPath%>/ui/sign.css"/>
<body>
 <form class="form-signin" > <!--sumit버튼사용할거아니니까 action="/login.user" method="post" 이거 삭제 -->
		<h2 class="form-signin-heading text-center">회원가입</h2> <!-- //form-signin-heading -->
		<label for="id" class="sr-only">ID</label> 
		<input type="text" id="id" name="id" class="form-inline center-block" placeholder="ID" required autofocus> 
		
		<label for="pwd" class="sr-only">Password</label>
		<input type="password" name="pwd" id="pwd" class="form-inline center-block" placeholder="Password" required>
		
		<label for="id" class="sr-only">이름</label> 
		<input type="text" id="name" name="name" class="form-inline center-block" placeholder="이름" required autofocus> 
		
		<label for="id" class="sr-only">나이</label> 
		<input type="text" id="age" name="age" class="form-inline center-block" placeholder="나이" required autofocus> 
		
		<label for="id" class="sr-only">주소</label> 
		<input type="text" id="address" name="address" class="form-inline center-block" placeholder="주소" required autofocus> 
		
		<label for="dino" class="sr-only">부서</label>
		<select name="dino" id="dino"> <!-- 아래 callback함수에서 아래 과정을 해주게 바꿈 -->
		<!-- <option value="1">FW팀</option> -->	
		<!-- <option value="2">SW팀</option> -->	
		</select> 
		<input  class="btn btn-sm btn-primary center-block"
			type="button" id="joinBtn" value="회원가입">
	</form>
<script>
function callback(result){
	var str="";
	for(var di of result){
		str+="<option value='"+di.diNo+"'>"+di.diName+"</optin>"
	}
	$("#dino").html(str);//위에  <select name="dino" id="dino">의 id를 태그
	//console.log(result);
}
$(document).ready(function(){
	var url="dino.user";
	var param={};
	param["cmd"]="depart";
	$.ajax({
		type:"post",
		url:url,
		dataType:"json", //데이터타입 json으로하면 자동으로 json타입으로생성해줌
		data:param,//데이터를 서버로 보냄
		success:callback, 
		error:function(xhr,status){alert("에러:"+xhr.responxeText);}
	});
})
function afterLogin(obj){ //function afterLogin(re){ <-원래이건데 변경
	//var obj = JSON.parse(re); //이거 할 필요 없음. 아래 dataType:"json"으로 타입 설정해줬으니까 
	alert(obj.msg);
	if(obj.result=='ok'){location.href=obj.url;}
}
$("#joinBtn").click(function(){ //jquery를 다운 받았으니까. 아래  login()함수 방법 안쓰고 다른 방법으로 할거임.
	var url="join.user"; //join.user든 list.user든 아무상관없음
	var id=$("#id").val();
	var pwd=$("#pwd").val();
	var params={};
	params["userId"]=$("#id").val();//[""]<-카메기법 
	params["userPwd"]=$("#pwd").val();//UserInfo.java의 변수들이랑 맙춰줘야함
	params["userName"]=$("#name").val();
	params["userAge"]=$("#age").val();
	params["userAddress"]=$("#address").val();
	params["diNo"]=$("#dino").val();
	var param={};
	param["cmd"]="join"; //UserServlet에 else if(cmd.equals("join") 추가해줘야함
	//params="param="+JSON.stringify(params);
	param["params"]=JSON.stringify(params);
	//params="{'cmd':'join','param':"+JSON.stringify(params)+"}";
	//params=JSON.parse(params);
	$.ajax({
		type:"post",
		url:url,
		dataType:"json",
		data:param,//데이터를 서버로 보냄
		success:afterLogin,
		error:function(xhr,status){alert("에러:"+xhr.responxeText);}
	});
});
</script>
</body>
</html>