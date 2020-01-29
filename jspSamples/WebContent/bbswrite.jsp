<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%--
	form action="bbswriteAf.jsp"
	ID : input
	TITLE : input
	CONTENT : textarea
	button
 --%>
 <%
	Object ologin = session.getAttribute("login");
	MemberDto mem = null;
	if(ologin == null){
		//response.sendRedirect("");
%>
		<script>
			alert("로그인 해 주십시오.");
			location.href= "login.jsp";
		</script>
<%
	} else {
			mem = (MemberDto)ologin;
	}
%> 
<h1 align="center">글쓰기</h1>

<div align="center">
	<form id="frm" method="post">
		<table>
			<tr>
				<td>글쓴이</td>
				<%-- value=${login.id} --%>
				<td><input type="text" name="id" value="<%=mem.getId() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" id="title" size="50">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="20" cols="80px" name="content" id="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="writeBtn">글쓰기</button>
					<button type="button" id="backBtn">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>

	<script>
		$(function() {
			$("#writeBtn").click(function() {
				if( $("#title").val().trim() =="" ){
					alert("제목을 입력해주세요.");
					$("#title").focus();
				} else if ( $("#content").val().trim() =="" ){
					alert("내용을 입력해주세요.");
					$("#content").focus();
				} else {	
					$("#frm").attr("action","bbswriteAf.jsp").submit();
				}
			});
			
			$("#backBtn").click(function() {
				 if(confirm("작성중인글이 취소됩니다. 정말 돌아가시겠습니까?")==true){
		             location.href="bbslist.jsp";
		        } else {
		            return false;
		        }
			});
		});
	</script>
</body>
</html>