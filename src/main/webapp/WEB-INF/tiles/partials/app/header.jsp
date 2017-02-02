<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="header-top">
  <section class="container clearfix">
    <nav class="header-top-nav">
      <ul>
        <sec:authorize access="isAnonymous()">
          <li><a href="<c:url value="/login" />"><i class="icon-user"></i>Login</a></li>
          <li><a href="<c:url value="/register" />"><i class="icon-pencil"></i>Register</a></li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <sec:authentication var="principal" property="principal" />
          <c:set var="user" value="${principal.getUser()}" />
          <li><a href="<c:url value="/user/${user.id}" />">Hello, <strong>${user.name}</strong></a></li>
          <li><a href="<c:url value="/logout" />">Logout</a></li>
        </sec:authorize>
      </ul>
    </nav>
    <div class="header-search">
      <c:url var="action" value="/search" />
      <form action="${action}" method="GET">
        <input type="text" name="q" value="Search here ..." onfocus="if (this.value === 'Search here ...')
              this.value = '';" onblur="if (this.value === '')
                    this.value = 'Search here ...';">
        <button type="submit" class="search-submit"></button>
      </form>
    </div>
  </section><!-- End container -->
</div><!-- End header-top -->

<header id="header" class="index-no-box">
  <section class="container clearfix">
    <div class="logo">
      <a href="<c:url value="/" />">
        <img alt="" src="<c:url value="/static/app/images/logo.png" />">
      </a>
    </div>
    <nav class="navigation">
      <ul>
        <li class="current_page_item"><a href="<c:url value="/" />">Home</a></li>
        <li><a href="#">Category</a>
          <ul>
            <c:forEach var="category" items="${categories}">
              <li><a href="<c:url value="/category/${category.id}/${category.slug}" />">${category.name}</a></li>
              </c:forEach>
          </ul>
        </li>
        <li><a href="<c:url value="/question/ask" />">Ask Question</a></li>
          <sec:authorize access="isAuthenticated()">
          <li><a href="#">Account Manager</a>
            <ul>
              <li><a href="<c:url value="/user/${user.id}" />">User Information</a></li>
              <li><a href="<c:url value="/user/change-profile" />">Change Profile</a></li>
            </ul>
          </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ADMIN')">
          <li><a href="<c:url value="/admin" />" target="_blank">Admin Control Panel</a></li>
          </sec:authorize>
      </ul>
    </nav>
  </section><!-- End container -->
</header><!-- End header -->