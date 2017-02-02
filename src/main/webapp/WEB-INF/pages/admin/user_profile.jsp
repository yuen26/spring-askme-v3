<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Content Header (Page header) -->
<section class="content-header">
  <h4>User Manager</h4>
  <ol class="breadcrumb">
    <li><a href="<c:url value="/admin/user" />"><i class="fa fa-user"></i> User Manager</a></li>
    <li class="active">Profile</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-3">

      <!-- Profile Image -->
      <div class="box box-primary">
        <div class="box-body box-profile">
          <img class="profile-user-img img-responsive img-circle" 
               src="<c:url value="/upload/${user.avatar}" />" alt="User profile picture">

          <h3 class="profile-username text-center">${user.name}</h3>

          <ul class="list-group list-group-unbordered">
            <li class="list-group-item">
              <b>Questions</b> 
              <span class="pull-right badge bg-blue">${fn:length(questions)}</span>
            </li>
            <li class="list-group-item">
              <b>Answers</b>
              <span class="pull-right badge bg-yellow">${fn:length(answers)}</span>
            </li>
            <li class="list-group-item">
              <b>Best Answers</b> 
              <span class="pull-right badge bg-green">${fn:length(bestAnswers)}</span>
            </li>
            <li class="list-group-item">
              <b>Point</b> 
              <span class="pull-right badge bg-red">${user.point}</span>
            </li>
          </ul>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->

    <div class="col-md-9">
      <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#questions" data-toggle="tab">Questions</a></li>
          <li><a href="#answers" data-toggle="tab">Answers</a></li>
          <li><a href="#bestAnswers" data-toggle="tab">Best answers</a></li>
        </ul>
        <div class="tab-content">
          <div class="active tab-pane" id="questions">
            <c:forEach var="question" items="${questions}">
              <!-- Post -->
              <div class="post">
                <div class="user-block">
                  <img class="img-circle img-bordered-sm" 
                       src="<c:url value="/upload/${user.avatar}" />" alt="user image">
                  <span class="username">
                    <a href="<c:url value="/admin/user/${user.id}" />">${user.name}</a>
                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                  </span>
                  <span class="description">
                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${question.createdAt}" />
                  </span>
                </div>
                <!-- /.user-block -->
                <p>${question.content}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/admin/question/${question.id}" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> View more
                    </a>
                  </li>
                </ul>
              </div>
              <!-- /.post -->
            </c:forEach>
          </div>
          <!-- /.tab-pane -->
          <div class="tab-pane" id="answers">
            <c:forEach var="answer" items="${answers}">
              <!-- Post -->
              <div class="post">
                <div class="user-block">
                  <img class="img-circle img-bordered-sm" 
                       src="<c:url value="/upload/${answer.question.user.avatar}" />" alt="user image">
                  <span class="username">
                    <a href="<c:url value="/admin/user/${answer.question.user.id}" />">${answer.question.user.name}</a>
                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                  </span>
                  <span class="description">
                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${answer.createdAt}" />
                  </span>
                </div>
                <!-- /.user-block -->
                <p>${answer.content}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/admin/question/${answer.question.id}" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> View more
                    </a>
                  </li>
                </ul>
              </div>
              <!-- /.post -->
            </c:forEach>
          </div>
          <!-- /.tab-pane -->

          <div class="tab-pane" id="bestAnswers">
            <c:forEach var="bestAnswer" items="${bestAnswers}">
              <!-- Post -->
              <div class="post">
                <div class="user-block">
                  <img class="img-circle img-bordered-sm" 
                       src="<c:url value="/upload/${bestAnswer.question.user.avatar}" />" alt="user image">
                  <span class="username">
                    <a href="#">${bestAnswer.question.user.name}</a>
                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                  </span>
                  <span class="description">
                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${bestAnswer.createdAt}" />
                  </span>
                </div>
                <!-- /.user-block -->
                <p>${bestAnswer.content}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/admin/question/${bestAnswer.question.id}" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> View more
                    </a>
                  </li>
                </ul>
              </div>
              <!-- /.post -->
            </c:forEach>
          </div>
          <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
      </div>
      <!-- /.nav-tabs-custom -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
</section>
