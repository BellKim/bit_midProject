<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<% request.setCharacterEncoding("utf-8"); %>
<%

	int seq = Integer.parseInt(request.getParameter("seq"));
	BbsDao dao = BbsDao.getInstance();
	dao.readCountUp(seq);	//카운트가 먼저 올라가고 게시물 정보를 가져옴
	
	BbsDto bbs = dao.getBbsOne(seq);
	System.out.println(bbs.toString());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<%-- MemberDto mem = (MemberDto)request.getSession().getAttribute("login"); --%>
<%
	Object ologin = session.getAttribute("login");
	MemberDto mem = null;
	if(ologin == null){
		//session이 종료되어 로그아웃됐을때
%>
		<script>
			alert("로그인 해 주십시오.");
			location.href= "login.jsp";
		</script>
<%
	} else {
		mem = (MemberDto)ologin;
	}

%>

<%--

작성자
제목
작성일
조회수	- readcount 함수 하나 더만들어서 readcount 증가하게
내용
  버튼 -(내글만- 수정,삭제 ) 댓글 ,목록
 --%>
 <h3 align="center">게시물 보기</h3>
 <style>
 	table {
 		border: 1px solid #000;
 		margin: 10px;
 	}
 	tr, td{
 		padding: 10px;
 		border-bottom: 1px solid #EAEAEA;
 	}
 	table .tdcenter{
 		text-align: center;
 	}
 	
 	a {
 		text-decoration:  none;
 	}
 </style>
 
 <a href="logout.jsp">로그아웃</a>
<div align="center">
	<table>
		<col width="200"><col width="600">
		<tr>
			<td class="tdcenter">작성자</td>
			<td><%=bbs.getId() %></td>
		</tr>
		<tr>
			<td class="tdcenter">글제목</td>
			<td><%=bbs.getTitle() %></td>
		</tr>
		<tr>
			<td class="tdcenter">작성일</td>
			<td><%=bbs.getWdate()%></td>
		</tr>
		<tr>
			<td class="tdcenter">조회수</td>
			<td><%=bbs.getReadcount()%></td>
		</tr>
		<tr>
			<td class="tdcenter">정보</td>
			<td><%=bbs.getRef()%>-<%=bbs.getStep()%>-<%=bbs.getDepth() %></td>
		</tr>
		<tr>
			<td class="tdcenter">글내용</td>
			<td align="center">
				<%-- <pre><%=bbs.getContent() %></pre> --%>
				<textarea rows="10" cols="90" readonly="readonly"><%=bbs.getContent() %></textarea>
			</td>
		</tr>
		<%-- <tr>
			<td colspan="2" align="center">
				<%
					if(mem.getId().equals(bbs.getId())){
				%>
					<button type="button" id="updateBtn">수정</button>
					<button type="button" id="delBtn">삭제</button>
				<%
					}
				%>
				<button type="button" id="repBtn">댓글</button>
				<button type="button" id="listBtn">목록</button>
			</td>
		</tr> --%>
	</table>
	
		<%
			if(bbs.getId().equals(mem.getId())){
		%>
			<button type="button" onclick="updateBtn(<%=bbs.getSeq() %>)">수정</button>
			<button type="button" onclick="delBtn(<%=bbs.getSeq() %>)">삭제</button>
		<%
			}
		%>
		
		<form action="answer.jsp" method="get">
			<input type="hidden" name="seq" value="<%=bbs.getSeq()%>">
			<input type="submit" value="댓글" >
		</form>
			<button type="button" onclick="location.href='bbslist.jsp'">목록</button>
</div> 
			
				
	<script>
		function updateBtn(seq){
			location.href="bbsupdate.jsp?seq="+seq;
		}
		
		function delBtn(seq){
			location.href="bbsdelete.jsp?seq="+seq;
		}
	</script>
</body>
</html>