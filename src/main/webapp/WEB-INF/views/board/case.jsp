<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/boardCommn.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/galleryBoard.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/case.css"/>" />

<div class="sub-contents notice">
    <h1 class="sub-page-title">치료사례</h1>
    <p class="sub-page-intro">TREATMENT CASE</p>

    <section class="gallery-list">
        <div class="max-layout-width">
            <ul class="tab">
                <li><a href="<c:url value='/' />" class="active">전체</a></li>
                <li><a href="<c:url value='/' />">임플란트</a></li>
                <li><a href="<c:url value='/' />">치아교정</a></li>
                <li><a href="<c:url value='/' />">심미치료</a></li>
                <li><a href="<c:url value='/' />">일반치료</a></li>
            </ul>
            <ul class="gallery">
                <c:forEach begin="1" end="8" varStatus="status">
                    <li>
                        <a href="<c:url value="/" />">
                            <div class="img-box">
                                <div class="login">
                                    <span class="img" style="background-color: #a8a8a8"></span>
                                </div>
                                <div class="no-login">
                                    <div class="img-box">
                                        <span class="img"></span>
                                        <span class="text">
                                            로그인하시면 <strong>치료 사례</strong>를 확인하실 수 있습니다.
                                            <span class="login-btn">로그인하기</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="text">
                                <h5>치료잘받았어요</h5>
                                <p>2020-08-30</p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>

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