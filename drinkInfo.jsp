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
	<!-- 대분류  -->
	<div>
		<button type="submit" value="1">소주</button>
		<button type="submit" value="2">맥주</button>
		<button type="submit" value="3">데킬라</button>
		<button type="submit" value="4">럼</button>
		<button type="submit" value="5">브랜디</button>
		<button type="submit" value="6">위스키</button>
		<button type="submit" value="7">진</button>
		<button type="submit" value="8">리큐르</button>
		<button type="submit" value="9">보드카</button>
		<button type="submit" value="10">와인</button>
	</div>
	<br>
	<br>
	<!-- 술에대한 설명과 이미지를 담기 위한 표  -->
	<table border="1" id="des">
		<tr>
			<td>설명</td>
			<td>사진</td>
		</tr>
	</table>
	<br>
	<table border="1" id="infoAll">
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
	$("button").click( function(){
		var sort = event.target.value;
			$.ajax({
				url : "drinkInfo",
				type : "post",
				async : true,
				data : { "sort" : sort },
				dataType : "json",
				success : function(msg) {
					alert("통신완료");
					/* console.log(msg);
					console.log("첫" ,msg[1]);
					console.log(typeof(msg));
					console.log(JSON.parse(msg[0])); */
					$("#desc").remove();
					$("#des").append("<tr id = 'desc'>"
							+"<td>"+msg[1]+"</td>"
							+"<td><src="+msg[2]+"></td>"
							+"</tr>");
					
				},
				error : function() {
					alert("에러");
				}
			})
			$.ajax({
				url : "drinkInfoAll",
				type : "post",
				async : true,
				data : {"sort" : sort},
				dataType : "json",
				success : function(result){
					alert("통신양호");
					$("tr").remove("#inform");
					//$("#inform").remove();
					for (let i = 0 ; i < result.length; i ++) {
						// for문안에 잘 들어왔는지, 분류값은 잘 유지되는지 확인
						console.log("for문 안")
						console.log(sort)
						let list = JSON.parse(result[i]);
						$("#infoAll").append("<tr id = 'inform'>"
							+"<td>"+list.dr_id+"</td>"
							+"<td>"+list.dr_flavor+"</td>"
							+"<td>"+list.dr_taste+"</td>"
							+"<td>"+list.dr_abv+"</td>"
							+"<td><img src="+list.dr_img+" style = 'width:100px; height:100px;'></td>"
							+"<td>"+list.dr_des+"</td>"
							+"</tr>");
					}
				},
				error : function() {
					alert("에러2");
				}
			})
		});
		
		
	</script>
</body>
</html>