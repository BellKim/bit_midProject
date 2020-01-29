<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CustUserDto> list = (List<CustUserDto>)request.getAttribute("custlist");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custuserlist</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h1>고객 목록</h1>
<div align="center" style="width : 700px">
<div align = "right">
<form id ="frm">
<select id="searchOption" name = "option">
	<option value ="id">ID</option>
	<option value ="name">NAME</option>
</select>
<input type="text" size="10" id ="_search" name="search">
<input type="button" id="searchbtn" value="검색">
</form>
<script type="text/javascript">
	$(function(){
		$("#searchbtn").click(function(){
			var search = $("#_search").val();
			
			if(search==""){
				alert("검색단어를 입력해주세요");
				return
			}
			$("#frm").attr("action","searchList.jsp").submit();
			
		});
	});

</script>

</div>

<form id="frm1" method="post">
<input type ="hidden" name="command" value="muldel">
<table style ="width : 700px;">
	<col width = "100">
	<col width = "300">
	<col width = "300">
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="3"></td>
	</tr>
	<tr>
		<th bgcolor = "#ffff00">
			<input type ="checkbox" name ="alldel" onclick="deleteChecks(this.checked)">
		</th>
		<th>ID</th>
		<th>NAME</th>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="3"></td>
	</tr>
	
	<%
		if(list.size() == 0){
			
	%>
	<tr bgcolor ="#f6f6f6">
		<td colspan="3" align ="center">고객 리스트가 존재하지 않습니다.</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="3"></td>
	</tr>
	<%
	
	} else {	
		for(int i=0; i<list.size(); i++){	
			CustUserDto cust = list.get(i);
	%>
		<tr bgcolor="#f6f6f6">
			<td align ="center" bgcolor="#ffff00">
				<input type="checkbox" name="delck" value="<%=cust.getId() %>"> 
			</td>
			<td align="center">
				<%=cust.getId() %>
			</td>
			<td align="center">
				<a href="custuserdetail?id=<%=cust.getId() %>"> <%=cust.getName() %> </a>
			</td>
			
		</tr>

		
	<%
		}
	%>
	<%
	}
	%>
		<tr>
		<td height="2" bgcolor ="#0000ff" colspan="3"></td>
	</tr>
	<tr>
		<!-- 다중 삭제 버튼  -->
		<td align="center" height="1" bgcolor="#c0c0c0" colspan="3">
			<input type ="button" id="delBtn" value = "고개정보 삭제">
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor ="#0000ff" colspan="3"></td>
	</tr>
	
	<tr bgcolor="#f6f6f6" >
		<td colspan="3">
			<a href="custuseradd?command=add">고객 정보 추가</a>
		</td>
</table>
</form>
</div>

<script type="text/javascript">
	function deleteChecks(ch) {
		//alert(ch);
		var arrCheck = document.getElementsByName("delck");
		for (var i = 0; i < arrCheck.length; i++) {
			arrCheck[i].checked = ch;
		}
	}
	
	$(function(){
		$("#delBtn").click(function(){
			var arrCheck = $("input[name='delck']:checked").length;

			if(arrCheck==0){
				alert("삭제할 고객을 선택해주세요");
				return
			}
			$("#frm1").attr("action","custuserdelete").submit();
			
		});
	});
</script>

</body>
</html>