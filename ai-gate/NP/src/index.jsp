<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG NP</title>
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, Human-Centered AI, Smart Life Platform, Technology-Forward Solutions">
    <meta name="Description" content="LG AI strives for your Delightful, Effortless, and Well-cared life through 'Sensing wisely, Understanding deeply, Caring warmly.' Experience a higher quality of life with LG Affectionate Intelligence, where AI goes beyond artificial intelligence to provide warm, human-centered care.">
    <meta property="og:title" content="LG Affectionate Intelligence | LG NP"/>
    <meta property="og:url" content="https://www.lg.com/np/lg-ai">
    <meta property="og:description" content="LG AI strives for your Delightful, Effortless, and Well-cared life through 'Sensing wisely, Understanding deeply, Caring warmly.' Experience a higher quality of life with LG Affectionate Intelligence, where AI goes beyond artificial intelligence to provide warm, human-centered care."/>
    <meta property="og:image" content="">
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/head-css.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/font-woff.jsp"/>
    <!-- // default code -->
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/mic-head-script.jsp"/>
    <jsp:include page="/WEB-INF/jsp/gp/common/include/head/gateway-foresee.jsp"/>

    <!-- your -->
    <link href="./lg-ai/common/css/ai-gate-reset.css" rel="stylesheet" type="text/css" />
<link href="./lg-ai/common/css/ai-gate-font.css" rel="stylesheet" type="text/css" />
<link href="./lg-ai/common/css/ai-gate-swiper-bundle.min.css" rel="stylesheet" type="text/css" />
<link href="./lg-ai/assets//css/ai-gate-css.css" rel="stylesheet" type="text/css" />

    <script src="./lg-ai/common/js/ai-gate-swiper-bundle.min.js"></script>
