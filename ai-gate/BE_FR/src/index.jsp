<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG AI Votre Allié Intelligent | LG BE</title>
    <meta name="Keywords" content="LG AI, votre Allié Intelligent, IA centrée sur l’humain, Plateforme de vie intelligente, Solutions technologiques avancées">
    <meta name="Description" content="LG AI s'efforce de vous offrir une vie toujours plus agréable
    Faites l’expérience d’une vie de meilleure qualité avec votre Allié Intelligent LG AI, où l’IA va au-delà de l’intelligence artificielle pour vous accompagner toujours mieux">
    <meta property="og:title" content="LG AI Votre Allié Intelligent | LG BE"/>
    <meta property="og:url" content="https://www.lg.com/be_fr/lg-ai"/>
    <meta property="og:description" content="LG AI s'efforce de vous offrir une vie toujours plus agréable
    Faites l’expérience d’une vie de meilleure qualité avec votre Allié Intelligent LG AI, où l’IA va au-delà de l’intelligence artificielle pour vous accompagner toujours mieux"/>
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
    <meta itemprop="description" content="LG AI s'efforce de vous offrir une vie toujours plus agréable
    Faites l’expérience d’une vie de meilleure qualité avec votre Allié Intelligent LG AI, où l’IA va au-delà de l’intelligence artificielle pour vous accompagner toujours mieux"/>
    <meta itemprop="Keywords" content="LG AI, votre Allié Intelligent, IA centrée sur l’humain, Plateforme de vie intelligente, Solutions technologiques avancées"/>
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
          Une femme passe tandis que la lumière s’allume automatiquement. La phrase « Sensing wisely » apparaît à l’écran.
          Un homme et une femme s’enlacent alors que l’enceinte XBOOM s’active, accompagnée de la phrase « Understanding deeply ».
          Un homme est assis avec tristesse sur le siège conducteur. Le logo LG AI apparaît avec la phrase « Caring warmly ».
          Un match de football est diffusé à la télévision. LG AI réagit par interaction vocale. La phrase « For your delightful life » s’affiche en bas.
          XBOOM, la télévision et une famille assise sur le canapé avec leur chien apparaissent dans un même plan.
          Une mère et son fils utilisent la machine à laver ensemble. La phrase « For your effortless life » apparaît.
          Des scènes de la mère et du fils, un gros plan sur le bouton AI Wash et un homme utilisant un ordinateur portable LG gram sont superposés dans une seule prise, avec la phrase « For your effortless life ».
          Un homme et une femme sont assis sur les sièges avant d’une voiture. Le logo LG AI apparaît entre eux, accompagné de la phrase « For your well cared life ».
          Une personne entre dans un bureau avec son chien. Le purificateur d’air s’allume en réponse.
          Dernier plan : un fond blanc avec le logo LG AI et la phrase « Affectionate Intelligence for YOU ».</h1>
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
          <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="Logo LG AI" class="ai-logo" data-tp="alt">
        </picture>
        <h2 class="title" data-tp="copy">
          Votre <span class="gradient-text">Allié Intelligent</span>
        </h2>
        <p class="text" data-tp="copy">Chez LG, nous nous sommes demandés : à quoi sert l'IA ? <br>
          Après mûre réflexion, nous avons trouvé la réponse. <br><br>
          Pour nous, l'IA va au-delà de l'Intelligence Artificielle, c'est une Intelligence Affectueuse. <br><br>
          A mesure qu'elle s'intègre à notre quotidien, elle doit contribuer à améliorer notre quotidien. <br><br>
          C'est pourquoi VOUS êtes au centre de notre réfléxion
          <strong>Découvrez Life's Good avec LG IA </strong></p>
        <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Icône de défilement vers le bas" class="scroll-down-icon" data-tp="alt">
      </div>
    </section>
    <!-- E : overview-section -->
    <!-- S : product-section -->
    <section class="product-section">
      <div class="inner">
        <div class="tab-container" role="tablist">
          <!-- S : tab-list -->
          <div class="tab-list">
            <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Une vie merveilleuse</button>
            <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Une vie facilitée</button>
            <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Une vie saine</button>
          </div>
          <!-- E : tab-list -->
          
          <!-- S : panel-container -->
          <div class="panel-container">
            <!-- S : tab-panel tab-1 -->
            <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
              <div class="tab-panel-inner">
                <h2 class="tab-panel-title text-center" data-tp="copy">LG IA comprend votre manière de vivre et améliore votre expérience utilisateur pour d'agréables moments. </h2>
                <!-- S : video-bx -->
                <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                  <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Un homme et une femme sont sur le canapé, regardant une diffusion de football sur un téléviseur LG dans le salon. La scène change, et l’homme et la femme s’enlacent. La caméra se concentre sur le LG XBOOM à côté d’eux.</span>
                  <h3 class="video-title" data-tp="copy">Pour votre accompagner au mieux</h3>
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
                <h2 class="tab-panel-title text-center" data-tp="copy">LG AI comprend vos besoins et vous propose des solutions pour que votre vie soit la plus agréable.</h2>
                <!-- S : video-bx -->
                <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                  <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Une mère et son fils utilisent ensemble une machine à laver LG AI, tournant le bouton pour activer AI Wash. Un homme utilisant l’ordinateur portable LG gram apparaît dans la même séquence.</span>
                  <h3 class="video-title" data-tp="copy">Pour votre accompagner au mieux</h3>
                  <button type="button" class="play-btn" aria-label="Play video"></button>
                </div>
                <!-- E : video-bx -->
                <!-- S : product-list -->
                <ul class="product-list">
                  <li class="product-item">
                    <a href="https://www.lg.com/be_fr/menage/lg-f4wx809y" data-tp="link">
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="Vue de face du produit LG Washing Machine AI " loading="lazy" data-tp="alt">
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
                <h2 class="tab-panel-title text-center" data-tp="copy">LG IA prend soin de vous et de votre environnement  pour que votre vie soit agréable, comme vous le souhaitez..</h2>
                <!-- S : video-bx -->
                <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                  <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Un homme entre dans le bureau en tenant une laisse pour chien. Un homme sur le siège conducteur a l’air triste pendant que LG AI lui montre une photo de famille. L’écran de la voiture est montré en gros plan pendant que LG AI affiche une carte et ravive un souvenir.</span>
                  <h3 class="video-title" data-tp="copy">Pour votre accompagner au mieux</h3>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Utilisateur interagissant avec une interface tactile alimentée par une solution HMI à IA multimodale, sélectionnant un menu de café avec une commande de l’assistant IA" loading="lazy" data-tp="alt">
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
            <button class="tab active" role="tab" aria-selected="true" aria-controls="feature-panel-1" id="feature-tab-1" data-tp="copy">Votre TV</button>
            <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-2" id="feature-tab-2" data-tp="copy">Audio</button>
            <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Electroménagers</button>
            <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Climatisation</button>
            <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-5" id="feature-tab-5" data-tp="copy">Informatique</button>
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
                  Évolue pour répondre à toutes vos envies</h2>
                <!-- E : tab-panel-title -->
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text" data-tp="copy">LG IA TV détecte vos préférences et comprend votre manière de vivre pour optimiser chaque aspect de votre expérience télévisuelle, créant ainsi un divertissement idéal et personnalisé, rien que pour vous.</p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Au-dessus de la télécommande LG Magic Remote, des fonctionnalités telles que AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard et AI Sound Wizard sont affichées." loading="lazy" data-tp="alt">
                  </picture>
                  <div class="text-bx">
                    <h3 class="title" data-tp="copy">Découvrez la prochaine génération de <br>
                      téléviseurs LG AI</h3>
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
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="Sur l’écran d’un téléviseur LG OLED se trouve la page d’accueil de webOS 25 remplie d’applications et de contenus de divertissement. À côté du téléviseur se trouve la télécommande LG AI Magic Remote, dont le bouton IA est mis en surbrillance comme s’il avait été activé par la voix de l’utilisateur. Une bulle de dialogue à côté dit : « suggère un film que j’aimerai »." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Voice ID</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="Écran de téléviseur LG OLED montrant le fonctionnement de AI Search. Une petite fenêtre de chat est ouverte, montrant que l’utilisateur a demandé quels matchs sportifs sont disponibles. La recherche IA a répondu via le chat et en affichant des vignettes de différents contenus disponibles. Une invite propose également de poser une question à Microsoft Copilot." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Search</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="La télécommande LG AI Magic Remote en cours d’utilisation. Une courte pression sur le bouton IA active l’assistant IA sur l’écran du téléviseur OLED, qui suggère ensuite des mots-clés." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Concierge</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Un contenu de science-fiction est en cours de lecture sur un téléviseur LG OLED. Sur le côté gauche de l’écran se trouve l’interface du chatbot IA. L’utilisateur envoie un message au chatbot disant que l’écran est trop sombre, et le chatbot propose des solutions à la demande." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Chatbot</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Femme chantant dans un microphone avec des écouteurs, mise en valeur par l’amélioration sonore du processeur LG α11 AI" data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Picture/Sound Wizard</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Deux scènes connectées avec la télécommande LG AI Magic Remote devant un téléviseur — la première montrant une scène de science-fiction, la seconde affichant un écran d’accueil avec du contenu personnalisé" data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Magic Remote</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li data-tp="copy">*Les fonctions d'IA de LG utilisent des algorithmes formés basés sur l'apprentissage profond pour la mise à l'échelle de l'image et le mixage du son en temps réel.</li>
                  <li data-tp="copy">**Tous les téléviseurs LG webOS 24 sont dotés de la fonction de personnalisation de l'IA, à l'exception de ceux qui ne sont pas équipés de capteurs de lumière.</li>
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
                  </picture>
                  Un son unique</h2>
                <!-- E : tab-panel-title -->
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text" data-tp="copy">LG xboom IA analyse et ajuste le son en fonction du style de musique et de l'environnement. Avec l'éclairage IA qui améliore l'ambiance et s'harmonise avec votre musique, vous pouvez profiter d'un son et d'une ambiance uniques.</p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Une femme et un homme s’enlacent dans le salon, avec l’enceinte XBOOM allumée à côté d’eux." loading="lazy" data-tp="alt">
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
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="Enceinte LG XBOOM avec des modes sonores IA incluant Bass Boost, Voice Enhance et Standard." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Sound</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="Enceinte LG XBOOM avec éclairage IA qui s’adapte aux modes voix, ambiance et fête." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Lighting</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="Enceinte LG XBOOM posée sur une table dans une pièce aux tons rouges, avec des murs à motif de grille et un mobilier moderne." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Calibration</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li data-tp="copy">*Ce produit n'est pas encore disponible</li>
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
                  Facilitez vos tâches ménagères</h2>
                <!-- E : tab-panel-title -->  
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text" data-tp="copy">LG WashTower IA détecte le type de vêtements et le poids dans le tambour,  afin d'adapter le lavage et améliorer le soin des textiles, vous garantissant ainsi une lessive facilitée à chaque fois.</p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="Lave-linge et sèche-linge LG encastrés en colonne dans une buanderie moderne avec des armoires en bois et un banc intégré." loading="lazy" data-tp="alt">
                  </picture>
                  <div class="text-bx">
                    <h3 class="title" data-tp="copy">Découvrez une nouvelle façon de vivre <br>
                      avec LG AI Core Tech</h3>
                    
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
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Main ajustant le cycle AI Wash sur une machine à laver LG à l’aide du bouton de commande intelligent." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Wash</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Utilisateur sélectionnant le cycle AI Dry sur un sèche-linge LG à l’aide du bouton de commande numérique." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Dry</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li data-tp="copy">*Ce produit sera commercialisé progressivement dans certains pays.</li>
                  <li data-tp="copy">**La détection de l'IA est activée lorsque la charge est inférieure à 6 kg.</li>
                  <li data-tp="copy">***Le lavage IA ne doit être utilisé qu'avec des types de tissus similaires [tous les tissus ne sont pas détectés] et un détergent adapté.</li>
                  <li data-tp="copy">****AI Dry n'est disponible que pour les charges inférieures à 5 kg avec des tissus présentant les mêmes niveaux d'absorption d'humidité.</li>
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
                  Le confort grâce à une température parfaitement adaptée</h2>
                <!-- E : tab-panel-title -->
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text" data-tp="copy">LG DUALCOOL IA veille toujours à ce que la qualité de l'air soit idéale tout en optimisant les coûts énergétiques. Faites l'expérience du confort.</p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="Le climatiseur LG DUAL Inverter rafraîchit un salon moderne avec vue sur l’océan, alimenté par la technologie ThinQ AI." loading="lazy" data-tp="alt">
                  </picture>
                  <div class="text-bx">
                    <h3 class="title text-black" data-tp="copy">Découvrez un confort optimisé <br>
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
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Femme se relaxant dans un salon intelligent pendant que le climatiseur LG AI ajuste automatiquement la température, le flux d’air et l’humidité." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI Air</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="Interface de smartphone affichant un graphique de consommation d’énergie devant le climatiseur LG, mettant en avant AI kW Manager pour un suivi efficace de l’énergie." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">AI kW Manager</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li data-tp="copy">*L'IA Air peut être commandé par la télécommande et l'application ThinQ.</li>
                  <li data-tp="copy">** L'IA Air est disponible en mode refroidissement et en mode chauffage.</li>
                  <li data-tp="copy">*** Lors de l'utilisation, le volume d'air et la direction du vent sont automatiquement ajustés en fonction de l'environnement, et l'IA Air est désactivé lorsque la direction du vent change.</li>
                  <li data-tp="copy">**** Lorsque l'IA Air est activé, le capteur radar détecte l'emplacement de l'occupant et active automatiquement le vent direct/indirect.</li>
                  <li data-tp="copy">***** La distance de détection du capteur radar est de 5 m maximum, et il peut y avoir des différences dans la distance de détection en fonction de l'installation et de l'environnement d'utilisation du produit.</li>
                  <li data-tp="copy">****** Cette fonction ne fonctionne qu'avec les modèles dotés de capteurs radar.LG DUALCOOL IA veille toujours à ce que l'air soit optimal, à ce que vous soyez à l'aise tout en optimisant l'efficacité énergétique. et en réduisant les coûts. Avec LG IA Air, faites l'expérience d'un rafraîchissement parfaitement adapté à votre confort.</li>
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
                  Le pouvoir de vos actions</h2>
                <!-- E : tab-panel-title -->
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text" data-tp="copy">Le LG gram IA vous permet de travailler en ligne et hors ligne. Recherchez et classez des fichiers en toute sécurité hors ligne avec gram chat on-device, et augmentez votre productivité en ligne.</p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-banner-mobile.png" alt="Une femme utilise un ordinateur portable LG gram avec une configuration à double écran pour des visioconférences et du multitâche dans son bureau à domicile." loading="lazy" data-tp="alt">
                  </picture>
                  <div class="text-bx">
                    <h3 class="title text-black" data-tp="copy">Libérez vos nouvelles capacités sans limites <br>avec LG gram AI</h3>
                    
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
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature01.png" alt="Ordinateur portable LG gram avec IA intégrée, affichant l’interface de l’assistant intelligent à l’écran." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">gram Chat On-Device</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-computing-feature02.png" alt="Ordinateur portable LG gram avec IA en cloud, affichant l’interface de l’assistant intelligent pour le support en ligne et la productivité." data-tp="alt">
                        </div>
                        <p class="slide-title" data-tp="copy">gram Chat Cloud</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li data-tp="copy">*Au début de l'utilisation du produit, certaines fonctions peuvent être longues à démarrer. Cela est dû à la nature de l'IA sur appareil, qui nécessite un temps de préapprentissage pour s'adapter à l'utilisateur.</li>
                  <li data-tp="copy">*Le programme Chat On-Device nécessite des tâches d'indexation pour localiser le contenu sur votre PC en combinant des mots avec des données, ce qui peut prendre un certain temps avant d'obtenir les résultats souhaités.</li>
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
        <h2 class="thinq-section-title" data-tp="copy">ThinQ® aide à faire bouger les lignes</h2>
        <p class="thinq-section-text" data-tp="copy">Une personne tient un smartphone avec l’application LG ThinQ ouverte, gérant les appareils domestiques intelligents tout en buvant un café.</p>
        <a href="https://www.lg.com/be_fr/electromenager/thinq" class="white-btn" data-tp="copy link">En savoir plus</a>
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
            <p class="text" data-tp="copy">Dites à votre appareil exactement et simplement ce dont vous avez besoin; et votre Allié Intelligent écoutera et vérifiera le cycle piur vous.</p>
          </div>
        </div>
        <!-- E : thinq-flex-bx -->
        <!-- S : thinq-flex-bx -->
        <div class="flex-bx reverse">
          <div class="img-bx">
            <figure>
              <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Un smartphone affiche l’application LG ThinQ contrôlant le four LG InstaView Slide-In Range, permettant un entretien efficace du produit dans la cuisine." loading="lazy" data-tp="alt">
            </figure>
          </div>
          <div class="text-bx">
            <h3 class="title" data-tp="copy">Maintenance efficace des produits</h3>
            <p class="text" data-tp="copy">Grâce à l'application LG ThinQ, vérifiez votre appareil, téléchargez de nouvelles options, surveillez l'utilisation des cycles, et bien plus encore.</p>
          </div>
        </div>
        <!-- E : thinq-flex-bx -->
      </div>
    </section>
    <!-- E : thinq-section (Local)-->
    <!-- S : stories-section -->
    <section class="stories-section">
      <div class="inner">
          <h2 class="title" data-tp="copy">En savoir plus sur votre Allié Intelligent LG </h2>
          <div class="slide-bx">
              <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                  <div class="swiper-wrapper">
                      <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                          <picture>
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                            <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="Cadre de LG Electronics tenant un certificat d’accréditation en cybersécurité, avec un graphique de sécurité numérique en arrière-plan" loading="lazy" data-tp="alt">
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
                            <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Visiteurs regardant l’écran LED incurvé de LG présentant le slogan « Life's Good 24/7 » lors d’un salon technologique" loading="lazy" data-tp="alt">
                          </picture>
                          <div class="txt-bx">
                              <p data-tp="copy">LG présente ses dernières innovations alimentées par « Affectionate Intelligence » au CES 2025</p>
                              <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">En savoir plus</a>
                          </div>
                      </div>
                      <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                          <picture>
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                            <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Conférencier présentant des solutions B2B alimentées par l’IA sur scène lors d’un événement LG" loading="lazy" data-tp="alt">
                          </picture>
                          <div class="txt-bx">
                              <p data-tp="copy">LG dévoile une journée dans la vie avec « Affectionate Intelligence » lors du LG World Premiere</p>
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
