{% set search_page_filters = template == 'search' and search_filter %}
{% set category_page = template == 'category' %}
{% if (search_page_filters or category_page)  %}
    <section class="js-category-controls category-controls container visible-when-content-ready">
        <div class="row align-items-center">
            <div class="visible-when-content-ready col-auto">
                <a href="#" class="js-modal-open yamuna-plp-filter-trigger" data-toggle="#nav-filters" data-component="filter-button">
                    <svg class="yamuna-plp-filter-trigger-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none" aria-hidden="true">
                        <g clip-path="url(#clip0_3426_14815)">
                            <path d="M0.75 3.56245H2.802C2.96298 4.15475 3.31438 4.67762 3.80199 5.0504C4.28961 5.42318 4.88634 5.62514 5.50012 5.62514C6.11391 5.62514 6.71064 5.42318 7.19826 5.0504C7.68587 4.67762 8.03727 4.15475 8.19825 3.56245H17.25C17.4489 3.56245 17.6397 3.48343 17.7803 3.34278C17.921 3.20213 18 3.01136 18 2.81245C18 2.61354 17.921 2.42277 17.7803 2.28212C17.6397 2.14147 17.4489 2.06245 17.25 2.06245H8.19825C8.03727 1.47015 7.68587 0.947279 7.19826 0.574502C6.71064 0.201724 6.11391 -0.000244141 5.50012 -0.000244141C4.88634 -0.000244141 4.28961 0.201724 3.80199 0.574502C3.31438 0.947279 2.96298 1.47015 2.802 2.06245H0.75C0.551088 2.06245 0.360322 2.14147 0.21967 2.28212C0.0790176 2.42277 0 2.61354 0 2.81245C0 3.01136 0.0790176 3.20213 0.21967 3.34278C0.360322 3.48343 0.551088 3.56245 0.75 3.56245ZM5.49975 1.49995C5.75934 1.49995 6.0131 1.57693 6.22894 1.72115C6.44478 1.86537 6.613 2.07035 6.71234 2.31018C6.81168 2.55001 6.83767 2.81391 6.78703 3.06851C6.73639 3.32311 6.61138 3.55697 6.42783 3.74053C6.24427 3.92408 6.01041 4.04909 5.75581 4.09973C5.50121 4.15037 5.23731 4.12438 4.99748 4.02504C4.75765 3.9257 4.55267 3.75748 4.40845 3.54164C4.26423 3.3258 4.18725 3.07204 4.18725 2.81245C4.18765 2.46448 4.32606 2.13087 4.57211 1.88481C4.81817 1.63876 5.15178 1.50035 5.49975 1.49995Z" fill="#A31460"/>
                            <path d="M17.25 8.25001H15.198C15.0373 7.65757 14.686 7.13451 14.1985 6.76158C13.7109 6.38865 13.1141 6.18658 12.5002 6.18658C11.8864 6.18658 11.2896 6.38865 10.802 6.76158C10.3145 7.13451 9.96321 7.65757 9.8025 8.25001H0.75C0.551088 8.25001 0.360322 8.32903 0.21967 8.46968C0.0790176 8.61033 0 8.8011 0 9.00001C0 9.19892 0.0790176 9.38969 0.21967 9.53034C0.360322 9.67099 0.551088 9.75001 0.75 9.75001H9.8025C9.96321 10.3424 10.3145 10.8655 10.802 11.2384C11.2896 11.6114 11.8864 11.8134 12.5002 11.8134C13.1141 11.8134 13.7109 11.6114 14.1985 11.2384C14.686 10.8655 15.0373 10.3424 15.198 9.75001H17.25C17.4489 9.75001 17.6397 9.67099 17.7803 9.53034C17.921 9.38969 18 9.19892 18 9.00001C18 8.8011 17.921 8.61033 17.7803 8.46968C17.6397 8.32903 17.4489 8.25001 17.25 8.25001ZM12.5002 10.3125C12.2407 10.3125 11.9869 10.2355 11.7711 10.0913C11.5552 9.94709 11.387 9.74211 11.2877 9.50228C11.1883 9.26245 11.1623 8.99855 11.213 8.74395C11.2636 8.48935 11.3886 8.25549 11.5722 8.07193C11.7557 7.88838 11.9896 7.76337 12.2442 7.71273C12.4988 7.66209 12.7627 7.68808 13.0025 7.78742C13.2424 7.88676 13.4473 8.05498 13.5916 8.27082C13.7358 8.48666 13.8127 8.74042 13.8127 9.00001C13.8124 9.34798 13.6739 9.68159 13.4279 9.92765C13.1818 10.1737 12.8482 10.3121 12.5002 10.3125Z" fill="#A31460"/>
                            <path d="M17.25 14.4375H8.19825C8.03727 13.8452 7.68587 13.3223 7.19826 12.9496C6.71064 12.5768 6.11391 12.3748 5.50012 12.3748C4.88634 12.3748 4.28961 12.5768 3.80199 12.9496C3.31438 13.3223 2.96298 13.8452 2.802 14.4375H0.75C0.551088 14.4375 0.360322 14.5165 0.21967 14.6572C0.0790176 14.7978 0 14.9886 0 15.1875C0 15.3864 0.0790176 15.5772 0.21967 15.7178C0.360322 15.8585 0.551088 15.9375 0.75 15.9375H2.802C2.96298 16.5298 3.31438 17.0527 3.80199 17.4255C4.28961 17.7982 4.88634 18.0002 5.50012 18.0002C6.11391 18.0002 6.71064 17.7982 7.19826 17.4255C7.68587 17.0527 8.03727 16.5298 8.19825 15.9375H17.25C17.4489 15.9375 17.6397 15.8585 17.7803 15.7178C17.921 15.5772 18 15.3864 18 15.1875C18 14.9886 17.921 14.7978 17.7803 14.6572C17.6397 14.5165 17.4489 14.4375 17.25 14.4375ZM5.49975 16.5C5.24016 16.5 4.9864 16.423 4.77056 16.2788C4.55472 16.1346 4.3865 15.9296 4.28716 15.6898C4.18782 15.45 4.16183 15.1861 4.21247 14.9315C4.26311 14.6769 4.38812 14.443 4.57167 14.2594C4.75523 14.0759 4.98909 13.9509 5.24369 13.9002C5.49829 13.8496 5.76219 13.8756 6.00202 13.9749C6.24185 14.0743 6.44683 14.2425 6.59105 14.4583C6.73527 14.6742 6.81225 14.9279 6.81225 15.1875C6.81166 15.5354 6.67318 15.8689 6.42717 16.1149C6.18116 16.3609 5.84766 16.4994 5.49975 16.5Z" fill="#A31460"/>
                        </g>
                        <defs><clipPath id="clip0_3426_14815"><path d="M0 6C0 2.68629 2.68629 0 6 0H18V18H6C2.68629 18 0 15.3137 0 12V6Z" fill="white"/></clipPath></defs>
                    </svg>
                    <span class="yamuna-plp-filter-label-desktop">{{ 'Filtrar' | t }}</span>
                    <span class="yamuna-plp-filter-label-mobile">{{ 'Filtros' | t }}</span>
                </a>
            </div>
            {% if products %}
            <div class="col ml-auto yamuna-plp-sort">
                <span class="yamuna-plp-sort-label">{{ 'Ordenar por' | t }}</span>
                {{ component(
                    'sort-by',{
                        label: false,
                        sort_by_classes: {
                            select_group: "mb-0",
                            select_label: "h2 font-extra-large mb-3 d-block",
                            select: "font-weight-bold",
                            select_svg: "icon-inline icon-w-14 icon-lg",
                        },
                        select_svg_id: 'sort-alt'
                    }) 
                }}
                <ul class="yamuna-plp-sort-options" role="listbox" aria-label="{{ 'Ordenar por' | t }}">
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="price-ascending">{{ 'Preço: menor ao maior' | t }}</button></li>
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="price-descending">{{ 'Preço: maior ao menor' | t }}</button></li>
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="alpha-ascending">{{ 'A - Z' | t }}</button></li>
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="alpha-descending">{{ 'Z - A' | t }}</button></li>
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="created-descending">{{ 'Mais novo ao mais antigo' | t }}</button></li>
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="created-ascending">{{ 'Mais antigo ao mais novo' | t }}</button></li>
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="best-selling">{{ 'Mais vendidos' | t }}</button></li>
                    <li><button type="button" class="yamuna-plp-sort-option" role="option" data-sort-value="user">{{ 'Destaque' | t }}</button></li>
                </ul>
                
            </div>
            {% endif %}
        </div>
    </section>
    <div class="yamuna-plp-active-filters js-yamuna-plp-active-filters" aria-live="polite" hidden></div>
    {% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters yamuna-plp-filters-modal', modal_position: 'left', modal_transition: 'slide', modal_header: true, modal_width: 'full', modal_zindex_top: true } %}
        {% block modal_head %}
            {{'Filtros ' | translate }}
        {% endblock %}
        {% block modal_body %}
            {% include "snipplets/grid/filters.tpl" with {mobile: true, yamuna_plp_modal: true} %}
            <div class="js-filters-overlay filters-overlay" style="display: none;">
                <div class="filters-updating-message">
                    <div class="js-applying-filter yamuna-hx-msg" style="display: none;">{{ 'Aplicando filtro...' | translate }}</div>
                    <div class="js-removing-filter yamuna-hx-msg" style="display: none;">{{ 'Borrando filtro...' | translate }}</div>
                </div>
            </div>
        {% endblock %}
    {% endembed %}
    <div class="container visible-when-content-ready d-md-none">
        {% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
    </div>
{% endif %}


