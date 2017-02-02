<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo">
      <a href="<c:url value="/" />"><b>ASK</b>me</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">Create new account</p>
      <c:url value="/register" var="action" />
      <form:form action="${action}" method="POST" modelAttribute="user">
        <div class="form-group has-feedback">
          <form:input path="name" cssClass="form-control" placeholder="Name" />
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
          <c:set var="nameErrors"><form:errors path="name"/></c:set>
          <c:if test="${not empty nameErrors}">
            <div class="field-error">
              <i class="fa fa-exclamation-circle"></i> 
              <form:errors path="name" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
            </div>
          </c:if>
        </div>
        <div class="form-group has-feedback">
          <form:input path="email" cssClass="form-control" placeholder="Email" />
          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          <c:set var="emailErrors"><form:errors path="email"/></c:set>
          <c:if test="${not empty emailErrors}">
            <div class="field-error">
              <i class="fa fa-exclamation-circle"></i> 
              <form:errors path="email" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
            </div>
          </c:if>
        </div>
        <div class="form-group has-feedback">
          <form:password path="password" cssClass="form-control" placeholder="Password" />
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          <c:set var="passwordErrors"><form:errors path="password"/></c:set>
          <c:if test="${not empty passwordErrors}">
            <div class="field-error">
              <i class="fa fa-exclamation-circle"></i> 
              <form:errors path="password" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
            </div>
          </c:if>
        </div>
        <div class="form-group has-feedback">
          <form:password path="confirmPassword" cssClass="form-control" placeholder="Confirm password" />
          <span class="glyphicon glyphicon-repeat form-control-feedback"></span>
          <c:set var="confirmPasswordErrors"><form:errors path="confirmPassword"/></c:set>
          <c:if test="${not empty confirmPasswordErrors}">
            <div class="field-error">
              <i class="fa fa-exclamation-circle"></i> 
              <form:errors path="confirmPassword" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
            </div>
          </c:if>
        </div>
        <div class="row">
          <div class="col-md-8">
            <a href="<c:url value="/login" />" class="text-center">You already have an account?</a>
          </div>
          <!-- /.col -->
          <div class="col-md-4">
            <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form:form>
    </div>
    <!-- /.login-box-body -->
  </div>
  <!-- /.login-box -->

</body>