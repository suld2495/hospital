<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/pc/write.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/write.css'/>" />


<script>

    var update = "<c:out value='${update}'/>";
    var length = "<c:out value='${fn:length(board)}'/>";
    var url = "<c:out value='${url}'/>";

    if(length == 0 && update === "modify") {

        alert("삭제 된 게시물이거나 존재 하지 않는 게시물입니다.");
        location.href = url;
    }
</script>

<section class="content">
    <div class="content_wrap">
        <div class="qna_board_wrap">
            <article class="basicText">
                <div class="headerTextDiv1">
                    <h2>글쓰기</h2>
                </div>
                <div class="redLine"></div>
                <div class="headerTextDiv2">미소원치과와 관련된 치료사례를 확인할수 있습니다.</div>
            </article>

            <article>
                <form:form method="post" class="submit" action="${pageContext.servletContext.contextPath}/admin/boardUpdate/${url}" enctype="multipart/form-data" commandName="boardVo" accept-charset="utf-8">
                    <div class="subjectDiv">
                        <div class="subject">제목</div>
                        <div class="subjectInputDiv input"><input type="text" name="subject" class="board_subject subjectInput" value="${board[0].subject}" data-alert="제목" maxlength="38"></div>
                    </div>

                    <div class="writerDiv">
                        <div class="writer">작성자</div>
                        <div class="writerInputDiv input"><input type="text" name="writer" class="board_writer writerInput" value="${board[0].writer}" data-alert="작성자"></div>
                    </div>
                    <div class="thumnailDiv">
                        <div class="thumnail">썸네일</div>
                        <div class="thumnailInputDiv input">
                            <input type="file" name="thumnail_img" class="thumnail_input none">
                            <span class="fileNameSpan">
								<span class="thumnailName">${board[0].thumnail}</span>
							</span>
                            <span class="imgSpan">
								<img src="<c:url value='/images/admin/thumnail_upload.jpg'/>" class="thumnailImg pointer">
							</span>
                        </div>
                    </div>
                    <div class="contentDiv">
                        <div class="contentText">내용</div>
                        <div class="contentInputDiv input">
                            <div class="boardContent">${board[0].content}</div>
                            <textarea name="contents" id="board_content" rows="10" cols="100" class="board_content contentInput" data-alert="내용"></textarea>
                        </div>
                    </div>

                    <c:if test="${fn:length(appendixList) == 0}">

                        <div class="fileDiv">
                            <div class="appendixText">첨부파일</div>
                            <div class="appendixDiv input">
                                <p>
                                    <input type="file" name="file1" class="none">
                                    <input type="hidden" name="type1" value="add" class="add">
                                    <span class="fileNameSpan">
										<span class="file1"></span>
									</span>
                                    <span class="imgSpan">
										<img src="<c:url value='/images/main/sub/appendix.jpg'/>" class="appendixImg pointer">
									</span>
                                </p>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${fn:length(appendixList) > 0}">

                        <c:set var="num">1</c:set>
                        <c:forEach var="list" items="${appendixList}">

                            <div class="fileDiv">
                                <div class="appendixText">파일첨부</div>
                                <div class="appendixDiv input">
                                    <p>
                                        <input type="file" name="file${num}" class="file_input none">
                                        <input type="hidden" name="type${num}" value="nomal">
                                        <input type="hidden" name="before${num}" value="${list.appendixNum}">
                                        <span class="fileNameSpan">
											<span class="file${num}">${list.fileOriginName}</span>
										</span>
                                        <span class="imgSpan">
											<img src="<c:url value='/images/main/sub/appendix.jpg'/>" class="appendixImg pointer">
										</span>
                                        <span class="inputDelete deleteAppendix" data-num="${num}"><img src="<c:url value='/images/main/sub/appendix.jpg'/>" class="pointer"></span>
                                    </p>
                                </div>
                            </div>

                            <c:set var="num">${num + 1}</c:set>
                        </c:forEach>

                        <div class="fileDiv">
                            <div class="appendixText">첨부파일</div>
                            <div class="appendixDiv input">
                                <p>
                                    <input type="file" name="file${fn:length(appendixList)+1}" class="none">
                                    <input type="hidden" name="type${fn:length(appendixList)+1}" value="add" class="add">
                                    <span class="fileNameSpan">
										<span class="fileSpan${fn:length(appendixList)+1}"></span>
									</span>
                                    <span class="imgSpan">
										<img src="<c:url value='/images/main/sub/appendix.jpg'/>" class="appendixImg pointer">
									</span>
                                </p>
                            </div>
                        </div>
                    </c:if>


                    <div class="bnController">
                        <div class="writeLeft">
                            <div class="listFn bn"><a href="<c:url value='/admin/case/1'/>"><img src="<c:url value='/images/admin/writeList.jpg'/>"></a></div>
                        </div>
                        <div class="writeRight">
                            <div class="resetFn bn resetBn"><img src="<c:url value='/images/admin/writeCancle.jpg'/>"></div>
                            <div class="submitFn bn submitBn"><img src="<c:url value='/images/admin/writeSubmit.jpg'/>"></div>
                        </div>
                    </div>

                    <input type="hidden" name="tableName" value="${tableName}">
                    <input type="hidden" name="update" value="${update}">
                    <c:if test="${board != null}">
                        <input type="hidden" name="num" value="${board[0].num}">
                    </c:if>
                    <input type="hidden" name="board" value="admin/${url}">
                    <input type="hidden" name="admin" value="admin">
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
                    view: this.url + "View.do?board_num=",
                    write: this.url + "Write.do?update=write"
                },
                boardWrite: true,
                appendixImg: ".appendixImg",
                thumanil: true,
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

