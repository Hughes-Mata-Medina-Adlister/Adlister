<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>

    <style>
        .btn {
            margin-top: 15px;
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
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
        <input type="submit" class="btn btn-block btn-primary" value="Create Ad">
    </form>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>