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

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', initYamunaProductDescriptionUi);
            } else {
                initYamunaProductDescriptionUi();
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

                function updateSortLabel(sort) {
                    var label = sort.querySelector('.yamuna-plp-sort-label');
                    var select = sort.querySelector('.js-sort-by');

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

                document.addEventListener('click', function (event) {
                    var option = event.target.closest('.yamuna-plp-sort-option');

                    if (option && isMobileSort()) {
                        var optionSort = option.closest('.yamuna-plp-sort');
                        var optionLabel = optionSort.querySelector('.yamuna-plp-sort-label');
                        var url = new URL(window.location.href);

                        event.preventDefault();
                        event.stopPropagation();
                        optionLabel.textContent = option.textContent.trim();
                        optionSort.classList.remove('is-open');
                        optionLabel.setAttribute('aria-expanded', 'false');
                        url.searchParams.set('sort_by', option.getAttribute('data-sort-value'));
                        url.searchParams.delete('page');
                        window.location.assign(url.pathname + (url.search ? url.search : '') + url.hash);
                        return;
                    }

                    var label = event.target.closest('.yamuna-plp-sort-label');

                    if (label && isMobileSort()) {
                        var sort = label.closest('.yamuna-plp-sort');
                        event.preventDefault();
                        event.stopPropagation();
                        var isOpen = sort.classList.toggle('is-open');
                        label.setAttribute('aria-expanded', String(isOpen));
                        return;
                    }

                    closeOtherSortMenus(event.target);
                }, true);

                document.addEventListener('keydown', function (event) {
                    var label = event.target.closest('.yamuna-plp-sort-label');
                    if (label && isMobileSort() && (event.key === 'Enter' || event.key === ' ')) {
                        event.preventDefault();
                        label.click();
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
