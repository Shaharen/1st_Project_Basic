<--기능확인 및 ajax-->
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
	<div>
		<a href="join.jsp">회원가입</a>
		<a href="login.jsp">로그인</a>
	
		<a href="update.jsp">회원정보수정</a>
		<a href="logout.jsp">로그아웃</a>
		<!-- admin 일때 -->
		<a href="select.jsp">회원 목록보기</a>
		<a href="update.jsp">회원정보수정</a>
		
		<a href="board.jsp">게시판</a>
		<a href="search.jsp">검색</a>
		
		<a href="imgWorldCup"> 이미지 확인 </a>
		<a href="numCheck.jsp"> 숫자 확인</a>
		
		<a href="JjimCon">찜목록</a>
		<a href="drinkInfo.jsp">술정보</a>
	</div>
	<br><br>
	<table border = "1" id = "random">
		<tr>
			<td colspan = "2">상품 설명</td>
			<td colspan = "2">상품 설명</td>
		</tr>
	</table>
	<script src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	//window.onload = function(){
		$.ajax({
			type : "post",
			url : "MainRandom",
			async : true,
			dataType : "json",
			success : function(result){
				alert("정보 이동 완료");
				for (let i = 0 ; i < result.length; i += 2) {
					// for문안에 잘 들어왔는지, 분류값은 잘 유지되는지 확인
					console.log("for문 안")
					let list = JSON.parse(result[i]);
					let list2 = JSON.parse(result[i+1]);
					$("#random").append("<tr>"
							+"<td rowspan ='5'>"+"<img src="+list.dr_img+" style = 'width:100px; height:100px;'></td>"
							+"<td>"+list.dr_id+"</td>"
							+"<td rowspan ='5'>"+"<img src="+list2.dr_img+" style = 'width:100px; height:100px;'></td>"
							+"<td>"+list2.dr_id+"</td>"
							+"</tr>"
							+"<td>"+list.dr_flavor+"</td>"
							+"<td>"+list2.dr_flavor+"</td>"
							+"</tr>"
							+"<td>"+list.dr_taste+"</td>"
							+"<td>"+list2.dr_taste+"</td>"
							+"</tr>"
							+"<td>"+list.dr_abv+"</td>"
							+"<td>"+list2.dr_abv+"</td>"
							+"</tr>"
							+"<td>"+list.dr_desc+"</td>"
							+"<td>"+list2.dr_desc+"</td>"
							+"</tr>"
							);
				}
			},
			error : function() {
				alert("안됨");
			}
		})
	//}
	
	</script>
</body>
</html>
