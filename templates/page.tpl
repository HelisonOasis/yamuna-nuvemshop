{% if page.handle == 'revenda' %}
	{% include 'snipplets/pages/revenda.tpl' %}
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
