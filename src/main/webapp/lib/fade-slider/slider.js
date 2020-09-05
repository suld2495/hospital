/*left-fade-slider-container*/
$(function() {
    if (!$('.post-slider').length) return;

    $('.post-slider .posts .slides .slide').clone().appendTo('.post-slider .posts .slides');
    $('.post-slider .posts .slides .slide').clone().appendTo('.post-slider .posts .slides');

    $('.post-slider .posts .slides .slide').each(function(index){
        var delay = index * 200 + 500;
        $('.post-item', this).addClass('anim fade-in-right delay-' + delay);
    });

    var $firstSlide = $('.post-slider .posts .slides .slide:first-child');
    var isTransition = false;
    var isMoving = false;
    var speed = 700;
    var slideHeight = $firstSlide.height();
    var slideWidth = $firstSlide.width();

    var mc = new Hammer($('.post-slider .posts .slides')[0]);
    mc.get('swipe').set({ direction: Hammer.DIRECTION_HORIZONTAL });
    mc.get('pan').set({ direction: Hammer.DIRECTION_HORIZONTAL });

    mc.on("panstart panleft panright panend pancancel panmove", function(e) {

        if ( isMoving ) return;

        isTransition = true;
        var threshold = slideWidth * .35;
        if ( e.type == 'panstart') {
            $('.post-slider .posts .slides').addClass('is-transition');
        }
        else if ( e.type == 'panend' || e.type == 'pancancel') {
            if ( Math.abs(e.deltaX) > threshold * .9) {
                var deltaX = e.deltaX;
                deltaX = Math.min(Math.abs(deltaX), threshold);
                deltaX *= (e.deltaX > 0)  ? 1 : -1 ;
                if (deltaX < 0) {
                    go('next', deltaX);
                } else {
                    go('prev', deltaX);
                }
            } else {
                $('.post-slider .posts .slides').stop().animate({'left': 0}, speed * .5, 'easeInOutQuad', function(){
                    isTransition = false;
                    $('.post-slider .posts .slides').removeClass('is-transition');
                    $(this).parents('.post-slider').prev().find('.current').text($('.slides .slide').eq(0).data('index'));
                });
            }
        }
        else if (e.type == 'panmove') {
            var deltaX = e.deltaX;
            deltaX = Math.min(Math.abs(deltaX), threshold);
            deltaX *= (e.deltaX > 0)  ? 1 : -1 ;
            $('.post-slider .posts .slides').css('left', deltaX);
        }
    });




    function goPrev() {
        if ( isTransition ) return;
        go('prev');
    }

    function goNext() {
        if ( isTransition ) return;
        go('next');
    }

    function go(dir, start) {
        start = ( start ) ? start : 0 ;
        isTransition = true;
        isMoving = true;
        $('.post-slider .posts .slides').addClass('is-transition');
        check();

        var fromX = (dir == 'prev') ? -slideWidth+start : start;
        var toX = (dir == 'prev') ? 0 : -slideWidth;

        $('.post-slider .posts .slides').css({'left':fromX});

        if (dir == 'prev') {
            $('.post-slider .posts .slides .slide:last-child').remove().prependTo('.post-slider .posts .slides').stop().css('opacity', 0).animate({'opacity': 1}, speed * .9);
        } else {
            $('.post-slider .posts .slides .slide:first-child').stop().css('opacity', 1).animate({'opacity': 0}, speed * .9);
        }

        $('.post-slider .posts .slides').stop().animate({'left': toX}, speed, 'easeOutSine', function(){
            isTransition = false;
            isMoving = false;
            $('.post-slider .posts .slides').removeClass('is-transition');
            if ( dir == 'next') {
                $(this).stop().css({'left':0});
                $(this).find('.slide:first-child').appendTo('.post-slider .posts .slides').css('opacity', 1);
                $(this).parents('.post-slider').prev().find('.current').text($('.slides .slide').eq(0).data('index'));
            }
        });
    }

    $(window).on('resize', function(){
        check();
    }).trigger('resize');

    function check() {
        slideHeight = $firstSlide.innerHeight();
        slideWidth = $firstSlide.innerWidth();
        $('.post-slider .posts').css('height', slideHeight);
    }

    setInterval(function () {
        goNext();
    }, 4000);
});

/*fade-in-slider*/
$(function() {
    if (!$('.fade-in-slider .swiper-container').length) return;

    var width = $('.scroll-bar').width() / $('.fade-in-slider .swiper-slide').length; //131.142;
    $('.fade-in-slider .scroll-bar-drag').width(width);
    $('.fade-in-slider .swiper-container').on('afterChange', function(slick, currentSlide) {
        var index = (currentSlide.slickCurrentSlide()) % 7;
        $('.scroll-bar-drag').css('left',  width * index + 'px');
    });
    $('.fade-in-slider .swiper-container').slick({
        infinite: true,
        dots: false,
        arrows: false,
        slidesToShow: 1,
        fade: true,
        autoplay: true,
        autoplaySpeed: 4000,
    });

    $('.scroll-bar-drag').draggable({
        containment: ".scroll-bar",
        axis: "x",
        stop: function() {
            var self = this;
            setTimeout(function() {
                var left = Math.round(parseInt($(self).css('left')) / width);
                $('.scroll-bar-drag').css('left',  width * left + 'px');
                $('.swiper-container').slick('slickGoTo', left);
            }, 500);
        }
    });
})