<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div>
    <div class="header-banner-slider-continer header-banner-slider-continer01">
        <div class="header-banner-slider">
            <div><img src="<c:url value='/images/cmmn/top_banner01_1.jpg' />" alt="미소원치과에서 임플란트로 새 삶을 찾다!"></div>
        </div>
        <div class="header-banner-close-continer max-layout-width">
            <div class="header-banner-close pointer">
                <span class="font-13 banner-close"></span>
            </div>
        </div>
    </div>
    <div class="fixed">
        <div class="max-layout-width cmmn-nav">
            <div class="header-panel display-inline-block">
                <div class="header-banner-slider-continer">
                    <div class="header-banner-small-slider">
                        <div>
                            <img class="small-slider-img" src="<c:url value='/images/cmmn/small_banner01.png' />">
                            <div class="slider-text">
                                <p>자가결찰 브라켓으로</p>
                                <p class="bold">빠르고 안아프게 클리피씨 교정</p>
                            </div>
                        </div>
                        <div>
                            <img class="small-slider-img" src="<c:url value='/images/cmmn/small_banner01.png' />">
                            <div class="slider-text">
                                <p>자가결찰 브라켓으로</p>
                                <p class="bold">빠르고 안아프게 클리피씨 교정</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-logo">
                    <a href="<c:url value='/' />"><img src="<c:url value='/images/cmmn/logo_pc_1.png' />"></a>
                </div>
                <div class="header-member">
                    <div class="display-inline-block">
                        <div class="login-nav pointer">
                            <a class="text-decoration-none" href="<c:url value='/login' />">
                                <img src="<c:url value='/images/cmmn/join.png' />" alt="로그인">
                                <p class="font-12">로그인</p>
                            </a>
                        </div>
                        <div class="member-nav pointer">
                            <a class="text-decoration-none" href="<c:url value='/member_agreement' />">
                                <img src="<c:url value='/images/cmmn/login.png' />" alt="회원가입">
                                <p class="font-12">회원가입</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-line"></div>
        <div class="cmmn-nav">
            <nav>
                <div class="max-layout-width">
                    <ol>
                        <li><a data-nav="#nav01" href="<c:url value='/intro' />">미소원치과</a></li>
                        <li><a data-nav="#nav02" href="<c:url value='/digital_implants' />">임플란트</a></li>
                        <li><a data-nav="#nav03" href="<c:url value='/misowon_orthodontics' />">치아교정</a></li>
                        <li><a data-nav="#nav04" href="<c:url value='/general' />">자연치아 클리닉</a></li>
                        <li><a data-nav="#nav05" href="<c:url value='/notice/1' />">커뮤니티</a></li>
                    </ol>
                </div>
                <ul class="nav-detail">
                    <li id="nav01">
                        <div class="bg"></div>
                        <div class="max-layout-width">
                            <div class="title">
                                <h2>미소원치과</h2>
                                <p>
                                    디지털치과의 현재<br>
                                    미소원치과를 소개합니다.
                                </p>
                            </div>
                            <div class="sub-category">
                                <ul>
                                    <li><a href="<c:url value='/intro' />">본원소개</a></li>
                                    <li><a href="<c:url value='/staff' />">의료진소개</a></li>
                                    <li><a href="<c:url value='/competitiveness' />">핵심경쟁력</a></li>
                                    <li><a href="<c:url value='/diagnostic_equipment_system' />">진단장비 시스템</a></li>
                                    <li><a href="<c:url value='/tour' />">둘러보기</a></li>
                                    <li><a href="<c:url value='/directions' />">오시는길</a></li>
<%--                                    <li><a href="<c:url value='/medical' />">진료보증제도</a></li>--%>
                                </ul>
                                <div class="img img01"></div>
                            </div>
                        </div>
                    </li>
                    <li id="nav02">
                        <div class="max-layout-width">
                            <div class="title">
                                <h2>임플란트</h2>
                                <p>
                                    디지털치과의 현재<br>
                                    미소원치과를 소개합니다.
                                </p>
                            </div>
                            <div class="sub-category">
                                <ul>
                                    <li><a href="<c:url value='/digital_implants' />">디지털 임플란트</a></li>
                                    <li><a href="<c:url value='/navigation_implants' />">네비게이션 임플란트</a></li>
                                    <li><a href="<c:url value='/oneday_implants' />">원데이 임플란트</a></li>
                                    <li><a href="<c:url value='/bone_graft_implant' />">뼈이식 임플란트</a></li>
                                    <li><a href="<c:url value='/full_implants' />">전체 임플란트</a></li>
                                </ul>
                                <div class="img img02"></div>
                            </div>
                        </div>
                    </li>
                    <li id="nav03">
                        <div class="max-layout-width">
                            <div class="title">
                                <h2>치아교정</h2>
                                <p>
                                    디지털치과의 현재<br>
                                    미소원치과를 소개합니다.
                                </p>
                            </div>
                            <div class="sub-category">
                                <ul>
                                    <li><a href="<c:url value='/misowon_orthodontics' />">미소원 치아교정</a></li>
                                    <li><a href="<c:url value='/partial_orthodontics' />">부분교정</a></li>
                                    <li><a href="<c:url value='/malocculusion_orthodontics' />">부정교합 교정</a></li>
                                    <li><a href="<c:url value='/growth_reriod_orthodontics' />">성장기 교정</a></li>
                                </ul>
                                <div class="img img03"></div>
                            </div>
                        </div>
                    </li>
                    <li id="nav04">
                        <div class="max-layout-width">
                            <div class="title">
                                <h2>자연치아 클리닉</h2>
                                <p>
                                    디지털치과의 현재<br>
                                    미소원치과를 소개합니다.
                                </p>
                            </div>
                            <div class="sub-category">
                                <ul>
                                    <li><a href="<c:url value='/general' />">충치/치주/신경치료</a></li>
                                    <li><a href="<c:url value='/aesthetic' />">심미보철치료</a></li>
                                    <li><a href="<c:url value='/wisdom' />">사랑니 발치</a></li>
                                    <li><a href="<c:url value='/scaling' />">스케일링</a></li>
                                </ul>
                                <div class="img img04"></div>
                            </div>
                        </div>
                    </li>
                    <li id="nav05">
                        <div class="max-layout-width">
                            <div class="title">
                                <h2>커뮤니티</h2>
                                <p>
                                    디지털치과의 현재<br>
                                    미소원치과를 소개합니다.
                                </p>
                            </div>
                            <div class="sub-category">
                                <ul>
                                    <li><a href="<c:url value='/notice/1' />">공지사항</a></li>
                                    <li><a href="<c:url value='/case/1' />">치료사례</a></li>
                                    <li><a href="<c:url value='/review/1' />">치료후기</a></li>
                                    <li><a href="<c:url value='/online-consult/1' />">온라인 상담</a></li>
                                    <li><a href="<c:url value='/reserve-write' />">예약 상담 신청</a></li>
                                    <li><a href="<c:url value='/media/1' />">미디어</a></li>
                                </ul>
                                <div class="img img05"></div>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('.cmmn-nav ol a').on('mouseover focus', function() {
            $('.nav-detail > li').fadeOut();
            $($(this).data('nav')).stop().fadeIn(100);
        })

        $('.nav-detail > li').on('mouseleave', function() {
            $('.nav-detail > li').stop().fadeOut();
        });

        var height = $('.header-banner-slider-continer').height();

        $(window).scroll(function () {
            if (height < $(window).scrollTop()) {
                $('header').addClass('active');
            } else {
                $('header').removeClass('active');
            }
        })

        $('.header-banner-small-slider').bxSlider({
            pager: false
        })
    })
</script>