<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo">
      <a href="<c:url value="/" />"><b>ASK</b>me</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">Login to continue</p>
      
      <c:if test="${param.error != null}">
        <div class="alert alert-danger">
          <p>Invalid email or password</p>
        </div>
      </c:if>

      <c:if test="${param.logout != null}">
        <div class="alert alert-success">
          <p>Logout successfully</p>
        </div>
      </c:if>
      
      <c:if test="${not empty success}">
        <div class="alert alert-success">
          <p>${success}</p>
        </div>
      </c:if>

      <form action="<c:url value="/login" />" method="POST">
        <div class="form-group has-feedback">
          <input type="email" class="form-control" name="email" placeholder="Email">
          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="password" class="form-control" name="password" placeholder="Mật khẩu">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="row">
          <div class="col-md-8">
            <a href="<c:url value="/register" />" class="text-center">Create new account</a>
          </div>
          <!-- /.col -->
          <div class="col-md-4">
            <button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
          </div>
          <!-- /.col -->
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </form>
    </div>
    <!-- /.login-box-body -->
  </div>
  <!-- /.login-box -->

</body>