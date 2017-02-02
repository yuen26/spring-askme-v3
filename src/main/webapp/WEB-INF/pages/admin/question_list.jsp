<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h4>Question Manager</h4>
  <ol class="breadcrumb">
    <li><a href="<c:url value="/admin/question" />"><i class="fa fa-question-circle-o"></i> Question Manager</a></li>
    <li class="active">List of Questions</li>
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

  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">List of questions</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <c:choose>
            <c:when test="${empty questions}">
              <p>No questions</p>
            </c:when>
            <c:otherwise>
              <table id="myTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>User</th>
                    <th>Views</th>
                    <th>Answers</th>
                    <th>Detail</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${questions}" var="question" >
                    <tr>
                      <td align="center">${question.id}</td>
                      <td>${question.shortTitle}</td>
                      <td>${question.user.name}</td>
                      <td align="center">${question.views}</td>
                      <td align="center">${fn:length(question.answers)}</td>
                      <td align="center">
                        <a href="<c:url value="/admin/question/${question.id}" />" title="View question detail">
                          <i class="fa fa-search"></i></a>
                      </td>
                      <td align="center">
                        <a href="<c:url value="/admin/question/${question.id}/delete" />" title="Delete question"
                           onclick="return confirmDelete('question');">
                          <i class="fa fa-trash"></i></a>
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

