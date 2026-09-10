{% set has_multiple_slides = product.images_count > 1 or product.video_url %}
{% set label_accent_classes = 'label label-accent' %}

{% set custom_label = product.getPromotionCustomLabel %}
{% set has_custom_promotion_label = custom_label and custom_label | trim %}

{# Only show the % OFF ribbon when the discount is greater than 0%. #}
{% set compare_price = product.compare_at_price %}
{% set offer_pct = 0 %}
{% if compare_price and product.price and compare_price > product.price %}
  {% set offer_pct = ((compare_price - product.price) * 100 / compare_price) | round %}
{% endif %}
{% set show_offer_label = offer_pct > 0 %}

{{ component(
  'labels', {
    defer_stock_label_text: true,
    prioritize_promotion_over_offer: true,
    promotion_quantity_long_wording: true,
    promotion_nxm_long_wording: false,
    labels_classes: {
      group: 'js-labels-floating-group ' ~ (not show_offer_label ? 'yamuna-hide-offer ') ~ (product_detail and has_multiple_slides ? 'labels-product-slider'),
      promotion: label_accent_classes,
      promotion_primary_text: 'd-block',
      promotion_secondary_text: 'font-smallest',
      offer: 'js-offer-label ' ~ (not show_offer_label ? 'd-none yamuna-offer-zero ') ~ (not has_custom_promotion_label ? 'label-circle ') ~ label_accent_classes,
      shipping: label_accent_classes,
      no_stock: 'js-stock-label label label-default',
    },
  })
}}
