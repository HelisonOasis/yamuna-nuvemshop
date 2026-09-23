{% set yamuna_account_auth = template == 'account.login' or template == 'account.register' or template == 'account.reset' or template == 'account.newpass' %}
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

        {# 043 - hero arrows: vertically centered, pinned to banner edges #}
        <style id="yamuna-hero-arrows-043">
          @media (min-width: 768px) {
            body.template-home .js-home-main-slider-container .js-swiper-home-prev,
            body.template-home .js-home-main-slider-container .js-swiper-home-next {
              top: 50% !important;
              bottom: auto !important;
              margin-top: -24px !important;
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
            body.template-home .js-home-main-slider-container .js-swiper-home-prev {
              left: 8px !important;
              right: auto !important;
            }
            body.template-home .js-home-main-slider-container .js-swiper-home-next {
              right: 8px !important;
              left: auto !important;
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

        {# Physical header spacer — critical first-paint clearance for fixed header #}
        <style id="yamuna-header-spacer-128">
          .yamuna-header-spacer {
            display: block;
            width: 100%;
            height: 80px;
            flex-shrink: 0;
            pointer-events: none;
            visibility: hidden;
          }
          body.template-home .yamuna-header-spacer {
            display: none;
            height: 0;
            overflow: hidden;
          }
          @media (min-width: 1024px) {
            .yamuna-header-spacer {
              height: var(--yamuna-header-clearance, 110px);
            }
            body:not(.template-home):not(.yamuna-account-auth) > .mt-4,
            body:not(.template-home) > .yamuna-resale-wrap {
              margin-top: 0 !important;
              padding-top: 16px !important;
            }
          }

          /* Cenário 138: Minha Conta — 40px below header (all breakpoints) */
          body[class*="template-account-"]:not(.yamuna-account-auth) > .mt-4 {
            margin-top: 0 !important;
            padding-top: 40px !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header {
            margin-top: 0 !important;
            padding-top: 0 !important;
            margin-bottom: 0 !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page {
            margin-top: 0 !important;
            padding-top: 0 !important;
          }
        </style>

        {# Cenário 128 — Minha Conta: Raleway + brand magenta (never theme purple) #}
        <style id="yamuna-account-magenta-128">
          /* Typography: Raleway across all logged-in account templates */
          body[class*="template-account-"]:not(.yamuna-account-auth),
          body[class*="template-account-"]:not(.yamuna-account-auth) .mt-4,
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header,
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header *,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page *,
          body[class*="template-account-"]:not(.yamuna-account-auth) .account-page,
          body[class*="template-account-"]:not(.yamuna-account-auth) .account-page *,
          body[class*="template-account-"]:not(.yamuna-account-auth) h1,
          body[class*="template-account-"]:not(.yamuna-account-auth) h2,
          body[class*="template-account-"]:not(.yamuna-account-auth) h3,
          body[class*="template-account-"]:not(.yamuna-account-auth) h4,
          body[class*="template-account-"]:not(.yamuna-account-auth) h5,
          body[class*="template-account-"]:not(.yamuna-account-auth) h6,
          body[class*="template-account-"]:not(.yamuna-account-auth) p,
          body[class*="template-account-"]:not(.yamuna-account-auth) span,
          body[class*="template-account-"]:not(.yamuna-account-auth) a,
          body[class*="template-account-"]:not(.yamuna-account-auth) label,
          body[class*="template-account-"]:not(.yamuna-account-auth) strong,
          body[class*="template-account-"]:not(.yamuna-account-auth) small,
          body[class*="template-account-"]:not(.yamuna-account-auth) button,
          body[class*="template-account-"]:not(.yamuna-account-auth) input,
          body[class*="template-account-"]:not(.yamuna-account-auth) select,
          body[class*="template-account-"]:not(.yamuna-account-auth) textarea,
          body[class*="template-account-"]:not(.yamuna-account-auth) .form-label,
          body[class*="template-account-"]:not(.yamuna-account-auth) .form-control,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn,
          body[class*="template-account-"]:not(.yamuna-account-auth) .breadcrumbs {
            font-family: 'Raleway', sans-serif !important;
          }

          /* Primary CTAs — ONLY on /account (do not leak to home/PLP/PDP) */
          body[class*="template-account-"] .btn.btn-primary,
          body[class*="template-account-"] a.btn.btn-primary,
          body[class*="template-account-"] button.btn.btn-primary,
          body[class*="template-account-"] .btn-primary,
          body[class*="template-account-"] .btn.btn-primary.btn-small,
          body[class*="template-account-"] a.btn.btn-primary.btn-small {
            background: #a31460 !important;
            background-color: #a31460 !important;
            border-color: #a31460 !important;
            color: #fff !important;
            fill: #fff !important;
            transition: background-color 0.2s ease, border-color 0.2s ease !important;
          }
          body[class*="template-account-"] .btn.btn-primary:hover,
          body[class*="template-account-"] .btn.btn-primary:focus,
          body[class*="template-account-"] a.btn.btn-primary:hover,
          body[class*="template-account-"] a.btn.btn-primary:focus,
          body[class*="template-account-"] .btn-primary:hover,
          body[class*="template-account-"] .btn-primary:focus {
            background: #6b0a3f !important;
            background-color: #6b0a3f !important;
            border-color: #6b0a3f !important;
            color: #fff !important;
            opacity: 1 !important;
          }
          body[class*="template-account-"] .btn.btn-primary:active,
          body[class*="template-account-"] a.btn.btn-primary:active,
          body[class*="template-account-"] .btn-primary:active {
            background: #520731 !important;
            background-color: #520731 !important;
            border-color: #520731 !important;
            color: #fff !important;
            opacity: 1 !important;
          }

          /* All account interactive accents: links, icons, text-primary, order status */
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page a:not(.btn-primary):not(.btn),
          body[class*="template-account-"]:not(.yamuna-account-auth) .account-page a:not(.btn-primary):not(.btn),
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-link,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-link-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn-link,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn-link-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-login-forgot,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-link-wrap a,
          body[class*="template-account-"]:not(.yamuna-account-auth) .text-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) .pending,
          body[class*="template-account-"]:not(.yamuna-account-auth) .authorized,
          body[class*="template-account-"]:not(.yamuna-account-auth) span.pending,
          body[class*="template-account-"]:not(.yamuna-account-auth) span.authorized {
            color: #a31460 !important;
            fill: #a31460 !important;
            transition: color 0.2s ease, fill 0.2s ease !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page a:not(.btn-primary):not(.btn):hover,
          body[class*="template-account-"]:not(.yamuna-account-auth) .account-page a:not(.btn-primary):not(.btn):hover,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-link:hover,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-link-primary:hover,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn-link-primary:hover,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-login-forgot:hover,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-link-wrap a:hover {
            color: #6b0a3f !important;
            fill: #6b0a3f !important;
            opacity: 1 !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .svg-icon-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) svg.svg-icon-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) .svg-icon-primary use {
            fill: #a31460 !important;
            color: #a31460 !important;
          }
          /* Cenário 136: ALL non-pink account text = wine #4a1d3a (beats theme #000) */
          body[class*="template-account-"]:not(.yamuna-account-auth) > .mt-4,
          body[class*="template-account-"]:not(.yamuna-account-auth) > .mt-4 *:not(svg):not(path):not(use),
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header,
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header *:not(svg):not(path):not(use),
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page *:not(svg):not(path):not(use),
          body[class*="template-account-"]:not(.yamuna-account-auth) .account-page,
          body[class*="template-account-"]:not(.yamuna-account-auth) .account-page *:not(svg):not(path):not(use),
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header h1,
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .h1,
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .h2,
          body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .text-primary {
            color: #4a1d3a !important;
          }
          /* Re-assert pink accents after wine * (head) */
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-page a:not(.btn-primary):not(.btn),
          body[class*="template-account-"]:not(.yamuna-account-auth) .account-page a:not(.btn-primary):not(.btn),
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-link,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-link-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn-link,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn-link-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-login-forgot,
          body[class*="template-account-"]:not(.yamuna-account-auth) .yamuna-account-link-wrap a,
          body[class*="template-account-"]:not(.yamuna-account-auth) .text-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) .pending,
          body[class*="template-account-"]:not(.yamuna-account-auth) .authorized,
          body[class*="template-account-"]:not(.yamuna-account-auth) span.pending,
          body[class*="template-account-"]:not(.yamuna-account-auth) span.authorized {
            color: #a31460 !important;
            fill: #a31460 !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn.btn-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn.btn-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-primary,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn.btn-primary.btn-small,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn.btn-primary.btn-small {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            box-sizing: border-box !important;
            height: 40px !important;
            min-height: 40px !important;
            padding: 0 24px !important;
            border: 0 !important;
            border-radius: 999px !important;
            background: #a31460 !important;
            background-color: #a31460 !important;
            border-color: #a31460 !important;
            color: #fff !important;
            fill: #fff !important;
            font-family: 'Raleway', sans-serif !important;
            font-size: 16px !important;
            font-weight: 600 !important;
            letter-spacing: 0.04em !important;
            line-height: 1.2 !important;
            text-transform: uppercase !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn.btn-primary.d-block,
          body[class*="template-account-"]:not(.yamuna-account-auth) a.btn.btn-primary.d-block {
            display: flex !important;
            width: 100% !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-secondary {
            color: #a31460 !important;
            border-color: #a31460 !important;
            background: transparent !important;
            transition: color 0.2s ease, border-color 0.2s ease, background-color 0.2s ease !important;
          }
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-secondary:hover,
          body[class*="template-account-"]:not(.yamuna-account-auth) .btn-secondary:focus {
            color: #fff !important;
            border-color: #6b0a3f !important;
            background: #6b0a3f !important;
            opacity: 1 !important;
          }
        </style>

        {# Home spot COMPRAR must stay teal — never inherit account magenta #}
        <style id="yamuna-home-spot-teal-137">
          body.template-home .yamuna-home-spot-buy-one,
          body.template-home .btn.btn-primary.yamuna-home-spot-buy-one,
          body.template-home .yamuna-home-products .item-actions .btn-primary,
          body.template-home .yamuna-home-products .item-actions .yamuna-home-spot-buy-one,
          body.template-home [data-store^="home-products-"] .yamuna-home-spot-buy-one,
          body .btn.btn-primary.yamuna-home-spot-buy-one,
          body .yamuna-home-spot-buy-one.btn-primary {
            background: #238482 !important;
            background-color: #238482 !important;
            border-color: #238482 !important;
            color: #fff !important;
            fill: #fff !important;
          }
        </style>

        {# Cenário 150: Esqueceu sua senha? = #A31460 #}
        <style id="yamuna-forgot-link-150">
          body .head-main .yamuna-account-dropdown-forgot,
          body[class] .head-main .yamuna-account-dropdown-forgot,
          body .yamuna-login-forgot,
          body .yamuna-login-forgot-wrap .yamuna-login-forgot {
            color: #a31460 !important;
          }
          body .head-main .yamuna-account-dropdown-forgot:hover,
          body .head-main .yamuna-account-dropdown-forgot:focus,
          body .yamuna-login-forgot:hover,
          body .yamuna-login-forgot:focus {
            color: #6b0a3f !important;
          }
        </style>

        {# Cenário 152: inputs ≥16px no mobile — evita zoom automático no iOS #}
        <style id="yamuna-ios-input-zoom-152">
          @media (max-width: 1023px) {
            html body input.form-control,
            html body textarea.form-control,
            html body select.form-control,
            html body input[type="text"],
            html body input[type="email"],
            html body input[type="password"],
            html body input[type="tel"],
            html body input[type="search"],
            html body input[type="number"],
            html body input[type="url"],
            html body input[type="date"],
            html body select,
            html body textarea,
            html body .yamuna-mobile-search-input,
            html body .yamuna-mobile-menu-search-input,
            html body .yamuna-login-input,
            html body .yamuna-account-dropdown-input,
            html body .search-input {
              font-size: 16px !important;
            }
          }
        </style>

        {# Cenário 153: botão X na barra de busca #}
        <style id="yamuna-search-clear-153">
          .yamuna-search-clear {
            position: absolute !important;
            top: 50% !important;
            right: 40px !important;
            z-index: 3 !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            width: 28px !important;
            height: 28px !important;
            margin: 0 !important;
            padding: 0 !important;
            border: 0 !important;
            border-radius: 50% !important;
            background: transparent !important;
            color: #4a1d3a !important;
            fill: #4a1d3a !important;
            cursor: pointer !important;
            transform: translateY(-50%) !important;
            opacity: 0.75 !important;
          }
          .yamuna-search-clear:hover,
          .yamuna-search-clear:focus {
            opacity: 1 !important;
            background: rgba(74, 29, 58, 0.1) !important;
            outline: 0 !important;
          }
          .yamuna-search-clear svg {
            width: 12px !important;
            height: 12px !important;
            fill: currentColor !important;
          }
          body .head-main .yamuna-mobile-search-input.form-control {
            padding-right: 76px !important;
          }
          body .head-main .yamuna-header-desktop-search .yamuna-search-clear {
            right: 42px !important;
            color: #fff !important;
            fill: #fff !important;
          }
          body .head-main .yamuna-header-desktop-search .yamuna-search-clear:hover,
          body .head-main .yamuna-header-desktop-search .yamuna-search-clear:focus {
            background: rgba(255, 255, 255, 0.16) !important;
          }
          body .head-main .yamuna-header-desktop-search .search-input {
            padding-right: 72px !important;
          }
          /* Esconde o X nativo do iOS/WebKit (type=search) — só o nosso botão */
          html body input[type="search"]::-webkit-search-cancel-button,
          html body .yamuna-mobile-search-input[type="search"]::-webkit-search-cancel-button,
          html body .js-search-input[type="search"]::-webkit-search-cancel-button,
          html body .search-input[type="search"]::-webkit-search-cancel-button {
            -webkit-appearance: none !important;
            appearance: none !important;
            display: none !important;
          }
        </style>

        {# Cenário 155: busca no drawer mobile — resultados sem quebrar menu #}
        <style id="yamuna-drawer-search-155">
          @media (max-width: 1023px) {
            body #nav-hamburger .yamuna-mobile-menu {
              display: flex !important;
              flex-direction: column !important;
            }
            body #nav-hamburger .yamuna-mobile-menu-search {
              position: relative !important;
            }
            body #nav-hamburger .yamuna-mobile-menu-search-clear {
              position: absolute !important;
              top: 50% !important;
              right: 34px !important;
              z-index: 2 !important;
              display: inline-flex !important;
              align-items: center !important;
              justify-content: center !important;
              width: 24px !important;
              height: 24px !important;
              margin: 0 !important;
              padding: 0 !important;
              border: 0 !important;
              border-radius: 50% !important;
              background: transparent !important;
              color: #4a1d3a !important;
              fill: #4a1d3a !important;
              cursor: pointer !important;
              transform: translateY(-50%) !important;
            }
            body #nav-hamburger .yamuna-mobile-menu-search-input {
              padding-right: 56px !important;
            }
            body #nav-hamburger .yamuna-mobile-menu-search-suggest {
              flex: 1 1 auto !important;
              min-height: 0 !important;
              max-height: calc(100dvh - 200px) !important;
              margin: 4px 12px 16px !important;
              overflow-x: hidden !important;
              overflow-y: auto !important;
              -webkit-overflow-scrolling: touch !important;
            }
            body #nav-hamburger .yamuna-mobile-menu.yamuna-menu-has-search .yamuna-mobile-menu-products,
            body #nav-hamburger .yamuna-mobile-menu.yamuna-menu-has-search .yamuna-mobile-menu-links,
            body #nav-hamburger .yamuna-mobile-menu:has(.yamuna-mobile-menu-search-suggest .search-suggest-list) .yamuna-mobile-menu-products,
            body #nav-hamburger .yamuna-mobile-menu:has(.yamuna-mobile-menu-search-suggest .search-suggest-list) .yamuna-mobile-menu-links,
            body #nav-hamburger .yamuna-mobile-menu:has(.yamuna-mobile-menu-search-suggest .js-search-suggest-all-link) .yamuna-mobile-menu-products,
            body #nav-hamburger .yamuna-mobile-menu:has(.yamuna-mobile-menu-search-suggest .js-search-suggest-all-link) .yamuna-mobile-menu-links {
              display: none !important;
            }
            /* VER TODOS OS RESULTADOS — force 40px (beat theme .btn-primary padding:13px) */
            html body #nav-hamburger a.js-search-suggest-all-link.btn.btn-primary,
            html body #nav-hamburger .yamuna-mobile-menu-search-suggest a.js-search-suggest-all-link,
            html body #nav-hamburger .yamuna-mobile-menu-search-suggest .btn.btn-primary,
            html body .yamuna-mobile-menu-search-suggest a.js-search-suggest-all-link.btn.btn-primary,
            html body .js-search-suggest a.js-search-suggest-all-link.btn.btn-primary,
            html body .search-suggest a.js-search-suggest-all-link.btn.btn-primary {
              display: flex !important;
              width: 100% !important;
              max-width: 100% !important;
              height: 40px !important;
              min-height: 40px !important;
              max-height: 40px !important;
              margin: 12px 0 8px !important;
              padding: 0 16px !important;
              align-items: center !important;
              justify-content: center !important;
              box-sizing: border-box !important;
              border-radius: 999px !important;
              background: #a31460 !important;
              border: 0 !important;
              border-color: #a31460 !important;
              color: #fff !important;
              font-family: "Raleway", sans-serif !important;
              font-size: 13px !important;
              font-weight: 600 !important;
              line-height: 1 !important;
              letter-spacing: .02em !important;
              text-transform: uppercase !important;
            }
          }
        </style>

        {# Cenário 022: blog post — sem identificação de autor #}
        <style id="yamuna-blog-author-022">
          body.template-blog-post .yamuna-blog-post-page .post-author,
          body.template-blog-post .yamuna-blog-post-page .blog-post-author,
          body.template-blog-post .yamuna-blog-post-page .author,
          body.template-blog-post .yamuna-blog-post-date a,
          body.template-blog-post .yamuna-blog-post-date .author,
          body.template-blog-post .yamuna-blog-post-date .post-author {
            display: none !important;
          }
        </style>

        {# Cenário 023: blog post — ocultar breadcrumb em mobile #}
        <style id="yamuna-blog-breadcrumb-023">
          @media (max-width: 1023px) {
            body.template-blog-post .yamuna-blog-post-page .breadcrumbs,
            body.template-blog-post .page-header .breadcrumbs {
              display: none !important;
            }
          }
        </style>

        {# Blog post background #}
        <style id="yamuna-blog-post-bg">
          body.template-blog-post .yamuna-blog-post-page {
            background: #f6f6f6 !important;
          }
        </style>

        {# Cenario 024: blog post images capped like prod (~680px, no upscale) #}
        <style id="yamuna-blog-images-024">
          body.template-blog-post .yamuna-blog-post-page,
          body.template-blog-post .yamuna-blog-post-body,
          body.template-blog-post .yamuna-blog-post .post-content {
            overflow-x: clip !important;
            box-sizing: border-box !important;
          }
          /* Keep a centered reading column (do NOT force article to 100% width). */
          body.template-blog-post .yamuna-blog-post-page > .container {
            max-width: 960px !important;
            margin-left: auto !important;
            margin-right: auto !important;
          }
          body.template-blog-post .yamuna-blog-post {
            max-width: 100% !important;
            margin-left: auto !important;
            margin-right: auto !important;
          }
          body.template-blog-post .yamuna-blog-post-page img,
          body.template-blog-post .yamuna-blog-post img,
          body.template-blog-post .yamuna-blog-post-image,
          body.template-blog-post .yamuna-blog-post .post-item-image {
            display: block !important;
            width: auto !important;
            max-width: min(100%, 680px) !important;
            height: auto !important;
            max-height: 680px !important;
            object-fit: contain !important;
            object-position: center !important;
            margin-left: auto !important;
            margin-right: auto !important;
          }
          body.template-blog-post .yamuna-blog-post > .yamuna-blog-post-image,
          body.template-blog-post .yamuna-blog-post img.yamuna-blog-post-image,
          body.template-blog-post .yamuna-blog-post .yamuna-blog-post-image.post-item-image {
            max-width: min(100%, 640px) !important;
            max-height: 420px !important;
            object-fit: cover !important;
          }
          @media (max-width: 1023px) {
            body.template-blog-post .yamuna-blog-post-page img,
            body.template-blog-post .yamuna-blog-post img {
              max-height: 520px !important;
            }
            body.template-blog-post .yamuna-blog-post > .yamuna-blog-post-image,
            body.template-blog-post .yamuna-blog-post img.yamuna-blog-post-image {
              max-height: 360px !important;
            }
          }
          body.template-blog-post .yamuna-blog-post-page figure,
          body.template-blog-post .yamuna-blog-post-page picture,
          body.template-blog-post .yamuna-blog-post-page table,
          body.template-blog-post .yamuna-blog-post-page iframe,
          body.template-blog-post .yamuna-blog-post-page video,
          body.template-blog-post .yamuna-blog-post .post-content a {
            max-width: 100% !important;
            box-sizing: border-box !important;
          }
        </style>

        {# Blog related — grid no padrão PLP #}
        <style id="yamuna-blog-related-grid">
          body.template-blog-post .yamuna-blog-related {
            background: #f6f6f6 !important;
            padding: 24px 0 56px !important;
          }
          body.template-blog-post .yamuna-blog-related-grid {
            display: grid !important;
            grid-template-columns: minmax(0, 1fr) !important;
            gap: 16px 0 !important;
            width: 100% !important;
            padding: 0 16px 8px !important;
            box-sizing: border-box !important;
          }
          body.template-blog-post .yamuna-blog-related-cell {
            width: 100% !important;
            height: auto !important;
            padding: 0 0 16px !important;
            box-sizing: border-box !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .js-item-product,
          body.template-blog-post .yamuna-blog-related-cell .item.item-product {
            display: flex !important;
            flex-direction: column !important;
            width: 100% !important;
            max-width: 100% !important;
            min-height: 0 !important;
            height: auto !important;
            margin: 0 !important;
            overflow: visible !important;
            border-radius: 12px !important;
            background: #fff !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .item-image,
          body.template-blog-post .yamuna-blog-related-cell .js-item-image-container {
            display: block !important;
            width: calc(100% - 32px) !important;
            max-width: 280px !important;
            height: auto !important;
            max-height: none !important;
            aspect-ratio: 1 / 1 !important;
            margin: 16px auto 0 !important;
            overflow: hidden !important;
            border-radius: 8px !important;
            background: #fff !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .item-image img,
          body.template-blog-post .yamuna-blog-related-cell .js-item-image-container img,
          body.template-blog-post .yamuna-blog-related-cell .img-absolute,
          body.template-blog-post .yamuna-blog-related-cell .img-absolute-centered {
            position: static !important;
            top: auto !important;
            left: auto !important;
            display: block !important;
            width: 100% !important;
            height: 100% !important;
            max-width: 100% !important;
            max-height: 100% !important;
            object-fit: contain !important;
            object-position: center !important;
            transform: none !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .item-image-secondary,
          body.template-blog-post .yamuna-blog-related-cell .product-item-image-secondary {
            display: none !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .item-description {
            padding: 5px 28px 0 !important;
            text-align: left !important;
            border: 0 !important;
            border-bottom: 0 !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .item-name {
            color: #4a1d3a !important;
            font-family: 'Dosis', sans-serif !important;
            font-size: 18px !important;
            font-weight: 600 !important;
            text-align: left !important;
          }
          @media (min-width: 768px) {
            body.template-blog-post .yamuna-blog-related-cell .item-name {
              display: block !important;
              overflow: hidden !important;
              text-overflow: ellipsis !important;
              white-space: nowrap !important;
              max-width: 100% !important;
            }
          }
          body.template-blog-post .yamuna-blog-related-cell .item-price {
            color: #4a1d3a !important;
            font-family: 'Dosis', sans-serif !important;
            font-size: 24px !important;
            font-weight: 600 !important;
          }
          /* PLP offer ribbon (not circle) */
          body.template-blog-post .yamuna-blog-related-cell .labels {
            top: 0 !important;
            left: 50% !important;
            transform: translateX(-50%) !important;
            display: flex !important;
            width: calc(100% - 24px) !important;
            max-width: 300px !important;
            justify-content: center !important;
            z-index: 12 !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .js-offer-label,
          body.template-blog-post .yamuna-blog-related-cell .js-offer-label.label-circle {
            display: flex !important;
            width: 100% !important;
            max-width: 300px !important;
            height: 40px !important;
            margin: 0 auto !important;
            padding: 0 24px !important;
            align-items: center !important;
            justify-content: center !important;
            border-radius: 0 !important;
            background-color: transparent !important;
            background-image: url("{{ 'images/yamuna/offer-ribbon.svg' | static_url }}") !important;
            background-position: center center !important;
            background-repeat: no-repeat !important;
            background-size: 100% 100% !important;
            color: #a31460 !important;
            font-family: 'Dosis', sans-serif !important;
            font-size: 18px !important;
            font-weight: 700 !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .js-offer-label span {
            color: #a31460 !important;
            font-family: 'Dosis', sans-serif !important;
            font-size: 18px !important;
            font-weight: 700 !important;
          }
          /* Hide frete gratis */
          body.template-blog-post .yamuna-blog-related-cell .js-shipping-label-private,
          body.template-blog-post .yamuna-blog-related-cell .js-free-shipping-minimum-label,
          body.template-blog-post .yamuna-blog-related-cell [data-store="product-item-label-shipping"] {
            display: none !important;
          }
          /* Force PLP CTAs visible (theme .item-actions is hover-only) */
          body.template-blog-post .yamuna-blog-related-cell .item-actions,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-item-actions {
            display: flex !important;
            flex-direction: column !important;
            align-items: center !important;
            gap: 10px !important;
            width: 100% !important;
            margin-top: auto !important;
            padding: 12px 12px 16px !important;
            border: 0 !important;
            border-top: 0 !important;
            visibility: visible !important;
            opacity: 1 !important;
            pointer-events: auto !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-item-actions form,
          body.template-blog-post .yamuna-blog-related-cell .item-actions form,
          body.template-blog-post .yamuna-blog-related-cell .item-actions > div:first-child {
            display: grid !important;
            gap: 10px !important;
            width: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            visibility: visible !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-one,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-pdp-spot-buy-one,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-pdp-spot-buy-three,
          body.template-blog-post .yamuna-blog-related-cell .item-actions .btn-primary,
          body.template-blog-post .yamuna-blog-related-cell .item-actions .btn-secondary.js-addtocart {
            display: flex !important;
            width: 100% !important;
            min-height: 40px !important;
            height: auto !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 8px !important;
            border: 1px solid #238482 !important;
            border-radius: 24px !important;
            background: #238482 !important;
            color: #fff !important;
            font-family: 'Roboto', sans-serif !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            text-transform: uppercase !important;
            white-space: normal !important;
            text-align: center !important;
            visibility: visible !important;
            opacity: 1 !important;
            pointer-events: auto !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-pdp-spot-buy-three {
            height: 42px !important;
            min-height: 42px !important;
            background: #fff !important;
            color: #238482 !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three span,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three-prefix,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three-price {
            font-family: 'Roboto', sans-serif !important;
            font-size: 14px !important;
            font-weight: 600 !important;
          }
          @media (max-width: 360px) {
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-item-actions,
            body.template-blog-post .yamuna-blog-related-cell .item-actions {
              padding: 10px 8px 14px !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-one,
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three,
            body.template-blog-post .yamuna-blog-related-cell .yamuna-pdp-spot-buy-one,
            body.template-blog-post .yamuna-blog-related-cell .yamuna-pdp-spot-buy-three {
              padding: 8px 6px !important;
              gap: 4px !important;
              font-size: 11px !important;
              line-height: 1.2 !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-one img,
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three img {
              width: 12px !important;
              height: 12px !important;
              margin-right: 4px !important;
            }
          }
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-pdp-spot-buy-three,
          body.template-blog-post .yamuna-blog-related-cell .item-actions .btn-secondary.js-addtocart {
            background: #fff !important;
            color: #238482 !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-one img,
          body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three img {
            width: 14px !important;
            height: 14px !important;
            margin-right: 8px !important;
            visibility: visible !important;
          }
          body.template-blog-post .yamuna-blog-related-cell .item-actions > div:last-child:not(.yamuna-avise-me-wrap):not(:first-child),
          body.template-blog-post .yamuna-blog-related-cell .js-addtocart-placeholder {
            display: none !important;
          }
          body.template-blog-post .yamuna-blog-related .swiper-button-prev,
          body.template-blog-post .yamuna-blog-related .swiper-button-next,
          body.template-blog-post .yamuna-blog-related .js-swiper-related-prev,
          body.template-blog-post .yamuna-blog-related .js-swiper-related-next,
          body.template-blog-post .yamuna-blog-related .swiper-pagination {
            display: none !important;
          }
          @media (min-width: 768px) {
            body.template-blog-post .yamuna-blog-related-grid {
              grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
              gap: 20px 16px !important;
              padding: 0 16px 16px !important;
            }
            body.template-blog-post .yamuna-blog-related-cell {
              padding: 0 8px 32px !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .js-item-product,
            body.template-blog-post .yamuna-blog-related-cell .item.item-product {
              min-height: 0 !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .item-image,
            body.template-blog-post .yamuna-blog-related-cell .js-item-image-container {
              width: calc(100% - 40px) !important;
              max-width: 280px !important;
              height: auto !important;
              max-height: none !important;
              aspect-ratio: 1 / 1 !important;
              margin: 20px auto 0 !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-item-actions,
            body.template-blog-post .yamuna-blog-related-cell .item-actions {
              padding: 14px 20px 20px !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-one,
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three {
              font-family: 'Roboto', sans-serif !important;
              font-size: 14px !important;
              white-space: normal !important;
            }
          }
          /* Desktop: 3-col grid like PLP */
          @media (min-width: 1100px) {
            body.template-blog-post .yamuna-blog-related-grid {
              grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
              justify-content: center !important;
              gap: 0 !important;
            }
            body.template-blog-post .yamuna-blog-related-cell {
              padding: 0 16px 32px !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .item-image,
            body.template-blog-post .yamuna-blog-related-cell .js-item-image-container {
              width: calc(100% - 56px) !important;
              max-width: 320px !important;
              height: auto !important;
              max-height: none !important;
              aspect-ratio: 1 / 1 !important;
              margin: 24px auto 0 !important;
            }
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-one,
            body.template-blog-post .yamuna-blog-related-cell .yamuna-plp-buy-three {
              font-size: 14px !important;
            }
          }
        </style>

        {# 012 — institutional pages: solid white mobile header (clearance via .yamuna-header-spacer) #}
        <style id="yamuna-inst-pages-012">
          @media (max-width: 1023px) {
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

        {# 127 — smooth & soft white fade transition under mobile header. #}
        <style id="yamuna-header-fade-127">
          @media (max-width: 1023px) {
            html body.template-home .head-main,
            html body[class].template-home .head-main,
            body.template-home .head-main {
              overflow: visible !important;
            }

            html body.template-home .head-main::after,
            html body[class].template-home .head-main::after,
            html body.template-home .head-main.head-fixed::after,
            html body[class].template-home .head-main.head-fixed::after,
            body.template-home .head-main::after,
            body.template-home .head-main.head-fixed::after {
              position: absolute !important;
              top: 100% !important;
              right: 0 !important;
              left: 0 !important;
              z-index: 10 !important;
              display: block !important;
              visibility: visible !important;
              opacity: 1 !important;
              width: 100% !important;
              height: 70px !important;
              max-height: 70px !important;
              content: '' !important;
              pointer-events: none !important;
              background: linear-gradient(180deg, rgba(255, 255, 255, 1.0) 0%, rgba(255, 255, 255, 0.85) 25%, rgba(255, 255, 255, 0.55) 50%, rgba(255, 255, 255, 0.25) 75%, rgba(255, 255, 255, 0) 100%) !important;
              background-image: linear-gradient(180deg, rgba(255, 255, 255, 1.0) 0%, rgba(255, 255, 255, 0.85) 25%, rgba(255, 255, 255, 0.55) 50%, rgba(255, 255, 255, 0.25) 75%, rgba(255, 255, 255, 0) 100%) !important;
              transition: opacity 0.9s cubic-bezier(0.22, 0.61, 0.36, 1) !important;
            }

            html.yamuna-header-scrolled body.template-home .head-main::after,
            html.yamuna-header-scrolled body[class].template-home .head-main::after {
              opacity: 0 !important;
            }

            html:has(#nav-hamburger.modal-show) body.template-home .head-main::after,
            html:has(#nav-hamburger.modal-show) body[class].template-home .head-main::after,
            html body.template-home .head-main:has(.yamuna-mobile-search.is-open)::after,
            html body[class].template-home .head-main:has(.yamuna-mobile-search.is-open)::after,
            body.template-home .head-main:has(.yamuna-mobile-search.is-open)::after {
              display: none !important;
              height: 0 !important;
              content: none !important;
              background: none !important;
              opacity: 0 !important;
            }

            /* Cenario 154: search panel above any residual fade */
            html body.template-home .head-main .yamuna-mobile-search.is-open,
            body.template-home .head-main .yamuna-mobile-search.is-open {
              position: relative !important;
              z-index: 20 !important;
            }
          }
        </style>

        {# 120 — hamburger sidebar: 12px ≤350px, 14px ≥351px; all icons; 1 line #}
        <style id="yamuna-hamburger-menu-120">
          @media (max-width: 1023px) {
            body #nav-hamburger.modal-nav-hamburger,
            body #nav-hamburger.modal.modal-nav-hamburger,
            body[class] #nav-hamburger.modal-nav-hamburger,
            html body #nav-hamburger.modal-nav-hamburger.modal-show {
              width: min(100vw, 350px) !important;
              max-width: 350px !important;
            }
            body #nav-hamburger .yamuna-mobile-menu-products a,
            body #nav-hamburger .yamuna-mobile-menu-products ul li a,
            body #nav-hamburger.modal-nav-hamburger .yamuna-mobile-menu-products a {
              position: relative !important;
              display: flex !important;
              align-items: center !important;
              min-height: 32px !important;
              padding: 0 4px 0 26px !important;
              color: #238482 !important;
              font-family: 'Raleway', sans-serif !important;
              font-weight: 600 !important;
              text-transform: uppercase !important;
              white-space: nowrap !important;
              overflow: hidden !important;
              text-overflow: ellipsis !important;
            }
            body #nav-hamburger .yamuna-mobile-menu-products img,
            body #nav-hamburger .yamuna-mobile-menu-products li img,
            body #nav-hamburger .yamuna-mobile-menu-products li:nth-child(n) img {
              position: absolute !important;
              top: 50% !important;
              left: 0 !important;
              display: block !important;
              width: 16px !important;
              height: 16px !important;
              margin: 0 !important;
              transform: translateY(-50%) !important;
              object-fit: contain !important;
              visibility: visible !important;
              opacity: 1 !important;
            }
          }
          /* 12px only on narrow phones (320–350 inclusive) */
          @media (max-width: 350px) {
            body #nav-hamburger .yamuna-mobile-menu-products a,
            body #nav-hamburger .yamuna-mobile-menu-products ul li a,
            body #nav-hamburger.modal-nav-hamburger .yamuna-mobile-menu-products a,
            html body #nav-hamburger .yamuna-mobile-menu-products a {
              font-size: 12px !important;
              line-height: 16px !important;
              letter-spacing: -0.01em !important;
              padding-left: 24px !important;
            }
            body #nav-hamburger .yamuna-mobile-menu-products img {
              width: 14px !important;
              height: 14px !important;
            }
          }
          @media (min-width: 351px) and (max-width: 1023px) {
            body #nav-hamburger .yamuna-mobile-menu-products a,
            body #nav-hamburger .yamuna-mobile-menu-products ul li a,
            body #nav-hamburger.modal-nav-hamburger .yamuna-mobile-menu-products a,
            html body #nav-hamburger .yamuna-mobile-menu-products a {
              font-size: 14px !important;
              line-height: 18px !important;
            }
          }
        </style>

        {# 011 — 404: fundo #F6F6F6 + clear header fixo + hero centralizado + setas home. #}
        {% if template == '404' %}
        <style id="yamuna-404-bg-011">
          html body.template-404,
          body.template-404,
          html body.template-404 .background-main,
          body.template-404 > .mt-4,
          body.template-404 .yamuna-404-page,
          body.template-404 .yamuna-empty-related,
          body.template-404 .yamuna-pdp-related.yamuna-empty-related {
            background: #F6F6F6 !important;
            background-color: #F6F6F6 !important;
          }

          /* Clearance comes from .yamuna-header-spacer; keep overflow lock only */
          html body.template-404,
          body.template-404 {
            overflow-x: hidden !important;
            box-sizing: border-box !important;
          }

          body.template-404 > .mt-4 {
            display: block !important;
            flex: none !important;
            width: 100% !important;
            max-width: 100% !important;
            margin-top: 0 !important;
            margin-bottom: 0 !important;
            overflow-x: hidden !important;
          }

          /* Hero centralizado abaixo da navbar, com respiro */
          body.template-404 .yamuna-404-page {
            display: flex !important;
            flex-direction: column !important;
            align-items: center !important;
            justify-content: center !important;
            flex: none !important;
            width: 100% !important;
            max-width: 100% !important;
            min-height: calc(100vh - 80px - 280px) !important;
            margin: 0 !important;
            padding: 48px 16px 40px !important;
            overflow: visible !important;
            box-sizing: border-box !important;
          }

          body.template-404 .yamuna-404-inner {
            display: flex !important;
            flex-direction: column-reverse !important;
            flex-wrap: nowrap !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 28px !important;
            width: 100% !important;
            max-width: 960px !important;
            margin: 0 auto !important;
            padding: 0 !important;
            box-sizing: border-box !important;
          }

          body.template-404 .yamuna-404-illustration,
          body.template-404 .yamuna-404-title-img {
            display: block !important;
            width: auto !important;
            height: auto !important;
            max-width: 100% !important;
            min-width: 0 !important;
            object-fit: contain !important;
          }

          body.template-404 .yamuna-404-illustration {
            max-width: min(280px, 70vw) !important;
          }

          body.template-404 .yamuna-404-title-img {
            max-width: min(320px, 78vw) !important;
          }

          body.template-404 .yamuna-empty-related {
            margin: 8px 0 0 !important;
            padding: 24px 0 48px !important;
          }

          /* Setas VOCÊ PODE GOSTAR: mesma espessura da home */
          body.template-404 .yamuna-empty-related .swiper-button-prev .icon-inline,
          body.template-404 .yamuna-empty-related .swiper-button-next .icon-inline,
          body.template-404 .yamuna-empty-related .swiper-button-prev svg,
          body.template-404 .yamuna-empty-related .swiper-button-next svg,
          body.template-404 .yamuna-empty-related .js-swiper-related-prev svg,
          body.template-404 .yamuna-empty-related .js-swiper-related-next svg {
            display: none !important;
          }

          body.template-404 .yamuna-empty-related .swiper-button-prev::before,
          body.template-404 .yamuna-empty-related .swiper-button-next::before,
          body.template-404 .yamuna-empty-related .js-swiper-related-prev::before,
          body.template-404 .yamuna-empty-related .js-swiper-related-next::before {
            display: block !important;
            width: 18px !important;
            height: 18px !important;
            margin: 0 !important;
            border-top: 4.5px solid #238482 !important;
            border-right: 4.5px solid #238482 !important;
            background: none !important;
            content: '' !important;
          }

          body.template-404 .yamuna-empty-related .swiper-button-prev::before,
          body.template-404 .yamuna-empty-related .js-swiper-related-prev::before {
            margin-left: 3px !important;
            transform: rotate(-135deg) !important;
          }

          body.template-404 .yamuna-empty-related .swiper-button-next::before,
          body.template-404 .yamuna-empty-related .js-swiper-related-next::before {
            margin-right: 3px !important;
            transform: rotate(45deg) !important;
          }

          body.template-404 .yamuna-empty-related .swiper-button-prev:after,
          body.template-404 .yamuna-empty-related .swiper-button-next:after {
            display: none !important;
            content: none !important;
          }

          @media (min-width: 768px) {
            body.template-404 .yamuna-404-page {
              min-height: calc(100vh - 80px - 320px) !important;
              padding: 64px 24px 48px !important;
            }

            body.template-404 .yamuna-404-inner {
              flex-direction: row !important;
              gap: 40px !important;
              max-width: 900px !important;
            }

            body.template-404 .yamuna-404-illustration {
              flex: 0 1 auto !important;
              max-width: min(320px, 38vw) !important;
            }

            body.template-404 .yamuna-404-title-img {
              flex: 0 1 auto !important;
              max-width: min(400px, 42vw) !important;
            }
          }

          @media (min-width: 1200px) {
            body.template-404 .yamuna-404-page {
              min-height: calc(100vh - 80px - 360px) !important;
              padding: 72px 32px 56px !important;
            }

            body.template-404 .yamuna-404-inner {
              gap: 56px !important;
              max-width: 980px !important;
            }

            body.template-404 .yamuna-404-illustration {
              max-width: 360px !important;
            }

            body.template-404 .yamuna-404-title-img {
              max-width: 460px !important;
            }
          }

          @media (max-width: 1023px) {
            body.template-404 .head-main,
            body.template-404 .head-main.head-fixed,
            body.template-404 .head-main .yamuna-header-mobile {
              background: #fff !important;
              background-color: #fff !important;
            }
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
    <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}{% if yamuna_account_auth %} yamuna-account-auth{% endif %}" data-rounded-borders="{{ settings.theme_rounded ? 'true' : 'false' }}" data-solid-icons="{{ settings.icons_solid ? 'true' : 'false' }}">
        <div id="yamuna-wishlist-config" hidden data-customer-id="{% if customer %}{{ customer.id }}{% endif %}" data-login-url="{{ store.customer_login_url }}"></div>

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

        {% if template == 'cart' or yamuna_account_auth %}
            {% snipplet "header/header-cart.tpl" %}
        {% else %}
            {% snipplet "header/header.tpl" %}
            {# Physical space for fixed header so content never sits underneath it. #}
            <div class="js-yamuna-header-spacer yamuna-header-spacer" aria-hidden="true"></div>
        {% endif %}

        {# Page content #}

        {% if template != 'home' or (template == 'home' and settings.slider is empty) %}

        <div class="{% if template == 'cart' %}yamuna-cart-wrap{% elseif yamuna_account_auth %}yamuna-login-wrap{% elseif template == 'blog' or template == 'blog-post' or page.handle == 'revenda' or page.handle == 'quem-somos' or page.handle == 'quemsomos' or page.handle == 'nossomanifesto' or page.handle == 'nosso-manifesto' or page.handle == 'politicadeprivacidade' or page.handle == 'politica-de-privacidade' or page.handle == 'trabalheconosco' or page.handle == 'trabalhe-conosco' or page.handle == 'entrega' or page.handle == 'trocasedevolucoes' or page.handle == 'trocas-e-devolucoes' or page.handle == 'duvidasfrequentes' or page.handle == 'duvidas-frequentes' %}yamuna-resale-wrap{% elseif page.handle == 'favoritos' or page.handle == 'lista-de-desejos' or page.handle == 'listadedesejos' %}yamuna-favoritos-wrap{% else %}mt-4{% endif %}">

        {% endif %}

            {% template_content %}

        {% if template != 'home' or (template == 'home' and settings.slider and settings.slider is not empty) %}

        </div>

        {% endif %}

        {# WhatsApp chat button — hidden on login to match yamuna.com.br/login/authenticate #}

        {% if not yamuna_account_auth %}
            {% snipplet "whatsapp-chat.tpl" %}
        {% endif %}

        {# Footer — cart page uses the simplified checkout footer from prod #}

        {% if template == 'cart' or yamuna_account_auth %}
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
                if (!(score > 0)) {
                    score = 5;
                }
                var filledSrc = root.getAttribute('data-star-filled') || '';
                var emptySrc = root.getAttribute('data-star-empty') || '';
                var stars = root.querySelectorAll('.js-yamuna-pdp-star');
                for (var s = 0; s < stars.length; s++) {
                    stars[s].src = (s < Math.round(score)) ? filledSrc : emptySrc;
                }

                var label = root.querySelector('.js-yamuna-pdp-rating-label');
                if (label) {
                    if (total > 0) {
                        var pretty = (Math.round(score * 10) / 10).toFixed(1).replace('.', ',');
                        label.textContent = pretty + ' de 5 (' + total + ')';
                    } else {
                        label.textContent = 'Ver avaliações';
                    }
                    root.classList.remove('is-empty');
                }

                root.hidden = false;
                root.setAttribute('aria-label', total > 0
                    ? ('Avaliação ' + score + ' de 5 com ' + total + ' avaliações')
                    : 'Avaliação 5 de 5 estrelas');
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

            {# Cenário 050: mobile PDP breadcrumb — sem scroll; "... > ... > texto" #}
            function fitYamunaPdpBreadcrumb() {
                var nav = document.querySelector('.yamuna-pdp-summary .js-yamuna-breadcrumbs, .yamuna-pdp-summary .breadcrumbs');
                if (!nav) {
                    return;
                }

                var crumbs = nav.querySelectorAll('.crumb');
                var i;
                for (i = 0; i < crumbs.length; i++) {
                    if (!crumbs[i].getAttribute('data-yamuna-full-label')) {
                        crumbs[i].setAttribute('data-yamuna-full-label', (crumbs[i].textContent || '').replace(/\s+/g, ' ').trim());
                    }
                }

                function restore() {
                    for (i = 0; i < crumbs.length; i++) {
                        var full = crumbs[i].getAttribute('data-yamuna-full-label') || '';
                        crumbs[i].textContent = full;
                        crumbs[i].classList.remove('is-truncated', 'is-collapsed');
                        if (crumbs[i].getAttribute('data-yamuna-title-set') === '1') {
                            crumbs[i].removeAttribute('title');
                            crumbs[i].removeAttribute('data-yamuna-title-set');
                        }
                        crumbs[i].removeAttribute('aria-label');
                    }
                }

                function overflows() {
                    return nav.scrollWidth > nav.clientWidth + 1;
                }

                restore();

                if (window.innerWidth > 767 || crumbs.length < 2) {
                    return;
                }

                if (!overflows()) {
                    return;
                }

                {# Collapse non-last crumbs left→right into "..." until it fits. #}
                for (i = 0; i < crumbs.length - 1; i++) {
                    if (!overflows()) {
                        break;
                    }
                    var crumb = crumbs[i];
                    var label = crumb.getAttribute('data-yamuna-full-label') || '';
                    crumb.textContent = '...';
                    crumb.classList.add('is-collapsed');
                    crumb.setAttribute('aria-label', label);
                    if (!crumb.getAttribute('title') && label) {
                        crumb.setAttribute('title', label);
                        crumb.setAttribute('data-yamuna-title-set', '1');
                    }
                }

                {# Still too long: ellipsis the last (current) crumb. #}
                if (overflows() && crumbs.length) {
                    var last = crumbs[crumbs.length - 1];
                    last.classList.add('is-truncated');
                    var lastLabel = last.getAttribute('data-yamuna-full-label') || '';
                    if (lastLabel) {
                        if (!last.getAttribute('title')) {
                            last.setAttribute('title', lastLabel);
                            last.setAttribute('data-yamuna-title-set', '1');
                        }
                        last.setAttribute('aria-label', lastLabel);
                    }
                }
            }

            function initYamunaPdpBreadcrumb() {
                fitYamunaPdpBreadcrumb();
                window.setTimeout(fitYamunaPdpBreadcrumb, 200);
                window.setTimeout(fitYamunaPdpBreadcrumb, 800);
                if (document.fonts && document.fonts.ready && document.fonts.ready.then) {
                    document.fonts.ready.then(function () {
                        fitYamunaPdpBreadcrumb();
                    });
                }
                if (!window.__yamunaBreadcrumb050Bound) {
                    window.__yamunaBreadcrumb050Bound = true;
                    window.addEventListener('resize', function () {
                        window.clearTimeout(window.__yamunaBreadcrumb050Timer);
                        window.__yamunaBreadcrumb050Timer = window.setTimeout(fitYamunaPdpBreadcrumb, 100);
                    });
                }
            }

            function initYamunaProductDescriptionUi() {
                moveProductAccordionHeadings();
                styleYamunaProductDescription();
                initYamunaPdpRating();
                initYamunaPdpBreadcrumb();
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

        {% if template == 'account.register' or template == 'account.reset' %}
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

        {% if template == 'home' %}
            {% include 'snipplets/home/home-migration-popup.tpl' %}
        {% endif %}

        {# Never show progressive quantity seals ("5% OFF comprando 3 ou mais"). #}
        <script>
        (function () {
          function isQtyPromoSeal(el) {
            if (!el || el.nodeType !== 1) return false;
            if (el.classList && (el.classList.contains('js-offer-label') || el.classList.contains('js-stock-label') || el.classList.contains('js-shipping-label-private'))) return false;
            var store = (el.getAttribute && el.getAttribute('data-store')) || '';
            var ptype = (el.getAttribute && el.getAttribute('data-promotion-type')) || '';
            if (/promotion/i.test(store) || /quantity/i.test(ptype)) return true;
            var text = (el.textContent || '').replace(/\s+/g, ' ').trim();
            return /5%\s*OFF/i.test(text) && /comprando\s*3|3\s*ou\s*mais|acima\s*de\s*3/i.test(text);
          }
          function scrub(root) {
            var scope = root && root.querySelectorAll ? root : document;
            var nodes = scope.querySelectorAll('.labels .label, .labels .label-accent, [data-store*="promotion"], [data-promotion-type*="quantity"], .js-product-promo-container');
            for (var i = 0; i < nodes.length; i++) {
              if (isQtyPromoSeal(nodes[i]) || nodes[i].classList.contains('yamuna-hide-promotion') || (nodes[i].classList && nodes[i].classList.contains('js-product-promo-container'))) {
                nodes[i].style.setProperty('display', 'none', 'important');
                nodes[i].setAttribute('hidden', '');
                nodes[i].setAttribute('aria-hidden', 'true');
              }
            }
          }
          function run() { scrub(document); }
          if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', run);
          else run();
          if (window.MutationObserver) {
            var t = null;
            new MutationObserver(function () {
              if (t) clearTimeout(t);
              t = setTimeout(run, 50);
            }).observe(document.documentElement, { childList: true, subtree: true });
          }
        })();
        </script>

        {# Last-wins: account Raleway + wine text #4a1d3a + magenta accents (Cenário 136) #}
        <style id="yamuna-account-raleway-btn-128-end">
          /* Cenário 138: 40px below header on all account pages */
          html body[class*="template-account-"]:not(.yamuna-account-auth) > .mt-4 {
            margin-top: 0 !important;
            padding-top: 40px !important;
          }
          html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header {
            margin-top: 0 !important;
            padding-top: 0 !important;
          }

          /* 1) Font: Raleway on account content */
          html body[class*="template-account-"] > .mt-4,
          html body[class*="template-account-"] > .mt-4 *:not(svg):not(path):not(use):not(circle):not(rect):not(line):not(polyline),
          html body[class*="template-account-"] .page-header,
          html body[class*="template-account-"] .page-header *:not(svg):not(path):not(use),
          html body[class*="template-account-"] .yamuna-account-page,
          html body[class*="template-account-"] .yamuna-account-page *:not(svg):not(path):not(use),
          html body[class*="template-account-"] .account-page,
          html body[class*="template-account-"] .account-page *:not(svg):not(path):not(use) {
            font-family: "Raleway", sans-serif !important;
          }

          /* 2) Nuclear: every account content node = wine #4a1d3a (beats theme #000) */
          html body[class*="template-account-"] > .mt-4,
          html body[class*="template-account-"] > .mt-4 *:not(svg):not(path):not(use),
          html body[class*="template-account-"] .page-header,
          html body[class*="template-account-"] .page-header *:not(svg):not(path):not(use),
          html body[class*="template-account-"] .yamuna-account-page,
          html body[class*="template-account-"] .yamuna-account-page *:not(svg):not(path):not(use),
          html body[class*="template-account-"] .account-page,
          html body[class*="template-account-"] .account-page *:not(svg):not(path):not(use) {
            color: #4a1d3a !important;
          }

          /* 3) Pink accents #A31460 — links, status, icons (after wine so they win) */
          html body[class*="template-account-"] .yamuna-account-page a:not(.btn):not(.btn-primary),
          html body[class*="template-account-"] .account-page a:not(.btn):not(.btn-primary),
          html body[class*="template-account-"] .btn-link,
          html body[class*="template-account-"] .btn-link-primary,
          html body[class*="template-account-"] a.btn-link-primary,
          html body[class*="template-account-"] a.btn-link-primary strong,
          html body[class*="template-account-"] .yamuna-login-forgot,
          html body[class*="template-account-"] .text-primary,
          html body[class*="template-account-"] .pending,
          html body[class*="template-account-"] .pending *,
          html body[class*="template-account-"] .authorized,
          html body[class*="template-account-"] .authorized *,
          html body[class*="template-account-"] .yamuna-account-page [data-store="account-orders"] .col-7 .font-small strong,
          html body[class*="template-account-"] .svg-icon-primary,
          html body[class*="template-account-"] a.btn-link-primary svg,
          html body[class*="template-account-"] a.btn-link-primary .icon-inline {
            color: #a31460 !important;
            fill: #a31460 !important;
          }
          html body[class*="template-account-"] .yamuna-account-page a:not(.btn):not(.btn-primary):hover,
          html body[class*="template-account-"] .btn-link:hover,
          html body[class*="template-account-"] .btn-link-primary:hover,
          html body[class*="template-account-"] a.btn-link-primary:hover,
          html body[class*="template-account-"] .yamuna-login-forgot:hover {
            color: #6b0a3f !important;
            fill: #6b0a3f !important;
            opacity: 1 !important;
          }

          /* 4) Cenário 137: account CTAs = minicart COMPRAR (Raleway 16/600, BG #A31460) */
          html body[class*="template-account-"] .btn.btn-primary,
          html body[class*="template-account-"] a.btn.btn-primary,
          html body[class*="template-account-"] button.btn.btn-primary,
          html body[class*="template-account-"] .btn-primary,
          html body[class*="template-account-"] .btn.btn-primary.btn-small,
          html body[class*="template-account-"] a.btn.btn-primary.btn-small,
          html body[class*="template-account-"] .btn-primary.btn-small,
          html body[class*="template-account-"] .yamuna-login-submit,
          html body .yamuna-account-page .btn.btn-primary,
          html body .yamuna-account-page a.btn.btn-primary,
          html body .yamuna-account-page .btn.btn-primary.btn-small,
          html body .yamuna-account-page a.btn.btn-primary.btn-small,
          html body .yamuna-account-page .yamuna-login-submit {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            box-sizing: border-box !important;
            height: 40px !important;
            min-height: 40px !important;
            padding: 0 24px !important;
            border: 0 !important;
            border-radius: 999px !important;
            background: #a31460 !important;
            background-color: #a31460 !important;
            border-color: #a31460 !important;
            color: #fff !important;
            fill: #fff !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 16px !important;
            font-weight: 600 !important;
            letter-spacing: 0.04em !important;
            line-height: 1.2 !important;
            text-transform: uppercase !important;
            text-decoration: none !important;
            opacity: 1 !important;
            transition: background-color 0.2s ease, border-color 0.2s ease !important;
          }
          html body[class*="template-account-"] .btn.btn-primary.d-block,
          html body[class*="template-account-"] a.btn.btn-primary.d-block,
          html body[class*="template-account-"] .btn.btn-primary.w-100,
          html body[class*="template-account-"] a.btn.btn-primary.w-100,
          html body .yamuna-account-page .btn.btn-primary.d-block,
          html body .yamuna-account-page a.btn.btn-primary.d-block {
            display: flex !important;
            width: 100% !important;
          }
          html body[class*="template-account-"] .btn.btn-primary:hover,
          html body[class*="template-account-"] .btn.btn-primary:focus,
          html body[class*="template-account-"] a.btn.btn-primary:hover,
          html body[class*="template-account-"] a.btn.btn-primary:focus,
          html body[class*="template-account-"] button.btn.btn-primary:hover,
          html body[class*="template-account-"] button.btn.btn-primary:focus,
          html body[class*="template-account-"] .btn-primary:hover,
          html body[class*="template-account-"] .btn-primary:focus,
          html body[class*="template-account-"] .btn.btn-primary.btn-small:hover,
          html body[class*="template-account-"] a.btn.btn-primary.btn-small:hover,
          html body[class*="template-account-"] .yamuna-login-submit:hover,
          html body[class*="template-account-"] .yamuna-login-submit:focus,
          html body .yamuna-account-page .btn.btn-primary:hover,
          html body .yamuna-account-page .btn.btn-primary:focus,
          html body .yamuna-account-page a.btn.btn-primary:hover,
          html body .yamuna-account-page a.btn.btn-primary:focus,
          html body .yamuna-account-page .yamuna-login-submit:hover,
          html body .yamuna-account-page .yamuna-login-submit:focus {
            background: #6b0a3f !important;
            background-color: #6b0a3f !important;
            border-color: #6b0a3f !important;
            color: #fff !important;
            opacity: 1 !important;
          }
          html body[class*="template-account-"] .btn.btn-primary:active,
          html body[class*="template-account-"] a.btn.btn-primary:active,
          html body .yamuna-account-page .btn.btn-primary:active,
          html body .yamuna-account-page a.btn.btn-primary:active,
          html body .yamuna-account-page .yamuna-login-submit:active {
            background: #520731 !important;
            background-color: #520731 !important;
            border-color: #520731 !important;
            color: #fff !important;
            opacity: 1 !important;
          }

          /* Layout: Dados + Compras em coluna; cards de Dados em row ≥768px */
          html body[class*="template-account-"] .yamuna-account-page > .container {
            max-width: 1140px !important;
          }
          html body[class*="template-account-"] .yamuna-account-layout {
            display: flex !important;
            flex-direction: column !important;
            align-items: stretch !important;
            gap: 24px !important;
            width: 100% !important;
          }
          html body[class*="template-account-"] .yamuna-account-dados,
          html body[class*="template-account-"] .yamuna-account-orders {
            width: 100% !important;
            min-width: 0 !important;
          }
          html body[class*="template-account-"] .yamuna-dados-cards {
            display: flex !important;
            flex-direction: column !important;
            gap: 12px !important;
            width: 100% !important;
          }
          html body[class*="template-account-"] .yamuna-dados-card {
            flex: 1 1 auto !important;
            min-width: 0 !important;
            margin-bottom: 0 !important;
          }
          html body[class*="template-account-"] .yamuna-orders-grid {
            display: grid !important;
            grid-template-columns: 1fr !important;
            gap: 16px !important;
            width: 100% !important;
            margin: 0 !important;
          }
          html body[class*="template-account-"] .yamuna-order-item {
            min-width: 0 !important;
            width: 100% !important;
          }
          html body[class*="template-account-"] .yamuna-order-item .yamuna-order-card {
            width: 100% !important;
            margin-bottom: 0 !important;
            overflow: hidden !important;
          }
          @media (min-width: 768px) {
            html body[class*="template-account-"] .yamuna-dados-cards {
              flex-direction: row !important;
              align-items: stretch !important;
              gap: 20px !important;
            }
            html body[class*="template-account-"] .yamuna-dados-card {
              flex: 1 1 0 !important;
            }
            html body[class*="template-account-"] .yamuna-orders-grid {
              grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
              gap: 20px !important;
            }
            html body[class*="template-account-"] .yamuna-order-card .card-collapse-toggle {
              display: none !important;
            }
            html body[class*="template-account-"] .yamuna-order-card:not(.active) > .card-body,
            html body[class*="template-account-"] .yamuna-order-card:not(.active) > .card-footer {
              display: block !important;
            }
            html body[class*="template-account-"] .yamuna-order-card > .card-header,
            html body[class*="template-account-"] .yamuna-order-card > .card-header-collapse {
              padding: 14px 16px !important;
            }
          }

          /* Cenário 139+: accordion pedidos — esconde body (sem cortar header) */
          html body[class*="template-account-"] .yamuna-order-card,
          html body[class*="template-account-"] .yamuna-account-page .card.card-collapse,
          html body[class*="template-account-"] .account-page .card.card-collapse {
            height: auto !important;
            overflow: visible !important;
          }
          html body[class*="template-account-"] .yamuna-order-card:not(.active) > .card-body,
          html body[class*="template-account-"] .yamuna-order-card:not(.active) > .card-footer,
          html body[class*="template-account-"] .yamuna-account-page .card.card-collapse:not(.active) > .card-body,
          html body[class*="template-account-"] .yamuna-account-page .card.card-collapse:not(.active) > .card-footer {
            display: none !important;
          }

          /* Order card layout — textos em 1 linha */
          html body[class*="template-account-"] .yamuna-order-card > .card-header,
          html body[class*="template-account-"] .yamuna-order-card > .card-header-collapse {
            display: flex !important;
            align-items: center !important;
            min-height: 52px !important;
            padding: 12px 44px 12px 16px !important;
            background: #f6f5f6 !important;
            border-radius: 12px 12px 0 0 !important;
          }
          html body[class*="template-account-"] .yamuna-order-card:not(.active) > .card-header,
          html body[class*="template-account-"] .yamuna-order-card:not(.active) > .card-header-collapse {
            border-radius: 12px !important;
          }
          html body[class*="template-account-"] .yamuna-order-head {
            display: flex !important;
            align-items: center !important;
            flex-wrap: nowrap !important;
            gap: 10px !important;
            width: 100% !important;
            min-width: 0 !important;
            font-family: "Raleway", sans-serif !important;
          }
          html body[class*="template-account-"] .yamuna-order-title {
            flex: 1 1 auto !important;
            min-width: 0 !important;
            margin: 0 !important;
            color: #a31460 !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 16px !important;
            font-weight: 700 !important;
            line-height: 1.3 !important;
            white-space: nowrap !important;
            overflow: hidden !important;
            text-overflow: ellipsis !important;
            text-decoration: none !important;
          }
          html body[class*="template-account-"] .yamuna-order-title strong {
            font-weight: 700 !important;
            color: inherit !important;
            font-size: inherit !important;
          }
          html body[class*="template-account-"] .yamuna-order-date {
            flex: 0 0 auto !important;
            color: #4a1d3a !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 14px !important;
            font-weight: 500 !important;
            white-space: nowrap !important;
            opacity: 0.85 !important;
          }
          html body[class*="template-account-"] .yamuna-order-card .card-collapse-toggle {
            top: 50% !important;
            right: 8px !important;
            transform: translateY(-50%) !important;
            padding: 8px !important;
          }
          html body[class*="template-account-"] .yamuna-order-card .card-collapse-toggle.active {
            transform: translateY(-50%) rotate(180deg) !important;
          }
          html body[class*="template-account-"] .yamuna-order-card > .card-body {
            padding: 16px !important;
          }
          html body[class*="template-account-"] .yamuna-order-card > .card-footer {
            padding: 0 16px 16px !important;
            background: transparent !important;
            border: 0 !important;
          }
          html body[class*="template-account-"] .yamuna-order-body {
            display: flex !important;
            flex-direction: column !important;
            gap: 14px !important;
            font-family: "Raleway", sans-serif !important;
          }
          html body[class*="template-account-"] .yamuna-order-statuses {
            display: flex !important;
            flex-direction: column !important;
            gap: 8px !important;
            width: 100% !important;
          }
          html body[class*="template-account-"] .yamuna-order-status {
            display: flex !important;
            align-items: center !important;
            flex-wrap: nowrap !important;
            gap: 6px !important;
            margin: 0 !important;
            color: #4a1d3a !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 15px !important;
            line-height: 1.35 !important;
            white-space: nowrap !important;
          }
          html body[class*="template-account-"] .yamuna-order-status .icon-inline {
            flex: 0 0 auto !important;
            width: 16px !important;
            height: 16px !important;
            fill: #a31460 !important;
          }
          html body[class*="template-account-"] .yamuna-order-bottom {
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            gap: 12px !important;
            width: 100% !important;
          }
          html body[class*="template-account-"] .yamuna-order-summary {
            flex: 1 1 auto !important;
            min-width: 0 !important;
          }
          html body[class*="template-account-"] .yamuna-order-total {
            margin: 0 0 4px !important;
            color: #4a1d3a !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 16px !important;
            font-weight: 700 !important;
            white-space: nowrap !important;
          }
          html body[class*="template-account-"] .yamuna-order-detail {
            color: #a31460 !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            white-space: nowrap !important;
          }
          html body[class*="template-account-"] .yamuna-order-thumb {
            position: relative !important;
            flex: 0 0 72px !important;
            width: 72px !important;
            height: 72px !important;
            border-radius: 8px !important;
            overflow: hidden !important;
            background: #f6f5f6 !important;
          }
          html body[class*="template-account-"] .yamuna-order-thumb-img {
            display: block !important;
            width: 100% !important;
            height: 100% !important;
            object-fit: cover !important;
          }
          html body[class*="template-account-"] .yamuna-order-card .yamuna-order-cta,
          html body[class*="template-account-"] .yamuna-order-card .card-footer .btn.btn-primary,
          html body[class*="template-account-"] .yamuna-order-card .card-footer a.btn.btn-primary {
            white-space: nowrap !important;
            overflow: hidden !important;
            text-overflow: clip !important;
            font-size: 12px !important;
            letter-spacing: 0.02em !important;
            height: 40px !important;
            min-height: 40px !important;
            padding: 0 12px !important;
            width: 100% !important;
            max-width: 100% !important;
            box-sizing: border-box !important;
          }
          /* Badge quantidade: texto branco (não herda vinho) */
          html body[class*="template-account-"] .yamuna-order-thumb-pill,
          html body[class*="template-account-"] .yamuna-order-thumb .yamuna-order-thumb-pill {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            min-width: 22px !important;
            height: 22px !important;
            padding: 0 6px !important;
            border-radius: 999px !important;
            background: #4a1d3a !important;
            background-color: #4a1d3a !important;
            color: #fff !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 11px !important;
            font-weight: 700 !important;
            line-height: 1 !important;
            z-index: 2 !important;
          }
          @media (min-width: 768px) {
            html body[class*="template-account-"] .yamuna-order-card > .card-header,
            html body[class*="template-account-"] .yamuna-order-card > .card-header-collapse {
              padding: 14px 16px !important;
            }
            html body[class*="template-account-"] .yamuna-order-status {
              font-size: 16px !important;
            }
            html body[class*="template-account-"] .yamuna-order-thumb {
              flex-basis: 88px !important;
              width: 88px !important;
              height: 88px !important;
            }
            html body[class*="template-account-"] .yamuna-order-card .yamuna-order-cta,
            html body[class*="template-account-"] .yamuna-order-card .card-footer .btn.btn-primary,
            html body[class*="template-account-"] .yamuna-order-card .card-footer a.btn.btn-primary {
              font-size: 14px !important;
              height: 40px !important;
              min-height: 40px !important;
              padding: 0 24px !important;
            }
          }

          /* 5) Cenário 135: tipografia Minha Conta
             Mobile — títulos 20px, subtítulos 18px, textos 16px
             Desktop — títulos 24px, subtítulos e textos 16px */
          html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header h1,
          html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .h1,
          html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .h2,
          html body[class*="template-account-"] .yamuna-account-page .yamuna-account-section-title,
          html body[class*="template-account-"] .yamuna-account-page h4.yamuna-account-section-title,
          html body[class*="template-account-"] .yamuna-account-page .h4.yamuna-account-section-title {
            font-size: 20px !important;
            line-height: 1.3 !important;
          }
          html body[class*="template-account-"] .yamuna-account-page .box > h6,
          html body[class*="template-account-"] .yamuna-account-page .box h6,
          html body[class*="template-account-"] .account-page .box > h6,
          html body[class*="template-account-"] .account-page .box h6,
          html body[class*="template-account-"] .yamuna-account-page .card-header h4,
          html body[class*="template-account-"] .yamuna-account-page .card-header h4 a,
          html body[class*="template-account-"] .yamuna-account-page .card-header h4 strong,
          html body[class*="template-account-"] .account-page .card-header h4,
          html body[class*="template-account-"] .account-page .card-header h4 a,
          html body[class*="template-account-"] .account-page .card-header h4 strong {
            font-size: 18px !important;
            line-height: 1.35 !important;
          }
          html body[class*="template-account-"] .yamuna-account-page .font-small,
          html body[class*="template-account-"] .yamuna-account-page .box p,
          html body[class*="template-account-"] .yamuna-account-page .box p *,
          html body[class*="template-account-"] .yamuna-account-page .box .font-small,
          html body[class*="template-account-"] .yamuna-account-page .box .font-small *,
          html body[class*="template-account-"] .yamuna-account-page .card-body .font-small,
          html body[class*="template-account-"] .yamuna-account-page .card-body .font-small *,
          html body[class*="template-account-"] .yamuna-account-page .card-body p,
          html body[class*="template-account-"] .yamuna-account-page .card-body p *,
          html body[class*="template-account-"] .yamuna-account-page .card-header small,
          html body[class*="template-account-"] .yamuna-account-page .card-body h4.mt-4,
          html body[class*="template-account-"] .yamuna-account-page .card-body h4.mt-4 strong,
          html body[class*="template-account-"] .account-page .font-small,
          html body[class*="template-account-"] .account-page .box p,
          html body[class*="template-account-"] .account-page .box p *,
          html body[class*="template-account-"] .account-page .card-body .font-small,
          html body[class*="template-account-"] .account-page .card-body .font-small *,
          html body[class*="template-account-"] .account-page .card-body p,
          html body[class*="template-account-"] .account-page .card-body p *,
          html body[class*="template-account-"] .account-page .card-header small,
          html body[class*="template-account-"] .account-page .card-body h4.mt-4,
          html body[class*="template-account-"] .account-page .card-body h4.mt-4 strong {
            font-size: 16px !important;
            line-height: 1.45 !important;
          }
          @media (min-width: 768px) {
            html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header h1,
            html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .h1,
            html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .h2,
            html body[class*="template-account-"] .yamuna-account-page .yamuna-account-section-title,
            html body[class*="template-account-"] .yamuna-account-page h4.yamuna-account-section-title,
            html body[class*="template-account-"] .yamuna-account-page .h4.yamuna-account-section-title {
              font-size: 24px !important;
            }
            html body[class*="template-account-"] .yamuna-account-page .box > h6,
            html body[class*="template-account-"] .yamuna-account-page .box h6,
            html body[class*="template-account-"] .account-page .box > h6,
            html body[class*="template-account-"] .account-page .box h6,
            html body[class*="template-account-"] .yamuna-account-page .card-header h4,
            html body[class*="template-account-"] .yamuna-account-page .card-header h4 a,
            html body[class*="template-account-"] .yamuna-account-page .card-header h4 strong,
            html body[class*="template-account-"] .account-page .card-header h4,
            html body[class*="template-account-"] .account-page .card-header h4 a,
            html body[class*="template-account-"] .account-page .card-header h4 strong {
              font-size: 16px !important;
            }
          }

          /* Cenário 157: Total do pedido — alinhado à esquerda (como Frete/Subtotal), Raleway 16px */
          html body[class*="template-account-"] .yamuna-order-detail-total,
          html body[class*="template-account-"] .yamuna-order-detail-total strong,
          html body[class*="template-account-"] .yamuna-account-page h3.yamuna-order-detail-total,
          html body[class*="template-account-"] .yamuna-account-page h3.yamuna-order-detail-total *,
          html body[class*="template-account-"] .account-page h3.yamuna-order-detail-total,
          html body[class*="template-account-"] .account-page h3.yamuna-order-detail-total * {
            text-align: left !important;
            font-family: "Raleway", sans-serif !important;
            font-size: 16px !important;
            line-height: 1.45 !important;
            color: #4a1d3a !important;
          }

          /* Cenário 158: breadcrumb duplicado em desk — esconde bloco solto fora do page-header */
          html body[class*="template-account-"]:not(.yamuna-account-auth) > .mt-4 > section.container .breadcrumbs,
          html body[class*="template-account-"]:not(.yamuna-account-auth) section.container.mb-4.text-center > .row > .col-12 > .breadcrumbs,
          html body[class*="template-account-"]:not(.yamuna-account-auth) .page-header .breadcrumbs ~ .breadcrumbs {
            display: none !important;
          }
        </style>
        <script id="yamuna-account-wine-force-136">
        (function () {
          var body = document.body;
          if (!body || body.className.indexOf('template-account-') === -1) return;
          if (body.classList.contains('yamuna-account-auth')) return;
          var WINE = '#4a1d3a';
          var PINK = '#a31460';
          var WHITE = '#fff';
          function isAccent(el) {
            if (el.matches(
              'a:not(.btn):not(.btn-primary), .btn-link, .btn-link-primary, a.btn-link-primary, .pending, .authorized, .text-primary, .yamuna-login-forgot, .svg-icon-primary'
            )) return true;
            if (el.closest('a:not(.btn):not(.btn-primary), .btn-link, .btn-link-primary, .pending, .authorized, .text-primary, .yamuna-login-forgot')) return true;
            return false;
          }
          function isPrimaryBtn(el) {
            return el.matches('.btn-primary, .btn.btn-primary, a.btn.btn-primary, button.btn.btn-primary, .yamuna-login-submit');
          }
          function isThumbPill(el) {
            return el.matches('.yamuna-order-thumb-pill') || !!el.closest('.yamuna-order-thumb-pill');
          }
          function styleThumbPill(el) {
            el.style.setProperty('background', '#4a1d3a', 'important');
            el.style.setProperty('background-color', '#4a1d3a', 'important');
            el.style.setProperty('color', WHITE, 'important');
            el.style.setProperty('font-family', 'Raleway, sans-serif', 'important');
            el.style.setProperty('font-size', '11px', 'important');
            el.style.setProperty('font-weight', '600', 'important');
          }
          function stylePrimaryBtn(el) {
            el.style.setProperty('display', el.classList.contains('d-block') || el.classList.contains('w-100') ? 'flex' : 'inline-flex', 'important');
            el.style.setProperty('align-items', 'center', 'important');
            el.style.setProperty('justify-content', 'center', 'important');
            el.style.setProperty('box-sizing', 'border-box', 'important');
            el.style.setProperty('height', '40px', 'important');
            el.style.setProperty('min-height', '40px', 'important');
            el.style.setProperty('padding', '0 24px', 'important');
            el.style.setProperty('border', '0', 'important');
            el.style.setProperty('border-radius', '999px', 'important');
            el.style.setProperty('background', '#a31460', 'important');
            el.style.setProperty('background-color', '#a31460', 'important');
            el.style.setProperty('border-color', '#a31460', 'important');
            el.style.setProperty('color', WHITE, 'important');
            el.style.setProperty('font-family', 'Raleway, sans-serif', 'important');
            el.style.setProperty('font-size', '16px', 'important');
            el.style.setProperty('font-weight', '600', 'important');
            el.style.setProperty('letter-spacing', '0.04em', 'important');
            el.style.setProperty('line-height', '1.2', 'important');
            el.style.setProperty('text-transform', 'uppercase', 'important');
            el.style.setProperty('opacity', '1', 'important');
          }
          function paint(root) {
            if (!root) return;
            root.style.setProperty('color', WINE, 'important');
            root.style.setProperty('font-family', 'Raleway, sans-serif', 'important');
            var nodes = root.querySelectorAll('*:not(svg):not(path):not(use):not(circle):not(rect)');
            for (var i = 0; i < nodes.length; i++) {
              var el = nodes[i];
              el.style.setProperty('font-family', 'Raleway, sans-serif', 'important');
              if (isPrimaryBtn(el)) {
                stylePrimaryBtn(el);
                continue;
              }
              if (isThumbPill(el)) {
                styleThumbPill(el);
                continue;
              }
              if (isAccent(el)) {
                el.style.setProperty('color', PINK, 'important');
                continue;
              }
              el.style.setProperty('color', WINE, 'important');
            }
          }
          function run() {
            paint(document.querySelector('.yamuna-account-page'));
            paint(document.querySelector('.account-page'));
            paint(document.querySelector('.page-header'));
            var mt = document.querySelector('body > .mt-4');
            if (mt) paint(mt);
          }
          run();
          if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', run);
          window.addEventListener('load', run);
        })();
        </script>

        {% include "snipplets/yamuna-wishlist.tpl" %}

    </body>
</html>
