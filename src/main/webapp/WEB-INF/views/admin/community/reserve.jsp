<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="<c:url value='/css/admin/board.css' />" >
<link rel="stylesheet" href="<c:url value='/css/admin/reserve.css' />" >
<link rel="stylesheet" href="<c:url value='/css/admin/paging/paging.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/comm/appendix.css' />">
<link rel="stylesheet" href="<c:url value='/css/admin/paging/adminPaging.css' />">

<c:set var="total" value="${paging.total}"/>

<section class="content">
    <div class="content_wrap">

        <article class="boardTop">

            <div class="boardName">
                <p><span><img src="">예약상담현황</span>미소원치과의 예약상담현황을 확인할수있습니다.</p>
            </div>

            <div class="boardSearch">
                <div class="boardSearch1">
                    <div class="boardSearch1Div1"><img src="<c:url value='/images/admin/search.png'/>"></div>
                    <div class="boardSearch1Div2">Search</div>
                </div>
                <div class="boardSearch2" style="display: none">
                    <select class="groupSearch selectGroup selectGroup1" id="board_use" data-select="selectGroup1" data-query="board_use">
                        <option value="0">선택</option>
                        <option value="all">전체보기</option>
                        <option value="y">정상</option>
                        <option value="n">삭제</option>
                    </select>
                </div>

                <div class="search_inner">
                    <dl>
                        <dd>
                            <select class="all_select searchType">
                                <optgroup>
                                    <option value="board_subject">제목</option>
                                    <option value="board_content">내용</option>
                                    <option value="board_subject|board_content">제목+내용</option>
                                </optgroup>
                            </select>
                        </dd>
                        <dd>
                            <input class="search_input search_user pointer select" type="search">
                        </dd>
                    </dl>
                </div>
            </div>

            <div class="searchBnBox">
                <div class="searchBn search_icon_li pointer selectBn"><img src="<c:url value='/images/admin/searchBn.jpg'/>"></div>
            </div>
        </article>

        <article class="tableArticle">
            <table class="boardTable">
                <caption>조회건수:${total}건</caption>
                <thead>
                <tr>
                    <th class="th1"><input type="checkbox" class="allCheck"></th>
                    <th class="th2">번호</th>
                    <th class="th3">첨부</th>
                    <th class="th4">제목</th>
                    <th class="th5">작성자</th>
                    <th class="th6">작성일</th>
                    <th class="th7">조회</th>
                    <th class="th8">상태</th>
                    <th class="th9">수정</th>
                    <th class="th10">삭제</th>
                    <th class="th11">출력순서</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${total == 0}">
                    <tr class="sampleTr none">
                        <td><input type="checkbox"></td>
                        <td class="boardNum"></td>
                        <td class="appendixTd"><img src="<c:url value='/images/admin/add.jpg'/>"></td>
                        <td class="boardSubject"></td>
                        <td class="boardWriter"></td>
                        <td class="boardWriteDate"></td>
                        <td class="boardHits"></td>
                        <td class="boardUse"></td>
                        <td><img src="<c:url value='/images/admin/modify.jpg'/>"></td>
                        <td><img src="<c:url value='/images/admin/delete.jpg'/>"></td>
                        <td>
                            <img src="<c:url value='/images/admin/orderArrowBottom.jpg'/>">
                            <img src="<c:url value='/images/admin/orderArrowTop.jpg'/>">
                        </td>
                    </tr>

                    <tr class="sampleTr">
                        <td colspan="11">게시물이 존재 하지 않습니다.</td>
                    </tr>

                </c:if>

                <c:if test="${total > 0}">
                    <c:forEach var="list" items="${list}">
                        <tr class="sampleTr s${list.boardSecret}" data-num="${list.num}">
                            <td><input type="checkbox" data-num="${list.num}" class="check"></td>
                            <td class="boardOrder boardNumdata boardOrderdata board_order numdata board_orderdata" data-boardnum="${list.num}" data-boardorder="${list.board_order}">${list.board_order}</td>
                            <td class="appendixTd">
                                <c:if test="${list.appendixCount > 0}">
                                    <img src="<c:url value='/images/admin/add.jpg'/>" data-num="${list.num}" data-tablename="${tableName}">
                                </c:if>
                            </td>
                            <td class="boardSubjectTd pointer sn" data-num="${list.num}">
                                <p class="boardSubject pointer sn subject">${list.subject}</p>
                                <span class="none boardNumdata boardOrderdata numdata board_orderdata" data-boardnum="${list.num}" data-boardorder="${list.board_order}"></span>
                            </td>
                            <td class="boardWriter writer">${list.writer}</td>
                            <td class="boardWriteDate created_show_date">${list.created_show_date}</td>
                            <td class="boardHits recommend_count">${list.recommend_count}</td>
                            <td class="boardUse status ${list.status}">
                                <c:if test="${list.status == 'N'}">	정상	</c:if>
                                <c:if test="${list.status == 'Y'}">	삭제	</c:if>
                            </td>
                            <td><a href="/admin/${url}-write?update=modify&board_num=${list.num}" class="linkChange boardNumdata numdata"><img src="<c:url value='/images/admin/modify.jpg'/>" data-num="${list.num}" class="modify pointer"></a></td>
                            <td><img src="<c:url value='/images/admin/delete.jpg'/>" data-num="${list.num}" data-boardnum="${list.num}" data-type="delete" class="numdata boardNumdata updateBoard admin delete pointer"></td>
                            <td>
                                <img src="<c:url value='/images/admin/orderArrowBottom.jpg'/>" data-num="${list.num}" class="orderArrowBottom pointer">
                                <img src="<c:url value='/images/admin/orderArrowTop.jpg'/>" data-num="${list.num}" class="orderArrowTop pointer">
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2">
                        <img src="<c:url value='/images/admin/allSelect.jpg'/>" class="allCheckBn pointer" data-check="nonchecked">
                    </td>
                    <td colspan="2">
                        <div>
                            <img src="<c:url value='/images/admin/modifyBn.jpg'/>" class="modifyBn pointer">
                            <span>출력순서 수정하기</span>
                        </div>
                        <div>
                            <img src="<c:url value='/images/admin/deleteBn.jpg'/>" class="boardsDelete deleteBn pointer">
                            <span>선택글 삭제하기</span>
                        </div>
                    </td>
                </tr>
                </tfoot>
            </table>
        </article>

        <article class="paging"></article>

        <article class="boardInfo">
            <!-- 			<div class="boardInfoDiv1 boardInfoDiv">
                            <div class="boardInfoDiv1Div1">■</div>
                            <div class="boardInfoDiv1Img1"><img src="<c:url value='/images/admin/add.jpg'/>"></div>
                            <div class="boardInfoDiv1Div2"><p>아이콘을 클릭하시면 첨부파일내용을 간편하게 수정하실 수 있습니다.</p></div>
                        </div> -->

            <div class="boardInfoDiv2 boardInfoDiv">
                <div class="boardInfoDiv1Div1">■</div>
                <div class="boardInfoDiv1Div2">
                    <p>출력순서 화살표를 이동하시면 한 칸씩 순서를 변경할 수 있습니다.</p>
                    <p>이동이 끝난 후 전체선택 체크박스를 선택한 후 선택글 수정하기를 클릭해주시면 적용됩니다. </p>
                </div>
            </div>

        </article>
    </div>
