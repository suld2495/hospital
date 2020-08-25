<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <div class="header-banner-slider-continer">
        <div class="header-banner-slider">
            <div><img src="<c:url value='/images/cmmn/top_banner01.jpg' />" alt="미소원치과에서 임플란트로 새 삶을 찾다!"></div>
        </div>
        <div class="header-banner-close-continer max-layout-width">
            <div class="header-banner-close pointer">
                <span class="font-13">CLOSE</span>
<%--                <img src="" alt="배너 숨기기">--%>
            </div>
        </div>
    </div>
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
                </div>
            </div>
            <div class="header-logo">
                <img src="<c:url value='/images/cmmn/logo_pc.png' />">
            </div>
            <div class="header-member">
                <div class="display-inline-block">
                    <div class="login-nav pointer">
                        <a class="text-decoration-none" href="<c:url value='/' />">
                            <img src="<c:url value='/images/cmmn/join.png' />" alt="로그인">
                            <p class="font-12">로그인</p>
                        </a>
                    </div>
                    <div class="member-nav pointer">
                        <a class="text-decoration-none" href="<c:url value='/' />">
                            <img src="<c:url value='/images/cmmn/login.png' />" alt="회원가입">
                            <p class="font-12">회원가입</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <nav>
            <ol class="display-inline-block width-100">
                <li><a href="<c:url value='/intro' />">미소원치과</a></li>
                <li><a href="<c:url value='/digital_implants' />">디지털 임플란트</a></li>
                <li><a href="<c:url value='/misowon_orthodontics' />">디지털 치아교정</a></li>
                <li><a href="<c:url value='/general' />">자연치아 클리닉</a></li>
                <li><a href="<c:url value='/' />">커뮤니티</a></li>
            </ol>
        </nav>
    </div>
</div>