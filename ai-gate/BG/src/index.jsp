<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG BG</title>
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, Човекоцентричен изкуствен интелект, Платформа за интелигентен живот, Технологично напреднали решения">
    <meta name="Description" content="LG AI се стреми към Възхитителен, Безпроблемен и Обгрижван живот чрез „Сензитивност,  разбиране и грижа“. Насладете се на по-високо качество на живот с LG Affectionate Intelligence, при което AI се дефинира отвъд изкуствения интелект, за да осигури топла и насочена към човека грижа.">
    <meta property="og:title" content="LG Affectionate Intelligence | LG BG"/>
    <meta property="og:url" content="https://www.lg.com/bg/lg-ai">
    <meta property="og:description" content="LG AI се стреми към Възхитителен, Безпроблемен и Обгрижван живот чрез „Сензитивност,  разбиране и грижа“. Насладете се на по-високо качество на живот с LG Affectionate Intelligence, при което AI се дефинира отвъд изкуствения интелект, за да осигури топла и насочена към човека грижа."/>
    <meta property="og:image" content="">
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/head-css.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/font-woff.jsp"/>
    <!-- // default code -->
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/mic-head-script.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/gateway-foresee.jsp"/>

    <!-- your -->
    <link href="./lg-ai/common/css/ai-gate-reset.css" rel="stylesheet" type="text/css">
    <link href="./lg-ai/common/css/ai-gate-font.css" rel="stylesheet" type="text/css">
    <link href="./lg-ai/common/css/ai-gate-swiper-bundle.min.css" rel="stylesheet" type="text/css">
    <link href="./lg-ai/assets/css/ai-gate-css.css" rel="stylesheet" type="text/css">

    <script src="./lg-ai/common/js/ai-gate-swiper-bundle.min.js"></script>
    <script src="./lg-ai/assets/js/ai-gate-js-layer.js" defer=""></script>
    <script src="./lg-ai/assets/js/ai-gate-js-common.js" defer=""></script>

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
    <meta itemprop="description" content="LG AI се стреми към Възхитителен, Безпроблемен и Обгрижван живот чрез „Сензитивност,  разбиране и грижа“. Насладете се на по-високо качество на живот с LG Affectionate Intelligence, при което AI се дефинира отвъд изкуствения интелект, за да осигури топла и насочена към човека грижа."/>
    <meta itemprop="Keywords" content="LG AI, Affectionate Intelligence, Човекоцентричен изкуствен интелект, Платформа за интелигентен живот, Технологично напреднали решения"/>
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
<main>
      <div class="gate-container">
        <!-- S : kv-section -->
        <section class="kv-section">
          <div class="inner">
            <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-kv-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-kv-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-kv-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-kv-mobile.png" aria-labelledby="kv-video-description">
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Една жена преминава, когато светлината се включва автоматично. На екрана се появява надпис „Сензитивност“.
Мъж и жена се прегръщат, когато се активира високоговорителят на XBOOM, придружен от думата  „Разбиране“.
Мъж седи тъжно на шофьорската седалка. Появява се логото на LG AI с надпис "Грижа".
По телевизията се излъчва футболен мач. LG AI реагира с гласово взаимодействие. Отдолу се показва фразата „За вашия възхитителен живот“.
XBOOM, телевизорът и семейство, седнало на дивана с кучето си, се появяват в един кадър.
Майка и син използват заедно пералната машина. Появява се фразата „За вашия безпроблемен живот“.
Сцените на майката и сина, близък план на AI Wash и мъж, който използва лаптопа LG gram, се наслагват в един кадър, като се появява фразата „За безпроблемен живот“.
Мъж и жена седят на предните седалки на автомобил. Логото на LG AI се появява между тях, заедно с фразата „За вашия живот с грижа“.
Човек влиза в офис с кучето си. Пречиствателят на въздуха се включва.
Финален кадър: бял фон с логото на LG AI и фразата „Интелегентност с грижа за ВАС“.</h1>
            <button type="button" class="play-btn" aria-label="Play video"></button>
            </div>
          </div>
        </section>
        <!-- E : kv-section -->
        <!-- S : overview-section -->
        <section class="overview-section">
          <div class="inner">
            <picture>
              <source media="(min-width: 768px)" srcset="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-desktop.svg">
              <source media="(max-width: 767px)" srcset="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg">
              <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="LG AI logo" class="ai-logo" data-tp="alt">
            </picture>
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Affectionate Intelligence</span> за ВАС</h2>
            <p class="text" data-tp="copy">В LG си задаваме въпроса: за какво трябва да съществува AI? <br>
              След дълъг размисъл намерихме своя отговор. <br><br>
              За нас AI е нещо повече от изкуствен интелект - това е интелигентност с обич и грижа. <br><br>
              Тъй като AI става част от нашето ежедневие, <br>
              той трябва да помогне за създаването на по-добър живот, който всички заслужаваме. <br><br>
              Ето защо AI на LG започва с обич към ВАС чрез <br>
              сензитивност и разбиране, както и грижа за живота ви.
              <strong>Открий как животът е хубав с  LG AI</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Превъртете надолу иконата" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Прекрасен живот</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Безпроблемен живот</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Живот с грижа</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI разбира вашия живот и надгражда преживяванията, за да създаде  живот, изпълнен с прекрасни моменти.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Мъж и жена седят на дивана и гледат футболно предаване на телевизор LG в хола. 
