<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="<c:url value="/css/board/boardCommn.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/galleryBoard.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/review.css"/>" />

<c:set var="url" value="review"/>

<div class="sub-contents notice">
    <h1 class="sub-page-title">치료후기</h1>
    <p class="sub-page-intro">TREATMENT REVIEW </p>

    <section class="gallery-list">
        <div class="max-layout-width">
            <ul class="gallery">
                <c:forEach items="${list}" var="board">
                    <li>
                        <a
                            <sec:authorize access="isAnonymous()">
                                href="javascript:;void(0);"
                                onclick="alert('의료법상 치료 사례 등 정보는 로그인 후 가능합니다. \n간단한 회원가입 후 로그인하여, \n미소원치과의 정보를 확인하시길 바랍니다.');"
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">href="<c:url value="/${url}-view/${board.num}" />"</sec:authorize>
                        >
                            <div class="img-box">
                                <span class="img" style="background: url(<c:url value='${board.thumnail_path}/${board.thumnail}'/>)"></span>
                            </div>
                            <div class="text">
                                <h5>${board.subject}</h5>
                                <div class="contents">
                                    ${board.contents}
                                </div>
                                <h7>${board.created_show_date}</h7>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <c:if test="${paging.total eq 0}">
                    <li class="empty">조회 결과가 존재하지 않습니다.</li>
                </c:if>
            </ul>

            <c:set var="params" value="${requestScope['javax.servlet.forward.query_string']}"/>

            <div class="paging">
                <div>
                    <ul>
                        <c:if test="${paging.currentPage eq 1}">
                            <li><a class="pointer prev-prev"></a></li>
                        </c:if>
                        <c:if test="${paging.currentPage > 1}">
                            <li><a href="<c:url value='/${url}/1?${params}' />" class="prev-prev"></a></li>
                        </c:if>

                        <c:if test="${paging.currentPage eq 1}">
                            <li><a class="pointer prev"></a></li>
                        </c:if>
                        <c:if test="${paging.currentPage > 1}">
                            <li><a href="<c:url value='/${url}/${paging.blockStartNum}?${params}' />" class="prev"></a></li>
                        </c:if>

                        <c:forEach begin="${paging.blockStartNum}" end="${paging.blockLastNum}" varStatus="status">
                            <li><a href="<c:url value='/${url}/${status.count}?${params}' />" <c:if test="${paging.currentPage eq status.count}">class="active"</c:if>>${status.count}</a></li>
                        </c:forEach>

                        <li><a href="<c:url value='/${url}/${paging.blockLastNum}?${params}' />" class="next"></a></li>
                        <li><a href="<c:url value='/${url}/${paging.lastPageNum}?${params}' />" class="next-next"></a></li>
                    </ul>
                </div>
<%--                <a href="<c:url value='/review-write'/>" class="write-btn">글쓰기</a>--%>
            </div>
        </div>
        <div class="max-layout-width mobile-full-width">
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
    </section>
</div>