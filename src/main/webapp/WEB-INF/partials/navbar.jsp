<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Adlister</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

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
            text-decoration: none;
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
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>
