<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>Question Manager</h1>
  <ol class="breadcrumb">
    <li><a href="<c:url value="/admin/question" />"><i class="fa fa-question-circle-o"></i> Question Manager</a></li>
    <li class="active">Question Detail</li>
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
    <div class="col-md-12">
      <!-- Box Comment -->
      <div class="box box-widget">
        <div class="box-header with-border">
          <div class="user-block">
            <img class="img-circle" src="<c:url value="/upload/${question.user.avatar}" />" alt="User Image">
            <span class="username">
              <a href="<c:url value="/admin/user/${question.user.id}" />">${question.user.name}</a>
            </span>
            <span class="description"><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${question.createdAt}" /></span>
          </div>
          <!-- /.user-block -->
        </div>
        <!-- /.box-header -->
        
        <div class="box-body">
          <p>${question.content}</p>
          <button type="button" class="btn btn-default btn-xs">
            <i class="fa fa-folder-open"></i> ${question.category.name}
          </button>
          <c:forEach var="tag" items="${question.tags}">
            <button type="button" class="btn btn-default btn-xs">
              <i class="fa fa-tag"></i> ${tag.name}
            </button>
          </c:forEach>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
  
  <div class="row">
    <div class="col-md-12">
      <!-- Box Comment -->
      <div class="box box-widget">
        <div class="box-header with-border">
          <h3 class="box-title">Answers</h3>
        </div>
        <!-- /.box-header -->
        
        <div class="box-body">
          <c:choose>
            <c:when test="${empty question.answers}">
              <p>No answers for this question.</p>
            </c:when>
            <c:otherwise>
              <table id="myTable" class="table table-bordered">
                <thead>
                  <tr>
                    <th>User</th>
                    <th>Posted</th>
                    <th>Answer content</th>
                    <th>Votes</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="answer" items="${question.answers}">
                    <tr class="${answer.best eq true ? 'success' : ''}">
                      <td align="center">
                        <img class="img-circle img-sm" src="<c:url value="/upload/${answer.user.avatar}" />"
                          alt="User Image" title="${answer.user}" />
                      </td>
                      <td align="center">
                        <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${answer.createdAt}" />
                      </td>
                      <td>
                        ${answer.content}
                      </td>
                      <td align="center">
                        ${answer.votes}
                      </td>
                      <td align="center">
                        <a href="<c:url value="/admin/answer/${answer.id}/delete" />" title="Delete answer"
                           onclick="return confirmDelete('answer');">
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