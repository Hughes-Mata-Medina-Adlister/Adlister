<%--
  Created by IntelliJ IDEA.
  User: snowbunny
  Date: 8/1/23
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form Submission</title>
</head>
<body>
    <form action="submitForm" method="post">
        Username: <input type="text" name="username"><br>
        Email: <input type="text" name="email"><br>
        <!-- Add other forms fields as needed -->
        <input type="submit" value="Submit">
    </form>
    <%-- Display error message if it exists --%>
    <c:if test="${not empty userData.errorMessage}">
        <p style="color: red">${userData.errorMessage}</p>
    </c:if>
</body>
</html>


