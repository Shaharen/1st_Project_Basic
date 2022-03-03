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
	<table border = "1" id = "result">
	<!-- list가 없다면 검색 결과가 없습니다 -->
	<%		if (list.isEmpty()) {%>
				<tr><td colspan = '2'>현재 가져온 이미지가 없습니다.</td></tr>
	<!-- list가 있다면 검색 결과 사진 출력-->
	<!-- 0번부터 list.size()로 돌리기 -->
	<%		} else { %>
			<!-- 이름 -->
			<tr><h1 id = "vs">8강전</h1></tr>
			<tr>
				<td id = "leftName"><%=list.get(0).getS_id()%></td>
				<td id = "rightName"><%=list.get(1).getS_id() %></td>
			</tr>
			<!-- 사진 -->
			<tr>
				<td><img src = "<%=list.get(0).getS_img()%>" id = "leftImg" style = "width : 300px; height: 300px"></td>
				<td><img src = "<%=list.get(1).getS_img()%>" id = "rightImg" style = "width : 300px; height: 300px"></td>
			</tr>
			<%
			}
			%>
	</table>
	<script src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	var j = 0;
	var k = 0;
	var imgName = [];
	var imgLink = [];
	var imgCnt = [];
	<% for ( int i = 0 ; i < list.size(); i++ ) { %>
		imgName[<%=i%>] = "<%=list.get(i).getS_id()%>";
		imgLink[<%=i%>] = "<%=list.get(i).getS_img()%>";
		imgCnt[<%=i%>] = <%=list.get(i).getS_cnt()%>;
	<%}	%>;
	var img = { "Name" : imgName , "Link" : imgLink , "Cnt" : imgCnt};
	var group4 = {}; // 4강전
	var g4Name = [];
	var g4Link = [];
	var g4Cnt = [];
	var group2 = {}; // 결승전
	var g2Name = [];
	var g2Link = [];
	var g2Cnt = [];
	var group = {}; // 최후의 1
	var gName = [];
	var gLink = [];
	var gCnt = [];
	var maxCnt = 0;
	console.log(imgName);
	console.log(imgLink);
	console.log(imgCnt);
	console.log(img);
	
	$("#rightImg").on("click" , function() {
		if ( j < 8 ) {
			// 기존 카운터 증가
			$("#rightCnt").html(img.Cnt[j+1] += 1);
			// 오른쪽 푸쉬
			g4Name.push(img.Name[j+1]);
			g4Link.push(img.Link[j+1]);
			g4Cnt.push(img.Cnt[j+1]);
			console.log("이름",g4Name);
			console.log(g4Link);
			console.log(g4Cnt);
			group4 = {"Name" : g4Name , "Link" : g4Link , "Cnt" : g4Cnt};
			console.log("그룹4",group4);
			// 이미지 교체 0 / 1 번 -> 2 / 3번으로
			j = j + 2;
			$("#leftImg").attr("src" , img.Link[j]);
			$("#rightImg").attr("src" , img.Link[j+1]);
			$("#leftName").html(img.Name[j]);
			$("#rightName").html(img.Name[j+1]);
			console.log("j" ,j);
			console.log("그룹4", group4);
		
			if ( j == 8 ) {
				$("#leftImg").attr("src" , group4.Link[0]);
				$("#rightImg").attr("src" , group4.Link[1]);
				$("#leftName").html(group4.Name[0]);
				$("#rightName").html(group4.Name[1]);
				$("#vs").html("4강전");
			}
		} else if ( j >= 8 && k <= 5) {
			// 기존 카운터 증가
			$("#rightCnt").html(group4.Cnt[k+1] += 1);
			// 오른쪽 푸쉬
			g2Name.push(group4.Name[k+1]);
			g2Link.push(group4.Link[k+1]);
			g2Cnt.push(group4.Cnt[k+1]);
			console.log("이름",g2Name);
			console.log(g2Link);
			console.log(g2Cnt);
			group2 = {"Name" : g2Name , "Link" : g2Link , "Cnt" : g2Cnt};
			console.log("그룹2",group2);
			// 이미지 교체 0 / 1 번 -> 2 / 3번으로
			j = j + 2;
			k = k + 2;
			$("#leftImg").attr("src" , group4.Link[k]);
			$("#rightImg").attr("src" , group4.Link[k+1]);
			$("#leftName").html(group4.Name[k]);
			$("#rightName").html(group4.Name[k+1]);
			console.log("j" ,j);
			console.log("k" ,k);
			if ( k == 4 ){
				$("#leftImg").attr("src" , group2.Link[0]);
				$("#rightImg").attr("src" , group2.Link[1]);
				$("#leftName").html(group2.Name[0]);
				$("#rightName").html(group2.Name[1]);
				$("#vs").html("결승전");
				k = k + 2;
			}	
		} else if ( k == 6 ) {
			gName.push(group2.Name[1]);
			gLink.push(group2.Link[1]);
			gCnt.push(group2.Cnt[1]);
			group = {"Name" : gName , "Link" : gLink , "Cnt" : gCnt};
			console.log("그룹",group);
			$("#result").empty();
			$("#result").html("<tr>"
					+"<td>"+group.Name[0]+"</td>"
					+"</tr><tr>"
					+"<td><img src = "+group.Link[0]+" id = 'victory'></td>"
					+"</tr>");
			$("#victory").css("width" , "300px");
			$("#victory").css("height" , "300px");
			$("#vs").html("우승~!");
		}
		});
	// 왼쪽 클릭 알고리즘
	$("#leftImg").on("click" , function() {
		if ( j < 8 ) {
			// 기존 카운터 증가
			$("#leftCnt").html(img.Cnt[j] += 1);
			// 왼쪽 푸쉬
			g4Name.push(img.Name[j]);
			g4Link.push(img.Link[j]);
			g4Cnt.push(img.Cnt[j]);
			group4 = {"Name" : g4Name , "Link" : g4Link , "Cnt" : g4Cnt};
			// 이미지 교체 0 / 1 번 -> 2 / 3번으로
			j = j + 2;
			$("#leftImg").attr("src" , img.Link[j]);
			$("#rightImg").attr("src" , img.Link[j+1]);
			$("#leftName").html(img.Name[j]);
			$("#rightName").html(img.Name[j+1]);
		
			if ( j == 8 ) {
				$("#leftImg").attr("src" , group4.Link[0]);
				$("#rightImg").attr("src" , group4.Link[1]);
				$("#leftName").html(group4.Name[0]);
				$("#rightName").html(group4.Name[1]);
				$("#vs").html("4강전");
				
			}
		} else if ( j >= 8 && k <= 5) {
			// 기존 카운터 증가
			$("#leftCnt").html(group4.Cnt[k] += 1);
			// 왼쪽 푸쉬
			g2Name.push(group4.Name[k]);
			g2Link.push(group4.Link[k]);
			g2Cnt.push(group4.Cnt[k]);
			group2 = {"Name" : g2Name , "Link" : g2Link , "Cnt" : g2Cnt};
			// 이미지 교체 0 / 1 번 -> 2 / 3번으로
			j = j + 2;
			k = k + 2;
			$("#leftImg").attr("src" , group4.Link[k]);
			$("#rightImg").attr("src" , group4.Link[k+1]);
			$("#leftName").html(group4.Name[k]);
			$("#rightName").html(group4.Name[k+1]);
			if ( k == 4 ){
				$("#leftImg").attr("src" , group2.Link[0]);
				$("#rightImg").attr("src" , group2.Link[1]);
				$("#leftName").html(group2.Name[0]);
				$("#rightName").html(group2.Name[1]);
				$("#vs").html("결승전");
				k = k + 2;
			}	
		} else if ( k == 6 ) {
			gName.push(group2.Name[0]);
			gLink.push(group2.Link[0]);
			gCnt.push(group2.Cnt[0]);
			group = {"Name" : gName , "Link" : gLink , "Cnt" : gCnt};
			console.log("그룹",group);
			$("#result").empty();
			$("#result").html("<tr>"
					+"<td>"+group.Name[0]+"</td>"
					+"</tr><tr>"
					+"<td><img src = "+group.Link[0]+" id = 'victory'></td>"
					+"</tr>");
			$("#victory").css("width" , "300px");
			$("#victory").css("height" , "300px");
			$("#vs").html("우승~!");
		}
		});
	
	</script>
</body>
</html>