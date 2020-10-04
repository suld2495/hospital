<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header>
    <article class="logo_area">
        <ul>
            <li><!-- <img src="../images/admin/logo.jpg"> --></li>
            <li>[
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <sec:authentication property="principal.username"/>
                </sec:authorize>
                님, 안녕하세요]</li>
        </ul>
    </article>

    <article class="small_nav">
        <ul>
            <li><img src="<c:url value='/images/admin/home.jpg'/>"></li>
            <li>></li>
            <li><strong>커뮤니티</strong></li>
            <li class="arrow"></li>
            <li class="subName"></li>
        </ul>
    </article>
</header>

<script>

    var toptop = {

        init : function() {

            var uri = location.href;

            if(uri.search("main") == -1) {

                var category = {notice : "HM 일상", qna : "Q&A", gallery : "인테리어팁", completion : "완공사례", design : "설계사례",
                    noticeWrite : "공지사항 글쓰기", galleryWrite : "소통게시판 글쓰기", qnaWrite : "답변하기", completionWrite : "완공사계 글쓰기",
                    designWrite : "설계사례 글쓰기", popuplist : "팝업관리", popupwrite : "팝업 글쓰기"};

                var $arrow = $(".arrow");
                var $subName = $(".subName");

                var subName = location.href.split("/")[location.href.split("/").length-1].replace(".do","").split("?")[0];

                $arrow.html(">");
                $subName.html(category[subName]);
            }
        }
    }

    $(document).ready(function() {

        toptop.init();
    })
</script>