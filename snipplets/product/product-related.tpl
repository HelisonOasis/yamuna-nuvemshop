{# Related products visibility conditions #}

{% set max_related_products_length = 8 %}
{% set related_products = [] %}
{% set related_ids = ',' ~ product.id ~ ',' %}
{% set related_products_without_stock = [] %}

{% set related_products_ids_from_app = product.metafields.related_products.related_products_ids %}
{% set has_related_products_from_app = related_products_ids_from_app | get_products | length > 0 %}

{# Prefer manually selected related products (app/metafields) #}
{% if has_related_products_from_app %}
    {% for related_product in related_products_ids_from_app | get_products if related_products | length < max_related_products_length %}
        {% if related_product.id != product.id and (',' ~ related_product.id ~ ',') not in related_ids %}
            {% set related_products = related_products | merge([related_product]) %}
            {% set related_ids = related_ids ~ related_product.id ~ ',' %}
        {% endif %}
    {% endfor %}
{% endif %}

{# Fill from category when under the target amount #}
{% if related_products | length < max_related_products_length %}
    {% if related_tag %}
        {% set products_from_category = related_products_from_controller %}
    {% else %}
        {% set products_from_category = category.products | shuffle %}
    {% endif %}

    {% for product_from_category in products_from_category if related_products | length < max_related_products_length %}
        {% if product_from_category.id != product.id and (',' ~ product_from_category.id ~ ',') not in related_ids %}
            {% if product_from_category.stock is null or product_from_category.stock > 0 %}
                {% set related_products = related_products | merge([product_from_category]) %}
                {% set related_ids = related_ids ~ product_from_category.id ~ ',' %}
            {% elseif related_products_without_stock | length < max_related_products_length %}
                {% set related_products_without_stock = related_products_without_stock | merge([product_from_category]) %}
            {% endif %}
        {% endif %}
    {% endfor %}
{% endif %}

{# Fill remaining slots from home featured sections for a larger carousel #}
{% if related_products | length < max_related_products_length %}
    {% set refill_pools = [] %}
    {% if sections.primary.products %}
        {% set refill_pools = refill_pools | merge(sections.primary.products) %}
    {% endif %}
    {% if sections.new.products %}
        {% set refill_pools = refill_pools | merge(sections.new.products) %}
    {% endif %}
    {% if sections.sale.products %}
        {% set refill_pools = refill_pools | merge(sections.sale.products) %}
    {% endif %}

    {% for refill_product in refill_pools | shuffle if related_products | length < max_related_products_length %}
        {% if refill_product.id != product.id and (',' ~ refill_product.id ~ ',') not in related_ids %}
            {% if refill_product.stock is null or refill_product.stock > 0 %}
                {% set related_products = related_products | merge([refill_product]) %}
                {% set related_ids = related_ids ~ refill_product.id ~ ',' %}
            {% elseif related_products_without_stock | length < max_related_products_length %}
                {% set related_products_without_stock = related_products_without_stock | merge([refill_product]) %}
            {% endif %}
        {% endif %}
    {% endfor %}
{% endif %}

{# Last resort: include out-of-stock products already collected #}
{% if related_products | length < max_related_products_length %}
    {% set number_of_related_products_for_refill = max_related_products_length - (related_products | length) %}
    {% set related_products_for_refill = related_products_without_stock | take(number_of_related_products_for_refill) %}
    {% set related_products = related_products | merge(related_products_for_refill) %}
{% endif %}

{% set complementary_products = complementary_product_list | length > 0 %}

{# Show alternative products when there are default category alternatives with no complementaries or manually selected alternatives #}
{% set alternative_products = related_products | length > 0 and not (complementary_products and source_alternative == 'default') %}

{# Set related products classes #}

{% set section_class = 'section-products-related position-relative mb-3' %}
{% set container_class = 'container px-0' %}
{% set title_container_class = 'text-center px-3' %}
{% set title_accent_class = settings.theme_rounded ? 'text-primary' %}
{% set title_class = 'h1' ~ title_accent_class %}
{% set products_container_class = 'products-slider swiper-container-horizontal p-relative' %}
{% set slider_container_class = 'swiper-container p-md-1' %}
{% set swiper_wrapper_class = 'swiper-wrapper' %}
{% set slider_control_class = 'icon-inline icon-2x' %}
{% set slider_controls_container_class = 'd-none d-md-block svg-circle svg-circle-big svg-icon-text' %}
{% set slider_controls_thickness_class = settings.icons_solid ? 'svg-solid' %}
{% set slider_control_prev_class = 'swiper-button-prev ' ~ slider_controls_container_class ~ ' ' ~ slider_controls_thickness_class %}
{% set slider_control_next_class = 'swiper-button-next ' ~ slider_controls_container_class ~ ' ' ~ slider_controls_thickness_class %}
{% set slider_control_pagination_class = 'swiper-pagination m-top' %}
{% set control_next_svg_id = 'chevron' %}
{% set control_prev_svg_id = 'chevron' %}

{# Alternative products #}

{% set alternative_data_component = source_alternative == 'default' ? 'related-products' : 'alternative-products' %}

{% if alternative_products %}
    {{ component('nubesdk-slot', { type: 'before_product_detail_related_products' }) }}
    {{ component(
        'products-section',{
            title: 'VOCÊ PODE GOSTAR',
            id: 'related-products',
            data_component: alternative_data_component,
            products_amount: related_products | length,
            products_array: related_products,
            product_template_path: 'snipplets/product/pdp-related-item.tpl',
            product_template_params: {'slide_item': true, 'is_pdp_related_spot': true},
            slider_controls_position: 'bottom',
            section_classes: {
                section: 'js-related-products yamuna-pdp-related ' ~  section_class,
                container: container_class,
                title_container: title_container_class,
                title: title_class,
                slider_container: 'js-swiper-related ' ~ slider_container_class,
                slider_wrapper: swiper_wrapper_class,
                slider_control: slider_control_class,
                slider_control_prev_container: 'js-swiper-related-prev ' ~ slider_control_prev_class,
                slider_control_prev: 'icon-flip-horizontal',
                slider_control_next_container: 'js-swiper-related-next ' ~ slider_control_next_class,
            },
            control_next_svg_id: control_next_svg_id,
            control_prev_svg_id: control_prev_svg_id,
        })
    }}
    {{ component('nubesdk-slot', { type: 'after_product_detail_related_products' }) }}
{% endif %}

{# Complementary products #}

{% set complementary_section_id = 'complementary-products' %}

{% if complementary_products %}
    {{ component('nubesdk-slot', { type: 'before_product_detail_complementary_products' }) }}
    {{ component(
        'products-section',{
            title: settings.products_complementary_title,
            id: complementary_section_id,
            data_component: complementary_section_id,
            products_amount: complementary_product_list | length,
            products_array: complementary_product_list,
            product_template_path: 'snipplets/grid/item.tpl',
            product_template_params: {'slide_item': true},
            slider_controls_position: 'bottom',
            section_classes: {
                section: 'js-complementary-products ' ~ section_class,
                container: container_class,
                title_container: title_container_class,
                title: title_class,
                slider_container: 'js-swiper-complementary ' ~ slider_container_class,
                slider_wrapper: swiper_wrapper_class,
                slider_control: slider_control_class,
                slider_control_prev_container: 'js-swiper-complementary-prev ' ~ slider_control_prev_class,
                slider_control_prev: 'icon-flip-horizontal',
                slider_control_next_container: 'js-swiper-complementary-next ' ~ slider_control_next_class,
            },
            control_next_svg_id: control_next_svg_id,
            control_prev_svg_id: control_prev_svg_id,
        })
    }}
    {{ component('nubesdk-slot', { type: 'after_product_detail_complementary_products' }) }}
{% endif %}
