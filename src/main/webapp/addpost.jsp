<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<%@ page import="com.example.common.FileUpload" %>
<%@ page import="com.example.bean.BoardVO" %>

<jsp:useBean id="u" class="com.example.bean.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
	request.setCharacterEncoding("utf-8");
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload= new FileUpload();
	BoardVO t = upload.uploadPhoto(request);

	int i = boardDAO.insertBoard(t);
	String msg = "감상평 추가 성공 !";
	if(i == 0) msg = "[에러] 감상평 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>