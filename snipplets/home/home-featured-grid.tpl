{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set featured_products = featured_products | default(false) %}
{% set new_products = new_products | default(false) %}
{% set sale_products = sale_products | default(false) %}

{# Check if slider is used #}

{% set has_featured_products_and_slider = featured_products and settings.featured_products_format != 'grid' %}
{% set has_new_products_and_slider = new_products and settings.new_products_format != 'grid' %}
{% set has_sale_products_and_slider = sale_products and settings.sale_products_format != 'grid' %}
{% set use_slider = has_featured_products_and_slider or has_new_products_and_slider or has_sale_products_and_slider %}

{% if featured_products %}
    {% set sections_products = sections.primary.products %}
    {% set section_name = 'primary' %}
    {% set highlighted_products_setting_name = 'featured' %}
    {% set section_title = 'Os mais vendidos' %}
    {% set section_format = settings.featured_products_format %}
{% endif %}
{% if new_products %}
    {% set sections_products = sections.new.products %}
    {% set section_name = 'new' %}
    {% set highlighted_products_setting_name = 'new' %}
    {% set section_title = 'Promoções' %}
    {% set section_format = settings.new_products_format %}
{% endif %}
{% if sale_products %}
    {% set sections_products = sections.sale.products %}
    {% set section_name = 'sale' %}
    {% set highlighted_products_setting_name = 'sale' %}
    {% set section_title = 'Encontre o que ama' %}
    {% set section_format = settings.sale_products_format %}
{% endif %}

<div class="container">
    <div class="row yamuna-home-products js-products-{{ highlighted_products_setting_name }}-container" data-format="{{ section_format }}" data-desktop-columns="3">
        
        <div class="col-12 text-center">
            <h2 class="h1 js-products-{{ highlighted_products_setting_name }}-title {% if settings.theme_rounded %}text-primary{% endif %}" {% if not section_title %}style="display: none"{% endif %}>{{ section_title }}</h2>
        </div>

        {% if use_slider %}
            <div class="col-12 p-0">
                <div class="js-swiper-{{ highlighted_products_setting_name }} swiper-container">
                    <div class="swiper-wrapper">
        {% endif %}

        {% for product in sections_products %}
            {% if use_slider %}
                {% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'section_name': section_name} %}
            {% else %}
                {% include 'snipplets/grid/item.tpl' with {'section_name': section_name} %}
            {% endif %}
        {% endfor %}

        {% if use_slider %}
                    </div>
                </div>
                <div class="js-swiper-{{ highlighted_products_setting_name }}-pagination products-carousel-pagination swiper-pagination"></div>
            </div>
        {% endif %}

        {% if show_help %}
            {% for i in 1..4 %}
                {% if loop.index % 4 == 1 %}
                    <div class="grid-row">
                {% endif %}

                <div class="span3">
                    <div class="item">
                        <div class="item-image-container">
                            <a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                        </div>
                        <div class="item-info-container">
                            <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                            <div class="price">{{"$0.00" | translate}}</div>
                        </div>
                    </div>
                </div>

                {% if loop.index % 4 == 0 or loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        {% endif %}

        {% if use_slider %}
            <button type="button" class="js-swiper-{{ highlighted_products_setting_name }}-prev swiper-button-prev svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}" aria-label="Produto anterior">
                <svg class="yamuna-product-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <polyline points="15 6 9 12 15 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
            <button type="button" class="js-swiper-{{ highlighted_products_setting_name }}-next swiper-button-next svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}" aria-label="Próximo produto">
                <svg class="yamuna-product-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <polyline points="9 6 15 12 9 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
        {% endif %}
    </div>
</div>

{# Cenario 096: cards da home no mobile ficavam cinza/demoravam. As fotos saiam com loading="lazy" e sem sizes (o navegador baixava a versao grande). Carrega na hora e limita o tamanho pedido. #}
<script>
/* yamuna-home-cards-eager */
(function () {
  function tune() {
    var imgs = document.querySelectorAll('.yamuna-home-products .js-item-image');
    Array.prototype.forEach.call(imgs, function (img, i) {
      var isSecondary = img.classList.contains('item-image-secondary') || img.classList.contains('js-product-item-secondary-image-private');
      /* perf 2026-10-21: the mobile card is ~77vw wide; 90vw made phones pick the 1024px file. 80vw picks 640px. */
      img.setAttribute('sizes', '(max-width: 767px) 80vw, 420px');
      if (isSecondary) return;
      img.setAttribute('loading', 'eager');
      img.setAttribute('decoding', 'async');
      /* perf 2026-10-21: no fetchpriority=high here, it competed with the hero (LCP) for bandwidth. */
    });
  }
  /* perf 2026-10-21: run right away too (the cards above are already parsed), so sizes is set before the browser picks a file. */
  tune();
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', tune);
  }
})();
</script>
