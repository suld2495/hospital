<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>병원</title>
    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientCommon.css' />">
    <link rel="stylesheet" href="<c:url value='/lib/bxSlider/bxSlider.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientHeader.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientFooter.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientSubNav.css' />">
    <script src="<c:url value='/js/lib/IE9.js' />"></script>
    <script src="<c:url value='/js/lib/jquery.1.12.4.js' />"></script>
</head>
<body class="skrollr-body">
    <header>
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="nav" />
    </header>

    <section>
        <div id="contents">
            <tiles:insertAttribute name="contents" />
        </div>
    </section>

    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>

    <script src="<c:url value='/js/utils/StringUtils.js' /> "></script>
    <script src="<c:url value='/lib/bxSlider/bxSlider.js' />"></script>
    <script src="<c:url value='/js/clientLayout.js' />"></script>
</body>
</html>
