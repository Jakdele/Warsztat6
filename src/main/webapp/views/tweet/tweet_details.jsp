<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
</head>
<body>
<c:if test="${not empty currentUser}">
<table width="100%" cellspacing="0">
    <thead>
    <tr>
        <th>Author</th>
        <th>Title</th>
        <th>Created</th>
        <th>Content</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td> <a href="/user/details/${tweet.user.id}"> ${tweet.user.username}</a> </td>
            <td> ${tweet.title} </td>
            <td> ${tweet.created} </td>
            <td> ${tweet.text} </td>
        </tr>
    </tbody>
</table>

<c:if test="${not empty comments}">
    <hr>
    <p align="center"> Comments</p>
    <table width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Author</th>
            <th>Date added</th>
            <th>Content</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="comment" items="${comments}">
            <tr>
                <td> <a href="/user/details/${comment.user.id}">  ${comment.user.username}</a> </td>
                <td> ${comment.created} </td>
                <td> ${comment.text} </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<hr>
<h3>Add new comment</h3>
<div>
    <%--@elvariable id="comment" type="pl.coderslab.entity.Comment"--%>
    <form:form modelAttribute="comment" method="post" action="/comment/add"><br>
        <form:hidden path="user" value="${currentUser.id}"/>
        <form:hidden path="tweet" value="${tweet.id}"/>
        Text: <form:textarea path="text"/><br>
        <input type="submit" value="Submit">
    </form:form>
</div>
</c:if>



</body>
</html>
