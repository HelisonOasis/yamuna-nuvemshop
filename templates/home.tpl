{% set use_yamuna_prod_hero = true %}
{% set has_main_slider = use_yamuna_prod_hero or (settings.slider and settings.slider is not empty) %}
{% set has_mobile_slider = use_yamuna_prod_hero or (settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty) %}
{% set has_informative_banners = settings.banner_services and (settings.banner_services_01_title or settings.banner_services_02_title or settings.banner_services_03_title or settings.banner_services_04_title or settings.banner_services_05_title) %}
{% set has_category_banners =  settings.banner_01_show or settings.banner_02_show or settings.banner_03_show %}
{% set has_welcome =  settings.welcome_message %}
{% set has_institutional_message = settings.institutional_message or settings.institutional_text %}
{% set has_brands = settings.brands and settings.brands is not empty %}
{% set has_video = settings.video_embed %}
{% set has_instafeed = store.instagram and settings.show_instafeed and store.hasInstagramToken() %}
{% set has_promotional_banners = settings.banner_promotional_01_show or settings.banner_promotional_02_show or settings.banner_promotional_03_show %}
{% set has_image_and_text_module = settings.module and settings.module is not empty %}

{% set show_help = not (has_main_slider or has_mobile_slider or has_informative_banners or has_category_banners or has_brands or has_video or has_instafeed or has_promotional_banners or has_image_and_text_module or has_institutional_message) and not has_products and not params.preview %}

{% set show_component_help = params.preview %}

