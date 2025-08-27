<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG FI</title>
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, Ihmiskeskeinen tekoäly, Älykäs elämänalusta, Teknologiavetoiset ratkaisut">
    <meta name="Description" content="LG AI pyrkii tarjoamaan sinulle Iloisen, Vaivattoman ja Hyvin hoidetun elämän ”viisaasti aistimalla, syvästi ymmärtäen ja lämpimästi huolehtien.” Koe korkeampi elämänlaatu LG Affectionate Intelligencen avulla, jossa tekoäly menee tekoälyn perinteisten rajojen yli ja tarjoaa lämpimän, ihmiskeskeisen huolenpidon.">
    <meta property="og:title" content="LG Affectionate Intelligence | LG FI"/>
    <meta property="og:url" content="https://www.lg.com/fi/lg-ai">
    <meta property="og:description" content="LG AI pyrkii tarjoamaan sinulle Iloisen, Vaivattoman ja Hyvin hoidetun elämän ”viisaasti aistimalla, syvästi ymmärtäen ja lämpimästi huolehtien.” Koe korkeampi elämänlaatu LG Affectionate Intelligencen avulla, jossa tekoäly menee tekoälyn perinteisten rajojen yli ja tarjoaa lämpimän, ihmiskeskeisen huolenpidon."/>
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
    <meta itemprop="description" content="LG AI pyrkii tarjoamaan sinulle Iloisen, Vaivattoman ja Hyvin hoidetun elämän ”viisaasti aistimalla, syvästi ymmärtäen ja lämpimästi huolehtien.” Koe korkeampi elämänlaatu LG Affectionate Intelligencen avulla, jossa tekoäly menee tekoälyn perinteisten rajojen yli ja tarjoaa lämpimän, ihmiskeskeisen huolenpidon."/>
    <meta itemprop="Keywords" content="LG AI, Affectionate Intelligence, Ihmiskeskeinen tekoäly, Älykäs elämänalusta, Teknologiavetoiset ratkaisut"/>
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
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Nainen kävelee ohi, kun valo syttyy automaattisesti. Teksti "Aistien viisaasti" ilmestyy ruudulle.

Mies ja nainen halaavat, kun XBOOM-kaiutin aktivoituu. Mukana teksti "Ymmärtäen syvällisesti".

Mies istuu surullisena auton etupenkillä. LG AI -logo ilmestyy näkyviin tekstin "Huolehtien lämpimästi" kanssa.

Televisiosta näkyy jalkapallo-ottelu. LG AI reagoi ääniohjauksella. Teksti "Sinun ihastuttavaa elämääsi varten" näkyy alla.

XBOOM, televisio ja sohvalle koiransa kanssa istuva perhe näkyvät samassa kuvassa.

Äiti ja poika käyttävät pesukonetta yhdessä. Teksti "Sinun vaivatonta elämääsi varten" ilmestyy.

Kuvassa yhdistyvät kohtaukset äidistä ja pojasta, lähikuva AI Wash -säätimestä ja miehestä, joka käyttää LG gram -kannettavaa. Teksti "Sinun vaivatonta elämääsi varten" näkyy ruudulla.

Mies ja nainen istuvat auton etupenkeillä. LG AI -logo ilmestyy heidän väliinsä yhdessä tekstin "Sinun hyvin hoidettua elämääsi varten" kanssa.

Henkilö kävelee toimistoon koiransa kanssa. Ilmanpuhdistin käynnistyy automaattisesti.

