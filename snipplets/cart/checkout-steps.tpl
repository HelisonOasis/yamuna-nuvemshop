{# Yamuna checkout steps — Carrinho / Entrega / Pagamento
   step: 'cart' | 'entrega' | 'pagamento'
#}
{% set step = step | default('cart') %}
<nav class="yamuna-checkout-steps" data-step="{{ step }}" aria-label="Etapas da compra">
  <ol class="yamuna-checkout-steps-list">
    <li class="yamuna-checkout-steps-item{% if step == 'cart' %} is-current{% endif %}{% if step == 'entrega' or step == 'pagamento' %} is-done{% endif %}">
      <a class="yamuna-checkout-steps-link" href="{{ store.cart_url }}">
        <span class="yamuna-checkout-steps-icon" aria-hidden="true">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6 6h15l-1.5 9h-12L6 6z" stroke="currentColor" stroke-width="1.6" stroke-linejoin="round"/><path d="M6 6L5 3H2" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/><circle cx="9" cy="20" r="1.4" fill="currentColor"/><circle cx="18" cy="20" r="1.4" fill="currentColor"/></svg>
        </span>
        <span class="yamuna-checkout-steps-label">Carrinho</span>
      </a>
    </li>
    <li class="yamuna-checkout-steps-line{% if step == 'entrega' or step == 'pagamento' %} is-done{% endif %}" aria-hidden="true"></li>
    <li class="yamuna-checkout-steps-item{% if step == 'entrega' %} is-current{% endif %}{% if step == 'pagamento' %} is-done{% endif %}">
      <span class="yamuna-checkout-steps-link" aria-current="{% if step == 'entrega' %}step{% else %}false{% endif %}">
        <span class="yamuna-checkout-steps-icon" aria-hidden="true">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M3 7h11v10H3V7z" stroke="currentColor" stroke-width="1.6"/><path d="M14 10h4l3 3v4h-7v-7z" stroke="currentColor" stroke-width="1.6" stroke-linejoin="round"/><circle cx="7" cy="19" r="1.5" fill="currentColor"/><circle cx="17.5" cy="19" r="1.5" fill="currentColor"/></svg>
        </span>
        <span class="yamuna-checkout-steps-label">Entrega</span>
      </span>
    </li>
    <li class="yamuna-checkout-steps-line{% if step == 'pagamento' %} is-done{% endif %}" aria-hidden="true"></li>
    <li class="yamuna-checkout-steps-item{% if step == 'pagamento' %} is-current{% endif %}">
      <span class="yamuna-checkout-steps-link" aria-current="{% if step == 'pagamento' %}step{% else %}false{% endif %}">
        <span class="yamuna-checkout-steps-icon" aria-hidden="true">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="3" y="6" width="18" height="12" rx="2" stroke="currentColor" stroke-width="1.6"/><path d="M3 10h18" stroke="currentColor" stroke-width="1.6"/></svg>
        </span>
        <span class="yamuna-checkout-steps-label">Pagamento</span>
      </span>
    </li>
  </ol>
</nav>
