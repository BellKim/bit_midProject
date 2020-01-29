<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	BbsDao dao = BbsDao.getInstance();

	BbsDto bbs = dao.getBbsOne(seq);
	System.out.println(bbs.toString());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%  MemberDto mem = (MemberDto)request.getSession().getAttribute("login"); %>
<style>
	table {
 		border: 1px solid #000;
 		margin: 10px;
 	}
 	tr, td{
 		padding: 10px;
 		border-bottom: 1px solid #EAEAEA;
 	}
 	table .tdcenter{
 		text-align: center;
 	}
 	
 	a {
 		text-decoration:  none;
 	}
</style>
<h3 align="center">게시물 수정</h3>
 <a href="logout.jsp">로그아웃</a>
 
<div align="center">
	<form id="frm" method="post">
	<table>
		<col width="200"><col width="600">
		<tr>
			<td class="tdcenter">작성자</td>
			<td><%=bbs.getId() %></td>
		</tr>
		<tr>
			<td class="tdcenter">글제목</td>
			<td><input type="text" size="50" name="title" id="title" value="<%=bbs.getTitle() %>"></td>
		</tr>
		<tr>
			<td class="tdcenter">글내용</td>
			<td align="center">
				<textarea rows="10" cols="90" id="content" name="content"><%=bbs.getContent() %></textarea>
			</td>
		</tr>
	</table>
	</form>
	<input type="hidden" name="seq" value="<%=bbs.getSeq() %>"> 
	<input type="button" id="updateBtn" value="수정하기">
	<input type="button" id="listBtn" value="목록으로">
</div>
	<script>
		$("#updateBtn").click(function () {
			if( $("#title").val().trim() =="" ){
				alert("제목을 입력해주세요.");
				$("#title").focus();
			} else if ( $("#content").val().trim() =="" ){
				alert("내용을 입력해주세요.");
				$("#content").focus();
			} else {
				$("#frm").attr("action","bbsupdateAf.jsp?seq="+seq).submit();
			}
		});
	
		$("#listBtn").click(function () {
			if(confirm("작성중인글이 취소됩니다. 정말 돌아가시겠습니까?")==true){
	             location.href="bbslist.jsp";
	        } else {
	            return false;
	        }
		});
	</script>
</body>
</html>