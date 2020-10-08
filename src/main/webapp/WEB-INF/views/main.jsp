<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="<c:url value='/lib/fullPage/jquery.fullpage.min1.css' />">
<link rel="stylesheet" href="<c:url value='/lib/slick/css/slick.min.css' />">
<link rel="stylesheet" href="<c:url value='/lib/slick/css/slick.theme.css' />">
<link rel="stylesheet" href="<c:url value="/css/main.css"/>" />

<div class="popup">
    <div class="popup-slider">
        <div>
            <img data-lazy="<c:url value="/images/popup/popup2.jpg"/>">
        </div>
    </div>
    <div class="popup-button">
        <ul>
            <li class="popup-today">오늘 하루 보지 않기</li>
            <li class="popup-close">닫기</li>
        </ul>
    </div>
</div>

<div class="cover"></div>

<div class="fp-nav">
    <div class="fp-menu">
        <ul>
            <li data-menuanchor="anchor1" class="active">
                <a href="#anchor1">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor2">
                <a href="#anchor2">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor3">
                <a href="#anchor3">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor4">
                <a href="#anchor4">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor5">
                <a href="#anchor5">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor6">
                <a href="#anchor6">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor7">
                <a href="#anchor7">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor8">
                <a href="#anchor8">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor9">
                <a href="#anchor9">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
            <li data-menuanchor="anchor10">
                <a href="#anchor10">
                    <div class="shape"></div>
                    <div class="img"></div>
                    <span class="text">MISOWON</span>
                </a>
            </li>
        </ul>
        <ul class="quick">
            <li class="plus"></li>
            <li class="quick-button">
                <a href="http://booking.naver.com/bizes/302367" target="_blank" class="reserve">
                    <span>네이버예약</span>
                </a>
            </li>
        </ul>
        <div class="top-container">
            <div class="top-box">
                <div class="top-top">
                    <div class="top">
                        <div class="top-button">TOP</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="fullpage">
    <div class="section01 section">
        <div class="max-layout-width">
            <div class="control">
                <div class="auto"></div>
                <div class="num">
                    <span class="current">1</span>
                    <span class="shape">/</span>
                    <span class="total">4</span>
                </div>
                <div class="arrow">
                    <span class="prev"></span>
                    <span class="next"></span>
                </div>
            </div>
        </div>
        <div class="section01-slider">
            <div class="slide-item">
                <div class="img01 img"></div>
                <div class="max-layout-width">
                    <div class="text">
                        <h2>
                            풍부한 수술경험을 바탕으로<br>
                            고난이도 임플란트로 문제없이
                        </h2>
                        <p>검증된 재료와 풍부한 수술경험을 바탕으로 고난이도 수술이 가능합니다</p>
                        <a>
                            MORE
                            <span></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="slide-item">
                <div class="img02 img"></div>
                <div class="max-layout-width">
                    <div class="text">
                        <h2>
                            건물 내 기공소와 협업으로<br>
                            빠르고 정확한 보철물 제작
                        </h2>
                        <p>3D SEREC SYSTEM의 첨단장비를 갖추고 있으며 오랜 기공물 제작의<br>기술력으로 환자에게 딱 맞는 보철물을 제작합니다.</p>
                        <a>
                            MORE
                            <span></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="slide-item">
                <div class="img03 img"></div>
                <div class="max-layout-width">
                    <div class="text">
                        <h2>
                            환자분들의 편안한 진료를 위한<br>
                            품격있는 서비스환경 제공
                        </h2>
                        <p>2,3층 규모의 넓고 쾌적한 대기실, 청결한 진료 공간, 첨단 디지털 장비</p>
                        <a>
                            MORE
                            <span></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="slide-item">
                <div class="img04 img"></div>
                <div class="max-layout-width">
                    <div class="text">
                        <h2>
                            환자의 두려운 마음을<br>
                            헤아리는 편안한 진료
                        </h2>
                        <p>치료 단계별로 통증을 최소화하는 시스템과 의료진의 세심한 배려로<br>아프지 않은 치과 진료를 위해 최선을 다하고 있습니다.</p>
                        <a>
                            MORE
                            <span></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="scroll">SCROLL</div>
    </div>
    <div class="section02 position-relative section">
        <div class="max-layout-width">
            <h2>
                <strong>치아가 불편할 때 가장 먼저</strong><br>
                생각나는 미소원 치과
            </h2>
            <div class="display-inline-block">
                <ul>
                    <li>
                       <img src="<c:url value='/images/main/point_img01.jpg'/>">
                        <div class="nomal">
                            <h3>#디지털 임플란트</h3>
                        </div>
                        <div class="hover">
                            <h3>디지털 임플란트</h3>
                            <p>
                                모의 식립계획으로<br>
                                정교하고 정확하게 자연치아인듯<br>
                                편안하고 안전한 임플란트
                            </p>
                        </div>
                    </li>
                    <li>
                        <img src="<c:url value='/images/main/point_img02.jpg'/>">
                        <div class="nomal">
                            <h3>#치아교정</h3>
                        </div>
                        <div class="hover">
                            <h3>디지털 치아교정</h3>
                            <p>
                                3D CT를 활용한 정확한 진단으로<br>
                                수설없이 아름다운 라인을<br>
                                만들어주는 교정
                            </p>
                        </div>
                    </li>
                    <li class="last">
                        <img class="pc" src="<c:url value='/images/main/point_img03.jpg'/>">
                        <img class="mobile" src="<c:url value='/images/main/point_img03_m.png'/>">
                        <div class="nomal">
                            <h3>#자연치아</h3>
                        </div>
                        <div class="hover last">
                            <h3>자연치아 클리닉</h3>
                            <p>
                                CEREC SYSTEM을 활용한<br>
                                빠르고 정확한 치료
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
            <h5>
                "앞선 디지털 기술에 마음을 담은 진료,<br>
                환자를 향한 <strong>정직하고 양심적인 진료를 원칙</strong>으로 합니다"
            </h5>
        </div>
        <div class="bg"></div>
    </div>
    <div class="section04 section">
        <div class="text max-layout-width position-relative">
            <h4>소중한 사람에게 권해주고 싶은</h4>
            <h4><span><strong>미소가 활짝, 미소원치과</strong></span></h4>
            <p>다녀가신 환자분들의 후기로 현재의 미소원치과를 만나보세요</p>
            <span class="details-link pointer"><a href="<c:url value='/review/1'/>">자세히보기</a></span>
        </div>
        <div class="max-layout-width">
            <div class="review">
                <c:forEach items="${review}" var="list">
                    <div class="module">
                        <a class="module"
                            <sec:authorize access="isAnonymous()">
                                href="javascript:;void(0);"
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                href="<c:url value='/review-view/${list.num}'/>"
                            </sec:authorize>
                           >
                            <img src="<c:url value='${list.thumnail_path}${list.thumnail}' />">
                            <div class="position-relative">
                                <div class="review-text">
                                    <h4>${list.subject}</h4>
                                    <pre>${list.contents}</pre>
                                    <h7>${list.created_show_date}</h7>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="section05 section">
        <div>
            <div class="max-layout-width">
                <h2 class="section-title">
                    정직하게 진료하고<br>
                    <span class="section-title-color"><strong>연구하는 의료진</strong></span>
                </h2>
                <p class="section-text">
                    환자를 최우선으로 생각하고<br>
                    언제나 최선의 결과로 보답합니다.
                </p>
                <div class="img-arrow"></div>
                <div class="slider-container">
                    <div></div>
                    <div class="big-img big-img-slider">
                        <div class="cont01 cont">
                            <div class="doctor-slide-item">
                                <div class="img"></div>
                                <div class="text">
                                    <div class="title">
                                        <span>이상수</span>
                                        <span>원장</span>
                                    </div>
                                    <p class="sub-text">
                                        <span>첨단장비를 사용하여 꼼꼼하고 정확하게,</span><br>
                                        원칙을 지키는 진료를 우선합니다.
                                    </p>
                                    <h5>약력</h5>
                                    <p class="dc">
                                        통합치의학 전문의<br/>
                                        부산대학교 치의학전문대학원 졸업<br/>
                                        서울아산재단 울산대학교병원 치과통합 전문임상의 수료<br/>
                                        대한 구강악안면임플란트학회 정회원<br/>
                                        대한 통합치과학회 정회원<br/>
                                        대한 치과마과학회 정회원<br/>
                                        KIM'S 교정연구회 정회원<br/>
                                        전) 울산 한빛치과 원장<br/>
                                        전) 부산 e웰니스치과 원장<br/>
                                        전) 부산 수정치과 원장<br/>
                                        MEAW Orthodontic Master Course 수료<br/>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="cont02 cont">
                            <div class="doctor-slide-item">
                                <div class="img"></div>
                                <div class="text">
                                    <div class="title">
                                        <span>곽진원</span>
                                        <span>원장</span>
                                    </div>
                                    <p class="sub-text">
                                        <span>섬세한 진료로 마음 편안하게,</span><br>
                                        환자와의 신뢰가 먼저입니다.
                                    </p>
                                    <h5>약력</h5>
                                    <p class="dc">
                                        치의학 박사 / 전문의<br/>
                                        부산대학교 치과대학 졸업<br/>
                                        부산대학교 치의학대학원 석사<br/>
                                        부산대학교 치의학대학원 박사<br/>
                                        통합치의학과 전문의 취득<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 치과보철학회 정회원<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 구강악안면임플란트학회 정회원<br/>
                                        대한통합치과학회 정회원<br/>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="cont03 cont">
                            <div class="doctor-slide-item">
                                <div class="img"></div>
                                <div class="text">
                                    <div class="title">
                                        <span>송애진</span>
                                        <span>원장</span>
                                    </div>
                                    <p class="sub-text">
                                        <span>얼굴과 조화를 이루는 균형잡힌 교정!</span><br>
                                        아름답고 당당한 미소를 찾아드립니다.
                                    </p>
                                    <h5>약력</h5>
                                    <p class="dc">
                                        치의학 박사 / 전문의<br/>
                                        부산대학교 치과대학 졸업<br/>
                                        부산대학교 치의학대학원 석사<br/>
                                        부산대학교 치의학대학원 박사<br/>
                                        통합치의학과 전문의 취득<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 치과보철학회 정회원<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 구강악안면임플란트학회 정회원<br/>
                                        대한통합치과학회 정회원<br/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="doctor-slider">
                        <div><div class="img-box"><div class="img01 doctor-slide-item"></div></div></div>
                        <div><div class="img-box"><div class="img02 doctor-slide-item"></div></div></div>
                        <div><div class="img-box"><div class="img03 doctor-slide-item"></div></div></div>
                    </div>
                </div>
            </div>
            <div class="bg"></div>
        </div>
    </div>
    <div class="section07 section">
        <div class="max-layout-width">
            <h4>고민에 따른</h4>
            <h4><strong>개인별 맞춤 치료 제공</strong></h4>
        </div>
        <div class="slider-box max-layout-width">
            <div class="slider-origin-pagination">
                <ul>
                    <li class="active"></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
            <div class="slider-pagenation">
                <div class="bx-pager-item">
                    <a href="" data-slide-index="0" class="bx-pager-link text-decoration-none">
                        <span>01</span>
                        <span>임플란트 <span class="line">-</span> 자연치와 같은 저작력</span>
                    </a>
                </div><br>
                <div class="bx-pager-item">
                    <a href="" data-slide-index="1" class="bx-pager-link text-decoration-none">
                        <span>02</span>
                        <span>치아교정 <span class="line">-</span> 신중해야합니다</span>
                    </a>
                </div><br>
                <div class="bx-pager-item">
                    <a href="" data-slide-index="2" class="bx-pager-link text-decoration-none">
                        <span>03</span>
                        <span>사랑니에도<span class="line"></span> 난이도가 있습니다.</span>
                    </a>
                </div>
            </div>
            <div class="slider float-left">
                <div>
                    <div class="module slide-box">
                        <div class="module">
                            <img src="<c:url value='/images/main/img01.jpg' /> " class="pointer">
                            <div class="text">
                                <span class="square">IMPLANT</span>
                                <span class="num">01</span>
                            </div>
                        </div>
                    </div>
                    <h5>임플란트 - 자연치와 거의 같은 저작력</h5>
                    <p>사라진 치아뿐만 아니라 기능까지 회복시키는 치료입니다.</p>
                </div>
                <div>
                    <div class="module slide-box">
                        <div class="module">
                            <img src="<c:url value='/images/main/img02.jpg' /> " class="pointer">
                            <div class="text">
                                <span class="square">3D CT</span>
                                <span class="num">02</span>
                            </div>
                        </div>
                    </div>
                    <h5>치아교정 - 신중해야합니다</h5>
                    <p>3D 광학스캐너를 통해 본뜨는 과정은 더 정교하고 더 편안합니다.</p>
                </div>
                <div>
                    <div class="module slide-box">
                        <div class="module">
                            <img src="<c:url value='/images/main/img03.jpg' /> " class="pointer">
                            <div class="text">
                                <span class="square">WISDOM</span>
                                <span class="num">03</span>
                            </div>
                        </div>
                    </div>
                    <h5>사랑니에도 난이도가 있습니다.</h5>
                    <p>첨단장비와 남다른 기술력으로 시간과 비용절감에 효과적입니다.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="case section">
        <div class="max-layout-width">
            <h2>치료사례</h2>
            <div class="control">
                <span class="prev"></span>
                <span class="next"></span>
            </div>
            <div class="case-slider">
                <c:forEach items="${treatment}" var="list">
                    <div class="slide-item">
                        <a href="<c:url value='/case-view/${list.num}'/>">
                            <sec:authorize access="isAnonymous()">
                                <div  class="module">
                                    <div class="login module"><a href="<c:url value='/login'/>">로그인 해주세요</a></div>
                                </div>
                            </sec:authorize>
                            <img src="<c:url value='${list.thumnail_path}${list.thumnail}'/>">
                            <div class="text">
                                <h3>${list.subject}</h3>
                                <p>${list.writer}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <a class="more" href="<c:url value='/case/1'/>">사례 더보기</a>
        </div>
    </div>

    <div class="community section">
        <div class="community-container">
            <h1>COMMUNITY</h1>
            <div class="online">
                <a href="<c:url value='/online-consult/1'/>">
                    <h2>온라인 상담</h2>
                    <h3>맞춤 치료를 통해 고객님의<br>환한 미소를 찾아드립니다</h3>
                    <p>질문하신 내용에 대해 성심껏 답변드리겠습니다.</p>
                </a>
            </div>
            <div class="etc">
                <div class="reserve">
                    <a href="<c:url value='/reserve-write'/>">
                        <h2>예약 상담 신청</h2>
                        <p>
                            상담신청을 남겨주시면<br>
                            확인후 빠른 연락드리겠습니다.
                        </p>
                    </a>
                </div>
                <ul>
                    <li class="notice">
                        <a href="<c:url value='/notice/1'/>">
                            <h2>공지사항</h2>
                            <p>각종 미소원치과 소식을 빠르게<br>확인하세요</p>
                            <span></span>
                        </a>
                    </li>
                    <li class="media">
                        <a href="<c:url value='/media/1'/>">
                            <h2>미디어</h2>
                            <p>미소원치과의 다양한 영상을<br>통해 환자분들과 소통합니다.</p>
                            <span></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="section09 section">
        <div class="max-layout-width">
            <h4>미소원치과 <strong>미리보기</strong></h4>
            <p>따듯한 공간에서 편안하게 진료받으세요.</p>
            <div class="tour-slide">
                <c:forEach begin="1" end="10" varStatus="status">
                    <div class="slide-item">
                        <img src="<c:url value='/images/main/interior${status.count}.jpg' /> ">
                    </div>
                </c:forEach>
            </div>
            <div class="count">
                <div class="count-box">
                    <span class="current-count">01</span>
                    <span class="max-count">10</span>
                </div>
            </div>
            <div class="slide-text">
                <a class="text-decoration-none" href="<c:url value='/tour' />">
                    <p>실내사진 자세히보기</p>
                </a>
            </div>
        </div>
    </div>

    <div class="section">
        <section class="footer-info-container main-footer">
            <div class="max-layout-width">
                <ul class="display-inline-block">
                    <li>
                        <h3>진료시간 안내</h3>
                        <p>·평일 : AM 09:30 ~ PM 18:30 (화요일은 10시부터)</p>
                        <p>·수/금 : AM 09:30 ~ PM 20:00 (야간진료)</p>
                        <p>·토요일 : AM 09:30 ~ PM 16:00</p>
                        <p>·점심시간 : PM 12:30 ~ PM 14:00 (토요일 12:30~13:30)</p>
                        <p class="footer-info-margin">※ 일요일 및 공휴일은 휴진입니다.</p>
                    </li>
                    <li>
                        <h3>층별 안내</h3>
                        <p>·2층 : 교정 / 임플란트 / 심미보철 / 일반진료</p>
                        <p>·3층 : 임플란트 / 심미보철 / 일반진료</p>
                    </li>
                    <li class="last-footer-info">
                        <h3>정보</h3>
                        <p>상호 : 미소원치과 <span class="footer-line"></span> 대표자 : 곽진원</p>
                        <p>사업자등록번호 : 690-23-00971</p>
                        <p>TEL : <a class="tel text-decoration-none" href="tel:1899-7518">1899-7518</a> <span class="footer-line"></span> FAX : 052-700-7518</p>
                        <p>E-MAIL : misowondent@daum.net</p>
                        <p class="footer-location">주소 : 울산광역시 남구 화합로 150 / 시외고속버스 터미널맞은편 2,3층</p>
                    </li>
                </ul>
                <div class="sns-link text-align-center">
                    <ul class="display-inline-block">
                        <li class="sns-instagram">
                            <a class="text-decoration-none" href="https://www.instagram.com/misowondent20/" target="_blank">
                                <img src="<c:url value='/images/cmmn/sns_instagram.png' />" alt="인스타그램">
                                <span>인스타그램</span>
                                <img class="sns-arrow" src="<c:url value='/images/cmmn/arrow01.png' />">
                            </a>
                        </li>
                        <li class="sns-facebook">
                            <a class="text-decoration-none" href="https://www.facebook.com/misowondental/" target="_blank" alt="페이스북">
                                <img src="<c:url value='/images/cmmn/sns_facebook.png' />">
                                <span>페이스북</span>
                                <img class="sns-arrow" src="<c:url value='/images/cmmn/arrow01.png' />">
                            </a>
                        </li>
                        <li class="sns-blog">
                            <a class="text-decoration-none" href="https://blog.naver.com/misowondent" target="_blank" alt="블로그">
                                <img src="<c:url value='/images/cmmn/sns_blog.png' />">
                                <span>블로그</span>
                                <img class="sns-arrow" src="<c:url value='/images/cmmn/arrow01.png' />">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <section class="footer main-footer">
            <div class="max-layout-width">
                <div class="footer-location-container">
                    <p class="footer-location">울산광역시 남구 화합로 150 / 시외고속버스 터미널맞은편 2,3층</p>
                    <p class="footer-copyright">Copyright 2020 Misowon Dental Clinic. All Rights Reserved.</p>
                </div>
                <div class="footer-link">
                    <ul>
                        <li><a class="text-decoration-none font-15" href="<c:url value='/private-policy' />">개인정보처리방침</a></li>
                        <li><a class="text-decoration-none font-15 " href="<c:url value='/terms' />">이용약관</a></li>
                        <li><a class="text-decoration-none font-15" href="<c:url value='/video-operations-management-guidelines' />">영상정보처리기기운영관리지침</a></li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
