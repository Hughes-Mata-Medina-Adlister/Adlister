<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>

    <style>
        .btn{
            margin-top: 15px;
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Please Log In</h1>
    <% if (request.getAttribute("loginError") != null && (boolean) request.getAttribute("loginError")) { %>
    <div class="alert alert-danger" role="alert" id="alertMessage">
        Incorrect username or password! Please try again.
    </div>
    <% } %>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" value="${empty requestScope.username ? '' : requestScope.username}" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password" required>
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
    </form>
</div>

<!-- JavaScript to handle displaying the alert if username/password is incorrect -->

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var loginError = <%= request.getAttribute("loginError") != null && (boolean) request.getAttribute("loginError") %>;
        if (loginError) {
            var alertDiv = document.getElementById("alertMessage");
            alertDiv.style.display = "block";
        }
    });
</script>

</body>
</html>
