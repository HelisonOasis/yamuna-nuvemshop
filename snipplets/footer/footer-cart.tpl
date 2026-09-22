{# Simplified checkout footer — mirrors yamuna.com.br/checkout login-checkout-footer #}
{% set has_payment_logos = settings.payments %}
{% set whatsapp_link = store.whatsapp %}
<footer class="yamuna-cart-checkout-footer" data-store="cart-checkout-footer">
  <div class="yamuna-cart-checkout-footer-inner">
    <div class="yamuna-cart-checkout-footer-content">
      <a class="yamuna-cart-checkout-footer-brand" href="{{ store.url }}" aria-label="{{ store.name }}">
        <img src="{{ 'images/yamuna/logo-yamuna-branco.png' | static_url }}" alt="{{ store.name }}" loading="lazy" />
      </a>

      <nav class="yamuna-cart-checkout-footer-section" aria-label="Vendas">
        <h2>VENDAS</h2>
        <ul>
          {% if whatsapp_link %}
            <li><a href="{{ whatsapp_link }}" target="_blank" rel="noopener">Atendimento ao Cliente</a></li>
          {% endif %}
          <li><a href="{{ store.url }}/revenda">Revenda e Lojistas</a></li>
          {% if store.email %}
            <li><a href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;to=contato@yamuna.com.br" target="_blank" rel="noopener">Contato via E-mail</a></li>
          {% endif %}
          {% if whatsapp_link %}
            <li><a href="{{ whatsapp_link }}" target="_blank" rel="noopener">Comprar com Whatsapp</a></li>
          {% endif %}
          <li><a href="{{ store.customer_home_url }}">Meus Pedidos</a></li>
        </ul>
      </nav>

      {% if has_payment_logos %}
        <section class="yamuna-cart-checkout-footer-section yamuna-cart-checkout-footer-payments" aria-labelledby="cart-footer-payments">
          <h2 id="cart-footer-payments">FORMAS DE PAGAMENTO</h2>
          <div class="yamuna-cart-checkout-footer-payments-logos">
            {% include "snipplets/logos-icons.tpl" with {'payments': true} %}
          </div>
        </section>
      {% endif %}

      <section class="yamuna-cart-checkout-footer-section yamuna-cart-checkout-footer-security" aria-labelledby="cart-footer-security">
        <h2 id="cart-footer-security">SEGURANÇA</h2>
        <div class="yamuna-cart-checkout-footer-security-logos">
          <img class="yamuna-security-google" src="{{ 'images/yamuna/security-google.svg' | static_url }}" alt="Google Safe Browsing" loading="lazy" />
          <img class="yamuna-security-site" src="{{ 'images/yamuna/security-site.svg' | static_url }}" alt="Site seguro" loading="lazy" />
          <img class="yamuna-security-ssl" src="{{ 'images/yamuna/security-ssl.svg' | static_url }}" alt="SSL seguro" loading="lazy" />
          {% if store.afip %}
            <div class="footer-logo afip seal-afip">{{ store.afip | raw }}</div>
          {% endif %}
          {% if ebit %}
            <div class="footer-logo ebit seal-ebit">{{ ebit }}</div>
          {% endif %}
          {% if "seal_img.jpg" | has_custom_image %}
            <div class="footer-logo custom-seal">
              {% if settings.seal_url != '' %}<a href="{{ settings.seal_url }}" target="_blank">{% endif %}
                <img src="{{ 'seal_img.jpg' | static_url }}" alt="Selo de segurança" loading="lazy" />
              {% if settings.seal_url != '' %}</a>{% endif %}
            </div>
          {% endif %}
          {% if settings.custom_seal_code %}
            <div class="footer-logo custom-seal custom-seal-code">{{ settings.custom_seal_code | raw }}</div>
          {% endif %}
        </div>
      </section>
    </div>

    <div class="yamuna-cart-checkout-footer-bottom">
      <p>
        {% if store.business_name %}{{ store.business_name }}{% else %}{{ store.name }}{% endif %}
        {% if store.business_id %} © C.N.P.J {{ store.business_id }}{% endif %}
        {% if store.address %} {{ store.address }}{% endif %}
      </p>
    </div>
  </div>
</footer>
