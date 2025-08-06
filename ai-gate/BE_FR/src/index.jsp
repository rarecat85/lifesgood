<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG BE</title>
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, Centré sur l'humain, Smart Living Platform, Solutions technologiques, L'intelligence bienveillante">
    <meta name="Description" content="LG AI vise à rendre la vie agréable, sans effort et à prendre soin de vous grâce à 'La perception avisée, La compréhension profonde, L'attention chaleureuse'. Faites l'expérience d'une meilleure qualité de vie avec LG Affectionate Intelligence, où l'IA va au-delà de l'intelligence artificielle pour fournir des soins chaleureux et centrés sur l'humain.">
    <meta property="og:title" content="LG Affectionate Intelligence | LG BE"/>
    <meta property="og:url" content="https://www.lg.com/be_fr/lg-ai"/>
    <meta property="og:description" content="LG AI vise à rendre la vie agréable, sans effort et à prendre soin de vous grâce à 'La perception avisée, La compréhension profonde, L'attention chaleureuse'. Faites l'expérience d'une meilleure qualité de vie avec LG Affectionate Intelligence, où l'IA va au-delà de l'intelligence artificielle pour fournir des soins chaleureux et centrés sur l'humain."/>
    <meta property="og:image" content=""/>
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
    <meta itemprop="description" content="LG AI vise à rendre la vie agréable, sans effort et à prendre soin de vous grâce à 'La perception avisée, La compréhension profonde, L'attention chaleureuse'. Faites l'expérience d'une meilleure qualité de vie avec LG Affectionate Intelligence, où l'IA va au-delà de l'intelligence artificielle pour fournir des soins chaleureux et centrés sur l'humain."/>
    <meta itemprop="Keywords" content="LG AI, Affectionate Intelligence, Centré sur l'humain, Smart Living Platform, Solutions technologiques, L'intelligence bienveillante"/>
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
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">
Une femme passe à côté de l'appareil tandis que la lumière s'allume automatiquement. La phrase « Percevoir avec sagesse » apparaît à l'écran.
Un homme et une femme s'embrassent tandis que le haut-parleur de la XBOOM s'active, accompagné de la phrase « Comprendre profondément ».
Un homme s'assied tristement sur le siège du conducteur. Le logo LG AI apparaît, accompagné de la phrase « Warm care ».
Un match de football est diffusé à la télévision. LG AI répond par une interaction vocale. La phrase « For your enjoyable life » (Pour une vie agréable) apparaît en bas.
La XBOOM, la télévision et une famille assise sur le canapé avec son chien apparaissent dans une même image.
Une mère et son fils utilisent ensemble le lave-linge. La phrase « Pour une vie sans effort » apparaît.
Les images de la mère et du fils, un gros plan du bouton AI Wash et un homme utilisant l'ordinateur portable LG gram sont fusionnées en une seule image, avec la phrase « For your effortless life » (Pour une vie sans effort).
Un homme et une femme sont assis sur les sièges avant d'une voiture. Le logo LG AI apparaît entre eux, accompagné de la phrase « For your well-groomed life » (Pour une vie soignée).
Une personne entre dans un bureau avec son chien. Le purificateur d'air se met en marche automatiquement.
Plan final : fond blanc avec le logo LG AI et la phrase « Affectionate Intelligence for YOU ».</h1>
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
              <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="LG AI-logo" class="ai-logo" data-tp="alt">
            </picture>
            <h2 class="title" data-tp="copy">
              <span class="gradient-text">Affectionate Intelligence</span> for JOU
            </h2>
            <p class="text" data-tp="copy">Chez LG, nous nous sommes demandé à quoi devrait servir l'IA. <br>
              Après mûre réflexion, nous avons trouvé notre réponse. <br><br>
              Pour nous, l’IA dépasse la simple intelligence artificielle : c’est une intelligence bienveillante. <br><br>
              Au fur et à mesure que l'IA fait partie de notre vie quotidienne, <br>
              elle devrait nous aider à réaliser la vie meilleure que nous méritons tous. <br><br>
              C'est pourquoi LG AI commence par VOUS, en détectant et en comprenant, <br>
              afin de s'assurer qu'elle prend soin de votre vie.
              <strong>Découvrez les avantages de la vie avec LG AI</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Icône pour faire défiler vers le bas" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Belle vie</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Une vie sans effort</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Une vie soignée</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI comprend votre vie et améliore vos expériences pour remplir votre vie de beaux moments.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Un homme et une femme sont assis sur le canapé et regardent une émission de football sur un téléviseur LG dans le salon. La scène change et l'homme et la femme se prennent dans les bras.</span>
                      <h3 class="video-title" data-tp="copy">Votre belle vie</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/be_fr/tv-oled-evo" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="Vue de face du produit LG OLED evo AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/be_fr/tv-oled" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="Vue de face du produit LG OLED evo AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/be_fr/tvs-qned" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="Vue de face du produit LG QNED  AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/be_fr/nanocell-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="Vue de face du produit LG UHD AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI reconnaît vos souhaits et vous propose des solutions pour que votre vie se déroule sans problème, à votre façon.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Une mère et son fils utilisent ensemble un lave-linge LG AI et tournent le bouton pour activer AI Wash. Un homme utilisant l’ordinateur portable LG gram apparaît dans la même scène.</span>
                      <h3 class="video-title" data-tp="copy">Pour une vie sans effort</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/be_fr/menage/lg-f4wx809y" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="Vue de face du lave-linge LG AI " loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/be_fr/cuisine/lg-gsxe90evad" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="Vue de face du produit LG InstaView AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG AI prend soin de vous, de votre espace et de la planète, pour rendre votre vie meilleure, exactement comme vous le souhaitez.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Un homme entre dans un bureau en tenant une laisse de chien. Un homme assis sur le siège du conducteur regarde tristement tandis que LG AI lui montre une photo de famille. L’écran de la voiture est montré en gros plan pendant que LG AI affiche une carte et fait apparaître à nouveau un rappel.</span>
                      <h3 class="video-title" data-tp="copy">Pour votre vie soignée</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products01.png" alt="Vue de face du produit LG DUALCOOL AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="Vue latérale du produit système de vision ADAS" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Un utilisateur interagit avec une interface tactile pilotée par une solution HMI IA multimodale, et sélectionne un menu de café grâce à une invite d’assistant IA." loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
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
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Appareils</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Climatisation</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-5" id="feature-tab-5" data-tp="copy">Ordinateur</button>
              </div>
              <!-- E : tab-list -->
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-1" id="feature-panel-1">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="LG AI TV" class="eyebrow-logo" loading="lazy" data-tp="alt">
                      </picture>
                      Se développe pour répondre à tous vos besoins en divertissement</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG AI TV analyse vos préférences de visionnage et comprend votre style de vie afin d’optimiser chaque aspect de votre expérience télévisuelle, pour vous offrir un divertissement idéalement personnalisé.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Au-dessus de la LG Magic Remote, sont affichées des fonctions telles que AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard et AI Sound Wizard" loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Découvrez la prochaine génération de <br>
                          LG AI TV</h3>
                        <a href="https://www.lg.com/be_fr/televiseurs/ai-tv" class="white-btn" data-tp="copy link">En savoir plus</a>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="Sur l’écran d’une TV LG OLED, la page d’accueil webOS 25 est affichée, remplie d’applications et de contenus de divertissement. À côté de la TV se trouve la télécommande LG AI Magic Remote, avec le bouton AI mis en évidence comme s’il avait été activé par la voix de l’utilisateur. Une bulle de dialogue affiche : « suggest a movie I'll like » (« suggère un film que j’aimerai »). »" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Voice ID</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="Sur l’écran de la TV LG OLED, on montre comment fonctionne AI Search. Une petite fenêtre de chat affiche la question de l’utilisateur concernant les matchs de sport disponibles. AI Search répond via le chat ainsi qu’avec des miniatures de différents contenus disponibles. Une invite permet également de poser une question à Microsoft Copilot." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Search</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="Utilisation de la LG AI Magic Remote. En appuyant brièvement sur le bouton AI, l’assistant IA s’active à l’écran de la TV OLED, puis il propose des mots-clés." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Concierge</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Un contenu de science-fiction est diffusé sur un écran LG OLED TV. Sur le côté gauche de l’écran se trouve l’interface du chatbot IA. L’utilisateur envoie un message au chatbot indiquant que l’écran est trop sombre, et le chatbot propose des solutions." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Chatbot</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Une femme chante dans un micro avec un casque audio, mise en valeur par l’amélioration sonore grâce au processeur LG α11 AI. " data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Picture/Sound Wizard</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Deux scènes connectées avec la LG AI Magic Remote pour une TV — d’abord une scène de science-fiction, puis un écran d’accueil avec du contenu personnalisé." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Magic Remote</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Les fonctions IA de LG utilisent des algorithmes entraînés basés sur le deep learning pour la mise à l’échelle d’image en temps réel et le mixage audio.</li>
                      <li data-tp="copy">**Toutes les TV LG webOS 24 sont équipées de la personnalisation IA, sauf les modèles sans capteurs de lumière.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-1 -->
                <!-- S : panel tab-2 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-2" id="feature-panel-2">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-desktop.svg" alt="LG AI Audio" class="eyebrow-logo" loading="lazy" data-tp="alt">
                      </picture
                      Un son unique</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">La LG XBOOM AI analyse et adapte le son au genre musical et à l’espace. Avec un éclairage IA qui améliore l’ambiance et s’accorde à votre musique, vous pouvez profiter d’un son et d’une atmosphère uniques.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Une femme et un homme s’embrassent dans le salon, tandis que l’enceinte XBOOM à côté d’eux est allumée. " loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Profitez d’une nouvelle expérience sonore <br>
                          avec LG XBOOM AI</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="Enceinte LG XBOOM avec modes sonores IA, notamment Bass Boost, Voice Enhance et Standard." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Sound</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="Enceinte LG XBOOM avec éclairage IA qui s’adapte aux modes voix, environnement et fête." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Lighting</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="Enceinte LG XBOOM posée sur une table dans une pièce aux tons rouges, avec des murs à motif en grille et un mobilier moderne" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Calibration</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Dit product is niet beschikbaar in de Benelux.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-2 -->
                <!-- S : panel tab-3 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-3" id="feature-panel-3">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-desktop.svg" alt="LG AI Appareils" class="eyebrow-logo" loading="lazy" data-tp="alt">
                      </picture>
                      Rend chaque lessive plus légère</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG WashTower AI détecte ce que vous lavez et optimise le cycle pour un meilleur soin des tissus, afin que vous puissiez faire chaque lessive sans effort, à chaque fois.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="Lave-linge et sèche-linge empilés LG intégrés dans une buanderie moderne avec des placards en bois et des sièges de banc." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Découvrez une nouvelle façon de vivre <br>
                          avec la technologie LG AI Core</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Main réglant le programme AI Wash sur la machine à laver LG à l’aide d’un bouton rotatif intelligent." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Wash</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="L’utilisateur sélectionne le programme AI Dry sur le sèche-linge LG à l’aide d’un bouton rotatif numérique." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Dry</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Ce produit sera progressivement lancé dans certains pays.</li>
                      <li data-tp="copy">**La détection IA s’active si la charge pèse moins de 6 kg.</li>
                      <li data-tp="copy">***AI Wash doit être utilisé uniquement avec des textiles similaires [tous les tissus ne sont pas détectés] et avec un détergent adapté.</li>
                      <li data-tp="copy">***AI Dry est disponible uniquement pour des charges de moins de 5 kg composées de tissus ayant le même niveau d’absorption d’humidité.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-3 -->
                <!-- S : panel tab-4 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-4" id="feature-panel-4">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" alt="LG AI Air Climatisation" class="eyebrow-logo" loading="lazy" data-tp="alt">
                      </picture>
                      Confort avec une climatisation parfaitement réglée</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG DUALCOOL AI garantit toujours une qualité d’air optimale, vous maintient confortable tout en optimisant l’efficacité énergétique et en réduisant les coûts. Avec LG AI Air, vous profitez d’une climatisation parfaitement ajustée à votre confort.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="Le climatiseur LG DUAL Inverter refroidit un salon moderne avec vue sur la mer, propulsé par la technologie ThinQ AI." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Découvrez un confort optimal <br>
                          avec LG AI Air</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Une femme se détend dans un salon intelligent pendant que le climatiseur LG AI ajuste automatiquement la température, le flux d’air et l’humidité." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Air</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="L’interface smartphone affiche un graphique de la consommation d’énergie du climatiseur LG, mettant en avant l’AI kW Manager pour une gestion efficace de l’énergie. " data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI kW Manager</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*L’AI Air peut être contrôlé avec la télécommande et ThinQ.</li>
                      <li data-tp="copy">**L’AI Air est disponible en mode refroidissement comme en mode chauffage.</li>
                      <li data-tp="copy">***Lors de l’utilisation de l’AI Air, le volume d’air et la direction du vent sont automatiquement ajustés en fonction de la situation, et l’AI Air s’éteint lorsque la direction du vent est modifiée.</li>
                      <li data-tp="copy">****Lorsque l’AI Air est activé, le capteur radar détecte la position de l’occupant et active automatiquement le vent direct ou indirect.</li>
                      <li data-tp="copy">*****La portée de détection du capteur radar est de 5 mètres maximum, et cette portée peut varier selon l’installation et l’environnement d’utilisation du produit.</li>
                      <li data-tp="copy">******Cette fonction est disponible uniquement sur les modèles équipés de capteurs radar.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-4 -->
                <!-- S : panel tab-5 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-5" id="feature-panel-5">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title" data-tp="copy"> 
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" alt="LG AI Ordinateur" class="eyebrow-logo" loading="lazy" data-tp="alt">  
                      </picture>
                      Donne de la puissance à tout ce que vous faites</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG gram AI renforce votre travail, en ligne comme hors ligne. Trouvez et résumez vos fichiers hors ligne en toute sécurité avec Gram Chat embarqué, et augmentez votre productivité en ligne grâce à Gram Chat cloud alimenté par GPT-4o.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" alt="Une femme utilise un ordinateur portable LG gram avec une configuration à double écran pour des visioconférences et du multitâche dans son bureau à domicile." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Libérez vos nouvelles possibilités <br>
                          sans limites avec LG gram AI</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature01.png" alt="Ordinateur portable LG gram avec IA embarquée et interface d’assistant intelligent à l’écran." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">gram Chat On-Device</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature02.png" alt="Ordinateur portable LG gram avec IA Cloud affichant une interface d’assistant intelligent pour le support en ligne et la productivité." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">gram Chat Cloud</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Au début de l’utilisation du produit, certaines fonctions peuvent ne pas fonctionner parfaitement. Cela est dû à la nature de l’IA embarquée, qui nécessite un temps d’adaptation à l’utilisateur.</li>
                      <li data-tp="copy">*Gram Chat On-Device nécessite des tâches d’indexation pour trouver le contenu sur votre PC en combinant des mots avec des données, ce qui peut prendre un certain temps avant d’obtenir les résultats souhaités.</li>
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
            <h2 class="thinq-section-title" data-tp="copy">ThinQ® aide la vie à se réaliser</h2>
            <p class="thinq-section-text" data-tp="copy">ThinQ est une plateforme pour vos appareils et équipements intelligents LG, mettant le contrôle et la simplicité à portée de main, pour simplifier votre vie et profiter du confort de la maison.</p>
            
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Une personne tient un smartphone avec l’application LG ThinQ ouverte, gérant les appareils intelligents de la maison tout en buvant un café." loading="lazy" data-tp="alt">  
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
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="Dans une cuisine intelligente moderne, une femme utilise une commande vocale pour lancer la machine à laver avec LG ThinQ AI, tandis qu’un homme lit sur le canapé en arrière-plan." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Contrôle simple avec l’assistant vocal</h3>
                <p class="text" data-tp="copy">Dites simplement à votre appareil ce dont vous avez besoin, et l’enceinte IA écoute puis contrôle le cycle.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Un smartphone affiche l’application LG ThinQ qui permet de contrôler le four LG InstaView Slide-In Range, facilitant ainsi un entretien efficace de l’appareil dans la cuisine." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Entretien efficace de vos appareils</h3>
                <p class="text" data-tp="copy">Via l’application LG ThinQ, vous pouvez contrôler votre appareil, télécharger de nouveaux cycles, vérifier l’utilisation des cycles, et bien plus encore.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">En savoir plus sur LG Affectionate Intelligence</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="Un cadre de LG Electronics tient un certificat d’accréditation en cybersécurité, avec un graphique de sécurité numérique en arrière-plan." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG renforce son leadership en cybersécurité avec l’accréditation KOLAS pour les tests de cybersécurité IoT.</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">En savoir plus</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Des visiteurs regardent l’écran LED incurvé de LG avec le slogan ‘Life’s Good 24/7’ lors d’un salon technologique." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG présente ses dernières innovations propulsées par “Affectionate Intelligence” au CES 2025.</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">En savoir plus</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Un intervenant présente des solutions B2B propulsées par l’IA sur scène lors d’un événement LG." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG dévoile une journée dans la vie avec “Affectionate Intelligence” lors de la première mondiale de LG.</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn" data-tp="copy link">En savoir plus</a>
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
