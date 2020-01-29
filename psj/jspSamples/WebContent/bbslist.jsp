<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object ologin = session.getAttribute("login"); //내장객체로 받아오는 방법

	//MemberDto mem2 = (MemberDto)request.getSession().getAttribute("login"); 
	
	MemberDto mem = null;
	if(ologin == null){
		%>
		
		<script>
			alert("로그인 해 주십시오");
			location.href = "login.jsp";
		</script>
<%
	}
	mem = (MemberDto)ologin;
	
	BbsDao dao = BbsDao.getInstance();
	List<BbsDto> list = dao.getBbsList();
	
	//request.setAttribute("list", list);
%>
<%!
	public String arrow(int depth){
		String  rs = "<img src='image/arrow.png' width ='20px' height='20px' />";
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		
		String ts = "";
		for(int i =0; i<depth; i++){
			ts +=nbsp;
		}
	return depth == 0?"":ts+rs;
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4 align = "right" style="background-color : #f0f0f0"></h4>
	환영합니다<%=mem.getId() %>님

<a href="logout.jsp">로그아웃</a>
<h1>게시판</h1>
<div align="center">
	<table border="1">
		<col width= "70"><col width="600"><col width ="150">
		
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<%
			if(list ==null || list.size() ==0){	
		%>
		<tr>
			<td colspan = "3">작성된 글이 없습니다.</td>
		</tr>
		<%
			} else {
				for(int i = 0; i < list.size(); i++){
					BbsDto bbs = list.get(i);
					
		%>
		<tr>
			<th><%=i+1 %></th>
			<%if(bbs.getDel()==0){ %>
			<td><%=arrow(bbs.getDepth())%>
			
				<a href= "bbsdetail.jsp?seq=<%=bbs.getSeq()%>">
					<%=bbs.getTitle() %>
				</a>
			</td>
			<% } else{
			%>
			<td><%=arrow(bbs.getDepth())%>
				삭제된 게시글 입니다.
			</td>
			
			<%
			} %>
			<td align="center"><%=bbs.getId() %></td>
		</tr>
		<%
				}
			}
		%>
	</table>
</div>

<a href= "bbswrite.jsp">글쓰기</a>
</body>
</html>