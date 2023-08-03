<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%--
  Created by IntelliJ IDEA.
  User: snowbunny
  Date: 8/1/23
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Edit Ad" />
</jsp:include>
<jsp:include page="../partials/navbar.jsp" />
</head>
<body>

<div class="container ad">
    <h1>Edit your ad</h1>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="/ads/edit" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text" value="${ad.title}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text" required>${ad.description}</textarea>
                </div>
                <input type="hidden" name="id" value="${ad.id}">
                <div>
                    <div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                    <div>
                        <button class="btn btn-danger" onclick="confirmDelete(${ad.id})">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function confirmDelete(adId) {
        var isConfirmed = confirm("Are you sure you want to delete this ad?");
        if (isConfirmed) {
            window.location.href = "/ads/delete?id=" + adId;
        }
    }
</script>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>
