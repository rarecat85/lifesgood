<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG AR</title>
    <meta name="Keywords" content="LG IA, Inteligencia Afectiva, IA centrada en las personas, Plataforma de Vida Inteligente, Soluciones de vanguardia tecnológica">
    <meta name="Description" content="LG IA busca que tu vida sea Placentera, Simple y Bien Cuidada a través de 'Sentir con sabiduría, Comprender con profundidad y Cuidar con calidez'. Experimentá una mayor calidad de vida con la Inteligencia Afectiva de LG, donde la IA va más allá de la inteligencia artificial para brindar un cuidado cálido y centrado en las personas.">
    <meta property="og:title" content="LG Affectionate Intelligence | LG AR"/>
    <meta property="og:url" content="LG Affectionate Intelligence | LG AR">
    <meta property="og:description" content="LG IA busca que tu vida sea Placentera, Simple y Bien Cuidada a través de 'Sentir con sabiduría, Comprender con profundidad y Cuidar con calidez'. Experimentá una mayor calidad de vida con la Inteligencia Afectiva de LG, donde la IA va más allá de la inteligencia artificial para brindar un cuidado cálido y centrado en las personas."/>
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
    <meta itemprop="description" content="LG IA busca que tu vida sea Placentera, Simple y Bien Cuidada a través de 'Sentir con sabiduría, Comprender con profundidad y Cuidar con calidez'. Experimentá una mayor calidad de vida con la Inteligencia Afectiva de LG, donde la IA va más allá de la inteligencia artificial para brindar un cuidado cálido y centrado en las personas."/>
    <meta itemprop="Keywords" content="LG IA, Inteligencia Afectiva, IA centrada en las personas, Plataforma de Vida Inteligente, Soluciones de vanguardia tecnológica"/>
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
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Una mujer pasa y la luz se enciende automáticamente. En pantalla aparece la frase: “Percibir con sabiduría”.
Una pareja se abraza mientras se activa el parlante XBOOM, acompañado de la frase: “Entender en profundidad”.
Un hombre está sentado, cabizbajo, en el asiento del conductor. Aparece el logo de LG IA con la frase: “Cuidar con calidez”.
En la TV se transmite un partido de fútbol. LG IA responde mediante control por voz. Debajo aparece la frase: “Para que disfrutes una vida plena”.
En una misma toma aparecen el XBOOM, el televisor y una familia sentada en el sillón con su perro.
Una madre y su hijo usan el lavarropas juntos. Aparece la frase: “Para que vivas una vida simple”.
Se superponen imágenes de la madre y el hijo, un primer plano del dial AI Wash y un hombre usando su notebook LG gram, con la frase: “Para que vivas una vida simple”.
Una pareja está sentada en los asientos delanteros de un auto. Entre ellos aparece el logo de LG IA junto a la frase: “Para que vivas una vida bien cuidada”.
Una persona entra a una oficina con su perro. El purificador de aire se enciende automáticamente.
Toma final: fondo blanco con el logo de LG IA y la frase: “Inteligencia Afectiva pensada para VOS”.</h1>
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
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Inteligencia Afectiva pensada</span> para VOS</h2>
            <p class="text" data-tp="copy">En LG nos hicimos una pregunta clave: <br>
 ¿Para qué debería existir la inteligencia artificial? <br>
              Después de mucha reflexión, encontramos nuestra respuesta. <br><br>
              Para nosotros, la IA va más allá de la Inteligencia Artificial: es Inteligencia Afectiva. <br><br>
              A medida que la IA se integra en nuestra vida cotidiana, <br>
              debería ayudarnos a construir la vida mejor que todos merecemos. <br><br>
              Por eso, LG IA empieza con VOS, <br>
              percibiendo, entendiendo y cuidando tu vida con afecto.
              <strong>Descubrí cómo Life's Good con LG IA</strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Scroll down icon" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Una vida plena</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Una vida más simple</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Una vida bien cuidada</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG IA entiende tu vida y mejora cada experiencia para que esté llena de momentos que disfrutás.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Un hombre y una mujer están en el sillón viendo un partido de fútbol en un televisor LG en el living. La escena cambia y la pareja se abraza.
La cámara enfoca el parlante LG XBOOM que está junto a ellos.</span>
                      <h3 class="video-title" data-tp="copy">Para que disfrutes una vida plena</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="Vista frontal del televisor LG OLED evo AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="Vista frontal del televisor LG OLED AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="Vista frontal del televisor LG QNED AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="Vista frontal del televisor LG NanoCell AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products05.png" alt="Vista frontal del producto LG xboom AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                    </ul>
                    <!-- E : product-list -->
                  </div>
                </div>
                <!-- E : tab-panel tab-1 -->
                <!-- S : tab-panel tab-2 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-2" id="product-panel-2" hidden="">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG IA percibe tus necesidades y ofrece soluciones para que tu vida fluya sin esfuerzo, a tu ritmo.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Una madre y su hijo usan juntos un lavarropas LG IA, girando el dial para activar AI Wash.
