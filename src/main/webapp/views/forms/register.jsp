<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User form</title>
</head>
<body>
<%--@elvariable id="user" type="pl.coderslab.entity.User"--%>
<form:form modelAttribute="user" method="post">
   <div>Username :<form:input path="username"/>
    <form:errors path="username"/></div>
    <div> Email:<form:input path="email"/>
    <form:errors path="email"/></div>
    <div> Password:<form:password path="password"/>
    <form:errors path="password"/></div>
    <form:hidden path="enabled" value="true"></form:hidden>
    <input type="submit" value="Submit">
</form:form>
</body>
</html>
