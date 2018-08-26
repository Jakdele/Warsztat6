<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log in</title>
    <style>
        .button {
            font: bold 11px Arial;
            text-decoration: none;
            background-color: #EEEEEE;
            color: #333333;
            padding: 2px 6px 2px 6px;
            border-top: 1px solid #CCCCCC;
            border-right: 1px solid #333333;
            border-bottom: 1px solid #333333;
            border-left: 1px solid #CCCCCC;
        }
    </style>
</head>
<body>
<h3>Log in</h3>
    <form action="/login" method="post">
        <c:if test="${not empty errorMsg}">
            ${errorMsg}
        </c:if>
        <div>Username: <input type="text" name="username">
        </div>
        <div>
        Password: <input type="password" name="password">
        </div>
        <input type="submit" value="Submit">
    </form>
<div>
    Would you like to register as a new uer instead?
    <a class="button" href="/register">Register</a>

</div>

</body>
</html>
