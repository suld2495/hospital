$(function() {
    var isCloseBanner = getCookie('banner') === 'true';

    if (isCloseBanner) {
        $('.header-banner-slider').css('display', 'none');
    } else {
        $('.header-banner-slider').bxSlider({
            mode: 'fade',
            pager: false
        });
    }


    $('.header-banner-small-slider').bxSlider({
        mode: 'fade',
        pager: false,
        controls: true,
        nextText: '<img src="lib/bxSlider/images/arrow_right01.png">',
        prevText: '<img src="lib/bxSlider/images/arrow_left01.png">',
    });

    $('.header-banner-close').click(function() {
        $('.header-banner-slider-continer01 .bx-wrapper').slideToggle();
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
