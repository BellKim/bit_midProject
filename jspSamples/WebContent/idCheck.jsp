<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="dto.MemberDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	System.out.println("id: "+id);
	MemberDao dao = MemberDao.getInstance();
	boolean b = dao.getId(id);
	if(b){//아이디가 있을때
		out.println("NO");
	} else {	//아이디가 없을때
		out.println("YES");
	}
%>
