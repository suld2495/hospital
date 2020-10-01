<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/info/directions.css"/>" />

<div class="sub-contents">
    <h1 class="sub-page-title">오시는길</h1>
    <p class="sub-page-intro">LOCATION</p>

    <section class="section01">
        <div id="map"></div>
    </section>

    <section class="section02 wow fadeInUp">
        <div class="max-layout-width">
            <div class="display-inline-block">
                <div class="logo float-left">
                    <img src="<c:url value='/images/sub/info/directions/location_logo.png' /> ">
                </div>
                <div class="location float-left">
                    <p>울산 남구 화합로 150 <span class="location-color">(2F 교정,임플란트,심미보철,일반진료 / 3F 임플란트,심미보철,일반진료)</span></p>
                    <h2>T.1899-7518</h2>
                    <p class="info">
                        예약환자를 우선 진료하고 있으니, 필히 약속하시고 내원해주세요.
                    </p>
                    <p class="time">
                        <strong>평일.</strong> am 09:30 - pm 6:30 (화요일은 10시부터)<br>
                        <strong>수/금.</strong> am 09:30 - pm 8:00<br>
                        <strong>토.</strong> am 09:30 - pm 4:00<br>
                        <strong>점심시간.</strong> am 12:30 - pm 2:00<br>
                        <span class="location-color">일요일 및 법정 공휴일은 휴진입니다.</span>
                    </p>
                    <p class=""></p>
                </div>
            </div>
        </div>
    </section>

    <section class="section03 scrolled-image wow fadeInUp">
        <div class="bg">
            <h2>약도 및 주차장 안내</h2>
            <div class="location-bg"></div>
            <div class="mobile-location-bg">
                <img src="<c:url value='/images/sub/info/directions/location_bg_mobile.png'/>">
            </div>
        </div>
    </section>

    <section class="section04 wow fadeInUp">
        <div class="max-layout-width">
            <h2 class="title"><strong>내원</strong>하시는 <strong>방법</strong></h2>
            <ul>
                <li class="car">
                    <h2>자가용</h2>
                    <p>
                        네비게이션 실행후 <strong>미소원치과 검색</strong> 또는 <strong>'울산광역시 남구 화합로 150'으로 검색</strong>하신 후 미소원치과로 오시면 됩니다.<br><br>
                        (자가용 이용시 후문을 이용 하시는게 편리합니다.)
                    </p>
                </li>
                <li class="bus">
                    <h2>버스</h2>
                    <p>
                        <strong>246, 407, 507, 702, 713, 714, 715, 722, 724, 732, 744, 920, 2100</strong> 고속버스터미널 앞 하차하셔서 <strong>파리바게뜨 방향으로 횡단보도를 건너 미소원치과로</strong> 오시면 됩니다.<br>
                        (버스 이용시 정문으로 오시는게 편리합니다.)
                    </p>
                </li>
                <li class="taxi">
                    <h2>택시</h2>
                    <p>
                        <strong>(구) 아웃백건물 옆 미소원치과 앞에서 하차</strong>하시면 됩니다.<br><br><br>
                        (택시 이용시 후문을 이용하시는게 편리합니다.)
                    </p>
                </li>
            </ul>
        </div>
    </section>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3592ad3572602b79d67ba10e40c4fee6"></script>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(35.5381059287821, 129.340169577634), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var markerPosition  = new kakao.maps.LatLng(35.5381059287821, 129.340169577634);

    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    marker.setMap(map);
</script>