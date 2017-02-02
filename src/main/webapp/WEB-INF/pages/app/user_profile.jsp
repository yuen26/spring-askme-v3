<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
  <div class="user-profile">
    <div class="col-md-12">
      <div class="page-content">
        <h2>About ${user.name}</h2>
        <div class="user-profile-img">
          <img width="60" height="60" src="<c:url value="/upload/${user.avatar}" />" alt="${user.name}">
        </div>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi. Pellentesque habitant morbi tristique senectus et netus et malesuada .</p>
        <div class="clearfix"></div>
        <span class="user-follow-me">Follow Me</span>
        <a href="#" title="Facebook" class="tooltip-n">
          <span class="icon_i">
            <span class="icon_square" icon_size="30" span_bg="#3b5997" span_hover="#2f3239">
              <i class="social_icon-facebook"></i>
            </span>
          </span>
        </a>
        <a href="#" title="Twitter" class="tooltip-n">
          <span class="icon_i">
            <span class="icon_square" icon_size="30" span_bg="#00baf0" span_hover="#2f3239">
              <i class="social_icon-twitter"></i>
            </span>
          </span>
        </a>
        <a href="#" title="Linkedin" class="tooltip-n">
          <span class="icon_i">
            <span class="icon_square" icon_size="30" span_bg="#006599" span_hover="#2f3239">
              <i class="social_icon-linkedin"></i>
            </span>
          </span>
        </a>
        <a href="#" title="Google plus" class="tooltip-n">
          <span class="icon_i">
            <span class="icon_square" icon_size="30" span_bg="#c43c2c" span_hover="#2f3239">
              <i class="social_icon-gplus"></i>
            </span>
          </span>
        </a>
        <a href="#" title="Email" class="tooltip-n">
          <span class="icon_i">
            <span class="icon_square" icon_size="30" span_bg="#000" span_hover="#2f3239">
              <i class="social_icon-email"></i>
            </span>
          </span>
        </a>
      </div><!-- End page-content -->
    </div><!-- End col-md-12 -->
    <div class="col-md-12">
      <div class="page-content page-content-user-profile">
        <div class="user-profile-widget">
          <h2>Statistics</h2>
          <div class="ul_list ul_list-icon-ok">
            <ul>
              <li>
                <i class="icon-question-sign"></i>
                <a href="<c:url value="/user/${user.id}" />">
                  Questions<span> ( <span>${countQuestions}</span> ) </span>
                </a>
              </li>
              <li>
                <i class="icon-comment"></i>
                <a href="<c:url value="/user/${user.id}" />">
                  Answers<span> ( <span>${countAnswers}</span> ) </span>
                </a>
              </li>
              <li>
                <i class="icon-star"></i>
                <a href="<c:url value="/user/${user.id}" />">
                  Best answer<span> ( <span>${countBestAnswers}</span> ) </span>
                </a>
              </li>
              <li>
                <i class="icon-heart"></i>
                <a href="<c:url value="/user/${user.id}" />">
                  Point<span> ( <span>${user.point}</span> ) </span>
                </a>
              </li>
            </ul>
          </div>
        </div><!-- End user-profile-widget -->
      </div><!-- End page-content -->
    </div><!-- End col-md-12 -->
  </div><!-- End user-profile -->
</div><!-- End row -->
<div class="clearfix"></div>
<c:choose>
  <c:when test="${countQuestions ne 0}">

    <div class="page-content page-content-user">
      <div class="user-questions">
        <c:forEach var="question" items="${questions}">
          <article class="question user-question">
            <h3>
              <a href="<c:url value="/question/${question.id}/${question.slug}" />">${question.title}</a>
            </h3>
            <div class="question-content">
              <div class="question-bottom">
                <c:if test="${question.solved eq true}">
                  <div class="question-answered question-answered-done"><i class="icon-ok"></i>solved</div>
                </c:if>
                <span class="question-category">
                  <a href="<c:url value="/category/${question.category.id}/${question.category.slug}" />">
                    <i class="icon-folder-close"></i>${question.category.name}
                  </a>
                </span>
                <span class="question-date">
                  <i class="icon-time"></i>${question.ago}
                </span>
                <span class="question-view">
                  <i class="icon-user"></i>${question.views} views
                </span>
                <span class="question-comment" style="margin-left: 20px;">
                  <a href="<c:url value="/question/${question.id}/${question.slug}" />">
                    <i class="icon-comment"></i>${fn:length(question.answers)} answers
                  </a>
                </span>
              </div>
            </div>
          </article>
        </c:forEach>
      </div>
    </div>
  </c:when>
  <c:otherwise>This user does not have any questions.</c:otherwise>
</c:choose>