Loppukuva: valkoinen tausta, LG AI -logo ja teksti "Välittävä älykkyys sinulle".</h1>
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
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Välittävä älykkyys</span> sinulle</h2>
            <p class="text" data-tp="copy">LG:llä olemme kysyneet itseltämme: miksi tekoälyn tulisi olla olemassa? <br>
              Pitkän pohdinnan jälkeen olemme löytäneet vastauksemme. <br><br>
              Meille tekoäly on enemmän kuin Artificial Intelligence – se on Välittävä älykkyys. <br><br>
              Kun tekoälystä tulee osa jokapäiväistä elämäämme, <br>
              sen tulisi auttaa luomaan paremman elämän, jonka me kaikki ansaitsemme. <br><br>
              Siksi LG AI alkaa sinusta välittäen – <br>
              havainnoiden ja ymmärtäen sekä huolehtien elämästäsi entistä enemmän.
              <strong>Löydä, kuinka Life’s Good LG AI:n kanssa</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Vieritä alas -ikoni" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Iloista elämää</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Vaivaton elämä</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Hyvin hoidettu elämä</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI ymmärtää elämäsi ja parantaa kokemuksia, jotta elämäsi olisi täynnä iloisia hetkiä.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Mies ja nainen istuvat sohvalla katsomassa jalkapallo-ottelua LG-televisiosta olohuoneessa. Kohtaus vaihtuu, ja he halaavat toisiaan. Kamera kohdistuu heidän vieressään olevaan LG XBOOM -kaiuttimeen.</span>
                      <h3 class="video-title" data-tp="copy">Iloista elämääsi varten</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/fi/oled-evo" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="LG OLED evo AI -tuotteen etunäkymä" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/fi/oled-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="LG OLED AI -tuotteen etunäkymä" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/fi/qned-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="LG QNED AI -tuotteen etunäkymä" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/fi/nanocell-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="LG NanoCell AI -tuotteen etunäkymä" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI tunnistaa tarpeesi ja tarjoaa ratkaisuja, jotka saavat elämäsi sujumaan vaivattomasti rytmisi mukaan.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Äiti ja poika käyttävät yhdessä LG AI -pesukonetta, kääntäen valitsinta aktivoidakseen AI Wash -toiminnon. Samassa jaksossa esiintyy myös mies, joka käyttää LG gram -kannettavaa.</span>
                      <h3 class="video-title" data-tp="copy">For your effortless life</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/fi/pyykinpesukoneet/lg-wt1210bbf" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products01.png" alt="LG WashTower AI -tuotteen etunäkymä" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/fi/kylmalaitteet/lg-gsgv81epll" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="LG InstaView AI -tuotteen etunäkymä" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI huolehtii sinusta, tilastasi ja planeetasta, jotta elämäsi olisi hyvin hoidettu juuri niin kuin toivot.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Mies kävelee toimistoon pitäen koiran talutushihnasta kiinni. Kuljettajana istuva mies näyttää surulliselta, kun LG AI näyttää hänelle perhekuvaa. Auton näyttö esitellään lähikuvassa, kun LG AI avaa kartan ja palaa muistoihin.</span>
                      <h3 class="video-title" data-tp="copy">Hyvin hoidetulle elämällesi</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="ADAS-näköjärjestelmän tuotteen sivunäkymä" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Käyttäjä käyttää multimodaalista AI-käyttöliittymäratkaisua sisältävää kosketusnäyttöä ja valitsee kahvilistan AI-avustajan ohjeistuksella." loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Lue lisää</span>
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
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-2" id="feature-tab-2" data-tp="copy">Ääni</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Kodinkoneet</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Ilmastointi</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-5" id="feature-tab-5" data-tp="copy">Laskenta</button>
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
                      Kehittyy täyttämään kaikki viihdetarpeesi</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG AI TV oppii katselutottumuksesi ja ymmärtää elämäntyylisi optimoidakseen jokaisen television käyttökokemuksen osa-alueen, luoden sinulle täydellisen, henkilökohtaisen viihteen.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="LG Magic Remote -kaukosäätimen yläpuolella näkyvät ominaisuudet, kuten AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard ja AI Sound Wizard." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Tutustu LG AI TV:n <br>
                          seuraavaan sukupolveen</h3><a href="https://www.lg.com/fi/televisiot/ai-tv" class="white-btn" data-tp="copy link">Lue lisää</a>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="LG OLED TV:n näytöllä on webOS 25 -kotisivu täynnä sovelluksia ja viihdesisältöä. TV:n vieressä on LG AI Magic Remote, jonka AI-painike on korostettu ikään kuin käyttäjän ääni olisi aktivoimassa sen. Puhekupla sanoo: ”ehdotatko minulle elokuvan, josta pidän”." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Voice ID</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="LG OLED TV -näyttö näyttää, miten AI Search toimii. Pieni chat-ikkuna on avoinna, ja käyttäjä on kysynyt, mitä urheilupelit ovat saatavilla. AI Search vastaa chatin kautta ja näyttää eri sisältöjen pikkukuvia. Näytöllä on myös kehotus kysyä Microsoft Copilotilta." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Search</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="LG AI Magic Remote on käytössä. Lyhyt painallus AI-painikkeesta aktivoi OLED TV:n näytöllä AI-avustajan, joka ehdottaa avainsanoja." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Concierge</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Sci-fi-sisältöä toistetaan LG OLED TV:n näytöllä. Näytön vasemmalla puolella näkyy AI Chatbot -käyttöliittymä. Käyttäjä kertoo chatbotille, että näyttö on liian tumma, ja chatbot tarjoaa ratkaisuja ongelmaan." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Chatbot</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Nainen laulaa mikrofonin kanssa kuulokkeet päässään, korostettuna LG α11 AI Processorin äänentoiston parannuksella." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Picture/Sound Wizard</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Kaksi peräkkäistä kohtausta, joissa LG AI Magic Remote on television edessä — ensin scifi-kohtaus, toisessa henkilökohtaisen sisällön kotinäyttö." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Magic Remote</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*LG AI -ominaisuudet käyttävät syväoppimiseen perustuvia koulutettuja algoritmeja reaaliaikaiseen kuvan skaalaamiseen ja äänen monikanavointiin.</li>
                      <li data-tp="copy">**Kaikissa LG webOS 24 -televisioissa on AI Customization -toiminto, paitsi niissä, joissa ei ole valotunnistinta.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="LG AI Ääni" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Ääni juuri oikeanlainen</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG xboom AI analysoi ja säätää ääntä sopimaan genreeseen ja tilaan. AI-valaistus korostaa tunnelmaa ja sointuu musiikkisi kanssa, joten voit nauttia ainutlaatuisesta äänestä ja fiiliksestä.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Nainen ja mies halaavat olohuoneessa, ja heidän vieressään oleva XBOOM-kaiutin on päällä." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Nauti uudesta äänikokemuksesta <br>
                          LG xboom AI:n kanssa</h3>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="LG XBOOM -kaiutin, jossa on AI-äänitilat kuten Bass Boost, Voice Enhance ja Standard." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI-ääni</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="LG XBOOM -kaiutin, jonka AI-valaistus mukautuu ääneen, ympäristöön ja juhlatiloihin." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI-valaistus</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="LG XBOOM -kaiutin pöydällä punertavassa huoneessa, jossa on ruutukuviolliset seinät ja modernit huonekalut." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI-kalibrointi</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Tuote ei ole vielä saatavilla.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="LG AI Kodinkoneet" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Kevyempiä pesuja joka kerta</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG WashTower AI tunnistaa pesukoneeseen laitetun pyykin ja tarjoaa optimoidun pesuohjelman herkkien kuitujen hoitoon, jotta jokainen pesu onnistuu vaivattomasti ja täydellisesti.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="LG sisäänrakennettu pinottu pesukone ja kuivausrumpu modernissa kodinhoitohuoneessa, jossa on puukaapit ja penkkipaikka." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Tutustu uuteen elämäntapaan <br>
                          LG AI Core Techin avulla</h3>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Käyttäjä säätää AI Wash -pesuohjelmaa LG:n pesukoneessa älykkäällä ohjauspyörällä." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Wash</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Käyttäjä valitsee AI Dry -kuivausohjelman LG:n kuivausrummussa digitaalisen ohjauspyörän avulla." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Dry</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Tuote julkaistaan asteittain valituissa maissa.</li>
                      <li data-tp="copy">**AI-tunnistus aktivoituu, kun pyykin määrä on alle 6 kg.</li>
                      <li data-tp="copy">***AI Wash -toimintoa tulee käyttää vain samanlaisten kuitujen kanssa [kaikkia kuituja ei tunnisteta] ja sopivan pesuaineen kanssa.</li>
                      <li data-tp="copy">***AI Dry on saatavilla vain alle 5 kg:n pesuilla, joissa kuidut imevät kosteutta saman verran.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" alt="LG AI Ilmastointi" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Täydellisesti säädetty viilennys mukavuuteen</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG DUALCOOL AI huolehtii optimaalisesta ilmasta, pitää sinut mukavana ja optimoi energiatehokkuuden kustannussäästöjen takaamiseksi. LG AI Air tarjoaa täydellisesti säädetyn viilennyksen mukavuuttasi varten.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="LG DUAL Inverter -ilmastointilaite viilentää modernia olohuonetta, jossa nainen istuu sohvalla, ThinQ AI -teknologian voimin." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Koe optimoitu mukavuus <br>
                          LG AI Airin avulla</h3>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Nainen rentoutuu älykkäässä olohuoneessa, kun LG AI Air -ilmastointilaite säätää automaattisesti lämpötilan, ilmavirran ja kosteuden." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Air</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="Älypuhelimen käyttöliittymä näyttää energiankulutuskäyrän LG:n ilmastointilaitteen edessä, korostaen AI kW Manager -toimintoa tehokkaaseen energiankulutuksen seurantaan." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI kW Manager</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*AI Airia voidaan ohjata kaukosäätimellä ja ThinQ-sovelluksella.</li>
                      <li data-tp="copy">**AI Air on saatavilla sekä viilennys- että lämmitystoimintoina.</li>
                      <li data-tp="copy">***AI Air säätää ilman määrää ja tuulensuuntaa automaattisesti tilanteen mukaan, ja AI Air sammuu, kun tuulensuuntaa vaihdetaan manuaalisesti.</li>
                      <li data-tp="copy">****AI Airin aktivoituessa tutkasensori tunnistaa käyttäjän sijainnin ja aktivoi automaattisesti suoran tai epäsuoran ilmavirtauksen.</li>
                      <li data-tp="copy">*****Tutkasensorin tunnistusalue on enintään 5 metriä, ja tunnistusalue voi vaihdella laitteen asennus- ja käyttöympäristön mukaan.</li>
                      <li data-tp="copy">******Tämä toiminto toimii vain malleissa, joissa on tutkasensori.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" alt="LG AI Laskenta" class="eyebrow-logo" loading="lazy">  
                      </picture>
                      Tehostaa kaikkea mitä teet</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG gram AI tukee työskentelyäsi sekä verkossa että offline-tilassa. Löydä ja tiivistä tiedostoja turvallisesti offline-tilassa gram chatilla laitteessa, ja tehosta tuottavuuttasi verkossa GPT-4o -teknologiaan perustuvalla gram chat -pilvellä.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" alt="Nainen käyttää LG gram -kannettavaa, jossa on kaksinäyttöjärjestelmä videoneuvotteluun ja moniajoon kotitoimistossaan." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Vapauta uudet kykysi ilman rajoja <br>
                          LG gram AI:n avulla</h3>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature01.png" alt="LG gram -kannettava, jossa On-Device AI ja älykäs avustajaliittymä näytöllä." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">gram Chat On-Device</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature02.png" alt="LG gram -kannettava, jossa Cloud AI ja älykäs avustajaliittymä verkon kautta tukemassa tuottavuutta." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">gram Chat Cloud</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Tuotteen alkuvaiheessa jotkin ominaisuudet eivät välttämättä toimi täysin sujuvasti. Tämä johtuu laitteessa tapahtuvan AI:n luonteesta, joka vaatii aikaa ennakkokoulutukseen sopeutuakseen käyttäjään.</li>
                      <li data-tp="copy">*gram Chat On-Device edellyttää indeksointitehtäviä löytääkseen sisältöä tietokoneeltasi yhdistämällä sanoja ja dataa, mikä saattaa viedä jonkin aikaa, ennen kuin halutut tulokset näkyvät.</li>
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
            <h2 class="thinq-section-title" data-tp="copy">ThinQ® auttaa arkea sujumaan</h2>
            <p class="thinq-section-text" data-tp="copy">Älykotiisi tarkoitettu alusta LG:n älykkäille kodinkoneille ja laitteille. ThinQ tarjoaa hallinnan ja mukavuuden sormenpäissäsi, helpottaen elämää ja tuoden kodin mukavuudet lähemmäksi.</p>
            
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Henkilö pitää kädessään älypuhelinta, jossa LG ThinQ -sovellus on auki ja hallitsee älykodin laitteita samalla kun juo kahvia." loading="lazy" data-tp="alt">  
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
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="Modernissa älykeittiössä nainen antaa äänikomennon käynnistääkseen pesukoneen LG ThinQ AI:lla, samalla kun mies lukee sohvallaan taustalla." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Helppo ohjaus ääniohjaimella</h3>
                <p class="text" data-tp="copy">Kerro LG-kodinkoneellesi tarkalleen, mitä tarvitset, pelkästään sanomalla se ääneen. AI-kaiutin kuuntelee ja tarkistaa ohjelman puolestasi, ja ilmoittaa sinulle.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Älypuhelimessa näkyy LG ThinQ -sovellus, joka ohjaa LG InstaView Slide-In Range -uunia, mahdollistaen tehokkaan tuotteen huollon keittiössä." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Tehokas tuotteen huolto</h3>
                <p class="text" data-tp="copy">LG ThinQ -sovelluksen kautta voit tarkistaa LG-kodinkoneesi tilan, ladata uusia ohjelmia, seurata ohjelmien käyttöä ja paljon muuta.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">Lisää LG Affectionate Intelligencestä</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="LG Electronicsin johtaja pitelee kyberturvallisuuden akkreditointisertifikaattia, taustalla digitaalinen turvallisuuskuvake." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG vahvistaa kyberturvallisuusjohtajuuttaan saamalla KOLAS IoT -kyberturvallisuustestauksen akkreditoinnin</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">Lue lisää</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="LG vahvistaa kyberturvallisuusjohtajuuttaan saamalla KOLAS IoT -kyberturvallisuustestauksen akkreditoinnin." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG esittelee uusimmat innovaatioonsa, joita tehostaa ”Affectionate Intelligence”, CES 2025 -tapahtumassa</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">Lue lisää</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Puhuja esittelee AI-teknologiaan perustuvia B2B-ratkaisuja LG-tapahtumassa lavalla." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG esittelee ”Affectionate Intelligence” -arjen LG World Premiere -tapahtumassa</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn" data-tp="copy link">Lue lisää</a>
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
