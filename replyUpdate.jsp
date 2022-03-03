<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "ReplyUpdateCon" method = "post">
		<table border = "1">
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="20" name="newReply" placeholder ="수정전 내용"></textarea></td>
			</tr>
		</table>
		<input type = "submit" value = "수정">
		<input type = "button" value = "취소" onclick ="location.href='boardLook.jsp'">
	</form>
</body>
</html>