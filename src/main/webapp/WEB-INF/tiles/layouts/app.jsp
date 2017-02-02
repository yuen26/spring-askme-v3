<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en"> 
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <title>ASK me</title>

    <!-- Main Style -->
    <link href="<c:url value="/static/app/style.css" />" rel="stylesheet" >

    <!-- Skins -->
    <link href="<c:url value="/static/app/css/skins/skins.css" />" rel="stylesheet" >

    <!-- Responsive Style -->
    <link href="<c:url value="/static/app/css/responsive.css" />" rel="stylesheet">

    <!-- Favicons -->
    <link href="<c:url value="/static/app/images/favicon.png" />" rel="shortcut icon">
    
    <!-- js -->
    <script src="<c:url value="/static/app/js/jquery.min.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery-ui-1.10.3.custom.min.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.easing.1.3.min.js" />"></script>
    <script src="<c:url value="/static/app/js/html5.js" />"></script>
    <script src="<c:url value="/static/app/js/twitter/jquery.tweet.js" />"></script>
    <script src="<c:url value="/static/app/js/jflickrfeed.min.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.inview.min.js" />"></script>
    <script src="<c:url value="/static/app/js/tabs.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.flexslider.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.prettyPhoto.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.carouFredSel-6.2.1-packed.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.scrollTo.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.nav.js" />"></script>
    <script src="<c:url value="/static/app/js/tags.js" />"></script>
    <script src="<c:url value="/static/app/js/jquery.bxslider.min.js" />"></script>
    <script src="<c:url value="/static/app/js/custom.js" />"></script>
    <!-- End js -->

  </head>

  <body>

    <div class="loader"><div class="loader_html"></div></div>

    <div id="wrap" class="grid_1200">

      <tiles:insertAttribute name="header" />

      <section class="container main-content">
        <div class="row">
          <div class="col-md-9">
            <tiles:insertAttribute name="main" />
          </div><!-- End main -->
          <aside class="col-md-3 sidebar">
            <tiles:insertAttribute name="sidebar" />
          </aside><!-- End sidebar -->
        </div><!-- End row -->
      </section><!-- End container -->

      <tiles:insertAttribute name="footer" />
    </div><!-- End wrap -->

    <div class="go-up"><i class="icon-chevron-up"></i></div>

  </body>
</html>