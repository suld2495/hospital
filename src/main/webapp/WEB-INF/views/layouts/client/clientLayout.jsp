<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta name="robots" content="index, follow" />
    <meta name="robots" content="archive" />
    <meta name="description" content="미소원치과의 공지사항, 진료안내, 예약안내, 상담안내, 리얼스토리 등을 소개하는 홈페이지입니다." />
    <meta name="keyword" content="울산치과, 울산 치과추천,울산임플란트, 울산치아교정, 양악수술, 윤곽수술 ,울산교정, 울산사랑니" />
    <meta name="author" content='울산치과 미소원치과' />
    <meta property="og:type" content="website">
    <meta property="og:title" content="울산치과 미소원치과">
    <meta property="og:site_name" content="울산치과 미소원치과">
    <meta property="og:description" content="미소원치과의 공지사항, 진료안내, 예약안내, 상담안내, 리얼스토리 등을 소개하는 홈페이지입니다.">
<%--    <meta property="og:url" content="http://misowon.co.kr">--%>
<%--    <meta property="og:image" content="http://misowon.co.kr/img_meta.png">--%>
<%--    <meta name="naver-site-verification" content="67965aa40a3ba8955db1c2ef87c209254c64c1f4" />--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>미소가 활짝! 미소원치과</title>
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
    <link rel="shortcut icon" href="<c:url value='/images/favicon.png' />">
    <link rel="stylesheet" href="<c:url value='/lib/wow/animate.css' />">
    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientCommon.css' />">
    <link rel="stylesheet" href="<c:url value='/lib/bxSlider/bxSlider.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientHeader.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientFooter.css' />">
    <link rel="stylesheet" href="<c:url value='/css/clientSubNav.css' />">
    <script src="<c:url value='/js/lib/IE9.js' />"></script>
    <script src="<c:url value='/js/lib/jquery.1.12.4.js' />"></script>
    <script>
        if (document.location.protocol == 'http:') {
            if (document.location.href.indexOf('localhost') === -1) {
                document.location.href = document.location.href.replace('http:', 'https:');
            }
        }
    </script>
</head>
<body class="skrollr-body">
    <header>
        <tiles:insertAttribute name="header" />
    </header>
    <tiles:insertAttribute name="nav" />

    <section>
        <div id="contents">
            <tiles:insertAttribute name="contents" />
        </div>
    </section>

    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>

    <script src="<c:url value='/js/utils/StringUtils.js' /> "></script>
    <script src="<c:url value='/lib/bxSlider/bxSlider.js' />"></script>
    <script src="<c:url value='/js/clientLayout.js' />"></script>
    <script src="<c:url value="/lib/wow/wow.js" />"></script>

    <script>
        new WOW().init();
    </script>
    <!-- WIDERPLANET  SCRIPT START 2020.9.16 -->
    <div id="wp_tg_cts" style="display:none;"></div>
    <script type="text/javascript">
        var wptg_tagscript_vars = wptg_tagscript_vars || [];
        wptg_tagscript_vars.push(
            (function() {
                return {
                    wp_hcuid:"",   /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
				*주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
                    ti:"50308",	/*광고주 코드 */
                    ty:"Home",	/*트래킹태그 타입 */
                    device:"web"	/*디바이스 종류  (web 또는  mobile)*/

                };
            }));
    </script>
    <script type="text/javascript" async src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
    <!-- // WIDERPLANET  SCRIPT END 2020.9.16 -->
</body>
</html>
