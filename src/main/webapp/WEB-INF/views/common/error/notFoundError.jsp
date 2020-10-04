<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
    <title>미소가 활짝! 미소원치과</title>
    <link rel="stylesheet" href="<c:url value='/css/clientCommon.css' />">
    <link rel="stylesheet" href="<c:url value='/css/error.css' />">
    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
</head>
<body>
    <div class="max-layout-width">
        <div class="bg"></div>
        <div class="text">
            <h2>죄송합니다. 현재 찾을 수 없는 페이지를 요청 하셨습니다.</h2>
            <p>
                요청하신 페이지를 처리 중에 오류가 발생했습니다.<br>
                서비스 이용에 불편을 드려 죄송합니다.<br>
                입력하신 주소가 정확한지 확인 후 다시 시도해 주시기 바랍니다.<br><br>
                감사합니다.
            </p>
        </div>
        <div class="btn">
            <a class="main" href="<c:url value='/'/>">메인으로</a>
        </div>
    </div>
</body>
</html>
