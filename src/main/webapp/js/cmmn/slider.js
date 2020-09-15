$(function() {
    var width = 433.33;
    $('.treatment-case-slider').on('afterChange', function(slick, currentSlide) {
        var index = (currentSlide.slickCurrentSlide()) % 3;
        $('.treatment-case-scroll-bar-drag').css('left',  width * index + 'px');
    });
    $('.treatment-case-slider').on('init', function(slick){
        $('.treatment-case-slider').append($('.treatment-case-slider .slider-prev'));
        $('.treatment-case-slider').append($('.treatment-case-slider .slider-next'));
    });
    $('.treatment-case-slider').slick({
        infinite: true,
        dots: false,
        slidesToShow: 1,
        autoplay: true,
        autoplaySpeed: 4000,
        prevArrow: '<span class="slider-prev"></span>',
        nextArrow: '<span class="slider-next"></span>',
    });
    $('.treatment-case-scroll-bar-drag').draggable({
        containment: ".treatment-case-scroll-bar",
        axis: "x",
        stop: function() {
            var self = this;
            setTimeout(function() {
                var left = Math.round(parseInt($(self).css('left')) / width);
                $('.treatment-case-scroll-bar-drag').css('left',  width * left + 'px');
                $('.treatment-case-slider').slick('slickGoTo', left);
            }, 500);
        }
    });
});