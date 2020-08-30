<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/mypage/mypage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/mypageConsult.css"/>" />

<div class="sub-contents mypage-reservation">
    <h1 class="sub-page-title">마이페이지</h1>
    <p class="sub-page-intro">MYPAGE</p>

    <div class="max-layout-width">
        <div class="tab">
            <ul>
                <li><a href="<c:url value='/mypage_reservation' />">예약내역</a></li>
                <li class="active"><a href="<c:url value='/mypage_consult' />">온라인 상담</a></li>
                <li><a href="<c:url value='/mypage_update' />">회원정보수정</a></li>
            </ul>
        </div>

        <div class="table">
            <ul class="title">
                <li class="no">NO.</li>
                <li class="type">분류</li>
                <li class="title">제목</li>
                <li class="name">이름</li>
                <li class="date">작성일</li>
                <li class="state">상태</li>
            </ul>
            <ul class="empty">
                <li><p>등록된 자료가 없습니다.</p></li>
            </ul>
        </div>
        <div class="write-con">
            <a href="<c:url value="/"/>">글쓰기</a>
        </div>
        <div class="search">
            <span class="condition">
                <select>
                    <option>제목</option>
                </select>
            </span>
            <span class="input">
                <span>
                    <input>
                    <button></button>
                </span>
            </span>
        </div>
    </div>
</div>