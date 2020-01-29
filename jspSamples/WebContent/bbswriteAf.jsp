<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	System.out.println("id:"+id);
	System.out.println("title:"+title);
	System.out.println("content:"+content);
	
 	BbsDao dao = BbsDao.getInstance();
	boolean b = dao.writeBbs(new BbsDto(id,title,content)); 

	if(b){
%>
	<script>
		alert("성공적으로 글이 작성되었습니다.");
		location.href="./bbslist.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("글쓰기에 실패했습니다. 다시 시도해주세요");
		location.href="./bbswrite.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>