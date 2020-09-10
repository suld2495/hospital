<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<link rel="stylesheet" href="<c:url value="/css/member/member.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/memberInput.css"/>" />



<div class="sub-contents member">
    <h1 class="sub-page-title">회원가입</h1>
    <p class="sub-page-intro">JOIN</p>

    <form:form class="form" action="${pageContext.servletContext.contextPath}/member_insert" method="POST" commandName="userVo">
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
                                <input name="id" maxlength="20">
                                <button type="button" class="id-check">ID 중복확인</button>
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
                                <input type="password" class="long-input" name="password" maxlength="20">
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
                                <input type="password" class="long-input" name="password_chk" maxlength="20">
                            </div>
                        </div>
                    </li>
                    <li class="name-con">
                        <div class="label">
                            <strong>이름</strong>
                        </div>
                        <div class="input">
                            <div>
                                <input class="long-input" name="name">
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
                                        <input name="phone1">
                                    </span>
                                    <span>
                                        <input name="phone2">
                                    </span>
                                    <span>
                                        <input name="phone3">
                                    </span>
                                </div>
                                <label data-name="sms" class="check-label">
                                    <input class="display-none" name="smsYN" type="checkbox" value="Y">
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
            <div class="button-box">
                <button class="left-button">회원가입</button>
                <button type="reset" class="right-button">취소</button>
            </div>
        </div>
        <input type="hidden" name="phone">
        <input type="hidden" name="email">
        <input type="hidden" name="serviceYN" value="${agree.agree_1}">
        <input type="hidden" name="privacyYN" value="${agree.agree_2}">
    </form:form>
</div>

<script>
    $(function() {
        var isIdCheck = false;

        $('.check-label').click(function() {
            var name = $(this).data('name');
            var $input = $('[name=' + name + ']');
            $input.prop('checked', !$input.prop('checked'));
        });

        $("[name=id]").change(function () {
            isIdCheck = false;
        })

        /* 아이디 중복확인 */
        $('.id-check').click(function() {
            var idReg = /^[a-zA-Z]+[a-zA-Z0-9]{5,19}$/g;
            var $id = $("[name=id]");

            if (!$id.val()) {
                alert("아이디를 입력해 주세요.");
                $id.focus();
                return;
            }

            if (!idReg.test($id.val())) {
                alert("아이디는 6~20자여야 하며,한글/특수문자는 입력이 불가능합니다.")
                $id.focus();
                return false;
            }

            $.ajax({
                url: '<c:out value="id_check"/>',
                data: { id: $id.val() },
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    isIdCheck = result;

                    if (isIdCheck) {
                        alert("사용할 수 있는 아이디 입니다.");
                    } else {
                        alert("중복된 아이디입니다. 다른 아이디를 사용해 주세요.");
                        $("[name=id]").focus();
                    }
                }
            })
        });

        $('.form').submit(function() {
            var idReg = /^[a-zA-Z]+[a-zA-Z0-9]{5,19}$/g;
            var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/g;

            var $id = $("[name=id]");
            var $pass = $("[name=password]");
            var $passChk = $("[name=password_chk]");

            if (!isIdCheck) {
                alert("아이디 중복확인을 해주세요.");
                $id.focus();
                return false;
            }

            if (!idReg.test($id.val())) {
                alert("아이디는 6~20자여야 하며,한글/특수문자는 입력이 불가능합니다.")
                $id.focus();
                return false;
            }

            if (!passReg.test($pass.val())) {
                alert("비밀번호는 영문,숫자,특수문자 조합으로 6~20자 이여야 합니다.")
                $pass.focus();
                return false;
            }

            if ($pass.val() !== $passChk.val()) {
                alert("비밀번호가 일치하지 않습니다.");
                $passChk.focus();
                return false;
            }

            $('[name=phone]').val($('[name=phone1]').val() + $('[name=phone2]').val() + $('[name=phone3]').val())
            $('[name=email]').val($('[name=email1]').val() + $('[name=email2]').val() + $('[name=email3]').val())
        });
    });
</script>