<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
    <header>
        <tiles:insertAttribute name="header" />
    </header>

    <section>
            <tiles:insertAttribute name="contents" />
    </section>

    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>

    <script src="<c:url value='/js/lib/jquery.1.12.4.js' />"></script>
    <script src="<c:url value='/lib/bxSlider/bxSlider.js' />"></script>
    <script src="<c:url value='/js/clientLayout.js' />"></script>
</body>
</html>
