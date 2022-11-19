<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");	
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<h1>감상평 수정하기</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
<table>
	<tr>
		<td>사진:</td><input type="file" name="photo" value="<%=u.getPhoto()%>"/>
		<c:if test="${u.getPhoto() ne ''}"><br /><img src ="${pageContext.request.contextPath}/upload/<%=u.getPhoto()%>" class="photo"></c:if></td>
	</tr>
	<tr><td>카테고리:</td><td><input type="text" name="category" value="<%= u.getCategory()%>"/></td></tr>
	<tr><td>영화제목:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
	<tr><td>영화감독:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
	<tr><td>시청날짜:</td><td><input type="text" name="viewdate" value="<%= u.getViewdate()%>" /></td></tr>
	<tr><td>감상평:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
</table>
	<button type ="button" onclick="history.back()">뒤로가기</button>
	<button type ="submit">수정하기</button>
</form>
</body>
</html>