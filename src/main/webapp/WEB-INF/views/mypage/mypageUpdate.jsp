<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/mypage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/mypage/mypageUpdate.css"/>" />

<div class="sub-contents mypage-reservation">
    <h1 class="sub-page-title">마이페이지</h1>
    <p class="sub-page-intro">MYPAGE</p>

    <div class="max-layout-width">
        <div class="tab">
            <ul>
                <li><a href="<c:url value='/mypage_reservation' />">예약내역</a></li>
                <li><a href="<c:url value='/mypage_consult' />">온라인 상담</a></li>
                <li class="active"><a href="<c:url value='/mypage_update' />">회원정보수정</a></li>
            </ul>
        </div>

        <form class="form" action="<c:url value='/member_kakao' />" method="PUT">
            <div class="max-layout-width">
                <div class="table">
                    <ul>
                        <li class="name-con">
                            <div class="label">
                                <strong>이름</strong>
                            </div>
                            <div class="input">
                                <div class="text">
                                    홍길동
                                </div>
                            </div>
                        </li>
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
                        <li class="pass-con add-text">
                            <div class="label">
                                <strong>비밀번호</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="long-input">
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
                                    <input class="long-input">
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
                                    <input class="long-input">
                                    <p>비밀번호를 다시 입력해 주세요</p>
                                </div>
                            </div>
                        </li>
                        <li class="birth-con">
                            <div class="label">
                                <strong>생년월일</strong>
                            </div>
                            <div class="input">
                                <div class="text">
                                    102121
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
                                    <span class="mobile">모바일 중복확인</span>
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
                    <button type="submit" class="active">회원정보 수정</button>
                    <button type="reset">취소</button>
                    <a href="<c:url value='/membership_widthdrawal'/>">회원탈퇴</a>
                </div>
            </div>
        </form>
    </div>
</div>