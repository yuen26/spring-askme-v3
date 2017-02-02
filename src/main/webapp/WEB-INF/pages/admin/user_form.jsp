<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h4>User Manager</h4>
  <ol class="breadcrumb">
    <li><a href="<c:url value="/admin/user" />"><i class="fa fa-user"></i> User Manager</a></li>
    <li class="active">
      <c:choose>
        <c:when test="${user.id == 0}">
          Add new user
        </c:when>
        <c:otherwise>
          Edit user
        </c:otherwise>
      </c:choose>
    </li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <!-- left column -->
    <div class="col-md-6 col-md-offset-3">
      <!-- general form elements -->
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">User Information</h3>
        </div>
        <!-- /.box-header -->

        <!-- form start -->
        <c:url value="/admin/user/save" var="action" />
        <form:form action="${action}" method="POST" modelAttribute="user">
          <form:hidden path="id" />
          <form:hidden path="avatar" />
          <form:hidden path="point" />
          <div class="box-body">
            <div class="form-group">
              <label>Name</label>
              <form:input path="name" cssClass="form-control" />
              <c:set var="nameErrors"><form:errors path="name"/></c:set>
              <c:if test="${not empty nameErrors}">
                <div class="field-error">
                  <i class="fa fa-exclamation-circle"></i> 
                  <form:errors path="name" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                </div>
              </c:if>
            </div>
            <div class="form-group">
              <label>Email</label>
              <form:input path="email" cssClass="form-control" />
              <c:set var="emailErrors"><form:errors path="email"/></c:set>
              <c:if test="${not empty emailErrors}">
                <div class="field-error">
                  <i class="fa fa-exclamation-circle"></i> 
                  <form:errors path="email" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                </div>
              </c:if>
            </div>
            <div class="form-group">
              <label>Password</label>
              <form:password path="password" cssClass="form-control" />
              <c:set var="passwordErrors"><form:errors path="password"/></c:set>
              <c:if test="${not empty passwordErrors}">
                <div class="field-error">
                  <i class="fa fa-exclamation-circle"></i> 
                  <form:errors path="password" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                </div>
              </c:if>
            </div>
            <div class="form-group">
              <label>Confirm password</label>
              <form:password path="confirmPassword" cssClass="form-control" />
              <c:set var="confirmPasswordErrors"><form:errors path="confirmPassword"/></c:set>
              <c:if test="${not empty confirmPasswordErrors}">
                <div class="field-error">
                  <i class="fa fa-exclamation-circle"></i> 
                  <form:errors path="confirmPassword" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                </div>
              </c:if>
            </div>
            <div class="form-group">
              <label>Role</label>
              <select name="role" class="form-control">
                  <option value="admin" ${user.admin eq true ? 'selected' : ''}>Admin</option>
                  <option value="member" ${user.admin eq false ? 'selected' : ''}>Member</option>
              </select>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <button type="submit" class="btn btn-primary">Save</button>
          </div>
        </form:form>
      </div>
      <!-- /.box -->
    </div>
    <!--/.col (left) -->
  </div>
  <!-- /.row -->
</section>
<!-- /.content -->