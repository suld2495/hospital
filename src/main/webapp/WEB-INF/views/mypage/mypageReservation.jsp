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
                <li class="active"><a href="<c:url value='/mypage_reservation/1' />">예약내역</a></li>
                <li><a href="<c:url value='/mypage_consult/1' />">온라인 상담</a></li>
                <li><a href="<c:url value='/mypage_update' />">회원정보수정</a></li>
            </ul>
        </div>

        <div class="table">
            <ul class="title">
                <li class="date">접수일자</li>
                <li class="name">신청자명</li>
                <li class="phone">연락처</li>
                <li class="etc">비고</li>
            </ul>
            <c:forEach items="${list}" var="list">
                <ul class="link" data-num="${list.num}">
                    <li class="date">${list.created_show_date}</li>
                    <li class="name">${list.writer}</li>
                    <li class="phone">${list.phone}</li>
                    <li class="etc"></li>
                </ul>
            </c:forEach>
            <ul class="empty">
                <c:if test="${paging.total eq 0}">
                    <li><p>등록된 자료가 없습니다.</p></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>

<script>
    $(function() {
        $('.link').click(function () {
            window.location.href = "<c:url value='/mypage-reserve-view/'/>" + $(this).data("num");
        })
    });
</script>