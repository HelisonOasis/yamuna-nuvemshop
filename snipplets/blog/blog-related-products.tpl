{# Blog "Produtos relacionados" — match prod (yamuna.com.br/aprenda/*).
   Topic → seed PDP URL; JS clones .yamuna-pdp-related slides (spot markup)
   because get_products only works with Related Products app metafields. #}

{% set max_blog_related = 8 %}
{% set title_l = post.title | lower %}
{% set summary_l = post.summary | default('') | lower %}
{% set content_l = post.content | default('') | striptags | lower %}
{% set hay = title_l ~ ' ' ~ summary_l ~ ' ' ~ content_l %}

{% set seed_url = '' %}

{% if hay | split('ghee') | length > 1 %}
	{% set seed_url = '/produtos/ghee-yamuna-150g/' %}
{% elseif hay | split('curcumin') | length > 1 or hay | split('curcuma') | length > 1 %}
	{% set seed_url = '/produtos/capsula-curcumina-organica-yamuna-600mg/' %}
{% elseif hay | split('tahine') | length > 1 or hay | split('gergelim') | length > 1 %}
	{% set seed_url = '/produtos/tahine-yamuna-350g/' %}
{% elseif hay | split('pistache') | length > 1 %}
	{% set seed_url = '/produtos/pistache-e-amendoa-185g/' %}
{% elseif hay | split('castanha') | length > 1 or hay | split('amendoa') | length > 1 %}
	{% set seed_url = '/produtos/puro-caju-creme-de-castanha-de-caju-185g/' %}
{% elseif hay | split('sabonete') | length > 1 %}
	{% set seed_url = '/produtos/sabonete-sabao-negro-120g/' %}
{% elseif hay | split('chocolate') | length > 1 or hay | split('cacau') | length > 1 %}
	{% set seed_url = '/produtos/chocolate-56-ao-leite-de-amendoas-mel-e-baunilha-80g/' %}
{% elseif hay | split('coco') | length > 1 %}
	{% set seed_url = '/produtos/leite-de-coco-em-po-zero-acucar-200g/' %}
{% elseif hay | split('golden') | length > 1 %}
	{% set seed_url = '/produtos/milk-golden-blend-400g/' %}
{% elseif hay | split('massala') | length > 1 or hay | split('tempero') | length > 1 %}
	{% set seed_url = '/produtos/degusta-massala-chai-20g/' %}
{% elseif hay | split('cafe') | length > 1 %}
	{% set seed_url = '/produtos/bulletproof-blend-300g/' %}
{% elseif hay | split('leite') | length > 1 %}
	{% set seed_url = '/produtos/castanha-de-caju-leite-concentrado-400g/' %}
{% elseif hay | split('shampoo') | length > 1 or hay | split('condicionador') | length > 1 %}
	{% set seed_url = '/produtos/shampoo-solido-capim-limao-120g/' %}
{% endif %}

{% set blog_related = [] %}
{% set use_seed_fetch = seed_url != '' %}

{% if not use_seed_fetch %}
	{% if sections.primary.products %}
		{% set blog_related = sections.primary.products %}
	{% elseif sections.new.products %}
		{% set blog_related = sections.new.products %}
	{% elseif sections.sale.products %}
		{% set blog_related = sections.sale.products %}
	{% endif %}
{% endif %}

{% if use_seed_fetch or blog_related | length > 0 %}
<section class="section-products-related position-relative mb-3 yamuna-pdp-related yamuna-blog-related{% if not use_seed_fetch %} yamuna-empty-related{% endif %}" data-store="blog-related-products"{% if use_seed_fetch %} data-yamuna-seed="{{ seed_url }}" data-yamuna-max="{{ max_blog_related }}"{% endif %}>
	<div class="container px-0">
		<div class="text-center px-3">
			<h2 class="h1 yamuna-blog-related-title">Produtos relacionados</h2>
		</div>
		<div class="products-section-container products-slider swiper-container-horizontal p-relative">
			<div class="js-swiper-related swiper-container p-md-1">
				<div class="swiper-wrapper">
					{% if not use_seed_fetch %}
						{% for product in blog_related %}
							{% if loop.index <= max_blog_related %}
								{% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'is_pdp_related_spot': true} %}
							{% endif %}
						{% endfor %}
					{% endif %}
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
