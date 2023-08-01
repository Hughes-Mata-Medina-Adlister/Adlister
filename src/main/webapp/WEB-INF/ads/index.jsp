<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        @media (max-width: 800px) {
        }

        @media (max-width: 991px) {
        }

        .card-custom {
            height: 150px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 15px;
            margin: 15px;
            position: relative;
            transition: transform 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .card-custom:hover {
            transform: scale(1.15);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .card-title {
            font-size: large;
            align-content: center;
            display: flex;
            justify-content: center;
        }

        .card-text {
            padding: 15px;
            align-content: center;
            display: flex;
            justify-content: center;
        }

        .card-link {
            position: absolute;
            bottom: 5px;
        }
    </style>

</head>

<script>
    // JS to handle card click
    function handleCardClick(url) {
        // Redirect to the specified URL when the card is clicked
        window.location.href = url;
    }
</script>


<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>All listings</h1>

    <div class="row">
        <c:forEach var="ad" items="${ads}">
            <div onclick="handleCardClick('/profile')"> <!-- Use onclick attribute to call the JavaScript function and pass the URL -->
                <div class="card-custom col-3">
                    <div class="card-body">
                        <h5 class="card-title">${ad.title}</h5>
                        <p class="card-text">${ad.description}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script></body>
</html>
