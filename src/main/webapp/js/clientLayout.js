$(function() {
    var isCloseBanner = getCookie('banner') === 'true';

    if (isCloseBanner) {
        $('.header-banner-slider-continer01').css('display', 'none');
    } else {
        $('.header-banner-slider').bxSlider({
            mode: 'fade',
            auto: true,
            controls: false,
            onSlideBefore: function($slideElement, oldIndex, newIndex) {
                $('.header-banner-slider-continer01').removeClass('active1')
                $('.header-banner-slider-continer01').removeClass('active2')
                $('.header-banner-slider-continer01').removeClass('active3')
                $('.header-banner-slider-continer01').removeClass('active4')
                $('.header-banner-slider-continer01').addClass('active' + (newIndex + 1));
            }
        });
    }

    $('.banner-close-box').click(function() {
        $('.header-banner-slider-continer01').slideToggle();
        isCloseBanner = !isCloseBanner;
        setCookie('banner', isCloseBanner, 10);
    });
});

var setCookie = function(name, value, exp) {
    var date = new Date();
    date.setTime(date.getTime() + exp*24*60*60*1000);
    document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};

var getCookie = function(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
};
