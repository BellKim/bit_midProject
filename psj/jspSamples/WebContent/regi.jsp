<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regi.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<h1>회원가입</h1>
<div align = "center">
	<form action="regiAf.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디 </td>
				<td><input type="text" id ="id" name ="id" size ="20"> id 확인<p id ="idcheck" style="font-size : 8px"></p>
				<input type = "button" id = "btn" value ="id확인"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td>
					<input type ="password" name ="pwd" size = "20"> 
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type ="text" name ="name" size = "20"> 
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type ="text" name ="email" size = "20"> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
					<input type ="submit" value ="회원가입">
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$.ajax({
			type : "post",
			url:"./idcheck.jsp",
			data:{
				"id" : $("#id").val()
			},
			success : function(data){
				//alert(data);
				//alert(data.trim());
				if(data.trim()=="yes"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").html('사용할 수 있는 id 입니다.');
				} else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").html("사용 중인 id 입니다.");
					$("#id").val("");
				}
			},
			error : function(){
				//alert("실패");
			}
		});
	});
});
</script>
</body>
</html>