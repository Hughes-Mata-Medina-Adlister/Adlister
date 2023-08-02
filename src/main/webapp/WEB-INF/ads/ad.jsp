<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 8/1/23
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${ad.title}</title>
    <jsp:include page="/WEB-INF/partials/head.jsp"></jsp:include>

    <style>
        .ad{
            margin-top: 50px;
        }
        .header{
            display: flex;
            justify-content: center;
        }
        .description{
            display: flex;
            justify-content: center;
        }
        .username{
            display: flex;
            justify-content: center;
        }
        .big-image{
            justify-content: center;
            display: flex;
            align-content: center;
            margin: 30px 0 15px 0;
        }
        .small-image{
            justify-content: center;
            display: flex;
            align-content: center;

        }
        .icon{
            margin: 20px 15px 30px 15px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container ad">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div>
                <div class="ad-title header">
                    <h3>${ad.title}</h3>
                </div>
                <div class="image big-image">
                    <img src="https://picsum.photos/600/400">
                </div>
                <div class="image small-image">
                    <img src="https://picsum.photos/60/40" class="icon">
                    <img src="https://picsum.photos/60/40" class="icon">
                    <img src="https://picsum.photos/60/40" class="icon">
                    <img src="https://picsum.photos/60/40" class="icon">
                    <img src="https://picsum.photos/60/40" class="icon">
                    <img src="https://picsum.photos/60/40" class="icon">
                    <img src="https://picsum.photos/60/40" class="icon">
                </div>
                <div class="description">
                    <h3>${ad.description}</h3>
                </div>
                <div>
                    <h6 class="username">Posted by: ${user.username}</h6>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>