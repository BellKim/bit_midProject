<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String str = request.getParameter("isS");
    	String command =request.getParameter("command");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(command.equals("add")){ %>

<%
	if(str.equals("true")){
%>
	<script type="text/javascript">
		alert("성공적으로 추가되었습니다.");
		location.href = "custuserlist"; //컨트롤러 거쳐야함
	</script>

<%
	} else {
%>
	<script type="text/javascript">
		alert("추가되지 않았습니다.");
		location.href = "custuseradd?command=add";
	</script>
<%

	}
%>

<%
} else if(command.equals("modify")){
%>

<%
	if(str.equals("true")){
%>
	<script type="text/javascript">
		alert("성공적으로 수정되었습니다.");
		location.href = "custuserlist"; //컨트롤러 거쳐야함
	</script>

<%
	} else {
		String id = request.getParameter("id");
%>
	<script type="text/javascript">
		alert("추가되지 않았습니다.");
		location.href = "custuseradd?command=modifyAf&id=<%=id%>";
	</script>
<%

	}
%>

<%} else if(command.equals("delete")){ %>

<%
	if(str.equals("true")){
%>
	<script type="text/javascript">
		alert("성공적으로 삭제되었습니다.");
		location.href = "custuserlist"; //컨트롤러 거쳐야함
	</script>

<%
	} else {
		String id = request.getParameter("id");
%>
	<script type="text/javascript">
		alert("삭제되지 않았습니다.");
		location.href = "custuseradd?command=modify&id=<%=id%>";
	</script>
<%

	}
%>


<%} else if(command.equals("muldel")){%>
<%
	if(str.equals("true")){
%>
	<script type="text/javascript">
		alert("성공적으로 삭제되었습니다.");
		location.href = "custuserlist"; //컨트롤러 거쳐야함
	</script>

<%
	} else {
%>
	<script type="text/javascript">
		alert("삭제되지 않았습니다.");
		location.href = "custuserlist"; //컨트롤러 거쳐야함
	</script>
<%

	}
%>
<% } %>
</body>
</html>