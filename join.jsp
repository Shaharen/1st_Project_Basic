<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>One Page Wonder - Start Bootstrap Template</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script
      src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
      crossorigin="anonymous"
    ></script>
    <!-- Google fonts-->
    <link
      href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
      rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="assets/css/styles_join.css" rel="stylesheet"/>
    
  </head>
<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
      <div class="container px-5">
        <a class="navbar-brand" href="main.html">【 메인페이지 이름 】</a>
        <a class="navbar-brand" href="#page-top"> 오늘의 술 추천 </a>
        <a class="navbar-brand" href="#page-top"> 커뮤니티 </a>

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarResponsive"
          aria-controls="navbarResponsive"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="Join.html">Join</a></li>
            <li class="nav-item"><a class="nav-link" href="Login.html">LogIn</a></li>
          </ul>
          <!-- Search -->
          <section>
            <form class="search" method="get" action="#">
              <input type="text" name="query" placeholder="원하는 술 검색" />
            </form>
          </section>
        </div>
      </div>
    </nav>
      <!-- Content section 1-->
    <section>
        <div id="con">
        <div id="login">
        <div id="login_form"><!--로그인 폼-->
	<form action = "JoinCon" method = "post">
            <h3 class="login" style="letter-spacing:-1px;">회원가입</h3>
    
            <!-- <p>
                <input type="submit" value="Sign in with Google" class="btn" style="background-color:#217Af0">
            </p> 구글로 로그인-->
             <!-- <span>ID</span>  -->
             <label>
            <p style="text-align: right ; font-size:12px; color:#666">*는 필수 입력사항입니다.</p>
            <p style="text-align: left; font-size:12px; color:#666">*아이디</p>
            <input type="text" placeholder="아이디" class="size" name = "id" id ="input_id">
            <div id="idInfo"></div>
            </label><!--아이디-->
            <br>
            <label>
            <!-- <span>PW</span> -->
            <br>
            <p style="text-align: left; font-size:12px; color:#666">*비밀번호 </p>
            <input type="text" placeholder="비밀번호" class="size" name = "pw" id = "pw1">
            <div id="pwInfo"></div>
            </label><!--비밀번호-->
            <br>
            <label>
                <!-- <span>PW</span> -->
                <br>
                <p style="text-align: left; font-size:12px; color:#666">*비밀번호 확인 </p>
                <input type="text" placeholder="비밀번호 확인" class="size" id = "pw2">
                <div id="pwInfo2"></div>
            </label><!--비밀번호 확인-->
            <br>
            <label>
              <!-- <span>PW</span> -->
            <br>
            <p style="text-align: left; font-size:12px; color:#666">*닉네임</p>
            <input type="text" placeholder="닉네임" class="size" name = "nick" >
            <div id="nickInfo"></div>
            </label> <!--닉네임-->  
             <br>
            <label>
                      <!-- <span>PW</span> -->
                <br>
                <p style="text-align: left; font-size:12px; color:#666">*성별</p>
                <input type="radio" name="sex" value="0" id ="man"> 남
                <input type="radio" name="sex" value="1" id ="woman"> 여
                <div id="sexInfo"></div>
              </label> <!--성별-->
              <br>
              <label>
                    <!-- <span>PW</span> -->
                <br>
                <p style="text-align: left; font-size:12px; color:#666">*Mobile Phone</p>
                <input  placeholder="-빼고 숫자만 입력" class="size" name = "phone" id = "phone" maxlength="11">
                <div id="phoneInfo"></div>
            </label> <!--전화번호--> 
            <br>
            <label>
                <!-- <span>PW</span> -->
            <br>
            <p style="text-align: left; font-size:12px; color:#666">*생년월일</p>
            <input type="text" class="size" name="birth" id="yy" placeholder="년" style = "width:100px"> 
			<input type="text" class="size" name="birth" id="mm" min="1" max="12" placeholder="월" style = "width:100px">
			<input type="text" class="size" name="birth" id="dd" placeholder="일" style = "width:100px">
			<div id="birthInfo"></div>
            </label> <!--생년월일-->
            <br> 
            <br>
            <p>
                <input type="button" value="취소하기" class="btn" onclick ="location.href='main.jsp'">
                <input type="submit" value="가입하기" class="btn" style="background-color: skyblue;" id = "joinBtn" disabled = "">
            </p>
        </form>
        </div>
    </section>
        <!-- Footer-->
     <footer class="py-5 bg-black">
      <div class="container px-5">
        <p class="m-0 text-center text-white small">
          Copyright &copy; Your Website 2021
        </p>
      </div>
    </footer>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
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
					$("#birthInfo").css("font-size", "0.8em");
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
						$("#birthInfo").css("font-size", "0.8em");
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
				$("#phoneInfo").css("font-size", "0.8em");
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
				$("#sexInfo").css("font-size", "0.8em");
				$("#sexInfo").css("color", "green");
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
					$("#pwInfo2").css("font-size", "0.8em");
					$("#pwInfo2").css("color", "green");
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
				$("#idInfo").css("font-size", "0.8em");
				$("#idInfo").css("color", "red");
				$("#idInfo").css("font-family", "Nanum Gothic");
				idVar = 1;
			} else {
				$("#idInfo").html("사용할 수 있는 아이디");
				$("#idInfo").css("margin", "2px");
				$("#idInfo").css("font-size", "0.8em");
				$("#idInfo").css("color", "green");
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
		$(".size").keyup(
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