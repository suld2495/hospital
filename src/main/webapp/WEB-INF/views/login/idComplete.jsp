<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<link rel="stylesheet" href="<c:url value="/css/member/memberComplete.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/login/search.css"/>" />


<div class="sub-contents member">
    <h1 class="sub-page-title">아이디/비밀번호 찾기</h1>
    <p class="sub-page-intro">FIND ID/PASSWORD</p>

    <form:form class="form" action="${pageContext.servletContext.contextPath}/id-search" method="POST" commandName="userVo">
        <div class="max-layout-width">
            <ul class="tab">
                <li><a class="active" href="<c:url value='/id-search'/>">아이디 찾기</a></li>
                <li><a href="<c:url value='/password-search'/>">비밀번호 찾기</a></li>
            </ul>

            <div class="complete">
                <div class="date">
                    <p><strong>회원님의 아이디는</strong> <span><%=request.getParameter("id")%></span> <strong>입니다.</strong></p>
                </div>
            </div>
            <div class="button-box">
                <a href="<c:url value='/login' /> " class="left-button">로그인하기</a>
            </div>
        </div>
        <input type="hidden" name="email">
    </form:form>
</div>
