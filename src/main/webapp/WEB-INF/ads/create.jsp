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
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>

    <title>Create a new ad</title>

    <style>
        .description{
            margin-bottom: 15px;
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
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${empty requestScope.title ? '' : requestScope.title}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control description" rows="5" required>${empty requestScope.description ? '' : requestScope.description}</textarea>
        </div>

        <div class="form-group">
            <label for="categories">Categories</label><br>
            <input type="checkbox" id="category1" name="categories" value="Clothing">
            <label for="category1">Clothing</label><br>
            <input type="checkbox" id="category2" name="categories" value="Electronics">
            <label for="category2">Electronics</label><br>
            <input type="checkbox" id="category3" name="categories" value="Vehicles">
            <label for="category3">Vehicles</label><br>
            <input type="checkbox" id="category4" name="categories" value="Tools">
            <label for="category4">Tools</label><br>
            <!-- Add more checkboxes for other possible categories if needed -->
        </div>

        <input type="submit" class="btn btn-block btn-primary" value="Create Ad">
    </form>
</div>

</body>
</html>