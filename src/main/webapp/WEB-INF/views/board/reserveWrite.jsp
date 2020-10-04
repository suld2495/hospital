<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/boardWrite.css"/>" />

<div class="sub-contents online-consult-write">
    <h1 class="sub-page-title">예약 상담 신청</h1>
    <p class="sub-page-intro">RESERVATION APPLICATION</p>

    <section class="section01">
        <div class="max-layout-width">
            <div class="agreement">
                <div class="service">
                    <h3>개인정보 수집/이용 (필수)</h3>
                    <div></div>
                    <div class="radio-box">
                        <label><input type="radio" name="agree_1" value="ok">개인정보 수집/이용에 동의합니다.</label>
                        <label><input type="radio" name="agree_1" value="no" checked>동의하지 않음</label>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="board-write">
        <form:form class="form" action="${pageContext.servletContext.contextPath}/reserve-write" method="POST" commandName="boardVo" accept-charset="utf-8" enctype="multipart/form-data">
            <div class="max-layout-width">
                <div class="table">
                    <ul>
                        <li class="subject-con">
                            <div class="label">
                                <strong>제목</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="long-input" name="subject">
                                </div>
                            </div>
                        </li>
                        <li class="name-con">
                            <div class="label">
                                <strong>이름</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="long-input" name="writer">
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
                        <li class="contents-con">
                            <div class="label">
                                <strong>내용</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <textarea name="contents"></textarea>
                                </div>
                            </div>
                        </li>
                        <li class="appendix-con">
                            <div class="label">
                                <strong>파일첨부</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <span class="filename"></span>
                                    <input name="file" type="file" class="file display-none">
                                    <button type="button" class="search">찾아보기</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="button-box">
                    <div>
                        <button type="submit" class="left-button">신청하기</button>
                    </div>
                </div>
            </div>
            <input name="phone" value="" type="hidden">
            <input name="email" type="hidden">
        </form:form>
    </section>
</div>

<script>
    $(function () {
        $('.form').submit(function () {
            var agree = $('[name=agree_1]:checked');
            var $subject = $('[name=subject]');
            var $name = $('[name=writer]');
            var $phone = $('[name=phone]');
            var $phone1 = $('[name=phone1]');
            var $phone2 = $('[name=phone2]');
            var $phone3 = $('[name=phone3]');
            var $email = $('[name=email]');
            var $email1 = $('[name=email1]');
            var $email2 = $('[name=email2]');
            var $email3 = $('[name=email3]');
            var $contents = $('[name=contents]');

            if (agree.val() !== 'ok') {
                alert('약관에 동의해 주시기 바랍니다.');
                $(agree).focus();
                return false;
            }

            if (!$subject.val()) {
                alert("제목을 입력해주세요.");
                $subject.focus();
                return false;
            }

            if (!$name.val()) {
                alert("이름을 입력해주세요.");
                $name.focus();
                return false;
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

            if (!$contents.val()) {
                alert("내용을 입력해주세요.");
                $contents.focus();
                return false;
            }

            if ($phone1.val() || $phone2.val() || $phone3.val()) {
                $phone.val($phone1.val() + "-" + $phone2.val() + "-" + $phone3.val());
            }

            if ($email1.val() || $email2.val() || $email3.val()) {
                $email.val($email1.val() + "-" + $email2.val() + "-" + $email3.val());
            }

            alert('등록되었습니다.');
        });

        $('.search').click(function() {
            $('.file').trigger('click');
        });

        $('.file').change(function (e) {
            var $filename = $('.filename');
            var files = e.target.files;

            $filename.text(files[0].name);
        })

        $('[name=smsYN],[name=emailYN]').change(function () {
            $(this).parent().toggleClass('active');
        })

        $('[name=email3]').change(function (e) {
            if ($(this).val() !== '') {
                $('[name=email2]').val($(this).val());
            }
        })
    })
</script>