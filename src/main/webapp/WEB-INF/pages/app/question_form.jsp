<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAnonymous()">
  <h3>
    Please <a href="<c:url value="/login" />">login</a> or 
    <a href="<c:url value="/register" />">register</a> to ask question
  </h3>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
  <c:if test="${not empty success}">
    <div class="alert-message success">
      <i class="icon-ok"></i>
      <p><span>Message</span><br>${success}</p>
    </div>
  </c:if>

  <div class="page-content ask-question">
    <div class="boxedtitle page-title"><h2>Ask question${info}</h2></div>

    <p>Please fill all required fields</p>
    <div class="form-style form-style-3" id="question-submit">
      <c:url var="action" value="/question/ask" />
      <form:form action="${action}" method="POST" modelAttribute="question">
        <form:hidden path="id" />
        <div class="form-inputs clearfix">
          <p>
            <label class="required">Title<span>*</span></label>
            <form:input path="title" id="question-title" />
            <c:set var="titleError"><form:errors path="title"/></c:set>
            <c:if test="${not empty titleError}">
              <span class="form-description">
                <i class="icon-exclamation-sign"></i> 
                <form:errors path="title" cssClass="field-error" />
              </span>
            </c:if>
          </p>
          <p>
            <label class="required">Category<span>*</span></label>
            <span class="styled-select">
              <form:select path="category" items="${categories}" itemValue="id" itemLabel="name" />
            </span>
          </p>
          <p>
            <label class="required">Tag<span>*</span></label>
            <span class="styled-select">
              <form:select path="tags" multiple="true" items="${tags}" itemValue="id" itemLabel="name" />
            </span>
            <c:set var="tagsError"><form:errors path="tags"/></c:set>
            <c:if test="${not empty tagsError}">
              <span class="form-description">
                <i class="icon-exclamation-sign"></i> 
                <form:errors path="tags" cssClass="field-error" />
              </span>
            </c:if>
          </p>
        </div>

        <div id="form-textarea">
          <p>
            <label class="required">Content<span>*</span></label>
            <form:textarea path="content" id="question-details" cols="58" rows="8" />
            <script src="<c:url value="/static/app/ckeditor/ckeditor.js" />"></script>
            <script>
              CKEDITOR.replace('question-details');
            </script>
            <c:set var="contentError"><form:errors path="content"/></c:set>
            <c:if test="${not empty contentError}">
              <span class="form-description">
                <i class="icon-exclamation-sign"></i> 
                <form:errors path="content" cssClass="field-error" />
              </span>
            </c:if>
          </p>
        </div>
        <p class="form-submit">
          <input type="submit" id="publish-question" value="Post" class="button color small submit">
        </p>
      </form:form>
    </div>
  </div><!-- End page-content -->
</sec:authorize>