<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	System.out.println("id: "+id+" pwd: "+pwd); 
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto mem = dao.getLogId(new MemberDto(id, pwd, null,null,0));
	
	if(mem != null && !mem.getId().equals("")){ //로그인성공했을때
			//로그인 정보 저장 == session 에 저장
		session.setAttribute("login", mem);
		session.setMaxInactiveInterval(30*60*60);	//유효기간
%>
	<script>
		alert("안녕하세요 <%=mem.getName()%>님 환영합니다.");
		location.href="./bbslist.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("로그인에 실패했습니다. 다시 시도해주세요");
		location.href="./login.jsp";
	</script>
<%
	}
%>
