<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/boardWrite.css"/>" />

<div class="sub-contents online-consult-write">
    <h1 class="sub-page-title">온라인 상담</h1>
    <p class="sub-page-intro">ONLINE COUNSELLING</p>
    <form:form class="form" action="${pageContext.servletContext.contextPath}/online-consult-write" method="POST" commandName="boardVo" accept-charset="utf-8" enctype="multipart/form-data">
        <section class="section01">
            <div class="max-layout-width">
                <div class="agreement">
                    <div class="service">
                        <h3>개인정보 수집/이용 (필수)</h3>
                        <div>
                            ‘미소원치과’는 (이하 ‘의원’은) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
                            <br>본원은 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
                            <br>본원은 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
                            <br><br>
                            ❑ 수집하는 개인정보 항목본원은 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
                            <br>ο 수집항목 : 이름 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일
                            <br>ο 개인정보 수집방법 : 홈페이지(회원가입,상담게시판,고충처리, 온라인예약 등)
                            <br><br>
                            ❑ 개인정보의 수집 및 이용목적본원은 수집한 개인정보를 다음의 목적을 위해 활용합니다..
                            <br>ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공
                            <br>ο 회원 관리회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 불만처리 등 민원처리 , 고지사항 전달
                            <br>ο 마케팅 및 광고에 활용이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
                            <br><br>
                            ❑ 개인정보의 보유 및 이용기간본원은 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
                        </div>
                        <div class="radio-box">
                            <label><input type="radio" name="agree_1" value="ok">개인정보 수집/이용에 동의합니다.</label>
                            <label><input type="radio" name="agree_1" value="no" checked>동의하지 않음</label>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="board-write">

                <div class="max-layout-width">
                    <div class="table">
                        <ul>
                            <li class="type-con">
                                <div class="label">
                                    <strong>분류</strong>
                                </div>
                                <div class="input">
                                    <div>
                                        <select class="short-input" name="consultType">
                                            <option>임플란트</option>
                                            <option>치아교정</option>
                                            <option>충치/치주/신경치료</option>
                                            <option>심미보철치료</option>
                                            <option>사랑니 발치</option>
                                            <option>스케일링</option>
                                        </select>
                                    </div>
                                </div>
                            </li>
                            <li class="subject-con">
                                <div class="label">
                                    <strong>제목</strong>
                                </div>
                                <div class="input">
                                    <div>
                                        <input class="long-input" name="subject" value="${boardVo.subject}" maxlength="200">
                                    </div>
                                </div>
                            </li>
                            <li class="name-con">
                                <div class="label">
                                    <strong>이름</strong>
                                </div>
                                <div class="input">
                                    <div>
                                        <input class="long-input" name="writer" value="${boardVo.writer}" maxlength="50">
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
                                            <input name="phone1" value="${boardVo.phone1}">
                                        </span>
                                            <span>
                                            <input name="phone2" value="${boardVo.phone2}">
                                        </span>
                                            <span>
                                            <input name="phone3" value="${boardVo.phone3}">
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
                                            <input name="email1" value="${boardVo.email1}">
                                        </span>
                                            <span class="mail">
                                            <input name="email2" value="${boardVo.email2}">
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
                            <li class="pass-con">
                                <div class="label">
                                    <strong>비밀번호</strong>
                                </div>
                                <div class="input">
                                    <div>
                                        <input class="short-input" name="password" type="password">
                                    </div>
                                </div>
                            </li>
                            <li class="contents-con">
                                <div class="label">
                                    <strong>내용</strong>
                                </div>
                                <div class="input">
                                    <div>
                                        <textarea name="contents" value="${boardVo.contents}"></textarea>
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
                            <button type="submit" class="left-button">상담신청</button>
                            <a href="<c:url value='/online-consult/1'/>">목록</a>
                        </div>
                    </div>
                </div>
        </section>
        <input name="phone" value="" type="hidden">
        <input name="email" type="hidden">
    </form:form>
</div>

<script>
    $(function () {
        $('.form').submit(function () {
            var agree = this.agree_1;
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
            var $password = $('[name=password]');
            var $contents = $('[name=contents]');

            if (agree.value !== 'ok') {
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

            if (!$password.val()) {
                alert("비밀번호를 입력해주세요.");
                $password.focus();
                return false;
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