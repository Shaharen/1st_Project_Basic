<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="ReplyWriteCon" method = "post">
		<table border = "1">
			<tr>
				<td>댓글 내용</td>
				<td><textarea rows="5" cols="20" name="re_content"></textarea></td>
			</tr>
		</table>
		<input type = "reset" value = "초기화">
		<input type = "submit" value = "등록">
		<input type = "button" value = "취소" onclick ="location.href='boardLook.jsp'">
	</form>
</body>
</html>