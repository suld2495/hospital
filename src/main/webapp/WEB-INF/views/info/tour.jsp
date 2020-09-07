<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/lib/swiper/idangerous.swiper.css' />">
<link rel="stylesheet" href="<c:url value="/css/info/tour.css "/>" />

<div class="sub-contents tour">
    <h1 class="sub-page-title">둘러보기</h1>
    <p class="sub-page-intro">FACILITIES GUIDE</p>

    <section class="section01">
        <div class="max-layout-width">
            <div class="tab">
                <ul>
                    <li class="active">
                        <span class="title">2F</span>
                        <span class="text">교정/임플란트/심미보철</span>
                    </li>
                    <li>
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                    </li>
                    <li>
                        <span class="text">건물 내 협력 기공소</span>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <section class="section02">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="big">
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide01.jpg"/>">
                    </div>
                    <div class="small">
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                        <p>MISOWON DENTAL CLINIC</p>
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide01_s.jpg"/>">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="big">
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide02.jpg"/>">
                    </div>
                    <div class="small">
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                        <p>MISOWON DENTAL CLINIC</p>
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide02_s.jpg"/>">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="big">
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide03.jpg"/>">
                    </div>
                    <div class="small">
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                        <p>MISOWON DENTAL CLINIC</p>
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide03_s.jpg"/>">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="big">
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide04.jpg"/>">
                    </div>
                    <div class="small">
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                        <p>MISOWON DENTAL CLINIC</p>
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide04_s.jpg"/>">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="big">
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide05.jpg"/>">
                    </div>
                    <div class="small">
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                        <p>MISOWON DENTAL CLINIC</p>
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide05_s.jpg"/>">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="big">
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide06.jpg"/>">
                    </div>
                    <div class="small">
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                        <p>MISOWON DENTAL CLINIC</p>
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide06_s.jpg"/>">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="big">
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide07.jpg"/>">
                    </div>
                    <div class="small">
                        <span class="title">3F</span>
                        <span class="text">임플란트/심미보철</span>
                        <p>MISOWON DENTAL CLINIC</p>
                        <img src="<c:url value="/images/sub/info/tour/tour02_slide07_s.jpg"/>">
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="<c:url value="/lib/swiper/idangerous.swiper.min.js" />"></script>
<script>
    $(function () {
        $('.swiper-slide').width($(window).width() * 0.384);
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 'auto',
            centeredSlides: true,
            loop: true,
        });
    })
</script>