<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
<table>
    <tr><td>카테고리:</td><td><input type="text" name="category"/></td></tr>
    <tr><td>영화제목:</td><td><input type="text" name="title"/></td></tr>
    <tr><td>감독:</td><td><input type="text" name="writer"/></td></tr>
    <tr><td>감상평:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
    <tr><td>시청 날짜:</td><td><input type="text" name="viewdate"/></td></tr>
    <tr><td>사진:</td><td><input type="file" name="photo"/></td></tr>
    <tr><td><a href="posts.jsp">감상평 목록보기</a></td><td align="right"><input type="submit" value="감상평 등록하기"/></td></tr>
</table>
</form>

</body>
</html>