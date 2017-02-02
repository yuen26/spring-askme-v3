<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h4>Tag Manager</h4>
  <ol class="breadcrumb">
    <li><a href="<c:url value="/admin/tag" />"><i class="fa fa-tags"></i> Tag manager</a></li>
    <li class="active">
      <c:choose>
        <c:when test="${tag.id == 0}">
          Add new tag
        </c:when>
        <c:otherwise>
          Edit tag
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
          <h3 class="box-title">Tag Information</h3>
        </div>
        <!-- /.box-header -->

        <!-- form start -->
        <c:url value="/admin/tag/save" var="action" />
        <form:form action="${action}" method="POST" modelAttribute="tag">
          <form:hidden path="id" />
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