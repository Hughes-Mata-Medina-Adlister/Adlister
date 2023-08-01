<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Adlister</title>
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <style>
        @media (max-width: 991px) {
            .navbar-nav {
                display: flex;
                justify-content: flex-end;
                margin-right: 0;
            }
            .nav-item {
                margin: 0 10px;
            }
        }

        .custom-navbar{
            background-color: lightblue;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .custom-navbar-left{
            font-size: xxx-large;
            padding: 15px;
        }
        .custom-navbar-left:hover{
            color: blueviolet;
            text-decoration: none;
        }
        .custom-navbar-left:active{
            color: green;
        }

        .custom-navbar-right{
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-right: 30px;
        }

        .nav-btn {
            font-size: x-large;
            margin: 0 5px;
        }

    </style>
</head>

<body>
<nav class="custom-navbar">
    <!-- Title -->
    <div>
        <a class="custom-navbar-left" href="/index.jsp">
            Adlister
        </a>
    </div>
    <!-- Buttons -->
    <div class="custom-navbar-right">
        <c:choose>
            <c:when test="${user != null}">
                <c:if test="${not fn:contains(pageContext.request.requestURI, '/profile')}">
                    <a class="nav-btn btn btn-primary" href="/profile">Profile</a>
                </c:if>
                <c:if test="${not fn:contains(pageContext.request.requestURI, '/ads')}">
                    <a class="nav-btn btn btn-primary" href="/ads">Ads</a>
                </c:if>
                <c:if test="${not fn:contains(pageContext.request.requestURI, '/ads/create')}">
                    <a class="nav-btn btn btn-success" href="/ads/create">Create</a>
                </c:if>
                <a class="nav-btn btn btn-danger" href="/logout">Logout</a>
            </c:when>
            <c:otherwise>
                <c:if test="${not fn:contains(pageContext.request.requestURI, '/login')}">
                    <a class="nav-btn btn btn-primary" href="/login">Login</a>
                </c:if>
                <c:if test="${not fn:contains(pageContext.request.requestURI, '/register')}">
                    <a class="nav-btn btn btn-success" href="/register">Register</a>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
