<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title><!--타이틀--></title>
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta property="og:title" content=""/>
    <meta property="og:url" content="">
    <meta property="og:description" content=""/>
    <meta property="og:image" content="">
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/head-css.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/font-woff.jsp"/>
    <!-- // default code -->
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/mic-head-script.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/gateway-foresee.jsp"/>

    <!-- your -->
    <link href="../common/css/reset.css" rel="stylesheet" type="text/css" />
<link href="../common/css/font.css" rel="stylesheet" type="text/css" />
<link href="../common/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
<link href="./assets/css/radio.css" rel="stylesheet" type="text/css" />

    <script src="../common/js/gsap.min.js"></script>
<script src="../common/js/ScrollTrigger.min.js"></script>
<script src="../common/js/SplitText.min.js"></script>
<script src="../common/js/swiper-bundle.min.js"></script>
<script src="./assets/js/radio.js" defer></script>
<script src="./assets/js/overview.js" defer></script>
<script src="./assets/js/sound.js" defer></script>
<script src="./assets/js/banner.js" defer></script>
<script src="./assets/js/stories.js" defer></script>
<script src="./assets/js/how-to.js" defer></script>
<script src="./assets/js/influence.js" defer></script>
<script src="./assets/js/main-video.js" defer></script>
<script src="./assets/js/parallax.js" defer></script>

    <script>
        function GA_Event(category,action,label) {
            dataLayer.push({
                'event' : 'ga_event', 
                'category' : category, 
                'action' : action,
                'label' : label,
            });
        }
        </script>
    <!-- //your -->
</head>
<body>
<jsp:include page="/WEB-INF/jsp/gp/common/include/body/body-noscript.jsp"/>
<jsp:include page="/WEB-INF/jsp/gp/common/include/body/google-tag-manager.jsp"/>
<jsp:include page="/WEB-INF/jsp/gp/common/include/body/broswe-check-popup-layer.jsp"/>
<div class="sr-only" itemscope itemtype="http://schema.org/WebPage">
    <meta itemprop="name" content="{Browser Title}"/>
    <meta itemprop="image" content="{Share Image}"/>
    <meta itemprop="url" content="{Cannonical URL}"/>
    <meta itemprop="description" content="Join LG's Life's Good 2024 campaign, 'Optimism Your Feed'. Take charge of your social media and turn it into a source of positivity, smiles, and joy."/>
    <meta itemprop="Keywords" content="Life's Good, optimism, Optimism your feed, LG, smile, Challenge, TikTok, lifesgood, Challenge, Opportunity, Change, Goal, Innovation"/>
</div>
<c:set var='bizType' value='${$bizType }'/>
<c:set var='siteType' value='MKT'/>
<!-- component (navigation) -->
<c:import url="/${localeCd }/gnb">
    <c:param name="bizType" value="${bizType}"/>
    <c:param name="siteType" value="${siteType}"/>
    <c:param name="isMobile" value="${isMobile}"/>
</c:import>
<!-- // component (navigation) -->
<!-- breadcrumb -->
<c:import url="/${localeCd }/breadCrumb">
    <c:param name="bizType" value="${bizType}"/>
</c:import>
<!-- // breadcrumb -->

