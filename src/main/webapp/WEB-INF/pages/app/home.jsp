<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="tabs-warp question-tab">
  <ul class="tabs">
    <li class="tab"><a href="#" class="current">New questions</a></li>
    <li class="tab"><a href="#">Top views</a></li>
    <li class="tab"><a href="#">No answers</a></li>
  </ul>
  <div class="tab-inner-warp">
    <div class="tab-inner">
      <div id="new-questions">
        <c:forEach var="question" items="${newQuestions}">
          <article class="question question-type-normal">
            <h2>
              <a href="<c:url value="/question/${question.id}/${question.slug}" />">${question.title}</a>
            </h2>
            <div class="question-author">
              <a href="<c:url value="/user/${question.user.id}" />" title="${question.user.name}" class="question-author-img tooltip-n">
                <span></span><img alt="" src="<c:url value="/upload/${question.user.avatar}" />">
              </a>
            </div>
            <div class="question-inner">
              <div class="clearfix"></div>
              <p class="question-desc">${question.shortContent}</p>
              <div class="question-details">
                <c:if test="${question.solved eq true}">
                  <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
                </c:if>
              </div>
              <span class="question-category">
                <a href="<c:url value="/category/${question.category.id}/${question.category.slug}" />">
                  <i class="icon-folder-close"></i>${question.category.name}
                </a>
              </span>
              <span class="question-date"><i class="icon-time"></i>${question.ago}</span>
              <span class="question-comment">
                <a href="<c:url value="/question/${question.id}/${question.slug}" />">
                  <i class="icon-comment"></i>${fn:length(question.answers)} answers
                </a>
              </span>
              <span class="question-view"><i class="icon-user"></i>${question.views} views</span>
              <div class="clearfix"></div>
            </div>
          </article>
        </c:forEach>
      </div>
      <a href="#" class="load-questions" id="load-more-new">
        <img src="<c:url value="/static/app/images/ajax-loader.gif" />" id="new-gif"> 
        Load more questions
      </a>
    </div>
  </div>
        
  <div class="tab-inner-warp">
    <div class="tab-inner">
      <div id="topviews-questions">
      <c:forEach var="question" items="${topViewsQuestions}">
        <article class="question question-type-normal">
          <h2>
            <a href="<c:url value="/question/${question.id}/${question.slug}" />">${question.title}</a>
          </h2>
          <div class="question-author">
            <a href="<c:url value="/user/${question.user.id}" />" title="${question.user.name}" class="question-author-img tooltip-n">
              <span></span><img alt="" src="<c:url value="/upload/${question.user.avatar}" />">
            </a>
          </div>
          <div class="question-inner">
            <div class="clearfix"></div>
            <p class="question-desc">${question.shortContent}</p>
            <div class="question-details">
              <c:if test="${question.solved eq true}">
                <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
              </c:if>
            </div>
            <span class="question-category">
              <a href="<c:url value="/category/${question.category.id}/${question.category.slug}" />">
                <i class="icon-folder-close"></i>${question.category.name}
              </a>
            </span>
            <span class="question-date"><i class="icon-time"></i>${question.ago}</span>
            <span class="question-comment">
              <a href="<c:url value="/question/${question.id}/${question.slug}" />">
                <i class="icon-comment"></i>${fn:length(question.answers)} answers
              </a>
            </span>
            <span class="question-view"><i class="icon-user"></i>${question.views} views</span>
            <div class="clearfix"></div>
          </div>
        </article>
      </c:forEach>
      </div>
      <a href="#" class="load-questions" id="load-more-topviews">
        <img src="<c:url value="/static/app/images/ajax-loader.gif" />" id="topviews-gif"> 
        Load more questions
      </a>
    </div>
  </div>
        
  <div class="tab-inner-warp">
    <div class="tab-inner">
      <div id="noanswers-questions">
      <c:forEach var="question" items="${noAnswersQuestions}">
        <article class="question question-type-normal">
          <h2>
            <a href="<c:url value="/question/${question.id}/${question.slug}" />">${question.title}</a>
          </h2>
          <div class="question-author">
            <a href="<c:url value="/user/${question.user.id}" />" title="${question.user.name}" class="question-author-img tooltip-n">
              <span></span><img alt="" src="<c:url value="/upload/${question.user.avatar}" />">
            </a>
          </div>
          <div class="question-inner">
            <div class="clearfix"></div>
            <p class="question-desc">${question.shortContent}</p>
            <div class="question-details">
              <c:if test="${question.solved eq true}">
                <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
              </c:if>
            </div>
            <span class="question-category">
              <a href="<c:url value="/category/${question.category.id}/${question.category.slug}" />">
                <i class="icon-folder-close"></i>${question.category.name}
              </a>
            </span>
            <span class="question-date"><i class="icon-time"></i>${question.ago}</span>
            <span class="question-comment">
              <a href="<c:url value="/question/${question.id}/${question.slug}" />">
                <i class="icon-comment"></i>0 answers
              </a>
            </span>
            <span class="question-view"><i class="icon-user"></i>${question.views} views</span>
            <div class="clearfix"></div>
          </div>
        </article>
      </c:forEach>
      </div>
       <a href="#" class="load-questions" id="load-more-noanswers">
        <img src="<c:url value="/static/app/images/ajax-loader.gif" />" id="noanswers-gif"> 
        Load more questions
      </a>
    </div>
  </div>
</div><!-- End page-content -->

<script>
  $(document).ready(function () {
    var pageNew = 1;
    var pageTopViews = 1;
    var pageNoAnswers = 1;
    
    $('#new-gif').hide();
    $('#topviews-gif').hide();
    $('#noanswers-gif').hide();
    
    $("#load-more-new").click(function (e) {
      e.preventDefault();
      pageNew++;
      loadMoreNewQuestions(pageNew);
    });
    
    $("#load-more-topviews").click(function (e) {
      e.preventDefault();
      pageTopViews++;
      loadMoreTopViewsQuestions(pageTopViews);
    });
    
    $("#load-more-noanswers").click(function (e) {
      e.preventDefault();
      pageNoAnswers++;
      loadMoreNoAnswersQuestions(pageNoAnswers);
    });
    
    function loadMoreNewQuestions(page) {
      $('#new-gif').show(); 
      
      $.ajax({
        type: "GET",
        url: "<c:url value="/loadMoreNew" />",
        data: {page: page},
        success: function (response) {
          $("#new-questions").append(response);
          $('#new-gif').hide(); 
        }, 
        error: function (response) {
          console.log("error:" + response);
        }
      });
    }
    
    function loadMoreTopViewsQuestions(page) {
      $('#topviews-gif').show(); 
      
      $.ajax({
        type: "GET",
        url: "<c:url value="/loadMoreTopViews" />",
        data: {page: page},
        success: function (response) {
          $("#topviews-questions").append(response);
          $('#topviews-gif').hide(); 
        }, 
        error: function (response) {
          console.log("error:" + response);
        }
      });
    }
    
    function loadMoreNoAnswersQuestions(page) {
      $('#noanswers-gif').show(); 
      
      $.ajax({
        type: "GET",
        url: "<c:url value="/loadMoreNoAnswers" />",
        data: {page: page},
        success: function (response) {
          $("#noanswers-questions").append(response);
          $('#noanswers-gif').hide(); //hide loading image once data is received
        }, 
        error: function (response) {
          console.log("error:" + response);
        }
      });
    }
  });
</script>