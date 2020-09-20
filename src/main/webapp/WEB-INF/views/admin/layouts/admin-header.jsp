<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAnonymous()">
    <script>

        alert("로그인 후 접속 가능합니다.");
        location.href = "<c:url value='/login' />";
    </script>
</sec:authorize>


<%
    response.setHeader("cache-control","no-cache");
    response.setHeader("expires","0");
    response.setHeader("pragma","no-cache");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">

<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>


<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/comm/style.css' />" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/comm/header.css' />" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/comm/nav.css' />" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/comm/footer.css' />" />

<script type="text/javascript" src="<c:url value='/js/lib/jquery.1.12.4.js'/>"></script>
<title>미소원치과 관리자</title>

