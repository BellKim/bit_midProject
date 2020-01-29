<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h1>회원가입</h1>
<p>환영합니다</p>

<div align="center">
	<form action="regiAf.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" name="id" size="20">
				ID확인 <p id="idcheck" style="font-size: 8px"></p>
				<input type="button" id="btn" value="id확인">
				</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" id="pwd" name="pwd" size="20"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name" size="20"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email" name="email" size="20"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
	<script>
		$(function () {
			$("#btn").click(function() {
				$.ajax({
					url:"./idCheck.jsp",
					type:"post",
					//datatype: "String",
					//data: "id="+$('#id').val(),
					data: { "id": $("#id").val() },
					success:function(data){
						//alert("success");
						//alert(data.trim());
						if(data.trim() =="YES"){
							$("#idcheck").css("color","#0000ff");
							$("#idcheck").html("사용할수 있는 id 입니다.");
						} else {
							$("#idcheck").css("color","#ff0000");
							$("#idcheck").html("사용중인 id입니다.");
							$("#id").val("");
						}
					
					},
					error:function(){
						alert("실패");
					}
				});
				
			});
		});
	</script>
</div>
</body>
</html>