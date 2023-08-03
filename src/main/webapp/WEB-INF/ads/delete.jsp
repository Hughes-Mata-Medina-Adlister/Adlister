<%--
  Created by IntelliJ IDEA.
  User: zack_
  Date: 8/1/2023
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Delete An Ad" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
  <h1>Delete an Ad</h1>
  <form class="form-inline" action="/ads/delete" method="post">

      <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Preference</label>
      <select name="post-id" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
        <option selected>Choose...</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
        <option value="4">Four</option>
        <option value="5">Five</option>
        <option value="6">Six</option>
        <option value="7">Seven</option>
      </select>


      <button type="submit" class="btn btn-danger my-1">Delete</button>
  </form>
</div>
</body>
</html>
