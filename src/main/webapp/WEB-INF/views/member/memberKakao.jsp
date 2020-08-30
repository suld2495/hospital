<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/member/member.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/memberAgreement.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/memberNaver.css"/>" />

<div class="sub-contents member">
    <h1 class="sub-page-title">회원가입</h1>
    <p class="sub-page-intro">JOIN</p>

    <form class="form" action="<c:url value='/member_kakao' />" method="PUT">
        <div class="max-layout-width">
            <div class="table">
                <ul>
                    <li>
                        <div class="label">
                            <strong>SNS로그인 연동</strong>
                        </div>
                        <div class="input">
                            <span class="login kakao-login"><i class="kakao"></i>카카오 아이디로 로그인</span>
                        </div>
                    </li>
                    <li class="id-con add-text">
                        <div class="label">
                            <strong>아이디</strong>
                        </div>
                        <div class="input">
                            <div>
                                <input>
                                <button>ID 중복확인</button>
                            </div>
                            <p>※ 6~20자여야 하며,한글/특수문자는 입력이 불가능합니다.</p>
                        </div>
                    </li>
                    <li class="name-con">
                        <div class="label">
                            <strong>이름</strong>
                        </div>
                        <div class="input">
                            <div>
                                <input class="long-input">
                            </div>
                        </div>
                    </li>
                    <li class="phone-con">
                        <div class="label">
                            <strong>연락처</strong>
                        </div>
                        <div class="input">
                            <div>
                                <div class="input-box">
                                        <span>
                                            <input>
                                        </span>
                                    <span>
                                            <input>
                                        </span>
                                    <span>
                                            <input>
                                        </span>
                                </div>
                                <label data-name="sms" class="check-label">
                                    <input class="display-none" name="sms" type="checkbox" value="Y">
                                    문자수신동의
                                </label>
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
                                            <input>
                                        </span>
                                    <span class="mail">
                                            <input>
                                        </span>
                                    <span>
                                            <select>
                                                <option>직접선택</option>
                                            </select>
                                        </span>
                                </div>
                                <label data-name="email" class="check-label">
                                    <input class="display-none" name="email" type="checkbox" value="Y">
                                    이메일 수신 동의
                                </label>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="agreement">
                <div class="service">
                    <h3>서비스 이용약관(필수)</h3>
                    <div></div>
                    <div class="radio-box">
                        <label><input type="radio" name="agree_1" value="ok">동의함</label>
                        <label><input type="radio" name="agree_1" value="no" checked>동의하지 않음</label>
                    </div>
                </div>
                <div class="privacy">
                    <h3>서비스 이용약관(필수)</h3>
                    <div></div>
                    <div class="radio-box">
                        <label><input type="radio" name="agree_2" value="ok">동의함</label>
                        <label><input type="radio" name="agree_2" value="no" checked>동의하지 않음</label>
                    </div>
                </div>
            </div>
            <div class="button-box">
                <button class="left-button">회원가입</button>
                <button type="reset" class="right-button">취소</button>
            </div>
        </div>
    </form>
</div>


<script>
    $(function() {
        $('.form').submit(function() {
            var agree_1 = this.agree_1.value;
            var agree_2 = this.agree_2.value;

            if (agree_1 !== 'ok' || agree_2 !== 'ok') {
                alert('약관에 동의해 주시기 바랍니다.');
                return false;
            }
        });
    });
</script>