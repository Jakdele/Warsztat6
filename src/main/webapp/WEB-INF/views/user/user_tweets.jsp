<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../default/header.jsp" %>
<html>
<head>
    <title>Your tweets</title>
</head>
<body>

<table width="100%" cellspacing="0">
    <thead>
    <tr>
        <th>Title</th>
        <th>Created</th>
        <th>Content</th>
        <th>Details</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tweet" items="${userTweets}">
        <tr>
            <td> ${tweet.title} </td>
            <td> ${tweet.created} </td>
            <td> ${tweet.text} </td>
            <td><a href="/tweet/details/${tweet.id}">Tweet ${tweet.id}</a> </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
<%@include file="../default/footer.jsp" %>