<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/boardCommn.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/listBoard.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/onlineConsult.css"/>" />

<c:set var="url" value="online-consult"/>

<div class="sub-contents notice">
    <h1 class="sub-page-title">온라인 상담</h1>
    <p class="sub-page-intro">ONLINE COUNSELLING</p>

    <section class="board-list">
        <div class="max-layout-width">
            <table>
                <colgroup>
                    <col width="8%">
                    <col width="10%">
                    <col width="*%">
                    <col width="12%">
                    <col width="10%">
                    <col width="15%">
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">분류</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">등록일</th>
                    <th scope="col">상태</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td>${board.num}</td>
                            <td>${board.consultType}</td>
                            <td class="subject"><a href="<c:url value='/${url}-view/${board.num}' />">${board.subject}</a></td>
                            <td>${board.writer}</td>
                            <td>${board.created_show_date}</td>
                            <td><span class="status">
                                <c:if test="${board.board_answer_use eq 'y'}">
                                    답변완료
                                </c:if>
                                <c:if test="${board.board_answer_use eq 'w' or board.board_answer_use eq 'n'}">
                                    답변대기중
                                </c:if>
                            </span></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${paging.total eq 0}">
                        <tr class="empty">
                            <td colspan="6">조회 결과가 존재하지 않습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

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
                <a href="<c:url value='/online-consult-write?update=write'/>" class="write-btn">글쓰기</a>
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