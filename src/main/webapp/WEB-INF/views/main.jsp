<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/lib/wow/animate.css' />">
<link rel="stylesheet" href="<c:url value='/lib/slick/css/slick.min.css' />">
<link rel="stylesheet" href="<c:url value='/lib/slick/css/slick.theme.css' />">
<link rel="stylesheet" href="<c:url value="/css/main.css"/>" />

<div>
    <div class="section01">
        <div class="section01-slider">
            <div>
                <img class="full-layout-width" src="<c:url value='/images/main/img_main01.jpg' />" alt="미소원치과는 자신있습니다!">
            </div>
            <div>
                <img class="full-layout-width" src="<c:url value='/images/main/img_main01.jpg' />" alt="미소원치과는 자신있습니다!">
            </div>
            <div>
                <img class="full-layout-width" src="<c:url value='/images/main/img_main01.jpg' />" alt="미소원치과는 자신있습니다!">
            </div>
        </div>
    </div>
    <div class="section02 position-relative max-layout-width wow fadeInUp">
        <h2>디지털치과의 현재 <span class="section-title-color"><strong>미소원치과</strong></span></h2>
        <p>3D CT, CEREC SYSTEM, 최상의 장비를 바탕으로 개인의 상태에 꼭 맞는 맞춤진료를 합니다 </p>
        <div class="display-inline-block">
            <ul>
                <li>
                   <img src="<c:url value='/images/main/point_img01.jpg'/>">
                    <div class="nomal">
                        <h3>디지털 임플란트</h3>
                    </div>
                    <div class="hover">
                        <h3>디지털 임플란트</h3>
                        <p>
                            모의 식립계획으로<br>
                            정교하고 정확하게 자연치아인듯<br>
                            편안하고 안전한 임플란트
                        </p>
                    </div>
                </li>
                <li>
                    <img src="<c:url value='/images/main/point_img02.jpg'/>">
                    <div class="nomal">
                        <h3>디지털 치아교정</h3>
                    </div>
                    <div class="hover">
                        <h3>디지털 치아교정</h3>
                        <p>
                            3D CT를 활용한 정확한 진단으로<br>
                            수설없이 아름다운 라인을<br>
                            만들어주는 교정
                        </p>
                    </div>
                </li>
                <li>
                    <img src="<c:url value='/images/main/point_img03.jpg'/>">
                    <div class="nomal">
                        <h3>자연치아 클리닉</h3>
                    </div>
                    <div class="hover last">
                        <h3>자연치아 클리닉</h3>
                        <p>
                            CEREC SYSTEM을 활용한<br>
                            빠르고 정확한 치료
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="section03 position-relative wow fadeInUp" data-wow-delay="500ms">
        <div class="main-bg"></div>
        <div class="max-layout-width">
            <div class="text">
                <h4>앞선 디지털 장비와 기술에</h4>
                <h4><span><strong>마음을 담은 양심적인 진료</strong></span>를</h4>
                <h4>약속합니다</h4>
                <p>진보된 디지털 기술에 따뜻한 마음을 담아 최상의 치료를 경험할 수 있는</p>
                <p>진료환경을 제공합니다.</p>
                <ul class="display-inline-block">
                    <li>
                        <span class="img01"></span>
                        <span class="text">철저한 멸균</span>
                    </li>
                    <li>
                        <span class="img02"></span>
                        <span class="text">전문성</span>
                    </li>
                    <li>
                        <span class="img03"></span>
                        <span class="text">디지털 치과</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="bg"></div>
    </div>
    <div class="section04 wow fadeInUp" data-wow-delay="500ms">
        <div class="text max-layout-width position-relative">
            <h4>늘 후회없는 선택을 하는 당신</h4>
            <h4><span><strong>미소원치과는 완벽한 선택</strong></span>입니다</h4>
            <p>다녀가신 환자분들의 후기로 현재의 미소원치과를 만나보세요</p>
            <span class="details-link pointer"><a href="<c:url value='/review/1'/>">자세히보기</a></span>
        </div>
        <div class="max-layout-width">
            <div class="review">
                <c:forEach begin="0" end="4" varStatus="status">
                    <div class="module">
                        <a class="module" href="<c:url value='/'/>">
                            <img src="<c:url value='/images/main/review0${status.count % 4 + 1}.jpg' />">
                            <div class="position-relative">
                                <div class="review-text">
                                    <h4>임플란트</h4>
                                    <p>의사선생님께서는 친절 하시고 걱정했던 임플란트</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="section05 wow fadeInUp" data-wow-delay="500ms">
        <div>
            <div class="max-layout-width">
                <h2 class="section-title">
                    정직하게 진료하고<br>
                    <span class="section-title-color"><strong>연구하는 의료진</strong></span>
                </h2>
                <p class="section-text">
                    미소원치과의 의료진은 끊임없이 연구하며 환자를 최우선으로 생각하고 언제나 최선의 결과로 보답합니다.
                </p>
                <div class="img-arrow"></div>
                <div class="slider-container">
                    <div></div>
                    <div class="big-img big-img-slider">
                        <div class="cont01 cont">
                            <div class="doctor-slide-item">
                                <div class="img"></div>
                                <div class="text">
                                    <div class="title">
                                        <span>이상수</span>
                                        <span>원장</span>
                                    </div>
                                    <p class="sub-text">
                                        첨단장비를 사용하여 꼼꼼하고 정확하게,<br>
                                        원칙을 지키는 진료를 우선합니다.
                                    </p>
                                    <h5>약력</h5>
                                    <p class="dc">
                                        통합치의학 전문의<br/>
                                        부산대학교 치의학전문대학원 졸업<br/>
                                        서울아산재단 울산대학교병원 치과통합 전문임상의 수료<br/>
                                        대한 구강악안면임플란트학회 정회원<br/>
                                        대한 통합치과학회 정회원<br/>
                                        대한 치과마과학회 정회원<br/>
                                        KIM'S 교정연구회 정회원<br/>
                                        전) 울산 한빛치과 원장<br/>
                                        전) 부산 e웰니스치과 원장<br/>
                                        전) 부산 수정치과 원장<br/>
                                        MEAW Orthodontic Master Course 수료<br/>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="cont02 cont">
                            <div class="doctor-slide-item">
                                <div class="img"></div>
                                <div class="text">
                                    <div class="title">
                                        <span>곽진원</span>
                                        <span>원장</span>
                                    </div>
                                    <p class="sub-text">
                                        섬세한 진료로 마음 편안하게,<br>
                                        환자와의 신뢰가 먼저입니다.
                                    </p>
                                    <h5>약력</h5>
                                    <p class="dc">
                                        치의학 박사 / 전문의<br/>
                                        부산대학교 치과대학 졸업<br/>
                                        부산대학교 치의학대학원 석사<br/>
                                        부산대학교 치의학대학원 박사<br/>
                                        통합치의학과 전문의 취득<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 치과보철학회 정회원<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 구강악안면임플란트학회 정회원<br/>
                                        대한통합치과학회 정회원<br/>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="cont03 cont">
                            <div class="doctor-slide-item">
                                <div class="img"></div>
                                <div class="text">
                                    <div class="title">
                                        <span>송애진</span>
                                        <span>원장</span>
                                    </div>
                                    <p class="sub-text">
                                        얼굴과 조화를 이루는 균형잡힌 교정!<br>
                                        아름답고 당당한 미소를 찾아드립니다.
                                    </p>
                                    <h5>약력</h5>
                                    <p class="dc">
                                        치의학 박사 / 전문의<br/>
                                        부산대학교 치과대학 졸업<br/>
                                        부산대학교 치의학대학원 석사<br/>
                                        부산대학교 치의학대학원 박사<br/>
                                        통합치의학과 전문의 취득<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 치과보철학회 정회원<br/>
                                        대한 치과마취과학회 정회원<br/>
                                        대한 구강악안면임플란트학회 정회원<br/>
                                        대한통합치과학회 정회원<br/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="doctor-slider">
                        <div><div class="img-box"><div class="img01 doctor-slide-item"></div></div></div>
                        <div><div class="img-box"><div class="img02 doctor-slide-item"></div></div></div>
                        <div><div class="img-box"><div class="img03 doctor-slide-item"></div></div></div>
                    </div>
                </div>
            </div>
            <div class="bg"></div>
        </div>
    </div>
    <div class="section06 wow fadeInUp" data-wow-delay="500ms">
        <div>
            <h4>소중한 당신의 치아 <span>믿고 맡길 수 있도록</span></h4>
            <div class="main-slider">
                <div>
                    <img src="<c:url value='/images/main/case01.jpg' />">
                    <h5>임플란트</h5>
                    <p>임플란트 치료 전/후 사진입니다.</p>
                </div>
                <div>
                    <img src="<c:url value='/images/main/case02.jpg' />">
                    <h5>디지털 치아교정</h5>
                    <p>디지털 치아교정 치료 전/후 사진입니다.</p>
                </div>
                <div>
                    <img src="<c:url value='/images/main/case03.jpg' />">
                    <h5>임플란트</h5>
                    <p>자연치아 클리닉 치료 전/후 사진입니다.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section07 wow fadeInUp" data-wow-delay="500ms">
        <div class="max-layout-width">
            <h4>편안하고 정확한 <span>디지털 치과에서의 경험</span></h4>
            <h4>이제, 당신 차례입니다</h4>
        </div>
        <div class="slider-box max-layout-width">
            <div class="slider-origin-pagination">
                <ul>
                    <li class="active"></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
            <div class="slider-pagenation">
                <div class="bx-pager-item">
                    <a href="" data-slide-index="0" class="bx-pager-link text-decoration-none">
                        <span>01</span>
                        <span>개개인에 맞춘 치료계획수립</span>
                    </a>
                </div><br>
                <div class="bx-pager-item">
                    <a href="" data-slide-index="1" class="bx-pager-link text-decoration-none">
                        <span>02</span>
                        <span>더 확실한 진단 더 편안한 진단</span>
                    </a>
                </div><br>
                <div class="bx-pager-item">
                    <a href="" data-slide-index="2" class="bx-pager-link text-decoration-none">
                        <span>03</span>
                        <span>건물내 상주 협력 기공소</span>
                    </a>
                </div>
            </div>
            <div class="slider float-left">
                <div>
                    <div class="module slide-box">
                        <div class="module">
                            <img src="<c:url value='/images/main/characteristics01.jpg' /> " class="pointer">
                        </div>
                    </div>
                    <h5>개개인에 맞춘 치료계획수립</h5>
                    <p>과학적 진단을 통해, 개별 맞춤형 치료계획을 수립하여 정확하게 치료합니다.</p>
                </div>
                <div>
                    <div class="module slide-box">
                        <div class="module">
                            <img src="<c:url value='/images/main/characteristics02.jpg' /> " class="pointer">
                        </div>
                    </div>
                    <h5>더 확실한 진단, 더 편안한 진단</h5>
                    <p>3D 광학스캐너를 통해 본뜨는 과정은 더 정교하고 더 편안합니다.</p>
                </div>
                <div>
                    <div class="module slide-box">
                        <div class="module">
                            <img src="<c:url value='/images/main/characteristics03.jpg' /> " class="pointer">
                        </div>
                    </div>
                    <h5>건물 내 상주 협력기공소</h5>
                    <p>첨단장비와 남다른 기술력으로 시간과 비용절감에 효과적입니다.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section08 max-layout-width wow fadeInUp" data-wow-delay="500ms">
        <div class="display-inline-block">
            <div class="consultant">
                <h4>
                    온라인 상담
                    <span><a href="<c:url value='/online-consult/1' /> ">VIEW MORE</a></span>
                </h4>
                <ul>
                    <li>
                        <div>
                            <p class="board-contents">임플란트 상담문의합니다.</p>
                            <span class="writer">김민재</span>
                            <span class="reply">답변완료</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p class="board-contents">부분교정 문의합니다.</p>
                            <span class="writer">서이수</span>
                            <span class="reply">답변완료</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p class="board-contents">치아미백 주의사항 문의합니다.</p>
                            <span class="writer">김지민</span>
                            <span class="reply">답변완료</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p class="board-contents">부정교합 교정 문의합니다.</p>
                            <span class="writer">오병관</span>
                            <span class="reply">답변완료</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p class="board-contents">부정교합 교정 문의합니다.</p>
                            <span class="writer">오병관</span>
                            <span class="reply">답변완료</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="media">
                <h4>
                    미디어
                    <span><a href="<c:url value='/media/1' /> ">VIEW MORE</a></span>
                </h4>
                <ul>
                    <li>
                        <div class="media-thumnail" style="background:url(<c:url value='/images/main/media01.jpg' />)"></div>
                        <div class="media-contents">
                            <h5 class="media-title">
                                코로나19 감염예방
                            </h5>
                            <p>코로나19의 감염예방을 위해 1층에서 내원객의 체온측정과</p>
                        </div>
                    </li>
                    <li>
                        <div class="media-thumnail" style="background:url(<c:url value='/images/main/media02.jpg' />)"></div>
                        <div class="media-contents">
                            <h5 class="media-title">
                                코로나19 감염예방
                            </h5>
                            <p>코로나19의 감염예방을 위해 1층에서 내원객의 체온측정과</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="section09 wow fadeInUp" data-wow-delay="500ms">
        <div class="max-layout-width">
            <h4>미소원치과 <strong>미리보기</strong></h4>
            <p>따듯한 공간에서 편안하게 진료받으세요.</p>
            <div class="tour-slide">
                <c:forEach begin="1" end="10" varStatus="status">
                    <div class="slide-item">
                        <img src="<c:url value='/images/main/interior${status.count}.jpg' /> ">
                    </div>
                </c:forEach>
            </div>
            <div class="count">
                <div class="count-box">
                    <span class="current-count">01</span>
                    <span class="max-count">10</span>
                </div>
            </div>
            <div class="slide-text">
                <a class="text-decoration-none" href="<c:url value='/tour' />">
                    <p>실내사진 자세히보기</p>
                </a>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/lib/wow/wow.js" />"></script>
