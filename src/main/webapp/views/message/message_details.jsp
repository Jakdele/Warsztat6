<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Message details</title>
</head>
<body>
<c:if test="${not empty currentUser}">
    <table width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Sender</th>
            <th>Receiver</th>
            <th>Content</th>
            <th>Date sent</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td><a href="/user/details/${message.sender.id}"> ${message.sender.username}</a></td>
            <td><a href="/user/details/${message.receiver.id}"> ${message.receiver.username}</a></td>
            <td>${message.msgtext}</td>
            <td>${message.created}</td>
            </td>
        </tr>

        </tbody>
    </table>
</c:if>

<a class="button" href="/message/list/${currentUser.id}">Back</a>
</body>
</html>
