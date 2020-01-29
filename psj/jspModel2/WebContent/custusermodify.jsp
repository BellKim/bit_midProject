<%@page import="dao.CustUserDao"%>
<%@page import="dto.CustUserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   CustUserDto dto = (CustUserDto)request.getAttribute("custdto"); 	
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<div align ="center">
<form action = "custuserupdate" method="post">
<table>
	<col width = "100">
	<col width = "100">
	<tr>
		<td align="center" colspan="2">
			회원정보수정
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="2"></td>
	</tr>
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="id" size="10" value="<%=dto.getId() %>" readonly>
		</td>
	</tr>
	<tr>
		<td>NAME</td>
		<td>
			<input type="text" name="name" size="10" value="<%=dto.getName() %>" readonly>
		</td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td>
			<input type="text" name="address" size="10" value="<%=dto.getAddress() %>">
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="2"></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="hidden" name="command" value="modifyAf">
		<input type="submit" value ="수정하기">
		
	</td>	
 	</tr>
	
</table>
</form>
</div>
</body>
</html>