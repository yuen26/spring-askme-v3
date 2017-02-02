<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <title><tiles:getAsString name="title" /></title>
    
    <!-- Favicons -->
    <link href="<c:url value="/static/app/images/favicon.png" />" rel="shortcut icon">
    
    <!-- Bootstrap 3.3.6 -->
    <link href="<c:url value='/static/admin/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value='/static/admin/vendor/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" >
    <!-- Theme style -->
    <link href="<c:url value='/static/admin/dist/css/AdminLTE.css' />" rel="stylesheet">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="<c:url value='/static/admin/dist/css/skins/_all-skins.min.css' />" rel="stylesheet">
    <!-- DataTables -->
    <link href="<c:url value='/static/admin/vendor/datatables/dataTables.bootstrap.css' />" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
        <tiles:insertAttribute name="header" />
      </header>

      <aside class="main-sidebar">
        <tiles:insertAttribute name="sidebar" />
      </aside>

      <div class="content-wrapper">
        <tiles:insertAttribute name="main" />
      </div>

      <footer class="main-footer">
        <tiles:insertAttribute name="footer" />
      </footer>
    </div>

    <!-- jQuery 2.2.3 -->
    <script src="<c:url value='/static/admin/vendor/jQuery/jquery-2.2.3.min.js' />"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="<c:url value='/static/admin/vendor/jQueryUI/jquery-ui.min.js' />"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.6 -->
    <script src="<c:url value='/static/admin/vendor/bootstrap/js/bootstrap.min.js' />"></script>
    <!-- DataTables -->
    <script src="<c:url value='/static/admin/vendor/datatables/jquery.dataTables.min.js' />"></script>
    <script src="<c:url value='/static/admin/vendor/datatables/dataTables.bootstrap.min.js' />"></script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="<c:url value='/static/admin/vendor/morris/morris.min.js' />"></script>
    <!-- Sparkline -->
    <script src="<c:url value='/static/admin/vendor/sparkline/jquery.sparkline.min.js' />"></script>
    <!-- Slimscroll -->
    <script src="<c:url value='/static/admin/vendor/slimScroll/jquery.slimscroll.min.js' />"></script>
    <!-- FastClick -->
    <script src="<c:url value='/static/admin/vendor/fastclick/fastclick.js' />"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value='/static/admin/dist/js/app.min.js' />"></script>
     <!-- My custom -->
    <script src="<c:url value='/static/admin/dist/js/custom.js' />"></script>
  </body>
</html>