<script src="./lg-ai/assets//js/ai-gate-js-layer.js" defer></script>
<script src="./lg-ai/assets//js/ai-gate-js-common.js" defer></script>

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
    <meta itemprop="description" content="LG AI strives for your Delightful, Effortless, and Well-cared life through 'Sensing wisely, Understanding deeply, Caring warmly.' Experience a higher quality of life with LG Affectionate Intelligence, where AI goes beyond artificial intelligence to provide warm, human-centered care."/>
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
        data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-kv-desktop.mp4" 
        data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-kv-mobile.mp4"
        data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-kv-desktop.png" 
        data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-kv-mobile.png" 
        aria-labelledby="kv-video-description">
        <h1 id="kv-video-description" class="a11y-text">A woman walks by as the light turns on automatically. The phrase "Sensing wisely" appears on screen. A man and woman embrace as the XBOOM speaker activates, accompanied by the phrase "Understanding deeply." A man sits sadly in the driver's seat. The LG AI logo appears with the phrase "Caring warmly." A soccer match plays on TV. LG AI responds with voice interaction. The phrase "For your delightful life" shows below. XBOOM, the TV, and a family sitting on the sofa with their dog appear in a single frame. A mother and son use the washing machine together. The phrase "For your effortless life" appears. Scenes of the mother and son, a close-up of the AI Wash dial, and a man using the LG gram laptop are overlaid into one shot, with the phrase "For your effortless life." A man and woman sit in the front seats of a car. The LG AI logo appears between them, along with the phrase "For your well cared life." A person walks into an office with their dog. The air purifier turns on in response. Final shot: a white background with the LG AI logo and the phrase "Affectionate Intelligence for YOU."</h1>
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
          <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="LG AI" class="ai-logo">
        </picture>
        <h2 class="title">
          <span class="gradient-text">Affectionate Intelligence</span> for YOU
        </h2>
        <p class="text">
          At LG, we've been asking ourselves: what should AI exist for? <br>
          After much reflection, we've found our answer. <br><br>
          For us, AI goes beyond Artificial Intelligence—it's Affectionate Intelligence. <br><br>
          As AI becomes a part of our daily lives, <br>
          it should help create the better life we all deserve. <br><br>
          That's why LG AI starts with YOU affectionately through <br>
          sensing and understanding, further caring for your life.
          <strong>Discover how Life's Good with LG AI</strong>
        </p>
        <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Scroll down icon" class="scroll-down-icon">
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
                <h2 class="tab-panel-title text-center">LG AI understands your life and upgrades experiences to make your life filled with delightful moments.</h2>
                <!-- S : video-bx -->
                <div class="video-bx responsive-video" 
                  data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4"
                  data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" 
                  data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" 
                  aria-labelledby="benefit01-banner-video-description"
                  >
                  <span id="benefit01-banner-video-description" class="a11y-text">A man and a woman are on the sofa, watching a soccer broadcast on an LG TV in the living room. The scene transitions, and the man and woman are hugging. The camera focuses on the LG XBOOM next to them.</span>
                  <h3 class="video-title">For your delightful life</h3>
                  <button type="button" class="play-btn" aria-label="Play video"></button>
                </div>
                <!-- E : video-bx -->
                <!-- S : product-list -->
                <ul class="product-list">
                  <li class="product-item">
                    <a href="https://www.lg.com/np/oled-tvs"> 
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="LG OLED AI product front view" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
                    </a>
                  </li>
                  <li class="product-item">
                    <a href="https://www.lg.com/np/nanocell-tv"> 
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="LG Ultra HD AI product front view" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
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
                <h2 class="tab-panel-title text-center">LG AI senses your needs and presents solutions to make your life flow effortlessly to your rhythm.</h2>
                <!-- S : video-bx -->
                <div class="video-bx responsive-video" 
                  data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4"
                  data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" 
                  data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" 
                  aria-labelledby="benefit02-banner-video-description">
                  <span id="benefit02-banner-video-description" class="a11y-text">A mother and son use an LG AI washing machine together, turning the dial to activate AI Wash. A man using the LG gram laptop appears in the same sequence.</span>
                  <h3 class="video-title">For your effortless life</h3>
                  <button type="button" class="play-btn" aria-label="Play video"></button>
                </div>
                <!-- E : video-bx -->
                <!-- S : product-list -->
                <ul class="product-list">
                  <li class="product-item">
                    <a href="https://www.lg.com/np/washing-machines/lg-wt2116nheg"> 
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products01.png" alt="LG WashTower AI product front view" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
                    </a>
                  </li>
                  <li class="product-item">
                    <a href="https://www.lg.com/np/front-load-washing-machines"> 
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="LG Washing Machine AI product front view" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
                    </a>
                  </li>
                  <li class="product-item">
                    <a href="https://www.lg.com/np/refrigerators/lg-gs-x6172mc"> 
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="LG InstaView AI product front view" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
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
                <h2 class="tab-panel-title text-center">LG AI cares for you, your space, and the planet to make your life well-cared, just as you desire.</h2>
                <!-- S : video-bx -->
                <div class="video-bx responsive-video" 
                  data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4"
                  data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" 
                  data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" 
                  aria-labelledby="benefit03-banner-video-description">
                  <span id="benefit03-banner-video-description" class="a11y-text">A man walks into the office holding a dog leash. A man in the driver's seat looks sad as LG AI shows him a family photo. The car display is shown in a close-up as LG AI pulls up a map and revisits a memory.</span>
                  <h3 class="video-title">For your well-cared life</h3>
                  <button type="button" class="play-btn" aria-label="Play video"></button>
                </div>
                <!-- E : video-bx -->
                <!-- S : product-list -->
                <ul class="product-list">
                  <!-- <li class="product-item">
                    <a href="https://www.lg.com/np/home-air-conditioners/lg-s3-w12ja3da"> 
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products01.png" alt="LG DUALCOOL AI product front view" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
                    </a>
                  </li> -->
                  <li class="product-item">
                    <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision">
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="ADAS vision system product side view" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
                    </a>
                  </li>
                  <li class="product-item">
                    <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma">
                      <div class="img-bx">
                        <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="User interacting with touchscreen interface powered by multimodal AI HMI solution, selecting coffee menu with AI assistant prompt" loading="lazy">
                      </div>
                      <span class="link-btn">Learn More</span>
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
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="LG AI TV" class="eyebrow-logo" loading="lazy" data-tp="alt">
                  </picture>
                  Evolves to satisfy your every entertainment need 
                </h2>
                <!-- E : tab-panel-title -->
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text">
                  LG AI TV learns your preference, understands your lifestyle, and optimizes every aspect of your TV experience to create a most ideal, personalized entertainment experience, just for you.
                </p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Above the LG Magic Remote, features such as AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard, and AI Sound Wizard are displayed." loading="lazy">
                  </picture>
                  <div class="text-bx">
                    <h3 class="title">
                      Meet the next generation of<br>
                      LG AI TV
                    </h3>
                    <a href="https://www.lg.com/np/tvs-soundbars/ai-tv" class="white-btn">Learn More</a>
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
                        <div class="img-bx" data-title="AI Voice ID with My Profile syncs to you" data-desc="LG AI Voice ID knows each user's unique voice signature and offers personalized recommendations the moment you turn it on and speak." data-alt="On an LG OLED TV screen is the webOS 25 home page filled with apps and entertainment content. By the TV is the LG AI Magic Remote, the AI button is highlighted as if activated by the user's voice. A speech bubble is beside it, 'suggest a movie I'll like'">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="On an LG OLED TV screen is the webOS 25 home page filled with apps and entertainment content. By the TV is the LG AI Magic Remote, the AI button is highlighted as if activated by the user's voice. A speech bubble is beside it, 'suggest a movie I'll like'">
                        </div>
                        <p class="slide-title">AI Voice ID</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="Find answers instantly with AI Search" data-desc="Voice-activated intelligence powered by built-in AI understands your inquiries. Ask questions and get tailored recommendations that meet your needs. You can also get additional results and solutions with Microsoft Copilot." data-alt="LG OLED TV screen showing how AI Search works. A small chat window is open showing how the user asked for what sports games are available. AI search responded via chat and by showing thumbnails of different available content. There is also a prompt to ask Microsoft Copilot.">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="LG OLED TV screen showing how AI Search works. A small chat window is open showing how the user asked for what sports games are available. AI search responded via chat and by showing thumbnails of different available content. There is also a prompt to ask Microsoft Copilot.">
                        </div>
                        <p class="slide-title">AI Search</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="Enjoy one-click personalized recommendations with AI Concierge " data-desc="One short press on the AI button on your remote opens up your AI Concierge which provides customized keywords and recommendations based on your search and watching history." data-alt="The LG AI Magic Remote in use. Shortly pressing the AI button activates the AI Assistant on the OLED TV screen, which then suggests keywords.">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="The LG AI Magic Remote in use. Shortly pressing the AI button activates the AI Assistant on the OLED TV screen, which then suggests keywords.">
                        </div>
                        <p class="slide-title">AI Concierge</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="Solve requests in real-time with AI Chatbot" data-desc="Have your own AI Chatbot actively resolve and help you with your requests. Simply speak to your TV as it can classify your intentions and respond accordingly." data-alt="Sci-fi content is playing on an LG OLED TV screen. On the left side of the screen is the AI Chatbot interface. The user messages the chatbot that the screen is too dark and the chatbot offers solutions to the request.">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Sci-fi content is playing on an LG OLED TV screen. On the left side of the screen is the AI Chatbot interface. The user messages the chatbot that the screen is too dark and the chatbot offers solutions to the request.">
                        </div>
                        <p class="slide-title">AI Chatbot</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="Complete your AI experience with AI Magic Remote featuring a dedicated AI button. " data-desc="Control your TV easily with AI magic remote - no extra device needed! Simple but powerful click, drag and drop functions make using webOS intuitive and easy to operate." data-alt="Woman singing into microphone with headphones, highlighted by LG α11 AI Processor sound enhancement">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Woman singing into microphone with headphones, highlighted by LG α11 AI Processor sound enhancement">
                        </div>
                        <p class="slide-title">AI Picture/Sound Wizard</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="Complete your AI experience with AI Magic Remote featuring a dedicated AI button." data-desc="Control your TV easily with AI magic remote - no extra device needed! Simple but powerful click, drag and drop functions make using webOS intuitive and easy to operate." data-alt="Two connected scenes with LG AI Magic Remote in front of a TV—first showing a sci-fi scene, second showing a home screen with personalized content">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Two connected scenes with LG AI Magic Remote in front of a TV—first showing a sci-fi scene, second showing a home screen with personalized content">
                        </div>
                        <p class="slide-title">AI Magic Remote</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li>*LG AI features use deep learning-based trained algorithms for real-time image upscaling and sound upmixing.</li>
                  <li>**All LG webOS 24 TVs feature AI Customization, excluding those without light sensors.</li>
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
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="LG AI Audio" class="eyebrow-logo" loading="lazy" data-tp="alt">
                  </picture>
                  Sounds uniquely right
                </h2>
                <!-- E : tab-panel-title -->
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text">
                  LG xboom AI analyzes and adjusts sound to suit the genre and space. With AI lighting that enhances the ambiance and harmonizes with your music, you can enjoy sound and vibe uniquely right.
                </p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="A woman and a man embrace in the living room, with the LG xboom speaker turned on beside them." loading="lazy">
                  </picture>
                  <div class="text-bx">
                    <h3 class="title">
                      Enjoy a new sound experience <br>
                      with LG xboom AI
                    </h3>
                    <!-- <a href="javascript:void(0)" class="white-btn">Learn More</a> -->
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
                        <div class="img-bx" data-title="AI perfects sound for every genre" data-desc="Choose manually from rhythm, melody, or voice-oriented modes based on your preference, or let AI set the most optimal mode for you. AI analyzes audio and adjusts the sound to suit the genre." data-alt="LG xboom speaker with AI sound modes including Bass Boost, Voice Enhance, and Standard">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="LG xboom speaker with AI sound modes including Bass Boost, Voice Enhance, and Standard">
                        </div>
                        <p class="slide-title">AI Sound</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="AI lighting that syncs with sound" data-desc="AI detects genre of your music and delivers the optimal the lighting that syncs with sound. Choose from Ambient, Party, Voice mode to set the mood. Check the informative lighting for speaker's status." data-alt="LG xboom speaker with AI Lighting that adapts to voice, ambient, and party modes">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="LG xboom speaker with AI Lighting that adapts to voice, ambient, and party modes">
                        </div>
                        <p class="slide-title">AI Lighting</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="AI calibration for space-filling sound" data-desc="AI calibrates audio based on the size and shape of the space you're in. Delivers full, undistorted sound whether in a spacious area or a small room." data-alt="LG xboom speaker placed on a table in a red-toned room with grid-patterned walls and modern furniture">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="LG xboom speaker placed on a table in a red-toned room with grid-patterned walls and modern furniture">
                        </div>
                        <p class="slide-title">AI Calibration</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li>*This product is not available yet.</li>
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
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-desktop.svg" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="LG AI Appliances" class="eyebrow-logo" loading="lazy" data-tp="alt">
                  </picture>
                  Lighten your every load
                </h2>
                <!-- E : tab-panel-title -->  
                <!-- S : tab-panel-text -->
                <p class="tab-panel-text">
                  LG WashTower AI senses what you're washing to give you optimized wash and dry cycles for sensitive fabric care. So you effortlessly perfect every load, every time.
                </p>
                <!-- E : tab-panel-text -->
                <!-- S : tab-panel-banner -->
                <div class="tab-panel-banner">
                  <picture>
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                    <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                    <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="LG built-in stacked washer and dryer in a modern laundry room with wood cabinetry and bench seating" loading="lazy">
                  </picture>
                  <div class="text-bx">
                    <h3 class="title">
                      Discover a new way of life <br>
                      with LG AI Core Tech
                    </h3>
                    <a href="https://www.lg.com/global/lg-ai-core-tech/washing-machine-dryer/" class="white-btn layer-open layer-appliances">Learn More</a>
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
                        <div class="img-bx" data-title="AI Wash" data-desc="AI Wash optimizes washing motions based on the laundry type. It can help achieve improved fabric care and energy savings with soft fabrics." data-alt="Hand adjusting AI Wash cycle on LG washing machine using smart control dial">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Hand adjusting AI Wash cycle on LG washing machine using smart control dial">
                        </div>
                        <p class="slide-title">AI Wash</p>
                      </div>
                      <div class="swiper-slide">
                        <div class="img-bx" data-title="AI Dry" data-desc="For 26 years, LG's washing machines have pushed the boundaries of innovation. Experience the future of laundry, where AI reaches the very core of home appliances. AI to the Core, Easy Laundry." data-alt="User selecting AI Dry cycle on LG dryer using digital control dial">
                          <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="User selecting AI Dry cycle on LG dryer using digital control dial">
                        </div>
                        <p class="slide-title">AI Dry</p>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- E : tab-panel-slide -->
                <!-- S : tab-panel-disclaimer -->
                <ul class="tab-panel-disclaimer">
                  <li>*This product will be released gradually in select countries.</li>
                  <li>**AI sensing is activated when the load is under 6kg.</li>
                  <li>***AI Wash should only be used with similar fabric types [not all fabrics are detected] and suitable detergent.</li>
                  <li>****AI Dry is only available for loads under 5kg with fabrics of the same moisture absorption levels.</li>
                </ul>
                <!-- E : tab-panel-disclaimer -->
              </div>
            </div>
            <!-- E : panel tab-3 -->
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
        <h2 class="thinq-section-title">ThinQ® helps make life happen</h2>
        <p class="thinq-section-text">A platform for your smart LG appliances and devices, ThinQ puts control and convenience at your fingertips, to help <br>you simplify life and enjoy the comforts of home.</p>
        <a href="https://www.lg.com/np/appliances/thinq" class="white-btn">Learn More</a>
        <div class="banner">
          <picture> 
            <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
            <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
            <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="A person holds a smartphone with the LG ThinQ app open, managing smart home devices while drinking coffee." loading="lazy">  
          </picture>
        </div>
        <!-- S : youtube-video-list -->
        <div class="youtube-video-list">
          <div class="swiper">
            <div class="swiper-wrapper">
              <!-- S : swiper-slide01 -->
              <div class="swiper-slide">
                <button class="video-btn" type="button" data-src="TvFhuqvQLYI" aria-label="Play video">
                  <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb01.jpg" alt="LG ThinQ ON AI voice assistant device sits on a coffee table in a smart living room, with a glowing LED ring.">
                </button>
              </div>
              <!-- E : swiper-slide01 -->
              <!-- S : swiper-slide02 -->
              <div class="swiper-slide">
                <button class="video-btn" type="button" data-src="iQyFMATSUDU" aria-label="Play video">
                  <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb02.jpg" alt="LG ThinQ ON AI voice assistant device sits on a coffee table in a smart living room, with a glowing LED ring.">
                </button>
              </div>
              <!-- E : swiper-slide02 -->
              <!-- S : swiper-slide03 -->
              <div class="swiper-slide">
                <button class="video-btn" type="button" data-src="W6pXClCE3P4" aria-label="Play video">
                  <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb03.jpg" alt="LG ThinQ ON AI voice assistant device sits on a coffee table in a smart living room, with a glowing LED ring.">
                </button>
              </div>
              <!-- E : swiper-slide03 -->
              <!-- S : swiper-slide04 -->
              <div class="swiper-slide">
                <button class="video-btn" type="button" data-src="oEuZqLxQrUY" aria-label="Play video">
                  <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb04.jpg" alt="LG ThinQ ON AI voice assistant device sits on a coffee table in a smart living room, with a glowing LED ring.">
                </button>
              </div>
              <!-- E : swiper-slide04 -->
              <!-- S : swiper-slide05 -->
              <div class="swiper-slide">
                <button class="video-btn" type="button" data-src="UFRyOs-6h5s" aria-label="Play video">
                  <img src="./lg-ai/assets/image/ai-gate-image-youtube-thumb05.jpg" alt="LG ThinQ ON AI voice assistant device sits on a coffee table in a smart living room, with a glowing LED ring.">
                </button>
              </div>
              <!-- E : swiper-slide05 -->
            </div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
        <!-- E : youtube-video-list -->
        <!-- S : thinq-flex-bx -->
        <div class="flex-bx">
          <div class="img-bx">
            <figure>
              <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="In a modern smart kitchen, a woman uses a voice command to start the washer with LG ThinQ AI, while a man reads on the sofa in the background." loading="lazy">
            </figure>
          </div>
          <div class="text-bx">
            <h3 class="title">Simple Control with Voice Assistant</h3>
            <p class="text">Tell your appliance exactly what you need by just saying it out, and the AI speaker will listen and check the cycle to let you know.</p>
          </div>
        </div>
        <!-- E : thinq-flex-bx -->
        <!-- S : thinq-flex-bx -->
        <div class="flex-bx reverse">
          <div class="img-bx">
            <figure>
              <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="A smartphone displays the LG ThinQ app controlling the LG InstaView Slide-In Range oven, enabling efficient product maintenance in the kitchen." loading="lazy">
            </figure>
          </div>
          <div class="text-bx">
            <h3 class="title">Efficient Product Maintenance</h3>
            <p class="text">Through the LG ThinQ app, check on your appliance, download new cycles, monitor cycle usage, and much more.</p>
          </div>
        </div>
        <!-- E : thinq-flex-bx -->
      </div>
    </section>
    <!-- E : thinq-section (Local)-->
    <!-- S : stories-section -->
    <section class="stories-section">
      <div class="inner">
          <h2 class="title">More about LG Affectionate Intelligence</h2>
          <div class="slide-bx">
              <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                  <div class="swiper-wrapper">
                      <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                          <picture>
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                            <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="LG Electronics executive holding certificate of accreditation for cybersecurity, with digital security graphic in background" loading="lazy">
                          </picture>
                          <div class="txt-bx">
                              <p>LG Strengthens Cybersecurity Leadership With KOLAS IoT Cybersecurity Testing Accreditation</p>
                              <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn">Learn More</a>
                          </div>
                      </div>
                      <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                          <picture>
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                            <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Visitors viewing LG curved LED display showcasing 'Life's Good 24/7' slogan at tech exhibition" loading="lazy">
                          </picture>
                          <div class="txt-bx">
                              <p>LG Presents Its Latest Innovations Powered by "Affectionate Intelligence" at CES 2025</p>
                              <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn">Learn More</a>
                          </div>
                      </div>
                      <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                          <picture>
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                            <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                            <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Speaker presenting AI-powered B2B solutions on stage at LG event" loading="lazy">
                          </picture>
                          <div class="txt-bx">
                              <p>LG Unveils a Day in a Life With "Affectionate Intelligence" at LG World Premiere</p>
                              <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn">Learn More</a>
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
