<%@page import="dto.CustUserDto"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CustUserDto dto = (CustUserDto)request.getAttribute("custdto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align ="center">
<table>
	<col width = "100">
	<col width = "100">
	<tr>
		<td align="center" colspan="2">
			회원정보보기
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="2"></td>
	</tr>
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="id" size="10" value="<%=dto.getId() %>" disabled>
		</td>
	</tr>
	<tr>
		<td>NAME</td>
		<td>
			<input type="text" name="name" size="10" value="<%=dto.getName() %>" disabled>
		</td>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td>
			<input type="text" name="address" size="10" value="<%=dto.getAddress() %>" disabled>
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="2"></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="button" id="modify" value ="수정">
		<input type="button" id="delete" value="삭제">
		<input type="button" id="btn" value="돌아가기">
	</td>	
 	</tr>
	
</table>

</div>

<script type="text/javascript">
	document.getElementById("btn").onclick = function(){
		location.href="custuserlist";
	};
	document.getElementById("modify").onclick = function(){
		location.href="custuserupdate?id=<%=dto.getId()%>&command=modify";
	};
	document.getElementById("delete").onclick = function(){
		location.href="custuserdelete?id=<%=dto.getId()%>&command=onedel";
	};
</script>
</body>
</html>