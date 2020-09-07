<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/boardView.css"/>" />

<div class="sub-contents notice-view">
    <h1 class="sub-page-title">치료후기</h1>
    <p class="sub-page-intro">TREATMENT REVIEW</p>

    <section class="board-view">
        <div class="max-layout-width">
            <div class="title">
                <p class="subject">치료 잘 받았어요</p>
                <p class="date">2020-08-30</p>
            </div>
            <div class="appendix">
                <span class="txt">첨부파일</span>
            </div>
            <div class="contents"></div>
            <div class="button">
                <ul>
                    <li class="next">
                        <a href="<c:url value='/'/>">
                            <span><i class="next-icon"></i>다음글</span>
                            <span class="con">치료후기2</span>
                        </a>
                    </li>
                    <li class="prev">
                        <a href="<c:url value='/'/>">
                            <span><i class="prev-icon"></i>이전글</span>
                            <span class="con">치료후기3</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="list">
                <a href="<c:url value='/review'/>">목록</a>
            </div>
        </div>
    </section>
</div>