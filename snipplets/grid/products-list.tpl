{% set no_results_message = template == 'category' ? (has_filters_enabled ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." : "Próximamente") | translate : "No hubo resultados para tu búsqueda" | translate %}
{% if products %}
    <div class="js-product-table row">
        {% include 'snipplets/product_grid.tpl' %}
    </div>
    <p class="js-yamuna-filter-empty yamuna-plp-empty-message text-center my-4" data-component="filter.message" hidden>{{ "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." | translate }}</p>
        {% include "snipplets/grid/pagination.tpl" with {infinite_scroll: true} %}
{% else %}
    <p class="yamuna-plp-empty-message text-center" data-component="filter.message">
        {{ no_results_message }}
    </p>
    {% include 'snipplets/empty-related-products.tpl' %}
{% endif %}
