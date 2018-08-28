<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../default/header.jsp" %>

<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Register</div>
        <div class="card-body">
            <%--@elvariable id="user" type="pl.coderslab.entity.User"--%>
            <form:form modelAttribute="user" method="post">
                <div class="form-group">
                    <div class="form-label-group">
                        <input id="username" class="form-control" placeholder="Username"  type="text" name="username">
                        <form:errors path="username"/>
                        <label for="username">Username</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input id="email" class="form-control" placeholder="Email"  type="text" name="email">
                        <form:errors path="email"/>
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input id="inputPassword" class="form-control" placeholder="Password"  type="password" name="password">
                        <form:errors path="password"/>
                        <label for="inputPassword">Password</label>
                    </div>
                </div>

                <div class="text-center">
                    <form:hidden path="enabled" value="true"/>
                    <form:hidden path="id"/>
                    <input type="submit" value="Register"/>

                </div>
            </form:form>

        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>


</body>

<%@include file="../default/footer.jsp" %>