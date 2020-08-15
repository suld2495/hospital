$(function() {
    var isCloseBanner = false;

    $('.header-banner-slider').bxSlider({
        mode: 'fade',
        pager: false
    });

    $('.header-banner-small-slider').bxSlider({
        mode: 'fade',
        pager: false,
        controls: true,
        nextText: '<img src="lib/bxSlider/images/arrow_right01.png">',
        prevText: '<img src="lib/bxSlider/images/arrow_left01.png">',
    });

    $('.header-banner-close').click(function() {
       $('.header-banner-slider-continer .bx-wrapper').slideToggle();
       $('.header-banner-close span').text((isCloseBanner = !isCloseBanner) ? 'OPEN' : 'CLOSE');
    });
});