<!-- Enter Code Here -->
<div class="radio-container">
    <!-- S : parallax -->
    <section class="parallax-container">
      <div class="parallax-txt-bx">
        <div class="parallax-txt-bx-logo" role="img" aria-label="شعار حملة Radio Optimism">
          <div class="parallax-txt-bx-logo-txt">
            <picture>
              <source
                srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-logo-desktop.png"
                media="(min-width: 1024px)">
              <source
                srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-logo-mobile.png"
                media="(max-width: 1023px)">
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-logo-mobile.png"
                alt="RADIO OPTIMISM">
            </picture>
          </div>
          <div class="parallax-txt-bx-logo-sticker">
            <div class="parallax-txt-bx-logo-sticker-radio">
              <img
                src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-logo-sticker-radio.png"
                alt="RADIO OPTIMISM radio sticker">
            </div>
            <div class="parallax-txt-bx-logo-sticker-logo">
              <img
                src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-logo-sticker-logo.png"
                alt="RADIO OPTIMISM logo sticker">
            </div>
          </div>
        </div>
        <h2 class="parallax-txt-bx-title heading">اصنع الألحان وأسعد يوم شخصٍ ما</h2>
        <div class="parallax-txt-bx-radio-controls" aria-hidden="true">
          <span class="parallax-txt-bx-radio-controls-line"></span>
          <span class="parallax-txt-bx-radio-controls-boll"></span>
          <span class="parallax-txt-bx-radio-controls-line"></span>
        </div>
        <div class="parallax-txt-bx-btns">
          <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-btns.svg"
            alt="Radio buttons">
        </div>
      </div>
      <div class="parallax-item-bx" role="img"
        aria-label="امرأة ترتدي سترة حمراء للمشي تقف في مكان يمكن رؤية المحيط الواسع والجبال المغطاة بالثلوج منه.">
        <div class="parallax-bg">
          <picture>
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-bg-desktop.jpg"
              media="(min-width: 769px)">
            <source srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-bg-mobile.jpg"
              media="(max-width: 768px)">
            <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-bg-mobile.jpg"
              alt="parallax-bg">
          </picture>
        </div>
        <div class="parallax-item parallax-item-01">
          <picture>
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-01-desktop.png"
              media="(min-width: 769px)">
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-01-mobile.png"
              media="(max-width: 768px)">
            <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-01-mobile.png"
              alt="Parallax decorative element 1">
          </picture>
        </div>
        <div class="parallax-item parallax-item-02">
          <picture>
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-02-desktop.png"
              media="(min-width: 769px)">
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-02-mobile.png"
              media="(max-width: 768px)">
            <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-02-mobile.png"
              alt="Parallax decorative element 2">
          </picture>
        </div>
        <div class="parallax-item parallax-item-03">
          <picture>
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-03-desktop.png"
              media="(min-width: 769px)">
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-03-mobile.png"
              media="(max-width: 768px)">
            <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-parallax-item-03-mobile.png"
              alt="Parallax decorative element 3">
          </picture>
        </div>
      </div>
      <div class="scroll-move" role="img" aria-label="مرِّر لأسفل">
        <span>مرِّر لأسفل</span>
        <svg aria-hidden="true" width="34" height="63" viewBox="0 0 34 63" fill="none"
          xmlns="http://www.w3.org/2000/svg">
          <rect x="1" y="1" width="32" height="48" rx="16" stroke="white" stroke-width="2" />
          <path d="M23.0703 55.9531L16.9989 61.9055L10.9275 55.9531" stroke="white" stroke-width="1.5"
            stroke-linecap="square" />
          <ellipse cx="16.9989" cy="36.9044" rx="2.42857" ry="2.38095" fill="white" />
        </svg>
      </div>
    </section>
    <!-- E : parallax -->
    <script src="https://www.youtube.com/iframe_api"></script>


    <section class="main-video">
      <div class="video-bx">
        <div class="player-wrapper">
          <div id="youtube-player"
            aria-label="هذا محتوى فيديو من راديو التفاؤل التابع لشركة LG على قناة LG Electronics في يوتيوب."></div>
        </div>
      </div>
    </section>
    <section class="overview">
      <div class="inner">
        <div class="overview-heading">
          <p class="overview-heading-title heading">
            نحن نمرّر، وننقر، ونعجب بالمنشورات يوميًا...<br />
            <span class="radio-highlight">لكن، هل نتواصل حقًا مع بعضنا البعض؟</span><br />
            ربما ما نحتاجه هو تواصل من القلب إلى القلب.
          </p>
          <div class="overview-heading-img"
            aria-label="امرأة شابة ترتدي سترة بيضاء وجينز مستلقية على أريكة، تعجب بمنشور صديقتها على وسائل التواصل الاجتماعي باستخدام هاتفها.">
            <picture>
              <source
                srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-image01-mobile.jpg"
                media="(max-width: 768px)" />
              <source
                srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-image01-desktop.jpg"
                media="(min-width: 769px)" />
              <img
                src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-image01-mobile.jpg"
                alt="" />
            </picture>
            <div class="overview-heading-motion-imgs">
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-heart-icon.png"
                alt="" class="motion-icon heart-icon" />
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-smile-icon.png"
                alt="" class="motion-icon smile-icon" />
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-img-icon.png"
                alt="" class="motion-icon img-icon" />
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-like-icon.png"
                alt="" class="motion-icon like-icon01" />
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-like-icon.png"
                alt="" class="motion-icon like-icon02" />
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-like-icon.png"
                alt="" class="motion-icon like-icon03" />
            </div>
          </div>
        </div>
        <div class="overview-cont-box">
          <div class="overview-cont">
            <div class="overview-cont-img">
              <picture>
                <source
                  srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-image02-mobile.png"
                  media="(max-width: 768px)" />
                <source
                  srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-image02-desktop.png"
                  media="(min-width: 769px)" />
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-cont-image02-mobile.png"
                  alt="شاب وفتاة يجلسان على مكتب، يستمتعان بحملة راديو التفاؤل على جهاز لابتوب." />
              </picture>
            </div>
            <p class="overview-cont-txt">
              اصنع لحنًا لشخص مميز في حياتك مع LG Radio Optimism.<br>
              الأمر بسيط — فكّر في شخص عزيز، واكتب عنه بضع كلمات،<br>
              وسيتحوّل ذلك إلى أغنية فريدة، جاهزة لتُشاركها بابتسامة.
            </p>
             <p class="overview-cont-txt">
              لهذا السبب، نُقدّم رسالة "Life’s Good" <br>
              بلغة يفهمها الجميع: الموسيقى.<br>
            </p>
          </div>
          <div class="overview-cont">
            <div class="overview-cont-img">
              <picture>
                <source
                  srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-image03-mobile.png"
                  media="(max-width: 768px)" />
                <source
                  srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-image03-desktop.png"
                  media="(min-width: 769px)" />
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-cont-image03-mobile.png"
                  alt="overview-img" />
              </picture>
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-heart-tower.png"
                alt="امرأة تبتسم بابتسامة مشرقة وهي تنظر إلى جهاز اللابتوب الخاص بها في غرفة واسعة."
                class="overview-heart-tower-img" />
            </div>
            <p class="overview-cont-txt">
              في اللحظة التي تصنع فيها أغنية من القلب لأحدهم،
              وفي اللحظة التي تتلقى فيها واحدة من شخصٍ مميز،
              عندها فقط نشعر حقًا بجمال الحياة.
            </p>
            <!-- <div class="overview-cont-lifesgood-logo">
          <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-overview-lifesgood-logo.svg" alt="lifesgood-logo" />
        </div> -->
          </div>
        </div>
      </div>
    </section>
    <section class="how-to">
      <div class="how-to-container">
        <h2 class="how-to-title heading">كيفية إنشاء أغنيتك؟</h2>
        <p class="how-to-subtitle">بضع نقرات فقط — الأمر بهذه السهولة.</p>
        <!-- S : how-to-video-slide-->
        <div class="how-to-video-slide swiper">
          <div class="swiper-wrapper">
            <!-- S : slide item 01-->
            <div class="swiper-slide">
              <div class="how-to-video-bx">
                &quot;
                <video muted playsinline aria-label="فيديو الخطوة الأولى من سلسلة &quot;كيفية صنع أغنيتك&quot;.">
                  <source src="./assets/videos/lifes-good-campaign-2025-radio-optimism-lgcom-videos-how-to-step01.mp4"
                    type="video/mp4">
                </video>
                <button class="how-to-video-control-btn pause" aria-label="pause" aria-live="polite">
                  <svg class="progress-circle" width="100%" height="100%" viewBox="0 0 100 100">
                    <circle class="progress-circle-fill" cx="50" cy="50" r="48" fill="none" stroke="#000000"
                      stroke-linecap="round" />
                  </svg>
                </button>
              </div>
              <div class="how-to-txt-bx">
                <h3 class="how-to-txt-bx-title heading">
                  <span class="how-to-txt-bx-title-num">
                    <img
                      src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-how-to-step-num-01.svg"
                      alt="الخطوة 1">
                  </span>
                  انضم إلى Radio Optimism
                </h3>
                <p class="how-to-txt-bx-txt">اضغط على "لنصنع أغنية ناجحة" لتبدأ رحلتك. <br>اختر لغتك المفضلة للانطلاق.
                </p>
              </div>
            </div>
            <!-- E : slide item 01-->
            <!-- S : slide item 02-->
            <div class="swiper-slide">
              <div class="how-to-video-bx">
                <video muted playsinline aria-label="فيديو الخطوة الثانية من سلسلة &quot;كيفية صنع أغنيتك&quot;.">
                  <source src="./assets/videos/lifes-good-campaign-2025-radio-optimism-lgcom-videos-how-to-step02.mp4"
                    type="video/mp4">
                </video>
                <button class="how-to-video-control-btn pause" aria-label="pause" aria-live="polite">
                  <svg class="progress-circle" width="100%" height="100%" viewBox="0 0 100 100">
                    <circle class="progress-circle-fill" cx="50" cy="50" r="48" fill="none" stroke="#000000"
                      stroke-linecap="round" />
                  </svg>
                </button>
              </div>
              <div class="how-to-txt-bx">
                <h3 class="how-to-txt-bx-title heading">
                  <span class="how-to-txt-bx-title-num">
                    <img
                      src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-how-to-step-num-02.svg"
                      alt="الخطوة 2">
                  </span>
                  احكِ قصتك
                </h3>
                <p class="how-to-txt-bx-txt">من أنت؟ ولمن تهدي هذه الأغنية؟ <br>
                  كلما شاركت تفاصيل أكثر — ذكرى، لحظة مميزة، أو شيء لا يعرفه سواكما — <br> كلما أصبحت كلمات الأغنية أقرب
                  إلى القلب. <br>بمجرد انتهائك، سنحوّل قصتك إلى أغنية بتصميم غلاف خاص.
                </p>
              </div>
            </div>
            <!-- E : slide item 02-->
            <!-- S : slide item 03-->
            <div class="swiper-slide">
              <div class="how-to-video-bx">
                <video muted playsinline aria-label="فيديو الخطوة الثالثة من سلسلة &quot;كيفية صنع أغنيتك&quot;.">
                  <source src="./assets/videos/lifes-good-campaign-2025-radio-optimism-lgcom-videos-how-to-step03.mp4"
                    type="video/mp4">
                </video>
                <button class="how-to-video-control-btn pause" aria-label="pause" aria-live="polite">
                  <svg class="progress-circle" width="100%" height="100%" viewBox="0 0 100 100">
                    <circle class="progress-circle-fill" cx="50" cy="50" r="48" fill="none" stroke="#000000"
                      stroke-linecap="round" />
                  </svg>
                </button>
              </div>
              <div class="how-to-txt-bx">
                <h3 class="how-to-txt-bx-title heading">
                  <span class="how-to-txt-bx-title-num">
                    <img
                      src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-how-to-step-num-03.svg"
                      alt="الخطوة 3">
                  </span>
                  اختر إحساس الأغنية
                </h3>
                <p class="how-to-txt-bx-txt">
                  حان وقت تشكيل الصوت!<br>
                  اختر نوع الموسيقى — من الهيب هوب إلى الكيبوب — وحدد النمط الذي يناسب قصتك.
                </p>
              </div>
            </div>
            <!-- E : slide item 03-->
            <!-- S : slide item 04-->
            <div class="swiper-slide">
              <div class="how-to-video-bx">
                <video muted playsinline aria-label="فيديو الخطوة الرابعة من سلسلة &quot;كيفية صنع أغنيتك&quot;.">
                  <source src="./assets/videos/lifes-good-campaign-2025-radio-optimism-lgcom-videos-how-to-step04.mp4"
                    type="video/mp4">
                </video>
                <button class="how-to-video-control-btn pause" aria-label="pause" aria-live="polite">
                  <svg class="progress-circle" width="100%" height="100%" viewBox="0 0 100 100">
                    <circle class="progress-circle-fill" cx="50" cy="50" r="48" fill="none" stroke="#000000"
                      stroke-linecap="round" />
                  </svg>
                </button>
              </div>
              <div class="how-to-txt-bx">
                <h3 class="how-to-txt-bx-title heading">
                  <span class="how-to-txt-bx-title-num">
                    <img
                      src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-how-to-step-num-04.svg"
                      alt="الخطوة 4">
                  </span>
                  أغنيتك جاهزة!
                </h3>
                <p class="how-to-txt-bx-txt">أرسلها إلى شخصك المميز، <br>ودعها تُبث عبر Radio Optimism.
                </p>
              </div>
            </div>
            <!-- E : slide item 04-->
          </div>
          <!-- S : swiper-navigation-->
          <div class="swiper-navigation">
            <button class="swiper-button-prev">
              <p class="sr-only">Previous</p>
            </button>
            <button class="swiper-button-next">
              <p class="sr-only">Next</p>
            </button>
          </div>
          <!-- E : swiper-navigation-->
          <!-- S : swiper-pagination-->
          <div class="swiper-pagination"></div>
          <!-- E : swiper-pagination-->
        </div>
        <!-- E : how-to-video-slide-->
      </div>
    </section>
    <!-- S : sound -->
    <section class="sound">
      <h2 class="sound-title heading">أغانٍ صُنعت خصيصًا لك</h2>

      <div class="sound-swiper swiper">
        <div class="sound-img-active" aria-hidden="true"></div>
        <div class="swiper-wrapper">
          <!-- S : slide item 01 -->
          <div class="swiper-slide">
            <div class="sound-imgbx">
              <div class="sound-imgbx-album">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-album-beam-of-positivity.png"
                  alt="غلاف الألبوم Beam of Positivity، من إنتاج LG باستخدام الذكاء الاصطناعي.">
              </div>
              <div class="sound-imgbx-track">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-track-beam-of-positivity.png"
                  alt="صورة LP لألبوم Beam of Positivity، من إنتاج LG باستخدام الذكاء الاصطناعي.">
              </div>
            </div>
          </div>
          <!-- E : slide item 01 -->
          <!-- S : slide item 02 -->
          <div class="swiper-slide">
            <div class="sound-imgbx">
              <div class="sound-imgbx-album">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-album-keep-swimming.png"
                  alt="غلاف الألبوم Keep Swimming، من إنتاج Mom باستخدام الذكاء الاصطناعي.">
              </div>
              <div class="sound-imgbx-track">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-track-keep-swimming.png"
                  alt="صورة LP لألبوم Keep Swimming، من إنتاج Mom باستخدام الذكاء الاصطناعي.">
              </div>
            </div>
          </div>
          <!-- E : slide item 02 -->
          <!-- S : slide item 03 -->
          <div class="swiper-slide">
            <div class="sound-imgbx">
              <div class="sound-imgbx-album">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-album-the-tale-of-optimistic-toby.png"
                  alt="غلاف الألبوم The Tale of Optimistic Toby، من إنتاج Kyle باستخدام الذكاء الاصطناعي.">
              </div>
              <div class="sound-imgbx-track">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-track-the-tale-of-optimistic-toby.png"
                  alt="صورة LP لألبوم The Tale of Optimistic Toby، من إنتاج Kyle باستخدام الذكاء الاصطناعي.">
              </div>
            </div>
          </div>
          <!-- E : slide item 03 -->
          <!-- S : slide item 04 -->
          <div class="swiper-slide">
            <div class="sound-imgbx">
              <div class="sound-imgbx-album">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-album-my-dad-my-hero.png"
                  alt="غلاف الألبوم My Dad, My Hero، من إنتاج Cam باستخدام الذكاء الاصطناعي.">
              </div>
              <div class="sound-imgbx-track">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-track-my-dad-my-hero.png"
                  alt="صورة LP لألبوم My Dad, My Hero، من إنتاج Cam باستخدام الذكاء الاصطناعي.">
              </div>
            </div>
          </div>
          <!-- E : slide item 04 -->
          <!-- S : slide item 05 -->
          <div class="swiper-slide">
            <div class="sound-imgbx">
              <div class="sound-imgbx-album">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-album-carpool-hero.png"
                  alt="غلاف الألبوم Carpool Hero، من إنتاج Tina باستخدام الذكاء الاصطناعي.">
              </div>
              <div class="sound-imgbx-track">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-track-carpool-hero.png"
                  alt="صورة LP لألبوم Carpool Hero، من إنتاج Tina باستخدام الذكاء الاصطناعي.">
              </div>
            </div>
          </div>
          <!-- E : slide item 05 -->
          <!-- S : slide item 06 -->
          <div class="swiper-slide">
            <div class="sound-imgbx">
              <div class="sound-imgbx-album">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-album-loving-life-with-my-beautiful-wife.png"
                  alt="غلاف الألبوم Loving Life with my Beautiful Wife، من إنتاج Devon باستخدام الذكاء الاصطناعي.">
              </div>
              <div class="sound-imgbx-track">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-track-loving-life-with-my-beautiful-wife.png"
                  alt="صورة LP لألبوم Loving Life with my Beautiful Wife، من إنتاج Devon باستخدام الذكاء الاصطناعي.">
              </div>
            </div>
          </div>
          <!-- E : slide item 06 -->
          <!-- S : slide item 07 -->
          <div class="swiper-slide">
            <div class="sound-imgbx">
              <div class="sound-imgbx-album">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-album-spreading-joy-spreading-light.png"
                  alt="غلاف الألبوم Spreading Joy, Spreading Light، من إنتاج LG باستخدام الذكاء الاصطناعي.">
              </div>
              <div class="sound-imgbx-track">
                <img
                  src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-sound-track-spreading-joy-spreading-light.png"
                  alt="صورة LP لألبوم Spreading Joy, Spreading Light، من إنتاج LG باستخدام الذكاء الاصطناعي.">
              </div>
            </div>
          </div>
          <!-- E : slide item 07 -->
        </div>

        <!-- S : swiper-navigation-->
        <div class="swiper-navigation">
          <button class="swiper-button-prev swiper-btn">
            <p class="sr-only">Previous</p>
          </button>
          <button class="swiper-button-next swiper-btn">
            <p class="sr-only">Next</p>
          </button>
        </div>
        <!-- E : swiper-navigation-->
      </div>
      <div class="sound-txt-swiper swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <div class="sound-txtbx">
              <div class="sound-txtbx-controllers" role="group" title="Audio player:Beam of Positivity">
                <audio id="audio-1" preload="metadata">
                  <source
                    src="./assets/audios/lifes-good-campaign-2025-radio-optimism-lgcom-audios-sound-beam-of-positivity.mp3"
                    type="audio/mpeg">
                  مسار الصوت Beam of Positivity، من إنتاج LG باستخدام الذكاء الاصطناعي.
                </audio>
                <button class="sound-txtbx-controllers-btn" aria-controls="audio-1" aria-label="play"
                  aria-pressed="false"></button>
                <div class="progress-container" aria-controls="audio-1" aria-label="audio progress">
                  <div class="progress-bar">
                    <div class="progress-fill"></div>
                    <div class="progress-circle" role="slider" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"
                      aria-valuetext="0%"></div>
                  </div>
                </div>
                <button class="volume-btn" aria-controls="audio-1" aria-label="unmute" aria-pressed="false"></button>
              </div>
              <h3 class="sound-txtbx-title">
                <div class="sound-txtbx-title-wrapper heading">Beam of Positivity
                </div>
              </h3>
              <p>By LG</p>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="sound-txtbx">
              <div class="sound-txtbx-controllers" role="group" title="Audio player: Keep Swimming">
                <audio id="audio-2" preload="metadata">
                  <source
                    src="./assets/audios/lifes-good-campaign-2025-radio-optimism-lgcom-audios-sound-keep-swimming.mp3"
                    type="audio/mpeg">
                  مسار الصوت Keep Swimming، من إنتاج Mom باستخدام الذكاء الاصطناعي.
                </audio>
                <button class="sound-txtbx-controllers-btn" aria-controls="audio-2" aria-label="play"
                  aria-pressed="false"></button>
                <div class="progress-container" aria-controls="audio-2" aria-label="audio progress">
                  <div class="progress-bar">
                    <div class="progress-fill"></div>
                    <div class="progress-circle" role="slider" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"
                      aria-valuetext="0%"></div>
                  </div>
                </div>
                <button class="volume-btn" aria-controls="audio-2" aria-label="unmute" aria-pressed="false"></button>
              </div>
              <h3 class="sound-txtbx-title">
                <div class="sound-txtbx-title-wrapper heading"> Keep Swimming
                </div>
              </h3>
              <p>By Mom</p>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="sound-txtbx">
              <div class="sound-txtbx-controllers" role="group" title="Audio player: The Tale of Optimistic Toby">
                <audio id="audio-3" preload="metadata">
                  <source
                    src="./assets/audios/lifes-good-campaign-2025-radio-optimism-lgcom-audios-sound-the-tale-of-optimistic-toby.mp3"
                    type="audio/mpeg">
                  مسار الصوت The Tale of Optimistic Toby، من إنتاج Kyle باستخدام الذكاء الاصطناعي.
                </audio>
                <button class="sound-txtbx-controllers-btn" aria-controls="audio-3" aria-label="play"
                  aria-pressed="false"></button>
                <div class="progress-container" aria-controls="audio-3" aria-label="audio progress">
                  <div class="progress-bar">
                    <div class="progress-fill"></div>
                    <div class="progress-circle" role="slider" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"
                      aria-valuetext="0%"></div>
                  </div>
                </div>
                <button class="volume-btn" aria-controls="audio-3" aria-label="unmute" aria-pressed="false"></button>
              </div>
              <h3 class="sound-txtbx-title">
                <div class="sound-txtbx-title-wrapper heading"> The Tale of Optimistic Toby
                </div>
              </h3>
              <p>By Kyle</p>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="sound-txtbx">
              <div class="sound-txtbx-controllers" role="group" title="Audio player: My Dad, My Hero">
                <audio id="audio-4" preload="metadata">
                  <source
                    src="./assets/audios/lifes-good-campaign-2025-radio-optimism-lgcom-audios-sound-my-dad-my-hero.mp3"
                    type="audio/mpeg">
                  مسار الصوت My Dad, My Hero، من إنتاج Cam باستخدام الذكاء الاصطناعي.
                </audio>
                <button class="sound-txtbx-controllers-btn" aria-controls="audio-4" aria-label="play"
                  aria-pressed="false"></button>
                <div class="progress-container" aria-controls="audio-4" aria-label="audio progress">
                  <div class="progress-bar">
                    <div class="progress-fill"></div>
                    <div class="progress-circle" role="slider" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"
                      aria-valuetext="0%"></div>
                  </div>
                </div>
                <button class="volume-btn" aria-controls="audio-4" aria-label="unmute" aria-pressed="false"></button>
              </div>
              <h3 class="sound-txtbx-title">
                <div class="sound-txtbx-title-wrapper heading"> My Dad, My Hero
                </div>
              </h3>
              <p>By Cam</p>
            </div>

          </div>
          <div class="swiper-slide">
            <div class="sound-txtbx">
              <div class="sound-txtbx-controllers" role="group" title="Audio player: Carpool Hero">
                <audio id="audio-5" preload="metadata">
                  <source
                    src="./assets/audios/lifes-good-campaign-2025-radio-optimism-lgcom-audios-sound-carpool-hero.mp3"
                    type="audio/mpeg">
                  المسار الصوتي Carpool Hero، من إنتاج Tina باستخدام الذكاء الاصطناعي.
                </audio>
                <button class="sound-txtbx-controllers-btn" aria-controls="audio-5" aria-label="play"
                  aria-pressed="false"></button>
                <div class="progress-container" aria-controls="audio-5" aria-label="audio progress">
                  <div class="progress-bar">
                    <div class="progress-fill"></div>
                    <div class="progress-circle" role="slider" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"
                      aria-valuetext="0%"></div>
                  </div>
                </div>
                <button class="volume-btn" aria-controls="audio-5" aria-label="unmute" aria-pressed="false"></button>
              </div>
              <h3 class="sound-txtbx-title">
                <div class="sound-txtbx-title-wrapper heading"> Carpool Hero
                </div>
              </h3>
              <p>By Tina</p>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="sound-txtbx">
              <div class="sound-txtbx-controllers" role="group"
                title="Audio player: Loving Life with my Beautiful Wife">
                <audio id="audio-6" preload="metadata">
                  <source
                    src="./assets/audios/lifes-good-campaign-2025-radio-optimism-lgcom-audios-sound-loving-life-with-my-beautiful-wife.mp3"
                    type="audio/mpeg">
                  المسار الصوتي Loving Life with my Beautiful Wife، من إنتاج Devon باستخدام الذكاء الاصطناعي.
                </audio>
                <button class="sound-txtbx-controllers-btn" aria-controls="audio-6" aria-label="play"
                  aria-pressed="false"></button>
                <div class="progress-container" aria-controls="audio-6" aria-label="audio progress">
                  <div class="progress-bar">
                    <div class="progress-fill"></div>
                    <div class="progress-circle" role="slider" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"
                      aria-valuetext="0%"></div>
                  </div>
                </div>
                <button class="volume-btn" aria-controls="audio-6" aria-label="unmute" aria-pressed="false"></button>
              </div>
              <h3 class="sound-txtbx-title">
                <div class="sound-txtbx-title-wrapper heading"> Loving Life with my Beautiful Wife
                </div>
              </h3>
              <p>By Devan</p>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="sound-txtbx">
              <div class="sound-txtbx-controllers" role="group" title="Audio player: Spreading Joy, Spreading Light">
                <audio id="audio-7" preload="metadata">
                  <source
                    src="./assets/audios/lifes-good-campaign-2025-radio-optimism-lgcom-audios-sound-spreading-joy-spreading-light.mp3"
                    type="audio/mpeg">
                  المسار الصوتي Spreading Joy, Spreading Light، من إنتاج LG باستخدام الذكاء الاصطناعي.
                </audio>
                <button class="sound-txtbx-controllers-btn" aria-controls="audio-7" aria-label="play"
                  aria-pressed="false"></button>
                <div class="progress-container" aria-controls="audio-7" aria-label="audio progress">
                  <div class="progress-bar">
                    <div class="progress-fill"></div>
                    <div class="progress-circle" role="slider" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"
                      aria-valuetext="0%"></div>
                  </div>
                </div>
                <button class="volume-btn" aria-controls="audio-7" aria-label="unmute" aria-pressed="false"></button>
              </div>
              <h3 class="sound-txtbx-title">
                <div class="sound-txtbx-title-wrapper heading"> Spreading Joy, Spreading Light
                </div>
              </h3>
              <p>By LG</p>
            </div>
          </div>
        </div>
        <!-- S : swiper-pagination-->
        <div class="swiper-pagination"></div>
        <!-- E : swiper-pagination-->
      </div>

    </section>
    <!-- E : sound -->
    <!-- S : Banner -->
    <section class="banner">
      <div class="banner-wrapper">
        <div class="banner-imgbx-1">
          <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-banner-left-desktop.png"
            alt="على الجانب الأيسر من الشعار، توجد أيقونات مختلفة مرتبطة براديو التفاؤل وLife's Good."
            loading="lazy">
        </div>
        <div class="inner">
          <div class="banner-main-area">
            <div class="banner-main-area-imgbx">
              <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-banner-optimism-logo.gif"
                alt="شعار حملة راديو التفاؤل." loading="lazy">
            </div>
            <h2 class="banner-main-area-title heading">
              <div class="top">
                <p class="heading">محطة الإهداء أربعة وعشرون سبعة</p>
              </div>
            </h2>
            <div class="banner-main-area-controls" aria-hidden="true">
              <button type="button" class="prev-btn"></button>
              <button type="button" class="stop-btn"></button>
              <button type="button" class="next-btn"></button>
            </div>
            <a href="https://radiooptimism.lg.com" class="banner-main-area-startbtn">
              <p>قم بإنشاء أغنيتك الآن</p>
              <div class="blendbx" aria-hidden="true">
                <div class="blendbx-blend-1 blend"></div>
                <div class="blendbx-blend-2 blend"></div>
                <div class="blendbx-blend-3 blend"></div>
                <div class="blendbx-blend-4 blend"></div>
              </div>
            </a>
          </div>
        </div>
        <div class="banner-imgbx-2">
          <picture>
            <source
              srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-banner-right-desktop.png"
              media="(min-width: 769px)">
            <source srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-banner-mobile.png"
              media="(max-width: 768px)">
            <img src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-banner-mobile.png"
              alt="على الجانب الأيمن من الشعار، توجد أيقونات متنوعة مرتبطة براديو التفاؤل وLife's Good."
              loading="lazy">
          </picture>
        </div>
      </div>
      <div class="banner-disclaimer-wrapper">
        <ul class="banner-disclaimer-wrapper-list">
          <li class="banner-disclaimer-wrapper-item">
            *تم إنشاء بعض المحتوى باستخدام الذكاء الاصطناعي لأغراض توضيحية.
          </li>
          <li class="banner-disclaimer-wrapper-item">
            *اللغات المدعومة قد تختلف حسب الدولة أو المنطقة.
          </li>
        </ul>
      </div>
    </section>
    <!-- E : Banner -->
    <!-- S : stories -->
    <section class="stories">
      <!-- <div class="inner"> -->
      <div class="inner">
        <h2 class="stories-title heading">اكتشف معنى "Life’s Good"</h2>
      </div>
      <div class="stories-slide-bx">
        <div class="swiper" role="region" aria-label="stories slide carousel">
          <div class="swiper-wrapper">
            <!-- <div class="swiper-slide" role="group" aria-roledescription="stories slide">
              <div class="img-bx">
                <picture>
                  <source
                    srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-01-desktop.png"
                    media="(min-width: 769px)">
                  <source
                    srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-01-mobile.png"
                    media="(max-width: 768px)">
                  <img
                    src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-01-mobile.png"
                    alt="مشهد تلتقط فيه الكاميرا رجلًا وامرأة مستلقيين معًا على أريكة غرفة المعيشة من بعيد."
                    loading="lazy">
                </picture>
              </div>
              <div class="txt-bx">
                <h3>أقل اصطناعية، أكثر إنسانية</h3>
                <p>ذكاء LG العاطفي.</p>
                <a href="https://www.lg.com/global/lifes-good-in-action/less-artificial-more-human/"
                  class="white-btn">تعرف أكثر</a>
              </div>
            </div> -->
            <div class="swiper-slide" role="group" aria-roledescription="stories slide">
              <div class="img-bx">
                <picture>
                  <source
                    srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-02-desktop.png"
                    media="(min-width: 769px)">
                  <source
                    srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-02-mobile.png"
                    media="(max-width: 768px)">
                  <img
                    src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-02-mobile.png"
                    alt="أشخاص يستمتعون بالتخييم بابتسامة، يحتضنون قوة التفاؤل." loading="lazy">
                </picture>
              </div>
              <div class="txt-bx">
                <h3>انشر التفاؤل في موجزك</h3>
                <p>أعد الابتسامة إلى حساباتك على التواصل الاجتماعي.</p>
                <a href="https://www.lg.com/global/lifes-good-in-action/optimism-your-feed/" class="white-btn">تعرف أكثر</a>
              </div>
            </div>
            <div class="swiper-slide" role="group" aria-roledescription="stories slide">
              <div class="img-bx">
                <picture>
                  <source
                    srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-03-desktop.png"
                    media="(min-width: 769px)">
                  <source
                    srcset="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-03-mobile.png"
                    media="(max-width: 768px)">
                  <img
                    src="./assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-learn-about-03-mobile.png"
                    alt="وجه الطفل واضح أمام كعكة مضاءة بالشموع، وثلاجة LG InstaView تظهر بخفوت في الخلفية. "
                    loading="lazy">
                </picture>
              </div>
              <div class="txt-bx">
                <h3>نحن لا نجعل الحياة جميلة... أنت من يفعل ذلك</h3>
                <p>عِش لحظات Life’s Good.</p>
                <a href="https://www.lg.com/global/lifes-good-in-action/product-story-washtower/"
                  class="white-btn">تعرف أكثر</a>
              </div>
            </div>
          </div>
          <div class="swiper-btnbx">
            <div class="swiper-btnbx-prev"></div>
            <div class="swiper-btnbx-next"></div>
          </div>
        </div>
      </div>
      <!-- </div> -->
    </section>
    <!-- E : stories -->
  </div>
