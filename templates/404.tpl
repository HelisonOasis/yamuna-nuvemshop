{# Yamuna 404 — layout igual produção (yamuna.com.br/404) #}
{% set show_help = not has_products %}

<section class="yamuna-404-page" id="404" aria-label="Página não encontrada">
	<div class="yamuna-404-inner">
		<img
			class="yamuna-404-illustration"
			src="{{ 'images/yamuna/404/erro404.png' | static_url }}"
			alt=""
			width="402"
			height="303"
			loading="eager"
			decoding="async"
		>
		<img
			class="yamuna-404-title-img"
			src="{{ 'images/yamuna/404/404-title.png' | static_url }}"
			alt="404 — Página não encontrada"
			width="525"
			height="223"
			loading="eager"
			decoding="async"
		>
	</div>
</section>

{% include 'snipplets/empty-related-products.tpl' %}

{# Onboarding do tema (só se a loja ainda não tiver produtos) #}
{% if show_help %}
	<div id="product-example">
		{% snipplet 'defaults/show_help_product.tpl' %}
	</div>
{% endif %}
