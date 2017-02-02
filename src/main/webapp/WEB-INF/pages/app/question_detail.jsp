<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
  <c:if test="${not empty success}">
    <div class="alert-message success">
      <i class="icon-ok"></i>
      <p><span>Message</span><br>${success}</p>
    </div>
  </c:if>

  <c:if test="${not empty error}">
    <div class="alert-message error">
      <i class="icon-exclamation"></i>
      <p><span>Error</span><br>${error}</p>
    </div>
  </c:if>
</sec:authorize>

<article class="question single-question question-type-normal">
  <h2>
    <a href="<c:url value="/question/${question.id}/${question.slug}" />">${question.title}</a>
  </h2>
  <div class="question-inner">
    <div class="clearfix"></div>
    <div class="question-desc">${question.content}</div>
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

<div class="share-tags page-content">
  <div class="question-tags"><i class="icon-tags"></i>
    <c:forEach var="tag" items="${question.tags}">
      <a href="<c:url value="/tag/${tag.name}" />">${tag.name}</a>, 
    </c:forEach>
  </div>
  <div class="share-inside-warp">
    <ul>
      <li>
        <a href="#" title="Facebook">
          <span class="icon_i">
            <span class="icon_square" icon_size="20" span_bg="#3b5997" span_hover="#666">
              <i i_color="#FFF" class="social_icon-facebook"></i>
            </span>
          </span>
        </a>
        <a href="#" target="_blank">Facebook</a>
      </li>
      <li>
        <a href="#" target="_blank">
          <span class="icon_i">
            <span class="icon_square" icon_size="20" span_bg="#00baf0" span_hover="#666">
              <i i_color="#FFF" class="social_icon-twitter"></i>
            </span>
          </span>
        </a>
        <a target="_blank" href="#">Twitter</a>
      </li>
      <li>
        <a href="#" target="_blank">
          <span class="icon_i">
            <span class="icon_square" icon_size="20" span_bg="#ca2c24" span_hover="#666">
              <i i_color="#FFF" class="social_icon-gplus"></i>
            </span>
          </span>
        </a>
        <a href="#" target="_blank">Google plus</a>
      </li>
      <li>
        <a href="#" target="_blank">
          <span class="icon_i">
            <span class="icon_square" icon_size="20" span_bg="#e64281" span_hover="#666">
              <i i_color="#FFF" class="social_icon-dribbble"></i>
            </span>
          </span>
        </a>
        <a href="#" target="_blank">Dribbble</a>
      </li>
      <li>
        <a target="_blank" href="#">
          <span class="icon_i">
            <span class="icon_square" icon_size="20" span_bg="#c7151a" span_hover="#666">
              <i i_color="#FFF" class="icon-pinterest"></i>
            </span>
          </span>
        </a>
        <a href="#" target="_blank">Pinterest</a>
      </li>
    </ul>
    <span class="share-inside-f-arrow"></span>
    <span class="share-inside-l-arrow"></span>
  </div><!-- End share-inside-warp -->
  <div class="share-inside"><i class="icon-share-alt"></i>Share</div>
  <div class="clearfix"></div>
</div><!-- End share-tags -->

<div class="about-author clearfix">
  <div class="author-image">
    <a href="<c:url value="/user/${question.user.id}" />" title="admin" class="tooltip-n">
      <img alt="" src="<c:url value="/upload/${question.user.avatar}" />">
    </a>
  </div>
  <div class="author-bio">
    <h4>${question.user.name}</h4>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra auctor neque. Nullam lobortis, sapien vitae lobortis tristique.
  </div>
</div><!-- End about-author -->

