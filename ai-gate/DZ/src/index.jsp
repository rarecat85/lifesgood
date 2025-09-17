<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG DZ</title>
    <meta name="Keywords" content="LG AI – IA LG, Affectionate Intelligence – Intelligence Affectueuse, Human-Centered AI – IA Centrée sur l’Humain, Smart Life Platform – Plateforme de Vie Intelligente, Technology-Forward Solutions – Solutions Technologiques de Pointe">
    <meta name="Description" content="LG AI s'efforce d'offrir une vie agréable, simple et bien prise en charge grâce à sa capacité à « ressentir avec sagesse, comprendre en profondeur et prendre soin avec chaleur ». Découvrez une qualité de vie supérieure avec LG Affectionate Intelligence, où l’IA va au-delà de l’intelligence artificielle pour offrir une attention chaleureuse et centrée sur l’humain.">
    <meta property="og:title" content="LG Affectionate Intelligence | LG DZ"/>
    <meta property="og:url" content="https://www.lg.com/dz/lg-ai">
    <meta property="og:description" content="LG AI s'efforce d'offrir une vie agréable, simple et bien prise en charge grâce à sa capacité à « ressentir avec sagesse, comprendre en profondeur et prendre soin avec chaleur ». Découvrez une qualité de vie supérieure avec LG Affectionate Intelligence, où l’IA va au-delà de l’intelligence artificielle pour offrir une attention chaleureuse et centrée sur l’humain."/>
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
    <meta itemprop="description" content="LG AI s'efforce d'offrir une vie agréable, simple et bien prise en charge grâce à sa capacité à « ressentir avec sagesse, comprendre en profondeur et prendre soin avec chaleur ». Découvrez une qualité de vie supérieure avec LG Affectionate Intelligence, où l’IA va au-delà de l’intelligence artificielle pour offrir une attention chaleureuse et centrée sur l’humain."/>
    <meta itemprop="Keywords" content="LG AI – IA LG, Affectionate Intelligence – Intelligence Affectueuse, Human-Centered AI – IA Centrée sur l’Humain, Smart Life Platform – Plateforme de Vie Intelligente, Technology-Forward Solutions – Solutions Technologiques de Pointe"/>
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
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Une femme passe et la lumière s'allume automatiquement. La phrase "Détection intelligente" apparaît à l'écran.
Un homme et une femme s'enlacent, l'enceinte XBOOM s'active, accompagnée de la phrase "Compréhension profonde".
Un homme est assis, l'air triste, au volant. Le logo LG AI apparaît avec la phrase "Une bienveillance chaleureuse".
Un match de football est diffusé à la télévision. L'IA de LG répond à une commande vocale. La phrase "Pour embellir votre quotidien" s'affiche.
L'enceinte XBOOM, le téléviseur, et une famille assise sur le canapé avec son chien apparaissent dans le même plan.
Une mère et son fils utilisent ensemble le lave-linge. La phrase "Pour vous simplifier la vie" apparaît.
Des scènes de la mère et son fils, un gros plan sur le bouton AI Wash, et un homme utilisant son ordinateur portable LG gram sont superposées, avec la phrase "Pour vous simplifier la vie".
Un homme et une femme sont assis à l'avant d'une voiture. Le logo LG AI apparaît entre eux, avec la phrase "Pour une vie où l'on prend soin de vous".
Une personne entre dans un bureau avec son chien. Le purificateur d'air s'active en réponse.
Plan final : un fond blanc avec le logo LG AI et la phrase "Une intelligence bienveillante, pour VOUS."</h1>
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
              <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="Logo LG IA" class="ai-logo" data-tp="alt">
            </picture>
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Une intelligence qui prend soin</span> de Vous</h2>
            <p class="text" data-tp="copy">Chez LG, nous nous sommes posé une question fondamentale : quelle devrait être la véritable mission de l'IA ? <br>
              Après une profonde réflexion, nous avons trouvé notre réponse. <br><br>
              Pour nous, l'IA est bien plus que de l'Intelligence Artificielle. C'est une Intelligence Attentionnée. <br><br>
              Au moment où l'IA s'intègre dans notre quotidien, <br>
              elle doit nous aider à construire la vie meilleure que nous méritons tous. <br><br>
              C'est pourquoi l'IA de LG est conçue avant tout pour VOUS, avec une attention sincère : <br>
              elle vous perçoit et vous comprend, pour prendre soin de votre vie, chaque jour.
              <strong>Découvrez comment la vie est plus belle avec l'IA de LG.</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Faites défiler" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">La vie, en mieux</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Votre quotidien, en toute simplicité</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Un quotidien soigné</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">L'IA LG comprend votre quotidien et enrichit vos expériences pour emplir votre vie de moments d'exception.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Un homme et une femme sont sur le canapé du salon, regardant un match de football diffusé sur un téléviseur LG. La scène change et le couple s'enlace. La caméra se concentre sur l'enceinte LG XBOOM placée à côté d'eux.</span>
                      <h3 class="video-title" data-tp="copy">Pour une vie qui vous sourit</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/dz/oled-tvs" data-tp="link">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit01-products02.png" alt="Téléviseur LG OLED avec Intelligence Artificielle - Vue de face" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/dz/qned-tvs" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="Vue avant du téléviseur LG QNED IA" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/dz/nanocell-tv" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="LG NanoCell AI : L'intelligence qui perfectionne chaque image." loading="lazy" data-tp="alt">
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">L'IA de LG anticipe vos besoins et propose des solutions pour un quotidien plus fluide, à votre rythme.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Une mère et son fils utilisent ensemble le lave-linge LG doté d'intelligence artificielle, activant le cycle AI Wash d'un simple tour de bouton. Au même moment, un homme apparaît à l'écran, utilisant un ordinateur portable LG gram.</span>
                      <h3 class="video-title" data-tp="copy">Votre quotidien. L'effort en moins.</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <!-- <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="Lave-linge Intelligent LG - Vue de face" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products03.png" alt="Vue de face du sèche-linge intelligent LG" loading="lazy" data-tp="alt">
                        </div>
                      </li> -->
                      <li class="product-item">
                        <a href="https://www.lg.com/dz/refrigerateurs/lg-gc-x257cses" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="Vue de face du produit LG InstaView avec IA" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <!-- <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products05.png" alt="LG gramPro, l'intelligence artificielle au premier plan." loading="lazy" data-tp="alt">
                        </div>
                      </li> -->
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-2 -->
                <!-- S : tab-panel tab-3 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-3" id="product-panel-3" hidden="">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">L'intelligence artificielle LG veille sur vous, votre espace et la planète, pour vous offrir le bien-être que vous désirez.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Un homme entre dans un bureau, une laisse à la main. Au volant, un conducteur semble triste, jusqu'à ce que l'IA de LG lui montre une photo de famille. Un gros plan sur l'écran du véhicule montre l'IA de LG afficher une carte et faire revivre un souvenir.</span>
                      <h3 class="video-title" data-tp="copy">Pour un quotidien qui prend soin de vous.</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/dz/climatiseurs-residentiels/lg-dual18at3" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products01.png" alt="LG DUALCOOL IA (Intelligence Artificielle) - Vue de face du produit" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="Vue latérale du système de vision LG, l'œil de votre aide à la conduite intelligente." loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">En savoir plus</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Un utilisateur interagit avec l'interface tactile pour choisir son café, conseillé par l'assistant IA qui comprend à la fois la voix et le toucher." loading="lazy" data-tp="alt">
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
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Appliances</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Air Conditioning</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-5" id="feature-tab-5" data-tp="copy">Informatique</button>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="Le téléviseur IA de LG " class="eyebrow-logo" loading="lazy">
                      </picture>
                      Évolue pour anticiper tous vos désirs de divertissement.</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Le téléviseur IA de LG apprend vos goûts et comprend votre mode de vie pour optimiser chaque aspect de votre expérience télévisuelle, créant ainsi un divertissement sur mesure, parfaitement conçu pour vous.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Au-dessus de la télécommande LG Magic Remote, découvrez des fonctionnalités telles que le Profil Vocal IA (reconnaît votre voix pour un contenu personnalisé), la Recherche Intelligente (trouvez tout en parlant simplement), l'Assistant Virtuel (dialoguez avec votre TV, elle vous répond), le Concierge IA (votre guide personnel sur mesure), l'Expert Image IA (règle l'image à la perfection, automatiquement) et l'Expert Sonore IA (adapte le son à ce que vous regardez)." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Découvrez la nouvelle génération <br>
                          de téléviseurs IA LG</h3>
                        <a href="https://www.lg.com/dz/television/ai-tv" class="white-btn" data-tp="copy link">En savoir plus</a>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="L'écran d'un téléviseur LG OLED affiche la page d'accueil webOS 25, remplie d'applications et de contenus de divertissement. À ses côtés, le bouton IA de la télécommande LG AI Magic Remote est illuminé, comme activé par la voix. Une bulle de dialogue apparaît avec la commande : « Suggère-moi un film qui pourrait me plaire. »" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Identité Vocale par IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="L'écran d'un téléviseur LG OLED illustre le fonctionnement de la Recherche IA (recherche intelligente). Une petite fenêtre de discussion montre l'utilisateur qui demande quels matchs de sport sont disponibles. La recherche IA répond instantanément dans la conversation tout en affichant des vignettes des différents contenus proposés. Il est également possible de poser directement une question à Microsoft Copilot." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Recherche IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="Une simple pression sur le bouton IA de la télécommande LG AI Magic Remote active l'Assistant IA sur l'écran de votre téléviseur OLED, qui vous propose immédiatement des mots-clés." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Concierge IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Une scène de science-fiction est diffusée sur un téléviseur LG OLED. Sur la gauche de l'écran, l'interface de l'assistant virtuel IA est visible. L'utilisateur signale par message que l'image est trop sombre, et l'assistant lui offre aussitôt des solutions." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Assistant IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Le processeur intelligent LG α11 optimise le son en temps réel, offrant une clarté vocale digne d’un studio d’enregistrement." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Assistant IA pour l'Image et le Son</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Passez d'une scène de science-fiction à votre écran d'accueil personnalisé. Avec la télécommande Magic Remote et son intelligence artificielle (une technologie qui devine vos préférences), profitez d'un contenu unique, comme vous." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Télécommande Magic Intelligente</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Les fonctions d'IA LG utilisent des algorithmes entraînés par deep learning (une IA qui apprend par elle-même) pour l'upscaling d'image en temps réel (transformer une image standard en haute définition) et l'upmixing audio (créer un son surround immersif à partir d'une source simple).</li>
                      <li data-tp="copy">**Tous les téléviseurs LG webOS 24 intègrent la Personnalisation IA, à l’exception de ceux ne disposant pas de capteur de luminosité.</li>
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
                      Un son d'une justesse unique.</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">L'intelligence artificielle du LG XBOOM analyse et ajuste le son pour l'adapter au genre musical et à votre espace. L'éclairage intelligent sublime l'ambiance et s'harmonise avec votre musique, pour une expérience sonore et visuelle parfaitement unique.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Une femme et un homme s'enlacent dans le salon, à côté de l'enceinte XBOOM allumée." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Vivez une expérience sonore réinventée <br>
                          avec l'intelligence artificielle LG xboom</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="Enceinte LG XBOOM avec son IA qui choisit le mode sonore idéal pour vous : Basses Puissantes, Voix Claires et Standard." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Son IA : L'intelligence qui analyse chaque scène pour un son parfaitement adapté.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="Enceinte LG XBOOM avec son Éclairage IA (Intelligence Artificielle) s'adaptant à votre voix, à l'ambiance et au rythme de la fête." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Éclairage IA : La lumière qui s'adapte à votre quotidien.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="Enceinte LG XBOOM posée sur une table dans une pièce aux tons rouges, avec des murs à motifs quadrillés et un mobilier moderne." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Calibrage IA (un réglage automatique pour une performance optimale)</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Prochainement disponible.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="LG AI Appliances" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Allégez chacune de vos charges.</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">L'intelligence artificielle de la LG WashTower reconnaît la nature de vos tissus pour lancer un lavage sur mesure, préservant ainsi vos vêtements les plus délicats et vous assurant une lessive parfaite, sans effort, à chaque fois.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="L'ensemble lave-linge et sèche-linge LG superposés, intégrant l'intelligence artificielle pour un soin expert de vos vêtements dans une buanderie au design moderne." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Discover a new way of life <br>
                          with LG AI Core Tech</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Ajustement du cycle Lavage Intelligent (IA) sur le lave-linge LG via son sélecteur de commande." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Lavage IA : L'intelligence qui prend soin de votre linge.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Sélectionnez le cycle Séchage Intelligent (IA). Votre sèche-linge LG analyse vos tissus et choisit le programme idéal pour un soin parfait." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Séchage Optimal par IA</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Ce produit sera disponible progressivement dans certains pays.</li>
                      <li data-tp="copy">**La détection intelligente par l'IA s'active pour les charges de moins de 6 kg.</li>
                      <li data-tp="copy">***La fonction Lavage IA (AI Wash) s'utilise uniquement avec des tissus de nature similaire [tous les types de tissus ne sont pas détectés] et une lessive adaptée.</li>
                      <li data-tp="copy">****La fonction Séchage IA (AI Dry) est disponible uniquement pour les charges de moins de 5 kg, contenant des tissus avec des niveaux d'absorption d'humidité similaires.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" alt="LG AI Air Conditioning" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Un confort sur mesure grâce à une fraîcheur parfaitement ajustée.</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Le LG DUALCOOL AI prend soin de votre confort avec un air idéal, tout en optimisant la consommation d'énergie pour alléger vos factures. Son intelligence artificielle vous offre une fraîcheur parfaitement ajustée, pour une expérience sur mesure.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="Une femme se détend dans son salon moderne, parfaitement rafraîchi par le climatiseur LG DUAL Inverter. Sa technologie IA ThinQ (Intelligence Artificielle) ajuste automatiquement la puissance pour garantir un confort idéal et une consommation d'énergie minimale." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Vivez un confort sur mesure <br>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Une femme profite d'un moment de détente dans son salon intelligent, tandis que son climatiseur LG avec IA (Intelligence Artificielle) ajuste automatiquement la température, le flux d'air et l'humidité." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Air Intelligent</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="L'interface du smartphone, affichant la consommation de votre climatiseur LG, met en avant la fonction AI kW Manager (gestionnaire d'énergie par intelligence artificielle) pour un suivi efficace de votre consommation électrique." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Gestionnaire d'Énergie IA</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Le mode Air IA se contrôle via la télécommande ou l'application ThinQ.</li>
                      <li data-tp="copy">**Le mode Air IA est disponible pour le refroidissement et le chauffage.</li>
                      <li data-tp="copy">***En mode Air IA, le volume d'air et la direction du souffle s'ajustent automatiquement selon la situation. Ce mode se désactive si vous modifiez manuellement la direction du souffle.</li>
                      <li data-tp="copy">****Lorsque le mode Air IA est activé, le capteur radar (un œil intelligent qui détecte votre présence) repère votre position et active automatiquement le souffle d'air direct ou indirect.</li>
                      <li data-tp="copy">*****La portée de détection du capteur radar va jusqu'à 5 mètres. Cette distance peut varier selon l'installation et l'environnement d'utilisation de l'appareil.</li>
                      <li data-tp="copy">******Cette fonction est disponible uniquement sur les modèles équipés du capteur radar.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" alt="LG AI Computing" class="eyebrow-logo" loading="lazy">  
                      </picture>
                      L'intelligence au cœur de votre quotidien</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Le LG gram AI décuple votre efficacité, que vous soyez en ligne ou hors ligne. Retrouvez et résumez vos fichiers en toute sécurité sans connexion internet avec gram chat on-device (l'IA intégrée à l'ordinateur). Une fois en ligne, augmentez votre productivité grâce à gram chat cloud, propulsé par l'IA GPT-4o.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" alt="Depuis son bureau à domicile, une femme gère avec fluidité une visioconférence et plusieurs tâches simultanément sur son ordinateur portable LG gram à double écran." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Révélez de nouvelles capacités <br>
                           sans limites avec le LG gram AI</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature01.png" alt="Ordinateur portable LG gram, doté de l'IA embarquée (une intelligence qui fonctionne directement sur l'appareil, même sans Internet) et de son assistant intelligent." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Assistant gram Intégré</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature02.png" alt="L'ordinateur portable LG gram et son interface d'assistance intelligente, propulsée par l'IA Connectée pour le support en ligne et la productivité." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Chat Cloud gram</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Au cours des premières utilisations, un court temps d'adaptation peut être nécessaire pour certaines fonctionnalités. C'est le fonctionnement normal de l'IA intégrée (l'intelligence artificielle qui agit directement sur votre appareil) : elle a besoin de temps pour apprendre vos habitudes et s'adapter parfaitement à vous.</li>
                      <li data-tp="copy">*La fonction gram Chat intégrée doit effectuer une indexation (un classement intelligent de vos données) pour retrouver vos contenus sur votre PC. Cette analyse initiale peut prendre un certain temps pour vous fournir des résultats d'une précision optimale.</li>
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
            <h2 class="thinq-section-title" data-tp="copy">ThinQ®. L'intelligence au service de votre quotidien</h2>
            <p class="thinq-section-text" data-tp="copy">ThinQ, la plateforme pour vos appareils et équipements LG intelligents, met le contrôle et la simplicité à votre portée, pour vous simplifier la vie et profiter pleinement du confort de votre maison.</p>
            <a href="https://www.lg.com/dz/lg-thinq" class="white-btn" data-tp="copy link">En savoir plus</a>
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Une personne pilote sa maison connectée depuis son smartphone avec l'application LG ThinQ, tout en savourant son café." loading="lazy" data-tp="alt">  
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
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="Au cœur d'une cuisine moderne et intelligente, une femme lance la machine à laver d'une simple commande vocale grâce à l'intelligence artificielle LG ThinQ, tandis qu'un homme se détend en lisant sur le canapé." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Commande vocale simplifiée</h3>
                <p class="text" data-tp="copy">Dites simplement à votre appareil LG ce dont vous avez besoin : son intelligence artificielle écoutera, vérifiera le cycle et vous répondra.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Un smartphone affiche l'application LG ThinQ pour piloter la cuisinière encastrable LG InstaView et simplifier son entretien dans la cuisine." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Entretien Optimisé</h3>
                <p class="text" data-tp="copy">Grâce à l'application LG ThinQ, contrôlez vos appareils LG, téléchargez de nouveaux programmes, suivez leur utilisation, et bien plus encore.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">En savoir plus sur l'Intelligence Affectueuse de LG</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="Un dirigeant de LG Electronics détenant un certificat d'accréditation en cybersécurité, avec un visuel sur la sécurité numérique en arrière-plan." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG affirme sa position de leader en cybersécurité (protection de vos appareils) en obtenant la certification internationale KOLAS pour la sécurité de l'IoT (vos objets connectés).</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">En savoir plus</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Des visiteurs découvrent l'écran LED incurvé de LG et son slogan « Life's Good 24/7 » lors d'un salon technologique." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG présente ses dernières innovations propulsées par « l'Intelligence Attentionnée » au CES 2025.</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">En savoir plus</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Un intervenant LG dévoile sur scène les solutions professionnelles enrichies par l'intelligence artificielle." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG dévoile une journée type grâce à son "Intelligence Attentionnée", lors de la Première Mondiale LG.</p>
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
