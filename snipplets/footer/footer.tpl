{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube or store.whatsapp %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}

{{ component('nubesdk-slot', { type: "before_footer" }) }}

<style>
  footer.yamuna-footer .h3,
  footer.yamuna-footer h4 {
    font-family: 'Raleway', sans-serif !important;
  }

  /* Contact: left-aligned from tablet up (icons as left edge). Center only on mobile. */
  footer.yamuna-footer .yamuna-footer-contact .contact-info {
    display: flex !important;
    flex-direction: column !important;
    align-items: flex-start !important;
    text-align: left !important;
  }
  footer.yamuna-footer .yamuna-footer-contact .contact-item {
    display: inline-flex !important;
    align-items: flex-start !important;
    justify-content: flex-start !important;
    gap: 8px !important;
    width: 100% !important;
    max-width: 100% !important;
    margin-bottom: 6px !important;
    padding-left: 0 !important;
    position: relative !important;
    text-align: left !important;
  }
  footer.yamuna-footer .yamuna-footer-contact .contact-item-icon {
    position: static !important;
    left: auto !important;
    top: auto !important;
    flex: 0 0 18px !important;
    width: 18px !important;
    height: 18px !important;
    min-width: 18px !important;
    margin-top: 0.15em !important;
  }
  footer.yamuna-footer .yamuna-footer-contact .contact-link {
    text-align: left !important;
  }

  @media (max-width: 767px) {
    footer.yamuna-footer .yamuna-footer-contact .contact-info {
      align-items: center !important;
      text-align: center !important;
    }
    footer.yamuna-footer .yamuna-footer-contact .contact-item {
      justify-content: center !important;
      width: auto !important;
      max-width: min(100%, 280px) !important;
    }
  }
</style>