</div>


<script src="<c:url value="/lib/fullPage/jquery.fullpage1.min.js" />"></script>
<script src="<c:url value="/lib/slick/js/slick.min.js" />"></script>
<script>
    $(function() {
        var windowWidth = $(window).width();

        if (windowWidth <= 414) {
            $('.section01').height($(window).height());
        }

        if (windowWidth > 768) {
            $('#fullpage').fullpage({
                //options here
                autoScrolling:true,
                scrollHorizontally: true,
                anchors: ['anchor1', 'anchor2', 'anchor3', 'anchor4', 'anchor5', 'anchor6', 'anchor7', 'anchor8', 'anchor9', 'anchor10'],
                menu: '.fp-nav',
                onLeave: function (index, nextIndex, direction) {
                    var $temp = $('header,.fp-nav');

                    if (nextIndex === 2 || nextIndex === 3 || nextIndex === 5 || nextIndex === 8) {
                        $temp.addClass('dark');
                    } else {
                        $temp.removeClass('dark');
                    }

                    if (nextIndex !== 1) {
                        $('.fp-nav').addClass('top-active');
                    } else {
                        $('.fp-nav').removeClass('top-active');
                    }

                    if (nextIndex === 5) {
                        $temp.addClass('light');
                    } else {
                        $temp.removeClass('light');
                    }
                }
            });
        }

        $('.img-box li').mouseenter(function() {
            var index = $(this).index();
            $('.contents-text').removeClass('active');
            $('.contents-text' + (index + 1)).addClass('active');
        });

        var minSlides = 4;
        var maxSlides = 4;

        if (768 < windowWidth && windowWidth < 1000) {
            minSlides = 3;
            maxSlides = 3;
        } else if (windowWidth <= 768) {
            minSlides = 2;
            maxSlides = 2;
        }

        $('.review').bxSlider({
            pager: false,
            minSlides: minSlides,
            maxSlides: maxSlides,
            moveSlides: 1,
            slideWidth: 318,
            shrinkItems: true,
            slideMargin: 10,
            auto: true,
            nextText: '<img src="<c:url value="/images/main/right_gr.png"/>">',
            prevText: '<img src="<c:url value="/images/main/left_gr.png"/>">',
            touchEnabled : (navigator.maxTouchPoints > 0),
        });

        $('.main-slider').bxSlider({
            pager: false,
            minSlides: 3,
            maxSlides: 3,
            moveSlides: 1,
            slideWidth: 530,
            shrinkItems: true,
            slideMargin: 36,
            nextText: '<img src="<c:url value="/images/main/arrow_right02.png"/>">',
            prevText: '<img src="<c:url value="/images/main/arrow_left02.png"/>">',
            auto: true,
        });

        var _sliderWidth;

        if (windowWidth > 768) {
            _sliderWidth = 510;
        } else {
            _sliderWidth = windowWidth - 40;
        }

        var slider = $('.slider').bxSlider({
            stopAutoOnClick: true,
            autoHover: true,
            minSlides: 2,
            maxSlides: 2,
            moveSlides: 1,
            slideWidth: _sliderWidth,
            shrinkItems: true,
            slideMargin: 40,
            pagerCustom: $('.slider-pagenation'),
            nextText: '<img src="<c:url value="/images/main/right02.png"/>">',
            prevText: '<img src="<c:url value="/images/main/left02.png"/>">',
            auto: true,
            onSliderLoad: function() {
                $('.slider-box').append($('.section07 .bx-controls'));
            },
            onSlideBefore: function ($slideElement, oldIndex, newIndex) {
                $('.section07 .slider-origin-pagination li').removeClass('active');
                $('.section07 .slider-origin-pagination li').eq(newIndex).addClass('active');
            }
        });

        $('.section07 .slider-origin-pagination li').click(function () {
            var index = $(this).index();
            slider.goToSlide(index);
        })

        $('.tour-slide').bxSlider({
            nextText: '<img src="<c:url value="/images/main/arrowbig_right.png"/>">',
            prevText: '<img src="<c:url value="/images/main/arrowbig_left.png"/>">',
            pager: false,
            auto: true,
            minSlides: 1,
            maxSlides: 1,
            moveSlides: 1,
            adaptiveHeight: true,
            shrinkItems: true,
            onSlideAfter: function($slideElement, oldIndex, newIndex) {
                $('.current-count').text(numberPad(newIndex + 1, 2));
            }
        })

        let windoWidth = $(window).width();

        if (windoWidth > 768) {
            $('.slider-container').width(windoWidth);
        } else {
            $('.slider-container').width(windoWidth - 40);
        }

        $('.doctor-slider .img-box').width(windoWidth * 0.1614);

        $('.big-img-slider').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.doctor-slider',
        });



        $('.doctor-slider').on('init', function(slick){
            $('.section05 .img-arrow').append($('.section05 .slider-prev'));
            $('.section05 .img-arrow').append($('.section05 .slider-next'));
        });
        $('.doctor-slider').slick({
            infinite: true,
            slidesToShow: 2,
            slidesToScroll: 1,
            asNavFor: '.big-img-slider',
            dots: false,
            focusOnSelect: true,
            variableWidth: true,
            autoplay: true,
            autoplaySpeed: 4000,
            arrow: true,
            prevArrow: '<span class="slider-prev"><</span>',
            nextArrow: '<span class="slider-next">></span>',
            responsive: [
                {
                    breakpoint: 1540,
                    settings: {
                        slidesToShow: 1,
                    }
                },
            ]
        });

        $('.section01-slider').bxSlider({
            pager: false,
            auto: true,
            mode: 'fade',
            nextSelector: '.section01 .control .next',
            prevSelector: '.section01 .control .prev',
            startText: 'start',
            autoControls: true,
            onSliderLoad: function() {
                $('.bx-controls-auto').appendTo($('.section01 .control .auto'));
                $('.section01 .bx-controls-auto .bx-stop').after($('.section01 .bx-controls-auto .bx-start'));
            },
            onSlideAfter: function ($slideElement, oldIndex, newIndex) {
                $('.section01 .num .current').text(newIndex + 1);
            }
        })

        $('.quick .plus').click(function () {
            $(this).toggleClass('active');
        })

        var caseSlider;
        var caseViewSlides;

        if (windowWidth > 900) {
            caseViewSlides = 4;
        } else if (windowWidth > 600) {
            caseViewSlides = 3;
        } else if (windowWidth > 414) {
            caseViewSlides = 2;
        }

        caseSlider = (windowWidth - 40) / caseViewSlides

        $('.case-slider').bxSlider({
            pager: false,
            nextSelector: '.case .control .next',
            prevSelector: '.case .control .prev',
            auto: true,
            minSlides: caseViewSlides,
            maxSlides: caseViewSlides,
            moveSlides: 1,
            slideWidth: caseSlider,
            slideMargin: 19,
            touchEnabled : (navigator.maxTouchPoints > 0),
            onSliderLoad: function() {
                $('.case .control').appendTo($('.case .bx-controls'));
            },
        })

        $('.login').click(function () {
            window.location.href = "<c:url value='/login'/>";
        })

        var popupWidth = 0;

        if (windowWidth < 490) {
            popupWidth = 490;
        } else {
            popupWidth = windowWidth;
        }

        $('.popup-slider').slick({
            minSlides: 1,
            maxSlides: 1,
            moveSlides: 1,
            slideWidth: popupWidth,
            pager: false,
            lazyLoad: 'ondemand'
        })

        $('.popup-slider').on('lazyLoaded', function(){
            var isPopup = getCookie('popup') === 'true';

            if (!isPopup) {
                $('.popup').addClass('active');
            }
        });


        $('.popup-today').click(function () {
            setCookie('popup', true, 1);
            $('.popup').remove();
        })

        $('.popup-close').click(function () {
            $('.popup').remove();
        })

        $('.top-button').click(function () {
            $.fn.fullpage.silentMoveTo('anchor1', 1);
        })

        $(document).on('click', '.section04 .bx-viewport,.case .bx-viewport', function() {
            <sec:authorize access="isAnonymous()">
                alert('의료법상 치료 사례 등 정보는 로그인 후 가능합니다. \n간단한 회원가입 후 로그인하여, \n미소원치과의 정보를 확인하시길 바랍니다.');
            </sec:authorize>
        });
        $(document).on('click', '.section04 .bx-viewport .module', function() {
            <sec:authorize access="isAuthenticated()">
            </sec:authorize>
        });
    });

    $(window).load(function () {
        var width = $('.section05 .bx-wrapper').width() + $('.section05 .big-img').width()
            + parseInt($('.section05 .bx-wrapper').css('margin-right')) + parseInt($('.section05 .big-img').css('margin-right'));
        $('.section05 .slider-container').width(width);
        $('.section05 .slider-container').width(width);
    })

    var setCookie = function(name, value, exp) {
        var date = new Date();
        date.setTime(date.getTime() + exp*24*60*60*1000);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
    };

    var getCookie = function(name) {
        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return value? value[2] : null;
    };

</script>