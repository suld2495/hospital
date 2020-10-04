<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/mypage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/mypageUpdate.css"/>" />

<div class="sub-contents mypage-reservation">
    <h1 class="sub-page-title">마이페이지</h1>
    <p class="sub-page-intro">MYPAGE</p>

    <div class="max-layout-width">
        <div class="tab">
            <ul>
                <li><a href="<c:url value='/mypage_reservation/1' />">예약내역</a></li>
                <li><a href="<c:url value='/mypage_consult/1' />">온라인 상담</a></li>
                <li class="active"><a href="<c:url value='/mypage_update' />">회원정보수정</a></li>
            </ul>
        </div>


        <form:form class="form" action="${pageContext.servletContext.contextPath}/mypage_update" method="POST" commandName="userVo">
            <div class="max-layout-width">
                <div class="table">
                    <ul>
                        <li class="name-con">
                            <div class="label">
                                <strong>이름</strong>
                            </div>
                            <div class="input">
                                <div class="text">
                                    <sec:authentication property="principal.name"></sec:authentication>
                                </div>
                            </div>
                        </li>
                        <li class="id-con">
                            <div class="label">
                                <strong>아이디</strong>
                            </div>
                            <div class="input">
                                <div class="text">
                                    <c:set var="use"><sec:authentication property="principal.provider"></sec:authentication></c:set>
                                    <c:if test="${use == null}">
                                        연동 사용중
                                    </c:if>
                                    <c:if test="${use != null}">
                                        <sec:authentication property="principal.id"></sec:authentication>
                                    </c:if>
                                </div>
                            </div>
                        </li>
                        <li class="pass-con add-text">
                            <div class="label">
                                <strong>비밀번호</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="long-input" type="password" name="current_password" maxlength="20">
                                    <p>기존 비밀번호를 입력해 주세요.</p>
                                </div>
                            </div>
                        </li>
                        <li class="pass-chk-con add-text">
                            <div class="label">
                                <strong>비밀번호 확인</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="long-input" type="password" name="password" maxlength="20">
                                    <p>변경하고자 하는 비밀번호 영문,숫자 2가지 이상 조합으로 10~20자 이여야 합니다.</p>
                                </div>
                            </div>
                        </li>
                        <li class="pass-chk-con add-text">
                            <div class="label">
                                <strong>새 비밀번호 확인</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="long-input" type="password" name="password_chk" maxlength="20">
                                    <p>비밀번호를 다시 입력해 주세요</p>
                                </div>
                            </div>
                        </li>
<%--                        <li class="birth-con">--%>
<%--                            <div class="label">--%>
<%--                                <strong>생년월일</strong>--%>
<%--                            </div>--%>
<%--                            <div class="input">--%>
<%--                                <div class="text">--%>
<%--                                    102121--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
                        <li class="phone-con">
                            <div class="label">
                                <strong>연락처</strong>
                                <c:set var="phone">
                                    <sec:authentication property="principal.phone"></sec:authentication>
                                </c:set>
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
                                        <c:set var="smsYN">
                                            <sec:authentication property="principal.smsYN"></sec:authentication>
                                        </c:set>
                                        <input class="display-none" name="smsYN" type="checkbox" value="Y" <c:if test="${emailYN == 'Y'}">checked</c:if>>
                                        문자수신동의
                                    </label>
                                    <span class="mobile">모바일 중복확인</span>
                                </div>
                            </div>
                        </li>
                        <li class="email-con">
                            <div class="label">
                                <strong>이메일</strong>
                                <c:set var="email">
                                    <sec:authentication property="principal.email"></sec:authentication>
                                </c:set>
                                <c:set var="emailList">
                                    <c:out value='${email}' escapeXml='false'/>
                                </c:set>
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
                                    <c:set var="emailYN">
                                        <sec:authentication property="principal.emailYN"></sec:authentication>
                                    </c:set>
                                    <label data-name="email" class="check-label">
                                        <input class="display-none" name="emailYN" type="checkbox" value="Y" <c:if test="${emailYN == 'Y'}">checked</c:if>>
                                        이메일 수신 동의
                                    </label>
                                    <p>※ 비밀번호 분실시,상담게시판 답변등은 회원가입시 작성해주신 이메일로 보내드리오니 정확하게 기재바랍니다.</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="sns">
                    <h2>SNS 아이디 연동 정보</h2>
                    <p>아이디 로그인 설정이 없을 경우 SNS 간편 로그인 기능을 해제 하실 수 없습니다.</p>
                    <p>로그인 연결 해제는 단순히 SNS 간편 로그인 기능만을 해제하는 것이며,회원탈퇴가 되는 것은 아닙니다.</p>

                    <div class="link">
                        <div class="kakao">
                            <span><i class="kakao-icon"></i>카카오계정으로 로그인/회원가입</span>
                            <span>연결된 정보가 없습니다.</span>
                        </div>
                        <div class="naver">
                            <span><i class="naver-icon"></i>네이버 아이디로 로그인/회원가입</span>
                            <span>연결된 정보가 없습니다.</span>
                        </div>
                    </div>
                </div>
                <div class="button-box">
                    <input type="hidden" name="phone">
                    <c:set var="id">
                        <sec:authentication property="principal.id"></sec:authentication>
                    </c:set>
                    <input type="hidden" name="id" value="${id}">
                    <input type="hidden" name="email">
                    <button type="button" class="submit active">회원정보 수정</button>
                    <button type="reset">취소</button>
                    <a href="<c:url value='/membership_widthdrawal'/>">회원탈퇴</a>
                </div>
            </div>
        </form:form>
    </div>
