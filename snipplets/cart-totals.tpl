{# Cart summary — shipping/pickup, coupon input, totals and checkout CTA. Shared by templates/cart.tpl (cart_page) and snipplets/cart-panel.tpl (cart popup). #}

{# Check if store has free shipping without regions or categories #}

{% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

{% set gift_progress_parameters = {
  progress_bar_icon_svg_id: 'gift',
  check_svg_id: 'check-circle',
  show_check: true,
  progress_bar_classes: {
    container: 'progress-bar',
    title_container: 'progress-bar-title-container',
    title: 'progress-bar-title text-accent',
    icon: 'progress-bar-icon icon-inline svg-icon-accent icon-lg',
    subtitle: 'progress-bar-subtitle font-small opacity-50',
    track: 'bar-progress',
    fill: 'bar-progress-active transition-soft',
    check: 'bar-progress-check transition-soft',
    check_icon: 'icon-inline icon-lg',
  }
} %}

{{ component('gift-promotion-progress', gift_progress_parameters) }}

{% if has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

  {# includes free shipping progress bar: only if store has free shipping with a minimum #}

  {% include "snipplets/shipping/shipping-free-rest.tpl" %}
{% endif %}

{# Define conditions to show shipping calculator and store branches on cart #}

{% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

{% if cart_page %}
  <div class="container p-0">
    <div class="row">
      <div class="col-12 col-md-4">
{% endif %}

    {# Cart shipping and pickup #}

    {{ component('nubesdk-slot', { type: "before_cart_shipping_options" }) }}

    {% if show_cart_fulfillment %}
      <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>

        {% if not cart_page %}
          <div class="js-visible-on-cart-filled divider" {% if cart.items_count == 0 %}style="display:none;"{% endif %}></div>
        {% endif %}
        <div class="js-visible-on-cart-filled js-has-new-shipping js-shipping-calculator-container">

          {# Saved shipping not available #}

          <div class="js-shipping-method-unavailable alert alert-warning row m-1" style="display: none;">
            <div class="col-11 text-left"><strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible para este carrito. ' | translate }}</strong></br>
              {{ '¡No te preocupes! Podés elegir otro.' | translate}}</div>
          </div>

          {# Shipping calculator and branch link #}

          <div id="cart-shipping-container" class="row" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

            {# Used to save shipping #}

            <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hidden">{{ cart.shipping_data.name }}</span>

            {# Shipping Calculator #}

            {% if store.has_shipping %}
              {% include "snipplets/shipping/shipping-calculator.tpl" with { 'product_detail': false} %}
            {% endif %}

            {# Store branches #}

            {% if store.branches %}
              {% include "snipplets/shipping/branches.tpl" with {'product_detail': false} %}
            {% endif %}
          </div>
        </div>
        {% if not cart_page %}
          <div class="js-visible-on-cart-filled divider {% if not store.branches %} mt-0{% endif %}" {% if cart.items_count == 0 %}style="display:none;"{% endif %}></div>
        {% endif %}
      </div>
    {% endif %}

    {{ component('nubesdk-slot', { type: "after_cart_shipping_options" }) }}

{% if cart_page %}
      </div>

      <div class="col-12 col-md-8" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
        <div id="cart-sticky-summary" class="position-sticky-md row justify-content-end mt-3 mt-md-0">
          <div class="col-12 col-md-6">
            <div class="box box-border float-right">
{% endif %}

              {# Coupon input #}

              {% if settings.cart_coupon %}
                <div class="js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
                  {{ component('coupon-input', {
                    label_svg_id: 'tag',
                    toggle_inactive_svg_id: 'chevron-down',
                    toggle_active_svg_id: 'chevron-down',
                    spinner_svg_id: 'circle-notch',
                    container_classes: {
                      container: 'mb-3',
                      content: 'pt-2',
                      toggle: 'd-flex align-items-center justify-content-between w-100',
                      toggle_icon: 'icon-inline',
                      toggle_active: 'icon-flip-vertical',
                      toggle_label: 'd-flex align-items-center',
                      label_icon: 'icon-inline icon-lg icon-w-20 svg-icon-text mr-2 align-text-bottom',
                      label: 'font-small',
                      actions: 'mt-2',
                      applied_row: 'd-flex align-items-center justify-content-between',
                      applied_code: cart_page ? 'mr-4' : 'mr-4 font-weight-bold',
                      remove_button: 'btn btn-secondary btn-small float-right py-1 px-2 px-sm-3',
                      spinner: 'ml-2',
                      spinner_icon: 'icon-inline icon-spin svg-icon-text',
                      form: 'form-group mb-0',
                      input_wrapper: 'd-flex form-group-inline align-items-center',
                      input: 'form-control col-6 col-lg-7 pr-0',
                      apply_button: 'btn btn-secondary btn-block',
                      error: 'alert alert-danger mb-0 mt-2',
                    }
                  }) }}
                </div>

                {# Divider between coupon input and subtotal #}
                <div class="divider"></div>
              {% endif %}

              {# Cart totals: subtotal, promos, coupon discount, shipping cost, total, payment/installments #}

              {# Accent + bold only in the cart popup (ajax); no bold on the cart page. Applies to discounts, coupon and free shipping #}
              {% set discount_accent = not cart_page ? 'text-accent font-weight-bold' %}
              {% set free_shipping_accent = (not cart_page and cart.free_shipping.cart_has_free_shipping) ? 'text-accent font-weight-bold' : 'opacity-40' %}
              {# Heading rows (subtotal, shipping, total) are bold via h5/h2; keep that only in the popup #}
              {% set summary_weight = cart_page ? 'font-weight-normal'%}

              {{ component('cart-totals', {
                shipping_enabled: show_cart_fulfillment,
                shipping_discount_row_enabled: true,
                payment_discount_price_enabled: settings.payment_discount_price,
                installments_enabled: not settings.payment_discount_price,
                totals_divider: true,
                container_classes: {
                  totals_divider: 'divider',
                },
                text_classes: {
                  subtotal: 'h5 justify-content-between d-flex ' ~ summary_weight,
                  subtotals_row: 'd-flex justify-content-between mb-1',
                  subtotals_prices: 'text-right',
                  price_without_taxes: 'd-flex justify-content-between mb-2 font-small opacity-60',
                  price_without_taxes_price: 'text-right',
                  promotions: discount_accent,
                  promotions_detail_container: 'p-0',
                  discounts_row: discount_accent,
                  shipping_costs: 'h5 ' ~ summary_weight,
                  shipping_costs_price: free_shipping_accent,
                  shipping_costs_calculating: 'opacity-40',
                  shipping_costs_empty: 'opacity-40',
                  shipping_discount_row: 'h5 ' ~ discount_accent ~ ' ' ~ summary_weight,
                  total: 'd-flex justify-content-between mb-3 h2 text-primary',
                  total_price: 'text-right',
                  payment_discount_and_installments: 'text-right',
                  payment_discount_price: 'text-accent font-small font-weight-normal mt-1',
                  installments: 'text-accent font-small font-weight-normal mt-1',
                },
              }) }}

              {{ component('nubesdk-slot', { type: "after_cart_summary" }) }}

              {{ component('nubesdk-slot', { type: "before_go_to_checkout" }) }}

              <div class="js-visible-on-cart-filled container-fluid" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>

                {# No stock alert #}

                <div id="error-ajax-stock" class='alert alert-warning mt-1' role='alert' style="display:none;">
                  {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
                </div>
                <div>

                  {# Cart page and popup CTA Module #}

                  {% set has_validation_messages = cart.checkout_enabled_validation_messages | length > 0 %}
                  {% set should_show_checkout_button = cart.checkout_enabled and not has_validation_messages %}
                  {% if cart_page %}

                    {# Cart page CTA and minimum alert: Always render button to ensure it exists in DOM, control visibility via CSS/JS #}

                    <div class="row mb-3">
                      <input id="go-to-checkout" class="btn btn-primary btn-block" {{ not should_show_checkout_button ? 'style="display:none"' }} type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
                    </div>

                    <div class="row">
                      {# Cart alert messages #}
                      {{ component(
                        'checkout-enabled-validation-messages', {
                          alert_classes: 'alert alert-warning mb-2',
                          cart_minimum_value: settings.cart_minimum_value
                        })
                      }}
                    </div>
                  {% else %}

                    {# Cart popup CTA and minimum alert #}

                    <div class="js-ajax-cart-submit row mb-3" {{ not should_show_checkout_button ? 'style="display:none"' }} id="ajax-cart-submit-div" >
                      <input class="btn btn-primary btn-block" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" data-component="cart.checkout-button"/>
                    </div>
                    <div class="row">
                      {# Cart alert messages #}
                      {{ component(
                          'checkout-enabled-validation-messages', {
                            alert_classes: 'alert alert-warning mb-2',
                            cart_minimum_value: settings.cart_minimum_value
                          })
                      }}
                    </div>
                  {% endif %}

                  {# Cart panel continue buying link #}

                  {% if settings.continue_buying %}
                    <div class="row mb-2">
                      <div class="text-center w-100">
                        <a href="{% if cart_page %}{{ store.products_url }}{% else %}#{% endif %}" class="{% if not cart_page %}js-modal-close js-fullscreen-modal-close{% endif %} btn-link">{{ 'Ver más productos' | translate }}</a>
                      </div>
                    </div>
                  {% endif %}
                </div>
              </div>

              {{ component('nubesdk-slot', { type: "after_go_to_checkout" }) }}

{% if cart_page %}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
{% endif %}
