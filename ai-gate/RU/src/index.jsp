<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>Эмпатичный интеллект LG AI | LG RU</title>
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, эмпатичный интеллект, искусственный интеллект, передовые технологические решения">
    <meta name="Description" content="Когда технологии становятся частью нашей жизни, они должны помогать делать её лучше. Узнайте, как жизнь становится лучше с LG AI ">
    <meta property="og:title" content="Эмпатичный интеллект LG AI | LG RU"/>
    <meta property="og:url" content="https://www.lg.com/ru/lg-ai">
    <meta property="og:description" content="Когда технологии становятся частью нашей жизни, они должны помогать делать её лучше. Узнайте, как жизнь становится лучше с LG AI "/>
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
    <meta itemprop="description" content="Когда технологии становятся частью нашей жизни, они должны помогать делать её лучше. Узнайте, как жизнь становится лучше с LG AI "/>
    <meta itemprop="Keywords" content="LG AI, Affectionate Intelligence, эмпатичный интеллект, искусственный интеллект, передовые технологические решения"/>
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
            <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-kv-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-kv-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-kv-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-kv-mobile.png" aria-labelledby="kv-video-description">
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Женщина проходит мимо, и свет включается автоматически. На экране появляется фраза «Мудрое восприятие».
Мужчина и женщина обнимаются, активируется колонка XBOOM, сопровождаемая фразой «Глубокое понимание».
Мужчина с грустью сидит на водительском сиденье. Появляется логотип LG AI с фразой «Теплая забота».
По телевизору идёт футбольный матч. LG AI отвечает голосовым управлением. Ниже показана фраза «Для вашей жизни с удовольствием».
XBOOM, телевизор и семья, сидящая на диване с собакой, появляются в одном кадре.
Мать и сын вместе стирают в стиральной машине. Появляется фраза «Для вашей жизни без лишних забот».
Кадры матери и сына, крупный план циферблата AI Wash и мужчины за ноутбуком LG Gram накладываются друг на друга в один кадр с надписью «Для вашей жизни в комфорте».
Финальный кадр: белый фон с логотипом LG AI и надписью «Заботливый интеллект для ВАС».</h1>
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
              <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="Логотип LG AI" class="ai-logo" data-tp="alt">
            </picture>
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Эмпатичный интеллект</span> на службе человека </h2>
            <p class="text" data-tp="copy">Мы в LG задали себе вопрос: для чего предназначен  AI, искусственный интеллект? <br>
              После долгих размышлений и исследований мы нашли ответ. <br><br>
              Для нас AI — это больше, чем искусственный интеллект. Это эмпатичный интеллект. <br><br>
              Когда технологии становятся частью нашей жизни, <br>
              они должны помогать делать её лучше. <br><br>
              Именно поэтому LG AI начинается с вас, чуткораспознавая, <br>
              понимая и заботясь о вашем комфорте.
              <strong>Узнайте, как жизнь становится лучше с LG AI</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Иконка прокрутки вниз" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Жить с удовольствием</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Жить с удовольствием</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Жить с комфортом</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI понимает вашу жизнь и совершенствует впечатления, чтобы каждый момент был наполнен радостью.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Мужчина и женщина сидят на диване и смотрят футбольную трансляцию на телевизоре LG в гостиной. Сцена сменяется, и они обнимаются. Камера фокусируется на колонке LG XBOOM рядом с ними.</span>
                      <h3 class="video-title" data-tp="copy">Для жизни с удовольствием</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/ru/televisions/lg-oled65g5rla" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="Телевизор LG OLED evo AI вид спереди" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Узнать больше</span>
                        </a>
                      </li>
                      <!-- <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products05.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li> -->
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-1 -->
                <!-- S : tab-panel tab-2 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-2" id="product-panel-2" hidden="">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI понимает ваши потребности и предлагает оптимальные решения, чтобы жизнь протекала легко и гармонично, в вашем собственном ритме.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Мама и сын вместе пользуются стиральной машиной LG AI, поворачивая ручку для активации функции AI Wash. Появляется мужчина, использующий ноутбук LG gram.</span>
                      <h3 class="video-title" data-tp="copy">Для жизни без забот</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <!-- <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products01.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li> -->
                      <li class="product-item">
                        <a href="https://www.lg.com/ru/washing-machines/lg-f2v3hs6j" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="Стиральная машина LG Washing Machine AI, вид спереди" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Узнать больше</span>
                        </a>
                      </li>
                      <!-- <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products03.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li> -->
                      <li class="product-item">
                        <a href="https://www.lg.com/ru/refrigerators/lg-gc-x24ffcbb" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="Холодильник LG InstaView AI, вид спереди" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Узнать больше</span>
                        </a>
                      </li>
                      <!-- <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products05.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li> -->
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-2 -->
                <!-- S : tab-panel tab-3 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-3" id="product-panel-3" hidden="">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI заботится о людях, пространстве, окружающем вас, и всей планете, делая жизнь комфортнее.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Мужчина заходит в офис с собакой. Мужчина на водительском сиденье, LG AI показывает ему семейное фото. Дисплей автомобиля показан крупным планом, когда LG AI открывает карту.</span>
                      <h3 class="video-title" data-tp="copy">Для жизни с комфортом</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <!-- <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products01.png" alt="" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy"></span>
                        </a>
                      </li> -->
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="Система компьютерного зрения ADAS" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Узнать больше</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Пользователь взаимодействует с сенсорным интерфейсом, работающим на базе мультимодального AI HMI-решения." loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Узнать больше</span>
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
                <button class="tab active" role="tab" aria-selected="true" aria-controls="feature-panel-1" id="feature-tab-1" data-tp="copy">Телевизоры</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-2" id="feature-tab-2" data-tp="copy">Аудио</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Бытовая техника</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Кондиционеры воздуха</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-5" id="feature-tab-5" data-tp="copy">Ноутбуки</button>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="Телевизоры LG AI" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Постоянное развитие под ваши запросы</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Телевизоры LG AI изучают ваши предпочтения и стиль жизни, чтобы сделать просмотр ТВ максимально комфортным и персонализированным.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Над пультом LG Magic Remote отображаются такие функции, как AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard и AI Sound Wizard." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Встречайте новое поколение <br>
                          телевизоров LG AI</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="На экране телевизора LG OLED отображается главная страница webOS 25, заполненная приложениями и развлекательным контентом. Рядом с телевизором находится пульт LG AI Magic Remote, кнопка AI подсвечена так, как будто она активирована голосом пользователя. Рядом появляется облачко с текстом: «предложи фильм, который мне понравится»." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Распознавание речи</p>
                            <p class="slide-desc">Распознает голос конкретного пользователя и подстраивается под его предпочтения и настройки.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="Экран LG OLED TV показывает, как работает AI Search. Открыто небольшое окно чата, где пользователь спрашивает, какие спортивные игры доступны. AI-поиск отвечает через чат и отображает миниатюры доступного контента. Также появляется предложение задать вопрос Microsoft Copilot." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Поиск</p>
                            <p class="slide-desc">Ищет контент по смыслу запроса, понимает формулировки пользователя и подбирает релевантные результаты из доступных источников.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="Пульт LG AI Magic Remote в использовании. Краткое нажатие кнопки AI активирует AI-ассистента на экране OLED TV, который затем предлагает ключевые слова." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Консьерж</p>
                            <p class="slide-desc">Предлагает персонализированные рекомендации по контенту и настройкам на основе предпочтений пользователя.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="На экране LG OLED воспроизводится научно-фантастический контент. Слева отображается интерфейс AI-чата. Пользователь пишет в чат, что экран слишком тёмный, и чат-бот предлагает решения по запросу." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Чат-бот</p>
                            <p class="slide-desc">помогает с настройками и функциями ТВ, отвечает на простые вопросы***</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Женщина поёт в микрофон в наушниках, а улучшение звука с помощью AI-процессора LG α11 подчёркивает её голос." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Мастер звука и изображения</p>
                            <p class="slide-desc">помогает настроить звук и изображение под индивидуальное восприятие пользователя</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Две связанные сцены с LG AI Magic Remote перед телевизором — сначала показан фрагмент научной фантастики и экран с персонализированным контентом." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Пульт Magic Remote</p>
                            <p class="slide-desc">Позволяет управлять ТВ с помощью голоса и курсора-указки, обеспечивая быстрый и интуитивный доступ к смарт приложениям , функциям и настройкам ТВ.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">* Некорорые функции могут быть недоступны в вашем регионе и\или в вашей модели телевизора.</li>
                      <li data-tp="copy">** LG AI использует алгоритмы глубокого обучения для масштабирования изображения и микширования звука в режиме реального времени.</li>
                      <li data-tp="copy">*** Все телевизоры LG с webOS 24 поддерживают функцию настройки с помощью искусственного интеллекта, за исключением моделей без датчиков освещенности.</li>
                      <li data-tp="copy">**** Функция Copilot в AI Чат-бот недоступна на территории РФ.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="LG AI Аудио" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Ваш уникальный звук</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG XBOOM AI анализирует и настраивает звук в зависимости от жанра музыки и пространства, в котором находится колонка. Умная подсветка колонки создаёт атмосферу и синхронизируется с вашей музыкой, благодаря чему вы получаете уникальное сочетание звука и настроения.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Мужчина и женщина обнимаются в гостиной, рядом с ними стоит включенная колонка XBOOM." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Наслаждайтесь новым звуком <br>
                          с LG XBOOM AI</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="Акустическая система LG XBOOM с режимами звука на базе ИИ, включая Bass Boost, Voice Enhance и Standard." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Звук</p>
                            <p class="slide-desc">Автоматически подстраивает звучание под тип контента —делает басы глубже и добавляет объём</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="Акустическая система LG XBOOM с AI-подсветкой, которая адаптируется под голос, окружение и режим вечеринки." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Подсветка</p>
                            <p class="slide-desc">Световые полоски динамично реагируют на музыку, синхронизируясь с её ритмом и создавая атмосферу. </p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="Акустическая система LG XBOOM размещена на столе в комнате с красным оттенком, стенами с сетчатым узором и современной мебелью." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Калибровка</p>
                            <p class="slide-desc">Калибрует звук в зависимости от размера и формы пространства. Обеспечивает полноценное и чистое звучание без искажений</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">* Продукты и доступные функции или программы, представленные на веб-сайте, могут быть недоступны на территории РФ.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="LG AI Бытовая техника" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Облегчает ваши заботы</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG WashTower определяет тип загруженного белья и подбирает оптимальный алгоритм стирки, обеспечивая бережный уход за тканями. Каждая стирка становится проще и эффективнее.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="Стиральная и сушильная машины LG в современной прачечной" loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Откройте для себя новый образ жизни <br>
                          с LG AI Core Tech</h3>
                        <a href="https://www.lg.com/kz/lg-ai-core-tech/washing-machine-dryer/" class="white-btn" data-tp="copy link">Узнать больше</a>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Рука включает программу стирки с использованием ИИ на стиральной машине LG" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Интеллектуальная стирка AI Wash™</p>
                            <p class="slide-desc">Оптимизирует процесс стирки в зависимости от типа ткани</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Пользователь выбирает программу сушки AI Dry на сушильной машине LG" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Интеллектуальная сушка AI Dry™</p>
                            <p class="slide-desc">Оптимизирует процесс сушки в зависимости от типа ткани</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">* Продукты и доступные функции или программы, представленные на веб-сайте, могут различаться в зависимости от модели или региона/страны.</li>
                      <li data-tp="copy">** AI-распознавание активируется при загрузке до 6 кг.</li>
                      <li data-tp="copy">*** Программу AI Wash следует использовать только для тканей одного типа (распознаются не все ткани) и с подходящим моющим средством.</li>
                      <li data-tp="copy">**** Программа AI Dry доступна только для загрузки до 5 кг с тканями, имеющими одинаковый уровень впитывания влаги.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" alt="LG AI Кондиционеры воздуха" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Созданы для комфортного охлаждения</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG DUALCOOL AI поддерживает оптимальный микроклимат и обеспечивает комфортные условия и энергоэффективность, оптимизируя расходы на электроэнергию. LG AI Air обеспечивает прекрасное  охлаждение и максимальное удобство.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="Кондиционер LG DUAL Inverter охлаждает современную гостиную, где на диване сидит женщина." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Ощутите оптимальный комфорт <br>
                          с LG AI Air</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Женщина отдыхает в умной гостиной, пока кондиционер LG AI автоматически регулирует температуру, воздушный поток и влажность." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Управление воздухом AI Air</p>
                            <p class="slide-desc">Настраивает прямой или непрямой воздушный поток при обнаружении человека.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="Интерфейс смартфона с графиком энергопотребления на фоне кондиционера LG, демонстрирующий функцию «AI-менеджер кВт» для эффективного контроля мощности." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Менеджер энергопотребления</p>
                            <p class="slide-desc">Отслеживает потребление электроэнергии и активирует сберегающий режим при необходимости.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">* Функция AI Air доступна через пульт дистанционного управления и приложение ThinQ.</li>
                      <li data-tp="copy">** AI Air доступен как в режиме охлаждения, так и в режиме обогрева.</li>
                      <li data-tp="copy">*** При использовании AI Air объем воздуха и направление потока регулируются автоматически, а функция отключается при изменении направления потока.</li>
                      <li data-tp="copy">**** При активации AI Air датчик движения определяет местоположение человека и автоматически настраивает прямой или непрямой воздушный поток.</li>
                      <li data-tp="copy">***** Дальность обнаружения датчика движения — до 5 м, однако она может варьироваться в зависимости от условий установки и эксплуатации.</li>
                      <li data-tp="copy">****** Эта функция доступна только в моделях, оснащенных датчиком движения.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-4 -->
                <!-- S : panel tab-5 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-5" id="feature-panel-5">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy"><picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" alt="LG AI Ноутбуки" class="eyebrow-logo" loading="lazy">  
                      </picture>
                      Ваш источник энергии для всего, что вы делаете</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG gram AI помогает сделать вашу работу эффективнее во всех сферах. Безопасно находите, обрабатывайте и используйте информацию с помощью программы gram chat, поддерживаемый GPT-4o.*</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" alt="Женщина использует ноутбук LG gram с двумя экранами для видеоконференций и выполнения нескольких задач одновременно в своем домашнем офисе." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Откройте свои безграничные <br>
                          возможности с LG gram AI</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature01.png" alt="Ноутбук LG Gram с искусственным интеллектом на устройстве и интерфейсом умного помощника" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">gram Chat On-Device</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature02.png" alt="Ноутбук LG Gram с Cloud AI для онлайн-поддержки и повышения производительности" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">gram Chat Cloud</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">* В настоящее время, функции программы gram chat могут быть недоступны на территории РФ.</li>
                      <li data-tp="copy">** На начальных этапах использования продукта некоторые функции могут работать не совсем гладко. Это связано с особенностями искусственного интеллекта, встроенного в устройство, который требует времени на предварительное обучение, чтобы адаптироваться к пользователю. gram Chat On-Device требует индексирования задач для поиска контента на вашем ПК, объединяя слова с данными, что может занять некоторое время для получения желаемых результатов.</li>
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
            <h2 class="thinq-section-title" data-tp="copy"><span>ThinQ®</span> помогает создавать комфортную жизнь</h2>
            <p class="thinq-section-text" data-tp="copy">Важной составляющей интеллектуальных функций LG AI является платформа умного дома - LG ThinQ. Она позволяет управлять и автоматизировать работу умных устройств LG, упрощая жизнь и делая ее комфортнее.</p>
            <a href="https://www.lg.com/ru/lg-thinq" class="white-btn" data-tp="copy link">Узнать больше</a>
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Мужчина держит смартфон с открытым приложением LG ThinQ, управляя умными домашними устройствами и попивая кофе." loading="lazy" data-tp="alt">  
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
            <div class="flex-bx">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="На современной умной кухне женщина с помощью голосовой команды запускает стиральную машину с LG ThinQ AI, в то время как мужчина читает на диване." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Простой контроль с голосовым ассистентом</h3>
                <p class="text" data-tp="copy">Использование умных колонок с наиболее популярными голосовыми ассистентами позволяет управлять техникой голосом и получать информацию о текущем статусе прибора.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="На смартфоне отображается приложение LG ThinQ, управляющее духовым шкафом LG InstaView Slide-In Range." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Расширенные сервисные функции</h3>
                <p class="text" data-tp="copy">С помощью приложения LG ThinQ вы можете проверять состояние своей техники, загружать новые программы, отслеживать циклы работы и многое другое.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">Больше о Заботливом интеллекте LG</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="Руководитель LG Electronics держит сертификат аккредитации по кибербезопасности, на заднем плане — графика на тему цифровой безопасности." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">Как автоматизировать повседневные домашние задачи для большей эффективности?</p>
                                  <a href="https://www.lg.com/ru/lg-magazine/how-to/kak-avtomatizirovat-povsednevnye-domashnie-zadachi-dlya-bolshej-effektivnosti" class="white-btn" data-tp="copy link">Узнать больше</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Посетители технологической выставки смотрят на изогнутый светодиодный дисплей LG, демонстрирующий слоган «Life’s Good 24/7»." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG представляет инновации, основанные на "Заботливом интеллекте", на выставке CES 2025</p>
                                  <a href="https://www.lg.com/ru/lg-magazine/events/lg-predstavlyaet-innovaczii-osnovannye-na-empatichnom-intellekte-na-vystavke-ces-2025-lg-magazine" class="white-btn" data-tp="copy link">Узнать больше</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Спикер на сцене представляет B2B-решения на базе искусственного интеллекта на мероприятии LG." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG представит решение на базе искуственного интеллекта для салона автомобиля на выстаке CES 2025</p>
                                  <a href="https://www.lg.com/ru/lg-magazine/events/lg-predstavit-reshenie-na-baze-iskusstvennogo-intellekta-dlya-salona-avtomobilya-na-vystavke-ces-2025" class="white-btn" data-tp="copy link">Узнать больше</a>
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
