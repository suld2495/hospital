<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/login/login.css"/>" />

<div class="sub-contents login">
    <h1 class="sub-page-title">회원로그인</h1>
    <p class="sub-page-intro">MEMBER LOGIN</p>

    <div class="max-layout-width">
        <div class="container">
            <form method="post" class="form">
                <span><input placeholder="아이디를 입력해주세요" name="id"></span>
                <span><input placeholder="비밀번호를 입력해주세요" type="password" name="password"></span>
            </form>
            <a class="pointer link misowon-login"><i class="misowon"></i>미소원 아이디로 로그인</a>
            <a class="pointer link naver-login" href="${naverUrl}"><i class="naver"></i>네이버 아이디로 로그인</a>
            <a class="pointer link kakao-login"><i class="kakao"></i>카카오계정으로 로그인</a>
        </div>

        <div class="member-box">
            <div class="container">
                <div class="member">
                    <a href="<c:url value='/member_agreement' />">회원가입</a>
                    <a>아이디·비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    <c:if test="${param.result.equals('fail')}">
        alert("아이디 또는 비밀번호를 확인해주세요.")
    </c:if>

    $(function () {
        $('.misowon-login').click(function () {
            var result = validation();

            if (!result) return;

            $('.form').attr('action', 'login/auth');
            $('.form').submit();
        });

        function validation() {
            var $id = $('[name=id]');
            var $password = $('[name=password]');

            if (!$id.val()) {
                alert("아이디를 입력해주세요.");
                $id.focus();
                return false;
            }

            if (!$password.val()) {
                alert("비밀번호를 입력해주세요.");
                $password.focus();
                return false;
            }

            return true;
        }
    })
</script>