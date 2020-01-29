<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	BbsDto dto = new BbsDto(id, title, content);
    	
    	BbsDao dao = BbsDao.getInstance();
    	
    	boolean isS = dao.writeBbs(dto);

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
		alert("게시물이 정상적으로 등록되었습니다.")
		location.href ="bbslist.jsp";
	</script>
<%
} else {
%>
	<script>
		alert("게시물 등록에 실패하였습니다.")
		location.href ="bbswrite.jsp";
	</script>

<% } %>
</body>
</html>