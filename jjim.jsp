<%@page import="Model.DrinkDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
<% ArrayList<DrinkDTO> list = (ArrayList<DrinkDTO>)request.getAttribute("jjim"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>현재 접속한 닉네임 : <%=member.getNick() %></h1>
	<h1>검색 결과 개수 : <%=list.size() %></h1>
	
	
	<table border = "1">
	<tr>
		<td>상품명</td>
		<td>향</td>
		<td>맛</td>
		<td>도수</td>
		<td>사진</td>
		<td>번호</td>
	</tr>
			<%
			if (list.isEmpty()) {
				out.print("<tr><td colspan = '5'> 찜한 술이 없습니다. </td></tr>");
			} else {
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getDr_id()%></td>
				<td><%=list.get(i).getDr_flavor()%></td>
				<td><%=list.get(i).getDr_taste()%></td>
				<td><%=list.get(i).getDr_abv()%></td>
				<td><img src = "<%=list.get(i).getDr_img()%>"></td>
				<td><%=list.get(i).getNum()%></td>
			</tr>
			<%
			}
			}
			%>
	</table>
</body>
</html>