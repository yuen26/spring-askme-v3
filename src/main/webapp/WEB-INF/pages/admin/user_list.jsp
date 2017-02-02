<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h4>User Manager</h4>
  <ol class="breadcrumb">
    <li><a href="<c:url value="/admin/user" />"><i class="fa fa-user"></i> User Manager</a></li>
    <li class="active">List of Users</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <c:if test="${not empty success}">
    <div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <i class="icon fa fa-check"></i> ${success}
    </div>
  </c:if>

  <c:if test="${not empty error}">
    <div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <i class="icon fa fa-exclamation-triangle"></i> ${error}
    </div>
  </c:if>

  <a href="<c:url value="/admin/user/add" />" class="btn btn-primary">
    <i class="fa fa-plus"></i> Add new user
  </a><p>

  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">List of users</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <c:choose>
            <c:when test="${empty users}">
              <p>No users</p>
            </c:when>
            <c:otherwise>
              <table id="myTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Point</th>
                    <th>Role</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${users}" var="user" >
                    <tr>
                      <td align="center">${user.id}</td>
                      <td>
                        <img src="<c:url value='/upload/${user.avatar}' />" class="avatar-table" alt="User avatar">
                        <a href="<c:url value="/admin/user/${user.id}" />">${user.name}</a>
                      </td>
                      <td>${user.email}</td>
                      <td align="center">${user.point}</td>
                      <td align="center">
                        <c:choose>
                          <c:when test="${user.admin}">
                            <span class="label bg-red">Admin</span>
                          </c:when>
                          <c:otherwise>
                            <span class="label bg-green">Member</span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td align="center">
                        <a href="<c:url value="/admin/user/${user.id}/edit" />" title="Edit user">
                          <i class="fa fa-pencil"></i>
                        </a>
                      </td>
                      <td align="center">
                        <a href="<c:url value="/admin/user/${user.id}/delete" />" title="Delete user"
                           onclick="return confirmDelete('user');">
                          <i class="fa fa-trash"></i>
                        </a>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </c:otherwise>
          </c:choose>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
</section>
<!-- /.content -->

