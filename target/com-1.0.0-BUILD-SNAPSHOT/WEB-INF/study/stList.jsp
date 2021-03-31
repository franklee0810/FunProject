<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="margin-left: 35%;margin-top: 5%;">


	<table id = "example" border = "1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>소개</td>
			<td>시간</td>
			<td>시간</td>
			<td>참여인원</td>
			<td>좋아요</td>
			<td>이미지</td>
			<td>도시</td>
			<td>구</td>
			<td>주제</td>
			<td>참여하기</td>
			<td>찜하기</td>
		</tr>
	<c:forEach var = "bean" items="${lists }">
		<tr class = "table_test">
			<td>${bean.seq_study }</td>
			<td class = "info">${bean.subject }</td>
			<td>${bean.intrd }</td>
			<td>${bean.time_from }</td>
			<td>${bean.time_to }</td>
			<td>${bean.personnel }</td>
			<td>${bean.like }</td>
			<td>${bean.image }</td>
			<td>${bean.city }</td>
			<td>${bean.borough }</td>
			<td>${bean.topic }</td>
			<td><a class = "join_tag" href="<%=contextPath%>/my.st?seq_study=${bean.seq_study}&mid=${sessionScope.loginfo.mid}">참여하기</a></td>
			<td><a class = "wish" href ="?mid=${sessionScope.loginfo.mid }&seq_study=${bean.seq_study}">찜하기</a></td>
		</tr>
			
			
		</c:forEach>
	</table>
<input id = "mid" type = "hidden" value = "${sessionScope.loginfo.mid}">

</body>
<script type="text/javascript">
$('.wish').click(function() {
			var tdArr = new Array();	
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			
			var mid = $('#mid').val();
			var seq_study = td.eq(0).text();
			var subject = td.eq(1).text();
			
			td.each(function(i){	
				tdArr.push(td.eq(i).text());
			});
			
		    $.ajax({
		        url: "/com/wish.wi",
		        type: "POST",
		        data: {
		        	mid:mid,
		        	seq_study:seq_study,
		        	subject:subject
		        },
		        success: function(data){
		            alert(data.Msg);
		        },
		        error: function(){
		        }
		  	});
});

</script>
</html>



