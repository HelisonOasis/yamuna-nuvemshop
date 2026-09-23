<ul class="search-suggest-list">
    {# Show every product returned by the suggest endpoint (no take() cap). #}
    {% for product in products %}
        <li class="search-suggest-item yamuna-search-suggest-item">
            <div class="yamuna-search-suggest-row">
                <a href="{{ product.url }}" class="yamuna-search-suggest-product">
                    <span class="yamuna-search-suggest-thumb">
                        {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'yamuna-search-suggest-image'}) }}
                    </span>
                    <span class="yamuna-search-suggest-info">
                        <span class="yamuna-search-suggest-name">{{ product.name | highlight(query) }}</span>
                        {% if product.display_price %}
                            {% if product.isSubscriptionOnly() %}
                                {{ component('subscriptions/subscription-price', {
                                    location: 'product_list',
                                    subscription_classes: {
                                        price_compare: 'price-compare',
                                    },
                                }) }}
                            {% else %}
                                <span class="yamuna-search-suggest-price">{{ product.price | money }}</span>
                            {% endif %}
                        {% endif %}
                    </span>
                </a>
                {% if product.available and product.display_price and not product.variations and not product.isSubscribable() %}
                    <form class="js-product-form yamuna-search-suggest-form" method="post" action="{{ store.cart_url }}">
                        <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                        <input type="hidden" name="quantity" value="1" class="js-home-spot-add-quantity" />
                        <button type="submit" class="js-addtocart js-prod-submit-form yamuna-search-suggest-atc" data-quantity="1" data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}" title="{{ 'Adicionar ao carrinho' | translate }}" aria-label="{{ 'Adicionar ao carrinho' | translate }} {{ product.name }}">
                            <img src="{{ 'images/yamuna/home-spot-bag-white.svg' | static_url }}" alt="" aria-hidden="true" width="18" height="18" />
                        </button>
                    </form>
                {% else %}
                    <a href="{{ product.url }}" class="yamuna-search-suggest-chevron" aria-label="{{ product.name }}">
                        <svg class="icon-inline search-suggest-icon" aria-hidden="true"><use xlink:href="#chevron"/></svg>
                    </a>
                {% endif %}
            </div>
        </li>
    {% endfor %}
    <a href="#" class="js-search-suggest-all-link btn btn-primary d-inline-block mt-3">{{ 'Ver todos los resultados' | translate }}</a>
</ul>

<style>
/* Scenario 16 — search suggest rows with ATC */
.search-suggest .yamuna-search-suggest-item,
.yamuna-mobile-search-suggest .yamuna-search-suggest-item {
  margin: 0 !important;
  padding: 0 !important;
  list-style: none !important;
  border-bottom: 1px solid #f0e8ee;
}
.search-suggest .yamuna-search-suggest-item:last-of-type,
.yamuna-mobile-search-suggest .yamuna-search-suggest-item:last-of-type {
  border-bottom: 0;
}
.yamuna-search-suggest-row {
  display: flex !important;
  align-items: center !important;
  gap: 12px !important;
  width: 100% !important;
  min-height: 72px !important;
  padding: 12px 16px !important;
  box-sizing: border-box !important;
}
.yamuna-search-suggest-product {
  display: flex !important;
  flex: 1 1 auto !important;
  min-width: 0 !important;
  align-items: center !important;
  gap: 12px !important;
  margin: 0 !important;
  padding: 0 !important;
  color: inherit !important;
  text-decoration: none !important;
}
.yamuna-search-suggest-thumb {
  display: flex !important;
  flex: 0 0 56px !important;
  width: 56px !important;
  height: 56px !important;
  align-items: center !important;
  justify-content: center !important;
  overflow: hidden !important;
  border-radius: 8px !important;
  background: #f7f5f7 !important;
}
.yamuna-search-suggest-image {
  display: block !important;
  width: 56px !important;
  height: 56px !important;
  object-fit: contain !important;
}
.yamuna-search-suggest-info {
  display: flex !important;
  flex: 1 1 auto !important;
  min-width: 0 !important;
  flex-direction: column !important;
  justify-content: center !important;
  gap: 4px !important;
}
.yamuna-search-suggest-name {
  display: block !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  color: #4a1d3a !important;
  font-family: Raleway, sans-serif !important;
  font-size: 15px !important;
  font-weight: 600 !important;
  line-height: 1.35 !important;
  white-space: nowrap !important;
  text-overflow: ellipsis !important;
}
.yamuna-search-suggest-name strong,
.yamuna-search-suggest-name b {
  color: #a31460 !important;
  font-weight: 700 !important;
}
.yamuna-search-suggest-price {
  display: block !important;
  margin: 0 !important;
  color: #a31460 !important;
  font-family: Raleway, sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
  line-height: 1.3 !important;
}
.yamuna-search-suggest-form {
  display: flex !important;
  flex: 0 0 auto !important;
  margin: 0 !important;
  align-items: center !important;
}
.yamuna-search-suggest-atc {
  display: inline-flex !important;
  flex: 0 0 44px !important;
  width: 44px !important;
  height: 44px !important;
  min-width: 44px !important;
  align-items: center !important;
  justify-content: center !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 10px !important;
  background: #a31460 !important;
  box-shadow: 0 2px 8px rgba(163, 20, 96, 0.22) !important;
  cursor: pointer !important;
}
.yamuna-search-suggest-atc:hover,
.yamuna-search-suggest-atc:focus {
  background: #8c1052 !important;
}
.yamuna-search-suggest-atc img {
  display: block !important;
  width: 18px !important;
  height: 18px !important;
}
.yamuna-search-suggest-chevron {
  display: flex !important;
  flex: 0 0 44px !important;
  width: 44px !important;
  height: 44px !important;
  align-items: center !important;
  justify-content: center !important;
  color: #a31460 !important;
  text-decoration: none !important;
}
.yamuna-search-suggest-row:hover {
  background: #f7edf3 !important;
}
@media (min-width: 1024px) {
  .yamuna-search-suggest-row {
    padding: 14px 20px !important;
    gap: 16px !important;
  }
  .yamuna-search-suggest-name {
    font-size: 16px !important;
  }
  .yamuna-search-suggest-atc {
    width: 48px !important;
    height: 48px !important;
    min-width: 48px !important;
    flex-basis: 48px !important;
    border-radius: 12px !important;
  }
}

/* VER TODOS OS RESULTADOS — 40px height (override theme .btn-primary padding:13px) */
.search-suggest-list {
  display: flex !important;
  flex-direction: column !important;
  align-items: stretch !important;
}
a.js-search-suggest-all-link.btn,
a.js-search-suggest-all-link.btn.btn-primary,
.search-suggest-list > a.js-search-suggest-all-link,
.js-search-suggest a.js-search-suggest-all-link.btn {
  display: flex !important;
  width: min(380px, 100%) !important;
  max-width: 380px !important;
  align-self: center !important;
  height: 40px !important;
  min-height: 40px !important;
  max-height: 40px !important;
  margin: 12px auto 8px !important;
  padding: 0 16px !important;
  align-items: center !important;
  justify-content: center !important;
  box-sizing: border-box !important;
  border: 0 !important;
  border-radius: 999px !important;
  background: #a31460 !important;
  background-color: #a31460 !important;
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 13px !important;
  font-weight: 600 !important;
  line-height: 1 !important;
  letter-spacing: .02em !important;
  text-transform: uppercase !important;
}
</style>
