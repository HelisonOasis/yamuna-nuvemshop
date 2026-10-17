{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}

{% if not show_help %}

{% include 'snipplets/plp-hero.tpl' %}
<section class="container yamuna-plp-page-heading {% if not category.description %}d-md-none{% endif %}">
	<div class="row">
		{% if category.description %}
			<div class="category-banner-header background-main">
		{% endif %}
		<div class="col-12 d-md-none">
			{% include "snipplets/breadcrumbs.tpl" %}
		</div>
		<div class="col">
			{% embed "snipplets/page-header.tpl" %}
				{% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
			{% endembed %}
		</div>
		{% if category.description %}
			</div>
		{% endif %}
	</div>
</section>
<section class="js-category-controls-prev category-controls-sticky-detector"></section>

{% include "snipplets/grid/filters-controls.tpl" %}


<section class="category-body yamuna-plp-body">
	<div class="container">
		<div class="row">
			{% if has_filters_available %}
				<div class="col col-md-2 d-none pr-0 d-md-block visible-when-content-ready">
					{% if filter_categories is not empty %}
						{% include "snipplets/grid/categories.tpl" %}
					{% endif %}
					{% if product_filters is not empty %}
						{% include "snipplets/grid/filters.tpl" %}
					{% endif %}
				</div>
			{% endif %}
			<div class="col" data-store="category-grid-{{ category.id }}">
				{% include 'snipplets/grid/products-list.tpl' %}
			</div>
		</div>
	</div>
</section>
{% if products %}
<script type="application/ld+json">
{
	"@context": "https://schema.org",
	"@type": "CollectionPage",
	"name": {{ category.name | json_encode | raw }},
	"url": {{ category.url | json_encode | raw }},
	"mainEntity": {
		"@type": "ItemList",
		"numberOfItems": {{ products | length }},
		"itemListElement": [
			{% for product in products %}
			{
				"@type": "ListItem",
				"position": {{ loop.index }},
				"url": {{ product.url | json_encode | raw }},
				"name": {{ product.name | json_encode | raw }}
			}{% if not loop.last %},{% endif %}
			{% endfor %}
		]
	}
}
</script>
{% endif %}
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}
