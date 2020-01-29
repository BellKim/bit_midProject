<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	request.setCharacterEncoding("utf-8");
    int seq = Integer.parseInt(request.getParameter("seq"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BbsDto bbs = new BbsDto(seq, title, content);
	
	BbsDao dao = BbsDao.getInstance();
	
	boolean isS = dao.bbsUpdate(bbs);
    
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
		alert("게시물이 정상적으로 수정 되었습니다.")
		location.href ="bbsdetail.jsp?seq=<%=seq%>";
	</script>
<%
} else {
%>
	<script>
		alert("게시물 수정에 실패하였습니다.")
		location.href ="bbsdetail.jsp?seq=<%=seq%>";
	</script>

<% } %>
</body>
</html>