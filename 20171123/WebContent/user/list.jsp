<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/common/header.jsp" %>
<!--</head>-->
<script>
function afterLogin(result){
	var ths=$("table[id='table'] thead tr th")//; //<table id="tale"여기로 들어가고, thead지나 tr지나 th지나서 있는 데이터 얻을 수 있음
	var str="";
	for(var i=0;i<result.length;i++){//여기 자바단 서버단에 연결
		//str+=result[i];
		str+="<tr data-view='"+result[i].userNo+"'>";//20171218수정
		for(var j=0;j<ths.length;j++){
			var th=ths[j].getAttribute("data-field");
			str+="<td class = 'text-center'>"+result[i][th]+"</td>";	
		}
		/* str+="<td>"+result[i].userNo+"</td>";
		str+="<td>"+result[i].userId+"</td>";
		str+="<td>"+result[i].userName+"</td>";
		str+="<td>"+result[i].userAge+"</td>";
		str+="<td>"+result[i].userAddress+"</td>";*/
		str+="</tr>"; 
	}
	$("#result_tbody").html(str); //아직 스트링인데,$("#result_tbody").html( <-여기에 넣어줌으로써 아래 <tbody id="result_tbody"> 여기로 가서 뿌리는 거임
	//$("#result_tbody").html(result.html);
	$("tr[data-view]").click(function(){ //20171218수정
		//alert(this.getAttribute("data-view"));
		location.href="./view.jsp?userno="+this.getAttribute("data-view");
	})
}
$(document).ready(function(){ //여기는 브라우저단임, 서버에 요청을 하긴 함
	var url="join.user"; 
	var param={};
	param["cmd"]="list"; 
	$.ajax({
		type:"post",
		url:url,
		dataType:"json",
		data:param,
		success:afterLogin,
		error:function(xhr,status){alert("에러:"+xhr.responxeText);}
	});
});
</script>
<body>
<div class="container"> <!-- 이건 화면단. 서버단아님. -->
	<table id="table" data-height="450" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th class="text-center" data-field="userNo">No</th>
				<th class="text-center" data-field="userId">ID</th>
				<th class="text-center" data-field="userName">Name</th>
				<th class="text-center" data-field="userAge">Age</th>
				<th class="text-center" data-field="userAddress">Address</th>
			</tr>
		</thead>
		<tbody id="result_tbody"></tbody>
	</table>	
</div>
</body>
</html>