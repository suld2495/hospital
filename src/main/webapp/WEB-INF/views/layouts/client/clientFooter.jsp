<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="footer-info-container">
    <div class="max-layout-width">
        <ul class="display-inline-block">
            <li>
                <h3>진료시간 안내</h3>
                <p>·평일 : AM 09:30 ~ PM 18:30 (화요일은 10시부터)</p>
                <p>·수/금 : AM 09:30 ~ PM 20:00 (야간진료)</p>
                <p>·토요일 : AM 09:30 ~ PM 16:00</p>
                <p>·점심시간 : PM 12:30 ~ PM 14:00 (토요일 12:30~13:30)</p>
                <p class="footer-info-margin">※ 일요일 및 공휴일은 휴진입니다.</p>
            </li>
            <li>
                <h3>층별 안내</h3>
                <p>·2층 : 교정 / 임플란트 / 심미보철 / 일반진료</p>
                <p>·3층 : 임플란트 / 심미보철 / 일반진료</p>
            </li>
            <li class="last-footer-info">
                <h3>정보</h3>
                <p>상호 : 미소원치과 <span class="footer-line"></span> 대표자 : 곽진원</p>
                <p>사업자등록번호 : 690-23-00971</p>
                <p>TEL : <a class="tel text-decoration-none" href="tel:1899-7518">1899-7518</a> <span class="footer-line"></span> FAX : 052-700-7518</p>
                <p>E-MAIL : misowondent@daum.net</p>
                <p class="footer-location">주소 : 울산광역시 남구 화합로 150 / 시외고속버스 터미널맞은편 2,3층</p>
            </li>
        </ul>
        <div class="sns-link text-align-center">
            <ul class="display-inline-block">
                <li class="sns-instagram">
                    <a class="text-decoration-none" href="https://www.instagram.com/misowondent20/" target="_blank">
                        <img src="<c:url value='/images/cmmn/sns_instagram.png' />" alt="인스타그램">
                        <span>인스타그램</span>
                        <img class="sns-arrow" src="<c:url value='/images/cmmn/arrow01.png' />">
                    </a>
                </li>
                <li class="sns-facebook">
                    <a class="text-decoration-none" href="https://www.facebook.com/misowondental/" target="_blank" alt="페이스북">
                        <img src="<c:url value='/images/cmmn/sns_facebook.png' />">
                        <span>페이스북</span>
                        <img class="sns-arrow" src="<c:url value='/images/cmmn/arrow01.png' />">
                    </a>
                </li>
                <li class="sns-blog">
                    <a class="text-decoration-none" href="https://blog.naver.com/misowondent" target="_blank" alt="블로그">
                        <img src="<c:url value='/images/cmmn/sns_blog.png' />">
                        <span>블로그</span>
                        <img class="sns-arrow" src="<c:url value='/images/cmmn/arrow01.png' />">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</section>
<section class="footer">
    <div class="max-layout-width">
        <div class="footer-location-container">
            <p class="footer-copyright">Copyright 2020 Misowon Dental Clinic. All Rights Reserved.</p>
        </div>
        <div class="footer-link">
            <ul>
                <li><a class="text-decoration-none font-15" href="<c:url value='/private-policy' />">개인정보처리방침</a></li>
                <li><a class="text-decoration-none font-15 " href="<c:url value='/terms' />">이용약관</a></li>
                <li><a class="text-decoration-none font-15" href="<c:url value='/video-operations-management-guidelines' />">영상정보처리기기운영관리지침</a></li>
            </ul>
        </div>
    </div>
</section>