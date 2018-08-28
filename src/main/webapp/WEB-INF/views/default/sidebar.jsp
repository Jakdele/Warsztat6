<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${not empty currentUser}">
<ul class="sidebar navbar-nav">
    <li class="nav-item">
        <a class="nav-link" href="/">
            <i class="fas fa-fw fa-folder"></i>
            <span>Homepage</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/user/details/${currentUser.id}">
            <i class="fas fa-fw fa-folder"></i>
            <span>Your tweets</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/user/edit">
            <i class="fas fa-fw fa-folder"></i>
            <span>Edit profile</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/message/list/${currentUser.id}">
            <i class="fas fa-fw fa-folder"></i>
            <span>Messages</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/logout">
            <i class="fas fa-fw fa-folder"></i>
            <span>Log out</span></a>
    </li>
</ul>
</c:if>