<script src="<c:url value="/lib/slick/js/slick.min.js" />"></script>
<script>
    $(function() {
        new WOW().init();

        $('.img-box li').mouseenter(function() {
            var index = $(this).index();
            $('.contents-text').removeClass('active');
            $('.contents-text' + (index + 1)).addClass('active');
        });

        $('.review').bxSlider({
            pager: false,
            minSlides: 4,
            maxSlides: 4,
            moveSlides: 1,
            slideWidth: 318,
            shrinkItems: true,
            slideMargin: 10,
            auto: true,
            nextText: '<img src="<c:url value="/images/main/arrow_right02.png"/>">',
            prevText: '<img src="<c:url value="/images/main/arrow_left02.png"/>">',
        });

        $('.main-slider').bxSlider({
            pager: false,
            minSlides: 3,
            maxSlides: 3,
            moveSlides: 1,
            slideWidth: 530,
            shrinkItems: true,
            slideMargin: 36,
            nextText: '<img src="<c:url value="/images/main/arrow_right02.png"/>">',
            prevText: '<img src="<c:url value="/images/main/arrow_left02.png"/>">',
            auto: true,
        });

        var slider = $('.slider').bxSlider({
            minSlides: 2,
            maxSlides: 2,
            moveSlides: 1,
            slideWidth: 718,
            shrinkItems: true,
            slideMargin: 40,
            pagerCustom: $('.slider-pagenation'),
            nextText: '<img src="<c:url value="/images/main/right02.png"/>">',
            prevText: '<img src="<c:url value="/images/main/left02.png"/>">',
            auto: true,
            onSliderLoad: function() {
                $('.slider-box').append($('.section07 .bx-controls'));
            },
            onSlideBefore: function ($slideElement, oldIndex, newIndex) {
                $('.section07 .slider-origin-pagination li').removeClass('active');
                $('.section07 .slider-origin-pagination li').eq(newIndex).addClass('active');
            }
        });

        $('.section07 .slider-origin-pagination li').click(function () {
            var index = $(this).index();
            slider.goToSlide(index);
        })

        $('.tour-slide').bxSlider({
            controls: false,
            pager: false,
            auto: true,
            onSlideAfter: function($slideElement, oldIndex, newIndex) {
                $('.current-count').text(numberPad(newIndex + 1, 2));
            }
        })

        let windoWidth = $(window).width();
        $('.slider-container').width(windoWidth);
        $('.doctor-slider .img-box').width(windoWidth * 0.1614);
        $('.big-img-slider').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.doctor-slider',
        });

        $('.doctor-slider').on('init', function(slick){
            $('.section05 .img-arrow').append($('.section05 .slider-prev'));
            $('.section05 .img-arrow').append($('.section05 .slider-next'));
        });
        $('.doctor-slider').slick({
            infinite: true,
            slidesToShow: 2,
            slidesToScroll: 1,
            asNavFor: '.big-img-slider',
            dots: false,
            focusOnSelect: true,
            variableWidth: true,
            autoplay: true,
            autoplaySpeed: 4000,
            arrow: true,
            prevArrow: '<span class="slider-prev"><</span>',
            nextArrow: '<span class="slider-next">></span>',
            responsive: [
                {
                    breakpoint: 1540,
                    settings: {
                        slidesToShow: 1,
                    }
                },
            ]
        });

        $('.section01-slider').bxSlider({
            pager: false,
            auto: true,
        })
    });

    $(window).load(function () {
        var width = $('.section05 .bx-wrapper').width() + $('.section05 .big-img').width()
            + parseInt($('.section05 .bx-wrapper').css('margin-right')) + parseInt($('.section05 .big-img').css('margin-right'));
        $('.section05 .slider-container').width(width);
        $('.section05 .slider-container').width(width);
    })
</script>