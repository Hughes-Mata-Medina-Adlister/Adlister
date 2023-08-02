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
<div class="form-group">
    <label for="description">Description</label>
    <textarea id="description" name="description" class="form-control" type="text" required> <c:out value="${ad.getDescription()}"/></textarea>
</div>
<div class="form-group btn-group">
    <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        Categories
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <c:forEach var="category"
                   items="${sessionScope.categories}">
            <input type="checkbox" name="category[]" id="${category}" value="${category}">
            <label for="${category}" href="/category?category=${category}"> <c:out value="${category}"/> </label>
            <br>
        </c:forEach>
    </ul>
    </div>
</body>
</html>
