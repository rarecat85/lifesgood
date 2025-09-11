<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/gp/common/include/head/head.jsp" %>
<head>
    <!-- default code -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-default-tag.jsp" %>
    <!-- sns tag -->
    <%@ include file="/WEB-INF/jsp/gp/common/include/head/meta-sns-tag.jsp" %>
    <!-- chrome audits -->
    <meta name="theme-color" content="#a50034"/>
    <title>LG Affectionate Intelligence | LG GR</title>
    <meta name="Keywords" content="LG AI, Affectionate Intelligence, Ανθρωποκεντρική Τεχνητή Νοημοσύνη, Smart Life, Προηγμένες τεχνολογικές λύσεις">
    <meta name="Description" content='Η LG AI στοχεύει σε μια ευχάριστη και απλή ζωή για εσάς, μέσα από τη φιλοσοφία “Σοφή αντίληψη, Κατανόηση εις βάθος,  Ζεστή φροντίδα"
    Ζήστε μια αναβαθμισμένη ποιότητα ζωής με την LG Affectionate Intelligence, όπου η τεχνητή νοημοσύνη ξεπερνά τα όρια και προσφέρει μια ανθρωποκεντρική φροντίδα.'>
    <meta property="og:title" content="LG Affectionate Intelligence | LG GR"/>
    <meta property="og:url" content="https://www.lg.com/gr/lg-ai">
    <meta property="og:description" content='Η LG AI στοχεύει σε μια ευχάριστη και απλή ζωή για εσάς, μέσα από τη φιλοσοφία “Σοφή αντίληψη, Κατανόηση εις βάθος,  Ζεστή φροντίδα"
    Ζήστε μια αναβαθμισμένη ποιότητα ζωής με την LG Affectionate Intelligence, όπου η τεχνητή νοημοσύνη ξεπερνά τα όρια και προσφέρει μια ανθρωποκεντρική φροντίδα.'/>
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
    <meta itemprop="description" content='Η LG AI στοχεύει σε μια ευχάριστη και απλή ζωή για εσάς, μέσα από τη φιλοσοφία “Σοφή αντίληψη, Κατανόηση εις βάθος,  Ζεστή φροντίδα"
    Ζήστε μια αναβαθμισμένη ποιότητα ζωής με την LG Affectionate Intelligence, όπου η τεχνητή νοημοσύνη ξεπερνά τα όρια και προσφέρει μια ανθρωποκεντρική φροντίδα.'/>
    <meta itemprop="Keywords" content="LG AI, Affectionate Intelligence, Ανθρωποκεντρική Τεχνητή Νοημοσύνη, Smart Life, Προηγμένες τεχνολογικές λύσεις"/>
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
            <h1 id="kv-video-description" class="a11y-text" data-tp="copy">Μια γυναίκα περνά, καθώς το φως ανάβει αυτόματα.
Εμφανίζεται η φράση: «Σοφή Αντίληψη»
Ένας άνδρας και μια γυναίκα αγκαλιάζονται, ενώ ενεργοποιείται το XBOOM ηχείο.
Η φράση που εμφανίζεται: «Κατανόηση εις βάθος»
Ένας άνδρας κάθεται λυπημένος στη θέση του οδηγού.Εμφανίζεται το λογότυπο LG AI με τη φράση: «Ζεστή Φροντίδα»
Παίζει ένας αγώνας ποδοσφαίρου στην τηλεόραση.
Η LG AI ανταποκρίνεται σε φωνητική εντολή.
Εμφανίζεται η φράση: «Για μια ευχάριστη ζωή»

Το XBOOM, η τηλεόραση και μια οικογένεια με τον σκύλο τους εμφανίζονται στο ίδιο πλάνο.

Μια μητέρα και ο γιος της χρησιμοποιούν μαζί το πλυντήριο.
Εμφανίζεται η φράση: «Για μια αβίαστη καθημερινότητα»

Σκηνές με τη μητέρα και τον γιο, κοντινό στο χειριστήριο AI Wash και έναν άνδρα που χρησιμοποιεί το LG gram laptop ενώνονται σε ένα ενιαίο πλάνο,
με τη φράση: «Για μια αβίαστη καθημερινότητα»

Ένας άνδρας και μια γυναίκα κάθονται στα μπροστινά καθίσματα του αυτοκινήτου.
Το λογότυπο LG AI εμφανίζεται ανάμεσά τους με τη φράση:
«Για μια ζωή με φροντίδα»

