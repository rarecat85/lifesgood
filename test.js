$(function(){
    var $slideWrap = $('.slide-wrap');
    var $slideArea = $slideWrap.find('.slide-area');
    var $slidePrevBtn = $slideWrap.find('.prev-btn');
    var $slideNextBtn = $slideWrap.find('.next-btn');

    $slideArea.slick({
        infinite: false,
        speed: 500,
        autoplay: true,
        autoplaySpeed: 2000,
        prevArrow: $slidePrevBtn,
        nextArrow: $slideNextBtn
    });

    var $slideCurrent = $slideWrap.find('.current');
    var $slideCount = $slideWrap.find('.count');
    var $slidePlayBtn = $slideWrap.find('.play-btn');

    $slideArea.on('beforeChange', function (event, slick, currentSlide, nextSlide){
        $slideCurrent.text(nextSlide + 1);
    });
    $slideCount.text($slideArea.find('.slide-item').length);
    $slidePlayBtn.on('click', function (){
        var _this = $(this);
        if(_this.hasClass('stop')) {
            _this.removeClass('stop').addClass('play').text('자동 재생');
            $slideArea.slick('slickPause');
        } else {
            _this.removeClass('play').addClass('stop').text('정지');
            $slideArea.slick('slickPlay');
        }
    });

    $('.together-slide').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: false,
        infinite: false,
        variableWidth: true,
        prevArrow: $('.together-prev-btn'),
        nextArrow: $('.together-next-btn'),
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    variableWidth: false
                }
            }
        ]
    });

    var $togetherSlickSlide = $('.together-slick-slide');
    var $togetherLink = $togetherSlickSlide.find('a');
    var _togetherLinkCheck = false;
    var $togetherSlidePopup = $('.together-slide-popup');
    var $togetherPopup = $togetherSlidePopup.find('.together-popup');
    var $popupBg = $togetherSlidePopup.find('.popup-bg');
    var $popupCloseBtn = $togetherSlidePopup.find('.close-btn');
    var $popupPrevBtn = $togetherSlidePopup.find('.prev-btn');
    var $popupNextBtn = $togetherSlidePopup.find('.next-btn');
    var _popupIdx = 0;

    if ($(window).width() > 768) {
        $('.together-current').text(4);
        $('.together-slide').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
            $('.together-current').text(nextSlide + 4);
        });
    } else {
        $('.together-current').text(1);
        $('.together-slide').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
            $('.together-current').text(nextSlide + 1);
        });
    }
    $('.together-count').text($togetherSlickSlide.length);

    $togetherLink.on('click', function () {
        _togetherLinkCheck = true;
        setTimeout(function () {
            _togetherLinkCheck = false;
        }, 300);
    });
    $togetherSlickSlide.on('click', function () {
        if (!_togetherLinkCheck) {
            $('html').css('overflow', 'hidden');
            _popupIdx = $(this).index();
            if (_popupIdx === 0) {
                $popupPrevBtn.css('display', 'none');
            } else {
                $popupPrevBtn.css('display', 'block');
            }
            if (_popupIdx === $togetherPopup.length - 1) {
                $popupNextBtn.css('display', 'none');
            } else {
                $popupNextBtn.css('display', 'block');
            }
            $togetherSlidePopup.addClass('pop-active');
            $togetherPopup.removeClass('active');
            $togetherPopup.eq(_popupIdx).addClass('active');
        }
    });

    $popupPrevBtn.on('click', function () {
        if (_popupIdx > 0) {
            _popupIdx--;
            $togetherPopup.removeClass('active');
            $togetherPopup.eq(_popupIdx).addClass('active');
        }
        if (_popupIdx === 0) $(this).css('display', 'none');
        if (_popupIdx < $togetherPopup.length - 1) $popupNextBtn.css('display', 'block');
    });
    $popupNextBtn.on('click', function () {
        if (_popupIdx < $togetherPopup.length - 1) {
            _popupIdx++;
            $togetherPopup.removeClass('active');
            $togetherPopup.eq(_popupIdx).addClass('active');
        }
        if (_popupIdx === $togetherPopup.length - 1) $(this).css('display', 'none');
        if (_popupIdx > 0) $popupPrevBtn.css('display', 'block');
    });

    $popupBg.on('click', function () {
        $('html').css('overflow', 'auto');
        $togetherSlidePopup.removeClass('pop-active');
    });
    $popupCloseBtn.on('click', function () {
        $('html').css('overflow', 'auto');
        $togetherSlidePopup.removeClass('pop-active');
    });

