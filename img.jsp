<%@page import="java.util.Collections"%>
<%@page import="Model.WorldCupDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!--  ArrayList<DTO>으로 가져온다. -->
<% ArrayList<WorldCupDTO> list = (ArrayList<WorldCupDTO>) request.getAttribute("imgGroup"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = "1">
	<!-- list가 없다면 검색 결과가 없습니다 -->
	<%		if (list.isEmpty()) {%>
				<tr><td colspan = '2'>현재 가져온 이미지가 없습니다.</td></tr>
	<!-- list가 있다면 검색 결과 사진 출력-->
	<!-- 0번부터 list.size()로 돌리기 -->
	<%		} else { %>
			<!-- 이름 -->
			<tr>
				<td id = "leftName"><%=list.get(0).getS_id()%></td>
				<td id = "rightName"><%=list.get(1).getS_id() %></td>
			</tr>
			<!-- 사진 -->
			<tr>
				<td><img src = "<%=list.get(0).getS_img()%>" id = "leftImg"></td>
				<td><img src = "<%=list.get(1).getS_img()%>" id = "rightImg"></td>
			</tr>
			<!-- 카운터 -->
			<tr>
				<td id = "leftCnt"><%=list.get(0).getS_cnt()%></td>
				<td id = "rightCnt"><%=list.get(1).getS_cnt()%></td>
			</tr>
			<%
			}
	
			%>
	</table>
	<script src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	var j = 0;
	var imgName = [];
	var imgLink = [];
	var imgCnt = [];
	<% for ( int i = 0 ; i < list.size(); i++ ) { %>
		imgName[<%=i%>] = "<%=list.get(i).getS_id()%>";
		imgLink[<%=i%>] = "<%=list.get(i).getS_img()%>";
		imgCnt[<%=i%>] = <%=list.get(i).getS_cnt()%>;
	<%}	%>;
	var img = { "Name" : imgName , "Link" : imgLink , "Cnt" : imgCnt}
	var maxCnt = 0;
	console.log(imgName);
	console.log(imgLink);
	console.log(imgCnt);
	console.log(img);
	
	$("#rightImg").on("click" , function() {
		// 기존 카운터 증가
		$("#rightCnt").html(img.Cnt[j+1] += 1);
		// 이미지 교체 0 / 1 번 -> 2 / 3번으로
		j = j + 2;
		$("#leftImg").attr("src" , img.Link[j]);
		$("#rightImg").attr("src" , img.Link[j+1]);
		$("#leftName").html(img.Name[j]);
		$("#rightName").html(img.Name[j+1]);
		console.log(img.Cnt[j+1]);

		console.log("0번 카운터 " ,img.Cnt[0]);
		console.log("1번 카운터 " ,img.Cnt[1]);
		console.log("2번 카운터 " ,img.Cnt[2]);
		console.log("3번 카운터 " ,img.Cnt[3]);
		console.log("4번 카운터 " ,img.Cnt[4]);
		console.log("5번 카운터 " ,img.Cnt[5]);
		console.log("6번 카운터 " ,img.Cnt[6]);
		console.log("7번 카운터 " ,img.Cnt[7]);
		console.log("전체" , img.Cnt);
		console.log("카운터 최대" , Math.max.apply(null, img.Cnt));
	});
	
	$("#leftImg").on("click" , function() {
		// 기존 카운터 증가
		$("#leftCnt").html(img.Cnt[j] += 1);
		// 이미지 교체 0 / 1 번 -> 2 / 3번으로
		j = j + 2;
		$("#leftImg").attr("src" , img.Link[j]);
		$("#rightImg").attr("src" , img.Link[j+1]);
		$("#leftName").html(img.Name[j]);
		$("#rightName").html(img.Name[j+1]);
		console.log(img.Cnt[j]);

		console.log("0번 카운터 " ,img.Cnt[0]);
		console.log("1번 카운터 " ,img.Cnt[1]);
		console.log("2번 카운터 " ,img.Cnt[2]);
		console.log("3번 카운터 " ,img.Cnt[3]);
		console.log("4번 카운터 " ,img.Cnt[4]);
		console.log("5번 카운터 " ,img.Cnt[5]);
		console.log("6번 카운터 " ,img.Cnt[6]);
		console.log("7번 카운터 " ,img.Cnt[7]);
		console.log("전체" , img.Cnt);
	});
	
	
	
	
	
	$("leftImg").on("click" , function() {
		let Cnt = $("leftCnt").val();
		$.ajax({
			type : "post",
			url : "Cnt",
			async : true,
			data : {
				"leftCnt" : leftCnt
			},
			success : function(Count) {
				// 통신 성공시 중복 여부 메시지 출력
				alert("ajax success");
			},
			error : function() {
				alert("ajax error");
			}
		});
		
	});
	
	
	
	
	
	</script>
</body>
</html>