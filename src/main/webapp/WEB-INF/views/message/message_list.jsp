<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../default/header.jsp" %>
<html>
<head>
    <title>Your messages</title>
</head>
<body>

    <c:if test="${empty received && empty sent}">
        <h2> You have no messages</h2>
    </c:if>
    <c:if test="${not empty received}">
        <table class="table table-bordered" cellspacing="0">
            <thead>
            <tr>
                <th>Sent by</th>
                <th>Content</th>
                <th>Details</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="message" items="${received}">
                <tr>
                    <td><a href="/user/details/${message.sender.id}"> ${message.sender.username}</a></td>
                    <c:if test="${message.checked == true}">
                        <td> ${fn:substring(message.msgtext,0,30)}</td>
                    </c:if>
                    <c:if test="${message.checked == false}">
                        <td><b>${fn:substring(message.msgtext,0,30)}</b></td>
                    </c:if>
                    <td><a href="/message/details/${message.id}">Message ${message.id}</a> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <br>
    </c:if>
    <c:if test="${not empty sent}">
        <table class="table table-bordered" cellspacing="0">
            <thead>
            <tr>
                <th>Sent to</th>
                <th>Content</th>
                <th>Details</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="message" items="${sent}">
                <tr>
                    <td><a href="/user/details/${message.receiver.id}"> ${message.receiver.username}</a></td>
                    <c:if test="${message.checked == true}">
                        <td> ${fn:substring(message.msgtext,0,30)}</td>
                    </c:if>
                    <c:if test="${message.checked == false}">
                        <td><b>${fn:substring(message.msgtext,0,30)}</b></td>
                    </c:if>
                    <td><a href="/message/details/${message.id}">Message ${message.id}</a> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

</body>
</html>
<%@include file="../default/footer.jsp" %>