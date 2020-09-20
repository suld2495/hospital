<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <tiles:insertAttribute name="header"/>
</head>
<body>
<div id="wrapper">
    <header id="head">
        <tiles:insertAttribute name="top"/>
    </header>

    <nav>
        <section id="nav">
            <tiles:insertAttribute name="left"/>
        </section>
    </nav>

    <div class="content">
        <tiles:insertAttribute name="content"/>
    </div>

    <tiles:insertAttribute name="footer"/>
</div>


</body>
</html>