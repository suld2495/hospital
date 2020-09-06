<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/boardCommn.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/listBoard.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/onlineConsult.css"/>" />

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
                <c:forEach begin="1" end="10" varStatus="status">
                    <tr>
                        <td>${11-status.index}</td>
                        <td>임플란트</td>
                        <td class="subject"><a href="<c:url value='/' />">임플란트 문의 드립니다.<i class="lock-icon"></i></a></td>
                        <td>미소원치과</td>
                        <td>2020-08-30</td>
                        <td><span class="status">답변완료</span></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="paging">
                <div>
                    <ul>
                        <li><a href="<c:url value='/' />" class="prev-prev"></a></li>
                        <li><a href="<c:url value='/' />" class="prev"></a></li>
                        <li><a href="<c:url value='/' />" class="active">1</a></li>
                        <li><a href="<c:url value='/' />">2</a></li>
                        <li><a href="<c:url value='/' />" class="next"></a></li>
                        <li><a href="<c:url value='/' />" class="next-next"></a></li>
                    </ul>
                </div>
                <a href="<c:url value='/'/>" class="write-btn">글쓰기</a>
            </div>

            <div class="search-container">
                <div class="search">
                    <form class="form" method="post">
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