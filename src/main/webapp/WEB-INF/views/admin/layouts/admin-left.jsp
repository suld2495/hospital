<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav>
    <section>
        <aside class="head_title">
            <p><a href="main.do">에이치엠디자인 admin</a></p>
        </aside>
        <aside class="head_chang_txt category_head">
            <p>community</p>
        </aside>
        <aside class="category category1">
            <ul>
                <li class="notice noticeWrite"><span></span><a href="<c:url value='/admin/notice/1'/>">공지사항</a></li>
                <li class="gallery galleryWrite"><span></span><a href="<c:url value='/admin/notice/1'/>">치료사례</a></li>
                <li class="qna qnaWrite"><span></span><a href="<c:url value='/admin/notice/1'/>">치료후기</a></li>
                <li class="completion completionWrite"><span></span><a href="<c:url value='/admin/notice/1'/>">온라인상담</a></li>
                <li class="design designWrite"><span></span><a href="<c:url value='/admin/notice/1'/>">예약상담신청</a></li>
                <li class="design designWrite"><span></span><a href="<c:url value='/admin/media/1'/>">미디어</a></li>
            </ul>
        </aside>
        <aside class="category category1">
            <ul>
                <li class="popuplist popupwrite"><span></span><a href="popuplist.do">팝업관리</a></li>
            </ul>
        </aside>
        <div class="line"></div>
        <aside class="footer_category">
            <ul class="site_move">
                <li><a href="/" target="_blank">미소원치과</a></li>
                <li class="go"><a href="/" target="_blank">go</a></li>
            </ul>
            <p><a href="<c:url value='/logout'/>">로그아웃</a></p>
        </aside>
    </section>
</nav>

<script>

    var left = {

        categoryName : {

            notice : "category1", qna : "category1", gallery : "category1", completion : "category1", design : "category1",
            employlist : "category2", employreview : "category2", examslide: "category2", exam: "category2",
            schedule : "category3",
            emregister: "category4", unemregister: "category4", nomalregister: "category4"
        },

        init : function() {

            this.menu();

            //카테고리 슬라이드
            this.category_head();
        },

        menu : function() {

            var uri = location.href;
            var urlName = location.href.split("/")[4].split(".")[0];

            if(uri.search("main") == -1) {

                var subName = location.href.split("/")[location.href.split("/").length-1].replace(".do","");
                subName = subName.split("?")[0];
                $("." + subName).addClass("done");
            }

            var $category = $("." + this.categoryName[urlName]);

            $category.slideDown();
            $category.prev(".category_head").addClass("active");

            var $category = $(".category li");

            $category.mouseenter(function() {

                $(this).addClass("active");
            });

            $category.mouseleave(function() {

                $(this).removeClass("active");
            });
        },

        category_head : function() {

            var $category_head = $(".category_head");

            $category_head.click(function() {

                if($(this).hasClass("active")) return;

                var $category = $(this).next(".category");
                $category.siblings(".category").slideUp();
                $category.slideDown();

                $category_head.removeClass("active");
                $(this).addClass("active");
            });
        }
    }

    $(document).ready(function() {

        left.init();
    });

    $(window).load(function() {

        $("nav").height($("footer").offset().top + $("footer").height());
    })
</script>