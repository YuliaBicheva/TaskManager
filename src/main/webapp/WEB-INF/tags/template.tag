<%@ tag description="Template Tag" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Task Manager</title>

    <!-- Bootstrap -->
    <link href="<spring:url value="/resources/css/normalize.css" />" rel="stylesheet">
    <link href="<spring:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<spring:url value="/resources/css/main.css" />" rel="stylesheet">

    <!-- HTML5 shim and Respond.libs.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.libs.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="container-fluid">
    <h1 class="text-center">TODO List Список заданий</h1>
</div>



<jsp:doBody/>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" />"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>

<script>
    $(document).ready(function () {
        var f = '${pageContext.request.getParameter('filter')}';
        $('.filter').children('li').removeClass('active');
        if(f === 'true'){
            $('.filter-ready').addClass('active');
        }else if(f == 'false'){
            $('.filter-not-ready').addClass('active');
        }else{
            $('.filter-all').addClass('active');
        }
    });
</script>
</body>
</html>
