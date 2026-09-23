{# /*============================================================================
  #Page breadcrumbs
==============================================================================*/
#Properties

#Breadcrumb
    //breadcrumbs_custom_class for custom CSS classes
#}

{% if breadcrumbs %}
    <div class="breadcrumbs js-yamuna-breadcrumbs {{ breadcrumbs_custom_class }} {% if template == 'category' %}mb-md-0 text-center text-md-left{% endif %}">
        <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
        <span class="divider">></span>
        {% if template == 'page' %}
            <span class="crumb active">{{ page.name }}</span>
        {% elseif template == 'cart' %}
            <span class="crumb active">{{ "Carrito de compras" | translate }}</span>
        {% elseif template == 'search' %}
            <span class="crumb active">{{ "Resultados de búsqueda" | translate }}</span>
        {% elseif template == 'account.orders' %}
            <span class="crumb active">{{ "Mi cuenta" | translate }}</span>
        {% elseif template == 'account.order' %}
            <a class="crumb" href="{{ store.customer_home_url }}" title="{{ 'Mi cuenta' | translate }}">{{ "Mi cuenta" | translate }}</a>
            <span class="divider">></span>
            <span class="crumb active">{{ 'Orden {1}' | translate(order.number) }}</span>
        {% elseif template == 'account.info' %}
            <a class="crumb" href="{{ store.customer_home_url }}" title="{{ 'Mi cuenta' | translate }}">{{ "Mi cuenta" | translate }}</a>
            <span class="divider">></span>
            <span class="crumb active">{{ "Mis datos" | translate }}</span>
        {% elseif template == 'account.addresses' %}
            <a class="crumb" href="{{ store.customer_home_url }}" title="{{ 'Mi cuenta' | translate }}">{{ "Mi cuenta" | translate }}</a>
            <span class="divider">></span>
            <span class="crumb active">{{ "Mis direcciones" | translate }}</span>
        {% elseif template == 'account.address' %}
            <a class="crumb" href="{{ store.customer_home_url }}" title="{{ 'Mi cuenta' | translate }}">{{ "Mi cuenta" | translate }}</a>
            <span class="divider">></span>
            <span class="crumb active">{{ "Editar dirección" | translate }}</span>
        {% elseif template == 'blog' %}
            <span class="crumb active">{{ 'Blog' | translate }}</span>
        {% elseif template == 'blog-post' %}
            <a class="crumb" href={{ store.blog_url }} title="{{ 'Blog' | translate }}">{{ 'Blog' | translate }}</a>
            <span class="divider">></span>
            <span class="crumb active">{{ post.title }}</span>
        {% else %}
            {% for crumb in breadcrumbs %}
                {% if crumb.last %}
                    <span class="crumb active">{{ crumb.name }}</span>
                {% else %}
                    <a class="crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
                    <span class="divider">></span>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
{% endif %}
