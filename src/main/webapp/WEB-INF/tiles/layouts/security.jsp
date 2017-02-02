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

    <!-- jQuery 2.2.3 -->
    <script src="<c:url value='/static/admin/vendor/jQuery/jquery-2.2.3.min.js' />"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="<c:url value='/static/admin/vendor/bootstrap/js/bootstrap.min.js' />"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  
  <tiles:insertAttribute name="main" />

</html>