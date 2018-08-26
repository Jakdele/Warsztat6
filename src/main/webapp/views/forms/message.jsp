<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create message</title>
</head>
<body>
<h3>Send message to ${receiver.username}</h3>
<div>
    <%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>
    <form:form modelAttribute="message" method="post" ><br>
        <form:hidden path="sender" value="${currentUser.id}"/>
        <form:hidden path="receiver" value="${receiver.id}"/>
        <form:hidden path="checked" value="false"/>
        Message text: <form:textarea path="msgtext"/><br>
        <form:errors path="msgtext"></form:errors>
        <input type="submit" value="Submit">
    </form:form>
</div>
</body>
</html>
