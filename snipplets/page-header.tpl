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
						<svg id="wishlist-icon-{{ product.id }}" width="16" height="16" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
							<path d="M14.5833 1.5975C13.645 1.6121 12.7271 1.87405 11.9223 2.3569C11.1176 2.83974 10.4545 3.52639 10 4.3475C9.54554 3.52639 8.88245 2.83974 8.0777 2.3569C7.27296 1.87405 6.35505 1.6121 5.41667 1.5975C3.92079 1.6625 2.51143 2.31688 1.49649 3.4177C0.481556 4.51851 -0.0564528 5.97627 5.93206e-06 7.4725C5.93206e-06 11.2617 3.98834 15.4 7.33334 18.2058C8.08019 18.8334 9.02447 19.1775 10 19.1775C10.9755 19.1775 11.9198 18.8334 12.6667 18.2058C16.0117 15.4 20 11.2617 20 7.4725C20.0565 5.97627 19.5185 4.51851 18.5035 3.4177C17.4886 2.31688 16.0792 1.6625 14.5833 1.5975ZM11.5958 16.9308C11.1492 17.307 10.584 17.5133 10 17.5133C9.41605 17.5133 8.85085 17.307 8.40417 16.9308C4.12251 13.3383 1.66667 9.89167 1.66667 7.4725C1.60971 6.4181 1.97198 5.38395 2.67448 4.59559C3.37697 3.80723 4.3627 3.32863 5.41667 3.26417C6.47064 3.32863 7.45637 3.80723 8.15887 4.59559C8.86137 5.38395 9.22364 6.4181 9.16667 7.4725C9.16667 7.69352 9.25447 7.90548 9.41075 8.06176C9.56703 8.21804 9.77899 8.30584 10 8.30584C10.221 8.30584 10.433 8.21804 10.5893 8.06176C10.7455 7.90548 10.8333 7.69352 10.8333 7.4725C10.7764 6.4181 11.1386 5.38395 11.8411 4.59559C12.5436 3.80723 13.5294 3.32863 14.5833 3.26417C15.6373 3.32863 16.623 3.80723 17.3255 4.59559C18.028 5.38395 18.3903 6.4181 18.3333 7.4725C18.3333 9.89167 15.8775 13.3383 11.5958 16.9275V16.9308Z" fill="white"></path>
						</svg>
					</button>
				{% endif %}
			</div>
			{% if template == 'product' %}
				{# Figma 853:9590 - rating under title #}
				{% set yamuna_rating_value = product.metafields.yamuna.rating | default(product.metafields.reviews.rating) | default(5) %}
				{% set yamuna_rating_count = product.metafields.yamuna.rating_count | default(product.metafields.reviews.count) | default(0) %}
				<div class="yamuna-pdp-rating js-yamuna-pdp-rating"
					data-rating="{{ yamuna_rating_value }}"
					data-count="{{ yamuna_rating_count }}"
					data-star-filled="{{ 'images/yamuna/pdp-star-filled.svg' | static_url }}"
					data-star-empty="{{ 'images/yamuna/pdp-star-empty.svg' | static_url }}">
					<div class="yamuna-pdp-rating-stars" aria-hidden="true">
						{% for i in 1..5 %}
							<img class="yamuna-pdp-rating-star js-yamuna-pdp-star" data-index="{{ i }}" src="{{ 'images/yamuna/pdp-star-filled.svg' | static_url }}" alt="" width="18" height="18" loading="lazy" />
						{% endfor %}
					</div>
					<a class="yamuna-pdp-rating-label js-yamuna-pdp-rating-label" href="#reviewsapp">{% if yamuna_rating_count > 0 %}{{ yamuna_rating_count }} avaliações{% else %}Ver avaliações{% endif %}</a>
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