<!-- // Enter Code Here -->

<!-- top button -->
<jsp:include page="/WEB-INF/jsp/gp/common/include/body/top.jsp"/>
<!-- // top button -->

<!-- footer seo copy -->
<c:import url="/${localeCd }/footerSeoCopy"/>
<!-- footer seo copy -->

<!-- footer main contents -->
<c:import url="/${localeCd }/footer">
    <c:param name="bizType" value="${bizType}"/>
    <c:param name="siteType" value="${siteType}"/>
</c:import>
<!--// footer main contents -->

<script>
    var standardData = {};
    standardData = {
        "siteType": "B2C",
        "pageType": "MICROSITE",
        "pdpStatus": "",
        "level1": "",
        "level2": "",
        "level3": ""
    };
    _dl = {
        "page_name": {
            "super_category": "",
            "bu": "ha",
            "sub_category_list": "",
            "sub_category": "",
            "page_purpose": "",
            "category": "",
            "microsite_name": ""
        },
        "country_code": "",
        "language_code": "",
        "appliance_name": ""
    };
</script>

<!-- default code -->
<jsp:include page="/WEB-INF/jsp/gp/common/include/tail/tail-script-default.jsp"/>
<!-- // default code -->

<script type="text/javascript">
(function(w, d, a){
    w.__beusablerumclient__ = {
        load : function(src){
            var b = d.createElement("script");
            b.src = src; b.async=true; b.type = "text/javascript";
            d.getElementsByTagName("head")[0].appendChild(b);
        }
    };w.__beusablerumclient__.load(a + "?url=" + encodeURIComponent(d.URL));
})(window, document, "//rum.beusable.net/load/b210329e143851u463");
</script>
</body>
</html>
