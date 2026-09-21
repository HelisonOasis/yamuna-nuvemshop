<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Dosis:wght@300;400;500;600;700;800;900&family=Inter:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&family=Poppins:wght@400;500;600;700&family=Raleway:wght@400;500;600;700;800&family=Roboto:wght@400;500;600;700;800;900&display=swap" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <link rel="icon" type="image/png" href="{{ 'images/yamuna/favicon.png' | static_url }}" />
        <meta name="description" content="{{ page_description }}" />
        <link rel="preload" as="style" href="{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400,700') }}" />
        <link rel="preload" href="{{ 'css/style-colors.scss.tpl' | static_url }}" as="style" />

        {# Preload LCP home, category and product page elements #}

        {% snipplet 'preload-images.tpl' %}

        {{ component('social-meta') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        {# Critical CSS needed to show first elements of store while CSS async is loading #}

        <style>

            {# Font families #}

            {{ component(
                'fonts',{
                    font_weights: '400,700',
                    font_settings: 'settings.font_headings, settings.font_rest'
                })
            }}

            {% include "static/css/style-critical.tpl" %}
        </style>

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss.tpl' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss.tpl' | static_url }}" media="print" onload="this.media='all'">

        <style>
            @media (min-width: 768px) {
                body.template-home .yamuna-home-hero-overlay-button {
                    font-family: 'Roboto', sans-serif !important;
                    font-size: 18px !important;
                    font-style: normal !important;
                    font-weight: 500 !important;
                    line-height: normal !important;
                    text-align: center !important;
                    text-transform: uppercase !important;
                }
            }

            {# Mega-menu: CDN async CSS still locks height at 358px; keep this after async link. #}
            @media (min-width: 1024px) {
                body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
                    height: auto !important;
                    min-height: calc(48px + 320px + 56px + var(--yamuna-panel-overlap, 105px)) !important;
                    max-height: none !important;
                    box-sizing: border-box !important;
                    overflow: hidden !important;
                }
                body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems {
                    height: auto !important;
                    max-height: none !important;
                    margin: 0 !important;
                    padding: 48px 34px 56px !important;
                    align-content: start !important;
                    box-sizing: border-box !important;
                    overflow: visible !important;
                }
            }
        </style>

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {# 043 — hero arrows: larger/thicker stroke SVG, centered in glass #}
        <style id="yamuna-hero-arrows-043">
          @media (min-width: 768px) {
            body.template-home .js-home-main-slider-container .js-swiper-home-prev,
            body.template-home .js-home-main-slider-container .js-swiper-home-next {
              display: flex !important;
              align-items: center !important;
              justify-content: center !important;
              padding: 0 !important;
              line-height: 0 !important;
              border-color: rgba(255, 255, 255, 0.95) !important;
              background: rgba(255, 255, 255, 0.9) !important;
              background-color: rgba(255, 255, 255, 0.9) !important;
              color: #238482 !important;
            }
            body.template-home .js-home-main-slider-container .js-swiper-home-prev::before,
            body.template-home .js-home-main-slider-container .js-swiper-home-next::before,
            body.template-home .js-home-main-slider-container .js-swiper-home-prev::after,
            body.template-home .js-home-main-slider-container .js-swiper-home-next::after {
              display: none !important;
              content: none !important;
              width: 0 !important;
              height: 0 !important;
              margin: 0 !important;
              border: 0 !important;
              font-size: 0 !important;
              background: none !important;
            }
            body.template-home .js-home-main-slider-container .yamuna-home-hero-arrow-icon,
            body.template-home .js-home-main-slider-container .js-swiper-home-prev svg.yamuna-home-hero-arrow-icon,
            body.template-home .js-home-main-slider-container .js-swiper-home-next svg.yamuna-home-hero-arrow-icon {
              display: block !important;
              width: 26px !important;
              height: 26px !important;
              margin: 0 !important;
              padding: 0 !important;
              color: #238482 !important;
              fill: none !important;
              stroke: #238482 !important;
              stroke-width: 3.25 !important;
              transform: none !important;
              opacity: 1 !important;
              flex: 0 0 auto !important;
            }
            body.template-home .js-home-main-slider-container .yamuna-home-hero-arrow-icon polyline {
              stroke: #238482 !important;
              stroke-width: 3.25 !important;
              stroke-linecap: round !important;
              stroke-linejoin: round !important;
              fill: none !important;
            }
          }
        </style>

        {# 113 — mega-menu: closed has no ghost hitbox; opens only on Produtos hover #}
        <style id="yamuna-nav-dropdown-113">
          @media (min-width: 1024px) {
            html body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-menu > .yamuna-products-dropdown,
            html body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown > .desktop-dropdown,
            html body.template-home .head-main .yamuna-header-desktop-nav .yamuna-products-menu > .yamuna-products-dropdown,
            html body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown > .desktop-dropdown {
              visibility: hidden !important;
              opacity: 0 !important;
              pointer-events: none !important;
              transition: none !important;
            }
            html body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-menu:hover > .yamuna-products-dropdown,
            html body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-menu.is-open > .yamuna-products-dropdown,
            html body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown:hover > .desktop-dropdown,
            html body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown.is-open > .desktop-dropdown,
            html body.template-home .head-main .yamuna-header-desktop-nav .yamuna-products-menu:hover > .yamuna-products-dropdown,
            html body.template-home .head-main .yamuna-header-desktop-nav .yamuna-products-menu.is-open > .yamuna-products-dropdown,
            html body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown:hover > .desktop-dropdown,
            html body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown.is-open > .desktop-dropdown {
              visibility: visible !important;
              opacity: 1 !important;
              pointer-events: auto !important;
              transition: none !important;
            }
          }
        </style>

        {# 012 — institutional pages: content starts below fixed mobile header #}
        <style id="yamuna-inst-pages-012">
          @media (max-width: 1023px) {
            body.template-page {
              padding-top: 80px !important;
            }
            body.template-page .head-main,
            body.template-page .head-main.head-fixed,
            body.template-page .head-main .yamuna-header-mobile {
              background: #fff !important;
              background-color: #fff !important;
            }
            body.template-page .yamuna-about-page .yamuna-about-layout {
              padding: 16px 16px 64px !important;
            }
          }
        </style>

        {# 039 — mobile cart badge = yamuna.com.br (#cart-qty-label-mob) #}
        <style id="yamuna-cart-badge-039">
          @media (max-width: 1023px) {
            body .head-main .yamuna-header-mobile .yamuna-header-mobile-cart-count,
            body .head-main .yamuna-header-mobile-actions .yamuna-header-mobile-cart-count,
            body .head-main .yamuna-header-mobile-action .yamuna-header-mobile-cart-count,
            body .head-main .yamuna-header-mobile-action .js-cart-widget-amount,
            body .head-main .yamuna-header-mobile-action .badge-amount,
            body .head-main span.yamuna-header-mobile-cart-count.js-cart-widget-amount.badge-amount {
              position: absolute !important;
              top: auto !important;
              bottom: 0 !important;
              right: -0.25rem !important;
              left: auto !important;
              z-index: 10 !important;
              display: flex !important;
              align-items: center !important;
              justify-content: center !important;
              min-width: 0 !important;
              width: auto !important;
              height: auto !important;
              padding: 0.2rem 0.5rem !important;
              border: 0 !important;
              border-radius: 9999px !important;
              background: #fff !important;
              background-color: #fff !important;
              color: #1B1A21 !important;
              font-family: 'Raleway', sans-serif !important;
              font-size: 10px !important;
              font-weight: 700 !important;
              line-height: 1 !important;
              box-shadow: none !important;
              box-sizing: border-box !important;
              pointer-events: none !important;
            }
          }
        </style>

        {# 011 — 404: fundo branco contínuo (sem faixas #f6f6f6). #}
        {% if template == '404' %}
        <style id="yamuna-404-bg-011">
          html body.template-404,
          body.template-404,
          body.template-404 > .mt-4,
          body.template-404 .yamuna-404-page {
            background: #fff !important;
            background-color: #fff !important;
          }
          body.template-404 > .mt-4 {
            margin-top: 0 !important;
            margin-bottom: 0 !important;
          }
        </style>
        {% endif %}

        {# Mobile mirrors desktop band: cream sections + grey wash on benefits bar. #}
        {% if template == 'home' %}
        <style id="yamuna-home-cream-band">
          @media (max-width: 767px) {
            body.template-home .js-home-sections-container,
            body.template-home [data-store="banner-services"],
            body.template-home .section-yamuna-category-slider,
            body.template-home [data-store="home-image-text-module"],
            body.template-home .section-featured-home,
            body.template-home [data-store^="home-products-"].section-featured-home,
            body.template-home .section-yamuna-information,
            body.template-home .section-yamuna-category-highlights {
              background: #f6f6f6 !important;
              background-color: #f6f6f6 !important;
            }

            /* Same desktop ≥1024 wash — composites to ~#efebe7 over cream parent. */
            body.template-home [data-store="banner-services"] .section-informative-banners,
            body.template-home .section-informative-banners {
              background: rgba(192, 187, 195, 0.2) !important;
              background-color: rgba(192, 187, 195, 0.2) !important;
            }
          }
        </style>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data-organization') }}
        {{ component('structured-data') }}

        {% if template == 'product' %}
        <script>
            {# Clear sticky CEP cookie ASAP so platform JS cannot auto-restore on PDP refresh. #}
            (function () {
                try {
                    document.cookie = 'calculator_zipcode=; Max-Age=0; path=/';
                    document.cookie = 'calculator_zipcode=; Max-Age=0; path=/; domain=' + location.hostname;
                } catch (e) {}
            })();
        </script>
        {% endif %}

    </head>
    <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}" data-rounded-borders="{{ settings.theme_rounded ? 'true' : 'false' }}" data-solid-icons="{{ settings.icons_solid ? 'true' : 'false' }}">

        {{ component('nubesdk-slot', { type: "before_main_content" }) }}

        {# Theme icons #}

        {% include "snipplets/svg/icons.tpl" %}

        {% if settings.icons_solid %}
            {% include "snipplets/svg/icons-solid.tpl" %}
        {% else %}
            {% include "snipplets/svg/icons-regular.tpl" %}
        {% endif %}

        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart
           Cart page uses the prod checkout logo-only header. #}

        {% if template == 'cart' %}
            {% snipplet "header/header-cart.tpl" %}
        {% else %}
            {% snipplet "header/header.tpl" %}
        {% endif %}

        {# Page content #}

        {% if template != 'home' or (template == 'home' and settings.slider is empty) %}

        <div class="{% if template == 'cart' %}yamuna-cart-wrap{% elseif template == 'blog' or template == 'blog-post' or page.handle == 'revenda' or page.handle == 'quem-somos' or page.handle == 'quemsomos' or page.handle == 'nossomanifesto' or page.handle == 'nosso-manifesto' or page.handle == 'politicadeprivacidade' or page.handle == 'politica-de-privacidade' or page.handle == 'trabalheconosco' or page.handle == 'trabalhe-conosco' or page.handle == 'entrega' or page.handle == 'trocasedevolucoes' or page.handle == 'trocas-e-devolucoes' or page.handle == 'duvidasfrequentes' or page.handle == 'duvidas-frequentes' %}yamuna-resale-wrap{% else %}mt-4{% endif %}">

        {% endif %}

            {% template_content %}

        {% if template != 'home' or (template == 'home' and settings.slider and settings.slider is not empty) %}

        </div>

        {% endif %}

        {# WhatsApp chat button #}

        {% snipplet "whatsapp-chat.tpl" %}

        {# Footer — cart page uses the simplified checkout footer from prod #}

        {% if template == 'cart' %}
            {% snipplet "footer/footer-cart.tpl" %}
        {% else %}
            {% snipplet "footer/footer.tpl" %}
        {% endif %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            // Supports both legacy numeric IDs and product-description block keys.
            function toggleInfo(id) {
                if (id === null || typeof id === 'undefined') {
                    return;
                }

                var content = document.getElementById('infoToOpen-' + String(id));
                var trigger = document.getElementById('info-id-' + String(id));

                if (content) {
                    content.classList.toggle('hidden');

                    if (trigger) {
                        trigger.classList.toggle('is-open', !content.classList.contains('hidden'));
                    }
                }
            }

            function moveProductAccordionHeadings() {
                var accordions = document.querySelectorAll('.yamuna-product-description-accordion');

                for (var index = 0; index < accordions.length; index++) {
                    var accordion = accordions[index];
                    var trigger = accordion.querySelector('.informationDiv');
                    var content = accordion.querySelector('.infoToOpen');

                    if (!trigger || !content || trigger.querySelector('h3')) {
                        continue;
                    }

                    var title = content.querySelector('h3');
                    if (title) {
                        trigger.appendChild(title);
                    }
                }
            }

            function styleYamunaProductDescription() {
                var main = document.querySelector('.yamuna-product-description-main');
                if (!main) {
                    return;
                }

                var headings = main.querySelectorAll('h2, h3');
                for (var h = 0; h < headings.length; h++) {
                    var heading = headings[h];
                    if (heading.classList.contains('yamuna-pdp-description-title')) {
                        continue;
                    }
                    var headingText = (heading.textContent || '').replace(/\s+/g, ' ').trim().toLowerCase();
                    if (headingText === 'descrição' || headingText === 'descricao' || headingText === 'descrição do produto' || headingText === 'descricao do produto') {
                        heading.classList.add('yamuna-pdp-description-duplicate');
                    }
                }

                var nodes = main.querySelectorAll('p, li, strong, b, span, a, button');
                var hasNutritionBtn = false;
                for (var i = 0; i < nodes.length; i++) {
                    var node = nodes[i];
                    var text = (node.textContent || '').replace(/\s+/g, ' ').trim();
                    var lower = text.toLowerCase();

                    if (lower === 'tabela nutricional' || (lower.indexOf('tabela nutricional') === 0 && text.length < 40)) {
                        node.classList.add('yamuna-pdp-nutrition-btn');
                        if (node.tagName === 'BUTTON' || node.tagName === 'A' || node.childNodes.length <= 1) {
                            node.textContent = 'TABELA NUTRICIONAL';
                        }
                        hasNutritionBtn = true;
                        continue;
                    }

                    if (lower.indexOf('ingredientes:') === 0 || lower.indexOf('rendimento:') === 0) {
                        if (node.querySelector('.yamuna-pdp-desc-label')) {
                            continue;
                        }
                        var labelMatch = text.match(/^(Ingredientes:|Rendimento:)/i);
                        if (!labelMatch) {
                            continue;
                        }
                        var label = labelMatch[1];
                        var rest = text.slice(label.length);
                        node.innerHTML = '<span class="yamuna-pdp-desc-label">' + label + '</span>' + rest;
                    }
                }

                // Figma mobile: TABELA NUTRICIONAL opens Informacao Nutricional accordion
                if (!hasNutritionBtn && !main.querySelector('.yamuna-pdp-nutrition-btn')) {
                    var nutritionTarget = document.getElementById('info-id-informacao-nutricional');
                    if (nutritionTarget) {
                        var btn = document.createElement('button');
                        btn.type = 'button';
                        btn.className = 'yamuna-pdp-nutrition-btn';
                        btn.textContent = 'TABELA NUTRICIONAL';
                        btn.addEventListener('click', function () {
                            if (typeof toggleInfo === 'function') {
                                toggleInfo('informacao-nutricional');
                            }
                            nutritionTarget.scrollIntoView({ behavior: 'smooth', block: 'center' });
                        });
                        main.appendChild(btn);
                    }
                }
            }

            function paintYamunaPdpRating(average, count) {
                var root = document.querySelector('.js-yamuna-pdp-rating');
                if (!root) {
                    return;
                }
                var score = Math.max(0, Math.min(5, Number(average) || 0));
                var total = Math.max(0, parseInt(count, 10) || 0);
                var filledSrc = root.getAttribute('data-star-filled') || '';
                var emptySrc = root.getAttribute('data-star-empty') || '';
                var stars = root.querySelectorAll('.js-yamuna-pdp-star');
                for (var s = 0; s < stars.length; s++) {
                    stars[s].src = (score > 0 && s < Math.round(score)) ? filledSrc : emptySrc;
                }

                var label = root.querySelector('.js-yamuna-pdp-rating-label');
                if (label) {
                    if (score > 0 || total > 0) {
                        var pretty = (Math.round(score * 10) / 10).toFixed(1).replace('.', ',');
                        label.textContent = pretty + ' de 5 (' + total + ')';
                        root.classList.remove('is-empty');
                    } else {
                        label.textContent = 'Ver avaliações';
                        root.classList.add('is-empty');
                    }
                }

                root.hidden = false;
                root.setAttribute('aria-label', score > 0
                    ? ('Avaliação ' + score + ' de 5 com ' + total + ' avaliações')
                    : 'Ver avaliações do produto');
            }

            function parseYamunaReviewsFromDom() {
                var app = document.getElementById('reviewsapp');
                if (!app || !app.textContent) {
                    return null;
                }
                var text = app.textContent.replace(/\s+/g, ' ');
                var avgMatch = text.match(/(\d+[.,]\d+)\s*(?:de|\/)\s*5/i) || text.match(/média[^\d]*(\d+[.,]\d+)/i);
                var countMatch = text.match(/(\d+)\s*avalia/i) || text.match(/\((\d+)\)/);
                if (!avgMatch) {
                    return null;
                }
                return {
                    average: parseFloat(String(avgMatch[1]).replace(',', '.')),
                    count: countMatch ? parseInt(countMatch[1], 10) : 0
                };
            }

            function initYamunaPdpRating() {
                var root = document.querySelector('.js-yamuna-pdp-rating');
                if (!root) {
                    return;
                }

                var initialAvg = parseFloat(String(root.getAttribute('data-rating') || '').replace(',', '.'));
                var initialCount = parseInt(root.getAttribute('data-count') || '0', 10);
                paintYamunaPdpRating(!isNaN(initialAvg) ? initialAvg : 0, initialCount);

                var tryParse = function () {
                    var parsed = parseYamunaReviewsFromDom();
                    if (parsed) {
                        paintYamunaPdpRating(parsed.average, parsed.count);
                    }
                };

                tryParse();
                var app = document.getElementById('reviewsapp');
                if (app && window.MutationObserver) {
                    var observer = new MutationObserver(tryParse);
                    observer.observe(app, { childList: true, subtree: true, characterData: true });
                }
                setTimeout(tryParse, 1500);
                setTimeout(tryParse, 4000);
            }

            function initYamunaProductDescriptionUi() {
                moveProductAccordionHeadings();
                styleYamunaProductDescription();
                initYamunaPdpRating();
            }

            {# C022: ALL-CAPS (or all-caps words) product names → sentence case #}
            function yamunaNormalizeProductTitleText(raw) {
                var text = String(raw || '').replace(/\s+/g, ' ').trim();
                if (!text) {
                    return text;
                }

                var letters = text.replace(/[^A-Za-zÀ-ÿ]/g, '');
                if (!letters) {
                    return text;
                }

                var upperCount = (letters.match(/[A-ZÀ-Ý]/g) || []).length;
                var mostlyUpper = upperCount / letters.length >= 0.5;

                var words = text.split(' ');
                var hasAllCapsWord = false;
                for (var w = 0; w < words.length; w++) {
                    var wordLetters = words[w].replace(/[^A-Za-zÀ-ÿ]/g, '');
                    if (
                        wordLetters.length >= 3 &&
                        wordLetters === wordLetters.toUpperCase() &&
                        wordLetters !== wordLetters.toLowerCase()
                    ) {
                        hasAllCapsWord = true;
                        break;
                    }
                }

                if (!mostlyUpper && !hasAllCapsWord) {
                    return text;
                }

                var lower = text.toLowerCase();
                for (var i = 0; i < lower.length; i++) {
                    if (/[a-zà-ÿ]/i.test(lower.charAt(i))) {
                        return lower.slice(0, i) + lower.charAt(i).toUpperCase() + lower.slice(i + 1);
                    }
                }
                return lower;
            }

            function normalizeYamunaProductTitles(root) {
                var scope = root || document;
                var nodes = scope.querySelectorAll('.js-item-name, .js-product-name, [data-store^="product-item-name-"], [data-store^="product-name-"]');
                for (var i = 0; i < nodes.length; i++) {
                    var node = nodes[i];
                    var current = (node.textContent || '').replace(/\s+/g, ' ').trim();
                    var next = yamunaNormalizeProductTitleText(current);
                    if (next && next !== current) {
                        node.textContent = next;
                    }
                    node.setAttribute('data-yamuna-title-normalized', '1');
                }
            }

            function initYamunaTitleNormalization() {
                normalizeYamunaProductTitles(document);
                if (window.MutationObserver) {
                    var observer = new MutationObserver(function (mutations) {
                        for (var m = 0; m < mutations.length; m++) {
                            var added = mutations[m].addedNodes;
                            for (var n = 0; n < added.length; n++) {
                                if (added[n].nodeType === 1) {
                                    normalizeYamunaProductTitles(added[n]);
                                }
                            }
                        }
                    });
                    observer.observe(document.body, { childList: true, subtree: true });
                }
            }

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', function () {
                    initYamunaProductDescriptionUi();
                    initYamunaTitleNormalization();
                });
            } else {
                initYamunaProductDescriptionUi();
                initYamunaTitleNormalization();
            }

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Libraries that requires Jquery to work #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {% if store.useStoreJsV2() %}
                    {% include "static/js/store-v2.js.tpl" %}
                {% else %}
                    {% include "static/js/store.js.tpl" %}
                {% endif %}
            });
        </script>

        <script>
            ;(function () {
                function isMobileSort() {
                    return window.innerWidth <= 1023;
                }

                function getSortSelect(sort) {
                    return sort && sort.querySelector('select.js-sort-by, select.js-sort-by-private, select[data-component="sort-by"], select.form-select');
                }

                function syncSortCurrent(sort) {
                    var group = sort.querySelector('.form-group');
                    var select = getSortSelect(sort);
                    if (!group || !select) {
                        return;
                    }

                    var current = group.querySelector('.yamuna-plp-sort-current');

                    {# Mobile must not show the desktop value span over "Ordenar por". #}
                    if (isMobileSort()) {
                        if (current && current.parentNode) {
                            current.parentNode.removeChild(current);
                        }
                        return;
                    }

                    if (!current) {
                        current = document.createElement('span');
                        current.className = 'yamuna-plp-sort-current';
                        current.setAttribute('aria-hidden', 'true');
                        group.insertBefore(current, select);
                    }

                    var text = select.options[select.selectedIndex]
                        ? select.options[select.selectedIndex].text
                        : '';
                    if (current.textContent !== text) {
                        current.textContent = text;
                    }
                }

                function applySortValue(sort, value, labelText) {
                    var select = getSortSelect(sort);
                    var label = sort.querySelector('.yamuna-plp-sort-label');
                    var current = sort.querySelector('.yamuna-plp-sort-current');
                    var url = new URL(window.location.href);

                    if (current && labelText) {
                        current.textContent = labelText;
                    }
                    if (isMobileSort() && label && labelText) {
                        label.textContent = labelText;
                    }
                    if (select && value) {
                        select.value = value;
                    }

                    sort.classList.remove('is-open');
                    if (label) {
                        label.setAttribute('aria-expanded', 'false');
                    }

                    url.searchParams.set('sort_by', value);
                    url.searchParams.delete('page');
                    window.location.assign(url.pathname + (url.search ? url.search : '') + url.hash);
                }

                function updateSortLabel(sort) {
                    var label = sort.querySelector('.yamuna-plp-sort-label');
                    var select = getSortSelect(sort);

                    syncSortCurrent(sort);

                    if (isMobileSort() && label && select && window.location.search.indexOf('sort_by=') !== -1) {
                        var selectedText = select.options[select.selectedIndex].text;
                        if (label.textContent !== selectedText) {
                            label.textContent = selectedText;
                        }
                    }
                }

                function closeOtherSortMenus(target) {
                    document.querySelectorAll('.yamuna-plp-sort.is-open').forEach(function (sort) {
                        if (!sort.contains(target)) {
                            sort.classList.remove('is-open');
                            var label = sort.querySelector('.yamuna-plp-sort-label');
                            if (label) {
                                label.setAttribute('aria-expanded', 'false');
                            }
                        }
                    });
                }

                function toggleSortMenu(sort) {
                    var label = sort.querySelector('.yamuna-plp-sort-label');
                    var isOpen = sort.classList.toggle('is-open');
                    if (label) {
                        label.setAttribute('aria-expanded', String(isOpen));
                    }
                }

                document.addEventListener('change', function (event) {
                    var sort = event.target.closest && event.target.closest('.yamuna-plp-sort');
                    if (sort && event.target.matches('select')) {
                        syncSortCurrent(sort);
                    }
                }, true);

                document.addEventListener('click', function (event) {
                    var option = event.target.closest('.yamuna-plp-sort-option');

                    if (option) {
                        var optionSort = option.closest('.yamuna-plp-sort');
                        event.preventDefault();
                        event.stopPropagation();
                        applySortValue(
                            optionSort,
                            option.getAttribute('data-sort-value'),
                            option.textContent.trim()
                        );
                        return;
                    }

                    {# Desktop: any click inside form-group (text, padding, gap, arrow) opens menu. #}
                    var groupHit = event.target.closest('.yamuna-plp-sort .form-group');
                    if (groupHit && !isMobileSort()) {
                        var groupSort = groupHit.closest('.yamuna-plp-sort');
                        event.preventDefault();
                        event.stopPropagation();
                        toggleSortMenu(groupSort);
                        return;
                    }

                    {# Mobile: whole sort control is the hit target. #}
                    var sortHit = event.target.closest('.yamuna-plp-sort');
                    if (
                        sortHit &&
                        isMobileSort() &&
                        !event.target.closest('.yamuna-plp-sort-options')
                    ) {
                        event.preventDefault();
                        event.stopPropagation();
                        toggleSortMenu(sortHit);
                        return;
                    }

                    closeOtherSortMenus(event.target);
                }, true);

                document.addEventListener('keydown', function (event) {
                    var group = event.target.closest('.yamuna-plp-sort .form-group');
                    var label = event.target.closest('.yamuna-plp-sort-label');
                    if ((group || label) && (event.key === 'Enter' || event.key === ' ')) {
                        var sort = (group || label).closest('.yamuna-plp-sort');
                        event.preventDefault();
                        toggleSortMenu(sort);
                    }
                });

                function syncSortLabels() {
                    document.querySelectorAll('.yamuna-plp-sort').forEach(updateSortLabel);
                }

                if (document.readyState === 'loading') {
                    document.addEventListener('DOMContentLoaded', syncSortLabels);
                } else {
                    syncSortLabels();
                }

                window.addEventListener('resize', syncSortLabels);
                new MutationObserver(syncSortLabels).observe(document.documentElement, { childList: true, subtree: true });
            })();
        </script>

        {# Google reCAPTCHA on register page #}

        {% if template == 'account.register' %}
            {% if not store.hasContactFormsRecaptcha() %}
                {{ '//www.google.com/recaptcha/api.js' | script_tag(true) }}
            {% endif %}
            <script type="text/javascript">
                var recaptchaCallback = function() {
                    jQueryNuvem('.js-recaptcha-button').prop('disabled', false);
                };
            </script>
        {% endif %}

        {# Google survey JS for Tiendanube Survey #}

        {{ component('google-survey') }}

        {# Store external codes added from admin #}

        {{ component('assorted-js', {}) }}

    </body>
</html>