Ένα άτομο μπαίνει σε ένα γραφείο με τον σκύλο του.
Ο καθαριστής αέρα ενεργοποιείται αυτόματα.

Τελικό πλάνο: Λευκό φόντο με το λογότυπο LG AI
και τη φράση: «Affectionate Intelligence για εσένα»</h1>
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
              <img src="./lg-ai/assets/image/ai-gate-image-overview-ai-logo-mobile.svg" alt="Λογότυπο LG AI" class="ai-logo" data-tp="alt">
            </picture>
            <h2 class="title" data-tp="copy"><span class="gradient-text" data-tp="copy">Affectionate Intelligence</span> για ΕΣΑΣ</h2>
            <p class="text" data-tp="copy">Στην LG, αναρωτηθήκαμε: <br>
Γιατί πρέπει να υπάρχει η τεχνητή νοημοσύνη; <br>
Μετά από σκέψη και αναζήτηση, βρήκαμε την απάντησή μας. <br><br>
              Για εμάς, το AI δεν είναι απλώς τεχνητή νοημοσύνη — είναι στοργική νοημοσύνη.<br><br>
              Καθώς το AI γίνεται αναπόσπαστο κομμάτι της καθημερινότητάς μας, <br>
              ο ρόλος της είναι να συμβάλλει στη ζωή που όλοι αξίζουμε. <br><br>
              Γι' αυτό η LG AI ξεκινά με ΕΣΑΣ, <br>
              μέσω της σοφής αντίληψης, της κατανόησης εις βάθος <br>
              και της φροντίδας για τη ζωή σας.
              <strong>Ανακαλύψτε πώς η ζωή είναι καλύτερη με την LG AI </strong></p>
            <img src="./lg-ai/assets/image/ai-gate-image-overview-scroll-down-icon-desktop.svg" alt="Εικονίδιο scroll down" class="scroll-down-icon" data-tp="alt">
          </div>
        </section>
        <!-- E : overview-section -->
        <!-- S : product-section -->
        <section class="product-section">
          <div class="inner">
            <div class="tab-container" role="tablist">
              <!-- S : tab-list -->
              <div class="tab-list">
                <button class="tab active" role="tab" aria-selected="true" aria-controls="product-panel-1" id="product-tab-1" data-tp="copy">Ευχάριστη ζωή</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-2" id="product-tab-2" data-tp="copy">Ξέγνοιαστη ζωή</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="product-panel-3" id="product-tab-3" data-tp="copy">Ζωή με φροντίδα</button>
              </div>
              <!-- E : tab-list -->
              
              <!-- S : panel-container -->
              <div class="panel-container">
                <!-- S : tab-panel tab-1 -->
                <div class="tab-panel" role="tabpanel" aria-labelledby="product-tab-1" id="product-panel-1">
                  <div class="tab-panel-inner">
                    <h2 class="tab-panel-title text-center" data-tp="copy">Η LG AI καταλαβαίνει την καθημερινότητα σας και την αναβαθμίζει, γεμίζοντάς την με ευχάριστες στιγμές.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit01-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit01-banner-mobile.png" aria-labelledby="benefit01-banner-video-description">
                      <span id="benefit01-banner-video-description" class="a11y-text" data-tp="copy">Ένας άνδρας και μια γυναίκα κάθονται στον καναπέ,
