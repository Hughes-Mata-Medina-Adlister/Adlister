<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>

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
    <h1 class="all">All listings</h1>

    <div class="row d-flex justify-content-center">
        <c:forEach var="ad" items="${ads}">
            <!-- Use onclick attribute to call the JavaScript function and pass the URL -->
            <div class="card-custom col-md-3 col-sm-6" onclick="handleCardClick('/ad?adId=${ad.id}')">
                <div class="card-body">
                    <p class="card-title card-header">${ad.title}</p>
                    <div class="icon">
                        <img src="https://picsum.photos/240/160?random=${ad.id}" class="icon">
                    </div>
                    <p class="card-text">${ad.description}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>