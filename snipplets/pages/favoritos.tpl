{# Lista de Desejos / Favoritos — cards no layout da PLP #}
{% set bag_icon = 'images/yamuna/home-spot-bag-white.svg' | static_url %}
{% set bag_icon_teal = 'images/yamuna/home-spot-bag-teal.svg' | static_url %}
{% set login_url = store.customer_login_url %}

<section
  class="yamuna-favoritos-page"
  data-yamuna-favoritos
  data-customer-id="{% if customer %}{{ customer.id }}{% endif %}"
  data-customer-logged="{% if customer %}1{% else %}0{% endif %}"
  data-login-url="{{ login_url }}"
  data-cart-url="{{ store.cart_url }}"
  data-bag-icon="{{ bag_icon }}"
  data-bag-icon-teal="{{ bag_icon_teal }}"
>
  <div class="container yamuna-favoritos-inner">
    <header class="yamuna-favoritos-header">
      <h1 class="yamuna-favoritos-title">Lista de Desejos</h1>
      <p class="yamuna-favoritos-subtitle js-yamuna-favoritos-subtitle" hidden></p>
    </header>

    <div class="yamuna-favoritos-empty js-yamuna-favoritos-empty" hidden>
      <p class="yamuna-favoritos-empty-text">Sua lista de desejos está vazia.</p>
      <a class="yamuna-favoritos-empty-cta" href="{{ store.url }}/">Continuar comprando</a>
    </div>

    <div class="yamuna-favoritos-login js-yamuna-favoritos-login" hidden>
      <p class="yamuna-favoritos-login-text">Entre na sua conta para ver e salvar seus favoritos.</p>
      <a class="yamuna-favoritos-empty-cta" href="{{ login_url }}">Entrar</a>
    </div>

    <div class="yamuna-favoritos-grid js-yamuna-favoritos-grid js-product-table" aria-live="polite"></div>
  </div>
</section>