παρακολουθώντας έναν ποδοσφαιρικό αγώνα σε LG τηλεόραση στο σαλόνι.
Η σκηνή μεταβαίνει, και το ζευγάρι αγκαλιάζεται.
Η κάμερα εστιάζει στο LG XBOOM που βρίσκεται δίπλα τους.</span>
                      <h3 class="video-title" data-tp="copy">Για τη δική σας ευχάριστη ζωή</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/gr/oled-evo-tileoraseis" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products01.png" alt="Μπροστινή όψη της LG OLED evo AI τηλεόρασης" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/gr/oled-tileoraseis" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products02.png" alt="Μπροστινή όψη της LG OLED AI τηλεόρασης" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/gr/qned-mini-led-tileoraseis" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products03.png" alt="Μπροστινή όψη της LG QNED AI τηλεόρασης" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/gr/tileoraseis-nanocell" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit01-products04.png" alt="Μπροστινή όψη της LG NanoCell AI τηλεόρασης" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">Η LG AI αντιλαμβάνεται τις ανάγκες σας και προσφέρει λύσεις που κάνουν τη ζωή σας να κυλά ξέγνοιαστα, στο δικό σας ρυθμό.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit02-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit02-banner-mobile.png" aria-labelledby="benefit02-banner-video-description">
                      <span id="benefit02-banner-video-description" class="a11y-text" data-tp="copy">Μια μητέρα και ο γιος της χρησιμοποιούν μαζί ένα LG AI πλυντήριο, περιστρέφοντας το καντράν για να ενεργοποιήσουν τη λειτουργία AI Wash. Στην ίδια σκηνή εμφανίζεται κι ένας άνδρας που χρησιμοποιεί το laptop LG gram.</span>
                      <h3 class="video-title" data-tp="copy">Για τη δική σας ξέγνοιαστη ζωή</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <a href="https://www.lg.com/gr/plyntirio-kai-stegnotirio/washtower" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products01.png" alt="Μπροστινή όψη του LG WashTower AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
                        </a>
                      </li>
                      <!-- <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products02.png" alt="Μπροστινή όψη του LG Washing Machine AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products03.png" alt="Μπροστινή όψη του LG Dryer AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
                        </a>
                      </li> -->
                      <li class="product-item">
                        <a href="https://www.lg.com/gr/psigeia/lg-gsgv80pyll" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit02-products04.png" alt="Μπροστινή όψη του LG InstaView AI" loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
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
                    <h2 class="tab-panel-title text-center" data-tp="copy">Η LG AI φροντίζει εσάς, τον χώρο σας και τον πλανήτη,