{# This scoped fallback keeps the mobile module aligned while the async stylesheet is refreshed by the CDN. #}
<style>
  html,
  body,
  body.template-home,
  body.template-home .background-main {
    background-color: #fff !important;
  }

  /* Keep the first product rail stable while Swiper is being initialized. */
  @media (max-width: 767px) {
    body.template-home [data-store^="home-products-"].section-featured-home .js-swiper-featured:not(.swiper-container-initialized) .swiper-slide {
      width: 100% !important;
      flex: 0 0 100% !important;
    }
    body.template-home [data-store^="home-products-"].section-featured-home .js-swiper-featured:not(.swiper-container-initialized) {
      overflow: hidden !important;
    }
  }

  @media (min-width: 768px) and (max-width: 1199px) {
    body.template-home [data-store^="home-products-"].section-featured-home .js-swiper-featured:not(.swiper-container-initialized) .swiper-slide {
      width: 50% !important;
      flex: 0 0 50% !important;
    }
    body.template-home [data-store^="home-products-"].section-featured-home .js-swiper-featured:not(.swiper-container-initialized) {
      overflow: hidden !important;
    }
  }

  @media (min-width: 1200px) {
    body.template-home [data-store^="home-products-"].section-featured-home .js-swiper-featured:not(.swiper-container-initialized) .swiper-slide {
      width: 33.333333% !important;
      flex: 0 0 33.333333% !important;
    }
    body.template-home [data-store^="home-products-"].section-featured-home .js-swiper-featured:not(.swiper-container-initialized) {
      overflow: hidden !important;
    }
  }

{# Mobile only — mirror desktop: cream band + benefits wash. #}
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

  body.template-home [data-store="banner-services"] .section-informative-banners,
  body.template-home .section-informative-banners {
    background: rgba(192, 187, 195, 0.2) !important;
    background-color: rgba(192, 187, 195, 0.2) !important;
  }
}

  /* Keep the mobile hero behind its persistent header while the async CSS is cached. */
  @media (max-width: 1023px) {
    body.template-home .head-main,
    body.template-home .head-main.head-fix {
      position: fixed !important;
      top: 0 !important;
      right: 0 !important;
      left: 0 !important;
      z-index: 1050 !important;
      height: 80px !important;
      padding-top: 0 !important;
      overflow: visible !important;
    }

    /* Cenario 127: smooth & soft white fade transition under mobile header. */
    body.template-home .head-main {
      overflow: visible !important;
    }

    body.template-home .head-main::after {
      position: absolute !important;
      top: 100% !important;
      right: 0 !important;
      left: 0 !important;
      z-index: 10 !important;
      display: block !important;
      width: 100% !important;
      height: 70px !important;
      content: '' !important;
      pointer-events: none !important;
      background: linear-gradient(180deg, rgba(255, 255, 255, 1.0) 0%, rgba(255, 255, 255, 0.85) 25%, rgba(255, 255, 255, 0.55) 50%, rgba(255, 255, 255, 0.25) 75%, rgba(255, 255, 255, 0) 100%) !important;
      transition: opacity 0.9s cubic-bezier(0.22, 0.61, 0.36, 1) !important;
    }

    html.yamuna-header-scrolled body.template-home .head-main::after {
      opacity: 0 !important;
    }

    html:has(#nav-hamburger.modal-show) body.template-home .head-main::after,
    body.template-home .head-main:has(.yamuna-mobile-search.is-open)::after {
      display: none !important;
      height: 0 !important;
      content: none !important;
      background: none !important;
      opacity: 0 !important;
    }

    body.template-home .head-main .yamuna-header-mobile,
    body.template-home .head-main .yamuna-mobile-search {
      position: relative;
      z-index: 2;
    }

    /* Cenario 154: open search above header fade */
    body.template-home .head-main .yamuna-mobile-search.is-open {
      z-index: 20 !important;
    }
  }

  [data-store^="home-products-"].section-featured-home .yamuna-home-products > .col-12 > .h1 {
    margin-bottom: 24px !important;
  }

  @media (min-width: 768px) {
    [data-store^="home-products-"].section-featured-home .yamuna-home-products > .col-12 > .h1 {
      margin-bottom: 32px !important;
    }
  }

  @media (min-width: 768px) {
    .section-banners-home[data-store="home-banner-categories"] [class*="js-category-banner-title-"] {
      color: #fff !important;
      font-family: 'Dosis', sans-serif !important;
      font-size: 36px !important;
      font-weight: 600 !important;
      line-height: 1.28 !important;
    }
  }

  /* Keep the two product CTAs below the price while the compiled CSS refreshes. */
  @media (min-width: 768px) {
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image {
      flex: 1 1 auto;
      height: auto !important;
      min-height: 180px;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-description {
      padding: 10px 0 !important;
    }
  }

  /* Shared product-card carousel — match prod: 3 cards, 32px gap, no peeks */
  @media (min-width: 1200px) {
    [data-store^="home-products-"].section-featured-home .container {
      max-width: 1312px !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products > .col-12 > .h1 {
      margin-bottom: 32px !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-container {
      overflow: hidden !important;
      padding: 0 !important;
      margin: 0 !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-slide {
      height: auto !important;
      min-height: 539px !important;
      padding: 0 !important;
      box-sizing: border-box !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .js-item-product,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .js-product-container {
      display: flex !important;
      flex-direction: column !important;
      height: 100% !important;
      min-height: 0 !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item {
      overflow: visible !important;
      margin-bottom: 0 !important;
      padding: 0 16px 16px !important;
      border-radius: 8px;
      background: #fff;
      box-sizing: border-box !important;
      box-shadow: 0 2px 12px rgba(57, 55, 71, 0.1);
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image {
      flex: 1 1 auto !important;
      min-height: 180px !important;
      height: auto !important;
      margin: 16px 0 0 !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-description {
      flex: 0 0 auto !important;
      padding: 10px 0 !important;
      text-align: left !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-price-row {
      display: flex !important;
      flex-direction: column !important;
      align-items: flex-start !important;
      gap: 0 !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions {
      position: static !important;
      flex: 0 0 auto !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      width: 100% !important;
      margin: 0 !important;
      padding: 0 !important;
      transform: none !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions .btn {
      width: 100% !important;
      min-height: 40px !important;
      height: 40px !important;
      padding: 0 24px !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions .btn.mb-2,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions .btn.mb-3 {
      margin-bottom: 8px !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions .btn:last-child,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions .yamuna-home-spot-buy-three {
      margin-bottom: 0 !important;
    }
  }

  @media (max-width: 1023px) {
    .section-yamuna-category-slider {
      padding-bottom: 42px !important;
    }

    /* The platform's generated product-card CSS adds this image frame after
       the critical stylesheet. Keep Yamuna's mobile spot borderless. */
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image {
      border: 0 !important;
    }

    [data-store="home-image-text-module"] {
      padding: 0 16px;
    }

    [data-store="home-image-text-module"] .js-banner-container {
      width: 100% !important;
      grid-template-columns: 1fr;
      gap: 32px;
    }

    [data-store="home-image-text-module"] .js-textbanner .row {
      border-radius: 24px;
      overflow: hidden;
    }

    [data-store="home-image-text-module"] .js-textbanner-text {
      top: auto;
      right: 0;
      bottom: 0;
      left: 0 !important;
      width: 100% !important;
      max-width: 100% !important;
      height: 48px;
      min-height: 48px;
      padding: 8px 16px;
      border-radius: 24px;
      box-sizing: border-box;
    }

    [data-store="home-image-text-module"] .textbanner-title {
      font-family: 'Raleway', sans-serif;
      font-size: 14px;
      font-weight: 600;
      line-height: 1;
    }

    [data-store="home-image-text-module"] .js-textbanner-text .btn {
      width: 120px;
      min-width: 120px;
      max-width: 120px;
      height: 32px;
      min-height: 32px;
      padding: 0 12px;
      font-family: 'Raleway', sans-serif;
      font-size: 14px;
      font-weight: 600;
    }
  }

  /* Cenario 117: module bar label + CTA fit on narrow phones (320-375). */
  @media (min-width: 320px) and (max-width: 375px) {
    [data-store="home-image-text-module"] .js-textbanner-text {
      gap: 6px;
      padding: 6px 10px;
    }

    [data-store="home-image-text-module"] .textbanner-title {
      min-width: 0;
      flex: 1 1 auto;
      padding-right: 4px;
      font-size: 11px !important;
      line-height: 1.15 !important;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    [data-store="home-image-text-module"] .js-textbanner-text .btn {
      width: 96px !important;
      min-width: 96px !important;
      max-width: 96px !important;
      flex: 0 0 96px;
      padding: 0 8px !important;
      font-size: 11px !important;
    }
  }

  @media (max-width: 767px) {
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-slide {
      height: 460px !important;
      padding: 0 !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .js-product-container {
      display: flex !important;
      flex-direction: column !important;
      height: 100% !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item {
      padding: 0 24px 22px !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image {
      flex: 1 1 auto !important;
      min-height: 140px !important;
      height: auto !important;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions {
      position: static !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      margin: 0 !important;
      padding: 0 !important;
    }

    [data-store="home-image-text-module"] .js-home-modules.section-banners-home {
      margin-bottom: 0 !important;
    }
  }

  @media (min-width: 768px) and (max-width: 1023px) {
    [data-store="home-image-text-module"] .js-banner-container {
      gap: 32px;
    }

    [data-store="home-image-text-module"] .js-textbanner-text {
      height: 48px;
      min-height: 48px;
      padding: 8px 16px;
    }

    [data-store="home-image-text-module"] .textbanner-title {
      font-family: 'Raleway', sans-serif;
      font-size: 14px;
      font-weight: 600;
    }

    [data-store="home-image-text-module"] .js-textbanner-text .btn {
      width: 120px;
      min-width: 120px;
      height: 32px;
      min-height: 32px;
      font-family: 'Raleway', sans-serif;
      font-size: 14px;
    }
  }

  /* Product carousels: keep side gutters at 768/1024 (row + col-12.p-0
     cancel .container padding; max-width:1312 only helps above ~1312px). */
  @media (min-width: 768px) and (max-width: 1399px) {
    body.template-home .section-featured-home,
    body.template-home [data-store^="home-products-"].section-featured-home,
    [data-store^="home-products-"].section-featured-home {
      padding-left: 32px !important;
      padding-right: 32px !important;
      --yamuna-home-rail: max(20px, calc((100vw - 1280px) / 2));
      --yamuna-home-section-pad: 32px;
      --yamuna-home-container-inset: 0px;
    }

    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-container {
      padding-left: 8px !important;
      padding-right: 8px !important;
    }

    body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev {
      left: calc(var(--yamuna-home-rail) - var(--yamuna-home-section-pad) - var(--yamuna-home-container-inset)) !important;
      right: auto !important;
    }

    body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next {
      right: calc(var(--yamuna-home-rail) - var(--yamuna-home-section-pad) - var(--yamuna-home-container-inset)) !important;
      left: auto !important;
    }
  }

  @media (min-width: 1400px) {
    body.template-home [data-store^="home-products-"].section-featured-home,
    [data-store^="home-products-"].section-featured-home {
      --yamuna-home-rail: max(20px, calc((100vw - 1280px) / 2));
      --yamuna-home-section-pad: 0px;
      --yamuna-home-container-inset: max(0px, calc((100vw - 1312px) / 2));
    }

    body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev {
      left: calc(var(--yamuna-home-rail) - var(--yamuna-home-section-pad) - var(--yamuna-home-container-inset)) !important;
      right: auto !important;
    }

    body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next,
    [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next {
      right: calc(var(--yamuna-home-rail) - var(--yamuna-home-section-pad) - var(--yamuna-home-container-inset)) !important;
      left: auto !important;
    }
  }

  /* perf 2026-10-21: skip rendering of below-the-fold home sections until they near the viewport.
     Same look after scroll; "auto" keeps the real height once rendered. */
  body.template-home [data-store="home-products-new"],
  body.template-home [data-store="home-products-sale"] { content-visibility: auto; contain-intrinsic-size: auto 640px; }
  body.template-home [data-store="home-banner-categories"],
  body.template-home [data-store="home-newsletter"] { content-visibility: auto; contain-intrinsic-size: auto 500px; }
  body.template-home [data-store="home-blog"] { content-visibility: auto; contain-intrinsic-size: auto 690px; }
  body.template-home [data-store="home-instagram-placeholder"] { content-visibility: auto; contain-intrinsic-size: auto 570px; }
  body.template-home [data-store="home-testimonials"] { content-visibility: auto; contain-intrinsic-size: auto 450px; }
</style>

{% if show_component_help %}
	{% include "snipplets/svg/empty-placeholders.tpl" %}
{% endif %}


{#  **** Features Order ****  #}
{% set newArray = [] %}

<div class="js-home-sections-container">
	{% for i in 0..14 %}
		{% set section = 'home_order_position_' ~ i %}
		{% set section_select = attribute(settings,"#{section}") %}

		{% if section_select not in newArray and section_select not in ['instafeed', 'newsletter', 'promotional', 'sale', 'new', 'products', 'modules'] %}
			{% include 'snipplets/home/home-section-switch.tpl' %}
			{% set newArray = newArray|merge([section_select]) %}

			{# Cenario 117: after benefits → Mais vendidos first, then categories + dual banners. #}
			{% if section_select == 'informatives' %}
				{% if 'products' not in newArray %}
					{% set section_select = 'products' %}
					{% include 'snipplets/home/home-section-switch.tpl' %}
					{% set newArray = newArray|merge(['products']) %}
				{% endif %}

				{% include 'snipplets/home/home-category-slider.tpl' %}

				{% if 'modules' not in newArray %}
					{% set section_select = 'modules' %}
					{% include 'snipplets/home/home-section-switch.tpl' %}
					{% set newArray = newArray|merge(['modules']) %}
				{% endif %}

				{# Brand statement separates the first and second product carousels. #}
				{% include 'snipplets/home/home-information-banner.tpl' %}
				{% set newArray = newArray|merge(['yamuna_information']) %}

				{% if 'new' not in newArray %}
					{% set section_select = 'new' %}
					{% include 'snipplets/home/home-section-switch.tpl' %}
					{% set newArray = newArray|merge(['new']) %}
				{% endif %}

				{% if 'sale' not in newArray %}
					{% set section_select = 'sale' %}
					{% include 'snipplets/home/home-section-switch.tpl' %}
					{% set newArray = newArray|merge(['sale']) %}
				{% endif %}
			{% endif %}

		{% endif %}
	{% endfor %}

	{# Fallback if informatives was not in home order. #}
	{% if 'products' not in newArray or 'new' not in newArray or 'sale' not in newArray or 'modules' not in newArray %}
		{% if 'products' not in newArray %}
			{% set section_select = 'products' %}
			{% include 'snipplets/home/home-section-switch.tpl' %}
			{% set newArray = newArray|merge(['products']) %}
		{% endif %}
		{% if 'modules' not in newArray %}
			{% set section_select = 'modules' %}
			{% include 'snipplets/home/home-section-switch.tpl' %}
			{% set newArray = newArray|merge(['modules']) %}
		{% endif %}
		{% if 'yamuna_information' not in newArray %}
			{% include 'snipplets/home/home-information-banner.tpl' %}
			{% set newArray = newArray|merge(['yamuna_information']) %}
		{% endif %}
		{% if 'new' not in newArray %}
			{% set section_select = 'new' %}
			{% include 'snipplets/home/home-section-switch.tpl' %}
			{% set newArray = newArray|merge(['new']) %}
		{% endif %}
		{% if 'sale' not in newArray %}
			{% set section_select = 'sale' %}
			{% include 'snipplets/home/home-section-switch.tpl' %}
			{% set newArray = newArray|merge(['sale']) %}
		{% endif %}
	{% endif %}

	{% include 'snipplets/home/home-blog.tpl' %}

	{# Show the native Instagram feed here once its token is configured. #}
	{% if has_instafeed %}
		{% set section_select = 'instafeed' %}
		{% include 'snipplets/home/home-section-switch.tpl' %}
	{% else %}
		{% include 'snipplets/home/home-content-placeholders.tpl' with {'placeholder': 'instagram'} %}
	{% endif %}

	{# Promotional banners stay after the blog and Instagram sections. #}
	{% set section_select = 'promotional' %}
	{% include 'snipplets/home/home-section-switch.tpl' %}

	{# Static customer testimonials migrated from the Wake storefront. #}
	{% include 'snipplets/home/home-testimonials.tpl' %}

	{% set section_select = 'newsletter' %}
	{% include 'snipplets/home/home-section-switch.tpl' %}

	{#  **** Hidden Sections ****  #}
	{% if show_component_help %}
		<div style="display:none">
			{% for section_select in ['slider', 'welcome', 'products', 'informatives', 'categories', 'promotional', 'brands', 'new', 'modules', 'video', 'sale', 'instafeed', 'newsletter', 'institutional'] %}
				{% if section_select not in newArray %}
					{% include 'snipplets/home/home-section-switch.tpl' %}
				{% endif %}
			{% endfor %}
		</div>
	{% endif %}
</div>

{% if settings.home_promotional_popup %}
	{% include 'snipplets/home/home-popup.tpl' %}
{% endif %}

{% include 'snipplets/home/home-migration-popup.tpl' %}

