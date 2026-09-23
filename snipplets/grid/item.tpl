{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% set empty_placeholder_image = 'images/empty-placeholder.png' | static_url %}

{% set slide_item = slide_item | default(false) %}
{% set columns = settings.grid_columns %}
{% set is_pdp_related_spot = is_pdp_related_spot | default(false) %}
{% set is_cart_reco_spot = is_cart_reco_spot | default(false) %}
{% set is_blog_related_spot = is_blog_related_spot | default(false) %}
{% set is_home_product_spot = (template == 'home' and section_name in ['primary', 'new', 'sale', 'empty-related']) or (slide_item and section_name in ['primary', 'new', 'sale', 'empty-related']) %}
{% set is_yamuna_spot_card = is_home_product_spot or is_pdp_related_spot or is_cart_reco_spot %}
{% set spot_ns = is_pdp_related_spot ? 'yamuna-pdp-spot' : (is_cart_reco_spot ? 'yamuna-pdp-spot' : 'yamuna-home-spot') %}
{% set spot_qty_class = is_pdp_related_spot or is_cart_reco_spot ? 'js-pdp-spot-add-quantity' : 'js-home-spot-add-quantity' %}

{% if slide_item %}
    <div class="swiper-slide{% if settings.theme_rounded and not reduced_item %} p-3{% endif %}">
{% endif %}

{% set grid_classes = columns == 1 ? 'col-12 col-md-6 col-lg-4' : 'col-6 col-md-4 col-lg-3' %}
{% set reduced_item_class = reduced_item ? 'item-product-reduced m-0 p-0' %}

