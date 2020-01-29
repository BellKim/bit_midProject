<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 추가</title>
</head>
<body>
<div align ="center">
<form action = "custuseradd" method="post">
	<input type="hidden" name="command" value="addAf">
<table>
	<col width = "100">
	<col width = "100">
	<tr>
		<td align="center" colspan="2">
			회원추가
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="2"></td>
	</tr>
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="id" size="10" placeholder="ID">
		</td>
	</tr>
	<tr>
		<td>NAME</td>
		<td>
			<input type="text" name="name" size="10" placeholder="이름">
		</td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td>
			<input type="text" name="address" size="10" placeholder="주소">
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="2"></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="submit" value="고객추가"> <input type="reset" value="취소">
	</td>	
 	</tr>
	
</table>

</form>
</div>
</body>
</html>