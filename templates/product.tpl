
{# Payments details #}

<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container yamuna-pdp" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">
    <div class="container">
        <div class="row section-single-product">
            <div class="col-12 col-md-8 pl-md-3 pr-md-3 yamuna-pdp-gallery-column">
            	{% include 'snipplets/product/product-image.tpl' %}
            </div>
            <div class="col yamuna-pdp-summary" data-store="product-info-{{ product.id }}">
                {% include 'snipplets/product/product-form.tpl' %}

                <div id="product-description" style="display: none;" class="mt-4 mt-md-1" data-store="product-description-{{ product.id }}">
                    {% include 'snipplets/product/product-description-blocks.tpl' with { product_description_blocks_view: 'main' } %}

                    {{ component('nubesdk-slot', { type: "after_product_description" }) }}

                    {# Product share #}
                    {% include 'snipplets/social/social-share.tpl' %}
                </div>
            </div>
        </div>
        <div id="product-description-accordions">
            {% include 'snipplets/product/product-description-blocks.tpl' with { product_description_blocks_view: 'accordions' } %}
        </div>
    </div>
</div>

{# Related products #}
{% include 'snipplets/product/product-related.tpl' %}

{# Reviews (Figma: after related products) #}
<div class="yamuna-pdp-reviews">
    {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments section-fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
    {% endif %}
    <div id="reviewsapp"></div>
</div>

{# Newsletter (Figma: after reviews) #}
<div class="yamuna-pdp-newsletter">
    {% include 'snipplets/newsletter.tpl' %}
</div>
