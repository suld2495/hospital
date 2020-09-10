<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>


<link rel="stylesheet" href="<c:url value="/css/member/member.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/memberComplete.css"/>" />

<div class="sub-contents member-complete">
    <h1 class="sub-page-title">회원가입</h1>
    <p class="sub-page-intro">JOIN</p>

    <form class="form" action="member_input" method="post">
        <div class="max-layout-width">
            <div class="tab">
                <ul>
                    <li>
                        <div>
                            <span>01</span>
                            <div>
                                <h2>약관동의</h2>
                                <p>약관의 동의를 받습니다.</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <span>02</span>
                            <div>
                                <h2>회원정보입력</h2>
                                <p>올바른 정보를 입력하세요.</p>
                            </div>
                        </div>
                    </li>
                    <li class="active">
                        <div>
                            <span>03</span>
                            <div>
                                <h2>회원가입완료</h2>
                                <p>회원가입을 진심으로 축하드립니다.</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="complete">
                <h2 class="section-title">
                    모든 <span class="section-title-color">회원가입절차가<br>완료</span>되었습니다.
                </h2>
                <p class="section-text">
                    미소원치과의원 회원가입을 환영합니다.<br>
                    로그인하시면 회원 서비스를 바로 이용하실 수 있습니다.<br>
                    감사합니다.
                </p>
                <div class="date">
                    <p><strong>아이디</strong> : <%=request.getParameter("id")%></p>
                    <p><strong>가입일자</strong> : <%= sf.format(nowTime) %></p>
                </div>
            </div>
            <div class="button-box">
                <a href="<c:url value='/login' /> " class="left-button">로그인하기</a>
                <a href="<c:url value='/' /> " class="right-button">홈으로가기</a>
            </div>
        </div>
    </form>
</div>