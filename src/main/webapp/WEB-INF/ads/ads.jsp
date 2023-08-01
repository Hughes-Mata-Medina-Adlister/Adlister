<%--@elvariable id="ads" type="java.awt.desktop.SystemHotkey"--%>
<%--
  Created by IntelliJ IDEA.
  User: snowbunny
  Date: 7/31/23
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ads</title>
</head>
<body>
<h1>Ads</h1>

<table>
    <tr>
        <th>Title</th>
        <th>Description</th>
    </tr>
    <c:forEach var="ad" items="${ads}">
        <tr>
            <td>${ad.title}</td>
            <td>${ad.description}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

