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
            <a class="nav-list-link" href="{{ store.blog_url | default('/aprenda') }}">Blog</a>
        </nav>

        <div class="yamuna-header-desktop-search">
            {% snipplet "header/header-search.tpl" %}
        </div>

        <div class="yamuna-header-desktop-utilities">
            <a class="yamuna-header-action" href="{{ customer ? store.customer_home_url : store.customer_login_url }}" aria-label="{{ 'Minha conta' | translate }}">
                <img src="{{ 'images/yamuna/header-user.svg' | static_url }}" alt="" aria-hidden="true" />
            </a>
            <a class="yamuna-header-action" href="{{ store.url }}/favoritos/" aria-label="{{ 'Favoritos' | translate }}">
                <img src="{{ 'images/yamuna/header-heart.svg' | static_url }}" alt="" aria-hidden="true" />
            </a>
            <a {% if settings.ajax_cart and template != 'cart' %}href="#" class="yamuna-header-action js-modal-open js-toggle-cart" data-toggle="#modal-cart"{% else %}href="{{ store.cart_url }}" class="yamuna-header-action"{% endif %} aria-label="{{ 'Sacola' | translate }}">
                <img src="{{ 'images/yamuna/header-bag.svg' | static_url }}" alt="" aria-hidden="true" />
                <span class="yamuna-header-cart-count js-cart-widget-amount badge-amount">{{ "{1}" | translate(cart.items_count ) }}</span>
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
                <span class="yamuna-header-mobile-cart-count js-cart-widget-amount badge-amount">{{ "{1}" | translate(cart.items_count ) }}</span>
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
            }

            if (menuTrigger) closeMobileSearch();

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
            }
        });
    </script>

    <style>
        @media (min-width: 1024px) {
            html {
                --yamuna-panel-top: 0px;
                --yamuna-panel-overlap: 105px;
            }
        }
    </style>
    <script>
        (function() {
            function syncDesktopPanels() {
                if (!window.matchMedia('(min-width: 1024px)').matches) return;

                var header = document.querySelector('.yamuna-header-desktop');
                if (!header) return;

                var headerRect = header.getBoundingClientRect();
                var headerBefore = window.getComputedStyle(header, '::before');
                var beforeLeft = parseFloat(headerBefore.left);
                var beforeRight = parseFloat(headerBefore.right);
                var beforeTop = parseFloat(headerBefore.top);
                var beforeHeight = parseFloat(headerBefore.height);

                if (isNaN(beforeLeft)) beforeLeft = 0;
                if (isNaN(beforeRight)) beforeRight = 0;
                if (isNaN(beforeTop)) beforeTop = 0;
                if (isNaN(beforeHeight)) beforeHeight = headerRect.height;

                document.documentElement.style.setProperty('--yamuna-desktop-panel-left', (headerRect.left + beforeLeft) + 'px');
                document.documentElement.style.setProperty('--yamuna-desktop-panel-width', Math.max(0, headerRect.width - beforeLeft - beforeRight) + 'px');
                document.documentElement.style.setProperty('--yamuna-desktop-panel-top', (headerRect.top + beforeTop + beforeHeight) + 'px');
                document.documentElement.style.setProperty('--yamuna-menu-left', (headerRect.left + beforeLeft) + 'px');
                document.documentElement.style.setProperty('--yamuna-menu-width', Math.max(0, headerRect.width - beforeLeft - beforeRight) + 'px');
                document.documentElement.style.setProperty('--yamuna-menu-top', (headerRect.top + beforeTop + beforeHeight) + 'px');
                // Drawers start at the viewport top; overlap pads content under the capsule.
                document.documentElement.style.setProperty('--yamuna-panel-top', '0px');
                document.documentElement.style.setProperty('--yamuna-panel-overlap', Math.max(0, headerRect.top + beforeTop + beforeHeight) + 'px');
                document.documentElement.style.setProperty('--yamuna-header-top', headerRect.top + 'px');
                document.documentElement.style.setProperty('--yamuna-header-right', Math.max(0, window.innerWidth - headerRect.right) + 'px');
            }

            function syncDesktopPanelsDuringTransition() {
                syncDesktopPanels();
                window.setTimeout(syncDesktopPanels, 100);
                window.setTimeout(syncDesktopPanels, 300);
                window.setTimeout(syncDesktopPanels, 650);
            }

            syncDesktopPanelsDuringTransition();
            window.addEventListener('load', syncDesktopPanelsDuringTransition);
            window.addEventListener('resize', syncDesktopPanelsDuringTransition);
            window.addEventListener('scroll', syncDesktopPanelsDuringTransition, { passive: true });
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

    window.yamunaShowCartToast = function(title, subtitle) {
      var toast = document.querySelector('.yamuna-cart-toast');
      if (!toast) {
        toast = document.createElement('div');
        toast.className = 'yamuna-cart-toast';
        toast.innerHTML = '<div class="yamuna-cart-toast-icon"><svg width="22" height="22" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="11" stroke="#238482" stroke-width="2"/><path d="M7 12.5l3.5 3.5L17 9" stroke="#238482" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg></div>' +
          '<div class="yamuna-cart-toast-text">' +
            '<div class="yamuna-cart-toast-title">' + (title || 'Produto adicionado ao carrinho') + '</div>' +
            '<div class="yamuna-cart-toast-subtitle">' + (subtitle || 'Seu carrinho foi atualizado') + '</div>' +
          '</div>' +
          '<button type="button" class="yamuna-cart-toast-close" aria-label="Fechar">&times;</button>';
        document.body.appendChild(toast);
        toast.querySelector('.yamuna-cart-toast-close').addEventListener('click', function() {
          toast.classList.remove('yamuna-cart-toast-show');
        });
      } else {
        if (title) toast.querySelector('.yamuna-cart-toast-title').textContent = title;
        if (subtitle) toast.querySelector('.yamuna-cart-toast-subtitle').textContent = subtitle;
      }

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
