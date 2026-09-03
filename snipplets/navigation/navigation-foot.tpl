<ul class="footer-menu">
	{% for item in menus[settings.footer_menu] %}
		{% set footer_item_url = item.url %}
		{% set footer_item_name = item.name | lower | trim %}
		{% if footer_item_name == 'quem somos' %}
			{% set footer_item_url = '/quem-somos' %}
		{% elseif footer_item_name == 'manifesto' %}
			{% set footer_item_url = '/nossomanifesto' %}
		{% elseif footer_item_name == 'blog' %}
			{% set footer_item_url = '/aprenda' %}
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
