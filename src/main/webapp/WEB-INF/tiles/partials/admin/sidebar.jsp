<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication var="principal" property="principal" />
<c:set var="user" value="${principal.getUser()}" />

<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
  <!-- Sidebar user panel -->
  <div class="user-panel">
    <div class="pull-left image">
      <img src="<c:url value='/upload/${user.avatar}' />" class="img-circle" alt="User Image">
    </div>
    <div class="pull-left info">
      <p>${user.name}</p>
      <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
    </div>
  </div>

  <!-- sidebar menu: : style can be found in sidebar.less -->
  <ul class="sidebar-menu">
    <li class="header">MAIN NAVIGATION</li>
    <li id="li-dashboard">
      <a href="<c:url value="/admin" />">
        <i class="fa fa-dashboard"></i> <span>Dashboard</span>
      </a>
    </li>
    <li id="li-user">
      <a href="<c:url value="/admin/user" />">
        <i class="fa fa-user"></i> <span>User Manager</span>
      </a>
    </li>
    <li id="li-question">
      <a href="<c:url value="/admin/question" />">
        <i class="fa fa-question-circle-o"></i> <span>Question Manager</span>
      </a>
    </li>
    <li id="li-category">
      <a href="<c:url value="/admin/category" />">
        <i class="fa fa-folder-open-o"></i> <span>Category Manager</span>
      </a>
    </li>
    <li id="li-tag">
      <a href="<c:url value="/admin/tag" />">
        <i class="fa fa-tags"></i> <span>Tag Manager</span>
      </a>
    </li>
  </ul>
</section>
<!-- /.sidebar -->