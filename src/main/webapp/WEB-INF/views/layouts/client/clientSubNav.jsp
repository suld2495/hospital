<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="array" value="${fn:split('미소원치과,디지털 임플란트,디지털 치아교정,자연치아 클리닉,커뮤니티',',')}"/>
<c:set var="urlArray" value="${fn:split('/intro,/digital_implants,디지털 치아교정,자연치아 클리닉,커뮤니티',',')}"/>

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
        </div>
        <nav>
            <c:if test="${category eq 0}">
                <ul>
                    <li><a <c:if test="${path eq '/intro'}">class="active"</c:if> href="<c:url value="/intro"/>" >본원소개</a></li>
                    <li><a <c:if test="${path eq '/staff'}">class="active"</c:if> href="<c:url value="/staff"/>">의료진소개</a></li>
                    <li><a <c:if test="${path eq '/competitiveness'}">class="active"</c:if> href="<c:url value="/competitiveness"/>">핵심경쟁력</a></li>
                    <li><a <c:if test="${path eq '/diagnostic_equipment_system'}">class="active"</c:if> href="<c:url value="/diagnostic_equipment_system"/>">진단장비 시스템</a></li>
                    <li><a <c:if test="${path eq '/tour'}">class="active"</c:if> href="<c:url value="/tour"/>">둘러보기</a></li>
                    <li><a <c:if test="${path eq '/directions'}">class="active"</c:if> href="<c:url value="/directions"/>">오시는길</a></li>
                    <li><a <c:if test="${path eq '/medical'}">class="active"</c:if> href="<c:url value="/medical"/>">진료보증제도</a></li>
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
        </nav>
        <div class="breadcrumb max-layout-width">
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
    </div>
</div>

<script>
    $(function() {
        var backgroundPrefix = 'images/sub/background/';
        var category = '${category}'
        var categoryBackground = ['info.jpg', 'img_sub02.jpg'];
        $('.sub-image').css('background-image', 'url(' + backgroundPrefix + categoryBackground[category] + ')');
    })
</script>