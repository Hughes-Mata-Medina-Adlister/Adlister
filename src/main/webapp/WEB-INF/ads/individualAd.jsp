<%--
  Created by IntelliJ IDEA.
  User:Emilia Mata
  Date: 7/27/23
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Individual Ad Information</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="ad-container">
    <h1>Ad Information</h1>
    <p><strong>Title:</strong> ${ad.title}</p>
    <p><strong>Description:</strong> ${ad.description}</p>
    <p><strong>Price:</strong> ${ad.price}</p>
    <!-- Add more ad information fields as needed -->
</div>
</body>
</html>
