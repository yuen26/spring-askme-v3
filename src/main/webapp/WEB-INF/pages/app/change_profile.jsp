<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page-content">
  <div class="boxedtitle page-title"><h2>Change profile</h2></div>

  <div class="form-style form-style-4">
    <c:url var="action" value="/user/change-profile?${_csrf.parameterName}=${_csrf.token}" />
    <form:form action="${action}" method="post" modelAttribute="user" enctype="multipart/form-data">
      <form:hidden path="id" />
      <form:hidden path="avatar" />
      <form:hidden path="point" />
      <div class="form-inputs clearfix">
        <p>
          <label class="required">Name <span>*</span></label>
          <form:input path="name" />
          <c:set var="nameErrors"><form:errors path="name"/></c:set>
          <c:if test="${not empty nameErrors}">
            <i class="icon-exclamation-sign"></i> 
            <form:errors path="name" delimiter="<br><i class='icon-exclamation-sign'></i> " cssClass="field-error" />
          </c:if>
        </p>

        <p>
          <label class="required">Email <span>*</span></label>
          <form:input path="email" readonly="true" />
          <c:set var="emailErrors"><form:errors path="email"/></c:set>
          <c:if test="${not empty emailErrors}">
            <i class="icon-exclamation-sign"></i> 
            <form:errors path="email" delimiter="<br><i class='icon-exclamation-sign'></i> " cssClass="field-error" />
          </c:if>
        </p>

        <p>
          <label class="required">New password <span>*</span></label>
          <form:password path="password" />
          <c:set var="passwordErrors"><form:errors path="password"/></c:set>
          <c:if test="${not empty passwordErrors}">
            <i class="icon-exclamation-sign"></i> 
            <form:errors path="password" delimiter="<br><i class='icon-exclamation-sign'></i> " cssClass="field-error" />
          </c:if>
        </p>

        <p>
          <label class="required">Confirm new password <span>*</span></label>
          <form:password path="confirmPassword" />
          <c:set var="confirmPasswordErrors"><form:errors path="confirmPassword"/></c:set>
          <c:if test="${not empty confirmPasswordErrors}">
            <i class="icon-exclamation-sign"></i> 
            <form:errors path="confirmPassword" delimiter="<br><i class='icon-exclamation-sign'></i> " cssClass="field-error" />
          </c:if>
        </p>
      </div>
      <div class="form-style form-style-2">
        <div class="user-profile-img"><img src="<c:url value="/upload/${user.avatar}" />" alt="admin"></div>
        <p class="user-profile-p">
        <label>Avatar</label>
        <input type="file" name="file">
        <p></p> 
        <div class="clearfix"></div>
      </div>
      <p class="form-submit">
        <input type="submit" value="Save" class="button color small login-submit submit">
      </p>
    </form:form>
  </div>
</div>