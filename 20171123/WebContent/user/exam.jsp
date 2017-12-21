<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!-- 단순 $("#result_div").html 공부한 곳 -->
<body>
<div id="result_div"></div>
<script>
	$("#result_div").html("<a href='http://naver.com'>네이버</a>");//jquery 언어인 $:함수명 //괄호열고닫기는 함수를 호출한거임
	//위에꺼랑 같은의미, $이거에 의미부여하지 말자 //document.getElementBtId("test").innerHTML="나나나";
</script>
</body>
</html>