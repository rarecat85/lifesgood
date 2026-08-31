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
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, Human-Centered AI, Smart Life Platform, Technology-Forward Solutions">
    <meta name="Description" content="Learn how LG AI, powered by Affectionate Intelligence, brings warmth and awareness to technology—creating smart, human-centered experiences across your daily life.">
    <meta property="og:title" content="Discover LG AI and Affectionate Intelligence | LG USA"/>
    <meta property="og:url" content="https://www.lg.com/us/affectionate-intelligence-ai">
    <meta property="og:description" content="Learn how LG AI, powered by Affectionate Intelligence, brings warmth and awareness to technology—creating smart, human-centered experiences across your daily life."/>
    <meta property="og:image" content="">
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/head-css.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/font-woff.jsp"/>
    <!-- // default code -->
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/mic-head-script.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/gateway-foresee.jsp"/>

    <!-- your -->
    <link href="../common/css/ai-gate-reset.css" rel="stylesheet" type="text/css" />
    <link href="../common/css/ai-gate-font.css" rel="stylesheet" type="text/css" />
    <link href="../common/css/ai-gate-swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <link href="./assets/css/ai-gate-css.css" rel="stylesheet" type="text/css" />

    <script src="../common/js/ai-gate-swiper-bundle.min.js"></script>
    <script src="./assets/js/ai-gate-js-layer.js" defer></script>
    <script src="./assets/js/ai-gate-js-common.js" defer></script>

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
    <meta itemprop="description" content="Learn how LG AI, powered by Affectionate Intelligence, brings warmth and awareness to technology—creating smart, human-centered experiences across your daily life."/>
    <meta itemprop="Keywords" content="LG AI, Affectionate Intelligence, Human-Centered AI, Smart Life Platform, Technology-Forward Solutions"/>
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
            <div class="video-bx responsive-video" 
            data-desktop-video-src="./assets/video/ai-gate-video-kv-video-desktop.mp4" 
            data-mobile-video-src="./assets/video/ai-gate-video-kv-video-mobile.mp4"
            data-desktop-poster-src="./assets/image/ai-gate-image-kv-desktop.png" 
            data-mobile-poster-src="./assets/image/ai-gate-image-kv-mobile.png" 
            aria-labelledby="kv-video-description">
            <h1 id="kv-video-description" class="a11y-text">Hero video introducing LG Affectionate Intelligence — LG's human-centered AI philosophy. Scene 1: A woman walks by as smart lighting activates automatically (Sensing wisely). Scene 2: A couple embraces as the LG xboom AI speaker plays mood music (Understanding deeply). Scene 3: An LG AI car cabin display shows a family photo to comfort a tired driver (Caring warmly). Scene 4: An LG AI TV recommends a live soccer match. Scene 5: Family of three with their dog watching LG AI TV with xboom audio. Scene 6: Mother and son operating LG AI Wash washing machine together. Scene 7: AI Wash dial close-up alongside LG gram AI laptop user. Scene 8: LG AI Vehicle HMI assists a couple in their car. Scene 9: LG AI air purifier auto-activates as a man enters his office with his dog. Final scene: LG AI logo with the tagline "Affectionate Intelligence for YOU."</h1>
            <button type="button" class="play-btn" aria-label="Play video"></button>
            </div>
          </div>
        </section>
        <!-- E : kv-section -->
        <!-- S : overview-section -->
        <section class="overview-section">
          <div class="inner">
            <picture>
              <source media="(min-width: 768px)" srcset="./assets/image/ai-gate-image-overview-ai-logo-desktop.svg">
              <source media="(max-width: 767px)" srcset="./assets/image/ai-gate-image-overview-ai-logo-mobile.svg">
              <img src="./assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="LG AI" class="ai-logo">
            </picture>
            <h2 class="title">
              <span class="gradient-text">Affectionate Intelligence</span> for YOU
            </h2>
            <p class="text">
              At LG, we've been asking ourselves: what should AI exist for? <br>
              After much reflection, we've found our answer. <br><br>
              For us, AI goes beyond Artificial Intelligence. It is Affectionate Intelligence, <br>
              built on LG's human-centered AI philosophy to learn who you are, <br> 
              adapt to your lifestyle, and care for you in everyday life. <br><br>
              As AI becomes a part of our daily lives, <br>
              it should help create the better life we all deserve.<br><br>
              That's why LG AI starts with YOU affectionately. <br>
              Through sensing, understanding, and caring for every moment of your life.
              <strong>Discover how Life's Good with LG AI</strong>
            </p>
            <img src="./assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Scroll down icon" class="scroll-down-icon">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1">Delightful life</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2">Effortless life</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3">Well-cared life</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center">LG AI learns your routines and preferences, turning everyday viewing and listening into delightfully personalized moments.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" 
                      data-desktop-video-src="./assets/video/ai-gate-video-benefit01-banner-desktop.mp4" data-mobile-video-src="./assets/video/ai-gate-video-benefit01-banner-mobile.mp4"
                      data-desktop-poster-src="./assets/image/ai-gate-image-benefit01-banner-desktop.png" 
                      data-mobile-poster-src="./assets/image/ai-gate-image-benefit01-banner-mobile.png" 
                      aria-labelledby="benefit01-banner-video-description"
                      >
                      <span id="benefit01-banner-video-description" class="a11y-text">A couple sits on the sofa watching a live soccer broadcast on their LG AI TV in the living room. The scene transitions to the couple embracing as the LG xboom AI speaker activates beside them, syncing AI-tuned sound and lighting to the mood.</span>
                      <h3 class="video-title">For your delightful life</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/us/tvs/lg-oled77w6pua-oled-4k-tv">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit01-products01.png" alt="LG OLED evo AI product front view" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/us/tvs/lg-75mrgb95bua-mrgb-4k-tv">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit01-products02.png" alt="LG Micro RGB evo product front view" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/us/tvs/lg-100qned84bu-qned-4k-tv">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit01-products03.png" alt="LG QNED evo AI product front view" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/us/tvs/lg-55ua7700pub-4k-uhd-tv">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit01-products04.png" alt="LG NANO 4K UHD AI product front view" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/us/speakers/lg-xboom-stage-501-party-speaker">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit01-products05.png" alt="LG xboom AI product front view" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/us/monitors/lg-39gx950b-b-gaming-monitor">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit01-products06.png" alt="LG UltraGear evo AI product front view" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-1 -->
                <!-- S : tab-panel tab-2 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-2" id="product-panel-2" hidden>
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center">LG AI senses your needs in real time, delivering smart home solutions so daily life flows to your rhythm.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" 
                      data-desktop-video-src="./assets/video/ai-gate-video-benefit02-banner-desktop.mp4" data-mobile-video-src="./assets/video/ai-gate-video-benefit02-banner-mobile.mp4"
                      data-desktop-poster-src="./assets/image/ai-gate-image-benefit02-banner-desktop.png" 
                      data-mobile-poster-src="./assets/image/ai-gate-image-benefit02-banner-mobile.png" 
                      aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text">A mother and her son operate the LG AI WashTower together, turning the AI Wash dial to start a fabric-optimized cycle. The scene transitions to a man using his LG gram AI laptop, securely searching files with on-device AI.</span>
                      <h3 class="video-title">For your effortless life</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/us/laptops/lg-16z90u-g.au85u1-gram-laptop">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit02-products05.png" alt="LG gramPro AI product front view" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-2 -->
                <!-- S : tab-panel tab-3 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-3" id="product-panel-3" hidden>
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center">LG AI cares for you and your space, delivering optimized indoor air, energy efficiency, and advanced driver-assistance systems. </h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" 
                      data-desktop-video-src="./assets/video/ai-gate-video-benefit03-banner-desktop.mp4" data-mobile-video-src="./assets/video/ai-gate-video-benefit03-banner-mobile.mp4"
                      data-desktop-poster-src="./assets/image/ai-gate-image-benefit03-banner-desktop.png" 
                      data-mobile-poster-src="./assets/image/ai-gate-image-benefit03-banner-mobile.png" 
                      aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text">A man arrives at the office with his dog, and the LG AI air purifier auto-activates as he enters. The scene transitions to a man in his car's driver seat looking weary; LG's Multimodal AI HMI gently surfaces a family photo on the in-vehicle display. A close-up shows the LG ADAS Vision System mapping a familiar route home.</span>
                      <h3 class="video-title">For your well-cared life</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/global/business/mobility/adas-vision-system/">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit03-products04.png" alt="ADAS Vision System powered by LG AI Mobility – camera module and in-vehicle display interface" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/business/mobility/digital-cockpit/">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit03-products05.png" alt="Digital Cockpit powered by LG AI Mobility – autonomous vehicle with AI cockpit seat in an urban setting" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/business/mobility/software/">
                          <div class="img-bx">
                            <img src="./assets/image/ai-gate-image-benefit03-products06.png" alt="LG αWare powered by LG AI Mobility – rear view of a concept electric vehicle with red light strip accent" loading="lazy">
                          </div>
                          <span class="link-btn">Learn more</span>
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
                <button class="tab active" role="tab" aria-selected="true" aria-controls="feature-panel-1" id="feature-tab-1">TV</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-2" id="feature-tab-2">Audio</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3">Appliances</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4">Air Conditioning</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-5" id="feature-tab-5">Computing</button>
              </div>
              <!-- E : tab-list -->
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-1" id="feature-panel-1">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-tv-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="LG AI TV" class="eyebrow-logo" loading="lazy">
                      </picture> 
                      Evolves to satisfy your every entertainment need 
                    </h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text">
                      LG AI TV is a webOS-based smart TV powered by an alpha 5 AI Processor or higher, designed to learn your viewing preferences and lifestyle through deep learning algorithms, automatically optimizing picture, sound, and content recommendations to deliver personalized entertainment crafted just for you.
                    </p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Above the LG Magic Remote, features such as AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard, and AI Sound Wizard are displayed." loading="lazy">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title">
                          Meet the next generation of <br>
                          LG AI TV — Powered by webOS
                        </h3>
                        <a href="https://www.lg.com/global/lg-ai/ai-tv/" class="white-btn layer-open layer-tv">Learn more</a>
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
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature01.png" alt="The LG AI Magic Remote with key LG AI TV features highlighted above it: AI Voice ID for voice recognition, AI Search for content discovery, AI Chatbot for natural-language assistance, AI Concierge for personalized recommendations, AI Picture Wizard for tailored visuals, and AI Sound Wizard for custom audio.">
                            </div>
                            <p class="slide-title">AI Voice ID</p>
                            <p class="slide-desc">AI Voice ID recognizes individual users by their voice and instantly loads their personal profile — surfacing recommendations, watchlists, and app preferences tailored to whoever is speaking. Available on LG OLED, QNED, NanoCell, and UHD TVs from 2024 onwards.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature02.png" alt="LG OLED AI TV screen demonstrating AI Search in action. A small chat window shows the user's natural-language question about available sports games; AI Search responds with both a chat reply and thumbnail tiles of matching live content. A prompt invites the user to ask Microsoft Copilot for deeper answers.">
                            </div>
                            <p class="slide-title">AI Search</p>
                            <p class="slide-desc">AI Search lets you find content using natural-language questions instead of keyword commands. Ask "what sports games are on tonight?" and AI Search returns thumbnails, schedules, and additional results powered by Microsoft Copilot. In the US and Korea, AI Search runs on a Large Language Model (LLM).</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature03.png" alt="The LG AI Magic Remote in use — a short press of the dedicated AI button activates AI Concierge on the OLED AI TV screen, which then suggests personalized keywords and content recommendations based on viewing history.">
                            </div>
                            <p class="slide-title">AI Concierge</p>
                            <p class="slide-desc">AI Concierge gets to know you through your watch history and viewing patterns, then surfaces personalized keywords and content recommendations with a single short press of the AI button on the LG AI Magic Remote.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Sci-fi content plays on an LG OLED AI TV. The AI Chatbot interface appears on the left side of the screen as the user messages &quot;the screen is too dark.&quot; The chatbot understands the request and offers tailored solutions, demonstrating natural-language troubleshooting on LG webOS.">
                            </div>
                            <p class="slide-title">AI Chatbot</p>
                            <p class="slide-desc">AI Chatbot understands and resolves your TV-related requests in plain conversation. Speak naturally and the chatbot classifies your intent, adjusts settings, troubleshoots issues, and even links to LG customer service when needed. Available in regions supporting native-language NLP.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Woman singing into a microphone with headphones, her vocal performance enhanced by LG's α11 AI Processor — illustrating how AI Sound Wizard remasters voice clarity in real time on LG AI TVs.">
                            </div>
                            <p class="slide-title">AI Picture/Sound Wizard</p>
                            <p class="slide-desc">AI Picture Wizard analyzes 1.6 billion image possibilities to learn your visual preferences, while AI Sound Wizard tunes audio from 40 million sound parameters. Together, they create a picture and sound profile uniquely tailored to your eyes and ears, saved to your TV profile.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Two connected scenes featuring the LG AI Magic Remote in front of an LG AI TV — the first shows immersive sci-fi content with AI-enhanced picture, the second shows the webOS home screen with personalized content recommendations powered by AI Concierge.">
                            </div>
                            <p class="slide-title">AI Magic Remote</p>
                            <p class="slide-desc">The LG AI Magic Remote replaces traditional buttons with an intuitive point-and-click motion sensor and scroll wheel. A single click activates AI features, while a dedicated AI button instantly brings up AI Voice ID, AI Search, AI Concierge, and AI Chatbot.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature07.png" alt="Visual effect graphic emphasizing a man standing in front of an antique architectural structure.">
                            </div>
                            <p class="slide-title">AI Picture Pro</p>
                            <p class="slide-desc">AI Picture Pro analyzes each scene in fine detail, pixel by pixel, to enhance resolution, brightness, contrast, and sharpness. With Dual Upscaling & Dynamic Tone Mapping Ultra and AI HDR Remastering, enjoy picture quality full of life.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-tv-feature08.png" alt="Immersive sound wave graphics radiating from a man and woman talking in a concert setting.">
                            </div>
                            <p class="slide-title">AI Sound Pro</p>
                            <p class="slide-desc">AI Sound Pro analyzes audio in real time to deliver sound tailored to your content. With AI Voice Remastering Pro and Virtual 11.1.2 Surround, feel sound that's deeper and richer than ever.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li>* LG AI TVs refer to webOS-based TVs with alpha 5 AI Processor or higher, supporting AI features such as content recommendations, AI Picture, and AI Sound. A network connection is required for select AI features.</li>
                      <li>** LG AI features use deep learning-based trained algorithms for real-time image upscaling and sound upmixing.</li>
                      <li>*** All LG webOS 24 TVs feature AI Customization, excluding those without light sensors.</li>
                      <li>**** Specifications vary across alpha AI processor models.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-1 -->
                <!-- S : panel tab-2 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-2" id="feature-panel-2">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-audio-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="LG AI Audio" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Sounds Uniquely Right
                    </h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text">
                      LG xboom AI is a portable Bluetooth speaker series that analyzes your music in real time and automatically adjusts EQ to suit each genre and listening space. Paired with AI Lighting that detects mood and harmonizes visual ambiance with sound, the xboom AI lineup (Grab, Bounce, Stage 301) delivers sound and atmosphere uniquely tailored to every moment.
                    </p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="A woman and a man embrace in the living room, with the LG xboom speaker turned on beside them." loading="lazy">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title">
                          Enjoy a new sound experience <br>with 
                          LG xboom AI
                        </h3>
                        <a href="javascript:void(0)" class="white-btn layer-open layer-audio">Learn more</a>
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
                              <img src="./assets/image/ai-gate-image-product-category-audio-feature01.png" alt="AI Sound automatically analyzes incoming audio and adjusts EQ in real time — emphasizing rhythm, melody, or vocals based on genre. Choose modes like Bass Boost, Voice Enhance, or Standard manually, or let AI select the optimal mode for whatever you're playing.">
                            </div>
                            <p class="slide-title">AI Sound</p>
                            <p class="slide-desc">AI Sound automatically analyzes incoming audio and adjusts EQ in real time — emphasizing rhythm, melody, or vocals based on genre. Choose modes like Bass Boost, Voice Enhance, or Standard manually, or let AI select the optimal mode for whatever you're playing.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-audio-feature02.png" alt="LG xboom AI speaker with AI Lighting LEDs glowing in different modes: Voice mode highlighting vocal frequencies, Ambient for relaxed listening, and Party for dynamic gatherings.">
                            </div>
                            <p class="slide-title">AI Lighting</p>
                            <p class="slide-desc">AI Lighting detects the genre and mood of your music and syncs LED lighting effects in real time — choose from Ambient, Party, or Voice modes via the LG ThinQ app, or let AI auto-select the lighting that best matches each track.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-audio-feature03.png" alt="A soundbar emitting rich, immersive sound wave patterns from its top and bottom.">
                            </div>
                            <p class="slide-title">AI Sound Pro+</p>
                            <p class="slide-desc">AI Sound Pro+ identifies the genre and sound of your content, then separates the original dialogue, music, and effects to remaster each with precision — adding a virtual surround layer so crisp detail and a sense of space come together in perfect balance.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li>* Select LG xboom AI models are released throughout 2025–2026 in global markets.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-2 -->
                <!-- S : panel tab-3 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-3" id="feature-panel-3">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-desktop.svg" alt="LG AI Appliances" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Lightens your every load
                    </h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text">
                      LG WashTower AI is a stacked washer-dryer combo powered by AI DD™ (AI Direct Drive) technology. Built-in sensors automatically detect fabric type and load weight in real time, then adjust drum motions, water levels, and detergent dosing to optimize each cycle for sensitive fabric care, every load, every time.
                    </p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="LG WashTower AI — a built-in stacked washer and dryer combo featuring AI DD™ technology, installed in a modern laundry room with warm wood cabinetry and bench seating." loading="lazy">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title">
                          Discover a new way of life <br>
                          with LG AI Core Tech
                        </h3>
                        <a href="https://www.lg.com/global/lg-ai-core-tech/washing-machine-dryer/" class="white-btn layer-open layer-appliances">Learn more</a>
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
                              <img src="./assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="A A hand adjusting AI Wash cycle on LG washing machine using smart control dial">
                            </div>
                            <p class="slide-title">AI Wash</p>
                            <p class="slide-desc">AI Wash uses LG's AI DD™ (AI Direct Drive) technology to detect fabric softness and load weight via built-in sensors, then optimizes drum motions across 6 unique patterns. This protects delicate clothes, reducing wear by up to 15%, and saving energy on every cycle.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="User selecting AI Dry cycle on LG dryer using digital control dial">
                            </div>
                            <p class="slide-title">AI Dry</p>
                            <p class="slide-desc">AI Dry detects fabric type and moisture levels through advanced sensors and customizes drying time and temperature accordingly to deliver perfectly dried clothes every time, with 10-year warranty coverage on the AI Inverter motor.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-appliances-feature03.png" alt="A 4-door refrigerator highlighting its fresh food storage feature with a vegetable icon.">
                            </div>
                            <p class="slide-title">AI Saving Mode</p>
                            <p class="slide-desc">AI Saving Mode learns your refrigerator usage and door-opening habits over three weeks to manage energy optimally. During low-usage hours, it automatically adjusts cooling, and when "Max Saver" mode is active, it cuts energy consumption, easing your electricity bill. Set it up in the LG ThinQ app.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-appliances-feature04.png" alt="A white four-door refrigerator in a modern kitchen, overlaid with a gray circular icon of leafy vegetables.">
                            </div>
                            <p class="slide-title">AI Fresh</p>
                            <p class="slide-desc">AI Fresh analyzes your refrigerator usage patterns, anticipates when you tend to open the door, and tops up cooling in advance, keeping the internal temperature steady even as you open it. So your ingredients stay fresh as the day you bought them, with no worry about spoilage.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li>* This product is being released gradually in select countries throughout 2025–2026.</li>
                      <li>** AI sensing on the LG WashTower activates when the load is under 6kg (most LG AI DD washers activate AI sensing under 3kg).</li>
                      <li>*** AI Wash performs best with similar fabric types — not all fabrics are detected — and requires suitable detergent.</li>
                      <li>**** AI Dry is available for loads under 5kg with fabrics of similar moisture absorption levels.</li>
                      <li>***** Energy savings tested by Intertek (Nov 2023): AI Wash showed reduced energy consumption versus standard Cotton cycle on a 3kg mixed soft-fabric load (Model F4X7VYP15). Results may vary.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-3 -->
                <!-- S : panel tab-4 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-4" id="feature-panel-4">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-desktop.svg" alt="LG AI Air Conditioning" class="eyebrow-logo" loading="lazy">
                      </picture> 
                      Comforts with perfectly tuned cooling
                    </h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text">
                      LG DUALCOOL AI is a smart air conditioner powered by LG AI Air technology. Built-in radar sensors detect occupant location within a 5-meter range and automatically adjust airflow direction and intensity, while AI kW Manager monitors energy use in real time to balance comfort with efficiency and reduce running costs.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="The LG DUAL Inverter air conditioner cools a modern ocean-view living room, powered by ThinQ AI technology." loading="lazy">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black">
                          Experience optimized comfort <br>
                          with LG AI Air
                        </h3>
                        <a href="javascript:void(0)" class="white-btn layer-open layer-conditioning">Learn more</a>
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
                              <img src="./assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Woman relaxing in a smart living room while the LG DUALCOOL AI air conditioner automatically adjusts temperature, airflow, and humidity — its radar sensor detecting her position to deliver personalized indirect cooling.">
                            </div>
                            <p class="slide-title">AI Air</p>
                            <p class="slide-desc">AI Air uses radar sensors to detect occupant location within a 5-meter range and automatically switches between direct and indirect airflow, keeping you comfortable while saving energy by avoiding unnecessary cooling of empty spaces. Available in both cooling and heating modes.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="A wall-mounted air conditioner operating in a living room, gently circulating airflow.">
                            </div>
                            <p class="slide-title">AI DUAL Inverter</p>
                            <p class="slide-desc">AI Dual Inverter fine-tunes motor speed in real time rather than cycling the compressor on and off for faster cooling, steadier temperatures, and less energy used. Learning your usage patterns and sensing room conditions, it keeps comfort powerful and quiet.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-air-conditioning-feature03.png" alt="A wall-mounted air conditioner blowing a wide, powerful stream of cool air downward.">
                            </div>
                            <p class="slide-title">AI Freeze Cleaning </p>
                            <p class="slide-desc">AI Freeze Cleaning makes the inside of your air conditioner effortless to clean. AI detects when it's time, then freezes and thaws moisture on the heat exchanger so the runoff flushes out pollutants, reducing harmful bacteria for a fresher home.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li>* The AI Air can be operated via remote control and ThinQ.</li>
                      <li>** The AI Air is available in both cooling and heating modes.</li>
                      <li>*** While using AI Air, the air volume and wind direction are automatically adjusted according to the situation, and AI Air is turned off when the wind direction is changed.</li>
                      <li>**** When AI Air is activated, the radar sensor detects the location of the occupant and automatically activates the direct/indirect wind.</li>
                      <li>***** The sensing distance of the radar sensor is up to 6m, and there may be differences in the sensing distance depending on the installation and usage environment of the product.</li>
                      <li>****** This function works only with models that have radar sensors.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-4 -->
                <!-- S : panel tab-5 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="feature-tab-5" id="feature-panel-5">
                  <div class="tab-panel-inner">
                    <!-- S : tab-panel-title -->
                    <h2 class="tab-panel-title">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-computing-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-computing-eyebrow-logo-mobile.svg" alt="LG AI Computing" class="eyebrow-logo" loading="lazy">
                      </picture>  
                      Powers everything you do
                    </h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text">
                      LG gram AI is an ultra-lightweight laptop powered by Hybrid AI. It combines gram chat On-Device, which runs locally on LG's EXAONE language model for secure offline file search and summarization, with gram chat Cloud, powered by GPT-4o for online research and complex tasks. Together they deliver privacy-first productivity that works wherever you do.
                    </p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./assets/image/ai-gate-image-product-category-computing-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./assets/image/ai-gate-image-product-category-computing-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./assets/image/ai-gate-image-product-category-computing-banner-mobile.png" alt="A woman uses her LG gram AI laptop with a dual-screen setup for video conferencing and multitasking in her home office. Hybrid AI seamlessly switches between gram chat On-Device for offline tasks and gram chat Cloud for online research." loading="lazy">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black">
                          Unleash new abilities <br>
                          without limits — Powered by LG gram AI
                        </h3>
                        <a href="javascript:void(0)" class="white-btn layer-open layer-computing">Learn more</a>
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
                              <img src="./assets/image/ai-gate-image-product-category-computing-feature01.png" alt="LG gram AI laptop displaying the gram chat On-Device interface, a privacy-first smart assistant that runs locally on LG's EXAONE model for secure offline file search and summarization.">
                            </div>
                            <p class="slide-title">gram Chat On-Device</p>
                            <p class="slide-desc">gram chat On-Device runs locally on LG's EXAONE language model, letting you securely search, summarize, and translate documents on your PC without sending any data to the cloud, even when offline. Requires 16 GB of system memory.</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./assets/image/ai-gate-image-product-category-computing-feature02.png" alt="LG gram AI laptop displaying the gram chat Cloud interface, powered by GPT-4o, a smart assistant that handles complex online research, multi-document synthesis, and creative tasks for boosted productivity.">
                            </div>
                            <p class="slide-title">gram Chat Cloud</p>
                            <p class="slide-desc">gram chat Cloud is powered by GPT-4o, delivering advanced online research, complex problem-solving, and creative ideation, all with one year of free Cloud features ($240 value) for 2025 LG gram AI buyers. Cloud does not collect personal prompts.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li>* In initial stages of product use, some features may not function smoothly as on-device AI requires pre-training time to adapt to the user.</li>
                      <li>** gram chat On-Device requires indexing tasks to locate content on your PC by combining words with data, which may take some time to yield desired results.</li>
                      <li>*** Time Travel: Search functionality becomes available after 5 minutes. The system captures PC screen approx. once every 2 seconds, with storage capacity of about 13GB. Captured images are automatically deleted after a certain period. Users can modify feature settings, including screen storage duration, and capacity by clicking the gear icon at top of gram Chat.</li>
                      <li>**** AI Search: Responses may vary depending on data available at time of search. Accuracy cannot be guaranteed, so user verification is necessary. Only documents containing keywords (*.doc(x), *.ppt(x), *.hwp(x), *.pdf) and image files (*.jpg, *.gif, *.png) can be searched.</li>
                      <li>***** AI Summary: This feature can summarize about 4,000 tokens (roughly 10 pages of text). It can handle around 4,000 characters in Korean and about 9,000 characters in English. For translations, it can manage about 2,500 characters in Korean and 5,000 characters in English, but it may not cover every possible language situation.</li>
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
        <!-- S : faq section-->
        <section class="faq-section">
          <div class="inner">
            <h2 class="title">Frequently Asked Questions About LG AI</h2>
            <ul class="faq-accordion">
              <li class="faq-accordion-item">
                <button type="button" class="faq-accordion-item-btn" aria-expanded="false" aria-controls="faq-item-1">
                  <span class="faq-accordion-item-label">Q.</span>
                  <span class="faq-accordion-item-btn-title">What is LG Affectionate Intelligence?</span>
                </button>
                <div class="faq-accordion-item-content" id="faq-item-1">
                  <span class="faq-accordion-item-label">A.</span>
                  <p class="faq-accordion-item-content-text">Affectionate Intelligence is LG's human-centered AI philosophy that goes beyond traditional Artificial Intelligence — designed to sense people wisely, understand them deeply, and care for them warmly through AI-powered products like LG AI TVs, xboom AI speakers, AI WashTower, DUALCOOL AI air conditioners, gram AI laptops, and AI vehicle solutions. The goal is to make everyday life more delightful, effortless, and well-cared.</p>
                </div>
              </li>
              <li class="faq-accordion-item">
                <button type="button" class="faq-accordion-item-btn" aria-expanded="false" aria-controls="faq-item-2">
                  <span class="faq-accordion-item-label">Q.</span>
                  <span class="faq-accordion-item-btn-title">What is an LG AI TV and how does it work?</span>
                </button>
                <div class="faq-accordion-item-content" id="faq-item-2">
                  <span class="faq-accordion-item-label">A.</span>
                  <p class="faq-accordion-item-content-text">LG Al TV is a revolutionary breakthrough, redefining your viewing experience through the sophisticated intelligence at its core, the alpha 11 AI Processor 4K Gen3 now with a Dual AI Engine-LG's most advanced Contextual Immersive AI Processor. With 5.6x more powerful AI neural processing, the new alpha 11 processor powers pixel-level precision that delivers breathtakingly realistic picture and also enables webOS to learn your viewing habits and adapt to your preferences to provide a unique and personalized experience, just for you. And even with this level of personalization, the reliable and award-winning LG Shield's advanced security measures help keep your data safe and protected</p>
                </div>
              </li>
              <li class="faq-accordion-item">
                <button type="button" class="faq-accordion-item-btn" aria-expanded="false" aria-controls="faq-item-3">
                  <span class="faq-accordion-item-label">Q.</span>
                  <span class="faq-accordion-item-btn-title">Is AI Wash safe for delicate fabrics, and which loads work best?</span>
                </button>
                <div class="faq-accordion-item-content" id="faq-item-3">
                  <span class="faq-accordion-item-label">A.</span>
                  <p class="faq-accordion-item-content-text">Yes, AI Wash is designed to protect delicate fabrics. LG's AI DD™ technology detects fabric softness and load weight via built-in sensors, then automatically selects gentle drum motions to prevent damage. AI sensing activates on loads under 6kg for the LG WashTower (3kg for most LG AI DD™ models). For best results, wash similar fabric types together, use suitable detergent, and avoid manually changing water levels. This lets the AI system fully optimize the cycle. AI Wash is not activated when the Steam option is selected.</p>
                </div>
              </li>
              <li class="faq-accordion-item">
                <button type="button" class="faq-accordion-item-btn" aria-expanded="false" aria-controls="faq-item-4">
                  <span class="faq-accordion-item-label">Q.</span>
                  <span class="faq-accordion-item-btn-title">How does AI Air provide personalized cooling tailored to me?</span>
                </button>
                <div class="faq-accordion-item-content" id="faq-item-4">
                  <span class="faq-accordion-item-label">A.</span>
                  <p class="faq-accordion-item-content-text">Just turn it on, and AI Air analyzes your room and automatically delivers the temperature and airflow that suit you. When you're really hot, the AI Dual Inverter drives powerful airflow straight to where you are, cooling up to 23% faster so you feel cool almost instantly, even across a large room. Once you're cool enough, it shifts to a softer, indirect breeze for comfort cooling. A built-in radar sensor detects your location within a 5-meter range and automatically switches between direct airflow (toward you) and indirect airflow (away from you), all with just one remote button. AI Air operates in both cooling and heating modes via remote control or the LG ThinQ app. Sensing distance may vary depending on installation environment, and this feature is available only on LG DUALCOOL AI models equipped with radar sensors.</p>
                </div>
              </li>
              <li class="faq-accordion-item">
                <button type="button" class="faq-accordion-item-btn" aria-expanded="false" aria-controls="faq-item-5">
                  <span class="faq-accordion-item-label">Q.</span>
                  <span class="faq-accordion-item-btn-title">What does AI Calibration do on LG xboom AI speakers?</span>
                </button>
                <div class="faq-accordion-item-content" id="faq-item-5">
                  <span class="faq-accordion-item-label">A.</span>
                  <p class="faq-accordion-item-content-text">AI Calibration analyzes the size and shape of your listening space to optimize audio output for that specific environment. It adjusts EQ to deliver full, undistorted sound whether you're indoors or outdoors, in a small bedroom or open backyard. Recalibrate when you move the speaker to a different space. AI Calibration works on LG xboom AI speakers including Grab, Bounce, and Stage 301, and is accessed through the LG ThinQ app. Two larger 2026 models (Blast and Stage 501) feature an upgraded version called Space Calibration Pro.</p>
                </div>
              </li>
            </ul>
            <div class="faq-disclaimer">
              <p>* Specifications and features vary by region, model, and size.</p>
              <p>* Service availability varies by region and country.</p>
              <p>* Personalized services may vary depending on the policies of the 3rd party application.</p>
              <p>* LG Account and acceptance of relevant Terms & Conditions is required to access network-based smart services and features, including streaming apps. Without LG Account, only external device connections (e.g. via HDI) and terrestrial/over-the-air TV (only for TVs with tuners) is available. There is no fee to create LG Account.</p>
              <p>* LG Shield</p>
              <p>- LG Shield certification may vary depending on model.</p>
              <p>- Install protection excludes app installations from unusual sources other than LG Apps, etc.</p>
              <p>- Regular software updates are required for continuous 5-year protection.</p>
              <p>- Data protection and encrytion is secured under normal usage.</p>
              <p>- webOS is secured by LG Shield.</p>
            </div>
          </div>
        </section>
        <!-- E : faq section-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title">More about LG Affectionate Intelligence</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./assets/image/ai-gate-image-more-about-ai-banner01-desktop.jpg" media="(min-width: 769px)">
                                <source srcset="./assets/image/ai-gate-image-more-about-ai-banner01-mobile.jpg" media="(max-width: 768px)">
                                <img src="./assets/image/ai-gate-image-more-about-ai-banner01-mobile.jpg" alt="A line of LG humanoid service robots with digital faces, standing in a room." loading="lazy">
                              </picture>
                              <div class="txt-bx">
                                  <p>LG Electronics Establishes Robotics Business Center to Accelerate Future Growth</p>
                                  <a href="https://www.lg.com/global/newsroom/news/corporate/lg-electronics-establishes-robotics-business-center-to-accelerate-future-growth/" class="white-btn">Learn more</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./assets/image/ai-gate-image-more-about-ai-banner02-desktop.jpg" media="(min-width: 769px)">
                                <source srcset="./assets/image/ai-gate-image-more-about-ai-banner02-mobile.jpg" media="(max-width: 768px)">
                                <img src="./assets/image/ai-gate-image-more-about-ai-banner02-mobile.jpg" alt="A man, a woman, and a small robot standing together in front of a red &quot;Life's Good&quot; display, all making heart shapes with their hands." loading="lazy">
                              </picture>
                              <div class="txt-bx">
                                  <p>LG Electronics Showcases Affectionate Intelligence in Action at CES 2026</p>
                                  <a href="https://www.lg.com/global/newsroom/news/corporate/lg-electronics-showcases-affectionate-intelligence-in-action-at-ces-2026/" class="white-btn">Learn more</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./assets/image/ai-gate-image-more-about-ai-banner03-desktop.jpg" media="(min-width: 769px)">
                                <source srcset="./assets/image/ai-gate-image-more-about-ai-banner03-mobile.jpg" media="(max-width: 768px)">
                                <img src="./assets/image/ai-gate-image-more-about-ai-banner03-mobile.jpg" alt="LG Electronics CEO Jae-cheol Lyu giving a presentation in front of a large &quot;Zero Labor Home&quot; sign with a modern living room backdrop." loading="lazy">
                              </picture>
                              <div class="txt-bx">
                                  <p>LG Electronics Unveils Its Approach to “AI in Action”</p>
                                  <a href="https://www.lg.com/global/newsroom/news/corporate/lg-electronics-unveils-its-approach-to-ai-in-action/" class="white-btn">Learn more</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
        </section>
        <!-- E : stories-section -->
        <!-- S : layer-popup -->
        <div class="products-layer" role="dialog" aria-hidden="true" aria-modal="true" tabindex="-1">
          <div class="products-layer-conbx">
            <div class="products-layer-header">
              <div class="products-layer-header-title-bx">
                <h2 class="products-layer-header-title-bx-title heading"></h2>
              </div>
              <a href="javascript:void(0)" class="products-layer-header-close" role="button" aria-label="Close">close</a>
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
        </div>
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
