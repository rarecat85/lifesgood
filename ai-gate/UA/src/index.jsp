<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG Україна</title>
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, Людиноцентричний штучний інтелект, Платформа для розумного життя, Технологічні прогресивні рішення">
    <meta name="Description" content="LG AI створений для того, щоб зробити ваше життя приємним, легким і сповненим турботи - завдяки «Мудрому сприйняттю, Глибокому розумінню й Щирій турботі». Відкрийте для себе нову якість життя з LG Affectionate Intelligence - коли технологія виходить за межі штучного інтелекту, щоб дарувати справді людяну, теплу підтримку.">
    <meta property="og:title" content="LG Affectionate Intelligence | LG Україна"/>
    <meta property="og:url" content="https://www.lg.com/ua/lg-ai">
    <meta property="og:description" content="LG AI створений для того, щоб зробити ваше життя приємним, легким і сповненим турботи - завдяки «Мудрому сприйняттю, Глибокому розумінню й Щирій турботі». Відкрийте для себе нову якість життя з LG Affectionate Intelligence - коли технологія виходить за межі штучного інтелекту, щоб дарувати справді людяну, теплу підтримку."/>
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
    <meta itemprop="description" content="LG AI створений для того, щоб зробити ваше життя приємним, легким і сповненим турботи - завдяки «Мудрому сприйняттю, Глибокому розумінню й Щирій турботі». Відкрийте для себе нову якість життя з LG Affectionate Intelligence - коли технологія виходить за межі штучного інтелекту, щоб дарувати справді людяну, теплу підтримку."/>
    <meta itemprop="Keywords" content="LG AI, Affectionate Intelligence, Людиноцентричний штучний інтелект, Платформа для розумного життя, Технологічні прогресивні рішення"/>
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
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Жінка проходить повз — світло вмикається автоматично. На екрані з’являється напис: «Мудре сприйняття».
Чоловік і жінка ніжно обіймаються — вмикається колонка XBOOM, супроводжуючись фразою: «Глибоке розуміння».
Чоловік сумно сидить за кермом. Показується логотип LG AI з написом: «Щира турбота».
На телевізорі транслюється футбольний матч. LG AI відповідає на голосову команду. Знизу з’являється фраза: «Для вашого приємного життя».
В одному кадрі — XBOOM, телевізор і родина з собакою на дивані.
Мама разом із сином користуються пральною машиною. На екрані: «Для вашого легкого життя».
Крупні плани: мама з сином, панель керування AI Wash, чоловік за ноутбуком LG gram — все зливається в один кадр із написом: «Для вашого легкого життя».
Чоловік і жінка сидять на передніх сидіннях автомобіля. Між ними з’являється логотип LG AI та фраза: «Для життя, сповненого турботи».
Людина заходить до офісу разом із собакою — очищувач повітря вмикається автоматично.
Фінальний кадр: білий фон, логотип LG AI і фраза: «Affectionate Intelligence для ТЕБЕ».</h1>
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
              <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="логотип LG AI" class="ai-logo" data-tp="alt">
            </picture>
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Affectionate Intelligence</span> для ТЕБЕ</h2>
            <p class="text" data-tp="copy">У LG ми поставили собі запитання: заради чого існує штучний інтелект? <br>
              І після тривалих роздумів знайшли свою відповідь. <br><br>
              Для нас це не просто Штучний інтелект. Це Affectionate Intelligence. <br><br>
              Коли ШІ стає частиною нашого щоденного життя, <br>
              він має робити його кращим — таким, на яке ми справді заслуговуємо. <br><br>
              Саме тому LG AI починається з турботи про ВАС. <br>
              Він чуйний, глибоко розуміє і щиро дбає про ваше життя.
              <strong>Дізнайтесь, яким прекрасним може бути життя з LG AI</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Іконка прокручування вниз" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Комфортне життя</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Живи без турбот</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI розуміє ваше життя та перетворює щоденні моменти на джерело приємних вражень.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Чоловік і жінка сидять на дивані у вітальні та дивляться трансляцію футбольного матчу на телевізорі LG. Сцена змінюється — вони ніжно обіймаються.
