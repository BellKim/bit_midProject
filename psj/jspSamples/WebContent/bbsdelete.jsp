<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    int seq = Integer.parseInt(request.getParameter("seq"));
	BbsDao dao = BbsDao.getInstance();
	
	boolean isS = dao.bbsDelete(seq);
	
  
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

if(isS==true){

%>
	<script>
		alert("게시물이 정상적으로 삭제 되었습니다.")
		location.href ="bbslist.jsp";
	</script>
<%
} else {
%>
	<script>
		alert("게시물 삭제에 실패하였습니다.")
		location.href ="bbsdetail.jsp";
	</script>

<% } %>
</body>
</html>