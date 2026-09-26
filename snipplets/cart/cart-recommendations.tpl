{# "VOCÊ PODE GOSTAR" — Home/PDP card model; 1 card mobile, 2 tablet, 3 desktop #}
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
    <div class="yamuna-cart-reco-prev js-swiper-cart-reco-prev swiper-button-prev svg-circle svg-circle-big svg-icon-text" aria-label="Produto anterior" role="button" tabindex="0">
      <svg class="yamuna-product-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
        <polyline points="15 6 9 12 15 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </div>
    <div class="yamuna-cart-reco-next js-swiper-cart-reco-next swiper-button-next svg-circle svg-circle-big svg-icon-text" aria-label="Próximo produto" role="button" tabindex="0">
      <svg class="yamuna-product-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
        <polyline points="9 6 15 12 9 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </div>
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

    /* Cenario 027: 1 card / step on mobile; never skip groups; keep gutters */
    var sw = new Swiper(el, {
      lazy: true,
      watchOverflow: true,
      observer: true,
      observeParents: true,
      centerInsufficientSlides: false,
      centeredSlides: false,
      threshold: 5,
      slidesPerView: 1,
      slidesPerGroup: 1,
      spaceBetween: 16,
      navigation: {
        nextEl: root.querySelector('.js-swiper-cart-reco-next'),
        prevEl: root.querySelector('.js-swiper-cart-reco-prev'),
      },
      breakpoints: {
        768: { slidesPerView: 2, slidesPerGroup: 1, spaceBetween: 16 },
        992: { slidesPerView: 3, slidesPerGroup: 1, spaceBetween: 24 },
      },
      on: {
        init: function () {
          applyCartRecoSlideMetrics(this);
        },
        resize: function () {
          applyCartRecoSlideMetrics(this);
        },
        breakpoint: function () {
          applyCartRecoSlideMetrics(this);
        },
      },
    });

    function applyCartRecoSlideMetrics(instance) {
      if (!instance) return;
      var space = instance.params.spaceBetween || 0;
      var spv = instance.params.slidesPerView || 1;
      var cw = instance.width || (el.clientWidth || 0);
      if (!cw) return;
      var slideW = (cw - space * (Math.ceil(spv) - 1)) / spv;
      var slides = instance.slides || [];
      for (var i = 0; i < slides.length; i++) {
        var slide = slides[i];
        if (!slide || !slide.style) continue;
        slide.style.setProperty('width', slideW + 'px', 'important');
        slide.style.setProperty('max-width', 'none', 'important');
        slide.style.setProperty('flex', '0 0 ' + slideW + 'px', 'important');
        slide.style.setProperty('margin', '0px', 'important');
        slide.style.setProperty('margin-right', space + 'px', 'important');
        slide.style.setProperty('padding', '0px', 'important');
      }
      if (typeof instance.updateSize === 'function') instance.updateSize();
      if (typeof instance.updateSlides === 'function') instance.updateSlides();
    }

    function forceCartRecoSlides() {
      if (!sw) return;
      var w = window.innerWidth || document.documentElement.clientWidth || 0;
      sw.params.slidesPerGroup = 1;
      sw.params.centeredSlides = false;
      sw.params.centerInsufficientSlides = false;
      if (w < 768) {
        sw.params.slidesPerView = 1;
        sw.params.spaceBetween = 16;
      } else if (w < 992) {
        sw.params.slidesPerView = 2;
        sw.params.spaceBetween = 16;
      } else {
        sw.params.slidesPerView = 3;
        sw.params.spaceBetween = 24;
      }
      if (typeof sw.update === 'function') sw.update();
      applyCartRecoSlideMetrics(sw);
    }

    forceCartRecoSlides();
    setTimeout(forceCartRecoSlides, 100);
    setTimeout(forceCartRecoSlides, 400);
    window.addEventListener('resize', forceCartRecoSlides);
  });

  {# AJAX add from this carousel injects incomplete cart-row HTML → broken mobile layout.
     Reload cart page right after a successful add so Liquid re-renders the row. #}
  (function () {
    if (!document.body || !document.body.classList.contains('template-cart')) return;
    var reco = document.querySelector('.yamuna-cart-recommendations');
    if (!reco) return;

    var pendingReload = false;

    document.addEventListener('click', function (e) {
      var btn = e.target.closest(
        '.yamuna-pdp-spot-buy-one, .yamuna-pdp-spot-buy-three, .js-add-to-cart, .js-addtocart'
      );
      if (!btn || !reco.contains(btn)) return;
      pendingReload = true;
    }, true);

    function reloadIfPending() {
      if (!pendingReload) return;
      pendingReload = false;
      window.location.reload();
    }

    document.addEventListener('cart.updated', reloadIfPending);
    document.addEventListener('cart:updated', reloadIfPending);
    if (window.jQueryNuvem) {
      jQueryNuvem(document).on('cart.updated cart:updated', reloadIfPending);
    }

    var tries = 0;
    function wrapAddToCart() {
      if (!window.LS || typeof LS.addToCartEnhanced !== 'function') {
        if (tries++ < 50) setTimeout(wrapAddToCart, 100);
        return;
      }
      if (LS.addToCartEnhanced.__yamunaCartRecoWrapped) return;
      var orig = LS.addToCartEnhanced;
      LS.addToCartEnhanced = function () {
        var args = Array.prototype.slice.call(arguments);
        var successCb = args[5];
        args[5] = function () {
          try {
            if (typeof successCb === 'function') successCb.apply(this, arguments);
          } finally {
            reloadIfPending();
          }
        };
        return orig.apply(this, args);
      };
      LS.addToCartEnhanced.__yamunaCartRecoWrapped = true;
    }
    wrapAddToCart();
  })();
</script>
{% endif %}
