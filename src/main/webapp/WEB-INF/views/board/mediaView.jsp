<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/boardView.css"/>" />

<c:set value="media-view" var="url" />

<div class="sub-contents notice-view">
    <h1 class="sub-page-title">미디어</h1>
    <p class="sub-page-intro">MEDIA</p>

    <section class="board-view">
        <div class="max-layout-width">
            <div class="title">
                <p class="subject">${board.subject}</p>
                <p class="date">${board.created_show_date}</p>
            </div>
            <div class="appendix">
                <span class="txt">첨부파일</span>
            </div>
            <div class="contents"></div>
            <div class="button">
                <ul>
                    <c:if test="${not empty board.arrow.nextNum}">
                        <li class="next">
                            <a href="<c:url value='/${url}/${board.arrow.nextNum}'/>">
                                <span><i class="next-icon"></i>다음글</span>
                                <span class="con">${board.arrow.nextSubject}</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${not empty board.arrow.prevNum}">
                        <li class="prev">
                            <a href="<c:url value='/${url}/${board.arrow.prevNum}'/>">
                                <span><i class="prev-icon"></i>이전글</span>
                                <span class="con">${board.arrow.prevSubject}</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="list">
                <a href="<c:url value='/media/1'/>">목록</a>
            </div>
        </div>
    </section>
</div>