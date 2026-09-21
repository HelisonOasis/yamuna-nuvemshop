{# "VOCÊ PODE GOSTAR" — matches yamuna.com.br/checkout carousel #}
{% set cart_reco_products = sections.primary.products | default([]) %}
{% if cart_reco_products is empty and sections.new.products %}
  {% set cart_reco_products = sections.new.products %}
{% endif %}
{% if cart_reco_products is empty and sections.sale.products %}
  {% set cart_reco_products = sections.sale.products %}
{% endif %}

{% set cart_ids = ',' %}
{% for item in cart.items %}
  {% set cart_ids = cart_ids ~ item.product.id ~ ',' %}
{% endfor %}

{% set reco_list = [] %}
{% for product in cart_reco_products if reco_list | length < 12 %}
  {% if (',' ~ product.id ~ ',') not in cart_ids %}
    {% if product.stock is null or product.stock > 0 %}
      {% set reco_list = reco_list | merge([product]) %}
    {% endif %}
  {% endif %}
{% endfor %}

{% if reco_list | length > 0 %}
<section class="yamuna-cart-recommendations" data-store="cart-recommendations">
  <h2 class="yamuna-cart-recommendations-title">VOCÊ PODE GOSTAR</h2>
  <div class="yamuna-cart-recommendations-carousel-wrapper">
    <div class="js-swiper-cart-reco swiper-container yamuna-cart-recommendations-carousel">
      <div class="swiper-wrapper">
        {% for product in reco_list %}
          {% include 'snipplets/grid/item.tpl' with {
            product: product,
            slide_item: true,
            section_name: 'primary',
            is_pdp_related_spot: true,
            is_cart_reco_spot: true
          } %}
        {% endfor %}
      </div>
    </div>
    <button type="button" class="yamuna-cart-reco-prev js-swiper-cart-reco-prev" aria-label="Produto anterior">
      <img src="{{ 'images/yamuna/cart-reco-prev-arrow.svg' | static_url }}" alt="" width="12" height="20" loading="lazy" />
    </button>
    <button type="button" class="yamuna-cart-reco-next js-swiper-cart-reco-next" aria-label="Próximo produto">
      <img src="{{ 'images/yamuna/cart-reco-next-arrow.svg' | static_url }}" alt="" width="12" height="20" loading="lazy" />
    </button>
  </div>
</section>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    var el = document.querySelector('.js-swiper-cart-reco');
    if (!el || typeof Swiper === 'undefined') return;
    /* Match home / PDP related: 1 / 2 / 3 slides, ~30px gap on desktop */
    new Swiper(el, {
      slidesPerView: 1,
      spaceBetween: 16,
      watchOverflow: true,
      observer: true,
      observeParents: true,
      navigation: {
        nextEl: '.js-swiper-cart-reco-next',
        prevEl: '.js-swiper-cart-reco-prev',
      },
      breakpoints: {
        768: { slidesPerView: 2, spaceBetween: 16 },
        992: { slidesPerView: 3, spaceBetween: 30 },
      },
    });
  });
</script>
{% endif %}