En la misma secuencia aparece un hombre usando la notebook LG gram.</span>
                      <h3 class="video-title" data-tp="copy">Para que tu vida sea más simple</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products01.png" alt="Vista frontal de LG WashTower AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="Vista frontal de LG Lavarropas AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products03.png" alt="Vista frontal de LG Secarropas AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/ar/heladeras/lg-gm57sxm" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="Vista frontal de LG InstaView AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Conocé más</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">LG IA se ocupa de vos, tu entorno y el planeta para que vivas una vida cuidada, justo como la soñás.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Un hombre entra a la oficina con la correa de un perro.
Un hombre sentado en el asiento del conductor está triste mientras LG IA le muestra una foto familiar.
Se muestra un primer plano de la pantalla del auto, donde LG IA despliega un mapa y revive un recuerdo.</span>
                      <h3 class="video-title" data-tp="copy">Para que vivas una vida bien cuidada</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products01.png" alt="Vista frontal de LG DUALCOOL AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="Vista de perfil del sistema de visión ADAS" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Conocé más</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Usuario interactuando con una pantalla táctil potenciada por la solución multimodal de IA HMI, seleccionando el menú de café con la asistencia del asistente de IA." loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Conocé más</span>
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
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Línea blanca</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Aire Acondicionado</button>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="LG IA TV" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Evoluciona para satisfacer todas tus necesidades de entretenimiento</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG IA TV aprende tus preferencias de contenido y entiende tu estilo de vida para optimizar cada aspecto de tu experiencia, creando un entretenimiento personalizado ideal para vos.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Sobre el LG Magic Remote se muestran funciones como AI Voice ID, Búsqueda por IA, Chatbot con IA, Asistente IA (AI Concierge), Asistente de Imagen IA (AI Picture Wizard) y Asistente de Sonido IA (AI Sound Wizard)." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Conocé la nueva generación de<br>
                          LG IA TV</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="En la pantalla del televisor LG OLED se muestra la página de inicio de webOS 25, repleta de apps y contenido de entretenimiento.
Al lado del televisor está el LG Magic Remote con IA, con el botón de IA resaltado, como si hubiera sido activado por la voz del usuario.
A su lado aparece un globo de diálogo: “Sugerime una peli que me guste”" data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">IA que reconoce tu voz</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="La pantalla del televisor LG OLED muestra cómo funciona la Búsqueda con IA.
Se abre una pequeña ventana de chat donde se ve que el usuario preguntó qué partidos deportivos están disponibles.
La Búsqueda con IA respondió por chat y también mostrando miniaturas del contenido disponible.
También aparece una opción para consultar con Microsoft Copilot." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Búsqueda con IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="Se muestra el uso del LG Magic Remote con IA.
Al presionar brevemente el botón de IA, se activa el Asistente de IA en la pantalla del televisor OLED, que luego sugiere palabras clave." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Asistente personal con IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="En la pantalla del televisor LG OLED se está reproduciendo contenido de ciencia ficción.
En el lado izquierdo aparece la interfaz del Chatbot con IA.
El usuario le escribe al chatbot que la pantalla está demasiado oscura, y el chatbot le ofrece soluciones para resolverlo." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Chatbot con IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Mujer cantando con auriculares y micrófono, destacada por la mejora de sonido del procesador LG α11 con IA." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Ajuste inteligente de imagen y sonido</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Dos escenas conectadas con el LG Magic Remote con IA frente al televisor:
primero se muestra una escena de ciencia ficción, y luego la pantalla de inicio con contenido personalizado." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Magic Remote con IA</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Las funciones de LG IA utilizan algoritmos entrenados con aprendizaje profundo para el escalado de imagen en tiempo real y la mejora de sonido.</li>
                      <li data-tp="copy">**Todos los televisores LG con webOS 24 incluyen personalización mediante IA, excepto aquellos que no cuentan con sensor de luz.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="LG IA Audio" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Un sonido hecho a tu medida</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG xboom IA analiza y ajusta el sonido según el género y el espacio.
