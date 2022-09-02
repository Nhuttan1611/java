<%-- 
    Document   : login
    Created on : Aug 27, 2022, 8:59:38 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h1 class="text-center text-danger">DANG NHAP</h1>

<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        <p><spring:message code="user.login.error1" /></p>
    </div>
</c:if>

<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger">
        <p><spring:message code="user.login.error2" /></p>
    </div>
</c:if>

<spring:url value="/login" var="action" />
<c:url value="/login" var="action"/>

<form method="post" action="${action}">
    <div class="form-group">
        <lable for="Username">Username</lable>
        <input type="text" id="username" name="username" class="form-control" />
    </div>
    <div class="form-group">
        <lable for="password">Password</lable>
        <input type="password" id="password" name="password" class="form-control" />
    </div>
    <div class="form-group">
        <input type="submit" value="Dang Nhap" class="btn btn-danger" />
    </div>
</form>
