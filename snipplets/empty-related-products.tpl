{# Empty PLP / 404 / blog-post related carousel — same markup + card template as PDP. #}
{% set empty_pool = null %}
{% if sections.primary.products %}
	{% set empty_pool = sections.primary.products %}
{% elseif sections.new.products %}
	{% set empty_pool = sections.new.products %}
{% elseif sections.sale.products %}
	{% set empty_pool = sections.sale.products %}
{% endif %}

{% if empty_pool %}
<section class="section-products-related position-relative mb-3 yamuna-pdp-related yamuna-empty-related" data-store="empty-related-products">
	<div class="container px-0">
		<div class="text-center px-3">
			<h2 class="h1">VOCÊ PODE GOSTAR</h2>
		</div>
		<div class="products-section-container products-slider swiper-container-horizontal p-relative">
			<div class="js-swiper-related swiper-container p-md-1">
				<div class="swiper-wrapper">
					{% for product in empty_pool %}
						{% if loop.index <= 12 %}
							{% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'is_pdp_related_spot': true} %}
						{% endif %}
					{% endfor %}
				</div>
				<div class="js-swiper-related-pagination swiper-pagination m-top"></div>
			</div>
			<button type="button" class="js-swiper-related-prev swiper-button-prev svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}" aria-label="Produto anterior">
				<svg class="icon-inline icon-2x mr-1 icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
			</button>
			<button type="button" class="js-swiper-related-next swiper-button-next svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}" aria-label="Próximo produto">
				<svg class="icon-inline icon-2x ml-1"><use xlink:href="#chevron"/></svg>
			</button>
		</div>
	</div>
</section>
{% endif %}