<footer class="js-hide-footer-while-scrolling display-when-content-ready yamuna-footer" data-store="footer">
	<div class="container-fluid px-md-5">
		<div class="row element-footer">

			{# Yamuna brand and social networks #}
			<div class="col-md mb-4 yamuna-footer-brand">
				<div class="yamuna-footer-logo">
					<img class="yamuna-footer-logo-img" src="{{ 'images/yamuna/logo-yamuna-branco.png' | static_url }}" alt="{{ store.name }}" />
				</div>

				{% if has_social_network %}
					<div class="yamuna-footer-social">
						{% if store.facebook %}
							<a href="{{ store.facebook }}" target="_blank" aria-label="Facebook {{ store.name }}"><img src="{{ 'images/yamuna/facebook.svg' | static_url }}" alt="Facebook" /></a>
						{% endif %}
						{% if store.instagram %}
							<a href="{{ store.instagram }}" target="_blank" aria-label="Instagram {{ store.name }}"><img src="{{ 'images/yamuna/instagram.svg' | static_url }}" alt="Instagram" /></a>
						{% endif %}
						{% if store.youtube %}
							<a href="{{ store.youtube }}" target="_blank" aria-label="YouTube {{ store.name }}"><img src="{{ 'images/yamuna/youtube.svg' | static_url }}" alt="YouTube" /></a>
						{% endif %}
						{% if store.whatsapp %}
							<a href="{{ store.whatsapp }}" target="_blank" aria-label="WhatsApp {{ store.name }}"><img src="{{ 'images/yamuna/whatsapp.svg' | static_url }}" alt="WhatsApp" /></a>
						{% endif %}
					</div>
				{% endif %}
			</div>
			
			{% if template != 'password' %}

				{# About #}
				{% if has_footer_about %}

					<div class="col-md mb-4">
						{% if settings.footer_about_title %}
							<div class="h3 yamuna-hx-h4">{{ settings.footer_about_title }}</div>
						{% endif %}
						{% if settings.footer_about_description %}
							<p>{{ settings.footer_about_description }}</p>
						{% endif %}
					</div>

				{% endif %}

				{# Foot Nav #}
				<div class="col yamuna-footer-menu yamuna-footer-menu-primary">
					<div class="h3 yamuna-hx-h4">Vendas</div>
					<ul class="footer-menu">
						<li class="footer-menu-item"><a class="footer-menu-link" href="{{ store.whatsapp }}" target="_blank" rel="noopener">Atendimento ao Cliente</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="/revenda">Revenda e Lojistas</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;to=contato@yamuna.com.br" target="_blank" rel="noopener">Contato via E-mail</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="{{ store.whatsapp }}" target="_blank" rel="noopener">Comprar com WhatsApp</a></li>
					</ul>
				</div>

				{# Foot Nav Secondary #}
				{% if has_footer_menu_secondary %}
					<div class="col yamuna-footer-menu yamuna-footer-menu-secondary">
						<div class="h3 yamuna-hx-h4">Institucional</div>
						{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
					</div>
				{% endif %}

				{# SAC #}
				<div class="col yamuna-footer-menu yamuna-footer-menu-sac">
					<div class="h3 yamuna-hx-h4">SAC</div>
					<ul class="footer-menu">
						<li class="footer-menu-item"><a class="footer-menu-link" href="/entrega">Regras de frete grátis</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="/TrocaseDevolucoes">Trocas e Reembolsos</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="/duvidasfrequentes">Dúvidas frequentes</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="https://www.google.com/maps/place/Yamuna+Artesanal+%7C+F%C3%A1brica+e+loja+virtual+de+Produtos+Naturais+(Ghee)+-+Rod.+Roz%C3%A1lia+Paulina+Ferreira,+1897+-+P%C3%A2ntano+do+Sul,+Florian%C3%B3polis+-+SC,+88066-600/@-27.7698586,-48.5244642,15z/data=!4m6!3m5!1s0x952725aefc66dc8d:0x1f6bed5868b0b518!8m2!3d-27.7698586!4d-48.5244642!16s%2Fg%2F11f6fxbzqk?source=g.page.m.dd._&amp;g_ep=Eg1tbF8yMDI2MDgyM18wIJvbDyoASAJQAQ%3D%3D" target="_blank" rel="noopener">Avalie-nos no Google</a></li>
					</ul>
				</div>

				{# Contact info #}
				{% if has_footer_contact_info %}
					<div class="col-md mb-4 yamuna-footer-contact">
						{% if settings.footer_contact_title %}
							<div class="h3 yamuna-hx-h4">{{ settings.footer_contact_title }}</div>
						{% endif %}
						{% include "snipplets/contact-links.tpl" %}
					</div>
				{% endif %}

				<div class="col yamuna-footer-account">
					<div class="h3 yamuna-hx-h4">{{ 'Minha conta' | translate }}</div>
					<ul class="footer-menu">
						<li class="footer-menu-item"><a class="footer-menu-link" href="{{ store.customer_home_url }}">{{ 'Meus pedidos' | translate }}</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="{{ store.customer_home_url }}">{{ 'Minha conta' | translate }}</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="{{ store.customer_info_url }}">Editar Cadastro</a></li>
						<li class="footer-menu-item"><a class="footer-menu-link" href="{{ store.customer_addresses_url }}">{{ 'Mis direcciones' | translate }}</a></li>
					</ul>
				</div>

			{% endif %}
			
		</div>

		{% if template != 'password' %}

			{% if has_shipping_payment_logos or has_seal_logos %}

				<div class="row element-footer yamuna-footer-payment-bar">

					{# Logos Payments and Shipping #}
			 		{% if has_shipping_payment_logos %}
			 			<div class="col-md-9">
				 			<div class="footer-payments-shipping-logos">
				 				{% if has_payment_logos %}
				 					<div class="row mb-4">
				 						<div class="col-md-4">
							<div class="h3 yamuna-hx-h4">Formas de pagamento</div>
					 					</div>
					 					<div class="col-md-8">
					 						{% include "snipplets/logos-icons.tpl" with {'payments': true} %}
					 					</div>
				 					</div>
								{% endif %}
				 				{% if has_shipping_logos %}
				 					<div class="row mb-4">
					 					<div class="col-md-4">
					 						<div class="h3 yamuna-hx-h4">{{ "Medios de envío" | translate }}</div>
					 					</div>
					 					<div class="col-md-8">
					 						{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}
					 					</div>
				 					</div>
				 				{% endif %}
							</div>
						</div>
					{% endif %}

					<div class="col-md-3 yamuna-footer-security">
						<div class="yamuna-footer-security-content">
							<div class="h3 yamuna-hx-h4">Segurança</div>
							<div class="yamuna-footer-security-logos">
								<img class="yamuna-security-google" src="{{ 'images/yamuna/security-google.svg' | static_url }}" alt="Google Safe Browsing" />
								<img class="yamuna-security-site" src="{{ 'images/yamuna/security-site.svg' | static_url }}" alt="Site seguro" />
								<img class="yamuna-security-ssl" src="{{ 'images/yamuna/security-ssl.svg' | static_url }}" alt="SSL seguro" />
							</div>
						</div>
					</div>

					{# AFIP - EBIT - Custom Seal #}
					{% if has_seal_logos %}
		 				<div class="col-md-3">
		 					{% if store.afip %}
		                        <div class="footer-logo afip seal-afip">
		                            {{ store.afip | raw }}
		                        </div>
		                    {% endif %}
		                    {% if ebit %}
		                        <div class="footer-logo ebit seal-ebit">
		                            {{ ebit }}
		                        </div>
		                    {% endif %}
		                    {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
			                    {% if "seal_img.jpg" | has_custom_image %}
			                        <div class="footer-logo custom-seal">
			                            {% if settings.seal_url != '' %}
			                                <a href="{{ settings.seal_url | setting_url }}" target="_blank">
			                            {% endif %}
			                            	{% set seal_image = "seal_img.jpg" | static_url %}
			                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ seal_image | settings_image_url('large') }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}" />
			                            {% if settings.seal_url != '' %}
			                                </a>
			                            {% endif %}
			                        </div>
			                    {% endif %}
			                    {% if settings.custom_seal_code %}
			                        <div class="footer-logo custom-seal custom-seal-code">
			                            {{ settings.custom_seal_code | raw }}
			                        </div>
			                    {% endif %}
				            {% endif %}

							{{ component('nubesdk-slot', { type: "footer_seals" }) }}

		 				</div>
					{% endif %}

				</div>

			{% endif %}

		{% endif %}
	</div>

	{{ component('nubesdk-slot', { type: "inside_footer" }) }}

	<div class="js-footer-legal footer-legal">
		<div class="container-fluid px-md-5">
			<div class="row">

	            <div class="col-md-9 text-md-left mb-3 mb-md-0">
	                <div class="d-inline-block mr-md-2">
	                   {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
	                   {% if store.address %} - {{ store.address }}{% endif %}
	                </div>
	                {{ component('claim-info', {
							container_classes: "d-md-inline-block mt-md-0 mt-3",
							divider_classes: "mx-1",
							text_classes: {text_consumer_defense: 'd-inline-block mb-1'},
							link_classes: {
								link_consumer_defense: "font-weight-bold",
								link_order_cancellation: "font-weight-bold",
							},
						}) 
					}}
	            </div>

				<div class="col-md text-left text-md-right yamuna-footer-partners">
	                {#
	                La leyenda que aparece debajo de esta linea de código debe mantenerse
	                con las mismas palabras y con su apropiado link a Tienda Nube;
	                como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
	                Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
	                tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
	                Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
	                palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
	                http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
	                e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
	                manter visivél e com um link funcionando.
	                #}
	                {{ new_powered_by_link }}
	                <a class="yamuna-footer-oasis" href="https://www.agenciaoasis.com.br/solucoes/commerce" target="_blank" rel="noopener noreferrer" title="Oásis Commerce" aria-label="Oásis Commerce">
	                	<img class="yamuna-footer-oasis-logo" src="{{ 'images/yamuna/logo-oasis-commerce-white.svg' | static_url }}" alt="Oásis Commerce" width="80" height="28" loading="lazy" />
	                </a>
	            </div>
	            
	        </div>
    	</div>
    </div>
</footer>

{{ component('nubesdk-slot', { type: "after_footer" }) }}
