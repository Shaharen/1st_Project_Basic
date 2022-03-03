<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "BoardDeleteCon" method = "post">
		<p>세션에 저장된 게시글 제목</p><br>
		<p>세션에 저장된 게시글 내용</p>
	<!-- 닉네임 판별 후 떠야됨 -->
	<input type = "submit" value = "삭제">
	<input type = "button" value = "수정" onclick ="location.href='boardUpdate.jsp'">
	<input type = "button" value = "댓글 작성" onclick ="location.href='replyWrite.jsp'">
	<!-- 닉네임 판별 후 떠야됨 -->
	<input type = "button" value = "댓글 수정" onclick ="location.href='replyUpdate.jsp'">
	<input type = "button" value = "댓글 삭제" onclick ="location.href='ReplyDeleteCon'">
	</form>
</body>
</html>