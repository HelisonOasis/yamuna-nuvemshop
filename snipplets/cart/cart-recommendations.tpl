{# "VOCÊ PODE GOSTAR" — Home/PDP card model, exactly 3 visible cards, more items to scroll #}
{% set cart_reco_products = [] %}
{% if sections.primary.products %}
  {% set cart_reco_products = cart_reco_products | merge(sections.primary.products) %}
{% endif %}
{% if sections.new.products %}
  {% set cart_reco_products = cart_reco_products | merge(sections.new.products) %}
{% endif %}
{% if sections.sale.products %}
  {% set cart_reco_products = cart_reco_products | merge(sections.sale.products) %}
{% endif %}
{% if sections.best_seller.products %}
  {% set cart_reco_products = cart_reco_products | merge(sections.best_seller.products) %}
{% endif %}

{% set cart_ids = ',' %}
{% for item in cart.items %}
  {% set cart_ids = cart_ids ~ item.product.id ~ ',' %}
{% endfor %}

{% set reco_list = [] %}
{% set reco_seen = ',' %}
{% for product in cart_reco_products if reco_list | length < 24 %}
  {% if (',' ~ product.id ~ ',') not in cart_ids and (',' ~ product.id ~ ',') not in reco_seen %}
    {% if product.stock is null or product.stock > 0 %}
      {% set reco_list = reco_list | merge([product]) %}
      {% set reco_seen = reco_seen ~ product.id ~ ',' %}
    {% endif %}
  {% endif %}
{% endfor %}

{% if reco_list | length > 0 %}
<section class="yamuna-cart-recommendations yamuna-pdp-related" data-store="cart-recommendations">
  <h2 class="yamuna-cart-recommendations-title products-section-title">VOCÊ PODE GOSTAR</h2>
  <div class="products-section-container">
    <div class="js-swiper-cart-reco swiper-container yamuna-cart-recommendations-carousel">
      <div class="swiper-wrapper">
        {% for product in reco_list %}
          {% include 'snipplets/product/pdp-related-item.tpl' with {
            product: product,
            slide_item: true,
            is_pdp_related_spot: true
          } %}
        {% endfor %}
      </div>
    </div>
    <div class="yamuna-cart-reco-prev js-swiper-cart-reco-prev swiper-button-prev svg-circle svg-circle-big svg-icon-text" aria-label="Produto anterior" role="button" tabindex="0"></div>
    <div class="yamuna-cart-reco-next js-swiper-cart-reco-next swiper-button-next svg-circle svg-circle-big svg-icon-text" aria-label="Próximo produto" role="button" tabindex="0"></div>
  </div>
</section>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    var root = document.querySelector('.yamuna-cart-recommendations');
    var el = root && root.querySelector('.js-swiper-cart-reco');
    if (!el || typeof Swiper === 'undefined') return;
    if (el.swiper) {
      try { el.swiper.destroy(true, true); } catch (e) {}
    }
    /* Exactly 3 cards on desktop — fill full track width, no 4th empty slot */
    new Swiper(el, {
      lazy: true,
      watchOverflow: true,
      centerInsufficientSlides: false,
      centeredSlides: false,
      threshold: 5,
      slidesPerView: 1,
      spaceBetween: 16,
      navigation: {
        nextEl: root.querySelector('.js-swiper-cart-reco-next'),
        prevEl: root.querySelector('.js-swiper-cart-reco-prev'),
      },
      breakpoints: {
        768: { slidesPerView: 2, spaceBetween: 16 },
        992: { slidesPerView: 3, spaceBetween: 24 },
      },
      on: {
        init: function () {
          this.update();
        },
      },
    });
  });
</script>
{% endif %}
