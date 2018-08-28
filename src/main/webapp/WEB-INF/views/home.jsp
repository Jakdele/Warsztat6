<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="default/header.jsp" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Homepage</title>
</head>
<body>
<c:if test="${empty currentUser}">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">You are not logged in</div>
        <div class="card-body">
            <div align="center">
                <div class="text-center mb-4">
                    <h5>Login</h5>
                    <div>
                        <a class="button" href="/login">Log in</a>
                    </div>
                </div>
                <div class="text-center mb-4">
                    <h5>Register as a new user</h5>
                    <div>
                        <a class="button" href="/register">Register</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>

    <c:if test="${not empty currentUser}">

    <div class="text-center">
        <h3>Tweet something new!</h3>
        <div>
                <%--@elvariable id="tweet" type="pl.coderslab.entity.Tweet"--%>
            <form:form modelAttribute="tweet" method="post" action="/tweet/add"> <br>
                <form:hidden path="user" value="${currentUser.id}"/>
                Text: <form:textarea path="text"/><br>
                <form:errors path="text"/><br>
                Title: <form:input path="title"/><br>
                <form:errors path="title"/><br>
                <input type="submit" value="Submit">
            </form:form>
        </div>
    </div>
    <hr>

    <c:forEach var="tweet" items="${tweets}">
    <div align="center">
        <table class="table-bordered" width="60%" cellspacing="0">
            <thead>
            <tr>
                <th>Author</th>
                <th>Title</th>
                <th>Created</th>
                <th>Content</th>
                <th>Details</th>
                <th>Comments</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td><a href="/user/details/${tweet.user.id}"> ${tweet.user.username}</a></td>
                <td> ${tweet.title} </td>
                <td> ${tweet.created} </td>
                <td> ${tweet.text} </td>
                <td><a href="/tweet/details/${tweet.id}">Tweet ${tweet.id}</a></td>
                <td align="center"> ${tweet.comments.size()}</td>
            </tr>

            </tbody>
        </table>
    </div>
    <br>
    <br>
    </c:forEach>

    </c:if>


</body>

<%@include file="default/footer.jsp" %>