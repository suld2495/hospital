<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="array" value="${fn:split('미소원치과,임플란트,치아교정,자연치아 클리닉,커뮤니티,개인정보,회원로그인,회원가입,마이페이지,심미보철치료',',')}"/>
<c:set var="urlArray" value="${fn:split('/intro,/digital_implants,/misowon_orthodontics,/general,/notice/1,/login,/member_agreement,/mypage_reservation,/aesthetic',',')}"/>

<div class="sub">
    <div class="sub-image">
        <div class="max-layout-width">
            <h2>${array[category]}</h2>
            <c:if test="${category eq 0}">
                <p>내원하시는 모든 고객님들을 내 가족처럼</p>
                <p>소중하게 생각합니다.</p>
            </c:if>
            <c:if test="${category eq 1}">
                <p>미소원치과는 수많은 임상결과와</p>
                <p>수술경험을 가지고 있습니다.</p>
            </c:if>
            <c:if test="${category eq 2}">
                <p>미소원치과는 이상적인 각도까지 생각해</p>
                <p>얼굴과 조화를 이루는 균형잡힌 교정치료를 합니다.</p>
            </c:if>
            <c:if test="${category eq 3}">
                <p>자연치아를 최대한 보존하는 진료를 통하여</p>
                <p>환자분의 건강한 치아를 지켜드립니다.</p>
            </c:if>
            <c:if test="${category eq 4}">
                <p>미소원치과는 환자분들과 소통을 통해</p>
                <p>더 가까이 다가갑니다.</p>
            </c:if>
            <c:if test="${category eq 5}">
                <p>미소원치과에서는 고객님의 개인정보가</p>
                <p>보호받을 수 있도록 최선을 다하겠습니다.</p>
            </c:if>
            <c:if test="${category eq 6}">
                <p>미소원치과에 로그인 하시면 더욱</p>
                <p>생생한 수술후기와 결과를 확인하실 수 있습니다.</p>
            </c:if>
            <c:if test="${category eq 7}">
                <p>미소원치과에 로그인 하시면 더욱</p>
                <p>생생한 수술후기와 결과를 확인하실 수 있습니다.</p>
            </c:if>
            <c:if test="${category eq 8}">
                <p>내 정보 관리와 미소원치과 예약내역을</p>
                <p>확인하실 수 있습니다.</p>
            </c:if>
            <c:if test="${category eq 9}">
                <p>웃는 모습의 아름다움을 찾을 수 있도록</p>
                <p>개인의 얼굴에 맞는 치아로 미소를 찾아드립니다.</p>
            </c:if>
        </div>
        <nav class="pc-category">
            <c:if test="${category eq 0}">
                <ul>
                    <li><a <c:if test="${path eq '/intro'}">class="active"</c:if> href="<c:url value="/intro"/>" >본원소개</a></li>
                    <li><a <c:if test="${path eq '/staff'}">class="active"</c:if> href="<c:url value="/staff"/>">의료진소개</a></li>
                    <li><a <c:if test="${path eq '/competitiveness'}">class="active"</c:if> href="<c:url value="/competitiveness"/>">핵심경쟁력</a></li>
                    <li><a <c:if test="${path eq '/diagnostic_equipment_system'}">class="active"</c:if> href="<c:url value="/diagnostic_equipment_system"/>">진단장비 시스템</a></li>
                    <li><a <c:if test="${path eq '/tour'}">class="active"</c:if> href="<c:url value="/tour"/>">둘러보기</a></li>
                    <li><a <c:if test="${path eq '/directions'}">class="active"</c:if> href="<c:url value="/directions"/>">오시는길</a></li>
