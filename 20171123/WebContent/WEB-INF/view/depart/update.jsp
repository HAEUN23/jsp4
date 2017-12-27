<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
업데이트트트
<c:if test="${update!=null && update==1}">
	<script>
		alert("업데이트가 됐습니다.");
		location.href="/depart/list";
	</script>
</c:if>
<div class="container"> <!-- 이건 화면단. 서버단아님. 여기는 뷰단! 보여주는!-->
<form action="/depart/update_ok" method="post">
	<table id="table" data-height="450" class="table table-bordered table-hover">
		<tbody id="result_tbody"></tbody>
			<tr>
				<td>부서번호</td>
				<td>${depart.diNo}</td>
			</tr>
			<tr>
				<td>부서이름</td>
				<td><input type="text" name="diName" value="${depart.diName}"></td>
			</tr>
			<tr>
				<td>부서설명</td>
				<td><input type="text" name="diEtc"  value="${depart.diEtc}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button>저장</button>
					<button type="button">취소</button>
				</td>
			</tr>
	</table>	
	<input type="hidden" name="diNo" value="${depart.diNo}">
	</form>
</div>
</body>
</html>