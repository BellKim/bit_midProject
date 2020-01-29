<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto mem = dao.login(new MemberDto(id, pwd, null, null, 0));
	
	if(mem != null && !mem.getId().equals("")){
		//login 정보의 저장
		session.setAttribute("login", mem);
		session.setMaxInactiveInterval(30*60*60);
	
%>
	<script>
		alert("안녕하세요. <%=mem.getName()%>님");
		location.href ="./bbslist.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("id 혹은 password를 확인하십시오");
		location.href="./login.jsp"
	</script>
<%
	}

%>