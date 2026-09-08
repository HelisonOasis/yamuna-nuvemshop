<ul class="footer-menu">
	{% for item in menus[settings.footer_menu_secondary] %}
		{% set footer_item_url = item.url %}
		{% set footer_item_name = item.name | lower | trim %}
		{% if footer_item_name == 'quem somos' %}
			{% set footer_item_url = '/quem-somos' %}
		{% elseif footer_item_name == 'manifesto' or footer_item_name == 'nosso manifesto' %}
			{% set footer_item_url = '/nossomanifesto' %}
		{% elseif footer_item_name == 'blog' or footer_item_name == 'nosso blog' %}
			{% set footer_item_url = store.blog_url %}
		{% elseif footer_item_name == 'política de privacidade' or footer_item_name == 'politica de privacidade' %}
			{% set footer_item_url = '/PoliticaDePrivacidade' %}
		{% elseif footer_item_name == 'trabalhe conosco' %}
			{% set footer_item_url = '/trabalheconosco' %}
		{% elseif footer_item_name == 'atendimento ao cliente' %}
			{% set footer_item_url = store.whatsapp %}
		{% elseif footer_item_name == 'seja um revendedor' %}
			{% set footer_item_url = '/revenda' %}
		{% endif %}
		<li class="footer-menu-item">
	        <a class="footer-menu-link" href="{{ footer_item_url }}" {% if footer_item_url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>
