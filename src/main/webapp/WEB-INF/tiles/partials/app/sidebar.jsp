<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="widget widget_stats">
  <h3 class="widget_title">Categories</h3>
  <div class="ul_list ul_list-icon-ok">
    <ul>
      <c:forEach var="category" items="${categories}">
      <li>
        <i class="icon-question-sign"></i>${category.name} 
        <span>( ${fn:length(category.questions)} )</span>
      </li>
      </c:forEach>
    </ul>
  </div>
</div>

<div class="widget widget_highest_points">
  <h3 class="widget_title">Top Point</h3>
  <ul>
    <c:forEach var="topUser" items="${topUsers}">
    <li>
      <div class="author-img">
        <a href="<c:url value="/user/${topUser.id}" />">
          <img width="60" height="60" src="<c:url value="/upload/${topUser.avatar}" />" alt="">
        </a>
      </div> 
      <h6><a href="<c:url value="/user/${topUser.id}" />">${topUser.name}</a></h6>
      <span class="comment">${topUser.point} point</span>
    </li>
    </c:forEach>
  </ul>
</div>

<div class="widget widget_tag_cloud">
  <h3 class="widget_title">Tags</h3>
  <c:forEach var="tag" items="${tags}">
    <a href="<c:url value="/tag/${tag.name}" />">${tag.name}</a>
  </c:forEach>
</div>