<%@page import="Model.DrinkDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "SearchCon" method = "post">
		도수 : <input type = "checkbox" name = "abv" value = "11"> 11
		<input type = "checkbox" name = "abv" value = "14"> 14
		
		<input type = "submit" value = "검색">
	</form>
</body>
</html>