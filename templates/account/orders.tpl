{% embed "snipplets/page-header.tpl" %}
    {% block page_header_text %}{{ "Mi cuenta" | translate }}{% endblock page_header_text %}
{% endembed %}

<section class="account-page yamuna-account-page">
    <div class="container">
        <div class="yamuna-account-layout">
            <aside class="yamuna-account-dados">
                <h4 class="yamuna-account-section-title mb-1 mt-2">{{ 'Datos' | translate }}</h4>
                <div class="divider mt-0"></div>
                <div class="yamuna-dados-cards">
                    <div class="box p-3 yamuna-dados-card">
                        <h6 class="mb-0">{{ 'Datos Personales' | translate }} {{ 'Editar' | translate | a_tag(store.customer_info_url, '', 'btn-link btn-link-primary font-small float-right') }}</h6>
                        <div class="divider mx-0 mt-1 mb-2"></div>
                        <p class="font-small mb-0">
                            <strong>
                                {{customer.name}}
                            </strong>
                            <span class="d-block">
                                {{customer.email}}
                            </span>
                            {% if customer.cpf_cnpj %}
                                <span class="d-block">
                                    <strong>{{ 'DNI / CUIT' | translate }}:</strong> {{ customer.cpf_cnpj | format_id_number(customer.billing_country) }}
                                </span>
                            {% endif %}

                            {% if customer.business_name %}
                                <span class="d-block">
                                    <strong>{{ 'Razón social' | translate }}:</strong> {{ customer.business_name }}
                                </span>
                            {% endif %}
                            {% if customer.trade_name %}
                                <span class="d-block">
                                    <strong>{{ 'Nombre comercial' | translate }}:</strong> {{ customer.trade_name }}
                                </span>
                            {% endif %}
                            {% if customer.state_registration %}
                                <span class="d-block">
                                    <strong>{{ 'Inscripción estatal' | translate }}:</strong> {{ customer.state_registration }}
                                </span>
                            {% endif %}
                            {# Giro business activity used only by CL stores #}
                            {% if customer.business_activity %}
                                <span class="d-block">
                                    <strong>{{ 'Giro' | translate }}:</strong> {{ customer.business_activity }}
                                </span>
                            {% endif %}
                            {% if customer.fiscal_regime %}
                                <span class="d-block">
                                    <strong>{{ 'Régimen fiscal' | translate }}:</strong> {{ customer.fiscal_regime | format_fiscal_regime }}
                                </span>
                            {% endif %}

                            {% if customer.phone %}
                                <span class="d-block">
                                   <strong>{{ 'Teléfono' | translate }}:</strong> {{ customer.phone }}
                                </span>
                            {% endif %}
                        </p>
                    </div>
                    {% if customer.default_address %}
                        <div class="box p-3 yamuna-dados-card">
                            <h6 class="mb-0">{{ 'Mis direcciones' | translate }} {{ 'Editar' | translate | a_tag(store.customer_address_url(customer.default_address), '', 'btn-link btn-link-primary font-small float-right') }}</h6>
                            <div class="divider mx-0 mt-1 mb-2"></div>

                            <p class="mb-0">
                                <span class="d-block font-small my-2">
                                    {{ customer.default_address | format_address_short }}
                                </span>
                                {{ 'Otras direcciones' | translate | a_tag(store.customer_addresses_url, '', 'btn-link btn-link-primary font-small') }}
                            </p>
                        </div>
                    {% endif %}
                </div>
            </aside>

            <div class="yamuna-account-orders">
                <div class="yamuna-account-orders-head mb-1 mt-2">
                    <span class="h4 yamuna-account-section-title">
                        {{ 'Mis Compras' | translate }}
                    </span>
                    {% if customer.ordersCount > 50 %}
                        <span class="font-small ml-1">
                            ({{ 'últimas 50 órdenes' | translate }})
                        </span>
                    {% endif %}
                </div>
                <div class="divider mt-0"></div>
                <div class="yamuna-orders-grid" data-store="account-orders">
                    {% if customer.orders %}
                        {% for order in customer.orders %}
                            {% set add_checkout_link = order.pending %}
                            {% set card_active = add_checkout_link ? true : false  %}
                            <div class="yamuna-order-item" data-store="account-order-item-{{ order.id }}">
                                {% embed "snipplets/card.tpl" with{card_footer: true, card_custom_class: 'box card-collapse yamuna-order-card', card_active: card_active, card_collapse: true} %}
                                    {% block card_head %}
                                        <div class="yamuna-order-head">
                                            <a class="yamuna-order-title btn-link-primary" href="{{ store.customer_order_url(order) }}">
                                                <strong>{{'Orden' | translate}}: #{{order.number}}</strong>
                                            </a>
                                            <span class="yamuna-order-date">{{ order.date | i18n_date('%d/%m/%Y') }}</span>
                                            <a class="yamuna-order-eye d-none d-md-inline-flex btn-link-primary" href="{{ store.customer_order_url(order) }}" aria-label="{{ 'Ver detalle' | translate }}">
                                                <svg class="icon-inline icon-w-14 icon-lg"><use xlink:href="#eye"/></svg>
                                            </a>
                                        </div>
                                    {% endblock %}
                                    {% block card_body %}
                                        <div class="yamuna-order-body">
                                            <div class="yamuna-order-statuses">
                                                <p class="yamuna-order-status">
                                                    <svg class="icon-inline svg-icon-primary" aria-hidden="true"><use xlink:href="#credit-card"/></svg>
                                                    <span>{{'Pago' | translate}}:</span>
                                                    <span class="{{ order.payment_status }}"><strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong></span>
                                                </p>
                                                <p class="yamuna-order-status">
                                                    <svg class="icon-inline svg-icon-primary" aria-hidden="true"><use xlink:href="#truck"/></svg>
                                                    <span>{{'Envío' | translate}}:</span>
                                                    <strong>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : (order.shipping_status == 'delivered'? 'Entregado' : 'No enviado')) | translate }}</strong>
                                                </p>
                                            </div>
                                            <div class="yamuna-order-bottom">
                                                <div class="yamuna-order-summary">
                                                    <p class="yamuna-order-total">
                                                        <strong>{{'Total' | translate}}</strong> {{ order.total | money }}
                                                    </p>
                                                    <a class="yamuna-order-detail btn-link-primary" href="{{ store.customer_order_url(order) }}">{{'Ver detalle >' | translate}}</a>
                                                </div>
                                                <div class="yamuna-order-thumb">
                                                    {% for item in order.items %}
                                                        {% if loop.first %}
                                                            {% if loop.length > 1 %}
                                                                <span class="yamuna-order-thumb-pill">{{ loop.length }}</span>
                                                            {% endif %}
                                                            {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'yamuna-order-thumb-img'}) }}
                                                        {% endif %}
                                                    {% endfor %}
                                                </div>
                                            </div>
                                        </div>
                                    {% endblock %}
                                    {% block card_foot %}
                                        {% if add_checkout_link %}
                                            <a class="btn btn-primary btn-small d-block yamuna-order-cta" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                                        {% elseif order.order_status_url != null %}
                                            <a class="btn btn-primary btn-small d-block yamuna-order-cta" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                        {% endif %}
                                    {% endblock %}
                                {% endembed %}
                            </div>
                        {% endfor %}
                    {% else %}
                        <div class="yamuna-orders-empty text-center">
                            <svg class="icon-inline mr-1 icon-lg svg-icon-primary"><use xlink:href="#cart"/></svg>
                            <p class="mt-2">{{ '¡Hacé tu primera compra!' | translate }}</p>
                            {{ 'Ir a la tienda' | translate | a_tag(store.url, '', 'btn btn-primary btn-small w-100 mt-2') }}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</section>
