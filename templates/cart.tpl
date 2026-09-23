{# Yamuna pre-checkout cart page — matches yamuna.com.br/checkout #}
{% set has_validation_messages = cart.checkout_enabled_validation_messages | length > 0 %}
{% set should_show_checkout_button = cart.checkout_enabled and not has_validation_messages %}

<div id="shoppingCartPage" class="yamuna-cart-page" data-minimum="{{ settings.cart_minimum_value }}" data-store="cart-page">
  {# Single track: table + carousel + reviews share the same width #}
  <div class="yamuna-cart-page-inner">
    <div class="yamuna-cart-nav">
      <a class="yamuna-cart-page-back" href="{{ store.products_url }}">&lt; Voltar</a>
      <h1 class="yamuna-cart-page-title">{{ 'Carrinho de compras' | translate }}</h1>
      <span class="yamuna-cart-nav-spacer" aria-hidden="true"></span>
    </div>

    {# Platform quirk: any POST to cart_url WITHOUT name=go_to_checkout returns
       HTTP 200 with an empty body (blank white page, ~0 B resources in Network).
       Only Finalizar compra may submit; qty uses LS AJAX. #}
    <form action="{{ store.cart_url }}" method="post" class="yamuna-cart-page-form cart-body" data-store="cart-form" data-component="cart">

      {% if error.add %}
        {{ component('alert', {'type': 'warning', 'message': 'our_components.cart.error_messages.' ~ error.add }) }}
      {% endif %}
      {% for error in error.update %}
        <div class="alert alert-warning">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
      {% endfor %}

      {% if cart.items %}
        <div class="yamuna-cart-table" data-component="cart">
          <div class="yamuna-cart-table-head" aria-hidden="true">
            <span class="yamuna-cart-col-desc">{{ 'Descrição do produto' | translate }}</span>
            <span class="yamuna-cart-col-qty">{{ 'Quantidade' | translate }}</span>
            <span class="yamuna-cart-col-unit">{{ 'Preço unitário' | translate }}</span>
            <span class="yamuna-cart-col-total">{{ 'Total' | translate }}</span>
          </div>

          {{ component('nubesdk-slot', { type: "before_line_items" }) }}

          <div class="js-ajax-cart-list yamuna-cart-table-body">
            {% for item in cart.items %}
              {% include "snipplets/cart-item-ajax.tpl" with {'cart_page': true} %}
            {% endfor %}
          </div>

          {{ component('nubesdk-slot', { type: "after_line_items" }) }}
        </div>

        <div class="yamuna-cart-page-actions js-visible-on-cart-filled">
          <a class="yamuna-cart-page-continue" href="{{ store.products_url }}">{{ 'Continuar comprando' | translate }}</a>
          {% if should_show_checkout_button %}
          <input
            id="go-to-checkout"
            class="yamuna-cart-page-checkout"
            type="submit"
            name="go_to_checkout"
            value="{{ 'Finalizar compra' | translate }}"
            data-component="cart.checkout-button"
          />
          {% endif %}
        </div>

        {{ component(
          'checkout-enabled-validation-messages', {
            alert_classes: 'alert alert-warning mb-2 yamuna-cart-page-validation',
            cart_minimum_value: settings.cart_minimum_value
          })
        }}

        {# Mobile order summary (shipping + totals). Desktop keeps Finalizar only. #}
        <div class="yamuna-cart-page-summary js-visible-on-cart-filled">
          <h2 class="yamuna-cart-page-summary-title">Resumo do pedido</h2>
          {% include "snipplets/cart-totals.tpl" with {'cart_page': true, 'hide_checkout_button': true} %}
        </div>
      {% else %}
        {% if not error %}
          <div class="yamuna-cart-page-empty">
            <img
              class="yamuna-cart-page-empty-icon"
              src="{{ 'images/yamuna/cart-empty-orders.svg' | static_url }}"
              alt=""
              width="127"
              height="120"
            />
            <h2 class="yamuna-cart-page-empty-title">Seu carrinho de compras está vazio</h2>
            <p class="yamuna-cart-page-empty-subtitle">Você não possui itens no carrinho</p>
            <a class="yamuna-cart-page-continue yamuna-cart-page-empty-continue" href="{{ store.products_url }}">Continue comprando</a>
          </div>
        {% endif %}
      {% endif %}

      <div id="error-ajax-stock" style="display: none;">
        <div class="alert alert-warning">
          {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
        </div>
      </div>
    </form>
    <script>
      (function () {
        var form = document.querySelector('.yamuna-cart-page-form');
        if (!form) return;
        form.addEventListener('keydown', function (e) {
          if (e.key === 'Enter' && e.target && e.target.tagName === 'INPUT' && e.target.type !== 'submit') {
            e.preventDefault();
          }
        });
        form.addEventListener('submit', function (e) {
          var submitter = e.submitter || document.activeElement;
          if (!submitter || submitter.name !== 'go_to_checkout') {
            e.preventDefault();
          }
        });
      })();
    </script>

    <div class="yamuna-checkout-extras">
      {% include "snipplets/cart/cart-recommendations.tpl" %}
      {% include "snipplets/cart/cart-depositions.tpl" %}
    </div>
  </div>

  <div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>

{# Critical cart overrides — ship with template so they win over stale async CSS #}
<style>
  body.template-cart .yamuna-cart-page,
  body.template-cart .yamuna-cart-page-inner,
  body.template-cart .yamuna-checkout-extras,
  body.template-cart .yamuna-cart-recommendations,
  body.template-cart .yamuna-cart-depositions {
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 1152px !important;
    margin-left: auto !important;
    margin-right: auto !important;
  }
  body.template-cart .yamuna-cart-page {
    max-width: 1200px !important;
    padding: 32px 24px 48px !important;
  }
  body.template-cart .yamuna-checkout-extras {
    padding: 0 !important;
    margin-top: 0 !important;
  }
  /* Header labels: black (not white) */
  body.template-cart .yamuna-cart-table-head,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-desc,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-qty,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-unit,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-total {
    color: #000 !important;
  }
  body.template-cart .yamuna-cart-table-head {
    background: #c388a2 !important;
    display: grid !important;
    grid-template-columns: 32px 85px minmax(160px, 286px) 120px 150px minmax(140px, 1fr) !important;
    gap: 12px !important;
    padding: 0 20px !important;
    border-radius: 16px 16px 0 0 !important;
  }
  body.template-cart .yamuna-cart-table {
    overflow: hidden !important;
    border-radius: 16px !important;
  }
  body.template-cart .yamuna-cart-table-body {
    border-radius: 0 0 16px 16px !important;
  }
  /* DESCRIÇÃO left edge = trash icon left (btn centered in 32px col + SVG glyph inset) */
  body.template-cart .yamuna-cart-col-desc {
    grid-column: 1 / 4 !important;
    justify-self: start !important;
    text-align: left !important;
    padding: 0 0 0 8px !important;
    margin: 0 !important;
  }
  body.template-cart .yamuna-cart-col-qty { grid-column: 4 !important; }
  body.template-cart .yamuna-cart-col-unit { grid-column: 5 !important; }
  body.template-cart .yamuna-cart-col-total { grid-column: 6 !important; }
  body.template-cart .yamuna-cart-row {
    display: grid !important;
    grid-template-columns: 32px 85px minmax(160px, 286px) 120px 150px minmax(140px, 1fr) !important;
    gap: 12px !important;
    padding: 16px 20px !important;
  }
  /* Carousel: exactly 3 equal cards, fill track, no hole */
  body.template-cart .yamuna-cart-recommendations .products-section-container {
    position: relative !important;
    width: 100% !important;
  }
  body.template-cart .yamuna-cart-recommendations .js-swiper-cart-reco {
    width: 100% !important;
    overflow: hidden !important;
  }
  @media (min-width: 992px) {
    body.template-cart .yamuna-cart-recommendations .swiper-slide {
      width: calc((100% - 48px) / 3) !important;
      max-width: calc((100% - 48px) / 3) !important;
      height: auto !important;
      min-height: 520px !important;
      box-sizing: border-box !important;
    }
  }
  body.template-cart .yamuna-cart-recommendations .item.item-product,
  body.template-cart .yamuna-cart-recommendations .item {
    width: 100% !important;
    max-width: none !important;
    margin: 0 !important;
    border-radius: 12px !important;
  }
  /* Arrows centered on the full card (vertical middle of track) */
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-prev,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-next,
  body.template-cart .yamuna-cart-recommendations .swiper-button-prev,
  body.template-cart .yamuna-cart-recommendations .swiper-button-next {
    position: absolute !important;
    top: 50% !important;
    bottom: auto !important;
    transform: translateY(-50%) !important;
    margin-top: 0 !important;
    width: 48px !important;
    height: 48px !important;
    z-index: 8 !important;
    display: flex !important;
    background: #fff !important;
    border: 1px solid rgba(35, 132, 130, 0.18) !important;
    border-radius: 50% !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1) !important;
  }
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-prev,
  body.template-cart .yamuna-cart-recommendations .swiper-button-prev {
    left: 0 !important;
    right: auto !important;
  }
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-next,
  body.template-cart .yamuna-cart-recommendations .swiper-button-next {
    right: 0 !important;
    left: auto !important;
  }
  body.template-cart .yamuna-cart-depositions {
    width: 100% !important;
    max-width: 100% !important;
  }

  /* Buy-3 unit price: De / Por (same as minicart) */
  body.template-cart .yamuna-cart-page-unit-promo {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    gap: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    text-align: center !important;
    white-space: nowrap !important;
  }
  body.template-cart .yamuna-cart-page-unit-promo.is-hidden,
  body.template-cart .yamuna-cart-row-unit .js-cart-item-unit-price.is-hidden {
    display: none !important;
  }
  body.template-cart .yamuna-cart-page-unit-de,
  body.template-cart .yamuna-cart-page-unit-por {
    margin: 0 !important;
    padding: 0 !important;
    font-family: Dosis, Roboto, Arial, sans-serif !important;
    font-weight: 800 !important;
    line-height: 1.2 !important;
  }
  body.template-cart .yamuna-cart-page-unit-de {
    color: #4a1d3a !important;
    font-size: 13px !important;
  }
  body.template-cart .yamuna-cart-page-unit-de-value {
    text-decoration: line-through !important;
  }
  body.template-cart .yamuna-cart-page-unit-por {
    color: #238482 !important;
    font-size: 16px !important;
  }
  body.template-cart .yamuna-cart-page-unit-por-label {
    font-weight: 800 !important;
  }
  body.template-cart .yamuna-cart-row-total .js-cart-item-subtotal-compare-price-container.is-visible,
  body.template-cart .yamuna-cart-row-total [data-yamuna-line-compare].is-visible {
    display: block !important;
  }
</style>
<script>
(function () {
  function formatMoneyFromCents(cents) {
    var reais = (Number(cents) || 0) / 100;
    if (window.LS && typeof LS.formatToCurrency === 'function') {
      return LS.formatToCurrency(reais);
    }
    return 'R$\u00a0' + reais.toFixed(2).replace('.', ',');
  }

  function syncCartPageBuyThree() {
    var list = document.querySelector('.yamuna-cart-page .js-ajax-cart-list');
    if (!list) return;
    list.querySelectorAll('.js-cart-item.yamuna-cart-row').forEach(function (itemEl) {
      if (itemEl.getAttribute('data-gift') === 'true') return;
      var promoEl = itemEl.querySelector('[data-yamuna-unit-promo]');
      var plainUnit = itemEl.querySelector('[data-yamuna-unit-plain]');
      var unitCompare = itemEl.querySelector('.js-cart-item-unit-price-compare-price-container');
      var lineTotal = itemEl.querySelector('[data-yamuna-line-total]');
      var lineCompare = itemEl.querySelector('[data-yamuna-line-compare]');
      var installments = itemEl.querySelector('[data-yamuna-installments]');
      if (!promoEl) return;

      var qtyInput = itemEl.querySelector('.js-cart-quantity-input');
      var qty = parseInt(qtyInput && qtyInput.value, 10) || 0;
      var threshold = parseInt(itemEl.getAttribute('data-yamuna-promo-threshold'), 10) || 3;
      var unitCents = parseFloat(itemEl.getAttribute('data-yamuna-unit-price'));
      var rate = parseFloat(itemEl.getAttribute('data-yamuna-promo-rate'));
      if (isNaN(rate)) rate = 0.95;

      if (qty >= threshold && !isNaN(unitCents)) {
        var promoCents = Math.floor(unitCents * rate);
        var lineCents = promoCents * qty;
        var fullLineCents = Math.round(unitCents * qty);
        var deEl = promoEl.querySelector('[data-yamuna-unit-de]');
        var porEl = promoEl.querySelector('[data-yamuna-unit-por]');
        var deText = formatMoneyFromCents(unitCents);
        var porText = formatMoneyFromCents(promoCents);
        if (deEl) deEl.textContent = deText;
        if (porEl) porEl.textContent = porText;
        promoEl.classList.remove('is-hidden');
        if (plainUnit) plainUnit.classList.add('is-hidden');
        if (unitCompare) unitCompare.style.display = 'none';
        if (lineTotal) lineTotal.textContent = formatMoneyFromCents(lineCents);
        if (lineCompare) {
          var cmpSpan = lineCompare.querySelector('.js-cart-item-subtotal-compare-price');
          if (cmpSpan) cmpSpan.textContent = formatMoneyFromCents(fullLineCents);
          lineCompare.classList.add('is-visible');
          lineCompare.style.display = '';
          lineCompare.removeAttribute('aria-hidden');
        }
        if (installments) {
          var count = parseInt(installments.getAttribute('data-installment-count'), 10) || 0;
          if (count > 1) {
            installments.textContent = 'em ' + count + 'x de ' + formatMoneyFromCents(Math.floor(lineCents / count)) + ' sem juros';
          }
        }
      } else {
        promoEl.classList.add('is-hidden');
        if (plainUnit) plainUnit.classList.remove('is-hidden');
        if (lineCompare) {
          lineCompare.classList.remove('is-visible');
          lineCompare.style.display = 'none';
          lineCompare.setAttribute('aria-hidden', 'true');
        }
        if (lineTotal && !isNaN(unitCents)) {
          lineTotal.textContent = formatMoneyFromCents(Math.round(unitCents * qty));
        }
        if (installments && !isNaN(unitCents)) {
          var countOff = parseInt(installments.getAttribute('data-installment-count'), 10) || 0;
          if (countOff > 1) {
            var full = Math.round(unitCents * qty);
            installments.textContent = 'em ' + countOff + 'x de ' + formatMoneyFromCents(Math.floor(full / countOff)) + ' sem juros';
          }
        }
      }
    });
  }

  function bind() {
    syncCartPageBuyThree();
    var root = document.getElementById('shoppingCartPage');
    if (!root || !window.MutationObserver) return;
    var timer = null;
    new MutationObserver(function () {
      if (timer) clearTimeout(timer);
      timer = setTimeout(syncCartPageBuyThree, 50);
    }).observe(root, { childList: true, subtree: true, characterData: true, attributes: true });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', bind);
  } else {
    bind();
  }
})();
</script>
