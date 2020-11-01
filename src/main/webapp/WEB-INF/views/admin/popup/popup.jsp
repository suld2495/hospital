<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="<c:url value='/css/admin/popup/popuplist.css' />">
<link rel="stylesheet" href="<c:url value='/css/admin/paging/paging.css' />">
<link rel="stylesheet" href="<c:url value='/css/admin/paging/adminPaging.css' />">

<section class="content">
    <div class="content_wrap">
        <div class="qna_board_wrap">
            <article class="basicText">
                <div class="headerTextDiv1">
                    <h2>팝업 목록</h2>
                </div>
                <div class="redLine"></div>
                <div class="headerTextDiv2">등록 되어 있는 팝업 목록입니다.</div>
            </article>
        </div>

        <div class="popupTableDiv">

            <table class="boardTable">

                <thead>
                <tr>
                    <td colspan="6">
                        <div class="mainAngelBnContainer">
                            <span>선택한 팝업을</span>
                            <img src="<c:url value='/images/admin/mainAngelDelete.jpg'/>" class="mainDelete pointer">
                        </div>

                        <div class="popupAddDiv">
                            <a href="<c:url value='/admin/popupWrite?update=write'/>"><img src="<c:url value='/images/admin/popupAdd.jpg'/>" class="popupAdd pointer"></a>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th class="chekboxTh"><input type="checkbox" class="allCheck"></th>
                    <th class="mainNoTh">NO</th>
                    <th class="mainStateTh">상태</th>
                    <th class="mainTermTh">기간</th>
                    <th class="mainDateTh">등록일</th>
                </tr>
                </thead>
                <tbody>

                <c:if test="${total == 0}">

                    <tr class="sampleTr noTotal">
                        <td colspan="6">팝업 내역이 없습니다.</td>
                    </tr>
                </c:if>

                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:formatDate value="${now}" var="now" pattern="yyyy-MM-dd" />
                <c:forEach var="list" items="${list}">

                    <fmt:formatDate value="${list.start}" var="start" pattern="yyyy-MM-dd" />
                    <fmt:formatDate value="${list.end}" var="end" pattern="yyyy-MM-dd" />


                    <tr>
                        <td><input type="checkbox" class="check" data-num="${list.popup_num}"></td>
                        <td class="popupNum popup_num">${list.popup_num}</td>
                        <td class="popupState">

                            <c:choose>
                                <c:when test="${start <= now && now <= end}">	진행중		</c:when>
                                <c:when test="${start > now}">					종료			</c:when>
                                <c:when test="${end < now}">					종료			</c:when>
                            </c:choose>
                        </td>
                        <td class="popupTerm popup_start">${list.popup_start} <br> ${list.popup_end}</td>
                        <td class="popupDate popup_date">${list.popup_date}</td>
                    </tr>
                </c:forEach>
                </tbody>

                <tfoot>
                <tr>
                    <td colspan="6">
                        <div class="mainAngelBnContainer">
                            <span>선택한 상품을</span>
                            <img src="<c:url value='/images/admin/mainAngelDelete.jpg'/>" class="mainDelete pointer">
                        </div>

                        <div class="popupAddDiv">
                            <a href="<c:url value='/admin/popupWrite?update=write'/>"><img src="<c:url value='/images/admin/popupAdd.jpg'/>" class="popupAdd pointer"></a>
                        </div>
                    </td>
                </tr>
                </tfoot>
            </table>

            <div class="paging"></div>
        </div>
    </div>
</section>

<script src="<c:url value="/js/admin/util.js"/>"></script>

<script>

    var popup = {

        total : "<c:out value='${total}' />", //전체 게시물 수
        page : "<c:out value='${page}' />", //현재 페이지 번호
        boardList : "<c:out value='${boardList}' />", //한번에 보여지는 게시물 수
        totalPage : "<c:out value='${totalPage}' />", //한번에 보여지는 페이징 수
        tableName : "<c:out value='${tableName}' />", //테이블 이름

        init : function() {

            //팝업 삭제하기
            this.mainDelete();

            //페이지 이동하기
            this.pageMove();

            var $paging = $(".paging");

            paging(this.total, this.boardList, this.totalPage, this.page, $paging);

            $.AllCheck('.allCheck', '.check')
        },

        mainDelete : function() {

            var $mainDelete = $(".mainDelete");
            var that = this;

            $mainDelete.click(function() {

                var $check = $(".check:checked");
                var	value = checkboxArray($check, "num");

                if($check.length == 0) {

                    alert("팝업을 선택 해 주세요.");
                    return;
                }

                var url = "<c:url value='/admin/popupUpdateAjax'/>";
                var data = {popup_array : value, update : "update", popup_use : "n"};
                var fun = popupFn.mainDeleteFn;

                ajaxSimple(url, data, fun, that);
            });
        },

        pageMove : function() {

            $(document).on("click", ".pagingText", function() {

                location.href="popuplist.do?page=" + $(this).attr("id");
            });
        }
    }

    var popupFn = {

        mainDeleteFn : function(data, that) {
            alert("삭제되었습니다.");
            location.reload();
        }
    }

    $(document).ready(function(){

        popup.init();
    });
</script>