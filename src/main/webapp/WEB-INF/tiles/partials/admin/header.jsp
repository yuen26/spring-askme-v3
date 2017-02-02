<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication var="principal" property="principal" />
<c:set var="user" value="${principal.getUser()}" />

<!-- Logo -->
<a href="<c:url value="/admin" />" class="logo">
  <!-- mini logo for sidebar mini 50x50 pixels -->
  <span class="logo-mini"><b>A</b>LT</span>
  <!-- logo for regular state and mobile devices -->
  <span class="logo-lg"><b>ASK</b>me</span>
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top">
  <!-- Sidebar toggle button-->
  <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
    <span class="sr-only">Toggle navigation</span>
  </a>

  <div class="navbar-custom-menu">
    <ul class="nav navbar-nav">
      <!-- User Account: style can be found in dropdown.less -->
      <li class="dropdown user user-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <img src="<c:url value='/upload/${user.avatar}' />" class="user-image" alt="User avatar">
          <span class="hidden-xs">${user.name}</span>
        </a>
        <ul class="dropdown-menu">
          <li><a href="<c:url value="/" />"><i class="fa fa-globe fa-fw"></i> Back website</a></li>
          <li><a href="<c:url value="/logout" />"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
          </li>
        </ul>
    </ul>
  </div>
</nav>