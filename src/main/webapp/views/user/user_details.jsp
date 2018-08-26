<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User details</title>
</head>
<body>
<c:if test="${not empty currentUser}">
    <c:if test="${currentUser.id == showcasedUser.id}">
        <p>Edit profile</p>
        <a class="button" href="/user/edit/${currentUser.id}">Edit</a>
    </c:if>
    <c:if test="${currentUser.id != showcasedUser.id}">
        <h2>${showcasedUser.username}</h2>
        <p>Send message</p>
        <a class="button" href="/message/send/${showcasedUser.id}">Send</a>
    </c:if>

    <c:if test="${not empty tweets}">
        <table width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>Author</th>
                <th>Title</th>
                <th>Created</th>
                <th>Content</th>
                <th>Details</th>
                <th>No. of comments</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="tweet" items="${tweets}">
                <tr>
                    <td> ${tweet.user.username} </td>
                    <td> ${tweet.title} </td>
                    <td> ${tweet.created} </td>
                    <td> ${tweet.text} </td>
                    <td><a href="/tweet/details/${tweet.id}">Tweet ${tweet.id}</a></td>
                    <td>   ${tweet.comments.size()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <hr>
</c:if>
<c:if test="${empty currentUser}">
    <jsp:forward page="/"/>
</c:if>
</body>
</html>
