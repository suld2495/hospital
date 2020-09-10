<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="<c:url value="/css/board/reviewWrite.css"/>" />

<div class="sub-contents review-write">
    <h1 class="sub-page-title">치료후기</h1>
    <p class="sub-page-intro">TREATMENT REVIEW</p>

    <section class="section01">
        <form:form class="form" action="${pageContext.servletContext.contextPath}/review-write" method="POST" commandName="boardVo" accept-charset="utf-8">
            <div class="max-layout-width">
                <table>
                    <colgroup>
                        <col width="93px">
                        <col width="*">
                        <col width="146px">
                    </colgroup>
                    <tbody>
                        <tr class="tr">
                            <th class="title">제목</th>
                            <td class="input"><input name="subject" value="${board.subject}"></td>
                            <td class="date">2020-08-30</td>
                        </tr>
                        <tr class="tr">
                            <th class="title">작성자</th>
                            <td class="input"><input name="writer" value="${board.writer}"></td>
                            <td class="date"></td>
                        </tr>
                        <tr class="con-tr">
                            <td colspan="3">
                                <textarea name="contents" id="ir1" rows="10" cols="100"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="button">
                    <div class="list">
                        <a href="<c:url value='/review/1'/>">목록</a>
                    </div>
                    <div class="btn-con">
                        <button type="submit">등록</button>
                        <button type="reset">취소</button>
                    </div>
                </div>
            </div>
        </form:form>
    </section>
</div>

<script type="text/javascript" src="<c:url value='/lib/editor/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
<script type="text/javascript">
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "ir1",
        sSkinURI: "<c:url value='/lib/editor/SmartEditor2Skin.html'/>",
        fCreator: "createSEditor2"
    });

    $(function () {
        $('form').submit(function () {
            var $subject = $('[name=subject]');
            var $writer = $('[name=writer]');
            var $contents = $('#ir1');

            oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

            if (!$subject.val()) {
                alert('제목을 입력해주세요.');
                $subject.focus();
                return false;
            }

            if (!$writer.val()) {
                alert('작성자를 입력해주세요.');
                $writer.focus();
                return false;
            }

            if (!$contents.val()) {
                alert('내용을 입력해주세요.');
                return false;
            }
        })
    })
</script>