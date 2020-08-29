<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/member/member.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/memberInput.css"/>" />

<div class="sub-contents member">
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
                    <li class="active">
                        <div>
                            <span>02</span>
                            <div>
                                <h2>회원정보입력</h2>
                                <p>올바른 정보를 입력하세요.</p>
                            </div>
                        </div>
                    </li>
                    <li>
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
            <div class="table">
                <ul>
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
                    <li class="pass-con add-text">
                        <div class="label">
                            <strong>비밀번호</strong>
                        </div>
                        <div class="input">
                            <div>
                                <input class="long-input">
                            </div>
                            <p>※ 영문,숫자,특수문자 조합으로 6~20자 이여야 합니다.</p>
                        </div>
                    </li>
                    <li class="pass-chk-con">
                        <div class="label">
                            <strong>비밀번호 확인</strong>
                        </div>
                        <div class="input">
                            <div>
                                <input class="long-input">
                            </div>
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
            <div class="button-box">
                <button class="left-button">회원가입</button>
                <button type="reset" class="right-button">취소</button>
            </div>
        </div>
    </form>
</div>

<script>
    $(function() {
        $('.check-label').click(function() {
            var name = $(this).data('name');
            var $input = $('[name=' + name + ']');
            $input.prop('checked', !$input.prop('checked'));
        });
    });
</script>