<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/membershipWidthdrawal.css"/>" />

<div class="sub-contents membership-withdrawal">
    <h1 class="sub-page-title">회원탈퇴</h1>
    <p class="sub-page-intro">MEMBERSHIP WITHDRAWAL</p>

    <div class="max-layout-width">
        <form method="POST" action="membership_widthdrawal" class="form">
            <div class="complete">
                <h2 class="section-title">
                    회원탈퇴 전 <strong><span class="section-title-color">유의사항</span></strong>을 확인해 주시기 바랍니다.</h2>
                </h2>
                <p class="section-text">
                    회원탈퇴시 사이트 회원정보에 회원님의 개인정보는 모두 삭제됩니다.
                </p>
                <p class="section-text">
                    회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며,회원탈퇴 진행 시 해당 아이디는 영구적으로 삭제되어 재가입이 불가합니다.
                </p>
                <p class="section-text">
                    거래 정보가 있는 경우,전자상거래 등에서의 소비자 보호에 관한 법률에 따라 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.
                </p>
                <p class="section-text">
                    입력하신 게시판문의 및 기타입력정보는 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능합니다.<br>
                    게시판문의 및 후기,댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.
                </p>

                <div class="check">
                    <label>
                        <input name="agree" value="Y" class="display-none">
                        상기 회원 탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.
                    </label>
                </div>

                <div class="table">
                    <ul>
                        <li class="id-con">
                            <div class="label">
                                <strong>아이디</strong>
                            </div>
                            <div class="input">
                                <div class="text">
                                    홍길동
                                </div>
                            </div>
                        </li>
                        <li class="pass-con">
                            <div class="label">
                                <strong>비밀번호</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="long-input pass" name="pass">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <p class="fianl-text">
                본인확인을 위해 비밀번호를 다시 한번 확인합니다.<br>
                본인확인 후 최종 회원탈퇴가 가능합니다.
            </p>
            <div class="button-box">
                <button type="submit">회원탈퇴</button>
                <button type="reset">취소</button>
            </div>
        </form>
    </div>
</div>

<script>
    $(function() {
        $('.form').submit(function() {
            var $agree = $('[name=agree]');
            var $pass = $('.pass');

            if (!$agree.prop('checked')) {
                alert('약관에 동의해 주시기 바랍니다.');
                return false;
            }

            if ($pass.get(0).value === '') {
                alert('비밀번호를 입력해 주시기 바랍니다.');
                return false;
            }
        });

        $('.check label').click(function(e) {
            var $input = $('[name=agree]');;
            $input.prop('checked', !$input.prop('checked'));
            e.stopPropagation();
            e.preventDefault();
        });
    })
</script>