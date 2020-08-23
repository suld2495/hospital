<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/lib/slick/slick.css' /> " />
<link rel="stylesheet" href="<c:url value='/lib/slick/slick-theme.css' /> " />
<link rel="stylesheet" href="<c:url value="/css/info/diagnosticEquipmentSystem.css"/>" />

<div class="sub-contents">
    <h1 class="sub-page-title">진단장비 시스템</h1>
    <p class="sub-page-intro">ADVANCED EQUIPMENT SYSTEM</p>

    <section class="section01">
        <div class="display-inline-block">
            <div class="slider-pagenation">
                <div class="bx-pager-item active">
                    <a href="#one" class="bx-pager-link text-decoration-none">
                        <span>01</span>
                        <span>3D 구강 스캐너</span>
                    </a>
                </div>
                <div class="bx-pager-item">
                    <a href="#two" class="bx-pager-link text-decoration-none">
                        <span>02</span>
                        <span>CAD-CAM 밀링장치</span>
                    </a>
                </div>
                <div class="bx-pager-item">
                    <a href="three" data-slide-index="2" class="bx-pager-link text-decoration-none">
                        <span>03</span>
                        <span>건물내 상주 협력 기공소</span>
                    </a>
                </div>
            </div>
            <div class="slider-box">
                <div class="slider">
                    <div><img src="<c:url value='/images/sub/info/diagnosticEquipmentSystem/device01_img01.jpg' /> " class="pointer"></div>
                    <div><img src="<c:url value='/images/sub/info/diagnosticEquipmentSystem/device01_img01.jpg' /> " class="pointer"></div>
                    <div><img src="<c:url value='/images/sub/info/diagnosticEquipmentSystem/device01_img01.jpg' /> " class="pointer"></div>

                </div>
            </div>
        </div>
    </section>
</div>

<script src="<c:url value='/js/lib/jquery.migrate.js' /> "></script>
<script src="<c:url value='/lib/slick/slick.min.js' /> "></script>

<script>

</script>