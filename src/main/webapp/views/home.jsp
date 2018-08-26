<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
</head>
<body>
<c:if test="${empty currentUser}">
<div>
    <p>Login</p>
    <a class="button" href="/login">Log in</a>
    <div>
        <p>Register as a new user</p>
        <a class="button" href="/register">Register</a>
    </div>
</div>
</c:if>

<c:if test="${not empty currentUser}">
    <p>Edit profile</p>
    <a class="button" href="/user/edit/${currentUser.id}">Edit</a>
    <p>Show tweets</p>
    <a class="button" href="/user/details/${currentUser.id}">Your tweets</a>
    <p>Show messages</p>
    <a class="button" href="/message/list/${currentUser.id}">Your messages</a>

    <c:if test="${not empty tweets}">
    <table width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Author</th>
            <th>Title</th>
            <th>Created</th>
            <th>Content</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tweet" items="${tweets}">
            <tr>
                <td> <a href="/user/details/${tweet.user.id}"> ${tweet.user.username}</a> </td>
                <td> ${tweet.title} </td>
                <td> ${tweet.created} </td>
                <td> ${tweet.text} </td>
                <td><a href="/tweet/details/${tweet.id}">Tweet ${tweet.id}</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>
<hr>
    <h3>Add new tweet</h3>
    <div>
            <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
        <form:form modelAttribute="tweet" method="post" action="/tweet/add"><br>
            <form:hidden path="user" value="${currentUser.id}"/>
            Text: <form:textarea path="text"/><br>
            Title: <form:input path="title"/><br>
            <input type="submit" value="Submit">
        </form:form>
    </div>
<br>
    <p>Log out</p>
    <a class="button" href="/logout">Log out</a>
</c:if>


</body>
</html>
