<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/lib/swiper/css/swiper.min.css' />">
<link rel="stylesheet" href="<c:url value="/css/info/diagnosticEquipmentSystem.css"/>" />

<div class="sub-contents">
    <h1 class="sub-page-title">진단장비 시스템</h1>
    <p class="sub-page-intro">ADVANCED EQUIPMENT SYSTEM</p>

    <section class="section01">
        <div class="slider-container">
            <div class="slider-box">
                <div class="swiper-container slider-thumb">
                    <div class="slider swiper-wrapper">
                        <div class="swiper-slide" style="background:url('<c:url value='/images/sub/info/diagnosticEquipmentSystem/device01_img01.jpg'/>')"></div>
                        <div class="swiper-slide" style="background:url('<c:url value='/images/sub/info/diagnosticEquipmentSystem/device02_img01.jpg'/>')"></div>
                        <div class="swiper-slide" style="background:url('<c:url value='/images/sub/info/diagnosticEquipmentSystem/device01_img01.jpg'/>')"></div>
                    </div>
                </div>
                <div class="text-box">
                    <h2>3D 구강 스캐너</h2><p>"VATECH 3D CB/<br>HDXWILL DENTRI"</p>
                </div>
            </div>
            <div class="slider-pagenation"></div>
        </div>
        <div class="max-layout-width">
            <div class="pager">
                <span class="current">01</span>
                <span class="max">/03</span>
            </div>
        </div>
    </section>

    <section class="section02">
        <div class="max-layout-width">
            <div class="cont cont1 active">
                <div class="img">
                    <div class="big-img"></div>
                    <div class="small-img">
                        <div class="small-img1"></div>
                        <div class="small-img2"></div>
                    </div>
                </div>
                <div class="text">
                    <div>
                        <p>
                            얼굴 안면부 전체와 옆모습까지 파노라마로 촬영하여
                            <strong>피부아래 신경의 위치까지 한번에 모두 파악이 가능한 첨단 3D-CT 장비</strong>입니다.
                        </p>
                        <p>
                            약 15초의 <strong>빠른 촬영속도로 방사선의 노출을 줄이고 환자분들의 촬영 불편함을 감소</strong>시킵니다.
                        </p>
                    </div>
                </div>
            </div>
            <div class="cont cont2">
                <div class="img">
                    <div class="big-img"></div>
                    <div class="small-img">
                        <div class="small-img1"></div>
                        <div class="small-img2"></div>
                    </div>
                </div>
                <div class="text">
                    <div>
                        <p>
                            얼굴 안면부 전체와 옆모습까지 파노라마로 촬영하여
                            <strong>피부아래 신경의 위치까지 한번에 모두 파악이 가능한 첨단 3D-CT 장비</strong>입니다.
                        </p>
                        <p>
                            약 15초의 <strong>빠른 촬영속도로 방사선의 노출을 줄이고 환자분들의 촬영 불편함을 감소</strong>시킵니다.
                        </p>
                    </div>
                </div>
            </div>
            <div class="cont cont3">
                <div class="img">
                    <div class="big-img"></div>
                    <div class="small-img">
                        <div class="small-img1"></div>
                        <div class="small-img2"></div>
                    </div>
                </div>
                <div class="text">
                    <div>
                        <p>
                            얼굴 안면부 전체와 옆모습까지 파노라마로 촬영하여
                            <strong>피부아래 신경의 위치까지 한번에 모두 파악이 가능한 첨단 3D-CT 장비</strong>입니다.
                        </p>
                        <p>
                            약 15초의 <strong>빠른 촬영속도로 방사선의 노출을 줄이고 환자분들의 촬영 불편함을 감소</strong>시킵니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section03">
        <div class="max-layout-width">
            <span class="title">ADVANCED EQUIPMENT</span>
            <h2 class="section-title">
                <strong>진단부터 정확하게</strong><br>
                <span class="section-title-color">첨단장비를 통한</span><br>
                <span class="section-title-color">차계적 시스템</span>
            </h2>
            <p class="section-text">
                미소원치과는 <strong>첨단 디지털 장비를 이용하여 환자의 상태를 안전하고 정확하게</strong> 진단합니다.
            </p>
        </div>
        <div class="image_box_right">
            <p class="img"></p>
            <p class="bg"></p>
        </div>
    </section>
</div>

<script src="<c:url value='/js/utils/StringUtils.js'/>"></script>
<script src="<c:url value="/lib/swiper/js/swiper.js" />"></script>
<script>
    $(function() {
        var pagination = [
            '<div class="bx-pager-item active"><a class="bx-pager-link text-decoration-none"><span>01</span><span class="label">3D 구강 스캐너</span></a></div>',
            '<div class="bx-pager-item"><a class="bx-pager-link text-decoration-none"><span>02</span><span class="label">CAD-CAM 밀링장치</span></a></div>',
            '<div class="bx-pager-item"><a class="bx-pager-link text-decoration-none"><span>03</span><span class="label">건물내 상주 협력 기공소</span></a></div>'
        ];
        var text = [
            '<h2>저선량 PAX 3D SMART CT</h2><p>"VATECH 3D CB/<br>HDXWILL DENTRI"</p>',
            '<h2>CAD-CAM 밀링장치</h2><p>"VATECH 3D CB/<br>HDXWILL DENTRI"</p>',
            '<h2>저선량 PAX 3D SMART CT</h2><p>"VATECH 3D CB/<br>HDXWILL DENTRI"</p>'
        ]
        var margin = $(window).width() * 0.02;
        var swiper = new Swiper('.slider-thumb', {
            slidesPerView: 'auto',
            spaceBetween: margin,
            loop: true,
            pagination: {
                el: '.slider-pagenation',
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + pagination[index] + '</span>';
                },
            },
        });
        swiper.on('slideChange', function () {
            var index = swiper.realIndex;
            $('.text-box').html(text[index]);
            $('.current').html(numberPad(index + 1, 2));
            $('.cont').removeClass('active');
            $('.cont' + (index + 1)).addClass('active');
        });
    })
</script>