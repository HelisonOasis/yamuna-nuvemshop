{% if product_filters is not empty %}
    <section class="yamuna-plp-quick-filters visible-when-content-ready" aria-label="{{ 'Selecione os filtros abaixo' | translate }}">
        <div class="yamuna-plp-quick-filters-heading">
            <svg class="icon-inline" aria-hidden="true"><use xlink:href="#filter"/></svg>
            <span>{{ 'Selecione os filtros abaixo' | translate }}</span>
        </div>
        <div class="yamuna-plp-quick-filters-list">
            {% for product_filter in product_filters %}
                {% if product_filter.type != 'price' and product_filter.has_products %}
                    {% for value in product_filter.values %}
                        {% if value.product_count > 0 %}
                            {% set yamuna_filter_value = value.name | lower %}
                            <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} yamuna-plp-quick-filter{% if value.selected %} is-selected{% endif %}" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                <input type="checkbox" autocomplete="off" {% if value.selected %}checked{% endif %}/>
                                <span class="yamuna-plp-quick-filter-icon" aria-hidden="true">
                                    {% if yamuna_filter_value in ['sem gluten', 'sem glúten'] %}
                                        <img src="{{ 'images/yamuna/plp-filters/sem-gluten.svg' | static_url }}" alt="" />
                                    {% elseif yamuna_filter_value in ['organico', 'orgânico'] %}
                                        <img src="{{ 'images/yamuna/plp-filters/organico.svg' | static_url }}" alt="" />
                                    {% elseif yamuna_filter_value == 'sem lactose' %}
                                        <img src="{{ 'images/yamuna/plp-filters/sem-lactose.svg' | static_url }}" alt="" />
                                    {% endif %}
                                </span>
                                <span>{{ value.name }}</span>
                            </label>
                        {% endif %}
                    {% endfor %}
                {% endif %}
            {% endfor %}
        </div>
    </section>
{% endif %}