Сцената се премества и мъжът и жената се прегръщат.
Камерата се фокусира върху LG XBOOM до тях.</span>
                      <h3 class="video-title" data-tp="copy">За вашия прекрасен живот</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/oled-evo" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="LG OLED evo AI продукти- фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/oled-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="LG OLED AI продукти -фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/qned-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="LG QNED AI продукти- фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/nanocell-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="LG NanoCell AI продукти- фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-1 -->
                <!-- S : tab-panel tab-2 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-2" id="product-panel-2" hidden="">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI усеща вашите нужди и представя решения, чрез които да направи живота ви безгрижен и според избрания ритъм.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Майка и син използват заедно пералнята с LG AI, като завъртат копчето, за да активират функцията AI Wash. В същата сцена се появява мъж, който използва лаптоп LG gram.</span>
                      <h3 class="video-title" data-tp="copy">За вашия  безпроблемен живот</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/lg-washtower" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products01.png" alt="LG WashTower AI продукт- фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/peralni-mashini/lg-f4wr513sbw" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="LG Washing Machine AI продукт- фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/hladilnitzi/lg-gsgv81pyll" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="LG InstaView AI продукт- фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-2 -->
                <!-- S : tab-panel tab-3 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-3" id="product-panel-3" hidden="">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI се грижи за вас, вашето пространство и за планетата, за да направи живота ви безгрижен.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">В офиса влиза мъж с каишка за куче. Мъжът на шофьорската седалка изглежда тъжен, когато LG AI му показва семейна снимка. Дисплеят на автомобила е показан в близък план, докато LG AI изважда карта и се връща към спомен.</span>
                      <h3 class="video-title" data-tp="copy">За вашия живот с грижа</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/bg/klimatichna-tehnika/lg-p12snd" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products01.png" alt="LG DUALCOOL AI продукт с фронтален изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="ADAS vision система със страничен изглед" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Взаимодействие на потребителя със сензорен интерфейс, задвижван от мултимодално HMI решение с изкуствен интелект, избор на меню за кафе с подкана от асистент с изкуствен интелект." loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Научете повече</span>
                        </a>
                      </li>
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-3 -->
              </div>
              <!-- E : panel-container -->
            </div> 
          </div>
        </section>
        <!-- E : product-section -->
        <!-- S : feature-section -->
        <section class="feature-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="feature-panel-1" id="feature-tab-1" data-tp="copy">ТВ</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-2" id="feature-tab-2" data-tp="copy">Аудио</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Бяла техника</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Климатична техника</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-5" id="feature-tab-5" data-tp="copy"></button>
              </div>
              <!-- E : tab-list -->
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-1" id="feature-panel-1">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy"><picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="ТВ" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Развива се, за да задоволи вашите предпочитания за забавление</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Телевизорът с изкуствен интелект на LG научава предпочитанията ви за гледане и разбира начина ви на живот, за да оптимизира всеки аспект на телевизионното ви изживяване, създавайки идеално персонализирано забавление точно за вас.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Над LG Magic Remote се показват функции като AI Chatbot, AI Picture Wizard и AI Sound Wizard." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Запознайте се със следващо поколение <br>
                          LG AI TV</h3>
                        <a href="https://www.lg.com/bg/televizori/ai-tv" class="white-btn" data-tp="copy link">Научете повече</a>
                      </div>
                    </div>
                    <!-- E : tab-panel-banner -->
                    <!-- S : tab-panel-slide -->
                    <div class="tab-panel-slide">
                      <div class="swiper products-textbx-thumbbx">
                        <div class="slide-controller">
                          <div class="swiper-pagination"></div>
                          <button class="swiper-button-prev slide-btn" aria-label="Previous slide"></button>
                          <button class="swiper-button-next slide-btn" aria-label="Next slide"></button>
                        </div>
                        <div class="swiper-wrapper">
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Научно-фантастично съдържание се възпроизвежда на екрана на OLED телевизор LG. В лявата част на екрана е разположен интерфейсът на AI Chatbot. Потребителят съобщава на чатбота, че екранът е твърде тъмен, и чатботът предлага решения на искането." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Chatbot</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Жена пее с микрофон със слушалки, с LG α11 AI Processor за подобряване на звука" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Picture/Sound Wizard</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Две свързани сцени с LG AI Magic Remote пред телевизор - първата показва научнофантастична сцена, а втората - начален екран с персонализирано съдържание" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Magic Remote</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Функциите с изкуствен интелект на LG използват обучени алгоритми, базирани на дълбоко обучение, за увеличаване на мащаба на изображенията и смесване на звука в реално време.</li>
                      <li data-tp="copy">**Всички телевизори LG webOS 24 разполагат с функция AI Customization, с изключение на тези без сензори за светлина.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-1 -->
                <!-- S : panel tab-2 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-2" id="feature-panel-2">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy"><picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="Аудио" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Звук, който звучи по най-правилния начин</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG xboom AI анализира и настройва звука, за да отговаря на жанра и пространството. Чрез AI осветлението, което подобрява обстановката и хармонизира с музиката, можете да се насладите на звук и атмосфера по уникален начин.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Жена и мъж се прегръщат в хола, а до тях е включен високоговорителят на XBOOM." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Наслаждавайте се на ново звуково преживяване с <br>
                          LG xboom AI</h3>
                        
                      </div>
                    </div>
                    <!-- E : tab-panel-banner -->
                    <!-- S : tab-panel-slide -->
                    <div class="tab-panel-slide">
                      <div class="swiper products-textbx-thumbbx">
                        <div class="slide-controller">
                          <div class="swiper-pagination"></div>
                          <button class="swiper-button-prev slide-btn" aria-label="Previous slide"></button>
                          <button class="swiper-button-next slide-btn" aria-label="Next slide"></button>
                        </div>
                        <div class="swiper-wrapper">
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="LG XBOOM говорител с AI звукови режими включва Bass Boost, Voice Enhance и Standard." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Звук</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="LG XBOOM говорител с AI осветелние, което се адаптира към глас, околна среда и парти режим. " data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Осветление</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="Високоговорител LG XBOOM, поставен на маса в стая в червени тонове, със стени с решетъчни шарки и модерни мебели." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Калибриране</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Този продукт все още не е наличен</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-2 -->
                <!-- S : panel tab-3 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-3" id="feature-panel-3">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy"><picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="Бяла техника" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Освобождаване от обемите пране</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG WashTower AI разпознава какво перете, за да осигури оптимизирано изпиране за чувствителни тъкани, като ви гарантира, че без усилие ще усъвършенствате всяко зареждане, всеки път.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="Вградени пералня и сушилня LG в модерно перално помещение с дървени шкафове и пейки за сядане." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Открийте нов начин на живот с <br>
                          LG AI Core Tech</h3>
                        <a href="https://www.lg.com/bg/peralni-mashini/lg-aidd" class="white-btn" data-tp="copy link">Научете повече</a>
                      </div>
                    </div>
                    <!-- E : tab-panel-banner -->
                    <!-- S : tab-panel-slide -->
                    <div class="tab-panel-slide">
                      <div class="swiper products-textbx-thumbbx">
                        <div class="slide-controller">
                          <div class="swiper-pagination"></div>
                          <button class="swiper-button-prev slide-btn" aria-label="Previous slide"></button>
                          <button class="swiper-button-next slide-btn" aria-label="Next slide"></button>
                        </div>
                        <div class="swiper-wrapper">
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Ръчно регулиране на цикъла на пране AI на пералната машина LG с помощта на интелигентен контролен диск" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Пране</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Потребител, който избира AI Dry цикъл на сушилнята LG с помощта на цифровия контролен диск." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Сушене</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Този продукт ще бъде пуснат поетапно в избрани страни.</li>
                      <li data-tp="copy">**Активира се сензорът за AI, когато товарът е под 6 kg.</li>
                      <li data-tp="copy">***Измиването с AI трябва да се използва само с подобни видове тъкани [не всички тъкани се разпознават] и подходящ перилен препарат.</li>
                      <li data-tp="copy">****AI Dry се предлага само за зареждания под 5 кг с тъкани със същите нива на абсорбция на влага.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-3 -->
                <!-- S : panel tab-4 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-4" id="feature-panel-4">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy"><picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" alt="Климатична техника" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Комфорт с перфектно охлаждане</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG DUALCOOL AI се грижи за оптимален въздух, като ви осигурява комфорт и същевременно оптимизира енергийната ефективност, за да спести разходи. С LG AI Air се наслаждавайте на перфектно охлаждане за вашия комфорт.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="Инверторният климатик LG DUAL охлажда модерна всекидневна, в която жена е седнала на дивана, благодарение на технологията ThinQ AI." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Оптимизиран комфорт с <br>
                          LG AI Air</h3>
                        
                      </div>
                    </div>
                    <!-- E : tab-panel-banner -->
                    <!-- S : tab-panel-slide -->
                    <div class="tab-panel-slide">
                      <div class="swiper products-textbx-thumbbx">
                        <div class="slide-controller">
                          <div class="swiper-pagination"></div>
                          <button class="swiper-button-prev slide-btn" aria-label="Previous slide"></button>
                          <button class="swiper-button-next slide-btn" aria-label="Next slide"></button>
                        </div>
                        <div class="swiper-wrapper">
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Жена релаксира в смарт всекидневна, докато климатикът LG AI автоматично регулира температурата, въздушния поток и влажността." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Въздух</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="Интерфейс на смартфон, показващ графика на потреблението на енергия пред климатик LG, с подчертан AI kW Manager за ефективен мониторинг на енергията." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI kW Manager</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*AI Air може да се управлява с дистанционно управление и ThinQ.</li>
                      <li data-tp="copy">**AI Air се предлага в режими на охлаждане и отопление.</li>
                      <li data-tp="copy">***По време на използване на AI Air обемът на въздуха и посоката на вятъра се регулират автоматично в зависимост от ситуацията, а AI Air се изключва при промяна на посоката на вятъра.</li>
                      <li data-tp="copy">****Когато AI Air е активиран, радарният сензор открива местоположението на обекта и автоматично активира директния/непосредствения вятър.</li>
                      <li data-tp="copy">*****Разстоянието на засичане на радарния сензор е до 5 м, като е възможно да има разлики в разстоянието на засичане в зависимост от средата на инсталиране и използване на продукта.</li>
                      <li data-tp="copy">******Тази функция работи само с модели, които имат радарни сензори.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-4 -->
                <!-- S : panel tab-5 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-5" id="feature-panel-5">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy"></h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy"></p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" alt="" loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy"></h3>
                        
                      </div>
                    </div>
                    <!-- E : tab-panel-banner -->
                    <!-- S : tab-panel-slide -->
                    <div class="tab-panel-slide">
                      <div class="swiper products-textbx-thumbbx">
                        <div class="slide-controller">
                          <div class="swiper-pagination"></div>
                          <button class="swiper-button-prev slide-btn" aria-label="Previous slide"></button>
                          <button class="swiper-button-next slide-btn" aria-label="Next slide"></button>
                        </div>
                        <div class="swiper-wrapper">
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature01.png" alt="" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy"></p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature02.png" alt="" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy"></p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy"></li>
                      <li data-tp="copy"></li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-5 -->
              </div>
            </div>
          </div>
        </section>
        <!-- E : feature-section -->
        <!-- S : thinq-section (글로벌 사이트 / KR)-->
        <!-- <section class="thinq-section">
          <div class="inner">
            <h2 class="thinq-section-title">Always ON for a better home</h2>
            <div class="banner">
              <div class="video-bx responsive-video" 
                  data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-thinq-on-banner-desktop.mp4" 
                  data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-thinq-on-banner-mobile.mp4"
                  data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-thinq-on-banner-desktop.png" 
                  data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-thinq-on-banner-mobile.png" 
                  aria-labelledby="thinq-on-banner-video-description">
                  <span id="thinq-on-banner-video-description" class="a11y-text">In a dark living room, the Stanby Me TV turns on with a "Good Morning" message. A puppy walks by as the TV displays the weather and time. The room brightens as curtains open automatically, and a man and woman rise from bed. A mother and her child rush out the door while LG ThinQ ON AI adjusts the home environment—turning off lights, lowering the temperature, and locking the doors automatically.</span>
                  <a href="javascript:void(0)" class="white-btn">Learn More</a>
                  <button type="button" class="play-btn" aria-label="Play video"></button>
                </div>
            </div>
            !-- S : thinq-flex-bx --
            <div class="flex-bx">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-on-feature01.png" alt="The LG ThinQ ON AI voice assistant device sits on a coffee table in a smart living room, with a glowing LED ring." loading="lazy">
                  <figcaption>
                    * This product is not availble yet.
                  </figcaption>
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title">LG AI Voice Assistant</h3>
                <p class="text">Easy voice control for your devices, daily assistance, and mood setting.</p>
              </div>
            </div>
            !-- E : thinq-flex-bx --
            !-- S : thinq-flex-bx --
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-on-feature02.png" alt="Smart living room powered by LG AI with animated LG AI logo and ThinQ ON AI device managing lighting, temperature, and connected devices" loading="lazy">
                  <figcaption>
                    * This product is not availble yet.
                  </figcaption>
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title">Smart Living with LG AI</h3>
                <p class="text">Optimal connections and upgrades for the devices in your space for smart life care</p>
              </div>
            </div>
            !-- E : thinq-flex-bx --
          </div>
        </section> -->
        <!-- E : thinq-section (글로벌 사이트 / KR)-->
        <!-- S : thinq-section (Local)-->
        <section class="thinq-section">
          <div class="inner">
            <h2 class="thinq-section-title" data-tp="copy">ThinQ® прави управлението да се случва лесно</h2>
            <p class="thinq-section-text" data-tp="copy">Приложение за вашите интелигентни уреди и устройства, LG ThinQ предоставя контрол и удобство на ръка разстояние, за да ви помогне да опростите живота си и да се наслаждавате на домашния уют.</p>
            <a href="https://www.lg.com/bg/elektrodomakinski-uredi/thinq" class="white-btn" data-tp="copy link">Научете повече</a>
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Човек държи смартфон, в който е отворено приложението LG ThinQ, и управлява  домашни устройства, докато пие кафе." loading="lazy" data-tp="alt">  
              </picture>
            </div>
            <!-- S : youtube-video-list -->
            <div class="youtube-video-list">
              <div class="swiper">
                <div class="swiper-wrapper">
                  <!-- S : swiper-slide01 -->
                  <div class="swiper-slide">
                    <button class="video-btn" type="button" data-src="TvFhuqvQLYI" aria-label="Play video">
                      <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb01.jpg" alt="" aria-hidden="true">
                    </button>
                  </div>
                  <!-- E : swiper-slide01 -->
                  <!-- S : swiper-slide02 -->
                  <div class="swiper-slide">
                    <button class="video-btn" type="button" data-src="iQyFMATSUDU" aria-label="Play video">
                      <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb02.jpg" alt="" aria-hidden="true">
                    </button>
                  </div>
                  <!-- E : swiper-slide02 -->
                  <!-- S : swiper-slide03 -->
                  <div class="swiper-slide">
                    <button class="video-btn" type="button" data-src="W6pXClCE3P4" aria-label="Play video">
                      <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb03.jpg" alt="" aria-hidden="true">
                    </button>
                  </div>
                  <!-- E : swiper-slide03 -->
                  <!-- S : swiper-slide04 -->
                  <div class="swiper-slide">
                    <button class="video-btn" type="button" data-src="oEuZqLxQrUY" aria-label="Play video">
                      <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb04.jpg" alt="" aria-hidden="true">
                    </button>
                  </div>
                  <!-- E : swiper-slide04 -->
                  <!-- S : swiper-slide05 -->
                  <div class="swiper-slide">
                    <button class="video-btn" type="button" data-src="UFRyOs-6h5s" aria-label="Play video">
                      <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb05.jpg" alt="" aria-hidden="true">
                    </button>
                  </div>
                  <!-- E : swiper-slide05 -->
                </div>
                <div class="swiper-controller">
                  <div class="swiper-button-prev slide-btn"></div>
                  <div class="swiper-pagination"></div>
                  <div class="swiper-button-next slide-btn"></div>
                </div>
              </div>
            </div>
            <!-- E : youtube-video-list -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Смартфонът показва приложението LG ThinQ за управление на фурната LG InstaView Slide-In Range, което позволява ефективна поддръжка на продукта в кухнята." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Ефективна продуктова поддръжка</h3>
                <p class="text" data-tp="copy">Чрез приложението LG ThinQ проверявайте своя уред от LG, изтегляйте нови цикли, наблюдавайте използването  и много други.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">Повече за LG Affectionate Intelligence</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="LG Electronics поддържа акредитация за киберсигурност с графика за цифрова сигурност. " loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG укрепва лидерството си в областта на киберсигурността с акредитацията на KOLAS за тестване на киберсигурността на IoT.</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">Научете повече</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Посетители разглеждат извития LED дисплей на LG, представящ слогана „Life's Good 24/7“ на технологично изложение." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG представя на CES 2025 най-новите си иновации, задвижвани от „Аffectionate Intelligence“</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">Научете повече</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Говорител, който представя B2B решения с изкуствен интелект на сцената на събитие на LG." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG представя един ден от живота с „Аffectionate Intelligence“ на световната премиера на LG</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn" data-tp="copy link">Научете повече</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
        </section>
        <!-- E : stories-section -->
        <!-- S : layer-popup -->
        <!-- <div class="products-layer" role="dialog" aria-hidden="true" aria-modal="true" tabindex="-1">
          <div class="products-layer-conbx">
            <div class="products-layer-header">
              <div class="products-layer-header-title-bx">
                <h2 class="products-layer-header-title-bx-title heading"></h2>
              </div>
              <a href="javascript:void(0)" class="products-layer-header-close" role="button" aria-label="colse">close</a>
            </div>
            <div class="products-layer-content">
              <div class="products-layer-content-txtwrap">
                <div class="products-layer-content-txtwrap-txtbx">
                  <h3 class="products-layer-content-txtwrap-txtbx-title heading"></h3>
                  <p class="products-layer-content-txtwrap-txtbx-desc"></p>
                </div>
              </div>
              <div class="products-layer-content-swiper swiper">
                <div class="products-layer-content-swiper-wrapper swiper-wrapper"></div>
              </div>
              <div class="products-layer-content-thumbbx">
                <div class="products-layer-content-thumb-swiper-btn-prev"></div>
                <div class="products-layer-content-thumb-swiper swiper">
                  <div class="products-layer-content-thumb-swiper-wrapper swiper-wrapper"></div>
                </div>
                <div class="products-layer-content-thumb-swiper-btn-next"></div>
              </div>
            </div>
          </div>
        </div> -->
        <!-- E : layer-popup -->
      </div>
    </main>
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
