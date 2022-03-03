<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "BoardUpdateCon" method = "post">
		<table border = "1">
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "newTitle" placeholder ="수정전 제목"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="20" name="newContent" placeholder ="수정전 내용"></textarea></td>
			</tr>
		</table>
		<input type = "submit" value = "수정">
		<input type = "button" value = "취소" onclick ="location.href='board.jsp'">
	</form>
</body>
</html>