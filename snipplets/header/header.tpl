{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Header #}

{% set show_transparent_head = template == 'home' and settings.head_transparent and settings.slider and not settings.slider is empty %}

{% set logo_desktop_class = settings.logo_position_desktop == 'center' ? 'logo-desktop-center' %}

<header class="js-head-main head-main head-{{ settings.head_background }} {% if settings.head_fix %}head-fix{% endif %} transition-soft {{ logo_desktop_class }}" data-store="head">

    {# Desktop navigation — Figma node 845:5824. The native controls below
       remain available for tablet and mobile. #}
    <div class="yamuna-header-desktop d-none">
        <div class="yamuna-header-desktop-logo">
            <a class="yamuna-header-logo-link" href="{{ store.url }}" aria-label="{{ store.name }}">
                <img class="yamuna-header-logo-image yamuna-header-logo-default" src="{{ 'images/yamuna/logo-yamuna-reference.png' | static_url }}" alt="{{ store.name }}" />
                <img class="yamuna-header-logo-image yamuna-header-logo-scrolled" src="{{ 'images/yamuna/logo-yamuna-branco-reference.png' | static_url }}" alt="" aria-hidden="true" />
            </a>
        </div>

        <nav class="yamuna-header-desktop-nav" aria-label="{{ 'Navegação principal' | translate }}">
            <div class="nav-main-item nav-dropdown yamuna-products-menu">
                <div class="nav-item-container">
                    <a class="nav-list-link" href="{{ store.url }}/produtos/">Produtos</a>
                </div>
                <div class="nav-dropdown-content desktop-dropdown yamuna-products-dropdown">
                    <ul class="desktop-list-subitems list-subitems nav-list-accordion">
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/degustacao' | setting_url }}">Degustação</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/kits-presentes' | setting_url }}">Kits e presentes</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/manteiga-ghee' | setting_url }}">Manteiga ghee</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/cremes-de-castanhas' | setting_url }}">Creme de castanhas</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/alimentos-de-coco' | setting_url }}">Alimentos de coco</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/shampoos-e-condicionadores-naturais' | setting_url }}">Shampoo e condicionador em barra</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/sabonetes-naturais' | setting_url }}">Sabonetes</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/cafes-especiais' | setting_url }}">Cafés</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/chocolates-e-cacau' | setting_url }}">Chocolates e cacau</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/temperos-e-massalas' | setting_url }}">Temperos e massalas</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/oleos-corporais' | setting_url }}">Óleos corporais</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/adocantes-naturais' | setting_url }}">Adoçantes naturais</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/leites-vegetais' | setting_url }}">Leites vegetais</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/nutraceuticos-capsulas' | setting_url }}">Nutracêuticos/cápsulas</a></li>
                        <li class="nav-item"><a class="nav-list-link" href="{{ '/casa-sustentavel' | setting_url }}">Casa sustentável</a></li>
                    </ul>
                </div>
            </div>
            <a class="nav-list-link" href="{{ store.url }}/quem-somos/">Quem somos</a>
            <a class="nav-list-link" href="{{ store.url }}/revenda/">Revenda</a>
            <a class="nav-list-link" href="{{ store.blog_url | default('/aprenda') }}">Aprenda</a>
        </nav>

        <div class="yamuna-header-desktop-search">
            {% snipplet "header/header-search.tpl" %}
        </div>

        <div class="yamuna-header-desktop-utilities">
            <div class="yamuna-account-dropdown {% if customer %}is-logged{% endif %}">
                <a class="yamuna-header-action yamuna-account-dropdown-trigger" href="{{ customer ? store.customer_home_url : store.customer_login_url }}" aria-label="{{ 'Minha conta' | translate }}" aria-haspopup="true" aria-expanded="false">
                    <img src="{{ 'images/yamuna/header-user.svg' | static_url }}" alt="" aria-hidden="true" />
                </a>
                <div class="yamuna-account-dropdown-panel" role="menu">
                    {% if customer %}
                        <p class="yamuna-account-dropdown-welcome">
                            Bem-vindo(a), <strong>{{ customer.name|split(' ')|slice(0, 1)|join }}</strong>
                        </p>
                        <div class="yamuna-account-dropdown-links">
                            <a class="yamuna-account-dropdown-link" href="{{ store.customer_home_url }}">
                                <span class="yamuna-account-dropdown-link-label">Minha conta</span>
                            </a>
                            <a class="yamuna-account-dropdown-link" href="{{ store.customer_home_url }}">
                                <span class="yamuna-account-dropdown-link-label">Meus pedidos</span>
                            </a>
                            <a class="yamuna-account-dropdown-link yamuna-account-dropdown-wishlist" href="{{ store.url }}/favoritos/">
                                <span class="yamuna-account-dropdown-link-label yamuna-account-dropdown-wishlist-label">
                                    <svg class="yamuna-account-dropdown-wishlist-icon" width="16" height="16" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                        <path fill="#000000" d="M14.5833 1.5975C13.645 1.6121 12.727 1.87404 11.9223 2.35689C11.1176 2.83974 10.4545 3.52639 10 4.3475C9.54553 3.52639 8.88244 2.83974 8.0777 2.35689C7.27295 1.87404 6.35504 1.6121 5.41667 1.5975C3.92078 1.66249 2.51142 2.31688 1.49649 3.41769C0.481549 4.51851 -0.0564591 5.97627 0 7.4725C0 11.2617 3.98833 15.4 7.33333 18.2058C8.08018 18.8334 9.02446 19.1775 10 19.1775C10.9755 19.1775 11.9198 18.8334 12.6667 18.2058C16.0117 15.4 20 11.2617 20 7.4725C20.0565 5.97627 19.5185 4.51851 18.5035 3.41769C17.4886 2.31688 16.0792 1.66249 14.5833 1.5975ZM11.5958 16.9308C11.1492 17.307 10.584 17.5133 10 17.5133C9.41604 17.5133 8.85085 17.307 8.40417 16.9308C4.1225 13.3383 1.66667 9.89167 1.66667 7.4725C1.6097 6.4181 1.97197 5.38394 2.67447 4.59558C3.37697 3.80722 4.36269 3.32863 5.41667 3.26417C6.47064 3.32863 7.45637 3.80722 8.15886 4.59558C8.86136 5.38394 9.22363 6.4181 9.16667 7.4725C9.16667 7.69351 9.25446 7.90548 9.41074 8.06176C9.56702 8.21804 9.77899 8.30583 10 8.30583C10.221 8.30583 10.433 8.21804 10.5893 8.06176C10.7455 7.90548 10.8333 7.69351 10.8333 7.4725C10.7764 6.4181 11.1386 5.38394 11.8411 4.59558C12.5436 3.80722 13.5294 3.32863 14.5833 3.26417C15.6373 3.32863 16.623 3.80722 17.3255 4.59558C18.028 5.38394 18.3903 6.4181 18.3333 7.4725C18.3333 9.89167 15.8775 13.3383 11.5958 16.9275V16.9308Z"/>
                                    </svg>
                                    <span class="yamuna-account-dropdown-wishlist-text">Lista de desejos</span>
                                </span>
                            </a>
                        </div>
                        <a class="yamuna-account-dropdown-logout" href="{{ store.customer_logout_url }}">Sair</a>
                    {% else %}
                        <div class="yamuna-account-dropdown-tabs">
                            {% if 'mandatory' not in store.customer_accounts %}
                                <a class="yamuna-account-dropdown-tab" href="{{ store.customer_register_url }}">Criar conta</a>
                            {% endif %}
                            <a class="yamuna-account-dropdown-tab is-active" href="{{ store.customer_login_url }}">Entrar</a>
                        </div>

                        {% embed "snipplets/forms/form.tpl" with{form_id: 'yamuna-quick-login-form', form_action: store.customer_login_url, form_custom_class: 'yamuna-account-dropdown-form', submit_custom_class: 'yamuna-account-dropdown-submit', submit_text: 'Entrar' | translate, data_store: 'account-login' } %}
                            {% block form_body %}
                                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: current_url, input_name: 'redirect_to'} %}{% endembed %}
                                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'yamuna-quick-login-email', input_custom_class: 'yamuna-account-dropdown-input', input_label_text: 'E-mail' | translate, input_required: true } %}{% endembed %}
                                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', type_password: true, input_name: 'password', input_id: 'yamuna-quick-login-password', input_custom_class: 'yamuna-account-dropdown-input', input_label_text: 'Senha' | translate, input_required: true } %}{% endembed %}
                            {% endblock %}
                        {% endembed %}

                        <a class="yamuna-account-dropdown-forgot" href="{{ store.customer_reset_password_url }}">Esqueceu sua senha?</a>
                    {% endif %}
                </div>
            </div>
            <a class="yamuna-header-action yamuna-header-favorites" href="{{ store.url }}/favoritos/" aria-label="{{ 'Favoritos' | translate }}" title="{{ 'Favoritos' | translate }}">
                <img src="{{ 'images/yamuna/header-heart.svg' | static_url }}" alt="" aria-hidden="true" />
            </a>
            <a {% if settings.ajax_cart and template != 'cart' %}href="#" class="yamuna-header-action js-modal-open js-toggle-cart" data-toggle="#modal-cart"{% else %}href="{{ store.cart_url }}" class="yamuna-header-action"{% endif %} aria-label="{{ 'Sacola' | translate }}">
                <img src="{{ 'images/yamuna/header-bag.svg' | static_url }}" alt="" aria-hidden="true" />
                <span class="yamuna-header-cart-count js-cart-widget-amount badge-amount" style="position:absolute!important;top:-6px!important;right:-4px!important;bottom:auto!important;left:auto!important;z-index:10!important;display:flex!important;align-items:center!important;justify-content:center!important;min-width:21px!important;width:21px!important;height:20px!important;min-height:20px!important;padding:0!important;border:0!important;border-radius:9999px!important;background:#fff!important;background-color:#fff!important;color:#1B1A21!important;font-family:Raleway,sans-serif!important;font-size:10px!important;font-weight:700!important;line-height:1!important;box-sizing:border-box!important;pointer-events:none!important;box-shadow:none!important;">{{ "{1}" | translate(cart.items_count ) }}</span>
            </a>
        </div>
    </div>

    {# Mobile header — Figma node 156:3337 #}
    <div class="yamuna-header-mobile d-md-none">
        <div class="yamuna-header-mobile-logo">
            <a class="yamuna-header-logo-link" href="{{ store.url }}" aria-label="{{ store.name }}">
                <img class="yamuna-header-logo-image" src="{{ 'images/yamuna/logo-yamuna-reference.png' | static_url }}" alt="{{ store.name }}" />
            </a>
        </div>

        <div class="yamuna-header-mobile-actions">
            <a class="yamuna-header-mobile-action js-yamuna-mobile-search-toggle" href="#" aria-controls="yamuna-mobile-search" aria-expanded="false" aria-label="{{ 'Buscar' | translate }}">
                <img class="yamuna-header-mobile-glyph" src="{{ 'images/yamuna/header-search-mobile.svg' | static_url }}" alt="" aria-hidden="true" />
            </a>
            <a {% if settings.ajax_cart and template != 'cart' %}href="#" class="yamuna-header-mobile-action js-modal-open js-toggle-cart" data-toggle="#modal-cart"{% else %}href="{{ store.cart_url }}" class="yamuna-header-mobile-action"{% endif %} aria-label="{{ 'Sacola' | translate }}">
                <img class="yamuna-header-mobile-glyph" src="{{ 'images/yamuna/header-cart-mobile.svg' | static_url }}" alt="" aria-hidden="true" />
                <span class="yamuna-header-mobile-cart-count js-cart-widget-amount badge-amount" style="position:absolute!important;top:auto!important;bottom:0!important;right:-0.25rem!important;z-index:10!important;display:flex!important;align-items:center!important;justify-content:center!important;min-width:0!important;width:auto!important;height:auto!important;padding:0.2rem 0.5rem!important;border:1px solid #a31462!important;border-radius:9999px!important;background:#fff!important;background-color:#fff!important;color:#1B1A21!important;font-family:Raleway,sans-serif!important;font-size:10px!important;font-weight:700!important;line-height:1!important;box-sizing:border-box!important;pointer-events:none!important;box-shadow:none!important;">{{ "{1}" | translate(cart.items_count ) }}</span>
            </a>
            <a class="yamuna-header-mobile-action js-modal-open" href="#" data-toggle="#nav-hamburger" aria-label="{{ 'Menu' | translate }}">
                <img class="yamuna-header-mobile-glyph" src="{{ 'images/yamuna/header-menu-mobile.svg' | static_url }}" alt="" aria-hidden="true" />
            </a>
        </div>
    </div>

    <div id="yamuna-mobile-search" class="yamuna-mobile-search" aria-hidden="true">
        <form class="yamuna-mobile-search-form js-search-container js-search-form" action="{{ store.search_url }}" method="get">
            <div class="form-group m-0">
                <input class="yamuna-mobile-search-input js-search-input form-control" autocomplete="off" type="search" name="q" placeholder="BUSCAR POR..." aria-label="{{ 'Buscar' | translate }}" />
                <button type="button" class="yamuna-search-clear js-yamuna-search-clear" aria-label="Fechar busca">
                    <svg class="icon-inline icon-w-10" aria-hidden="true"><use xlink:href="#times"/></svg>
                </button>
                <button type="submit" class="yamuna-mobile-search-submit" aria-label="{{ 'Buscar' | translate }}">
                    <img src="{{ 'images/yamuna/menu-search.svg' | static_url }}" alt="" aria-hidden="true" />
                </button>
            </div>
        </form>
        <div class="yamuna-mobile-search-suggest js-search-suggest"></div>
    </div>

    <script>
        document.addEventListener('click', function(event) {
            var panel = document.getElementById('yamuna-mobile-search');
            var searchToggle = document.querySelector('.js-yamuna-mobile-search-toggle');
            var menuTrigger = event.target.closest('[data-toggle="#nav-hamburger"]');

            function closeMobileSearch() {
                if (!panel) return;
                panel.classList.remove('is-open');
                panel.setAttribute('aria-hidden', 'true');
                if (searchToggle) searchToggle.setAttribute('aria-expanded', 'false');
                var input = panel.querySelector('.yamuna-mobile-search-input');
                var suggest = panel.querySelector('.js-search-suggest');
                if (input) {
                    input.value = '';
                    input.blur();
                }
                if (suggest) {
                    suggest.innerHTML = '';
                    suggest.style.display = 'none';
                }
            }

            if (menuTrigger) closeMobileSearch();

            var clearBtn = event.target.closest('.js-yamuna-search-clear');
            if (clearBtn) {
                event.preventDefault();
                event.stopPropagation();
                var desktopWrap = clearBtn.closest('.yamuna-header-desktop-search');
                if (desktopWrap) {
                    var deskInput = desktopWrap.querySelector('.js-search-input');
                    var deskSuggest = desktopWrap.querySelector('.js-search-suggest');
                    if (deskInput) {
                        deskInput.value = '';
                        deskInput.blur();
                    }
                    if (deskSuggest) {
                        deskSuggest.classList.remove('yamuna-search-open');
                        deskSuggest.style.display = 'none';
                    }
                    var head = document.querySelector('.head-main');
                    if (head) head.classList.remove('yamuna-dropdown-open');
                    return;
                }
                closeMobileSearch();
                return;
            }

            var trigger = event.target.closest('.js-yamuna-mobile-search-toggle');
            if (!trigger || !window.matchMedia('(max-width: 1023px)').matches) return;

            event.preventDefault();
            if (!panel) return;

            var isOpen = panel.classList.toggle('is-open');
            panel.setAttribute('aria-hidden', String(!isOpen));
            trigger.setAttribute('aria-expanded', String(isOpen));
            if (isOpen) {
                var input = panel.querySelector('.yamuna-mobile-search-input');
                window.setTimeout(function() { input && input.focus(); }, 0);
            } else {
                closeMobileSearch();
            }
        });
    </script>

    <style>
        @media (min-width: 1024px) {
            html {
                --yamuna-panel-top: 0px;
                --yamuna-panel-overlap: 80px;
            }
            {# Theme .head-main { transform: scale(1) } traps position:fixed panels inside the
               header. Kill it on desktop so drawers/menus anchor to the viewport. #}
            .head-main,
            .js-head-main,
            .head-main.head-fixed,
            .head-main.transition-soft {
                -webkit-transform: none !important;
                -ms-transform: none !important;
                transform: none !important;
            }
        }
    </style>
    <script>
        (function() {
            var clearanceLocked = false;
            var transitionTimers = [];

            function parseBoxValue(value, basis) {
                if (value == null || value === '' || value === 'auto') return NaN;
                var n = parseFloat(value);
                if (isNaN(n)) return NaN;
                if (String(value).indexOf('%') !== -1) return (n / 100) * basis;
                return n;
            }

            function syncDesktopPanels(options) {
                options = options || {};
                if (!window.matchMedia('(min-width: 1024px)').matches) {
                    document.documentElement.style.setProperty('--yamuna-header-clearance', '80px');
                    clearanceLocked = false;
                    return;
                }

                var header = document.querySelector('.yamuna-header-desktop');
                if (!header) return;

                var headerRect = header.getBoundingClientRect();
                var headerBefore = window.getComputedStyle(header, '::before');
                var beforeLeft = parseBoxValue(headerBefore.left, headerRect.width);
                var beforeRight = parseBoxValue(headerBefore.right, headerRect.width);
                var beforeTop = parseBoxValue(headerBefore.top, headerRect.height);
                var beforeHeight = parseBoxValue(headerBefore.height, headerRect.height);

                if (isNaN(beforeLeft)) beforeLeft = 0;
                if (isNaN(beforeRight)) beforeRight = 0;
                if (isNaN(beforeTop)) beforeTop = 0;
                // ::before height can read as 0/auto during transitions — fall back to capsule box.
                if (isNaN(beforeHeight) || beforeHeight < 1) beforeHeight = headerRect.height;

                var capsuleLeft = headerRect.left + beforeLeft;
                var capsuleWidth = Math.max(0, headerRect.width - beforeLeft - beforeRight);
                var capsuleBottom = headerRect.top + beforeTop + beforeHeight;
                // Prefer the real painted bottom of the magenta bar when measurable.
                if (headerBefore.height && headerBefore.height !== 'auto' && beforeHeight >= 1) {
                    capsuleBottom = Math.max(capsuleBottom, headerRect.top + beforeTop + beforeHeight);
                }
                capsuleBottom = Math.max(capsuleBottom, headerRect.bottom);

                document.documentElement.style.setProperty('--yamuna-desktop-panel-left', capsuleLeft + 'px');
                document.documentElement.style.setProperty('--yamuna-desktop-panel-width', capsuleWidth + 'px');
                document.documentElement.style.setProperty('--yamuna-desktop-panel-top', capsuleBottom + 'px');
                document.documentElement.style.setProperty('--yamuna-menu-left', capsuleLeft + 'px');
                document.documentElement.style.setProperty('--yamuna-menu-width', capsuleWidth + 'px');
                document.documentElement.style.setProperty('--yamuna-menu-top', capsuleBottom + 'px');
                // Panels start at viewport top; overlap pads content under the capsule (no buraco).
                document.documentElement.style.setProperty('--yamuna-panel-top', '0px');
                document.documentElement.style.setProperty('--yamuna-panel-overlap', Math.max(0, capsuleBottom) + 'px');
                document.documentElement.style.setProperty('--yamuna-header-top', headerRect.top + 'px');
                document.documentElement.style.setProperty('--yamuna-header-right', Math.max(0, window.innerWidth - headerRect.right) + 'px');
                document.documentElement.style.setProperty('--yamuna-header-height', Math.max(0, headerRect.height) + 'px');

                if (!clearanceLocked || options.forceClearance) {
                    var clearance = Math.max(110, Math.round(capsuleBottom));
                    clearance = Math.min(clearance, 160);
                    document.documentElement.style.setProperty('--yamuna-header-clearance', clearance + 'px');
                    if (!options.skipLock) clearanceLocked = true;
                }
            }

            function syncDesktopPanelsDuringTransition() {
                transitionTimers.forEach(function(id) { window.clearTimeout(id); });
                transitionTimers = [];
                syncDesktopPanels({ forceClearance: true, skipLock: true });
                clearanceLocked = false;
                [16, 50, 100, 200, 350, 550, 750].forEach(function(ms) {
                    transitionTimers.push(window.setTimeout(function() {
                        syncDesktopPanels({ forceClearance: true });
                    }, ms));
                });
            }

            var lastScrolled = null;
            function onScrollOrClassChange() {
                var scrolled = document.documentElement.classList.contains('yamuna-header-scrolled')
                    || !!(document.querySelector('.head-main.compress'));
                syncDesktopPanels();
                if (lastScrolled === null) {
                    lastScrolled = scrolled;
                    return;
                }
                if (scrolled !== lastScrolled) {
                    lastScrolled = scrolled;
                    // Expand/compress animates padding/width — keep panels glued during the tween.
                    syncDesktopPanelsDuringTransition();
                }
            }

            syncDesktopPanelsDuringTransition();
            window.addEventListener('load', syncDesktopPanelsDuringTransition);
            window.addEventListener('resize', syncDesktopPanelsDuringTransition);
            window.addEventListener('scroll', onScrollOrClassChange, { passive: true });

            // Theme toggles .compress / yamuna-header-scrolled without always firing scroll last.
            if (window.MutationObserver) {
                var headMain = document.querySelector('.js-head-main, .head-main');
                var observeTarget = headMain || document.documentElement;
                new MutationObserver(function() { onScrollOrClassChange(); }).observe(observeTarget, {
                    attributes: true,
                    attributeFilter: ['class']
                });
                if (headMain) {
                    new MutationObserver(function() { onScrollOrClassChange(); }).observe(document.documentElement, {
                        attributes: true,
                        attributeFilter: ['class']
                    });
                }
            }
        })();
    </script>

    {# Topbar = Social + Advertising + Language #}

    {% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
    {% set has_languages = languages | length > 1 %}
    {% set has_ad_bar = settings.ad_bar and settings.ad_text %}
    {% set show_topbar =  has_ad_bar or has_social_network or has_languages %}
    {% if show_topbar %}
        <section class="js-topbar section-topbar {% if not has_ad_bar %}d-none d-md-block{% endif %}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col text-left d-none d-md-block">
                        {% include "snipplets/social/social-links.tpl" %}
                    </div>
                    {% if has_ad_bar %}
                        {% snipplet "header/header-advertising.tpl" %}
                    {% endif %}
                    <div class="col text-right d-none d-md-block">
                        {% include "snipplets/navigation/navigation-lang.tpl" %}
                    </div>
                </div>
            </div>
        </section>
    {% endif %}
	<div class="container-fluid {% if settings.head_utility == 'searchbox' %}pb-3 pb-md-0{% endif %}">
		<div class="{% if not settings.head_fix %}js-nav-logo-bar{% endif %} row no-gutters align-items-center">

            {# Menu icon for all mobile combinations except when categories are exposed and logo is centered #}
            {% if settings.head_utility == 'searchbox' or settings.head_utility == 'icons' or (settings.logo_position_mobile == 'left' and settings.head_utility == 'categories') %}
                <div class="col-auto {% if settings.logo_position_mobile == 'left' %}order-last ml-2{% else %}text-left{% endif %} d-block d-md-none">
                    <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
                        <svg class="icon-inline icon-2x icon-w-14"><use xlink:href="#bars"/></svg>
                    </a>
                    {% if store.country == 'AR'%}
                        {# Notification icon for quick login on AR stores #}
                        <div class="js-quick-login-badge badge badge-overlap swing" style="display: none;"></div>
                    {% endif %}
                </div>
            {% endif %}

            {# Search icon ued for mobile when categories are exposed #}
            {% if settings.head_utility == 'categories' or (settings.head_utility == 'categories' and settings.logo_position_mobile == 'left') or settings.head_utility == 'icons' %}
                <div class="col-auto {% if settings.logo_position_mobile == 'left' or (settings.logo_position_mobile == 'center' and settings.head_utility == 'icons') %}order-2 {% if not (settings.logo_position_mobile == 'center' and settings.head_utility == 'icons') %}ml-2{% endif %}{% else %}text-left{% endif %} d-block d-md-none">
                    <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
                        <svg class="icon-inline icon-2x"><use xlink:href="#search"/></svg>
                    </a>
                </div>
            {% endif %}

            {# Logo for mobile and desktop #}

			<div class="{% if settings.logo_position_desktop == 'center' %}{% if settings.icons_size_desktop == 'big' %}col-md-6 col-lg-6{% else %}col-md-4 col-lg-4{% endif %}{% else %}col-md-3 col-lg-3{% endif %} {% if settings.logo_position_mobile == 'left' %}col text-left{% else %}col text-center{% endif %} {% if settings.logo_position_desktop == 'center' %}text-md-center {% if settings.icons_size_desktop == 'small' %}offset-md-1{% endif %} order-md-2{% else %}text-md-left{% endif %}">
                {% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
                {% set logo_container_size_class = settings.logo_size == 'small' ? 'logo-img-container-small' : settings.logo_size == 'big' ? 'logo-img-container-big' %}
                {% set logo_size_thumbnail = settings.logo_size == 'big' ? 'huge' : 'large' %}
                {{ component('logos/logo', {
                    logo_size: logo_size_thumbnail, 
                    container_classes: { logo_img_container: logo_container_size_class },
                    logo_img_classes: 'transition-soft ' ~ logo_size_class, 
                    logo_text_classes: 'h5 h3-md mb-0'
                }) }}
            </div>

            {# Desktop Search, used on mobile when setting is set to show "big search" #}

            <div class="{% if settings.head_utility == 'searchbox' %}col-12 order-last order-md-0{% else %}col-6 d-none d-md-block{% endif %} text-center {% if settings.logo_position_desktop == 'center' %}col-md-3 col-lg-3 order-md-1{% elseif settings.icons_size_desktop == 'small' and settings.logo_position_desktop == 'left' %}col-md-6 col-lg-5{% else %}col-md-6 col-lg-6{% endif %}">
                {% snipplet "header/header-search.tpl" %}
            </div>

            {# Utility icons: Help, Account and Cart (also used on mobile) #}

			<div class="col-auto {% if settings.logo_position_mobile == 'left' %}order-3{% elseif settings.logo_position_mobile == 'center' and settings.head_utility == 'icons' %}order-last{% endif %} {% if settings.icons_size_desktop == 'small' %}col-md-4 col-lg-4{% else %}col-md-3 col-lg-3{% endif %} text-right {% if settings.logo_position_desktop == 'center' %}order-md-3{% endif %}">
                {% snipplet "header/header-utilities.tpl" %}
                {% if settings.head_fix and settings.ajax_cart %}
                    <div class="d-none d-md-block">
                        {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
                    </div>
                {% endif %}
            </div>
            {% if settings.logo_position_mobile == 'left' and not settings.head_utility == 'searchbox' %}
                <div class="col-auto d-md-none order-last">
                    <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
                        <svg class="icon-inline icon-2x icon-w-14"><use xlink:href="#bars"/></svg>
                    </a>
                </div>
            {% endif %}
		</div>
        {% if settings.head_fix and settings.ajax_cart %}
            <div class="d-md-none">
                {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_mobile: true} %}
            </div>
        {% endif %}

        {# Mobile row for exposed categories #}
        <div class="row align-items-center nav-row {% if settings.head_utility == 'searchbox' %}d-none d-md-block{% endif %}">
            {% if settings.head_utility == 'categories' %}

                {# Menu icon inline with categories when when categories are exposed and logo is centered #}
                {% if settings.logo_position_mobile == 'center' %}
                    <div class="col-2 d-block d-md-none p-0 text-center">
                        <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
                            <svg class="icon-inline icon-2x icon-w-14"><use xlink:href="#bars"/></svg>
                        </a>
                        {% if store.country == 'AR'%}
                            {# Notification icon for quick login on AR stores#}
                            <div class="js-quick-login-badge badge badge-overlap swing" style="display: none;"></div>
                        {% endif %}
                    </div>
                {% endif %}
                <div class="col-{% if settings.logo_position_mobile == 'left' %}12{% else %}10{% endif %} nav-categories-container d-block d-md-none p-0">
                    <div class="js-nav-categories nav-categories-container-inner" data-categories-amount="{% if settings.logo_position_mobile == 'left' %}4{% else %}3{% endif %}">
                        {% for item in navigation %}
                            {% set is_active = item.current or item.is_parent_active %}
                            <div class="nav-categories-item d-inline-block {% if loop.first and settings.logo_position_mobile == 'left' %}pl-3{% endif %}">
                                <a class="nav-categories-link {% if is_active %}active{% endif %} pb-1" href="{{ item.url }}" {% if item.is_external %}target="_blank"{% endif %}>
                                    {{ item.name }}
                                </a>
                            </div>
                        {% endfor %}
                    </div>
                </div>
            {% endif %}
        </div>
	</div>

    {% if not settings.head_utility == 'categories' or (settings.head_utility == 'categories' and settings.logo_position_desktop == 'center') %}
        <div class="js-desktop-nav-categories desktop-nav-categories-container d-none d-md-block {% if settings.logo_position_desktop == 'center' %}border-top border-bottom{% endif %}">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col">
                        {% include "snipplets/navigation/navigation.tpl" %}
                    </div>
                </div>
            </div>
        </div>
    {% endif %}

</header>

<script>
  (function() {
    function onScroll() {
      var top = window.pageYOffset || document.documentElement.scrollTop || 0;
      if (top > 40) {
        document.documentElement.classList.add('yamuna-header-scrolled');
      } else {
        document.documentElement.classList.remove('yamuna-header-scrolled');
      }
    }
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    {# 113 — open Produtos mega-menu only while the trigger is hovered/focused. #}
    (function() {
      var menus = document.querySelectorAll('.yamuna-products-menu');
      if (!menus.length) return;

      function panel(menu) {
        return menu.querySelector('.yamuna-products-dropdown, .desktop-dropdown');
      }

      function openMenu(menu) {
        menu.classList.add('is-open');
        var dd = panel(menu);
        if (!dd) return;
        dd.style.setProperty('visibility', 'visible', 'important');
        dd.style.setProperty('opacity', '1', 'important');
        dd.style.setProperty('pointer-events', 'auto', 'important');
        dd.style.setProperty('transition', 'none', 'important');
      }

      function closeMenu(menu) {
        menu.classList.remove('is-open');
        var dd = panel(menu);
        if (!dd) return;
        dd.style.setProperty('visibility', 'hidden', 'important');
        dd.style.setProperty('opacity', '0', 'important');
        dd.style.setProperty('pointer-events', 'none', 'important');
        dd.style.setProperty('transition', 'none', 'important');
      }

      menus.forEach(function(menu) {
        closeMenu(menu);
        menu.addEventListener('mouseenter', function() { openMenu(menu); });
        menu.addEventListener('mouseleave', function() { closeMenu(menu); });
        menu.addEventListener('focusin', function() { openMenu(menu); });
        menu.addEventListener('focusout', function(e) {
          if (!menu.contains(e.relatedTarget)) closeMenu(menu);
        });
      });
    })();

    {# Keep the page frozen while the hamburger drawer is open (iOS-safe). #}
    (function() {
      var lockedScrollY = 0;
      var menu = document.getElementById('nav-hamburger');
      if (!menu || !window.MutationObserver) return;

      function lockScroll() {
        lockedScrollY = window.pageYOffset || document.documentElement.scrollTop || 0;
        document.documentElement.classList.add('yamuna-menu-scroll-lock');
        document.body.classList.add('overflow-none');
        document.body.style.position = 'fixed';
        document.body.style.top = '-' + lockedScrollY + 'px';
        document.body.style.left = '0';
        document.body.style.right = '0';
        document.body.style.width = '100%';
      }

      function unlockScroll() {
        document.documentElement.classList.remove('yamuna-menu-scroll-lock');
        if (!document.querySelector('.js-modal.modal-show')) {
          document.body.classList.remove('overflow-none');
        }
        document.body.style.position = '';
        document.body.style.top = '';
        document.body.style.left = '';
        document.body.style.right = '';
        document.body.style.width = '';
        window.scrollTo(0, lockedScrollY);
      }

      new MutationObserver(function() {
        if (menu.classList.contains('modal-show')) {
          lockScroll();
        } else {
          unlockScroll();
        }
      }).observe(menu, { attributes: true, attributeFilter: ['class'] });
    })();

    // Auto-open desktop cart dropdown on add to cart
    window.yamunaAutoOpenCart = function() {
      var header = document.querySelector('.head-main .yamuna-header-desktop');
      if (header && !header.classList.contains('yamuna-cart-dropdown-open')) {
        header.classList.add('yamuna-cart-dropdown-open');
      }
      var cartModal = document.getElementById('modal-cart');
      if (cartModal) {
        cartModal.style.removeProperty('display');
        cartModal.classList.add('modal-show');
      }
      if (window.innerWidth >= 1024 && !document.querySelector('.js-modal.modal-show:not(#modal-cart)')) {
        var overlay = document.querySelector('.js-modal-overlay[data-modal-id="#modal-cart"]');
        if (overlay) overlay.style.display = 'none';
      }
    };

    window.yamunaCartToastTitleForQty = function(quantity) {
      var qty = parseInt(quantity, 10);
      if (!isFinite(qty) || qty < 1) {
        qty = 1;
      }
      return qty > 1
        ? (qty + ' produtos adicionados ao carrinho')
        : 'Produto adicionado ao carrinho';
    };

    window.yamunaPositionCartToast = function(toast) {
      if (!toast) return;
      var utilities = document.querySelector('.yamuna-header-desktop-utilities');
      if (window.innerWidth >= 1024 && utilities) {
        var rect = utilities.getBoundingClientRect();
        var vw = document.documentElement.clientWidth || window.innerWidth;
        toast.style.top = Math.round(rect.bottom + 8) + 'px';
        toast.style.right = Math.max(16, Math.round(vw - rect.right)) + 'px';
        toast.style.left = 'auto';
      } else {
        toast.style.top = '';
        toast.style.right = '';
        toast.style.left = '';
      }
    };

    window.yamunaShowCartToast = function(title, subtitle) {
      var qtyCandidate = parseInt(title, 10);
      if (
        title != null
        && title !== ''
        && isFinite(qtyCandidate)
        && String(qtyCandidate) === String(title).trim()
      ) {
        title = window.yamunaCartToastTitleForQty(qtyCandidate);
      }
      title = title || 'Produto adicionado ao carrinho';
      subtitle = subtitle || 'Seu carrinho foi atualizado';

      var toast = document.querySelector('.yamuna-cart-toast');
      if (!toast) {
        toast = document.createElement('div');
        toast.className = 'yamuna-cart-toast';
        toast.innerHTML = '<div class="yamuna-cart-toast-icon"><svg width="22" height="22" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="11" stroke="#238482" stroke-width="2"/><path d="M7 12.5l3.5 3.5L17 9" stroke="#238482" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg></div>' +
          '<div class="yamuna-cart-toast-text">' +
            '<div class="yamuna-cart-toast-title">' + title + '</div>' +
            '<div class="yamuna-cart-toast-subtitle">' + subtitle + '</div>' +
          '</div>' +
          '<button type="button" class="yamuna-cart-toast-close" aria-label="Fechar">&times;</button>';
        document.body.appendChild(toast);
        toast.querySelector('.yamuna-cart-toast-close').addEventListener('click', function() {
          toast.classList.remove('yamuna-cart-toast-show');
        });
      } else {
        toast.querySelector('.yamuna-cart-toast-title').textContent = title;
        toast.querySelector('.yamuna-cart-toast-subtitle').textContent = subtitle;
      }

      window.yamunaPositionCartToast(toast);
      toast.classList.remove('yamuna-cart-toast-show');
      void toast.offsetWidth;
      toast.classList.add('yamuna-cart-toast-show');

      if (window._yamunaToastTimeout) {
        clearTimeout(window._yamunaToastTimeout);
      }
      window._yamunaToastTimeout = setTimeout(function() {
        toast.classList.remove('yamuna-cart-toast-show');
      }, 4000);
    };

    window.addEventListener('resize', function() {
      var toast = document.querySelector('.yamuna-cart-toast.yamuna-cart-toast-show');
      if (toast) window.yamunaPositionCartToast(toast);
    });

  })();
</script>

{{ component('nubesdk-slot', { type: "after_header" }) }}

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add notification for quick login cancellation #}

{% if template == 'home' or template == 'product' %}
    {% include "snipplets/notification.tpl" with {show_quick_login: true} %}
{% endif %}

{# Add to cart notification for non fixed header #}

{% if not settings.head_fix and settings.ajax_cart %}
    {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}

{# Quick login modal #}

{% embed "snipplets/modal.tpl" with{modal_id: 'quick-login', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header: false, modal_footer: false, modal_width: 'centered', modal_zindex_top: true, modal_close_class: 'float-right mr-0'} %}
    {% block modal_body %}
        <div class="text-center h5 mt-3">{{ "¡Qué bueno verte de nuevo!" | translate }}</div>
        <div class="text-center p-2">{{ "Iniciá sesión para comprar más rápido y ver todos tus pedidos." | translate }}</div>
        {% embed "snipplets/forms/form.tpl" with{form_id: 'quick-login-form', form_action: '/account/login/', submit_custom_class: 'btn-block', submit_text: 'Iniciar sesión' | translate, data_store: 'account-login' } %}
            {% block form_body %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: current_url, input_name: 'redirect_to'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: 'quick-login', input_name: 'from'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_value: result.email, input_name: 'email', input_custom_class: 'js-account-input', input_label_text: 'Email' | translate } %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', type_password: true, input_name: 'password', input_custom_class: 'js-account-input', input_help: true, input_help_link: store.customer_reset_password_url, input_link_class: 'btn-link-primary font-small float-right mb-4 mt-3n', input_label_text: 'Contraseña' | translate } %}{% endembed %}
            {% endblock %}
        {% endembed %}
    {% endblock %}
{% endembed %}

{# Hamburger panel — Yamuna mobile navigation. #}

{% embed "snipplets/modal.tpl" with {modal_id: 'nav-hamburger',modal_class: 'nav-hamburger head-'~ settings.head_background ~ ' modal-docked-small', modal_position: 'left', modal_transition: 'fade', modal_width: 'full' } %}
    {% block modal_body %}
        {% include "snipplets/navigation/yamuna-mobile-menu.tpl" %}
    {% endblock %}
{% endembed %}
{# Notifications #}

{# Modal Search #}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-search',modal_class: 'nav-search', modal_position: 'left', modal_transition: 'slide', modal_width: 'docked-md', modal_header: true } %}
    {% block modal_head %}
            {% block page_header_text %}{{ "Buscar" | translate }}{% endblock page_header_text %}
    {% endblock %}
    {% block modal_body %}
        {% snipplet "header/header-search.tpl" %}
    {% endblock %}
{% endembed %}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}

    {# Cart Ajax #}

    {# No modal_form_action: minicart must never POST go_to_checkout to /comprar/
       (that handoff returns an empty body). Qty updates already use LS AJAX. #}
    {% embed "snipplets/modal.tpl" with{
        modal_id: 'modal-cart', 
        modal_position: 'right', 
        modal_transition: 'slide', 
        modal_width: 'docked-md', 
        modal_form_class: 'js-ajax-cart-panel', 
        modal_header: true, 
        data_component:'cart',
        custom_data_attribute: 'cart-open-type',
		custom_data_attribute_value: settings.cart_open_type
    } %}
        {% block modal_head %}
            SACOLA DE COMPRAS
        {% endblock %}
        {% block modal_body %}
            {% snipplet "cart-panel.tpl" %}
        {% endblock %}
    {% endembed %}

{% endif %}

{% if settings.add_to_cart_recommendations %}

    {# Recommended products on add to cart #}

    {% embed "snipplets/modal.tpl" with{modal_id: 'related-products-notification', modal_class: 'bottom modal-overflow-none modal-bottom-sheet h-auto', modal_header: true, modal_header_class: 'modal-header-light px-0 pt-0 mb-2 m-0 w-100', modal_position: 'bottom', modal_transition: 'slide', modal_footer: false, modal_width: 'centered-md modal-centered-md-600px m-0 p-3', modal_close_class: 'float-right mr-0'} %}
        {% block modal_head %}
            {{ '¡Agregado al carrito!' | translate }}
        {% endblock %}
        {% block modal_body %}

            {# Product added info #}

            {% include "snipplets/notification-cart.tpl" with {related_products: true} %}

            <div class="divider my-3"></div>

            {# Product added recommendations #}

            <div class="js-related-products-notification-container" style="display: none"></div>

        {% endblock %}
    {% endembed %}
{% endif %}

{# Cross selling promotion notification on add to cart #}

{% embed "snipplets/modal.tpl" with {
    modal_id: 'js-cross-selling-modal',
    modal_class: 'bottom modal-bottom-sheet h-auto overflow-none modal-body-scrollable-auto',
    modal_header: true,
    modal_header_class: 'modal-header-light p-2 m-2 w-100',
    modal_position: 'bottom',
    modal_transition: 'slide',
    modal_footer: true,
    modal_width: 'centered-md m-0 p-0 modal-full-width modal-md-width-400px',
    modal_close_class: 'float-right mr-0 modal-close-top-right'
} %}
    {% block modal_head %}
        {{ '¡Descuento exclusivo!' | translate }}
    {% endblock %}

    {% block modal_body %}
        {# Promotion info and actions #}

        <div class="js-cross-selling-modal-body" style="display: none"></div>
    {% endblock %}
{% endembed %}