για να κάνει τη ζωή σας άνετη &amp; με φροντίδα ακριβώς όπως επιθυμείτε.</h2>
                    <!-- S : video-bx -->
                    <div class="video-bx responsive-video" data-desktop-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-desktop.mp4" data-mobile-video-src="./lg-ai/assets/video/ai-gate-video-benefit03-banner-video-mobile.mp4" data-desktop-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-desktop.png" data-mobile-poster-src="./lg-ai/assets/image/ai-gate-image-benefit03-banner-mobile.png" aria-labelledby="benefit03-banner-video-description">
                      <span id="benefit03-banner-video-description" class="a11y-text" data-tp="copy">Ένας άνδρας μπαίνει στο γραφείο κρατώντας το λουρί του σκύλου. Ένας άνδρας στο τιμόνι φαίνεται λυπημένος, όταν η LG AI του δείχνει μια οικογενειακή φωτογραφία. Η οθόνη του αυτοκινήτου προβάλλεται σε κοντινό πλάνο, καθώς η LG AI ανοίγει έναν χάρτη και ανακαλεί μια ανάμνηση.</span>
                      <h3 class="video-title" data-tp="copy">Για τη δική σας ζωή με φροντίδα</h3>
                      <button type="button" class="play-btn" aria-label="Play video"></button>
                    </div>
                    <!-- E : video-bx -->
                    <!-- S : product-list -->
                    <ul class="product-list">
                      <li class="product-item">
                        <div class="img-bx">
                          <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products01.png" alt="Μπροστινή όψη του LG DUALCOOL AI" loading="lazy" data-tp="alt">
                        </div>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/adas-solutions/in-cabin-vision" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products02.png" alt="Μπροστινή όψη του ADAS vision system " loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
                        </a>
                      </li>
                      <li class="product-item">
                        <a href="https://www.lg.com/global/mobility/mobility-labworks-series/digital-cockpit-solutions/digital-cockpit-gamma" data-tp="link">
                          <div class="img-bx">
                            <img src="./lg-ai/assets/image/ai-gate-image-benefit03-products03.png" alt="Χρήστης αλληλεπιδρά με οθόνη αφής, υποστηριζόμενη από λύση πολυτροπικού AI HMI, επιλέγοντας μενού καφέ με τη βοήθεια προτροπής από τον AI βοηθό." loading="lazy" data-tp="alt">
                          </div>
                          <span class="link-btn" data-tp="copy">Μάθετε Περισσότερα</span>
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
                <button class="tab active" role="tab" aria-selected="true" aria-controls="feature-panel-1" id="feature-tab-1" data-tp="copy">Τηλεοράσεις</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-2" id="feature-tab-2" data-tp="copy">Ήχος</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-3" id="feature-tab-3" data-tp="copy">Συσκευές</button>
                <button class="tab" role="tab" aria-selected="false" aria-controls="feature-panel-4" id="feature-tab-4" data-tp="copy">Κλιματισμός</button>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-eyebrow-logo-mobile.svg" alt="Τηλεοράσεις" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Αναπτύσσεται συνεχώς για να καλύπτει κάθε ανάγκη ψυχαγωγίας σας</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Η LG AI TV μαθαίνει τις προτιμήσεις σας και καταλαβαίνει τον τρόπο ζωής σας, για να βελτιστοποιεί κάθε πτυχή της εμπειρίας,δημιουργώντας την ιδανική, προσωποποιημένη ψυχαγωγία μόνο για εσάς.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-banner-mobile.png" alt="Πάνω από το LG Magic Remote εμφανίζονται λειτουργίες όπως AI Voice ID, AI Search, AI Chatbot, AI Concierge, AI Picture Wizard και AI Sound Wizard." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Γνωρίστε τη νέα γενιά των <br>
                          LG AI τηλεοράσεων</h3>
                        <a href="https://www.lg.com/gr/tvs-soundbars/ai-tv" class="white-btn" data-tp="copy link">Μάθετε Περισσότερα</a>
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature01.png" alt="Στην οθόνη μιας LG OLED τηλεόρασης εμφανίζεται η αρχική σελίδα του webOS 25, γεμάτη εφαρμογές και ψυχαγωγικό περιεχόμενο. Δίπλα στην τηλεόραση βρίσκεται το LG AI Magic Remote, με το κουμπί AI να είναι τονισμένο, σαν να έχει ενεργοποιηθεί από τη φωνή του χρήστη. Δίπλα υπάρχει ένα σύννεφο διαλόγου που λέει: «πρότεινε μια ταινία που θα μου αρέσει»." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Voice ID</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature02.png" alt="Η οθόνη μιας LG OLED τηλεόρασης δείχνει πώς λειτουργεί η Αναζήτηση AI. Ένα μικρό παράθυρο συνομιλίας είναι ανοιχτό, όπου ο χρήστης ρώτησε ποια αθλητικά παιχνίδια είναι διαθέσιμα. Η Αναζήτηση AI απάντησε μέσω συνομιλίας και εμφανίζοντας μικρογραφίες από διάφορα διαθέσιμα περιεχόμενα. Υπάρχει επίσης μια προτροπή να ζητηθεί βοήθεια από το Microsoft Copilot." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Search</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature03.png" alt="Το LG AI Magic Remote σε χρήση. Με ένα σύντομο πάτημα του κουμπιού AI ενεργοποιείται ο βοηθός AI στην οθόνη της OLED τηλεόρασης, ο οποίος προτείνει λέξεις-κλειδιά." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Concierge</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature04.png" alt="Επιστημονικής φαντασίας περιεχόμενο παίζει στην οθόνη μιας LG OLED τηλεόρασης. Στην αριστερή πλευρά της οθόνης εμφανίζεται η διεπαφή του AI Chatbot. Ο χρήστης στέλνει μήνυμα στο chatbot ότι η οθόνη είναι πολύ σκοτεινή, και το chatbot προτείνει λύσεις στο αίτημα." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Chatbot</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature05.png" alt="Γυναίκα που τραγουδάει σε μικρόφωνο φορώντας ακουστικά, τονισμένη από την ενίσχυση ήχου του LG α11 AI Processor." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Picture/Sound Wizard</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-tv-feature06.png" alt="Δύο συνδεδεμένες σκηνές με το LG AI Magic Remote μπροστά από τηλεόραση — στην πρώτη εμφανίζεται μια σκηνή επιστημονικής φαντασίας, στη δεύτερη η αρχική οθόνη με προσωποποιημένο περιεχόμενο." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Magic Remote</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Οι λειτουργίες LG AI χρησιμοποιούν αλγορίθμους βασισμένους σε βαθιά εκμάθηση (deep learning) για πραγματικού χρόνου αναβάθμιση εικόνας και βελτίωση ήχου.</li>
                      <li data-tp="copy">**Όλες οι τηλεοράσεις LG webOS 24 διαθέτουν AI Προσαρμογή, εκτός από αυτές που δεν διαθέτουν αισθητήρες φωτός.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-eyebrow-logo-mobile.svg" alt="Ήχος" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Ήχος με μοναδική ακρίβεια</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Το LG XBOOM AI αναλύει και προσαρμόζει τον ήχο ανάλογα με το είδος και τον χώρο. Με φωτισμό AI που αναβαθμίζει τη διάθεση και εναρμονίζεται με τη μουσική σας, απολαμβάνετε ήχο και ατμόσφαιρα με μοναδικό σωτό  τρόπο.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-banner-mobile.png" alt="Απολάυστε μια νέα ηχητική εμπειρία με το LG XBOOM AI" loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Απολαύστε μια νέα εμπειρία ήχου <br>
                          με το LG xboom AI</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature01.png" alt="Ηχείο LG XBOOM με λειτουργίες ήχου AI, όπως Bass Boost, Voice Enhance και Standard." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Sound</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature02.png" alt="Ηχείο LG XBOOM με φωτισμό AI που προσαρμόζεται στη φωνή, το περιβάλλον και τις λειτουργίες πάρτι." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Lighting</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-audio-feature03.png" alt="Ηχείο LG XBOOM τοποθετημένο πάνω σε τραπέζι σε δωμάτιο με κόκκινους τόνους, τοίχους με σχέδιο πλέγματος και μοντέρνα έπιπλα." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Calibration</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Αυτό το προϊόν δεν είναι ακόμα διαθέσιμο.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-eyebrow-logo-mobile.svg" alt="Συσκευές" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Ελαφρύνετε κάθε σας φόρτο</h2>
                    <!-- E : tab-panel-title -->  
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Η LG WashTower AI ανιχνεύει τι πλένετε και προσφέρει βέλτιστη πλύση για ευαίσθητα υφάσματα, εξασφαλίζοντας σας ένα άψογο και εύκολο πλύσιμο κάθε φορτίου, κάθε φορά.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-banner-mobile.png" alt="Εντοιχισμένο πλυντήριο και στεγνωτήριο LG σε σύγχρονο χώρο πλυντηρίου με ξύλινα ντουλάπια και καθίσματα πάγκου." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title" data-tp="copy">Ανακαλύψτε έναν νέο τρόπο ζωής <br>
                          με την τεχνολογία LG AI Core</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature01.png" alt="Χέρι που ρυθμίζει τον κύκλο AI Wash σε πλυντήριο LG χρησιμοποιώντας το έξυπνο περιστροφικό διακόπτη ελέγχου." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Wash</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-appliances-feature02.png" alt="Χρήστης που επιλέγει τον κύκλο AI Dry σε στεγνωτήριο LG χρησιμοποιώντας ψηφιακό περιστροφικό διακόπτη ελέγχου." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Dry</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Το προϊόν θα κυκλοφορήσει σταδιακά σε επιλεγμένες χώρες.</li>
                      <li data-tp="copy">**Η ανίχνευση AI ενεργοποιείται όταν το φορτίο είναι κάτω από 6 κιλά.</li>
                      <li data-tp="copy">***Το AI Wash πρέπει να χρησιμοποιείται μόνο με παρόμοιους τύπους υφασμάτων [δεν ανιχνεύονται όλα τα υφάσματα] και κατάλληλο απορρυπαντικό.</li>
                      <li data-tp="copy">****Το AI Dry είναι διαθέσιμο μόνο για φορτία κάτω από 5 κιλά με υφάσματα ίδιου επιπέδου απορρόφησης υγρασίας.</li>
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
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-eyebrow-logo-mobile.svg" alt="LG AI Κλιματισμός" class="eyebrow-logo" loading="lazy">
                      </picture>
                      Άνεση με τέλεια ρυθμισμένη ψύξη</h2>
                    <!-- E : tab-panel-title -->
                    <!-- S : tab-panel-text -->
                    <p class="tab-panel-text" data-tp="copy">Η LG DUALCOOL AI φροντίζει για άριστη ποιότητα αέρα, διατηρώντας την άνεσή σας ενώ βελτιστοποιεί την ενεργειακή απόδοση για εξοικονόμηση κόστους. Με το LG AI Air, απολαύστε τέλεια ρυθμισμένη ψύξη για τη δική σας άνεση.</p>
                    <!-- E : tab-panel-text -->
                    <!-- S : tab-panel-banner -->
                    <div class="tab-panel-banner">
                      <picture>
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-desktop.png" media="(min-width: 769px)">
                        <source srcset="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" media="(max-width: 768px)">
                        <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-banner-mobile.png" alt="Το κλιματιστικό LG DUAL Inverter ψύχει ένα σύγχρονο σαλόνι, όπου μια γυναίκα κάθεται στον καναπέ, υποστηριζόμενο από την τεχνολογία ThinQ AI." loading="lazy" data-tp="alt">
                      </picture>
                      <div class="text-bx">
                        <h3 class="title text-black" data-tp="copy">Απόλαυσε βέλτιστη άνεση <br>
                          το LG AI Air</h3>
                        
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
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature01.png" alt="Γυναίκα που χαλαρώνει σε έναν έξυπνο χώρο καθιστικού ενώ το LG AI Air conditioner ρυθμίζει αυτόματα τη θερμοκρασία, τη ροή αέρα και την υγρασία." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI Air</p>
                          </div>
                          <div class="swiper-slide">
                            <div class="img-bx">
                              <img src="./lg-ai/assets/image/ai-gate-image-product-category-air-conditioning-feature02.png" alt="Διεπαφή smartphone που εμφανίζει γράφημα κατανάλωσης ενέργειας μπροστά από κλιματιστικό LG, τονίζοντας το AI kW Manager για αποδοτική παρακολούθηση ενέργειας." data-tp="alt">
                            </div>
                            <p class="slide-title" data-tp="copy">AI kW Manager</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- E : tab-panel-slide -->
                    <!-- S : tab-panel-disclaimer -->
                    <ul class="tab-panel-disclaimer">
                      <li data-tp="copy">*Το AI Air μπορεί να λειτουργεί μέσω τηλεχειριστηρίου και ThinQ.</li>
                      <li data-tp="copy">**Το AI Air είναι διαθέσιμο τόσο σε λειτουργία ψύξης όσο και θέρμανσης.</li>
                      <li data-tp="copy">***Κατά τη χρήση του AI Air, ο όγκος αέρα και η κατεύθυνση ανέμου ρυθμίζονται αυτόματα ανάλογα με την κατάσταση, και το AI Air απενεργοποιείται όταν αλλάζει η κατεύθυνση του ανέμου.</li>
                      <li data-tp="copy">****Όταν το AI Air είναι ενεργοποιημένο, ο αισθητήρας ραντάρ εντοπίζει τη θέση του χρήστη και ενεργοποιεί αυτόματα τον άμεσο ή έμμεσο αέρα.</li>
                      <li data-tp="copy">*****Η απόσταση ανίχνευσης του αισθητήρα ραντάρ φτάνει μέχρι τα 5 μέτρα, και ενδέχεται να υπάρχουν διαφορές στην απόσταση ανίχνευσης ανάλογα με την εγκατάσταση και το περιβάλλον χρήσης του προϊόντος.</li>
                      <li data-tp="copy">******Αυτή η λειτουργία είναι διαθέσιμη μόνο σε μοντέλα που διαθέτουν αισθητήρες ραντάρ.</li>
                    </ul>
                    <!-- E : tab-panel-disclaimer -->
                  </div>
                </div>
                <!-- E : panel tab-4 -->
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
            <h2 class="thinq-section-title" data-tp="copy">Το ThinQ® κάνει τη ζωή να κυλά πιο ομαλά.</h2>
            <p class="thinq-section-text" data-tp="copy">Μια πλατφόρμα για τις έξυπνες συσκευές και τα προϊόντα LG, το ThinQ σάς προσφέρει έλεγχο και ευκολία με ένα άγγιγμα, βοηθώντας σας να απλοποιήσετε την καθημερινότητά σας και να απολαύσετε τις ανέσεις του σπιτιού.</p>
            
            <div class="banner">
              <picture> 
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-desktop.png" media="(min-width: 769px)">
                <source srcset="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" media="(max-width: 768px)">
                <img src="./lg-ai/assets/image/ai-gate-image-thinq-banner-mobile.png" alt="Ένα άτομο κρατά smartphone με ανοιχτή την εφαρμογή LG ThinQ, διαχειριζόμενο τις έξυπνες συσκευές του σπιτιού ενώ απολαμβάνει τον καφέ του." loading="lazy" data-tp="alt">  
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
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature01.png" alt="Σε μια σύγχρονη έξυπνη κουζίνα, μια γυναίκα δίνει φωνητική εντολή για να ξεκινήσει το πλυντήριο με το LG ThinQ AI, ενώ ένας άνδρας διαβάζει στον καναπέ στο βάθος." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Απλός έλεγχος με τη βοήθεια του Voice Assistant</h3>
                <p class="text" data-tp="copy">Πείτε στη συσκευή LG σας ακριβώς τι χρειάζεστε απλώς με τη φωνή σας, και ο  AI Voice Assistant θα σας ακούσει, θα ελέγξει τον κύκλο και θα σας ενημερώσει.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
            <!-- S : thinq-flex-bx -->
            <div class="flex-bx reverse">
              <div class="img-bx">
                <figure>
                  <img src="./lg-ai/assets/image/ai-gate-image-thinq-feature02.png" alt="Ένα smartphone εμφανίζει την εφαρμογή LG ThinQ που ελέγχει το φούρνο LG InstaView Slide-In Range, επιτρέποντας αποτελεσματική συντήρηση προϊόντων στην κουζίνα." loading="lazy" data-tp="alt">
                </figure>
              </div>
              <div class="text-bx">
                <h3 class="title" data-tp="copy">Αποτελεσματική Συντήρηση Προϊόντων</h3>
                <p class="text" data-tp="copy">Μέσω της εφαρμογής LG ThinQ, ελέγξτε τη συσκευή LG σας, κατεβάστε νέους κύκλους χρήσης, παρακολουθήστε τους και πολλά ακόμα.</p>
              </div>
            </div>
            <!-- E : thinq-flex-bx -->
          </div>
        </section>
        <!-- E : thinq-section (Local)-->
        <!-- S : stories-section -->
        <section class="stories-section">
          <div class="inner">
              <h2 class="title" data-tp="copy">Περισσότερα για την LG Affectionate Intelligence</h2>
              <div class="slide-bx">
                  <div class="swiper" role="region" aria-label="스토리 슬라이드쇼">
                      <div class="swiper-wrapper">
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner01-mobile.png" alt="Στέλεχος της LG Electronics κρατάει πιστοποιητικό διαπίστευσης για την κυβερνοασφάλεια, με ψηφιακό γραφικό ασφαλείας στο φόντο." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">Η LG Ενισχύει την Ηγεσία της στην Κυβερνοασφάλεια με την Πιστοποίηση Δοκιμών Κυβερνοασφάλειας IoT από την KOLAS</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-strengthens-cybersecurity-leadership-with-kolas-iot-cybersecurity-testing-accreditation/" class="white-btn" data-tp="copy link">Μάθετε Περισσότερα</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner02-mobile.png" alt="Επισκέπτες παρακολουθούν κυρτή οθόνη LED της LG που προβάλλει το σύνθημα «Life’s Good 24/7» σε έκθεση τεχνολογίας." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">Η LG παρουσιάζει τις πιο πρόσφατες καινοτομίες της με την τεχνολογία «Affectionate Intelligence» στο CES 2025.</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-presents-its-latest-innovations-powered-by-affectionate-intelligence-at-ces-2025/" class="white-btn" data-tp="copy link">Μάθετε Περισσότερα</a>
                              </div>
                          </div>
                          <div class="swiper-slide" role="group" aria-roledescription="슬라이드">
                              <picture>
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-desktop.png" media="(min-width: 769px)">
                                <source srcset="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" media="(max-width: 768px)">
                                <img src="./lg-ai/assets/image/ai-gate-image-more-about-lg-ai-banner03-mobile.png" alt="Ο ομιλητής παρουσιάζει λύσεις B2B με τεχνητή νοημοσύνη σε εκδήλωση της LG." loading="lazy" data-tp="alt">
                              </picture>
                              <div class="txt-bx">
                                  <p data-tp="copy">Η LG παρουσιάζει το Day in the life με την «Affectionate Intelligence» στην παγκόσμια πρεμιέρα της LG.</p>
                                  <a href="https://www.lgnewsroom.com/2025/01/lg-unveils-a-day-in-a-life-with-affectionate-intelligence-at-lg-world-premiere/" class="white-btn" data-tp="copy link">Μάθετε Περισσότερα</a>
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
