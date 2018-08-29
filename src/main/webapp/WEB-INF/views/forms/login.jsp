<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../default/header.jsp" %>

<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        ${errorMsg}
        <div class="card-body">
            <form action="/login" method="post">
                <div class="form-group">
                    <div class="form-label-group">
                        <input id="username" class="form-control" placeholder="Username"  autofocus="autofocus" type="text" name="username">
                        <label for="username">Username</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input id="inputPassword" class="form-control" placeholder="Password"  type="password" name="password">
                        <label for="inputPassword">Password</label>
                    </div>
                </div>
                <div class="text-center">

                <input type="submit" value="Log in"/>

                </div>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="/register">Register an Account</a>
            </div>
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