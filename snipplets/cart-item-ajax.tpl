{{ component('nubesdk-slot', { type: "before_line_item", pick: item.id }) }}

{% set is_gift = item.is_gift %}
{% set discount_percentage = item.discount_percentage %}
{% set hide_compare_price_subtotal = not item.compare_at_price_subtotal or item.is_subscription_item %}

{% if cart_page %}
{# Pre-checkout cart row — Figma 1576:11580 #}
{% set unit_compare = item.compare_at_price %}
{% set has_unit_compare = unit_compare and unit_compare > item.unit_price %}
{% set buy_three_threshold = 3 %}
{% set buy_three_rate = 0.95 %}
{% set show_buy_three_unit = not is_gift and item.quantity >= buy_three_threshold %}
{% set buy_three_unit_price = item.unit_price * buy_three_rate %}
{% set buy_three_line_total = buy_three_unit_price * item.quantity %}
{% set cart_page_installments = item.product.get_max_installments(false) %}
{% if not cart_page_installments or cart_page_installments.installment <= 1 %}
  {% set cart_page_installments = item.product.get_max_installments %}
{% endif %}
{% set cart_page_installment_base = show_buy_three_unit ? buy_three_line_total : item.subtotal %}

<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} yamuna-cart-row" data-item-id="{{ item.id }}" data-gift="{{ is_gift ? 'true' : 'false' }}" data-store="cart-item-{{ item.product.id }}" data-component="cart.line-item" data-yamuna-unit-price="{{ item.unit_price }}" data-yamuna-promo-threshold="{{ buy_three_threshold }}" data-yamuna-promo-rate="{{ buy_three_rate }}">

  {% if not is_gift %}
    <div class="yamuna-cart-row-delete cart-item-delete">
      <button type="button" class="btn" onclick="LS.removeItem({{ item.id }})" data-component="line-item.remove" aria-label="{{ 'Remover' | translate }}">
        <img class="yamuna-cart-trash-icon" src="{{ 'images/yamuna/cart-trash-figma.svg' | static_url }}" alt="{{ 'Remover' | translate }}">
      </button>
    </div>
  {% else %}
    <div class="yamuna-cart-row-delete" aria-hidden="true"></div>
  {% endif %}

  <a class="yamuna-cart-row-image" href="{{ item.url }}">
    <img src="{{ item.featured_image | product_image_url('medium') }}" alt="{{ item.short_name }}" />
  </a>

  <div class="yamuna-cart-row-desc" data-component="line-item.name">
    <a href="{{ item.url }}" data-component="name.short-name">{{ item.short_name }}</a>
    <small data-component="name.short-variant-name">{{ item.short_variant_name }}</small>
    {{ component(
      'cart-labels', {
        group: true,
        subscription_label: true,
        hide_percentage_off_label: true,
        labels_classes: {
          group: 'mt-1',
          label: 'd-inline-block label label-accent label-small font-smallest mb-1',
          subscription: 'font-smallest opacity-80 mt-1 mb-0',
        },
      })
    }}
    {% if is_gift %}
      <div class="text-accent font-smallest font-weight-bold text-uppercase mt-1">{{ "Regalo" | translate }}</div>
    {% endif %}
  </div>

  <div class="yamuna-cart-row-qty cart-item-quantity" data-component="line-item.quantity">
    {% embed "snipplets/forms/form-input.tpl" with{
      type_number: true,
      input_value: item.quantity,
      input_name: 'quantity[' ~ item.id ~ ']',
      input_data_attr: 'item-id',
      input_data_val: item.id,
      input_group_custom_class: 'yamuna-cart-page-qty form-quantity cart-item-quantity mb-0',
      input_custom_class: 'js-cart-quantity-input text-center',
      input_label: false, input_append_content: true,
      input_disabled: is_gift,
      data_component: 'quantity.value',
      form_control_container_custom_class: 'yamuna-cart-page-qty-field'} %}
        {% block input_prepend_content %}
          <span class="js-cart-quantity-btn yamuna-cart-minus form-quantity-icon btn" onclick="var inp = this.closest('.cart-item-quantity') ? this.closest('.cart-item-quantity').querySelector('.js-cart-quantity-input') : null; var val = (inp && parseInt(inp.value, 10)) || 1; if (val <= 1) { LS.removeItem({{ item.id }}); } else { LS.minusQuantity({{ item.id }}); }" data-component="quantity.minus">
            <svg class="icon-inline icon-w-12 svg-icon-primary"><use xlink:href="#minus"/></svg>
          </span>
        {% endblock input_prepend_content %}
        {% block input_append_content %}
          <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
            <svg class="icon-inline icon-spin svg-icon-primary"><use xlink:href="#circle-notch"/></svg>
          </span>
          <span class="js-cart-quantity-btn yamuna-cart-plus form-quantity-icon btn" onclick="LS.plusQuantity({{ item.id }})" data-component="quantity.plus">
            <svg class="icon-inline icon-w-12 svg-icon-primary"><use xlink:href="#plus"/></svg>
          </span>
        {% endblock input_append_content %}
    {% endembed %}
  </div>

  <div class="yamuna-cart-row-unit" data-component="line-item.unit-price">
    {% if is_gift %}
      <div class="yamuna-cart-row-price-compare">{{ item.compare_at_price | money }}</div>
      <div class="yamuna-cart-row-price">{{ "Gratis" | translate }}</div>
    {% else %}
      {# Same buy-3 De/Por as minicart when qty >= 3 #}
      <div class="yamuna-cart-page-unit-promo{% if not show_buy_three_unit %} is-hidden{% endif %}" data-yamuna-unit-promo>
        <p class="yamuna-cart-page-unit-de">De <span class="yamuna-cart-page-unit-de-value" data-yamuna-unit-de>{{ item.unit_price | money }}</span></p>
        <p class="yamuna-cart-page-unit-por"><span class="yamuna-cart-page-unit-por-label">Por</span> <span class="yamuna-cart-page-unit-por-value" data-yamuna-unit-por>{{ buy_three_unit_price | money }}</span></p>
      </div>
      <div class="js-cart-item-unit-price-compare-price-container yamuna-cart-row-price-compare" data-line-item-id="{{ item.id }}"{% if not has_unit_compare or show_buy_three_unit %} style="display: none"{% endif %}>
        <span class="js-cart-item-unit-price-compare-price" data-line-item-id="{{ item.id }}" data-component="compare_price.value" data-component-value='{{ unit_compare | money }}'>{{ unit_compare | money }}</span>
      </div>
      <div class="js-cart-item-unit-price yamuna-cart-row-price{% if show_buy_three_unit %} is-hidden{% endif %}" data-line-item-id="{{ item.id }}" data-yamuna-unit-plain>{{ item.unit_price | money }}</div>
    {% endif %}
  </div>

  <div class="yamuna-cart-row-total" data-component="line-item.subtotal">
    {% if is_gift %}
      <div class="yamuna-cart-row-price-compare">{{ item.compare_at_price_subtotal | money }}</div>
      <div class="yamuna-cart-row-price">{{ "Gratis" | translate }}</div>
    {% else %}
      <div class="js-cart-item-subtotal-compare-price-container yamuna-cart-row-price-compare{% if show_buy_three_unit %} is-visible{% endif %}" data-line-item-id="{{ item.id }}" data-yamuna-line-compare{% if not show_buy_three_unit %} style="display: none" aria-hidden="true"{% endif %}>
        <span class="js-cart-item-subtotal-compare-price" data-line-item-id="{{ item.id }}" data-component="subtotal_compare_price.value" data-component-value='{{ item.subtotal | money }}'>{{ item.subtotal | money }}</span>
      </div>
      <div class="js-cart-item-subtotal yamuna-cart-row-price" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value='{{ item.subtotal | money }}' data-yamuna-line-total>{% if show_buy_three_unit %}{{ buy_three_line_total | money }}{% else %}{{ item.subtotal | money }}{% endif %}</div>
      {% if cart_page_installments and cart_page_installments.installment > 1 %}
        <div class="yamuna-cart-row-installments" data-yamuna-installments data-installment-count="{{ cart_page_installments.installment }}">em {{ cart_page_installments.installment }}x de {{ (cart_page_installment_base / cart_page_installments.installment) | money }} sem juros</div>
      {% endif %}
    {% endif %}
  </div>
</div>

{% else %}
{# Minicart / ajax cart - Figma: image | body; controls row (qty|ASSINAR|trash). #}
{% set buy_three_threshold = 3 %}
{% set buy_three_rate = 0.95 %}
{% set show_buy_three_unit = not is_gift and item.quantity >= buy_three_threshold %}
{% set buy_three_unit_price = item.unit_price * buy_three_rate %}
<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-item yamuna-minicart-item" data-item-id="{{ item.id }}" data-gift="{{ is_gift ? 'true' : 'false' }}" data-store="cart-item-{{ item.product.id }}" data-component="cart.line-item">

  <div class="yamuna-minicart-item-image">
    <a href="{{ item.url }}">
      <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-fluid{% if settings.theme_rounded %} box-rounded-small{% endif %}" alt="{{ item.short_name }}" />
    </a>
  </div>

  <div class="yamuna-minicart-item-body">
    <div class="yamuna-minicart-item-top">
      <h6 class="cart-item-name" data-component="line-item.name">
        <a href="{{ item.url }}" data-component="name.short-name">{{ item.short_name }}</a>
        <small data-component="name.short-variant-name">{{ item.short_variant_name }}</small>
        {{ component(
          'cart-labels', {
            group: true,
            subscription_label: true,
            hide_percentage_off_label: true,
            labels_classes: {
              group: 'mt-2',
              label: 'd-inline-block label label-accent label-small font-smallest mb-1',
              subscription: 'font-smallest opacity-80 mt-1 mb-2',
            },
          })
        }}
        {% if is_gift %}
          <div class="text-accent font-smallest font-weight-bold text-uppercase my-2">
            {{ "Regalo" | translate }}
          </div>
        {% endif %}
      </h6>

      <div class="cart-item-subtotal" data-component="line-item.subtotal" data-yamuna-unit-price="{{ item.unit_price }}" data-yamuna-promo-threshold="{{ buy_three_threshold }}" data-yamuna-promo-rate="{{ buy_three_rate }}">
        {% if is_gift %}
          <div class="price-compare font-small opacity-50">{{ item.compare_at_price_subtotal | money }}</div>
          <div class="h6 mt-1">{{ "Gratis" | translate }}</div>
        {% else %}
          {# Prod-like unit pricing when buy-3 promo applies (qty >= 3): De / Por #}
          <div class="yamuna-minicart-unit-promo{% if not show_buy_three_unit %} is-hidden{% endif %}" data-yamuna-unit-promo>
            <p class="yamuna-minicart-unit-de">De <span class="yamuna-minicart-unit-de-value" data-yamuna-unit-de>{{ item.unit_price | money }}</span></p>
            <p class="yamuna-minicart-unit-por"><span class="yamuna-minicart-unit-por-label">Por</span> <span class="yamuna-minicart-unit-por-value" data-yamuna-unit-por>{{ buy_three_unit_price | money }}</span></p>
          </div>
          <div class="js-cart-item-subtotal-compare-price-container" data-line-item-id="{{ item.id }}"{% if hide_compare_price_subtotal %} style="display: none"{% endif %}>
            <span class="text-accent font-small font-weight-bold mr-1">-{{ discount_percentage }}%</span>
            <span class="js-cart-item-subtotal-compare-price price-compare font-small opacity-50 mr-0" data-line-item-id="{{ item.id }}" data-component="subtotal_compare_price.value" data-component-value='{{ item.compare_at_price_subtotal | money }}'>{{ item.compare_at_price_subtotal | money }}</span>
          </div>
          <div class="js-cart-item-subtotal h6 {% if not hide_compare_price_subtotal %}mt-1{% endif %}{% if show_buy_three_unit %} is-hidden{% endif %}" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value='{{ item.subtotal | money }}'>{{ item.subtotal | money }}</div>
        {% endif %}
      </div>
    </div>

  </div>

  <div class="yamuna-minicart-item-controls">
    <div class="cart-item-quantity" data-component="line-item.quantity">
      {% embed "snipplets/forms/form-input.tpl" with{
        type_number: true,
        input_value: item.quantity,
        input_name: 'quantity[' ~ item.id ~ ']',
        input_data_attr: 'item-id',
        input_data_val: item.id,
        input_group_custom_class: 'yamuna-minicart-qty form-quantity cart-item-quantity small mb-0',
        input_custom_class: 'js-cart-quantity-input text-center h6',
        input_label: false, input_append_content: true,
        input_disabled: is_gift,
        data_component: 'quantity.value',
        form_control_container_custom_class: 'col'} %}
          {% block input_prepend_content %}
            <span class="js-cart-quantity-btn yamuna-cart-minus form-quantity-icon btn" onclick="var inp = this.closest('.cart-item-quantity') ? this.closest('.cart-item-quantity').querySelector('.js-cart-quantity-input') : null; var val = (inp && parseInt(inp.value, 10)) || 1; if (val <= 1) { LS.removeItem({{ item.id }}, true); } else { LS.minusQuantity({{ item.id }}, true); }" data-component="quantity.minus">
              <svg class="icon-inline icon-w-12 svg-icon-primary"><use xlink:href="#minus"/></svg>
            </span>
          {% endblock input_prepend_content %}
          {% block input_append_content %}
            <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
              <svg class="icon-inline icon-spin svg-icon-primary"><use xlink:href="#circle-notch"/></svg>
            </span>
            <span class="js-cart-quantity-btn form-quantity-icon btn" onclick="LS.plusQuantity({{ item.id }}, true)" data-component="quantity.plus">
              <svg class="icon-inline icon-w-12 svg-icon-primary"><use xlink:href="#plus"/></svg>
            </span>
          {% endblock input_append_content %}
      {% endembed %}
    </div>

    {% if not is_gift %}
      <div class="cart-item-delete">
        <button type="button" class="btn" onclick="LS.removeItem({{ item.id }}, true)" data-component="line-item.remove" aria-label="{{ 'Remover' | translate }}">
          <img class="yamuna-cart-trash-icon" src="{{ 'images/yamuna/cart-trash-figma.svg' | static_url }}" alt="{{ 'Remover' | translate }}">
        </button>
      </div>
    {% endif %}
  </div>
</div>
{% endif %}
