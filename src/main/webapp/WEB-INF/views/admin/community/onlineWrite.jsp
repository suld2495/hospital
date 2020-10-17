<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/pc/write.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/write.css'/>" />

<c:set var="total" value="${paging.total}"/>

<section class="content">
    <div class="content_wrap">
        <div class="qna_board_wrap">
            <article class="basicText">
                <div class="headerTextDiv1">
                    <h2>답변하기</h2>
                </div>
                <div class="redLine"></div>
                <div class="headerTextDiv2">미소원치과 온라인상담신청</span>미소원치과의 온라인상담신청 현황을 안내해드립니다.</div>
            </article>

            <article>
                <form:form method="post" class="submit" action="${pageContext.servletContext.contextPath}/admin/answer-write" enctype="multipart/form-data" commandName="boardVo" accept-charset="utf-8">
                    <div class="writerDiv">
                        <div class="writer">작성자</div>
                        <div class="writerInputDiv input inputtop">${board.writer}</div>
                    </div>

                    <div class="subjectDiv">
                        <div class="subject">질문</div>
                        <div class="subjectInputDiv input inputtop">${board.contents}</div>
                    </div>

                    <div class="processDiv">
                        <div class="process">처리 상태</div>
                        <div class="processInputDiv input inputtop ${board.boardAnswerUse}">
                            <div><label class="no"><input type="radio" name="board_answer_use" value = "n" class="no" <c:if test="${board.board_answer_use == 'n'}">checked</c:if>>미답변</label></div>
                            <div><label class="wait"><input type="radio" name="board_answer_use" value = "w" class="wait" <c:if test="${board.board_answer_use == 'w'}">checked</c:if>>답변중</label></div>
                            <div><label class="complete"><input type="radio" name="board_answer_use" value = "y" class="complete" <c:if test="${board.board_answer_use == 'y'}">checked</c:if>>답변완료</label><span>(굵은글자는 현재처리상태를 의미합니다)</span></div>
                        </div>
                    </div>

                    <div class="contentDiv">
                        <div class="contentText"></div>
                        <div class="contentInputDiv input">
                            <textarea name="answer_contents" id="board_content" rows="10" cols="100" class="board_content contentInput" data-alert="내용"><c:if test="${update == 'modify'}">${board.answer_contents}</c:if></textarea>
                        </div>
                    </div>

                    <div class="qnaNotice">
                        ※임시저장을 클릭하시면 답변중 상태로 넘어갑니다.
                    </div>

                    <div class="bnController">
                        <div class="writeLeft">
                            <div class="listFn bn"><a href="<c:url value='/admin/online/1'/>"><img src="../images/admin/writeList.jpg"></a></div>
                        </div>
                        <div class="writeRight">
                            <!-- <div class="tempFn bn"><img src="../images/admin/answer_temp_store.jpg"></div> -->
                            <div class="submitFn bn submitBn"><img src="../images/admin/answer_store.jpg"></div>
                            <div class="resetFn bn resetBn"><img src="../images/admin/answer_cancle.jpg"></div>
                        </div>
                    </div>

                    <input type="hidden" name="tableName" value="${tableName}">
                    <input type="hidden" name="update" value="${update}">
                    <input type="hidden" name="num" value="${board.num}">
                    <input type="hidden" name="board" value="admin/${url}">
                    <input type="hidden" name="admin" value="admin">
                    <input type="hidden" name="board_writer" value="admin">
                    <input type="hidden" name="answer_num" value="${board.answer_num}">
                    <input type="hidden" name="board_answer" value="-1">
                    <input type="hidden" name="contents" value="-">
                    <input type="hidden" name="writer" value="---">
                    <input type="hidden" name="subject" value="---">

                </form:form>
            </article>
        </div>
    </div>
</section>

<script src="<c:url value="/js/admin/board.js"/>"></script>

<script>

    var boardWrite = {

        url: null,
        $board : null,

        init: function() {

            this.url = "<c:out value='${url}' />";
            this.$board = $(".submit");

            //게시판 설치
            this.$board.boardCreate({
                tableName: "<c:out value='${tableName}' />",
                link: {
                    view: this.url + "View.do?mtype=6&ftype=16&board_num=",
                    write: this.url + "Write.do?mtype=6&ftype=16&update=write"
                },
                useGallery: false,
                boardWrite: true,
                appendixImg: ".appendixImg",
                thumanil: false,
            });
        },

        imgAdd: function(img) {

            this.$board.imgAdd(img);
        }
    }

    $(document).ready(function() {

        boardWrite.init();
    });
</script>