</div>


<script>
    $(function() {
        var isIdCheck = false;
        var phone = "${phone}".replace(/&#45;/g, "-");
        var email = "${email}".replace(/&#64;/g, "@").replace(/&#46;/g, ".");

        if (email) {
            var emailSplit = email.split('@');
            $('[name=email1]').val(emailSplit[0]);
            $('[name=email2]').val(emailSplit[1]);
        }
        if (phone) {
            var phoneSplit = phone.split('-');
            $('[name=phone1]').val(phoneSplit[0]);
            $('[name=phone2]').val(phoneSplit[1]);
            $('[name=phone3]').val(phoneSplit[2]);
        }

        $('.check-label').click(function() {
            var name = $(this).data('name');
            var $input = $('[name=' + name + ']');
            $input.prop('checked', !$input.prop('checked'));
        });

        $("[name=id]").change(function () {
            isIdCheck = false;
        })

        $('[name=email3]').change(function (e) {
            if ($(this).val() !== '') {
                $('[name=email2]').val($(this).val());
            }
        })

        $('.submit').click(function() {
            var passReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/g;

            var $pass = $("[name=password]");
            var $passChk = $("[name=password_chk]");
            var $name = $("[name=name]");

            $.ajax({
                url: '<c:url value="/password-check"/>',
                data: {
                    password : $('[name=current_password]').val()
                },
                type: 'post',
                dataType: 'json',
                success: function(result) {

                    if (result.result === "error") {
                        alert("문제가 발생하였습니다. 잠시 후 다시 이용해주시기 바랍니다.");
                        return false;
                    }

                    if (result.result === "no") {
                        alert("현재 비밀번호가 일치하지 않습니다. 다시 입력해 주시기 바랍니다.");
                        $('[name=current_password]').focus();
                        return false;
                    }

                    if ($pass.val()) {
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
                    }

                    for (var i = 1; i < 4; i++) {
                        var $phone = $("[name=phone" + i + "]");

                        if ($phone.val() === '') {
                            alert("전화번호를 입력해 주세요.");
                            $phone.focus();
                            return false;
                        }
                    }

                    for (var i = 1; i < 3; i++) {
                        var $email = $("[name=email" + i + "]");

                        if ($email.val() === '') {
                            alert("이메일를 입력해 주세요.");
                            $email.focus();
                            return false;
                        }
                    }

                    if (!$pass.val()) {
                        $pass.val($('[name=current_password]').val())
                    }

                    $('[name=phone]').val($('[name=phone1]').val() + "-" + $('[name=phone2]').val() + "-"  + $('[name=phone3]').val())
                    $('[name=email]').val($('[name=email1]').val() + "@" + $('[name=email2]').val())

                    alert("수정이 완료되었습니다.");

                    $('.form').submit();
                }
            })
        });

        $('[name=smsYN],[name=emailYN]').change(function () {
            $(this).parent().toggleClass('active');
        })
    });
</script>