{% if page.handle == 'revenda' %}
	{% include 'snipplets/pages/revenda.tpl' %}
{% elseif page.handle == 'quem-somos' or page.handle == 'quemsomos' %}
	{% include 'snipplets/pages/quem-somos.tpl' %}
{% elseif page.handle == 'nossomanifesto' or page.handle == 'nosso-manifesto' %}
	{% include 'snipplets/pages/nosso-manifesto.tpl' %}
{% elseif page.handle == 'politicadeprivacidade' or page.handle == 'politica-de-privacidade' %}
	{% include 'snipplets/pages/politica-de-privacidade.tpl' %}
{% elseif page.handle == 'trabalheconosco' or page.handle == 'trabalhe-conosco' %}
	{% include 'snipplets/pages/trabalhe-conosco.tpl' %}
{% elseif page.handle == 'entrega' %}
	{% include 'snipplets/pages/entrega.tpl' %}
{% elseif page.handle == 'trocasedevolucoes' or page.handle == 'trocas-e-devolucoes' %}
	{% include 'snipplets/pages/trocas-e-devolucoes.tpl' %}
{% elseif page.handle == 'duvidasfrequentes' or page.handle == 'duvidas-frequentes' %}
	{% include 'snipplets/pages/duvidas-frequentes.tpl' %}
{% elseif page.handle == 'programa-de-beneficios' %}
	{% include 'snipplets/pages/programa-de-beneficios.tpl' %}
{% else %}
	{% embed "snipplets/page-header.tpl" %}
		{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
	{% endembed %}

	<section class="user-content pb-5">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-md-10">
					{{ page.content }}
				</div>
			</div>
		</div>
	</section>
{% endif %}
