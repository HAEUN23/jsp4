<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 화명에서 서버로 넣는 방법 하겠다 20171207 -->
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<script>
//test();
//function test(){ alert(1);} //이거 된다.
//var test = function(){alert(1);} //이렇게 하면 뒤에서 쓸 수는 없음
// var test = function(){
// 	this.a=1;
// 	this.b=2;
// 	var c=3;//자바스크립트는 int,long 이런거 없음. 넘버 스트링 블링 널 오브젝트 펑션 이렇게 밖에 없음.
// 	this.getC=function(){//펑션은 리턴하는애 리턴안하는애가 있는데, 나누는 방법이 없고 리턴을 하면 걍 리턴하는 함수임
// 			return c;
// 	}
// 	var getB=function(){ //접근제어자는 퍼블릭, 브라이빗. 두 종류가 있음. var: (test함수)내부에서 밖에 사용 못함.
// 		return this.b;	
// 	}
// }
// function func(){
// 	try{
// 		var t=new test();
// 		alert(t.a);
// 		alert(t.getC());
// 	}catch(e){alert(e);}//예외처리 : 우선 try에 있는거 실행하고 그거 하다가 문제 생기면 e로 고고
// }
// function func(a){ alert("첫번째 테스트");}
// function func(a,b){alert("두번째 테스트");} 
// function func(){ alert(1);} //함수명은 같아. 근데 함수속의 데이터 타입이 다르게 여러개 선언되는거 :오버로딩 (?)! 근데 자바엔 있지만, 자바스크립트엔 오버로딩없음, 오버라이팅만있음.그래서 재정의! "두번째테스트"가 출력됨.
function login(){
	var url='list.user';
	var param='?cmd=list';
	var au=new AjaxUtil(url,param); //이 jsp에서  AjaxUtil가 없으니까 위에include해주기
	//changeCallBack
	au.send();
}
</script>
<body>
<form method="post" action="/tt.20171128" ><br>
아이디 : <input type="text" name="id" id="id">
비밀번호 : <input type="password" name="pwd" id="pwd" >
<input type="button" value="login" onclick="login()">
</body>
</html>