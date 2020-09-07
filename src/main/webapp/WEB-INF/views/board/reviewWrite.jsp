<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/board/reviewWrite.css"/>" />

<div class="sub-contents review-write">
    <h1 class="sub-page-title">치료후기</h1>
    <p class="sub-page-intro">TREATMENT REVIEW</p>

    <section class="section01">
        <form method="post" action="/review-write">
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
                            <td class="input"><input type="subject"></td>
                            <td class="date">2020-08-30</td>
                        </tr>
                        <tr class="tr">
                            <th class="title">작성자</th>
                            <td class="input"><input type="writer"></td>
                            <td class="date"></td>
                        </tr>
                        <tr class="con-tr">
                            <td colspan="3">
                                <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="button">
                    <div class="list">
                        <a href="<c:url value='/review'/>">목록</a>
                    </div>
                    <div class="btn-con">
                        <button type="submit">등록</button>
                        <button type="reset">취소</button>
                    </div>
                </div>
            </div>
        </form>
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
</script>