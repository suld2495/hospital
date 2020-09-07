<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/member/input.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/board/boardWrite.css"/>" />

<div class="sub-contents online-consult-write">
    <h1 class="sub-page-title">온라인 상담</h1>
    <p class="sub-page-intro">ONLINE COUNSELLING</p>

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
        <form class="form" action="<c:url value='/member_complete' />" method="post">
            <div class="max-layout-width">
                <div class="table">
                    <ul>
                        <li class="type-con">
                            <div class="label">
                                <strong>분류</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <select class="short-input">
                                        <option>임플란트</option>
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
                        <li class="pass-con">
                            <div class="label">
                                <strong>비밀번호</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input class="short-input">
                                </div>
                            </div>
                        </li>
                        <li class="contents-con">
                            <div class="label">
                                <strong>내용</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <textarea></textarea>
                                </div>
                            </div>
                        </li>
                        <li class="appendix-con">
                            <div class="label">
                                <strong>파일첨부</strong>
                            </div>
                            <div class="input">
                                <div>
                                    <input>
                                    <button>찾아보기</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="button-box">
                    <div>
                        <button type="submit" class="left-button">상담신청</button>
                        <a href="<c:url value='/online-consult'/>">목록</a>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>