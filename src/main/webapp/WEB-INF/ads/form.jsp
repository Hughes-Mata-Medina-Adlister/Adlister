<%--
  Created by IntelliJ IDEA.
  User: snowbunny
  Date: 8/1/23
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Submission</title>
</head>
<body>
<form action="submitForm" method="post">
    Username: <input type="text" name="username"><br>
    <%-- Display username error message if it exists --%>
    <c:if test="${not empty userData.usernameError}">
        <p style="color: red">${userData.usernameError}</p>
    </c:if>

    Email: <input type="text" name="email"><br>
    <%-- Display email error message if it exists --%>
    <c:if test="${not empty userData.emailError}">
        <p style="color: red">${userData.emailError}</p>
    </c:if>

    <!-- Add other form fields and their corresponding error messages as needed -->

    <input type="submit" value="Submit">
</form>
</body>
</html>


