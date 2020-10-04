<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/boardWrite.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/login/search.css"/>" />



<div class="sub-contents member">
    <h1 class="sub-page-title">아이디/비밀번호 찾기</h1>
    <p class="sub-page-intro">FIND ID/PASSWORD</p>

    <form:form class="form" action="${pageContext.servletContext.contextPath}/password-search" method="POST" commandName="userVo">
        <div class="max-layout-width">
            <ul class="tab">
                <li><a href="<c:url value='/id-search'/>">아이디 찾기</a></li>
                <li><a class="active" href="<c:url value='/password-search'/>">비밀번호 찾기</a></li>
            </ul>

            <h2>비밀번호 찾기</h2>

            <div class="table">
                <ul>
                    <li class="name-con">
                        <div class="label">
                            <strong>아이디</strong>
                        </div>
                        <div class="input">
                            <div>
                                <input class="long-input" name="id" maxlength="50">
                            </div>
                        </div>
                    </li>
                    <li class="email-con">
                        <div class="label">
                            <strong>이메일</strong>
                        </div>
                        <div class="input">
                            <div>
                                <div class="input-box">
                                        <span>
                                            <input name="email1">
                                        </span>
                                    <span class="mail">
                                            <input name="email2">
                                        </span>
                                    <span>
                                            <select name="email3">
                                                <option value="" selected="selected">직접선택</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="chol.com">chol.com</option>
                                                <option value="dreamwiz.com">dreamwiz.com</option>
                                                <option value="empal.com">empal.com</option>
                                                <option value="freechal.com">freechal.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="hanafos.com">hanafos.com</option>
                                                <option value="hanmir.com">hanmir.com</option>
                                                <option value="hitel.net">hitel.net</option>
                                                <option value="hotmail.com">hotmail.com</option>
                                                <option value="korea.com">korea.com</option>
                                                <option value="lycos.co.kr">lycos.co.kr</option>
                                                <option value="nate.com">nate.com</option>
                                                <option value="netian.com">netian.com</option>
                                                <option value="paran.com">paran.com</option>
                                            </select>
                                        </span>
                                </div>
                                <label data-name="email" class="check-label">
                                    <input class="display-none" name="emailYN" type="checkbox" value="Y">
                                    이메일 수신 동의
                                </label>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <p class="email-notice">※ 이메일로 임시비밀번호가 발송됩니다.</p>
            <div class="btn">
                <button type="submit">확인</button>
            </div>
        </div>
    </form:form>
</div>