<%--                    <li><a <c:if test="${path eq '/medical'}">class="active"</c:if> href="<c:url value="/medical"/>">진료보증제도</a></li>--%>
                </ul>
            </c:if>
            <c:if test="${category eq 1}">
                <ul>
                    <li><a <c:if test="${path eq '/digital_implants'}">class="active"</c:if> href="<c:url value="/digital_implants"/>" >디지털 임플란트</a></li>
                    <li><a <c:if test="${path eq '/navigation_implants'}">class="active"</c:if> href="<c:url value="/navigation_implants"/>">네비게이션 임플란트</a></li>
                    <li><a <c:if test="${path eq '/oneday_implants'}">class="active"</c:if> href="<c:url value="/oneday_implants"/>">원데이 임플란트</a></li>
                    <li><a <c:if test="${path eq '/bone_graft_implant'}">class="active"</c:if> href="<c:url value="/bone_graft_implant"/>">뼈이식 임플란트</a></li>
                    <li><a <c:if test="${path eq '/full_implants'}">class="active"</c:if> href="<c:url value="/full_implants"/>">전체 임플란트</a></li>
                </ul>
            </c:if>
            <c:if test="${category eq 2}">
                <ul>
                    <li><a <c:if test="${path eq '/misowon_orthodontics'}">class="active"</c:if> href="<c:url value="/misowon_orthodontics"/>" >미소원 치아교정</a></li>
                    <li><a <c:if test="${path eq '/partial_orthodontics'}">class="active"</c:if> href="<c:url value="/partial_orthodontics"/>">부분교정</a></li>
                    <li><a <c:if test="${path eq '/malocculusion_orthodontics'}">class="active"</c:if> href="<c:url value="/malocculusion_orthodontics"/>">부정교합 교정</a></li>
                    <li><a <c:if test="${path eq '/growth_reriod_orthodontics'}">class="active"</c:if> href="<c:url value="/growth_reriod_orthodontics"/>">성장기 교정</a></li>
                </ul>
            </c:if>
            <c:if test="${category eq 3}">
                <ul>
                    <li><a <c:if test="${path eq '/general'}">class="active"</c:if> href="<c:url value="/general"/>" >충치/치주/신경치료</a></li>
                    <li><a <c:if test="${path eq '/wisdom'}">class="active"</c:if> href="<c:url value="/wisdom"/>">사랑니 발치</a></li>
                    <li><a <c:if test="${path eq '/scaling'}">class="active"</c:if> href="<c:url value="/scaling"/>">스케일링</a></li>
                </ul>
            </c:if>
            <c:if test="${category eq 4}">
                <ul>
                    <li><a <c:if test="${fn:contains(path,'/notice')}">class="active"</c:if> href="<c:url value="/notice/1"/>" >공지사항</a></li>
                    <li><a <c:if test="${fn:contains(path,'/media')}">class="active"</c:if> href="<c:url value="/media/1"/>">미디어</a></li>
                    <li><a <c:if test="${fn:contains(path,'/review')}">class="active"</c:if> href="<c:url value="/review/1"/>">치료후기</a></li>
                    <li><a <c:if test="${fn:contains(path,'/case')}">class="active"</c:if> href="<c:url value="/case/1"/>">치료사례</a></li>
                    <li><a <c:if test="${fn:contains(path,'/online-consult')}">class="active"</c:if> href="<c:url value="/online-consult/1"/>">온라인 상담</a></li>
                    <li><a <c:if test="${fn:contains(path,'/reserve')}">class="active"</c:if> href="<c:url value="/reserve-write"/>">예약 상담 신청</a></li>
                </ul>
            </c:if>
            <c:if test="${category eq 8}">
                <ul>
                    <li><a <c:if test="${path eq '/aesthetic'}">class="active"</c:if> href="<c:url value="/mypage_reservation/1"/>" >예약내역</a></li>
                    <li><a <c:if test="${path eq '/aesthetic-ceramic'}">class="active"</c:if> href="<c:url value="/mypage_consult/1"/>">온라인 상담</a></li>
                    <li><a <c:if test="${path eq '/aesthetic-ceramic'}">class="active"</c:if> href="<c:url value="/mypage_update"/>">회원정보수정</a></li>
                </ul>
            </c:if>
            <c:if test="${category eq 9}">
                <ul>
                    <li><a <c:if test="${path eq '/aesthetic'}">class="active"</c:if> href="<c:url value="/aesthetic"/>" >라미네이트</a></li>
                    <li><a <c:if test="${path eq '/aesthetic-ceramic'}">class="active"</c:if> href="<c:url value="/aesthetic-ceramic"/>">올 세라믹 크라운</a></li>
                </ul>
            </c:if>
        </nav>
        <div class="breadcrumb max-layout-width pc-category">
            <ul class="display-inline-block">
                <li>
                    <a href="<c:url value='/' />" class="home">홈</a>
                </li>
                <li>
                    <a href="<c:url value='${urlArray[category]}' />" class="category text-decoration-none">${array[category]}</a>
                </li>
                <li>
                    <a href="<c:url value='${path}' />" class="category-url text-decoration-none">${urlName}</a>
                </li>
            </ul>
        </div>
        <div class="mobile-category">
            <ul class="sub-category-active">
                <li class="mobile-home"><a href="<c:url value='/' />"></a></li>
                <li class="mobile-sub-category sub-category-button">
                    <span>${array[category]}</span>
                    <ul class="sub-category-list">
                        <li><a href="<c:url value="/intro"/>" >미소원치과</a></li>
                        <li><a href="<c:url value="/digital_implants"/>" >임플란트</a></li>
                        <li><a href="<c:url value="/misowon_orthodontics"/>" >치아교정</a></li>
                        <li><a href="<c:url value="/aesthetic"/>" >심미보철치료</a></li>
                        <li><a href="<c:url value="/general"/>" >자연치아 클리닉</a></li>
                        <li><a href="<c:url value="/notice/1"/>" >커뮤니티</a></li>
                    </ul>
                </li>
                <li class="mobile-current-category sub-category-current-button">
                    <span>${urlName}</span>
                    <ul class="sub-category-list">
                        <c:if test="${category eq 0}">
                            <li><a href="<c:url value="/intro"/>" >본원소개</a></li>
                            <li><a href="<c:url value="/staff"/>">의료진소개</a></li>
                            <li><a href="<c:url value="/competitiveness"/>">핵심경쟁력</a></li>
                            <li><a href="<c:url value="/diagnostic_equipment_system"/>">진단장비 시스템</a></li>
                            <li><a href="<c:url value="/tour"/>">둘러보기</a></li>
                            <li><a href="<c:url value="/directions"/>">오시는길</a></li>
                                <%--                    <li><a <c:if test="${path eq '/medical'}">class="active"</c:if> href="<c:url value="/medical"/>">진료보증제도</a></li>--%>
                        </c:if>
                        <c:if test="${category eq 1}">
                            <li><a href="<c:url value="/digital_implants"/>" >디지털 임플란트</a></li>
                            <li><a href="<c:url value="/navigation_implants"/>">네비게이션 임플란트</a></li>
                            <li><a href="<c:url value="/oneday_implants"/>">원데이 임플란트</a></li>
                            <li><a href="<c:url value="/bone_graft_implant"/>">뼈이식 임플란트</a></li>
                            <li><a href="<c:url value="/full_implants"/>">전체 임플란트</a></li>
                        </c:if>
                        <c:if test="${category eq 2}">
                            <li><a href="<c:url value="/misowon_orthodontics"/>" >미소원 치아교정</a></li>
                            <li><a href="<c:url value="/partial_orthodontics"/>">부분교정</a></li>
                            <li><a href="<c:url value="/malocculusion_orthodontics"/>">부정교합 교정</a></li>
                            <li><a href="<c:url value="/growth_reriod_orthodontics"/>">성장기 교정</a></li>
                        </c:if>
                        <c:if test="${category eq 3}">
                                <li><a href="<c:url value="/general"/>" >충치/치주/신경치료</a></li>
                                <li><a href="<c:url value="/wisdom"/>">사랑니 발치</a></li>
                                <li><a href="<c:url value="/scaling"/>">스케일링</a></li>
                        </c:if>
                        <c:if test="${category eq 4}">
                                <li><a href="<c:url value="/notice/1"/>" >공지사항</a></li>
                                <li><a href="<c:url value="/media/1"/>">미디어</a></li>
                                <li><a href="<c:url value="/review/1"/>">치료후기</a></li>
                                <li><a href="<c:url value="/case/1"/>">치료사례</a></li>
                                <li><a href="<c:url value="/online-consult/1"/>">온라인 상담</a></li>
                                <li><a href="<c:url value="/reserve-write"/>">예약 상담 신청</a></li>
                        </c:if>
                        <c:if test="${category eq 9}">
                            <li><a href="<c:url value="/aesthetic"/>" >라미네이트</a></li>
                            <li><a href="<c:url value="/aesthetic-ceramic"/>">올세라믹 크라운</a></li>
                        </c:if>
                        <c:if test="${category eq 8}">
                            <li><a <c:if test="${path eq '/aesthetic'}">class="active"</c:if> href="<c:url value="/mypage_reservation/1"/>" >예약내역</a></li>
                            <li><a <c:if test="${path eq '/aesthetic-ceramic'}">class="active"</c:if> href="<c:url value="/mypage_consult/1"/>">온라인 상담</a></li>
                            <li><a <c:if test="${path eq '/aesthetic-ceramic'}">class="active"</c:if> href="<c:url value="/mypage_update"/>">회원정보수정</a></li>
                        </c:if>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="top-container">
    <div class="top-box">
        <div class="top-top">
            <div class="top">
                <div class="top-button">TOP</div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        var backgroundPrefix = 'images/sub/background/';
        var category = '${category}';
        var categoryBackground = ['info.jpg', 'img_sub02.jpg', 'img_sub03.jpg', 'img_sub04.jpg', 'img_sub05.jpg', 'img_sub06.jpg', 'img_sub07.jpg', 'img_sub08.jpg', 'img_sub09.jpg', 'img_sub10.jpg'];
        if (category === '4' && !('${path}' === '/reserve-write' || '${path}' === '/online-consult-write')) backgroundPrefix = "../" + backgroundPrefix;
        if (category === '8' && ('${path}'.indexOf('mypage_reservation') > -1 || '${path}'.indexOf('mypage_consult') > -1)) backgroundPrefix = "../" + backgroundPrefix;
        $('.sub-image').css('background-image', 'url(' + backgroundPrefix + categoryBackground[category] + ')');

        $('.sub-category-button,.sub-category-current-button').click(function () {
            $(this).toggleClass('active');
            $(this).find('.sub-category-list').toggleClass('active');
        });
        $('.top').click(function () {
            $(window).scrollTop(0);
        });
        $(window).scroll(function () {
            var height = 1000;

            if ($(this).scrollTop() > height) {
                $('.sub + .top-container').addClass('active');
            } else {
                $('.sub + .top-container').removeClass('active');
            }
        })
    })
</script>