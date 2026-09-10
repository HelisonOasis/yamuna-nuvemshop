{# Yamuna pre-checkout cart page — matches yamuna.com.br/checkout #}
{% set has_validation_messages = cart.checkout_enabled_validation_messages | length > 0 %}
{% set should_show_checkout_button = cart.checkout_enabled and not has_validation_messages %}

<div id="shoppingCartPage" class="yamuna-cart-page" data-minimum="{{ settings.cart_minimum_value }}" data-store="cart-page">
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
            <span class="yamuna-cart-col-spacer"></span>
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
  </div>

  <div class="yamuna-checkout-extras">
    {% include "snipplets/cart/cart-recommendations.tpl" %}
    {% include "snipplets/cart/cart-depositions.tpl" %}
  </div>

  <div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>
