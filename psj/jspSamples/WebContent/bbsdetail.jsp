<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	    MemberDto mem = (MemberDto)session.getAttribute("login");
    
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	
    	BbsDao dao = BbsDao.getInstance();
    	BbsDto bbs = dao.getBbs(seq);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	작성자
	제목
	작성일  
	조회수  - 조회수 갱신  readcount() 함수 작성
	내용
	
	목록
 --%>
 <a href="logout.jsp">로그아웃</a>
 <div align = "center">
 	<table>
 		<tr>
 			<th>ID : </th>
 			<td>
 			<input type = "text" id = "id" name ="id" value ="<%=bbs.getId() %>" readonly>
 			
 			</td>
 		</tr>
 		<tr>
 			<th>Title : </th>
 			<td><input type = "text" id = "title" name ="title" size = "90" value = "<%=bbs.getTitle() %>" readonly></td>
 		</tr>
 		<tr>
 			<th>Write Date : </th>
 			<td><input type = "text" id = "title" name ="title" size = "90" value = "<%=bbs.getWdate() %>" readonly></td>
 		</tr>
 		<tr>
 			<th>Read Count : </th>
 			<td><input type = "text" id = "title" name ="title" size = "90" value = "<%=bbs.getReadcount() %>" readonly></td>
 		</tr>
 		<tr>
 			<th>Read Count : </th>
 			<td><%=bbs.getRef() %>-<%=bbs.getStep() %>-<%=bbs.getDepth() %></td>
 		</tr>
 		<tr>
 			<td colspan="2">
 			Content
 			</td>
 		</tr>
 		<tr>
 			<th colspan= "2">
 				<textarea rows="20" cols="97" name = "content" readonly><%=bbs.getContent() %></textarea>
 			</th>
 		</tr>
 		
 		<tr height="5">
 		</tr>
 		<tr  align="center">
 			<td colspan = "2">
 			<%if(mem.getId().equals(bbs.getId())){
 				
 			%>
 			<input type = "button" onclick="updateBbs(<%=bbs.getSeq() %>)" value ="수정하기"> 
 			<input type = "button" onclick="deletebbs(<%=bbs.getSeq() %>)" value ="삭제하기">
 			<%} %>
 				<form action ="answer.jsp" method="get">
 				<input type ="hidden" name ="seq" value ="<%=bbs.getSeq() %>">
 				<input type ="submit" value="댓글달기">
 				</form>
 				<input type ="button" id = "golist" onclick = "goList()" value="목록으로">
 			</td>
 		</tr>		
 	</table>
 	
 	<%-- form action ="answer.jsp" method="get">
 		<input type ="hidden" name ="seq" value ="<=bbs.getSeq() >">
 		<input type="submit" value="댓글">
 	</form--%>
 	
 	<script type="text/javascript">
	function goList() {
		location.href="bbslist.jsp";
	}
	function updateBbs(seq) {
		
		location.href ="bbsupdate.jsp?seq="+seq;
	}
	function deletebbs(seq) {
		location.href ="bbsdelete.jsp?seq="+seq;
	}
</script>
 </div>
</body>
</html>