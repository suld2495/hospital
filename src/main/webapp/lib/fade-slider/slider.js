/*left-fade-slider-container*/

/*fade-in-slider*/
$(function() {
    if (!$('.fade-in-slider .swiper-container').length) return;

    var windowWidth = $(window).width();
    if (windowWidth < 938) {
        $('.scroll-bar').width(windowWidth - 60);
    }

    var width = $('.scroll-bar').width() / $('.fade-in-slider .swiper-slide').length; //131.142;
    $('.fade-in-slider .scroll-bar-drag').width(width);
    $('.fade-in-slider .swiper-container').on('afterChange', function(slick, currentSlide) {
        var index = (currentSlide.slickCurrentSlide()) % 7;
        $('.scroll-bar-drag').css('left',  width * index + 'px');
    });
    $('.fade-in-slider .swiper-container').slick({
        infinite: true,
        dots: false,
        prevArrow: '<span class="slider-prev"><</span>',
        nextArrow: '<span class="slider-next">></span>',
        slidesToShow: 1,
        fade: true,
        autoplay: true,
        autoplaySpeed: 2000,
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