// 전역에 player 선언
var player;
var isPlayerReady = false;

// YouTube API 스크립트 로드
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// API가 준비되면 자동 호출되는 함수 (전역)
function onYouTubeIframeAPIReady() {
    console.log('YouTube API is ready');
    isPlayerReady = true;
    
    // 플레이어는 클릭 시에만 초기화
    console.log('API ready, waiting for user interaction');
}

// API 로딩 상태 확인을 위한 추가 디버깅
console.log('Script loaded, checking API status...');
console.log('YT object exists:', typeof YT !== 'undefined');
console.log('YT.Player exists:', typeof YT !== 'undefined' && typeof YT.Player !== 'undefined');

// 3초 후에도 API가 준비되지 않으면 강제로 시도
setTimeout(function() {
    if (!isPlayerReady) {
        console.log('API still not ready after 3 seconds, checking manually...');
        if (typeof YT !== 'undefined' && typeof YT.Player !== 'undefined') {
            console.log('YT objects exist, setting ready flag manually');
            isPlayerReady = true;
        } else {
            console.error('YouTube API failed to load properly');
        }
    }
}, 3000);

// 플레이어 초기화 함수
function initializePlayer(videoId) {
    console.log('Initializing player with videoId:', videoId);
    
    // 기존 플레이어가 있으면 제거
    if (player) {
        player.destroy();
    }
    
    // DOM 요소 확인
    var playerElement = document.getElementById('ytPlayer');
    if (!playerElement) {
        console.error('ytPlayer element not found in DOM');
        return false;
    }
    
    try {
        player = new YT.Player('ytPlayer', {
            videoId: videoId,
            playerVars: {
                'rel': 0,
                'loop': 1,
                'autoplay': 1 // 자동재생
            },
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
        console.log('Player created successfully');
        return true;
    } catch (error) {
        console.error('Error creating player:', error);
        return false;
    }
}

// 팝업 표시 함수
function showPopup() {
    console.log('Showing popup');
    var popup = $(".youtube-popup");
    if (popup.length > 0) {
        popup.css({display: "block"});
        console.log('Popup displayed');
    } else {
        console.error('Popup element not found');
    }
}

// 버튼 클릭 시 동영상 로드
$(document).on("click", ".yt-play-btn", function () {
    var currentVideoId = $(this).data("youtube-link");
    console.log('Play button clicked, videoId:', currentVideoId);
    
    // API가 준비되지 않았으면 대기
    if (!isPlayerReady) {
        console.log('API not ready, waiting...');
        console.log('YT object exists:', typeof YT !== 'undefined');
        console.log('YT.Player exists:', typeof YT !== 'undefined' && typeof YT.Player !== 'undefined');
        
        var checkAPI = setInterval(function() {
            if (isPlayerReady) {
                clearInterval(checkAPI);
                console.log('API ready after waiting, initializing player...');
                if (initializePlayer(currentVideoId)) {
                    showPopup();
                }
            }
        }, 100);
        
        // 5초 후에도 준비되지 않으면 강제로 시도
        setTimeout(function() {
            if (!isPlayerReady) {
                console.log('API still not ready after 5 seconds, trying anyway...');
                clearInterval(checkAPI);
                if (typeof YT !== 'undefined' && typeof YT.Player !== 'undefined') {
                    console.log('YT objects exist, forcing initialization...');
                    isPlayerReady = true;
                    if (initializePlayer(currentVideoId)) {
                        showPopup();
                    }
                } else {
                    console.error('YouTube API completely failed to load');
                }
            }
        }, 5000);
        return;
    }
    
    // API가 준비되었으면 플레이어 초기화 및 팝업 표시
    console.log('API ready, initializing player immediately...');
    if (initializePlayer(currentVideoId)) {
        showPopup();
    }
});

// 닫기 버튼
$(document).on("click", ".yt-close-btn", function () {
    console.log('Close button clicked');
    $(".youtube-popup").css({display: "none"});
    stopVideo();
});

// 플레이어 준비 시
function onPlayerReady(event) {
    console.log('Player is ready');
    // 자동재생은 playerVars에서 설정
}

// 상태 변경 시
function onPlayerStateChange(event) {
    console.log('Player state changed:', event.data);
}

// 정지 함수
function stopVideo() {
    if (player && player.stopVideo) {
        console.log('Stopping video');
        player.stopVideo();
    }
}

});
