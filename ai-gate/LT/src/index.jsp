<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Jautrus intelektas | LG LT</title>
    <meta name="Keywords" content="LG DI, jautrus intelektas, į žmogų orientuotas DI, išmaniojo gyvenimo platforma, technologiškai pažangūs sprendimai">
    <meta name="Description" content="„LG AI“ siekia jūsų žavingo, lengvo ir gerai prižiūrimo gyvenimo per „išmintingą pojūtį, gilų supratimą, šiltą rūpestį“. Patirkite aukštesnę gyvenimo kokybę su „LG Affectionate Intelligence“, kur DI peržengia dirbtinio intelekto ribas ir teikia šiltą, į žmogų orientuotą priežiūrą.">
    <meta property="og:title" content="LG Jautrus intelektas | LG LT"/>
    <meta property="og:url" content="https://www.lg.com/lt/lg-ai">
    <meta property="og:description" content="„LG AI“ siekia jūsų žavingo, lengvo ir gerai prižiūrimo gyvenimo per „išmintingą pojūtį, gilų supratimą, šiltą rūpestį“. Patirkite aukštesnę gyvenimo kokybę su „LG Affectionate Intelligence“, kur DI peržengia dirbtinio intelekto ribas ir teikia šiltą, į žmogų orientuotą priežiūrą."/>
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
    <meta itemprop="description" content="„LG AI“ siekia jūsų žavingo, lengvo ir gerai prižiūrimo gyvenimo per „išmintingą pojūtį, gilų supratimą, šiltą rūpestį“. Patirkite aukštesnę gyvenimo kokybę su „LG Affectionate Intelligence“, kur DI peržengia dirbtinio intelekto ribas ir teikia šiltą, į žmogų orientuotą priežiūrą."/>
    <meta itemprop="Keywords" content="LG DI, jautrus intelektas, į žmogų orientuotas DI, išmaniojo gyvenimo platforma, technologiškai pažangūs sprendimai"/>
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
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Moteris praeina pro šalį, kai automatiškai įsijungia šviesa. Ekrane pasirodo užrašas „Išmintingai jaučiame“.
Vyras ir moteris apsikabina, kai įsijungia „XBOOM“ garsiakalbis, kartu išgirstama frazė „Giliai suprantame“.
Vyras liūdnai sėdi vairuotojo vietoje. Pasirodo „LG AI“ logotipas su užrašu „Šiltai rūpinuosi“.
Per televizorių rodomos futbolo rungtynės. „LG AI“ atsako balso sąveika. Žemiau rodoma frazė „Už jūsų malonų gyvenimą“.
Viename kadre matomi „XBOOM“, televizorius ir šeima, sėdinti ant sofos su savo šunimi.

Motina ir sūnus kartu naudojasi skalbimo mašina. Pasirodo frazė „Už jūsų lengvą gyvenimą“.

Motinos ir sūnaus, AI skalbimo mašinos ratuko stambus planas ir vyro, naudojančio „LG gram“ nešiojamąjį kompiuterį, scenos sudėliotos į vieną kadrą su užrašu „Už jūsų lengvą gyvenimą“.
Vyras ir moteris sėdi automobilio priekinėse sėdynėse. Tarp jų rodomas „LG AI“ logotipas ir užrašas „Už jūsų gerai prižiūrimą gyvenimą“.
Žmogus įeina į biurą su savo šunimi. Oro valytuvas įsijungia reaguodamas.
Paskutinis kadras: baltas fonas su LG dirbtinio intelekto logotipu ir užrašu „Meilus intelektas JUMS“.</h1>
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
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Jautrus intelektas</span> JUMS</h2>
            <p class="text" data-tp="copy">„LG“ kompanijoje mes savęs klausėme: kam turėtų egzistuoti dirbtinis intelektas? <br>
              Po ilgų apmąstymų radome atsakymą. <br><br>
              Mums dirbtinis intelektas yra daugiau nei dirbtinis intelektas – tai jautrus intelektas. <br><br>
              Dirbtiniui tapus mūsų kasdienio gyvenimo dalimi, <br>
              jis turėtų padėti kurti geresnį gyvenimą, kurio visi nusipelnėme. <br><br>
              Štai kodėl „LG“ dirbtinis intelektas prasideda nuo JŪSŲ – per meilų pojūtį ir supratimą, <br>
              toliau rūpinantis jūsų gyvenimu.
              <strong>Atraskite, koks gyvenimas geras su LG dirbtiniu intelektu</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Slinkimo žemyn piktograma" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Nuostabus gyvenimas</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Gyvenimas be pastangų</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Gerai prižiūrimas gyvenimas</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">„LG AI“ supranta jūsų gyvenimą ir patobulina patirtį, kad jūsų gyvenimas būtų kupinas malonių akimirkų.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Vyras ir moteris sėdi ant sofos ir žiūri futbolo transliaciją per LG televizorių svetainėje. Vaizdas pasikeičia, vyras ir moteris apsikabina.
