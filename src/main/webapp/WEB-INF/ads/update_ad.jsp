<%--
  Created by IntelliJ IDEA.
  User: Emilia Mata
  Date: 7/27/23
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Ad</title>
</head>
<body>
<h1>Update Ad</h1>
<form action="${pageContext.request.contextPath}/ads/update/${ad.id}" method="post">
    <%--@declare id="title"--%><%--@declare id="content"--%><label for="title">Title:</label>
    <input type="text" name="title" value="${ad.title}"><br>
    <label for="content">Content:</label>
    <textarea name="content">${ad.content}</textarea><br>
    <input type="submit" value="Update">
</form>
</body>
</html>