</section>

<script src="<c:url value="/js/admin/board.js"/>"></script>

<script>

    var freeboard = {

        url: null,

        init: function() {

            this.url = "<c:out value='${url}' />";

            //게시판 설치
            $(".boardTable").boardCreate({
                boardList: "<c:out value='${paging.pageCount}' />",
                totalPage: "<c:out value='${paging.lastPageNum}' />",
                page: "<c:out value='${paging.currentPage}' />",
                tableName: "<c:out value='${tableName}' />",
                total: "<c:out value='${total}' />",
                link: {
                    list: "<c:url value='/admin/reserve/1'/>",
                    view: "<c:url value='/admin/reserve-view/'/>",
                    write: this.url + "Write.do?mtype=6&ftype=13&update=write"
                },
                pagingOption: {
                    prevPrev 	: "<c:url value='/images/admin/paging/left_left.jpg'/>",
                    prev		: "<c:url value='/images/admin/paging/left.jpg'/>",
                    nextNext 	: "<c:url value='/images/admin/paging/right_right.jpg'/>",
                    next		: "<c:url value='/images/admin/paging/right.jpg'/>"
                },
                board_use: "y",
                order: {
                    query: "order",
                    direction: "desc"
                },
                boardViewMove: ".boardSubjectTd",
                addBoardListCallback: this.listCallback
            });


            this.initEvent();
        },

        initEvent: function() {

            var orderArrowBottom = ".orderArrowBottom";
            var orderArrowTop = ".orderArrowTop";
            var orderArrowSubmit = ".modifyBn";
            var that = this;

            //대상의 순서를 아래로 내리기
            $(document).on("click", orderArrowBottom, function() {

                var $tr = $(this).parents("tr");
                var $next = $tr.next();

                that.orderArrowChange($tr, $next);
            });

            //대상의 순서를 위로 올리기
            $(document).on("click", orderArrowTop, function() {

                var $tr = $(this).parents("tr");
                var $prev = $tr.prev();

                that.orderArrowChange($prev, $tr);
            });

            //대상의 순서를 저장하기
            $(document).on("click", orderArrowSubmit, function() {

                $(".boardTable").orderArrowSubmit();
            });
        },

        //대상의 순서를 변경하기(a가 위, b가 밑)
        orderArrowChange: function(a, b) {

            $(".boardTable").boardOrderChange(a, b);
        },

        listCallback: function() {

            var $boardUse = $(".boardUse");

            $.each($boardUse, function() {

                var $target = $(this);

                if($target.text().trim() === "n") {

                    $target.html("삭제").removeClass("y").addClass("n");
                } else if($target.text().trim() === "y") {

                    $target.html("정상").removeClass("n").addClass("y");
                }
            });
        }
    }

    $(document).ready(function() {

        freeboard.init();
    })
</script>