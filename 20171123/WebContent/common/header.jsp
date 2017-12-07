<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 이제 자바스크립트 객체 합시다. 20171207 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	<!-- 아래 내용은 github.com에서 ParkKyoungHun/jsp2 검색 후 -> /WebContent/js/AjaxUtil.js꺼 복사 한거임 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP4</title> 
</head>
<script type="text/javascript">
var AjaxUtil = function(p_url, p_params, p_method,p_aSync){//Ajax의 A는비동기의미, 기본값 true로 놨음. 놔야 비동기.
	if(!p_url || p_url.trim()==""){
		alert("AjaxUtil호출시 url은 필수 입니다.");
		return;
	}
	this.params = p_params;
	var getHttpXmlObj = function(){
		if(window.XMLHttpRequest){
	  		return new XMLHttpRequest();
	 	}else if(window.ActiveXObject){
	  		return new ActiveXObject("Microsoft.XMLHTTP");
	 	}
		alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
	}
	this.xhr = getHttpXmlObj();
	var method = p_method?p_method:"get";
	var url = p_url;
// 	alert(url);
// 	return;
	var aSync = p_aSync?p_aSync:true;
	this.xhr.callback = null;
	this.xhr.onreadystatechange=function(){ //onreadystatechange에 on붙었으니 이벤트임. 준비되면상태변화시키는...?
   		if (this.readyState==4){
   			if(this.status==200){ //에러 안나고 웹에 잘 뜨면, 200번대 들임. 근데, 우리꺼 대부분 200번임. 지끔까진 서버에서 해준거고 이제 우리가 할 거임.
	   			var result = decodeURIComponent(this.responseText);
	   			if(this.callback){
	   				this.callback(result);
	   			}else{
	   				alert(result);
	   			}
   			}else{
	   			var result = decodeURIComponent(this.responseText);
	   			alert(result);
   			}
   		}
	}
	this.changeCallBack = function(func){
		this.xhr.callback = func;
	}
   	this.xhr.open(method, url+this.params, aSync);
   	this.send = function(){//전화번호 누른거, 서버정보누른거
   		this.xhr.send.arguments = this;
   	   	this.xhr.send();//전화건거
   	}
}
</script>
<body>
<table border="1";>
	<tr>
 		<td><a href="/index.jsp">home</a></td> 
		<td><a href="/user/login.jsp">로그인</a></td>
		<td><a href="#">회원가입</a></td>
		<td><a href="#">게시판</a></td>
		<td><a href="/user/list.jsp">유저리스트</a></td>
	</tr>
</table>
<%
String str1="이름";
String str2="나이";
%>
</body>
</html>