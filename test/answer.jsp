<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

BbsDao dao = BbsDao.getInstance();
BbsDto bbs = dao.getBBS(seq);

request.setAttribute("_bbs", bbs);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>부모글</h1>
<div align="center">

<table border="2">
<col width="200"><col width="500">

<tr>
	<th>작성자</th>
	<td>${_bbs.id }</td>	
</tr>

<tr>
	<th>제목</th>
	<td>${_bbs.title }</td>	
</tr>

<tr>
	<th>작성일</th>
	<td>${_bbs.wdate }</td>	
</tr>

<tr>
	<th>조회수</th>
	<td>${_bbs.readcount }</td>
</tr>

<tr>
	<th>정보</th>
	<td>${_bbs.ref }-${_bbs.step }-${_bbs.depth }</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="70">${_bbs.content }</textarea>
	</td>
</tr>
</table>

<hr>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<h1 align="left">답글</h1>

<form action="answerAf.jsp" method="post">
<input type="hidden" name="seq" value="${_bbs.seq }">

<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50"
			value="<%=mem.getId() %>">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="70" name="content"></textarea>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="답글추가">
	</td>
</tr>
</table>

</form>

</div>

</body>
</html>