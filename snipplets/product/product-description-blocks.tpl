{#
  Product description blocks

  The content tool serializes each section as
  <!--block:identifier-->HTML<!--/block:identifier-->.
  This parser intentionally treats the HTML between the markers as opaque.
  The persistence of comments and iframes in the Nuvemshop editor is validated
  outside this theme repository.
#}
{% set product_description_blocks = product.information | default(product.description) | default('') %}
{% set product_description_blocks_view = product_description_blocks_view | default('all') %}
{% set render_main_description = product_description_blocks_view != 'accordions' %}
{% set render_accordions = product_description_blocks_view != 'main' %}
{% set block_candidates = product_description_blocks | split('<!--block:') %}
{% set rendered_block_keys = [] %}
{% set has_valid_blocks = false %}

{# The first split item is the content before the first opening marker. #}
{% if render_accordions %}
<div class="grid grid-cols-1 md:grid-cols-2 yamuna-product-description-blocks">
{% endif %}
{% for block_candidate in block_candidates %}
    {% if not loop.first %}
        {# Split only once to preserve all HTML in the block payload. #}
        {% set block_header_parts = block_candidate | split('-->', 2) %}

        {% if block_header_parts | length > 1 %}
            {% set block_key = block_header_parts[0] %}
            {% set block_payload = block_header_parts[1] %}
            {% set block_end_marker = '<!--/block:' ~ block_key ~ '-->' %}
            {% set block_content_parts = block_payload | split(block_end_marker, 2) %}

            {# A key is rendered only on its first complete occurrence. #}
            {% if block_key is not empty and block_key not in rendered_block_keys and block_content_parts | length > 1 %}
                {% set rendered_block_keys = rendered_block_keys | merge([block_key]) %}
                {% set has_valid_blocks = true %}
                {% set block_content = block_content_parts[0] %}

                {% if block_key == 'descricao' and render_main_description %}
                    {% if block_content | trim is not empty %}
                        <div class="product-description user-content yamuna-product-description-main">
                            <h3 class="yamuna-pdp-description-title">
                                <img class="yamuna-pdp-description-title-icon" src="{{ 'images/yamuna/pdp-description-minus.svg' | static_url }}" alt="" width="24" height="24">
                                <span>Descrição do produto</span>
                            </h3>
                            {{ block_content | raw }}
                        </div>
                    {% endif %}
                {% elseif block_key != 'descricao' and render_accordions and block_content | trim is not empty %}
                    <div class="flex flex-col w-full relative yamuna-product-description-accordion">
                        <div id="info-id-{{ block_key }}" class="flex informationDiv" onclick="toggleInfo('{{ block_key }}')">
                            <img id="open-info-{{ block_key }}" class="yamuna-pdp-accordion-icon" src="{{ 'images/yamuna/pdp-accordion-arrow.svg' | static_url }}" alt="" width="24" height="24" loading="lazy">
                        </div>
                        <div id="infoToOpen-{{ block_key }}" class="infoToOpen hidden font-dosis pb-5 mr-2">
                            {{ block_content | raw }}
                        </div>
                    </div>
                {% endif %}
            {% endif %}
        {% endif %}
    {% endif %}
{% endfor %}
{% if render_accordions %}
</div>
{% endif %}

{# Legacy products without valid markers keep their original description. #}
{% if render_main_description and not has_valid_blocks and product_description_blocks is not empty %}
    <div class="product-description user-content yamuna-product-description-main">
        <h3 class="yamuna-pdp-description-title">
            <img class="yamuna-pdp-description-title-icon" src="{{ 'images/yamuna/pdp-description-minus.svg' | static_url }}" alt="" width="24" height="24">
            <span>Descrição do produto</span>
        </h3>
        {{ product_description_blocks | raw }}
    </div>
{% endif %}
