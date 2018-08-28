<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../default/header.jsp" %>
<html>
<head>
    <title>Create message</title>
</head>
<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Send message to ${receiver.username}</div>
        <div class="card-body">
            <%--@elvariable id="message" type="pl.coderslab.entity.Message"--%>
            <form:form modelAttribute="message" method="post" >
                <form:hidden path="sender" value="${currentUser.id}"/>
                <form:hidden path="receiver" value="${receiver.id}"/>
                <form:hidden path="checked" value="false"/>
                <div class="form-group">
                    <div class="form-label-group">
                        <div class="text-center">
                        Message: <br><form:textarea path="msgtext"/>
                        <form:errors path="msgtext"></form:errors>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <input type="submit" value="Send message">
                </div>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
<%@include file="../default/footer.jsp" %>