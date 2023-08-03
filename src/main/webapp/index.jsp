<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 8/3/23
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Adlister" />
    </jsp:include>

    <title>Main Page</title>

    <style>

        .card-custom {
            height: 350px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 15px;
            margin: 15px;
            position: relative;
            transition: transform 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            flex-shrink: 0;
        }

        .card-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .card-title {
            margin-top: 15px;
            font-size: large;
            align-content: center;
            display: flex;
            justify-content: center;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .card-category {
            font-size: medium;
            align-content: center;
            display: flex;
            justify-content: center;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .card-text {
            text-align: center;
            padding: 10px;
            align-self: center;
        }

        .card-link {
            position: absolute;
            bottom: 5px;
        }

        .icon {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<script>
    // JS to handle card click
    function handleCardClick(url) {
        // Redirect to the specified URL when the card is clicked
        window.location.href = url;
    }
</script>

<div class="container">
    <h1 class="all">Main page</h1>

    <div class="row d-flex justify-content-center">
        <h1>Codeup Adlister Project</h1>
        <div>
            <h2>Specifications</h2>
            <ul>
                <li>Users sign up for the site with an email and password</li>
                <li>Users create ads with a title and description and category.</li>
                <li>Each ad is associated with the user that created it.</li>
                <li>An ad can be in one or more categories (for example, "help wanted", "giveaway", or "furniture")</li>
            </ul>
        </div>
    </div>
</div>
</ul>
</body>
</html>