{# Checkout-style logo-only header (matches yamuna.com.br/checkout) #}
<div class="yamuna-cart-checkout-header" data-store="cart-checkout-header">
  <a class="yamuna-cart-checkout-logo-link" href="{{ store.url }}" aria-label="{{ store.name }}">
    <img
      class="yamuna-cart-checkout-logo"
      src="{{ 'images/yamuna/logo-yamuna.webp' | static_url }}"
      alt="{{ store.name }}"
      width="138"
      height="112"
      decoding="async"
    />
  </a>
</div>
