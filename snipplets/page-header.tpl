{# /*============================================================================
  #Page header
==============================================================================*/

#Properties

#Title

#Breadcrumbs

#}

<section class="page-header" data-store="page-title">
	{% if template != 'product' and template != 'contact' %}
	<div class="container">
		<div class="row">
	{% endif %}
			<div class="{% if template != 'product' %}col text-center{% endif %} {% if template == 'category' %}col-lg-8 offset-lg-2{% endif %}">
				{% if template == 'product' or template == 'account.orders' or template == 'account.order' or template == 'blog' or template == 'blog-post' %}
					{% include 'snipplets/breadcrumbs.tpl' %}
				{% endif %}
				{% if template == 'product' %}

					{{ component('nubesdk-slot', { type: "before_product_detail_name" }) }}

				{% endif %}
			<div class="{% if template == 'product' %}yamuna-pdp-title-row{% endif %}">
				<h1 class="{% if template == 'product' %}js-product-name{% else %}text-center{% endif %} h2 h1-md {% if template == 'contact' %} text-md-left{% endif %}{% if settings.theme_rounded and template != 'product' %} text-primary{% endif %}" {% if template == "product" %}data-store="product-name-{{ product.id }}"{% endif %}>{% block page_header_text %}{% endblock %}</h1>
				{% if template == 'product' %}
					<button type="button" class="yamuna-pdp-favorite js-yamuna-pdp-favorite wishlist-add" id="wishlist-button-{{ product.id }}" aria-label="{{ 'Favoritos' | translate }}" title="{{ 'Favoritos' | translate }}">
						<svg id="wishlist-icon-{{ product.id }}" width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
							<circle cx="12" cy="12" r="12" fill="#BA546B"></circle>
							<path d="M15.5156 6C14.8633 6 12.7824 6.62437 12 7.62077C11.2176 6.62437 9.13633 6 8.48438 6C7.13386 6 6.01229 7.03154 6.00037 8.35623C5.9686 11.8386 11.2227 15.6885 11.668 15.9894C11.7686 16.0573 11.884 16.0928 12.001 16.0928C12.1179 16.0928 12.2333 16.0573 12.3339 15.9894C12.7792 15.6885 18.0333 11.8386 18.0016 8.35623C17.9897 7.03154 16.8661 6 15.5156 6Z" fill="white"></path>
						</svg>
					</button>
				{% endif %}
			</div>
			{% if template == 'product' %}
				{# Figma 853:9590 - rating under title #}
				{% set yamuna_rating_value = product.metafields.yamuna.rating | default(product.metafields.reviews.rating) | default('') %}
				{% set yamuna_rating_count = product.metafields.yamuna.rating_count | default(product.metafields.reviews.count) | default(0) %}
				<div class="yamuna-pdp-rating js-yamuna-pdp-rating{% if not yamuna_rating_value %} is-empty{% endif %}"
					data-rating="{{ yamuna_rating_value }}"
					data-count="{{ yamuna_rating_count }}"
					data-star-filled="{{ 'images/yamuna/pdp-star-filled.svg' | static_url }}"
					data-star-empty="{{ 'images/yamuna/pdp-star-empty.svg' | static_url }}">
					<div class="yamuna-pdp-rating-stars" aria-hidden="true">
						{% for i in 1..5 %}
							<img class="yamuna-pdp-rating-star js-yamuna-pdp-star" data-index="{{ i }}" src="{{ 'images/yamuna/pdp-star-empty.svg' | static_url }}" alt="" width="18" height="18" loading="lazy" />
						{% endfor %}
					</div>
					<a class="yamuna-pdp-rating-label js-yamuna-pdp-rating-label" href="#reviewsapp">Ver avaliações</a>
				</div>
				<div class="yamuna-pdp-benefits" aria-label="Características do produto">
					<div class="yamuna-pdp-benefit">
						<img src="{{ 'images/yamuna/pdp-benefits/sem-acucar.svg' | static_url }}?v=figma2" alt="" width="24" height="24" aria-hidden="true" />
						<span>Sem açúcar</span>
					</div>
					<div class="yamuna-pdp-benefit">
						<img src="{{ 'images/yamuna/pdp-benefits/sem-conservantes.svg' | static_url }}?v=figma2" alt="" width="24" height="24" aria-hidden="true" />
						<span>Sem conservantes</span>
					</div>
					<div class="yamuna-pdp-benefit">
						<img src="{{ 'images/yamuna/pdp-benefits/sem-gluten.svg' | static_url }}?v=figma2" alt="" width="24" height="24" aria-hidden="true" />
						<span>Sem glúten</span>
					</div>
					<div class="yamuna-pdp-benefit">
						<img src="{{ 'images/yamuna/pdp-benefits/sem-lactose.svg' | static_url }}?v=figma2" alt="" width="24" height="24" aria-hidden="true" />
						<span>Sem lactose</span>
					</div>
					<div class="yamuna-pdp-benefit">
						<img src="{{ 'images/yamuna/pdp-benefits/vegano.svg' | static_url }}?v=figma2" alt="" width="24" height="24" aria-hidden="true" />
						<span>Vegano</span>
					</div>
				</div>
			{% endif %}
				{% if template == 'product' %}

					{{ component('nubesdk-slot', { type: "after_product_detail_name" }) }}

				{% endif %}
				{% if template == 'category' and category.description %} 
					<p class="font-small font-md-normal text-center mb-0 mb-md-4">{{ category.description }}</p> 
				{% endif %}
			</div>
	{% if template != 'product' and template != 'contact' %}
		</div>
	</div>
	{% endif %}
</section>
