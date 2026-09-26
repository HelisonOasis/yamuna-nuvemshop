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

    {% include "snipplets/cart/checkout-steps.tpl" with { step: 'cart' } %}

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

          {# Mobile option A: Total row inside card when 2+ products #}
          <div
            class="yamuna-cart-mobile-total js-yamuna-cart-mobile-total"
            {% if cart.items_count < 2 %}hidden{% endif %}
            data-store="cart-total"
          >
            <span class="yamuna-cart-mobile-total-label">Total</span>
            <strong class="yamuna-cart-mobile-total-value js-cart-total" data-priceraw="{{ cart.total }}">{{ cart.total | money }}</strong>
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

      <div id="error-ajax-stock" class="yamuna-cart-stock-alert" style="display: none;" role="alert">
        <div class="alert alert-warning yamuna-cart-stock-alert-inner">
          Limite de estoque atingido
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

      /* Mobile Total row: visible only with 2+ line items */
      (function () {
        function syncMobileCartTotal() {
          var list = document.querySelector('.js-ajax-cart-list');
          var row = document.querySelector('.js-yamuna-cart-mobile-total');
          if (!list || !row) return;
          var count = list.querySelectorAll('.js-cart-item, .yamuna-cart-row[data-component="cart.line-item"], .yamuna-cart-row').length;
          if (!count) {
            count = list.querySelectorAll('[data-component="cart.line-item"], .js-cart-item').length;
          }
          if (count > 1) row.removeAttribute('hidden');
          else row.setAttribute('hidden', '');
        }
        syncMobileCartTotal();
        var listEl = document.querySelector('.js-ajax-cart-list');
        if (listEl && typeof MutationObserver !== 'undefined') {
          new MutationObserver(function () { syncMobileCartTotal(); })
            .observe(listEl, { childList: true, subtree: false });
        }
        document.addEventListener('cart:updated', syncMobileCartTotal);
        document.addEventListener('cart.updated', syncMobileCartTotal);
      })();

      /* Keep stock alert copy + force pink card styling if LS rewrites the HTML */
      (function () {
        var MSG = 'Limite de estoque atingido';
        function fixStockAlert(root) {
          var el = root || document.getElementById('error-ajax-stock');
          if (!el) return;
          el.classList.add('yamuna-cart-stock-alert');
          var inner = el.querySelector('.alert') || el;
          inner.classList.add('yamuna-cart-stock-alert-inner');
          var text = (inner.textContent || '').trim();
          if (text !== MSG) {
            inner.textContent = MSG;
          }
        }
        fixStockAlert();
        var stockEl = document.getElementById('error-ajax-stock');
        if (stockEl && window.MutationObserver) {
          var mo = new MutationObserver(function () { fixStockAlert(stockEl); });
          mo.observe(stockEl, { childList: true, subtree: true, characterData: true });
        }
        document.addEventListener('cart.updated', function () { fixStockAlert(); });
        document.addEventListener('cart:updated', function () { fixStockAlert(); });
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
  /* Header labels: brand magenta on white (Cenario 022 — match checkout) */
  body.template-cart .yamuna-cart-table-head,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-desc,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-qty,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-unit,
  body.template-cart .yamuna-cart-table-head .yamuna-cart-col-total {
    color: #a31460 !important;
    font-size: 14px !important;
  }
  body.template-cart .yamuna-cart-table {
    overflow: hidden !important;
    border-radius: 16px !important;
  }
  body.template-cart .yamuna-cart-table-body {
    border-radius: 0 0 16px 16px !important;
  }
  /* Mobile Total (option A) — hidden on desktop; shown ≤1023 with 2+ items */
  body.template-cart .yamuna-cart-mobile-total {
    display: none !important;
  }
  @media (max-width: 1023px) {
    body.template-cart .yamuna-cart-table-body {
      border-radius: 0 !important;
    }
    body.template-cart .yamuna-cart-table:has(.yamuna-cart-mobile-total[hidden]) .yamuna-cart-table-body {
      border-radius: 0 0 16px 16px !important;
    }
    body.template-cart .yamuna-cart-mobile-total:not([hidden]) {
      display: flex !important;
      align-items: baseline !important;
      justify-content: space-between !important;
      gap: 12px !important;
      box-sizing: border-box !important;
      width: 100% !important;
      margin: 0 !important;
      padding: 12px 16px 16px !important;
      border-top: 1px solid #e6e2e6 !important;
      border-radius: 0 0 16px 16px !important;
      background: #fff !important;
      color: #4a1d3a !important;
    }
    body.template-cart .yamuna-cart-mobile-total-label {
      font-family: Raleway, Arial, sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 1.3 !important;
    }
    body.template-cart .yamuna-cart-mobile-total-value {
      font-family: Roboto, Arial, sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 1.3 !important;
      color: #4a1d3a !important;
    }
  }
  /* Stock limit alert — brand pink, ~80% width, centered */
  body.template-cart #error-ajax-stock,
  body.template-cart .yamuna-cart-stock-alert {
    display: none;
    box-sizing: border-box !important;
    width: 80% !important;
    max-width: 80% !important;
    margin: 8px auto 12px !important;
    padding: 0 !important;
    border: 0 !important;
    background: transparent !important;
  }
  body.template-cart #error-ajax-stock[style*="display: block"],
  body.template-cart #error-ajax-stock[style*="display:block"],
  body.template-cart #error-ajax-stock:not([style*="display: none"]):not([style*="display:none"]) {
    display: block !important;
  }
  body.template-cart #error-ajax-stock .alert,
  body.template-cart #error-ajax-stock .alert-warning,
  body.template-cart .yamuna-cart-stock-alert-inner,
  body.template-cart .yamuna-cart-table-body > .alert.alert-warning,
  body.template-cart .js-ajax-cart-list + .alert.alert-warning,
  body.template-cart .yamuna-cart-row + .alert.alert-warning {
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 auto !important;
    padding: 10px 14px !important;
    border: 1px solid #a31460 !important;
    border-radius: 12px !important;
    background: #fdf2f7 !important;
    color: #a31460 !important;
    text-align: center !important;
    font-family: Raleway, Roboto, Arial, sans-serif !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    line-height: 1.35 !important;
  }
  body.template-cart #error-ajax-stock .alert::before,
  body.template-cart #error-ajax-stock .alert-warning::before,
  body.template-cart .yamuna-cart-stock-alert-inner::before {
    filter: none !important;
    color: #a31460 !important;
  }
  body.template-cart #error-ajax-stock a,
  body.template-cart .yamuna-cart-stock-alert a {
    display: none !important;
  }
  /* Desktop table — only from 1024px (tablet uses mobile card layout) */
  @media (min-width: 1024px) {
    body.template-cart .yamuna-cart-table-head {
      background: #fff !important;
      display: grid !important;
      grid-template-columns: 32px 85px minmax(160px, 286px) 120px 150px minmax(140px, 1fr) !important;
      gap: 12px !important;
      padding: 0 20px !important;
      border-radius: 16px 16px 0 0 !important;
    }
    /* DESCRIÇÃO left edge = trash icon left (btn centered in 32px col + SVG glyph inset) */
    body.template-cart .yamuna-cart-col-desc {
      grid-column: 1 / 4 !important;
      justify-self: start !important;
      text-align: left !important;
      padding: 0 0 0 8px !important;
      margin: 0 !important;
    }
    body.template-cart .yamuna-cart-col-qty { grid-column: 4 !important; display: block !important; }
    body.template-cart .yamuna-cart-col-unit { grid-column: 5 !important; display: block !important; }
    body.template-cart .yamuna-cart-col-total { grid-column: 6 !important; display: block !important; }
    body.template-cart .yamuna-cart-row {
      display: grid !important;
      grid-template-columns: 32px 85px minmax(160px, 286px) 120px 150px minmax(140px, 1fr) !important;
      grid-template-areas: none !important;
      gap: 12px !important;
      padding: 16px 20px !important;
    }
    body.template-cart .yamuna-cart-row-delete,
    body.template-cart .yamuna-cart-row-image,
    body.template-cart .yamuna-cart-row-desc,
    body.template-cart .yamuna-cart-row-qty,
    body.template-cart .yamuna-cart-row-unit,
    body.template-cart .yamuna-cart-row-total {
      grid-area: auto !important;
    }
    body.template-cart .yamuna-cart-row-unit {
      display: block !important;
    }
    body.template-cart .yamuna-cart-row-total .yamuna-cart-row-price::before,
    body.template-cart .yamuna-cart-row-total .js-cart-item-subtotal::before {
      content: none !important;
    }
  }
  /* Mobile + tablet (≤1023): breathable card
     [img] title            [🗑]
           Total R$…
           em Nx…
           [- 1 +]
     Unit price only when qty > 1 (avoids R$145 twice). */
  @media (max-width: 1023px) {
    body.template-cart .yamuna-cart-page {
      padding: 16px 12px 0 !important;
    }
    body.template-cart .yamuna-cart-table-head {
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      grid-template-columns: none !important;
      padding: 10px 12px !important;
    }
    body.template-cart .yamuna-cart-col-qty,
    body.template-cart .yamuna-cart-col-unit,
    body.template-cart .yamuna-cart-col-total {
      display: none !important;
    }
    body.template-cart .yamuna-cart-col-desc {
      grid-column: auto !important;
      padding-left: 0 !important;
      margin-left: 0 !important;
      text-align: center !important;
      width: 100% !important;
    }
    body.template-cart .yamuna-cart-row {
      display: grid !important;
      grid-template-columns: 72px minmax(0, 1fr) 28px !important;
      grid-template-areas:
        "image desc delete"
        "image prices prices"
        "image qty qty" !important;
      column-gap: 12px !important;
      row-gap: 8px !important;
      align-items: start !important;
      min-height: 0 !important;
      width: 100% !important;
      max-width: 100% !important;
      box-sizing: border-box !important;
      padding: 16px 12px !important;
      overflow: hidden !important;
    }
    body.template-cart .yamuna-cart-row-image {
      grid-area: image !important;
      width: 72px !important;
      height: 72px !important;
      max-width: 72px !important;
      justify-self: start !important;
      border-radius: 8px !important;
      overflow: hidden !important;
    }
    body.template-cart .yamuna-cart-row-desc {
      grid-area: desc !important;
      min-width: 0 !important;
      overflow-wrap: anywhere !important;
      word-break: break-word !important;
      font-size: 14px !important;
      line-height: 1.35 !important;
      align-self: start !important;
      padding-right: 4px !important;
    }
    body.template-cart .yamuna-cart-row-delete,
    body.template-cart .yamuna-cart-row .cart-item-delete {
      grid-area: delete !important;
      align-self: start !important;
      justify-self: end !important;
      width: 24px !important;
      height: 24px !important;
      margin: 0 !important;
      padding: 0 !important;
    }
    /* Mobile: only line total (hide unit price entirely) */
    body.template-cart .yamuna-cart-row-unit {
      display: none !important;
    }
    /* Line total + installments (primary price) */
    body.template-cart .yamuna-cart-row-total {
      grid-area: prices !important;
      display: flex !important;
      flex-direction: column !important;
      align-items: flex-start !important;
      gap: 2px !important;
      min-width: 0 !important;
      text-align: left !important;
      padding: 0 !important;
    }
    body.template-cart .yamuna-cart-row-total .yamuna-cart-row-price,
    body.template-cart .yamuna-cart-row-total .js-cart-item-subtotal {
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 1.25 !important;
    }
    body.template-cart .yamuna-cart-row-total .yamuna-cart-row-price::before,
    body.template-cart .yamuna-cart-row-total .js-cart-item-subtotal::before {
      content: none !important;
    }
    body.template-cart .yamuna-cart-row-total .yamuna-cart-row-installments {
      margin-top: 0 !important;
      font-size: 12px !important;
      line-height: 1.35 !important;
      overflow-wrap: anywhere !important;
    }
    body.template-cart .yamuna-cart-row-qty {
      grid-area: qty !important;
      justify-content: flex-start !important;
      justify-self: start !important;
      margin: 4px 0 0 !important;
    }
    body.template-cart .yamuna-cart-page-qty.form-quantity,
    body.template-cart .yamuna-cart-page-qty.form-group {
      width: 96px !important;
      max-width: 96px !important;
      min-width: 88px !important;
    }
  }
  body.template-cart .yamuna-cart-page-actions {
    margin: 28px 0 !important;
  }
  /* CTAs: 352×40 from 768px up */
  @media (min-width: 768px) {
    body.template-cart .yamuna-cart-page-actions {
      justify-content: center !important;
      align-items: center !important;
      flex-wrap: wrap !important;
      gap: 16px !important;
      margin: 48px 0 !important;
    }
    body.template-cart .yamuna-cart-page-continue,
    body.template-cart .yamuna-cart-page-checkout {
      flex: 0 0 352px !important;
      width: 352px !important;
      max-width: 352px !important;
      min-width: 352px !important;
      height: 40px !important;
      min-height: 40px !important;
      max-height: 40px !important;
    }
  }
  @media (max-width: 374px) {
    body.template-cart .yamuna-cart-page {
      padding: 12px 12px 0 !important;
    }
    body.template-cart .yamuna-cart-table-head {
      padding: 10px 12px !important;
    }
    body.template-cart .yamuna-cart-row {
      grid-template-columns: 64px minmax(0, 1fr) 24px !important;
      column-gap: 10px !important;
      row-gap: 6px !important;
      padding: 14px 12px !important;
    }
    body.template-cart .yamuna-cart-row-image {
      width: 64px !important;
      height: 64px !important;
      max-width: 64px !important;
    }
    body.template-cart .yamuna-cart-row-desc {
      font-size: 13px !important;
    }
    body.template-cart .yamuna-cart-row-total .yamuna-cart-row-price,
    body.template-cart .yamuna-cart-row-total .js-cart-item-subtotal {
      font-size: 15px !important;
    }
    body.template-cart .yamuna-cart-row-delete .yamuna-cart-trash-icon {
      width: 20px !important;
      height: 22px !important;
    }
    body.template-cart .yamuna-cart-page-qty.form-quantity,
    body.template-cart .yamuna-cart-page-qty.form-group {
      width: 88px !important;
      max-width: 88px !important;
      min-width: 80px !important;
      height: 32px !important;
    }
  }
  /* Cenario 027 — reco carousel: align to checkout; Swiper owns slide widths */
  body.template-cart .yamuna-cart-recommendations.yamuna-pdp-related {
    width: 100% !important;
    max-width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
    background: transparent !important;
  }
  body.template-cart .yamuna-cart-recommendations .products-section-container {
    position: relative !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: visible !important;
  }
  body.template-cart .yamuna-cart-recommendations .js-swiper-cart-reco,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-recommendations-carousel {
    width: 100% !important;
    max-width: 100% !important;
    overflow: hidden !important;
    box-sizing: border-box !important;
  }
  body.template-cart .yamuna-cart-recommendations .swiper-slide {
    height: auto !important;
    min-height: 0 !important;
    box-sizing: border-box !important;
    /* width/margin set by Swiper JS with !important — do not override here */
    max-width: none !important;
    min-width: 0 !important;
    padding: 0 !important;
  }
  body.template-cart .yamuna-cart-recommendations .item.item-product,
  body.template-cart .yamuna-cart-recommendations .item {
    display: flex !important;
    flex-direction: column !important;
    width: 100% !important;
    max-width: none !important;
    height: auto !important;
    min-height: 0 !important;
    margin: 0 !important;
    /* Home card inset */
    padding: 0 24px 22px !important;
    border-radius: 12px !important;
    background: #fff !important;
    box-shadow: 0 2px 12px rgba(57, 55, 71, 0.1) !important;
    overflow: hidden !important;
    box-sizing: border-box !important;
    text-align: left !important;
  }
  body.template-cart .yamuna-cart-recommendations .item-image {
    width: 100% !important;
    max-width: 100% !important;
    height: 240px !important;
    min-height: 240px !important;
    max-height: 240px !important;
    margin: 12px auto 0 !important;
  }
  body.template-cart .yamuna-cart-recommendations .item-description {
    padding: 10px 0 0 !important;
  }
  body.template-cart .yamuna-cart-recommendations .item-actions {
    padding: 8px 0 0 !important;
  }
  /* Cenario 029: COMPRE 3 — min 12px; 14px from 475px */
  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three,
  body.template-cart .yamuna-cart-recommendations .item-actions .btn-secondary,
  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-label,
  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three span {
    font-size: 12px !important;
    line-height: 1.1 !important;
  }
  @media (min-width: 475px) {
    body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three,
    body.template-cart .yamuna-cart-recommendations .item-actions .btn-secondary,
    body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-label,
    body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three span {
      font-size: 14px !important;
    }
  }
  /* Home glass arrows over product image */
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
    min-width: 48px !important;
    min-height: 48px !important;
    z-index: 8 !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    background: rgba(255, 255, 255, 0.42) !important;
    background-color: rgba(255, 255, 255, 0.42) !important;
    border: 1px solid rgba(255, 255, 255, 0.55) !important;
    border-radius: 50% !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
    color: #238482 !important;
  }
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-prev,
  body.template-cart .yamuna-cart-recommendations .swiper-button-prev {
    left: 8px !important;
    right: auto !important;
  }
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-next,
  body.template-cart .yamuna-cart-recommendations .swiper-button-next {
    right: 8px !important;
    left: auto !important;
  }
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-prev img,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-next img {
    display: none !important;
  }
  body.template-cart .yamuna-cart-recommendations .swiper-button-prev svg,
  body.template-cart .yamuna-cart-recommendations .swiper-button-next svg,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-prev svg,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-next svg,
  body.template-cart .yamuna-cart-recommendations .yamuna-product-arrow-icon {
    display: block !important;
    width: 26px !important;
    height: 26px !important;
    margin: 0 !important;
    color: #238482 !important;
    fill: none !important;
    stroke: #238482 !important;
    transform: none !important;
  }
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-prev::before,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-next::before,
  body.template-cart .yamuna-cart-recommendations .swiper-button-prev::before,
  body.template-cart .yamuna-cart-recommendations .swiper-button-next::before,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-prev::after,
  body.template-cart .yamuna-cart-recommendations .yamuna-cart-reco-next::after,
  body.template-cart .yamuna-cart-recommendations .swiper-button-prev::after,
  body.template-cart .yamuna-cart-recommendations .swiper-button-next::after {
    display: none !important;
    content: none !important;
    border: 0 !important;
    transform: none !important;
  }
  @media (max-width: 767px) {
    body.template-cart .yamuna-cart-depositions {
      display: flex !important;
      flex-direction: column !important;
      width: 100% !important;
      max-width: 100% !important;
      min-width: 0 !important;
      height: 360px !important;
      min-height: 360px !important;
      max-height: 360px !important;
      margin-left: 0 !important;
      margin-right: 0 !important;
      padding: 16px !important;
      box-sizing: border-box !important;
    }
    body.template-cart .yamuna-cart-depositions-nav {
      display: flex !important;
    }
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

  function parsePriceRawCents(rawAttr) {
    var normalized = String(rawAttr || '').trim().replace(/\s/g, '').replace(',', '.');
    var raw = parseFloat(normalized);
    if (isNaN(raw) || raw < 0) return 0;
    /* Near-integer (incl. float noise like 6690.000000000001) → cents. */
    if (Math.abs(raw - Math.round(raw)) < 0.001) {
      return Math.round(raw);
    }
    if (normalized.indexOf('.') !== -1) {
      return Math.round(raw * 100);
    }
    return Math.round(raw);
  }

  function getPlatformDiscountCents() {
    var el = document.querySelector('.js-cart-discount[data-priceraw]');
    if (!el) return 0;
    return parsePriceRawCents(el.getAttribute('data-priceraw'));
  }

  function getBuyThreeDiscountCents(root) {
    if (!root) return 0;
    var discount = 0;
    root.querySelectorAll('.js-cart-item.yamuna-cart-row').forEach(function (itemEl) {
      if (itemEl.getAttribute('data-gift') === 'true') return;
      var qtyInput = itemEl.querySelector('.js-cart-quantity-input');
      var qty = parseInt(qtyInput && qtyInput.value, 10) || 0;
      var threshold = parseInt(itemEl.getAttribute('data-yamuna-promo-threshold'), 10) || 3;
      var unitCents = parseFloat(itemEl.getAttribute('data-yamuna-unit-price'));
      var rate = parseFloat(itemEl.getAttribute('data-yamuna-promo-rate'));
      if (isNaN(rate)) rate = 0.95;
      if (qty < threshold || isNaN(unitCents) || unitCents <= 0) return;
      var fullLine = Math.round(unitCents * qty);
      var promoLine = Math.floor(unitCents * rate) * qty;
      discount += Math.max(0, fullLine - promoLine);
    });
    return discount;
  }

  function applyDiscountToPriceEls(els, deltaCents) {
    els.forEach(function (el) {
      if (!el || el.childElementCount !== 0) return;
      var raw = el.getAttribute('data-priceraw');
      var baseCents;
      if (raw != null && raw !== '') {
        baseCents = parsePriceRawCents(raw);
      } else if (window.LS && LS.data && LS.data.cart && LS.data.cart.total != null && el.classList.contains('js-cart-total')) {
        baseCents = Number(LS.data.cart.total) || 0;
      } else {
        var prev = parseInt(el.getAttribute('data-yamuna-applied-delta') || '0', 10);
        var cleaned = String(el.textContent || '').replace(/[^\d,.-]/g, '').trim();
        if (cleaned.indexOf(',') !== -1) cleaned = cleaned.replace(/\./g, '').replace(',', '.');
        baseCents = Math.round((parseFloat(cleaned) || 0) * 100) + (isNaN(prev) ? 0 : prev);
      }
      if (isNaN(baseCents)) return;
      var wasAdjusted = el.getAttribute('data-yamuna-total-adjusted') === '1';

      if (deltaCents <= 0) {
        if (wasAdjusted) {
          el.textContent = formatMoneyFromCents(baseCents);
          el.removeAttribute('data-yamuna-total-adjusted');
          el.removeAttribute('data-yamuna-applied-delta');
        }
        return;
      }

      var nextText = formatMoneyFromCents(Math.max(0, baseCents - deltaCents));
      var current = (el.textContent || '').replace(/\s+/g, ' ').trim();
      if (!current || !/[\d]/.test(current)) return;
      if (current !== nextText.replace(/\s+/g, ' ').trim()) {
        el.textContent = nextText;
      }
      el.setAttribute('data-yamuna-total-adjusted', '1');
      el.setAttribute('data-yamuna-applied-delta', String(deltaCents));
    });
  }

  function syncCartPageBuyThreeTotals() {
    var root = document.getElementById('shoppingCartPage');
    if (!root) return;
    var delta = Math.max(0, getBuyThreeDiscountCents(root) - getPlatformDiscountCents());
    var subtotalEls = root.querySelectorAll(
      '.js-cart-subtotal[data-priceraw], [data-component="cart.subtotal"][data-priceraw], .cart-subtotal-price[data-priceraw], [data-store="cart-subtotal"] .js-cart-subtotal'
    );
    var totalEls = root.querySelectorAll(
      '.js-cart-total[data-priceraw], [data-component="total.value"][data-priceraw], .js-cart-total.cart-total-price, .yamuna-cart-mobile-total-value.js-cart-total'
    );
    applyDiscountToPriceEls(subtotalEls, delta);
    applyDiscountToPriceEls(totalEls, delta);
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
    syncCartPageBuyThreeTotals();
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
