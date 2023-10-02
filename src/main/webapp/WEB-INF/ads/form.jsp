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

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>


