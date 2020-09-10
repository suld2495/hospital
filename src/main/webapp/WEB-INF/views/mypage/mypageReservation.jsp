<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/mypage/mypage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/mypageReservation.css"/>" />

<div class="sub-contents mypage-reservation">
    <h1 class="sub-page-title">마이페이지</h1>
    <p class="sub-page-intro">MYPAGE</p>

    <div class="max-layout-width">
        <div class="tab">
            <ul>
                <li class="active"><a href="<c:url value='/mypage_reservation' />">예약내역</a></li>
                <li><a href="<c:url value='/mypage_consult' />">온라인 상담</a></li>
                <li><a href="<c:url value='/mypage_update' />">회원정보수정</a></li>
            </ul>
        </div>

        <div class="table">
            <ul class="title">
                <li class="date">접수일자</li>
                <li class="center">예약센터</li>
                <li class="name">신청자명</li>
                <li class="phone">연락처</li>
                <li class="etc">비고</li>
            </ul>
            <ul class="empty">
                <li><p>등록된 자료가 없습니다.</p></li>
            </ul>
        </div>
    </div>
</div>