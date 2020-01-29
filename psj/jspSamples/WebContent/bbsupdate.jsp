<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
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
 <a href="logout.jsp">로그아웃</a>
 <div align = "center">
 <form action="updateAf.jsp" method="post">
 	<input type ="hidden" name = "seq" value ="<%=bbs.getSeq() %>">
 	<table>
 		<tr>
 			<th>ID : </th>
 			<td>
 			<input type = "text" id = "id" name ="id" value ="<%=bbs.getId() %>" readonly>
 			
 			</td>
 		</tr>
 		<tr>
 			<th>Title : </th>
 			<td><input type = "text" id = "title" name ="title" size = "90" value = "<%=bbs.getTitle() %>"></td>
 		</tr>
 		<tr>
 			<td colspan="2">
 			Content
 			</td>
 		</tr>
 		<tr>
 			<th colspan= "2">
 				<textarea rows="20" cols="97" name = "content"><%=bbs.getContent() %></textarea>
 			</th>
 		</tr>
 		
 		<tr height="5">
 		</tr>
 		<tr  align="center">
 			<td colspan = "2">
 				<input type ="submit"  value="수정하기">
 				<input type ="button" onclick = "goDetail(<%=bbs.getSeq() %>)" value="돌아가기">
 			</td>
 		</tr>		
 	</table>
 </form>
</div>

<script type="text/javascript">
	function goDetail(seq) {
		location.href ="bbsdetail.jsp?seq="+seq;
		
	}
</script>
</body>
</html>