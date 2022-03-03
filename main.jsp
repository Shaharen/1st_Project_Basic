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
		<br>
		<a href="update.jsp">회원정보수정</a>
		<a href="logout.jsp">로그아웃</a>
		<!-- admin 일때 -->
		<a href="select.jsp">회원 목록보기</a>
		<a href="update.jsp">회원정보수정</a>
		<br>
		<a href="board.jsp">게시판</a>
		<a href="search.jsp">검색</a>
		<br>
		<a href="imgWorldCup"> 월드컵 </a>
		<a href="numCheck.jsp"> 숫자 확인</a>
		<br>
		<a href="JjimCon">찜목록</a>
		<a href="drinkInfo.jsp">술정보</a>
	</div>
	<br><br>
	<table border = "1" id = "random">
		<tr>
			<td>상품명</td>
			<td>향</td>
			<td>맛</td>
			<td>도수</td>
			<td>사진</td>
			<td>설명</td>			
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
				for (let i = 0 ; i < result.length; i ++) {
					// for문안에 잘 들어왔는지, 분류값은 잘 유지되는지 확인
					console.log("for문 안")
					let list = JSON.parse(result[i]);
					$("#random").append("<tr id = 'inform'>"
						+"<td>"+list.dr_id+"</td>"
						+"<td>"+list.dr_flavor+"</td>"
						+"<td>"+list.dr_taste+"</td>"
						+"<td>"+list.dr_abv+"</td>"
						+"<td><img src="+list.dr_img+" style = 'width:100px; height:100px;'></td>"
						+"<td>"+list.dr_des+"</td>"
						+"</tr>");
					/* $("#random").append(
							+"<tr>"
							+"<td>"+"<img src="+list.dr_img+" style = 'width:100px; height:100px;'></td>"
							+"<td>"+list.dr_id+"</td>"
							+"</tr><td></td>"
							+"<td>"+list.dr_flavor+"</td>"
							+"</tr><td></td>"
							+"<td>"+list.dr_taste+"</td>"
							+"</tr><td></td>"
							+"<td>"+list.dr_abv+"</td>"
							+"</tr><td></td>"
							+"<td>"+list.dr_desc+"</td>"
							+"</tr>"
							); */
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