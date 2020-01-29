<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto mem = (MemberDto)session.getAttribute("login");
	if(mem == null){
		response.sendRedirect("");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--

	form  → bbswriteAf.jsp
	Id : input 
	Title : input 
	Content : textarea
	
	button : 
	
 --%>
 
 <a href="logout.jsp">로그아웃</a>
 <div align = "center">
 	<h3>글쓰기</h3>
 	<form action = "bbswriteAf.jsp" method="post">
 	<table>
 		<tr>
 			<td>ID : </td>
 			<td>
 			<%-- input type = "text" id = "id" name ="id" value ="<%=mem.getId()%>" readonly--%>
 			<input type = "text" id = "id" name ="id" value =${login.id } readonly>
 			</td>
 		</tr>
 		<tr>
 			<td>Title : </td>
 			<td><input type = "text" id = "title" name ="title" size = "100"></td>
 		</tr>
 		
 		<tr>
 			<td colspan="2">
 			Content
 			</td>
 		</tr>
 		<tr>
 			<td colspan= "2">
 				<textarea rows="20" cols="97" name = "content"></textarea>
 			</td>
 		</tr>
 		
 		<tr height="5">
 		</tr>
 		<tr  align="center">
 			<td colspan = "2">
 				<input type = "submit" value ="작성"> <input type ="button" id = "cancle" onclick = "cancleWrite()" value="취소">
 			</td>
 		</tr>		
 	</table>
 	</form>
 </div>

<script type="text/javascript">
	function cancleWrite() {
		location.href="bbslist.jsp";
	}
</script>
</body>
</html>