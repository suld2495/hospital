<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/mypage/mypage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/mypageConsult.css"/>" />

<c:set var="url" value="mypage_consult"/>

<div class="sub-contents mypage-reservation">
    <h1 class="sub-page-title">마이페이지</h1>
    <p class="sub-page-intro">MYPAGE</p>

    <div class="max-layout-width">
        <div class="tab">
            <ul>
                <li><a href="<c:url value='/mypage_reservation/1' />">예약내역</a></li>
                <li class="active"><a href="<c:url value='/mypage_consult/1' />">온라인 상담</a></li>
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
                <c:forEach items="${list}" var="list">
                    <li class="no">${list.num}</li>
                    <li class="type">${list.consultType}</li>
                    <li class="title">${list.subject}</li>
                    <li class="name">${list.writer}</li>
                    <li class="date">${list.created_show_date}</li>
                    <li class="state">
                        <c:if test="${list.status eq 'Y'}">
                            답변완료
                        </c:if>
                        <c:if test="${list.status eq 'N'}">
                            답변대기중
                        </c:if>
                    </li>
                </c:forEach>
                <c:if test="${paging.total eq 0}">
                    <li><p>등록된 자료가 없습니다.</p></li>
                </c:if>
            </ul>
        </div>
        <div class="write-con">
            <a href="<c:url value="/"/>">글쓰기</a>
        </div>
        <div class="search-container">
            <div class="search">
                <form class="form" method="get" action="<c:url value='/${url}/1'/>">
                    <select name="type" class="select-type">
                        <option value="title">제목</option>
                        <option value="contents">내용</option>
                    </select>
                    <input type="text" title="검색어" name="search_text" class="search-input">
                    <input type="submit" value="검색" class="btn">
                </form>
            </div>
        </div>
    </div>
</div>