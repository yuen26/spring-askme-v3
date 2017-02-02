<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Dashboard
    <small>Control panel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <!-- Small boxes (Stat box) -->
  <div class="row">
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-aqua">
        <div class="inner">
          <h3>${countUsers}</h3>
          <p>Users</p>
        </div>
        <div class="icon">
          <i class="fa fa-user"></i>
        </div>
        <a href="<c:url value="/admin/user" />" class="small-box-footer">View more <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-green">
        <div class="inner">
          <h3>${countQuestions}</h3>
          <p>Questions</p>
        </div>
        <div class="icon">
          <i class="fa fa-question-circle-o"></i>
        </div>
        <a href="<c:url value="/admin/question" />" class="small-box-footer">View more <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-yellow">
        <div class="inner">
          <h3>${countCategories}</h3>
          <p>Categories</p>
        </div>
        <div class="icon">
          <i class="fa fa-folder-open-o"></i>
        </div>
        <a href="<c:url value="/admin/category" />" class="small-box-footer">View more <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-red">
        <div class="inner">
          <h3>${countTags}</h3>
          <p>Tags</p>
        </div>
        <div class="icon">
          <i class="fa fa-tags"></i>
        </div>
        <a href="<c:url value="/admin/tag" />" class="small-box-footer">View more <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
  </div>
  <!-- /.row -->

  <!-- Main row -->
  <div class="row">
    <div class="col-md-8">
      <!-- LATEST QUESTIONS -->
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">New questions</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="table-responsive">
            <table class="table no-margin">
              <thead>
                <tr>
                  <th>Title</th>
                  <th>User</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="question" items="${newQuestions}">
                    <tr>
                      <td><a href="<c:url value="/admin/question/${question.id}" />">${question.shortTitle}</a></td>
                      <td><a href="<c:url value="/admin/user/${question.user.id}" />">${question.user.name}</a></td>
                    </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- /.table-responsive -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
          <a href="<c:url value="/admin/question" />" class="btn btn-sm btn-default btn-flat pull-right">View more</a>
        </div>
        <!-- /.box-footer -->
      </div>
      <!-- /.box -->
    </div>

    <div class="col-md-4">
      <!-- USERS LIST -->
      <div class="box box-danger">
        <div class="box-header with-border">
          <h3 class="box-title">New users</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <ul class="users-list clearfix">
            <c:forEach var="user" items="${newUsers}">
            <li>
              <img src="<c:url value="/upload/${user.avatar}" />" alt="User Image">
              <a class="countUsers-list-name" href="<c:url value="/admin/user/${user.id}" />">${user.name}</a>
            </li>
            </c:forEach>
          </ul>
          <!-- /.countUsers-list -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer text-center">
          <a href="<c:url value="/admin/user" />" class="uppercase">View more</a>
        </div>
        <!-- /.box-footer -->
      </div>
      <!--/.box -->
    </div>
  </div>
</section>