Con la iluminación inteligente que realza el ambiente y se armoniza con tu música, podés disfrutar de un sonido y una vibra que suenan perfectamente únicos.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Una mujer y un hombre se abrazan en el living, con el parlante xboom encendido junto a ellos." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Disfrutá una nueva experiencia de sonido <br>
                          con LG xboom IA</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="Parlante LG xboom con modos de sonido con IA, incluyendo Refuerzo de bajos, Mejora de voz y Estándar." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Sonido con IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="Parlante LG xboom con Iluminación con IA, que se adapta a los modos Voz, Ambiente y Fiesta." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Iluminación con IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="Parlante LG xboom sobre una mesa en una habitación de tonos rojizos, con paredes de diseño cuadriculado y muebles modernos." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Calibración con IA</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Este producto aún no está disponible.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="LG IA Línea blanca" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Facilitá cada lavado</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG WashTower IA detecta qué estás lavando para ofrecer un lavado optimizado que cuida las telas delicadas, asegurando que cada carga quede perfecta sin esfuerzo, todas las veces.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="Lavarropas y secarropas apilados empotrados de LG en un lavadero moderno con muebles de madera y banco para sentarse." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Descubrí una nueva forma de vivir  <br>
                          con la tecnología LG AI Core</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Mano ajustando el ciclo AI Wash en un lavarropas LG usando el dial de control inteligente." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Lavado con IA</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Usuario seleccionando el ciclo AI Dry en un secarropas LG usando el dial de control digital." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Secado con IA</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Este producto se lanzará de forma gradual en países seleccionados.</li>
                      <li data-tp="copy">**La detección por IA se activa cuando la carga es menor a 6 kg.</li>
                      <li data-tp="copy">***AI Wash debe usarse solo con telas similares [no se detectan todos los tipos de tela] y con el detergente adecuado.</li>
                      <li data-tp="copy">****AI Dry está disponible solo para cargas menores a 5 kg con telas que tengan niveles similares de absorción de humedad.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" alt="LG IA Aire Acondicionado" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Brinda confort con un enfriamiento perfectamente ajustado</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">LG DUALCOOL IA cuida la calidad del aire para mantenerte cómodo, optimizando al mismo tiempo la eficiencia energética y ayudándote a ahorrar.
Con LG AI Air, disfrutá de un enfriamiento perfectamente ajustado para tu confort.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="El aire acondicionado LG DUAL Inverter enfría un living moderno, donde una mujer está sentada en el sillón, potenciado por la tecnología ThinQ IA." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Experimentá el confort optimizado <br>
                          con LG AI Air</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Una mujer se relaja en un living inteligente mientras el aire acondicionado LG IA Air ajusta automáticamente la temperatura, el flujo de aire y la humedad." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Air</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="Interfaz de smartphone mostrando un gráfico de consumo energético frente a un aire acondicionado LG, destacando AI kW Manager para un monitoreo eficiente del consumo eléctrico." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">Control de consumo energético con IA</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*El AI Air puede ser operado mediante control remoto y ThinQ.</li>
                      <li data-tp="copy">**El AI Air está disponible en modos de enfriamiento y calefacción.</li>
                      <li data-tp="copy">***Al usar AI Air, el volumen de aire y la dirección del viento se ajustan automáticamente según la situación, y AI Air se apaga cuando se cambia la dirección del viento.</li>
                      <li data-tp="copy">****Cuando AI Air está activado, el sensor radar detecta la ubicación del ocupante y activa automáticamente el viento directo o indirecto.</li>
                      <li data-tp="copy">*****La distancia de detección del sensor radar es de hasta 5 metros, y puede variar según la instalación y el entorno de uso del producto.</li>
                      <li data-tp="copy">******Esta función solo funciona en modelos que cuentan con sensores radar.</li>
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
            <h2 class="thinq-section-title" data-tp="copy">ThinQ® acompaña cada momento de tu vida</h2>
            <p class="thinq-section-text" data-tp="copy">ThinQ es la plataforma para tus electrodomésticos y dispositivos inteligentes LG.
Te pone el control y la comodidad al alcance de la mano, para ayudarte a simplificar tu vida y disfrutar del confort del hogar.</p>
            
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Una persona sostiene un smartphone con la app LG ThinQ abierta, gestionando dispositivos inteligentes del hogar mientras toma un café." loading="lazy" data-tp="alt">  
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
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="En una cocina inteligente y moderna, una mujer usa un comando de voz para poner en marcha el lavarropas con LG ThinQ IA, mientras un hombre lee en el sillón de fondo." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Control fácil con asistente por voz</h3>
                <p class="text" data-tp="copy">Decile a tu electrodoméstico LG exactamente lo que necesitás con solo decirlo, y el parlante con IA escuchará y verificará el ciclo para avisarte.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Un smartphone muestra la app LG ThinQ controlando el horno LG InstaView Slide-In Range, facilitando un mantenimiento eficiente del producto en la cocina." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Mantenimiento práctico y eficiente</h3>
                <p class="text" data-tp="copy">A través de la app LG ThinQ, controlá tu electrodoméstico LG, descargá nuevos ciclos, monitoreá el uso de ciclos y mucho más.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">Descubrí más sobre la Inteligencia Afectiva de LG</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="Ejecutivo de LG Electronics sosteniendo el certificado de acreditación en ciberseguridad, con un gráfico digital de seguridad de fondo." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG fortalece su liderazgo en ciberseguridad con la acreditación KOLAS para pruebas de ciberseguridad IoT</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">Conocé más</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Visitantes observando una pantalla LED curva de LG que muestra el slogan &quot;Life's Good 24/7&quot; en una exhibición tecnológica." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG presenta sus últimas innovaciones impulsadas por “Inteligencia Afectiva” en CES 2025</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">Conocé más</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Expositor presentando soluciones empresariales potenciadas por IA durante un evento de LG" loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">LG presenta “Un día en la vida” con “Inteligencia Afectiva” en LG World Premiere</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn" data-tp="copy link">Conocé más</a>
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
