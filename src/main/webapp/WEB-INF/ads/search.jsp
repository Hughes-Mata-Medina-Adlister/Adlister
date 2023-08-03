<%--
  Created by IntelliJ IDEA.
  User: zack_
  Date: 8/3/2023
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

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
