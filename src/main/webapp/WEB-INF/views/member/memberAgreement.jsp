<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/member/member.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/member/memberAgreement.css"/>" />


<div class="sub-contents member-agreement">
    <h1 class="sub-page-title">회원가입</h1>
    <p class="sub-page-intro">JOIN</p>

    <form class="form" action="<c:url value='/member_input' />" method="post">
        <div class="max-layout-width">
            <div class="tab">
                <ul>
                    <li class="active">
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
                <a href="<c:url value='/' /> " class="right-button">취소</a>
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