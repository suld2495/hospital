<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/boardView.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/onlineWrite.css"/>" />

<c:set value="online-consult-view" var="url" />

<div class="sub-contents notice-view">
    <h1 class="sub-page-title">온라인 상담</h1>
    <p class="sub-page-intro">ONLINE COUNSELLING</p>

    <section class="board-view">
        <div class="max-layout-width">
            <div class="title">
                <p class="subject">${board.subject}</p>
                <p class="date">${board.created_show_date}</p>
            </div>
            <div class="contents">
                <c:if test="${not empty board.appendix}">
                    <ul class="download-appendix">
                        <c:forEach var="list" items="${board.appendix}">
                            <li><a href="#this" name="file" data-url="<c:url value="/file-download"/>" data-filename="${list.download_filename}" data-origin="${list.real_filename}" class="download">${list.real_filename}</a></li>
                        </c:forEach>
                    </ul>
                </c:if>
                ${board.contents}
            </div>
            <div class="list">
                <div>
                    <a href="<c:url value='/online-consult-write?update=modify&board_num=${board.num}'/>">수정</a>
                    <a href="<c:url value="/board/delete/${board.num}"/>" onclick="alert('삭제되었습니다.')">삭제</a>
                </div>
                <div>
                    <a href="<c:url value='/online-consult/1'/>">목록</a>
                </div>
            </div>
            <c:if test="${board.answer_contents != null and board.answer_contents != ''}">
                <div class="answer-contents">
                    <p>문의 답변</p>
                    <div>
                        <pre>
                                ${board.answer_contents}
                        </pre>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
</div>

<script src="<c:url value='/js/admin/common.js'/>"></script>
<script src="<c:url value='/js/cmmn/appendix.js'/>"></script>