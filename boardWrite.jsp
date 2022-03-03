<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="BoardWriteCon" method = "post">
		<table border = "1">
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="20" name="content"></textarea></td>
			</tr>
		</table>
		<input type = "reset" value = "초기화">
		<input type = "submit" value = "등록">
		<input type = "button" value = "취소" onclick ="location.href='board.jsp'">
	</form>
</body>
</html>