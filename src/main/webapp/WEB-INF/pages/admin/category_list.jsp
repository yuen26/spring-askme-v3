<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h4>Category Manager</h4>
  <ol class="breadcrumb">
    <li><a href="<c:url value="/admin/category" />"><i class="fa fa-folder-open-o"></i> Category Manager</a></li>
    <li class="active">List of Categories</li>
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

  <a href="<c:url value="/admin/category/add" />" class="btn btn-primary">
    <i class="fa fa-plus"></i> Add new category
  </a><p>

  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">List of categories</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <c:choose>
            <c:when test="${empty categories}">
              <p>No categories</p>
            </c:when>
            <c:otherwise>
              <table id="myTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Category name</th>
                    <th>Questions</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${categories}" var="category" >
                    <tr>
                      <td align="center">${category.id}</td>
                      <td>${category.name}</td>
                      <td align="center">
                        <a href="<c:url value="/admin/category/${category.id}" />">
                          ${fn:length(category.questions)}
                        </a>
                      </td>
                      <td align="center">
                        <a href="<c:url value="/admin/category/${category.id}/edit" />" title="Edit category">
                          <i class="fa fa-pencil"></i>
                        </a>
                      </td>
                      <td align="center">
                        <a href="<c:url value="/admin/category/${category.id}/delete" />" title="Delete category"
                           onclick="return confirmDelete('category');">
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