<div id="commentlist" class="page-content">
  <div class="boxedtitle page-title"><h2>Answers ( <span class="color">${fn:length(question.answers)}</span> )</h2></div>
  <ol class="commentlist clearfix">
    <c:forEach var="answer" items="${question.answers}">
      <li class="comment">
        <div class="comment-body comment-body-answered clearfix"> 
          <div class="avatar"><img alt="" src="<c:url value="/upload/${answer.user.avatar}" />"></div>
          <div class="comment-text">
            <div class="author clearfix">
              <div class="comment-author">
                <a href="<c:url value="/user/${answer.user.id}" />">${answer.user.name}</a>
              </div>
              <span class="single-question-vote-result" id="answer-votes-${answer.id}">${answer.votes} like</span>
              <ul class="single-question-vote">
                <li>
                  <a href="#?aid=${answer.id}&uid=${answer.user.id}&action=dislike" class="vote single-question-vote-down" title="Dislike">
                    <i class="icon-thumbs-down"></i>
                  </a>
                </li>
                <li>
                  <a href="#?aid=${answer.id}&uid=${answer.user.id}&action=like" class="vote single-question-vote-up" title="Like">
                    <i class="icon-thumbs-up"></i>
                  </a>
                </li>
              </ul>
              <div class="comment-meta">
                <div class="date">
                  <i class="icon-time"></i>
                  <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${answer.createdAt}" />
                </div> 
              </div>
            </div>
            <div class="text"><p>${answer.content}</p></div>
            <c:choose>
              <c:when test="${answer.best eq true}">  
                <div class="question-answered question-answered-done">
                  <i class="icon-ok"></i>Best Answer
                </div>
              </c:when>
              <c:otherwise>
                <sec:authorize access="isAuthenticated()">
                  <sec:authentication var="principal" property="principal" />
                  <c:set var="user" value="${principal.getUser()}" />
                  <c:if test="${question.user.id eq user.id}">
                    <a href="<c:url value="/answer/setbest?qid=${question.id}&slug=${question.slug}&aid=${answer.id}&uid=${answer.user.id}" />">
                      Choose best answer
                    </a>
                  </c:if>
                </sec:authorize>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </li>
    </c:forEach>
  </ol><!-- End commentlist -->
</div><!-- End page-content -->

<sec:authorize access="isAnonymous()">
  <h3>
    Please <a href="<c:url value="/login" />">login</a> or 
    <a href="<c:url value="/register" />">register</a> to answer this question
  </h3>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
  <div id="respond" class="comment-respond page-content clearfix">
    <div class="boxedtitle page-title"><h2>Answer</h2></div>
    <c:url var="action" value="/question/${question.id}/answer/post" />
    <form:form action="${action}" method="post" id="commentform" cssClass="comment-form" modelAttribute="answer">
      <div id="respond-textarea">
        <p>
          <label class="required" for="comment">Content<span>*</span></label>
          <form:textarea path="content" id="comment" aria-required="true" cols="58" rows="8" />
        </p>
      </div>
      <script src="<c:url value="/static/app/ckeditor/ckeditor.js" />"></script>
      <script>
        CKEDITOR.replace('comment');
      </script>
      <p class="form-submit">
        <input name="submit" type="submit" id="submit" value="Post your answer" class="button small color">
      </p>
    </form:form>
  </div>
</sec:authorize>

<script>
$(document).ready(function () {

	$("a.vote").click(function (e) {
    	e.preventDefault();
    	
    	// Get parameters from href attr
    	var href = $(this).attr('href');
    	var aid = getURLParameter(href, 'aid');
    	var uid = getURLParameter(href, 'uid');
    	var action = getURLParameter(href, 'action');
	    	
    	var votes = parseInt($("#answer-votes-" + aid).text());
    	var url = "<c:url value="/answer/vote" />";
    	
    	if (votes === 0 && action === "dislike") {
    		return;
    	} else {
    		$.ajax({
          		type: "GET",
          		contentType: "application/json",
          		url: url,
          		data: {aid: aid, uid: uid, action: action},
          		success: function (response) {
          			console.log(response);
          			if (response === "success") {
          				if (action === "like") {
          					$("#answer-votes-" + aid).text(votes + 1 + " like");
          				} else {
          					$("#answer-votes-" + aid).text(votes - 1 + " like");
          				}
          				
            		} else {
          				alert("You only get a single vote for an answer!");
            		}
          		}, 
          		error: function (response) {
    				console.log(response);
          			alert("Please login to answer this question!");
          		}
        	});    		
    	}
    	
  	});

	function getURLParameter(url, name) {
    	return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
  	}
  	
});
</script>