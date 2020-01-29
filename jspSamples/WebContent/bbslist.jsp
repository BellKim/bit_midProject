<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="oracle.net.aso.o"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// 댓글의 여백과 이미지를 추가하는 함수
	public String arrow(int depth){
		String rs = "<img src='./image/arrow.png' width='20px' height='20px'/>";
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		
		String ts="";
		for(int i=0;i<depth;i++){
			//depth의 갯수에 따라 여백의 숫자가 달라짐
			ts += nbsp;	//첫 댓글은 1번만 띄고, 첫 댓글의 대댓글은 2번이 띔
		}
		
		return depth==0?"":ts+rs; //depth가 0이면 기본글이니까 여백X, depth가 1이면 공백이 추가되고 댓글이미지가 붙어서 return 
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//MemberDto mem = (MemberDto) session.getAttribute("login");	//원래는 session은 object로 받아와서 캐스트변환을 해줘야함
	//request.getSession().getAttribute("login");
	
	//session이 있는지 없는지 페이지마다 다 써줘야함 
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
	
	BbsDao dao = BbsDao.getInstance();
	List<BbsDto> list = dao.getBbsList();
	
	request.setAttribute("list", list);//EL태그
%>
<h4 align="right" style="background-color: #f0f0f0">환영합니다. <%=mem.getId() %>님</h4>
<a href="logout.jsp">로그아웃</a>
<h1>게시판</h1>

<div align="center">
	<table border="1">
		<col width="70"><col width="600"><col width="150">
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th>
		</tr>
		<%
			if(list==null || list.size() == 0){ //글이 1개도 없을때
		%>
				<tr>
					<td colspan="3" align="center">작성된 글이 없습니다.</td>
				</tr>
		<%		
			} else {	//글이 1개이상일때
				for(int i=0; i<list.size();i++){
					BbsDto bbs = list.get(i);
		%>
				<tr>
					<th><%=i+1 %></th><%--글번호 --%>
					<td>
						<%=arrow(bbs.getDepth()) %>	<%--댓글이 있을때만(depth가 1이상일때만 출력됨) --%>
						<a href="bbsdetail.jsp?seq=<%=bbs.getSeq()%>">
							<%=bbs.getTitle() %>	<%--글제목 --%>
						</a>
					</td>
					<td align="center"><%=bbs.getId() %></td><%--작성자 --%>
				</tr>
		<%
				}// for문 종료
			}//if문종료
		%>
	</table>
</div>


<a href="bbswrite.jsp">글쓰기</a>



</body>
</html>