Камера переміщується на колонку LG XBOOM поруч із ними.</span>
                      <h3 class="video-title" data-tp="copy">Для вашого комфортного життя</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/ua/televisions/lg-oled97g54lw" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="LG OLED evo AI зображення продукту спереду" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Дізнатися більше</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/ua/televisions/lg-oled65b56la" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="LG OLED AI зображення продукту спереду" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Дізнатися більше</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/ua/televisions/lg-86qned86a6a" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="LG QNED зображення продукту спереду" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Дізнатися більше</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/ua/televisions/lg-86nano81a6a" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="LG NanoCell зображення продукту спереду" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Дізнатися більше</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI знає ваші потреби та пропонує рішення, щоб ваше життя було легким і комфортним.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Мати та син разом користуються пральною машиною LG AI, повертаючи коліщатко, щоб активувати прання з AI. </span>
                      <h3 class="video-title" data-tp="copy">Для вашого безтурботного життя</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/ua/washing-machines/lg-f4v9rc9p" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="Пральна машина з LG AI зображення продукту спереду" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Дізнатися більше</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/ua/dryer-machines/lg-dc90v5v0w" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products03.png" alt="Сушильна машина з LG AI зображення продукту спереду" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Дізнатися більше</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/ua/refrigerators/lg-gc-q257cbfc" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="Холодильник InstaView з LG AI зображення продукту спереду" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Дізнатися більше</span>
                        </a>
                      </li>
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-2 -->
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
                <button class="tab active" role="tab" aria-selected="true" aria-controls="feature-panel-1" id="feature-tab-1" data-tp="copy">Телевізори</button>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="LG зі Штучним інтелектом" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Стає кращим, щоб створювати ще більше розваг саме для вас</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Телевізор LG зі Штучним інтелектом вивчає ваші вподобання у перегляді та розуміє ваш стиль життя, щоб оптимізувати кожен аспект та створити ідеальні персоналізовані розваги саме для вас.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Над пультом LG Magic Remote відображаються функції: AI Voice ID, Пошук з ШІ, ШІ Чат-бот, ШІ Консьєрж, AI Picture Wizard і AI Sound Wizard." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Зустрічайте наступне покоління телевізорів <br>
                          LG зі Штучним інтелектом</h3>
                        <a href="https://www.lg.com/ua/tvs-soundbars/ai-tv" class="white-btn" data-tp="copy link">Дізнатися більше</a>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="На екрані телевізора LG OLED — головна сторінка webOS 25 із застосунками та розважальним контентом. Поруч — пульт LG AI Magic Remote з підсвіченою кнопкою AI, ніби активованою голосом. Біля неї з’являється репліка: «Порекомендуй фільм, який мені сподобається»." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Voice ID</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="На екрані LG OLED  показано, як працює Пошук з ШІ. Відкрите невелике вікно чату, де користувач запитує про спортивні трансляції. ШІ відповідає через чат і показує мініатюри доступного контенту. Також з’являється підказка щодо запиту до Microsoft Copilot." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Пошук з ШІ</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="Використвовується пульт LG AI Magic Remote. Коротке натискання кнопки AI активує помічника на екрані OLED-телевізора, який пропонує ключові слова." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Консьєрж зі ШІ</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="На екрані LG OLED TV відтворюється фантастичний контент. Ліворуч — інтерфейс ШІ Чат-бота. Користувач пише, що зображення занадто темне, і чатбот пропонує рішення." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Чат-бот зі ШІ</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Жінка співає в мікрофон з навушниками. Підпис: покращення звуку за допомогою процесора LG α11 AI." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Picture/Sound Wizard</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Дві сцени з пультом LG AI Magic Remote перед телевізором: спочатку фантастичний сюжет, потім — головна сторінка з персоналізованим контентом." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Magic Remote</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Функції  Штучного інтелекту LG використовують алгоритми глибокого навчання для масштабування зображення та покращення звуку в режимі реального часу.</li>
                      <li data-tp="copy">**Усі телевізори LG webOS 24 підтримують AI Customization, окрім моделей без світлових сенсорів.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-1 -->
              </div>
            </div>
          </div>
        </section>
        <!-- E : feature-section -->
        <!-- S : thinq-section (Local)-->
        <section class="thinq-section">
          <div class="inner">
            <h2 class="thinq-section-title" data-tp="copy">ThinQ® допомагає робити життя краще</h2>
            <p class="thinq-section-text" data-tp="copy">Платформа для ваших розумних пристроїв і техніки LG — ThinQ дарує зручність і повний контроль під вашими пальцями, щоб ви могли спростити повсякденне життя та насолоджуватися домашнім комфортом.</p>
            <a href="https://www.lg.com/us/lg-thinq" class="white-btn" data-tp="copy link">Дізнатися більше</a>
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Людина тримає смартфон із відкритим додатком LG ThinQ і керує пристроями розумного дому, насолоджуючись чашкою кави." loading="lazy" data-tp="alt">  
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
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="У сучасній розумній кухні жінка запускає пральну машину голосовою командою через LG ThinQ AI, а на фоні чоловік читає на дивані." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Просте керування за допомогою голосового асистента</h3>
                <p class="text" data-tp="copy">Скажіть своїй техніці LG, що саме вам потрібно, і колонка зі Штучним інтелектом почує, перевірить цикл і повідомить вам потрібну інформацію.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="На екрані смартфона відкрито додаток LG ThinQ, за допомогою якого керують духовкою LG InstaView Slide-In Range — для зручного та ефективного обслуговування техніки на кухні." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Ефективне обслуговування пристроїв</h3>
                <p class="text" data-tp="copy">За допомогою додатку LG ThinQ ви можете перевіряти стан техніки LG, завантажувати нові цикли, відстежувати використання режимів та багато іншого.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">Більше про LG Affectionate Intelligence</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="Представник LG Electronics тримає сертифікат акредитації з кібербезпеки на фоні графіки з цифровою тематикою захисту" loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG посилює лідерство у сфері кібербезпеки, отримавши акредитацію KOLAS на тестування IoT-рішень щодо кіберзахисту</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">Дізнатися більше</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Відвідувачі оглядають вигнутий світлодіодний дисплей LG із гаслом «Life’s Good 24/7» на техновиставці" loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG представляє свої найновіші інновації на базі “Affectionate Intelligence” на виставці CES 2025</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">Дізнатися більше</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Доповідач презентує B2B-рішення на базі Штучного інтелекту зі сцени під час заходу LG" loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG презентує «День із Affectionate Intelligence» на прем’єрному показі LG World Premiere</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn" data-tp="copy link">Дізнатися більше</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
        </section>
        <!-- E : stories-section -->
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
