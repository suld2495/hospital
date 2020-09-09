<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/boardCommn.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/listBoard.css"/>" />


<div class="sub-contents notice">
    <h1 class="sub-page-title">공지사항</h1>
    <p class="sub-page-intro">NOTICE</p>

    <section class="board-list">
        <div class="max-layout-width">
            <table>
                <colgroup>
                    <col width="8%">
                    <col width="*%">
                    <col width="12%">
                    <col width="15%">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td>${board.num}</td>
                            <td class="subject"><a href="<c:url value='/notice-view/${board.num}' />">${board.subject}</a></td>
                            <td>${board.writer}</td>
                            <td>${board.created_show_date}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${paging.total eq 0}">
                        <tr class="empty">
                            <td colspan="4">조회 결과가 존재하지 않습니다.</td>
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
                            <li><a href="<c:url value='/notice/1?${params}' />" class="prev-prev"></a></li>
                        </c:if>

                        <c:if test="${paging.currentPage eq 1}">
                            <li><a class="pointer prev"></a></li>
                        </c:if>
                        <c:if test="${paging.currentPage > 1}">
                            <li><a href="<c:url value='/notice/${paging.blockStartNum}?${params}' />" class="prev"></a></li>
                        </c:if>

                        <c:forEach begin="${paging.blockStartNum}" end="${paging.blockLastNum}" varStatus="status">
                            <li><a href="<c:url value='/notice/${status.count}?${params}' />" <c:if test="${paging.currentPage eq status.count}">class="active"</c:if>>${status.count}</a></li>
                        </c:forEach>

                        <li><a href="<c:url value='/notice/${paging.blockLastNum}?${params}' />" class="next"></a></li>
                        <li><a href="<c:url value='/notice/${paging.lastPageNum}?${params}' />" class="next-next"></a></li>
                    </ul>
                </div>
            </div>

            <div class="search-container">
                <div class="search">
                    <form class="form" method="get" action="<c:url value='/notice/1'/>">
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