Kamera sufokusuoja šalia jų esantį LG XBOOM.</span>
                      <h3 class="video-title" data-tp="copy">Už jūsų džiaugsmingą gyvenimą</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/lt/oled-evo" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="„LG OLED evo AI“ gaminio priekinis vaizdas" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/lt/oled-televizoriai" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="LG OLED dirbtinio intelekto gaminio priekinis vaizdas" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/lt/qned-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="LG QNED dirbtinio intelekto gaminio priekinis vaizdas" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/lt/nanocell-televizoriai" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="„LG NanoCell“ dirbtinio intelekto gaminio priekinis vaizdas" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG dirbtinis intelektas jaučia jūsų poreikius ir siūlo sprendimus, kad jūsų gyvenimas sklandžiai tekėtų pagal jūsų ritmą.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Motina ir sūnus kartu naudojasi LG dirbtiniu intelektu valdoma skalbimo mašina ir pasuka ratuką, kad įjungtų dirbtinio intelekto skalbimą. Toje pačioje sekoje pasirodo vyras, naudojantis LG nešiojamąjį kompiuterį.</span>
                      <h3 class="video-title" data-tp="copy">Jūsų lengvam gyvenimui</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/lt/skalbimo-masinos/lg-wt1210bbf" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products01.png" alt="„LG WashTower“ dirbtinio intelekto gaminio priekinis vaizdas" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/lt/saldytuvai/lg-gmg960evee" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="LG InstaView dirbtinio intelekto gaminio priekinis vaizdas" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">„LG AI“ rūpinasi jumis, jūsų erdve ir planeta, kad jūsų gyvenimas būtų gerai prižiūrimas, būtent toks, kokio trokštate.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Vyras įeina į biurą laikydamas šuns pavadėlį. Vyras vairuotojo vietoje atrodo liūdnas, kai LG AI rodo jam šeimos nuotrauką. Automobilio ekranas rodomas stambaus plano režimu, kai LG AI atveria žemėlapį ir prisimena prisiminimą.</span>
                      <h3 class="video-title" data-tp="copy">Jūsų gerai prižiūrimam gyvenimui</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="ADAS vaizdo sistemos gaminio vaizdas iš šono" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Vartotojas sąveikauja su jutikliniu ekranu, kurį palaiko multimodalinis dirbtinio intelekto HMI sprendimas, renkasi kavos meniu su dirbtinio intelekto asistento raginimu" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Sužinokite daugiau</span>
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
                <button class="tab active" role="tab" aria-selected="true" aria-controls="feature-panel-1" id="feature-tab-1" data-tp="copy">TV</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-2" id="feature-tab-2" data-tp="copy">Audio</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Buitinė technika</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy"></button>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="LG AI TV" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Tobulėja, kad patenkintų visus jūsų pramogų poreikius</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">„LG AI TV“ išmoksta jūsų žiūrėjimo pageidavimus ir supranta jūsų gyvenimo būdą, kad optimizuotų kiekvieną jūsų televizijos žiūrėjimo patirties aspektą, sukurdamas idealiai suasmenintą pramogą tik jums.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Above the LG Magic Remote, features such as AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard, and AI Sound Wizard are displayed." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Susipažinkite su naujos kartos <br>
                           LG dirbtinio intelekto televizoriumi</h3>
                        <a href="https://www.lg.com/lt/televizoriai/ai-tv" class="white-btn" data-tp="copy link">Sužinokite daugiau</a>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="LG OLED televizoriaus ekrane rodomas „webOS 25“ pagrindinis puslapis, kuriame gausu programėlių ir pramoginio turinio. Šalia televizoriaus yra LG dirbtinio intelekto „Magic Remote“ nuotolinio valdymo pultas, kurio dirbtinio intelekto mygtukas paryškintas taip, tarsi būtų aktyvuotas naudotojo balsu. Šalia jo yra kalbos burbulas su užrašu „pasiūlykite filmą, kuris man patiktų“." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Voice ID</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="LG OLED televizoriaus ekrane rodoma, kaip veikia dirbtinio intelekto paieška. Atidarytas nedidelis pokalbių langas, kuriame rodoma, kaip vartotojas paklausė, kokie sporto žaidimai yra prieinami. Dirbtinio intelekto paieška atsakė per pokalbį ir rodydama skirtingo prieinamo turinio miniatiūras. Taip pat rodomas raginimas užduoti klausimą „Microsoft Copilot“." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Search</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="Naudojamas LG dirbtinio intelekto „Magic Remote“ nuotolinio valdymo pultas. Trumpai paspaudus dirbtinio intelekto mygtuką, OLED televizoriaus ekrane įjungiamas dirbtinio intelekto asistentas, kuris pasiūlo raktinius žodžius." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Concierge</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Mokslinės fantastikos turinys rodomas LG OLED televizoriaus ekrane. Kairėje ekrano pusėje yra dirbtinio intelekto pokalbių roboto sąsaja. Vartotojas praneša pokalbių robotui, kad ekranas per tamsus, o pokalbių robotas pasiūlo atsakymus į užklausą." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Chatbot</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Moteris, dainuojanti į mikrofoną su ausinėmis, paryškinta LG α11 dirbtinio intelekto procesoriaus garso stiprinimo funkcija" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Picture/Sound Wizard</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Dvi sujungtos scenos su LG dirbtinio intelekto „Magic Remote“ nuotolinio valdymo pultu priešais televizorių – pirmoje rodoma mokslinės fantastikos scena, antroje – pagrindinis ekranas su suasmenintu turiniu" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Magic Remote</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*„LG“ dirbtinio intelekto funkcijos naudoja giliojo mokymosi pagrindu parengtus algoritmus, skirtus vaizdo konvertavimui ir garso maišymui realiuoju laiku.</li>
                      <li data-tp="copy">**Visi „LG webOS 24“ televizoriai turi dirbtinio intelekto pritaikymo funkciją, išskyrus tuos, kurie neturi šviesos jutiklių.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="LG AI Audio" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Skamba išskirtinai teisingai</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">„LG xboom AI“ analizuoja ir pritaiko garsą prie žanro ir erdvės. Dirbtinio apšvietimo dėka, kuris pagerina atmosferą ir dera su jūsų muzika, galite mėgautis unikaliu garsu ir atmosfera.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Moteris ir vyras apsikabina svetainėje, šalia jų įjungtas XBOOM garsiakalbis." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Mėgaukitės nauja garso patirtimi <br>
                         su „LG xboom AI“</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="LG XBOOM garsiakalbis su dirbtinio intelekto garso režimais, įskaitant žemųjų dažnių stiprinimą, balso sustiprinimą ir standartinį" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Dirbtinio intelekto garsas</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="LG XBOOM garsiakalbis su dirbtinio intelekto apšvietimu, kuris prisitaiko prie balso, aplinkos ir vakarėlio režimų" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Dirbtinio intelekto apšvietimas</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="LG XBOOM garsiakalbis pastatytas ant stalo raudoname kambaryje su tinklelio rašto sienomis ir moderniais baldais" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">DI kalibravimas</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Šis produktas kol kas nėra prieinamas.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="Buitinė technika" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Palengvinkite kiekvieną savo naštą</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">„LG WashTower“ dirbtinis intelektas jaučia, ką skalbiate, kad optimizuotų skalbimą jautrių audinių priežiūrai ir užtikrintų, jog kiekvienas skalbimas būtų tobulas kiekvieną kartą.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="Įmontuojama LG skalbimo mašina ir džiovyklė modernioje skalbykloje su medinėmis spintelėmis ir suoliukais" loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Atraskite naują gyvenimo būdą <br>
                           su „LG AI Core Tech“</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Rankinis dirbtinio intelekto skalbimo ciklo reguliavimas LG skalbimo mašinoje naudojant išmanųjį valdymo ratuką" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Wash</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Vartotojas pasirenka AI džiovinimo ciklą LG džiovyklėje naudodamas skaitmeninį valdymo ratuką" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Dry</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Šis produktas bus palaipsniui pristatomas pasirinktose šalyse.</li>
                      <li data-tp="copy">**AI jutiklis įjungiamas, kai skalbinių svoris yra mažesnis nei 6 kg.</li>
                      <li data-tp="copy">***AI skalbimas turėtų būti naudojamas tik su panašiais audinių tipais [ne visi audiniai aptinkami] ir tinkamu skalbikliu.</li>
                      <li data-tp="copy">****AI džiovinimas galimas tik su skalbinių kiekiu iki 5 kg, kai audinių drėgmės sugėrimo lygis yra toks pat.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-3 -->
                <!-- S : panel tab-4 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-4" id="feature-panel-4">
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
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="" loading="lazy" data-tp="alt">
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy"></p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="" data-tp="alt">
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
                      <li data-tp="copy"></li>
                      <li data-tp="copy"></li>
                      <li data-tp="copy"></li>
                      <li data-tp="copy"></li>
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
            <h2 class="thinq-section-title" data-tp="copy">„ThinQ®“ padeda gyventi sklandžiai</h2>
            <p class="thinq-section-text" data-tp="copy">„ThinQ“ – tai platforma jūsų išmaniesiems LG prietaisams ir įrenginiams, suteikianti valdymą ir patogumą vos už kelių žingsnių, kad padėtų jums supaprastinti gyvenimą ir mėgautis namų jaukumu.</p>
            
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Asmuo laiko išmanųjį telefoną su atidaryta „LG ThinQ“ programėle, valdo išmaniuosius namų įrenginius ir geria kavą." loading="lazy" data-tp="alt">  
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
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="Šiuolaikinėje išmaniojoje virtuvėje moteris balso komanda įjungia skalbimo mašiną su „LG ThinQ AI“, o vyras fone skaito ant sofos." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Paprastas valdymas naudojant balso asistentą</h3>
                <p class="text" data-tp="copy">Pasakykite savo LG prietaisui, ko jums tiksliai reikia, tiesiog ištardami tai, o dirbtinio intelekto garsiakalbis išklausys ir patikrins ciklą, kad jums praneštų.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Išmaniajame telefone rodoma „LG ThinQ“ programėlė, valdanti „LG InstaView Slide-In Range“ orkaitę, leidžiančią efektyviai prižiūrėti gaminius virtuvėje." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Efektyvi gaminių priežiūra</h3>
                <p class="text" data-tp="copy">Naudodamiesi „LG ThinQ“ programėle, patikrinkite savo „LG“ prietaisą, atsisiųskite naujus ciklus, stebėkite ciklų naudojimą ir dar daugiau.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">Daugiau apie LG meilųjį intelektą</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="„LG Electronics“ vadovas laiko kibernetinio saugumo akreditacijos sertifikatą, fone – skaitmeninio saugumo grafika" loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG stiprina kibernetinio saugumo lyderystę, įgydama KOLAS daiktų interneto kibernetinio saugumo testavimo akreditaciją</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">Sužinokite daugiau</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Technologijų parodoje lankytojai apžiūri LG lenktą LED ekraną su šūkiu „Gyvenimas geras visą parą“" loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG Presents Its Latest Innovations Powered by "Affectionate Intelligence" at CES 2025</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">Sužinokite daugiau</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Pranešėjas LG renginyje scenoje pristato dirbtiniu intelektu pagrįstus B2B sprendimus" loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG pasaulinėje premjeroje pristato dieną su „meiliuoju intelektu“</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn" data-tp="copy link">Sužinokite daugiau</a>
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
