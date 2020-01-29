<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	String id = request.getParameter("id");
    	System.out.println(id);
    	
    	MemberDao dao = MemberDao.getInstance();
    	boolean b = dao.checkId(id);
    	
    	if(b == true){ // id 있음
    		out.println("no");
    	} else { // id 없음
    		out.println("yes");
    		
    	}
%>
