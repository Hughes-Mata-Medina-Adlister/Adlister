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


    <style>
        .btn {
            margin-top: 15px;

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

            <textarea id="description" name="description" class="form-control" rows="5" required>${empty requestScope.description ? '' : requestScope.description}</textarea>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <select id="category" name="category" class="form-control" required>
                <option value="">Select a category</option>
                <option value="Clothing">Clothing</option>
                <option value="Pets">Pets</option>
                <option value="Shoes">Shoes</option>
                <option value="Vehicles">Vehicles</option>
                <option value="Electronics">Electronics</option>
                <option value="Rentals">Rentals</option>
                <option value="Tools">Tools</option>
                <option value="Hobby">Hobby</option>
                <option value="Instruments">Instruments</option>
                <option value="Other">Other</option>
            </select>
        </div>

            <textarea id="description" name="description" class="form-control description" rows="5" required>${empty requestScope.description ? '' : requestScope.description}</textarea>
        </div>

        <div class="form-group">
            <%--@declare id="categories"--%><label for="categories">Categories</label><br>
            <input type="checkbox" id="category1" name="categories" value="Clothing">
            <label for="category1">Clothing</label><br>
            <input type="checkbox" id="category2" name="categories" value="Electronics">
            <label for="category2">Electronics</label><br>
            <input type="checkbox" id="category3" name="categories" value="Vehicles">
            <label for="category3">Vehicles</label><br>
            <input type="checkbox" id="category4" name="categories" value="Tools">
            <label for="category4">Tools</label><br>
            <input type="checkbox" id="category5" name="categories" value="Furniture">
            <label for="category5">Furniture</label><br>
            <input type="checkbox" id="category6" name="categories" value="Appliances">
            <label for="category6">Appliances</label><br>
            <input type="checkbox" id="category7" name="categories" value="Toys & Games">
            <label for="category7">Toys & Games</label><br>
            <input type="checkbox" id="category8" name="categories" value="Books & Magazines">
            <label for="category8">Books & Magazines</label><br>
            <input type="checkbox" id="category9" name="categories" value="Sports Equipment">
            <label for="category9">Sports Equipment</label><br>
            <input type="checkbox" id="category10" name="categories" value="Home & Garden">
            <label for="category10">Home & Garden</label><br>
            <input type="checkbox" id="category11" name="categories" value="Other">
            <label for="category11">Other</label><br>
        </div>

        <input type="submit" class="btn btn-block btn-primary" value="Create Ad">
    </form>
</div>


<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>