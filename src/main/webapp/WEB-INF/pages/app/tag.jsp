<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h3>Questions for tags "${currentTag.name}"</h3>
<div id="questions">
  <c:forEach var="question" items="${questions}">
    <article class="question question-type-normal">
      <h2>
        <a href="<c:url value="/question/${question.id}/${question.slug}" />">${question.title}</a>
      </h2>
      <div class="question-author">
        <a href="<c:url value="/user/${question.user.id}" />" 
          data-toggle="tooltip" data-placement="top" title="${question.user.name}" 
          class="question-author-img tooltip-n">
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

<a href="#" class="load-questions" id="load-more-questions">
  <img src="<c:url value="/static/app/images/ajax-loader.gif" />" id="loading-gif"> 
  Load more questions
</a>

<script>
  $(document).ready(function () {
	var page = 1;

    $('#loading-gif').hide();

    $("#load-more-questions").click(function (e) {
      e.preventDefault();
      page++;
      loadMoreQuestions(page);
    });

    function loadMoreQuestions(page) {
      $('#loading-gif').show(); 

      $.ajax({
        type: "GET",
        url: "<c:url value="/loadMoreByTag" />",
        data: {name: "${currentTag.name}", page: page},
        success: function (response) {
          $("#questions").append(response);
          $('#loading-gif').hide();
        },
        error: function (response) {
          console.log("error:" + response);
        }
      });
    }
  });
</script>