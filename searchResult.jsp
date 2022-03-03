<%@page import="Model.MemberDTO"%>
<%@page import="Model.DrinkDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
<% ArrayList<DrinkDTO> list = (ArrayList<DrinkDTO>)request.getAttribute("searchResult"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>현재 접속한 닉네임 : <%=member.getNick() %></h1>
	<a href = "main.jsp">메인으로</a>
	<h1>검색 결과 개수 : <%=list.size() %></h1>
	<table border = "1">
	<tr>
		<td>상품명</td>
		<td>향</td>
		<td>맛</td>
		<td>도수</td>
		<td>사진</td>
		<td>번호</td>
		<td>찜하기</td>
		<td>찜하기 카운터</td>
	</tr>
			<%
			if (list.isEmpty()) {
				out.print("<tr><td colspan = '5'> 검색된 정보가 없습니다. </td></tr>");
			} else {
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr id = "list">
				<td><%=list.get(i).getDr_id()%></td>
				<td><%=list.get(i).getDr_flavor()%></td>
				<td><%=list.get(i).getDr_taste()%></td>
				<td><%=list.get(i).getDr_abv()%></td>
				<td><img src = "<%=list.get(i).getDr_img()%>"></td>
				<td><%=list.get(i).getNum()%></td>
				<td><button id = "jjim" value = "<%=list.get(i).getNum()%>">찜하기</button></td>
				<td id = "jjimCnt">0</td>
			</tr>
			<%
			}
			}
			%>
	</table>
	
	<script src = "jquery-3.6.0.min.js"></script>
	<script type = "text/javascript">
	
	// 판단 변수
	var bSubmit = false;
	<%-- var req = "<%=request.getAttribute("searchResult")%>"; --%>
	
	$("button").click( function(){
		var num = event.target.value;
		if ( bSubmit == false ) {
			// 색 변경
			$("#jjim").css("color","red");
			bSubmit = true;
			// var num = $("td:nth-child(6)").val();
			// console.log("선택한 번호",num);
			// console.log("세션" , req);
			console.log("번호" , num)
			// ajax
			$.ajax({
				type : "post",
				url : "Jjim",
				async : true,
				data : {"bSubmit" : bSubmit , "num" : num},
				success : function(msg) {
					alert("찜목록에 등록되었습니다.")
					// 통신 성공시 알림 메시지 출력
					// 찜하기 카운터보다는 추천수 출력으로 쓰일듯
					console.log(msg); // 잘 넘어왔는지 확인
					$("#jjimCnt").html(msg) // 넘어온 수로 값 변경
				},
				error : function() {
					alert("ajax error");
				}
			});
		} else {
			// 다시 원래대로
			$("#jjim").css("color","black");
			bSubmit = false;
			// ajax
			$.ajax({
				type : "post",
				url : "Jjim",
				async : true,
				data : {"bSubmit" : bSubmit, "num" : num},
				success : function(msg) {
					alert("찜목록에서 제거되었습니다.")
					console.log(msg);
					$("#jjimCnt").html(msg)
				},
				error : function() {
					alert("ajax error");
				}
			});
		}
	});
	
	
	</script>
	
</body>
</html>