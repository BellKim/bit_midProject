<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<!-- 쿠키에 저장하는 script -->
	<style>
		.center{
			margin: auto;
			width: 60%;
			border: 3px solid #8ac008;
			padding: 10px;
		}
	</style>
</head>
<body>
<h2>Login Page</h2>
<div class="center">
	<form action="loginAf.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" id="id" name="id" size="20">
					<input type="checkbox" id="chk_save_id">Save id
				</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
						<input type="submit" value="로그인">
						<button type="button" onclick="location.href='regi.jsp'">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<script>
	/*
		session : java code에서 접근 -> server (login한 정보를 저장- id, 이름,나이 등등/ Object)
		cookie : Javascript에서 접근 -> client (login했던 id를 저장. - 삭제도 가능/ String)  
	*/
	//$.cookie("user_id", "abc123");	//setter : 쿠키생성
	//$.removeCookie("user_id", {path:'./'}); //쿠키 삭제
	var user_id = $.cookie("user_id");	//쿠키접근방법 "" 문자열은 맘대로 지정
	if(user_id != null){
		//alert("쿠키있음");
		$("#id").val(user_id);
		$("#chk_save_id").attr("checked", "checked"); // prop 와 다름 
	}
	
	$("#chk_save_id").click(function () {
		if($("#chk_save_id").is(":checked")){
			//alert("체크됨"); 쿠키저장
			if( $("#id").val().trim() == ""){
				alert("ID를 입력해 주십시오.");
				$("#chk_save_id").prop("checked",false);
			} else {
				//제대로 입력됐을때 == 쿠키저장
				$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
				//{ expires:7, path:'./' } : 쿠키저장 기한, 경로(현재경로)
			}
		} else {
			//alert("체크안됨"); 쿠키제거
			$.removeCookie("user_id", { path: './'});
		}
	});
</script>
</body>
</html>