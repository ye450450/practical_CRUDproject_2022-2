<%--
  Created by IntelliJ IDEA.
  User: coco
  Date: 2022-11-19
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>
<head>
    <meta> charset="UTF-8"
    <title>파일 업로드 결과</title>
</head>
<body>
<%
    String filename="";
    int sizeLimit = 15*1024*1024;
    //실제로 서버에 저장되는 path를 upload로 정한다.
    String realPath = request.getServletContext().getRealPath("upload");
    //혹시 저장될 경로가 없으면 생성한다.
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();
    //파일 업로드 처리하는 과정
    //DefaultFileRenamePolicy() - 등록된 이름이 존재할 경우의 처리방법
    MultipartRequest multipartRequest= new MultipartRequest(request,realPath,sizeLimit, "utf-8",new DefaultFileRenamePolicy());

    filename=multipartRequest.getFilesystemName("photo");
    %>
    <img src="${pageContext.request.contextPath}/upload/<%=filename%>">
</body>
</html>
