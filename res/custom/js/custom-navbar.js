$(document).ready(function () {


    $(document).scroll(function () {
        var st = $(this).scrollTop();
        if (st > 70) {
            $('.mynav').addClass('navScolled');
        } else {
            $('.mynav').removeClass('navScolled');
        }
    });
    //This is the nav-bar icon click event registration
    // -------------------------------------------------------------------------------
    $('.mynav .mynav-btn').click(function () {
        if ($(window).width() <= 576) {

            if ($(this).siblings('.mynav-links').css('right') === '0px') {
                $(this).siblings('.mynav-links').css({'right': '-76%', 'transition': '.5s'});
            } else {
                $(this).siblings('.mynav-links').css({'right': '0px', 'transition': '.5s'});
            }

        } else {

            if ($(this).siblings('.mynav-links').css('right') === '0px') {
                $(this).siblings('.mynav-links').css({'right': '-70%', 'transition': '.5s'});
            } else {
                $(this).siblings('.mynav-links').css({'right': '0px', 'transition': '.5s'});
            }

        }

    });
    if ($(window).width() > 768) {
        doOnLarge();
    }
//does this in a smaller screen. Responsive Css.
// -------------------------------------------------------------------------------
    else {
        doOnSmall();
    }
    $(window).on('resize', function () {
//on a large screen
        if ($(window).width() > 768) {
            doOnLarge();
        }
//does this in a smaller screen. Responsive Css.
// -------------------------------------------------------------------------------
        else {
            doOnSmall();
            if ($(window).width() <= 576) {
                $('.mynav-links').css({'width': '76%', 'right': '-76%'});
            }
        }
    });
});
function doOnLarge() {
    $('.mynav-links').css('width', '70%');
    $('.mynav-links .menu-options').css({'opacity': '0', 'height': 'auto', 'display': 'none'});
    $('.mynav-links .menu-options').css({'transition': '0.5s'});
    $('.mynav-links .menu-options-multiple').css({'opacity': '0', 'height': 'auto', 'display': 'none'});
    $('.mynav-links .menu-options-multiple').css({'transition': '0.5s'});
    // This happens on the navbar menu option hover
    // -------------------------------------------------------------------------------
    $('.mynav-links li').mouseenter(function () {
        $(this).children('.custom-menu-option').css({'display': 'block'}).wait(10).css({'opacity': '1', 'z-index': '5'});
        $(this).children('.mynav-link').css({'border-top-color': '#fff', 'color': '#ee9600'});
    });
    $('.mynav-links li').mouseleave(function () {
        $(this).children('.custom-menu-option').css({'opacity': '0', 'z-index': '1'}).wait(500).css('display', 'none');
        $(this).children('.mynav-link').css({'border-top-color': 'transparent'});
    });

    // -------------------------------------------------------------------------------
}

function doOnSmall() {
    $('.mynav-links').css({'right': '-70%', 'transition': '0s', 'width': '70%'});
    if ($(window).width() <= 576) {
        $('.mynav-links').css({'width': '76%', 'right': '-76%', 'transition': '0s'});
    }

    $('.mynav-links .menu-options').css({'opacity': '1', 'transition': '0s', 'height': '0', 'display': 'block'});
    $('.mynav-links .menu-options-multiple').css({'opacity': '1', 'transition': '0s', 'height': '0', 'display': 'block'});
    $('#linksA').click(function (event) {
        event.preventDefault();
        if ($(window).width() > 768) {

        } else {
            if ($('.menu-options-multiple').height() > 50) {
                $(this).children('.mynav-caret').css({'transition': '.5s', 'transform': 'rotateZ(0Deg)'});
                $('.menu-options-multiple').css({'height': '0', 'opacity': '1', 'transition': '.5s'});
            } else {
                $(this).children('.mynav-caret').css({'transition': '.5s', 'transform': 'rotateZ(180Deg)'});
                $('.menu-options-multiple').css({'height': '664px', 'opacity': '1', 'transition': '.5s'});
            }
        }
    });
    $('#linksA').mouseleave(function () {
        $('.mynav .menu-options-multiple').css({'opacity': '1', 'display': 'block'});
        $(this).css({'border-top-color': 'transparent'});
    });
    $('.menu-options-multiple').mouseleave(function () {
        $('.mynav .menu-options-multiple').css({'opacity': '1', 'display': 'block'});
        $('#linksA').css({'border-top-color': 'transparent'});
    });
    $('#linksB').click(function (event) {
        event.preventDefault();
        if ($(window).width() > 768) {

        } else {
            if ($(this).siblings('.menu-options').height() > 50) {
                $(this).children('.mynav-caret').css({'transition': '.5s', 'transform': 'rotateZ(0Deg)'});
                $(this).siblings('.menu-options').css({'height': '0', 'opacity': '1', 'transition': '.5s'});
            } else {
                $(this).children('.mynav-caret').css({'transition': '.5s', 'transform': 'rotateZ(180Deg)'});
                $(this).siblings('.menu-options').css({'height': '250px', 'opacity': '1', 'transition': '.5s'});
            }
        }
    });
    $('#linksB').mouseleave(function () {
        $('#linksB').siblings('.menu-options').css({'opacity': '1', 'display': 'block'});
        $(this).css({'border-top-color': 'transparent'});
    });
    $('#linksB').siblings('.menu-options').mouseleave(function () {
        $(this).css({'opacity': '1', 'display': 'block'});
        $('#linksB').css({'border-top-color': 'transparent'});
    });
    $('#linksC').click(function (event) {
        event.preventDefault();
        if ($(window).width() > 768) {


        } else {
            if ($(this).siblings('.menu-options').height() > 50) {
                $(this).children('.mynav-caret').css({'transition': '.5s', 'transform': 'rotateZ(0Deg)'});
                $(this).siblings('.menu-options').css({'height': '0', 'opacity': '1', 'transition': '.5s'});
            } else {
                $(this).children('.mynav-caret').css({'transition': '.5s', 'transform': 'rotateZ(180Deg)'});
                $(this).siblings('.menu-options').css({'height': '125px', 'opacity': '1', 'transition': '.5s'});
            }
        }
    });
    $('#linksC').mouseleave(function () {
        $('#linksC').siblings('.menu-options').css({'opacity': '1', 'display': 'block'});
        $(this).css({'border-top-color': 'transparent'});
    });
    $('#linksC').siblings('.menu-options').mouseleave(function () {
        $(this).css({'opacity': '1', 'display': 'block'});
        $('#linksC').css({'border-top-color': 'transparent'});
    });
}