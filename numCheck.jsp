<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! int i = 0; %>
<%
ArrayList<Integer> list = (ArrayList<Integer>) request.getAttribute("img");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = "table">
		<table>
			<tr>
				<td id = "leftNum"> <%=list.get(i) %> </td>
				<td id = "rightNum"> <%=list.get(i+1) %> </td>
			</tr>
			<tr>
			<td>
				<input type = "button" value = "메인으로" onclick = "location.href = 'main.jsp';">
			</td>
			</tr>
		</table>
	</div>
	<script src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	//#leftNum,#rightNum
	// ajax로 list.get(i) 를 넘겨야하나???
		$("#leftNum,#rightNum").on("click", function(){
			<%i = i + 2;%>
			$("#leftNum").html(<%=i%>);
			// location.reload();
		});
	</script>
</body>
</html>