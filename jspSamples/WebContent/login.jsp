<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<link rel="stylesheet" href="css/loginstyle.css" type="text/css" >
</head>
<body>
<form id="frm" method="post">
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->
			<h2 class="active">Sign In</h2>
			<!-- <h2 class="inactive underlineHover">Sign Up </h2> -->
			<div class="fadeIn first">
				<!--    <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" /> -->
			</div>

			<!-- Login Form -->
		<input type="text" id="id" class="fadeIn second" name="id"
					placeholder="id"> <input type="password" id="pwd"
					class="fadeIn third" name="pwd" placeholder="password"> <br>
				<br>
				<!-- idê¸°ìµ -->
				<div class="fadeIn fourth">
					<label class="control control--checkbox">Remember Me 
					<input type="checkbox" id="chk_save_id"/>
						<div class="control__indicator"></div>
					</label>
				</div>
				<!-- ì¬ê¸°ê¹ì§ -->
				<br>
				<button type="button" class="fadeIn fourth" id="_login">LOGIN</button>
				<button type="button" class="fadeIn fourth" id="_sign">SIGN
					UP</button>
			
			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="#">Forgot Password?</a>
			</div>

		</div>
	</div>
	</form>
<script type="text/javascript">
		
	$("#_sign").click(function() {	
			location.href="regi.jsp";
		});
	
	$("#_login").click(function() {	
		if( $("#id").val().trim() == "" ){
			alert("id를 입력해 주십시오");
			$("#id").focus();
		}
		else if( $("#pwd").val().trim() == "" ){
			alert("password를 입력해 주십시오");
			$("#pwd").focus();
		}
		else{
			$("#frm").attr({"action":"loginAf.jsp", "target":"_self"}).submit();		
		}	
	});
	
	var user_id = $.cookie("user_id");
	if(user_id != null){	// 지정한 쿠키가 있을 때
		// alert("쿠키 있음");
		$("#id").val( user_id );
		$("#chk_save_id").attr("checked", "checked");
	}
	
	$("#chk_save_id").click(function() {
		
		if( $("#chk_save_id").is(":checked") ){	// 체크 되었을 때
		//	alert("체크 됨");
			if( $("#id").val().trim() == "" ){
				alert("id를 입력해 주십시오");
				$("#chk_save_id").prop("checked", false);			
			}else{	// 정상 기입한 경우
				// 쿠키 저장
				$.cookie("user_id", $("#id").val().trim(), {expires:7, path:'./'});
			}
		}
		else{
		//	alert("체크 없어짐");
			$.removeCookie("user_id", {path:'./'});
		}
		
	});
	</script>
</body>
</html>