<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="JoinCon" method="post">
		<table>
			<tr>
				<td><label for="id"> 아이디 </label></td>
				<td>
					<input type="text" class="input" name="id" id="input_id" placeholder="아이디를 입력하세요">
				</td>
			</tr><tr>
				<td colspan = "2"><div id="idInfo"></div></td>
			</tr>
			<tr>
				<td><label for="pw"> 비밀번호 </label></td>
				<td>
					<input type="text" class="input" name="pw" id="pw1"	placeholder="비밀번호를 입력하세요">
				</td>
			</tr><tr>
				<td colspan = "2"><div id="pwInfo"></div></td>
			</tr>
			<tr>
				<td><label for="pw2"> 비밀번호 확인 </label></td>
				<td>
					<input type="text" class="input" id="pw2" placeholder="비밀번호를 입력하세요">
				</td>
			</tr><tr>
				<td colspan = "2"><div id="pwInfo2"></div></td>
			</tr>
			<tr>
				<td><label for="nick"> 닉네임 </label></td>
				<td>
					<input type="text" class="input" name="nick"id="input_nick" placeholder="닉네임을 입력하세요"></td>
			</tr><tr>
				<td colspan = "2"><div id="nickInfo"></div></td>
			</tr>
			<tr>
				<td><label for="sex"> 성별 </label></td>
				<td>
					<input type="radio" class="input" name="sex" id="man"value="0"> 남자
					<input type="radio" class="input" name="sex" id="woman" value="1"> 여자
				</td>
			</tr><tr>
				<td colspan = "2"><div id="sexInfo"></div></td>
			</tr>
			<tr>
				<td><label for="phone"> 핸드폰 번호 </label></td>
				<td>
					<input type="text" class="input" name="phone" id="phone" placeholder="-빼고 입력하세요" maxlength="11"></td>
			</tr><tr>
				<td colspan = "2"><div id="phoneInfo"></div></td>
			</tr>
			<tr>
				<td><label for="birth"> 생년월일 </label></td>
				<td>
					<input type="text" class="input" name="birth" id="yy"placeholder="년">
					<input type="text" class="input" name="birth" id="mm" min="1" max="12" placeholder="월">
					<input type="text" class="input" name="birth" id="dd" placeholder="일">
				</td>
			</tr><tr>
				<td colspan = "2"><div id="birthInfo"></div></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" id="joinBtn" value="회원가입"
					disabled=""></td>
			</tr>
	
		</table>
	</form>
	
	<script src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		// 전체 조절 변수
		var idVar = 1;
		var pwVar = 1;
		var pw2Var = 1;
		var sexVar = 1;
		var phoneVar = 1;
		var birthVar = 1;

		// 생일 입력 여부
		$("#yy,#mm,#dd").keyup(function() {
			// 년
			let year = $("#yy").val();
			let month = $("#mm").val();
			let day = $("#dd").val();

			// 년, 월, 일 전부 입력되었는가?
			if (year != "" && month != "" && day != "") {
				// 년도가 4자리 입력되었는가?
				if (year.length != 4) {
					$("#birthInfo").html("태어난 년도 4자리를 정확하게 입력하세요.");
					$("#birthInfo").css("margin", "2px");
					$("#birthInfo").css("color", "red");
					$("#birthInfo").css("font-family", "Nanum Gothic");
					birthVar = 999;
				} else {
					// 4자리가 잘 입력됨
					// 미성년자 인가?
					// 미성년자 판별
					if (2022 - year < 19) {
						$("#birthInfo").html("미성년자는 사용할 수 없습니다.");
						$("#birthInfo").css("margin", "2px");
						$("#birthInfo").css("color", "red");
						$("#birthInfo").css("font-family", "Nanum Gothic");
						birthVar = 99;
					} else {
						$("#birthInfo").html("");
						birthVar = 0;
					}
				}
			} else {
				$("#birthInfo").html("생년월일을 입력해 주세요");
				birthVar = 9999;
			}

		})

		// 핸드폰 번호 입력 여부
		$("#phone").blur(function() {
			let phone = $("#phone").val();
			if (phone.length != 11) {
				$("#phoneInfo").html("길이가 맞지 않습니다.");
				$("#phoneInfo").css("margin", "2px");
				$("#phoneInfo").css("color", "red");
				$("#phoneInfo").css("font-family", "Nanum Gothic");
				phoneVar = 1;
			} else {
				$("#phoneInfo").html("");
				phoneVar = 0;
			}
		})

		// 성별 체크 여부
		$("#man,#woman").click(function() {
			// let man = $("#man")
			// let woman = $("#woman")
			if ($("#man").is(":checked")) {
				$("#sexInfo").html("남성");
				$("#sexInfo").css("margin", "2px");
				$("#sexInfo").css("color", "blue");
				$("#sexInfo").css("font-family", "Nanum Gothic");
				sexVar = 0;
			} else {
				$("#sexInfo").html("여성");
				$("#sexInfo").css("margin", "2px");
				$("#sexInfo").css("color", "red");
				$("#sexInfo").css("font-family", "Nanum Gothic");
				sexVar = 0;
			}
		})

		// 비밀번호 동일 여부
		$("#pw1,#pw2").keyup(function() {
			let pw1 = $("#pw1").val();
			let pw2 = $("#pw2").val();
			if (pw2 != "") {
				if (pw1 == pw2) {
					$("#pwInfo2").html("비밀번호가 같습니다");
					$("#pwInfo2").css("margin", "2px");
					$("#pwInfo2").css("color", "blue");
					$("#pwInfo2").css("font-family", "Nanum Gothic");
					pwVar = 0;
					pw2Var = 0;
				} else {
					$("#pwInfo2").html("비밀번호가 다릅니다");
					$("#pwInfo2").css("margin", "2px");
					$("#pwInfo2").css("color", "red");
					$("#pwInfo2").css("font-family", "Nanum Gothic");
					pwVar = 1;
					pw2Var = 1;
				}
			}
		});

		// 아이디 알림 메시지
		function idCheckMsg(count) {
			if (count > 0) {
				$("#idInfo").html("사용할 수 없는 아이디");
				$("#idInfo").css("margin", "2px");
				$("#idInfo").css("color", "red");
				$("#idInfo").css("font-family", "Nanum Gothic");
				idVar = 1;
			} else {
				$("#idInfo").html("사용할 수 있는 아이디");
				$("#idInfo").css("margin", "2px");
				$("#idInfo").css("color", "blue");
				$("#idInfo").css("font-family", "Nanum Gothic");
				idVar = 0;
			}
		}
		// 아이디 중복 체크
		$("#input_id").keyup(function() {
			let input_id = $("#input_id").val();
			console.log(input_id);
			$.ajax({
				type : "post",
				url : "idCheck",
				async : true,
				data : {
					"input_id" : input_id
				},
				success : function(Count) {
					// 통신 성공시 중복 여부 메시지 출력
					idCheckMsg(Count)
				},
				error : function() {
					alert("ajax error");
				}
			});
		});

		// 공백 제어
		/* $("#joinBtn").click(function() {
			var id = $("#input_id").val();
			var nick = $("#input_nick").val();
			if (id == "") {
				// 아이디 입력란 공백 제어
				alert("아이디를 입력해 주십시옹");
			}
			if (nick == "") {
				alert("닉네임을 입력해 주십시옹");
			}
		}); */

		// 버튼 활성화, 비활성화
		$(".input").keyup(
				function() {
					var inputVar = idVar + pwVar + pw2Var + sexVar + phoneVar
							+ birthVar;
					console.log("id,pw,pw2,sex,phone,birth : ", idVar, pwVar,
							pw2Var, sexVar, phoneVar, birthVar);
					console.log("버튼값 : ", inputVar);
					if (inputVar <= 4) {
						// 활성화
						$("#joinBtn").attr("disabled", false);
					} else {
						// 비활성화
						$("#joinBtn").attr("disabled", true);
						// $("#joinBtn").on("click" , function(){
						// 	$("#blank").html("모든 정보를 입력해주세요")
						// });

					}
				})
	</script>
	</body>
</html>