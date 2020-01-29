<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    %>
    
    <%
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	
    	System.out.println("id : " + id);
    	System.out.println("pwd : " + pwd);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regiAf</title>
</head>
<body>

<%
	MemberDao dao = MemberDao.getInstance();

	boolean isS = dao.addMember(new MemberDto(id, pwd, name, email, 0));

	if(isS){
%>
	<script type="text/javascript">
		alert("성공적으로 가입되었습니다.");
		location.href="login.jsp";
	</script>
<% }else { %>
	<script type="text/javascript">
		alert("가입에 실패하였습니다.");
		location.href="regi.jsp";
	</script>
<% } %>
</body>
</html>