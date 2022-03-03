<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDTO member = (MemberDTO) session.getAttribute("member"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ui>
			<li><h1>회원 정보 변경 페이지</h1></li>
			<form action = "UpdateCon" method = "post">
				<li>접속한 id : 시범<% //member.getId() %> </li>
				<li><input type="text" name="pw" placeholder="PW를 입력하세요"></li>
				<li><input type="text" name="nick" placeholder="닉네임을 입력하세요"></li>
				<li><input type="text" name="phone" placeholder="전화번호를 입력하세요"></li>
				<li><input type="submit" value="UPDATE" class="button fit"></li>
			</form>
		</ui>
	</div>
</body>
</html>