{# Item image slider #}

{% set show_image_slider = 
    (template == 'category' or template == 'search')
    and settings.product_item_slider 
    and not slide_item
    and not reduced_item 
    and not has_filters
    and product.other_images
%}

{% if show_image_slider %}
    {% set slider_controls_container_class = 'item-slider-controls-container svg-circle svg-icon-text d-none d-md-block' %}
    {% set slider_controls_thickness_class = settings.icons_solid ? 'svg-solid' %}
    {% set control_next_svg_id = 'chevron' %}
    {% set control_prev_svg_id = 'chevron' %}    
{% endif %}

{# Secondary images — enable hover swap like production (077/078/079). #}
{% set show_secondary_image = true %}
{% if is_cart_reco_spot %}
    {% set show_secondary_image = false %}
    {% set image_priority_high = true %}
{% endif %}
{% set image_priority_high = image_priority_high | default(false) %}

{% if settings.theme_rounded %}
    <div class="js-item-product {% if highlighted_products_setting_name %}js-products-{{ highlighted_products_setting_name }}-product{% endif %} {% if not slide_item %}{{ grid_classes }}{% endif %}" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}" data-grid-classes="{{ grid_classes }}" data-yamuna-tags="{{ product.name | lower }}">
        <div class="item item-rounded item-product box-rounded p-0 {{ reduced_item_class }}">
{% else %}
    <div class="js-item-product {% if highlighted_products_setting_name %}js-products-{{ highlighted_products_setting_name }}-product{% endif %} {% if not slide_item %}{{ grid_classes }}{% endif %} item item-product {{ reduced_item_class }}" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}" data-grid-classes="{{ grid_classes }}" data-yamuna-tags="{{ product.name | lower }}">
{% endif %}

        {% if not reduced_item %}
            <div id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}" class="js-product-container js-quickshop-container position-relative {% if product.variations %}js-quickshop-has-variants{% endif %}" data-variants="{{ product.variants_object | json_encode }}">
        {% endif %}

        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}

        {# Cart reco: skip img-absolute-centered — theme translateX(-50%) clips/shifts jars when left:0 is forced #}
        {% if is_cart_reco_spot %}
            {% set image_classes = 'js-item-image lazyautosizes ' ~ (not image_priority_high ? 'lazyload') ~ ' fade-in img-absolute' %}
        {% else %}
            {% set image_classes = 'js-item-image lazyautosizes ' ~ (not image_priority_high ? 'lazyload') ~ ' fade-in img-absolute img-absolute-centered' %}
        {% endif %}
            
        {% set data_expand = show_image_slider ? '50' : '-10' %}
            
        {% set floating_elements %}

            {% if not reduced_item %}
                {% if settings.product_color_variants %}
                    {% include 'snipplets/labels.tpl' with {color: true} %}
                    {% include 'snipplets/grid/item-colors.tpl' %}
                {% else %}
                    {% include 'snipplets/labels.tpl' %}
                {% endif %}
            {% endif %}
            {% if (settings.quick_shop or settings.product_color_variants) and product.available and product.display_price and product.variations and not reduced_item %}
                <div class="item-buy{% if settings.product_color_variants and not settings.quick_shop %} hidden{% endif %}">
                    <div class="js-item-variants item-buy-variants{% if settings.theme_rounded %} px-1 py-2 p-md-3{% endif %}">
                        <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% if product.variations %}
                                {% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
                            {% endif %}
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                            {# Add to cart CTA #}

                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-small w-100 mb-2 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                            {# Fake add to cart CTA visible during add to cart event #}

                            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-small w-100 mb-2"} %}
                        </form>
                        <a href="#" class="js-item-buy-close">
                            <svg class="icon-inline icon-lg svg-circle svg-icon-text"><use xlink:href="#times"/></svg>
                        </a>
                    </div>
                </div>
            {% endif %}

        {% endset %}

        {{ component(
            'product-item-image', {
                image_lazy: not is_cart_reco_spot,
                image_lazy_js: not is_cart_reco_spot,
                image_data_expand: data_expand,
                image_secondary_data_sizes: 'auto',
                secondary_image: show_secondary_image,
                slider: show_image_slider,
                placeholder: not is_cart_reco_spot,
                image_priority_high: image_priority_high,
                custom_content: floating_elements,
                slider_pagination_container: true,
                product_item_image_classes: {
                    image_container: 'item-image' ~ (columns == 1 ? ' item-image-big') ~ (show_image_slider ? ' item-image-slider'),
                    image: image_classes,
                    image_featured: 'item-image-featured',
                    image_secondary: 'item-image-secondary',
                    slider_container: 'swiper-container position-absolute h-100 w-100',
                    slider_wrapper: 'swiper-wrapper',
                    slider_slide: 'swiper-slide item-image-slide',
                    slider_control_pagination_container: 'item-slider-pagination-container d-md-none ' ~ (product.images_count == 2 ? 'two-bullets'),
                    slider_control_pagination: 'swiper-pagination item-slider-pagination',
                    slider_control: 'icon-inline icon-lg',
                    slider_control_prev_container: 'swiper-button-prev ' ~ slider_controls_container_class ~ ' ' ~ slider_controls_thickness_class,
                    slider_control_prev: 'icon-flip-horizontal',
                    slider_control_next_container: 'swiper-button-next ' ~ slider_controls_container_class ~ ' ' ~ slider_controls_thickness_class,
                    more_images_message: 'item-more-images-message',
                    placeholder: 'placeholder-fade',
                },
                control_next_svg_id: control_next_svg_id,
                control_prev_svg_id: control_prev_svg_id,
            })
        }}

        {# Subscription data - calculate only is_subscription_only for the CTA button #}
        {% set is_subscription_only = product.isSubscriptionOnly() %}

        {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 and settings.product_installments and not is_subscription_only %}

        <div class="item-description {% if reduced_item %}py-3{% else %}py-4{% endif %}{% if settings.theme_rounded %} px-3{% else %} px-1{% endif %}" data-store="product-item-info-{{ product.id }}"{% if is_yamuna_spot_card %} style="border-bottom:0 !important;"{% endif %}>
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">

                {{ component('nubesdk-slot', { type: "before_product_grid_item_name" }) }}

                <div class="js-item-name item-name {% if reduced_item %}mb-2{% else %}mb-3{% endif %}" data-store="product-item-name-{{ product.id }}"{% if is_yamuna_spot_card and not is_cart_reco_spot %} style="display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"{% elseif is_cart_reco_spot %} style="display:-webkit-box; -webkit-box-orient:vertical; -webkit-line-clamp:1; overflow:hidden; text-overflow:ellipsis; white-space:normal;"{% endif %}>{{ product.name }}</div>

                {{ component('nubesdk-slot', { type: "after_product_grid_item_name" }) }}

                {{ component('nubesdk-slot', { type: "before_product_grid_item_price" }) }}

                {% if product.display_price %}
                    {% if is_yamuna_spot_card %}
                        <div class="{{ spot_ns }}-price-row">
                    {% endif %}
                    {% if is_subscription_only %}
                        {# Subscription only products: use subscription-price component with product_list location #}
                        {{ component('subscriptions/subscription-price', {
                            location: 'product_list',
                            subscription_classes: {
                                container: 'item-price-container mb-1',
                                price_compare: 'price-compare',
                                price_with_subscription: 'item-price',
                            },
                        }) }}
                    {% else %}
                        {# Normal products: original price display #}
                        <div class="item-price-container mb-1" data-store="product-item-price-{{ product.id }}">
                            {% if not reduced_item %}
                                <span class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price or product.compare_at_price <= product.price %}style="display:none;"{% else %}style="display:inline-block;"{% endif %}>
                                    {{ product.compare_at_price | money }}
                                </span>
                            {% endif %}
                            <span class="js-price-display item-price" data-product-price="{{ product.price }}">
                                {{ product.price | money }}
                            </span>
                            {% if product_can_show_installments and not is_yamuna_spot_card %}
                                {{ component('installments', {'location' : 'product_item', container_classes: { installment: "item-installments"}}) }}
                            {% endif %}
                        </div>
                    {% endif %}
                {% endif %}

                {{ component('nubesdk-slot', { type: "after_product_grid_item_price" }) }}

                {% if is_yamuna_spot_card and product_can_show_installments %}
                    {% if is_pdp_related_spot %}
                        {# PDP related: "ou 10x de R$4,99 sem juros". Cart checkout: "ou até Nx de R$X no cartão". #}
                        {% set spot_installments = product.get_max_installments(false) %}
                        {% if not spot_installments or spot_installments.installment <= 1 %}
                            {% set spot_installments = product.get_max_installments %}
                        {% endif %}
                        <div class="{{ spot_ns }}-payment">
                            {% if is_cart_reco_spot %}
                                ou até {{ spot_installments.installment }}x de {{ (product.price / spot_installments.installment) | money }} no cartão
                            {% else %}
                                ou {{ spot_installments.installment }}x de {{ (product.price / spot_installments.installment) | money }} sem juros
                            {% endif %}
                        </div>
                    {% else %}
                        <div class="{{ spot_ns }}-payment">
                            <span class="{{ spot_ns }}-payment-prefix">ou</span>
                            {{ component('installments', {'location' : 'product_item', container_classes: { installment: "item-installments " ~ spot_ns ~ "-installments"}}) }}
                            <span class="{{ spot_ns }}-payment-suffix">sem juros</span>
                        </div>
                    {% endif %}
                {% endif %}

                {% if is_yamuna_spot_card and product.display_price %}
                    </div>
                {% endif %}

            </a>

            {% if not reduced_item %}
                {% set discount_price_spacing_classes = product_can_show_installments ? 'mt-1 mb-2' %}

                {{ component('payment-discount-price', {
                        visibility_condition: settings.payment_discount_price and not is_subscription_only,
                        location: 'product',
                        container_classes: discount_price_spacing_classes ~ " font-small font-md-normal text-accent font-weight-bold",
                    }) 
                }}

                {% if not reduced_item %}
                
                    {{ component('subscriptions/subscription-message', {
                        subscription_icon: true,
                        subscription_icon_svg_id: 'returns' ~ (not settings.icons_solid ? '-alt'),
                        subscription_classes: {
                            container: 'mt-2 font-small text-accent font-weight-bold ' ~ (product_can_show_installments ? 'mb-2'),
                            icon: 'icon-inline svg-icon-accent mr-1',
                        },
                    }) }}

                {% endif %}
               
            {% endif %}
        </div>
        {% if not reduced_item %}
            {% set show_spot_card_actions = true %}
            {% if ((template == 'category' or template == 'search') and not is_pdp_related_spot) or is_blog_related_spot %}
                <div class="yamuna-plp-item-actions">
                    {% if product.available and product.display_price %}
                        {% if product.isSubscribable() or product.variations %}
                            <a href="{{ product_url_with_selected_variant }}" class="yamuna-plp-buy-one" title="{{ 'Comprar' | translate }} {{ product.name }}">
                                {{ 'Comprar' | translate }}
                            </a>
                        {% else %}
                            {% set three_unit_price = (product.price * 0.95) | money %}
                            <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                <input class="js-home-spot-add-quantity" type="hidden" name="quantity" value="1" />
                                <button type="submit" class="js-addtocart js-prod-submit-form yamuna-plp-buy-one" data-quantity="1" data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}">
                                    <img src="{{ 'images/yamuna/home-spot-bag-white.svg' | static_url }}" alt="" aria-hidden="true" />
                                    {{ 'Comprar' | translate }}
                                </button>
                                <button type="submit" class="js-addtocart js-prod-submit-form yamuna-plp-buy-three" data-quantity="3" data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}">
                                    <img src="{{ 'images/yamuna/home-spot-bag-teal.svg' | static_url }}" alt="" aria-hidden="true" />
                                    <span class="yamuna-plp-buy-three-prefix">{{ 'Compre 3' | translate }}</span><span class="yamuna-plp-buy-three-price"> {{ 'por' | translate }} {{ three_unit_price }} {{ 'cada' | translate }}</span>
                                </button>
                            </form>
                        {% endif %}
                    {% elseif not product.available %}
                        <a href="{{ product.url }}" class="yamuna-plp-avise-me" title="{{ 'Avise-me' | translate }} — {{ product.name }}">{{ 'Avise-me' | translate }}</a>
                    {% else %}
                        <a href="{{ product.url }}" class="yamuna-plp-buy-one">{{ 'Consultar' | translate }}</a>
                    {% endif %}
                </div>
            {% elseif show_spot_card_actions %}
                <div class="item-actions row justify-content-center{% if settings.theme_rounded %} m-0 mb-3{% endif %}{% if not product.available %} yamuna-item-actions-avise{% endif %}">
                    {% if product.available and product.display_price %}
                        <div class="col-8 col-md-6 pr-1">

                            {% set quickshop_button_primary_classes = 'btn btn-primary btn-small w-100 mb-2' %}
                            {% set quickshop_button_js_classes = not product.isSubscribable() ? 'js-item-buy-open' %}
                            {% set quickshop_href = product.isSubscribable() ? product_url_with_selected_variant : '#' %}

                            {% if product.isSubscribable() or product.variations %}
                                {% set button_text = is_subscription_only ? ('our_components.subscriptions.subscribe' | tt) : ('Comprar' | translate) %}
                                {% set button_title = is_subscription_only ? ('our_components.subscriptions.subscribe' | tt) ~ ' ' ~ product.name : ('Compra rápida de' | translate) ~ ' ' ~ product.name %}
                                <a href="{{ quickshop_href }}" class="{{ quickshop_button_js_classes }} {{ quickshop_button_primary_classes }} d-block item-buy-open" title="{{ button_title }}" aria-label="{{ button_title }}" {% if not product.isSubscribable() %}data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}"{% endif %}>{{ button_text }}</a>
                            {% else %}
                                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Comprar", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                                    {% if is_yamuna_spot_card %}
                                        {% set three_unit_price = (product.price * 0.95) | money %}
                                        <input class="{{ spot_qty_class }}" type="hidden" name="quantity" value="1" />
                                        <button type="button" class="js-addtocart js-prod-submit-form {{ quickshop_button_primary_classes }} {{ spot_ns }}-buy-one {{ state }}" data-quantity="1" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}">
                                            <img class="{{ spot_ns }}-bag" src="{{ 'images/yamuna/home-spot-bag-white.svg' | static_url }}" alt="" aria-hidden="true" />
                                            <span>{{ texts[state] | translate }}</span>
                                        </button>
                                        <button type="button" class="js-addtocart js-prod-submit-form btn btn-secondary btn-small w-100 {{ spot_ns }}-buy-three {{ state }}" data-quantity="3" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}">
                                            <img class="{{ spot_ns }}-bag" src="{{ 'images/yamuna/home-spot-bag-teal.svg' | static_url }}" alt="" aria-hidden="true" />
                                            <span class="{{ spot_ns }}-buy-three-label">
                                              <span class="{{ spot_ns }}-buy-three-prefix">Compre 3</span>
                                              <span class="{{ spot_ns }}-buy-three-price">por {{ three_unit_price }} cada</span>
                                            </span>
                                        </button>
                                    {% else %}
                                        <input type="submit" class="js-addtocart js-prod-submit-form {{ quickshop_button_primary_classes }} {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}"/>
                                    {% endif %}

                                    {% if not is_pdp_related_spot %}
                                    {# Fake add to cart CTA visible during add to cart event #}

                                    {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-small w-100 mb-2", direct_add: true} %}
                                    {% endif %}
                                </form>
                            {% endif %}
                        </div>
                        <div class="col-4 col-md-6 pl-1">
                            <a href="{{ product.url }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="d-block btn btn-secondary btn-small">
                                <svg class="icon-inline svg-icon-primary icon-w-19"><use xlink:href="#eye"/></svg>
                                <span class="d-none d-md-inline-block">{{ "Ver" | translate }}</span></a>
                        </div>
                    {% elseif not product.available %}
                        {# First-child wrap so theme rules that hide :last-child (Ver) don't kill Avise-me #}
                        <div class="col-12 yamuna-avise-me-wrap">
                            <a href="{{ product.url }}" class="yamuna-plp-avise-me{% if is_yamuna_spot_card %} {{ spot_ns }}-avise-me{% endif %}" title="{{ 'Avise-me' | translate }} — {{ product.name }}">{{ 'Avise-me' | translate }}</a>
                        </div>
                        <div class="yamuna-avise-me-spacer" aria-hidden="true"></div>
                    {% else %}
                        <div class="col-12 col-md-6">
                            <a href="{{ product.url }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="d-block btn btn-secondary btn-small">
                                <svg class="icon-inline svg-icon-primary icon-w-19"><use xlink:href="#eye"/></svg>
                                <span>{{ "Ver" | translate }}</span></a>
                        </div>
                    {% endif %}
                </div>
            {% endif %}
            {% if not reduced_item %}
                </div>{# This closes the quickshop tag #}
            {% endif %}
        {% endif %}

        {# Structured data to provide information for Google about the product content #}
        {{ component('structured-data', {'item': true}) }}
    </div>
{% if settings.theme_rounded %}
    </div>
{% endif %}
{% if slide_item %}
    </div>
{% endif %}
