{% set image_sizes = ['large', 'huge', 'original', '1080p'] %}
{% set category_images = [] %}
{% set has_category_images = category.images is not empty %}

{% for size in image_sizes %}
    {% if has_category_images %}
        {# Define images for admin categories #}
        {% set category_images = category_images|merge({(size):(category.images | first | category_image_url(size))}) %}
    {% else %}
        {# Define images for general banner #}
        {% set category_images = category_images|merge({(size):('banner-products.jpg' | static_url | settings_image_url(size))}) %}
    {% endif %}
{% endfor %}

{% set category_image_url = 'banner-products.jpg' | static_url %}

<section class="category-banner yamuna-plp-hero" data-store="category-banner">
    <div class="yamuna-plp-hero-image">
        <img fetchpriority="high" src="{{ category_images['large'] }}" srcset="{{ category_images['large'] }} 480w, {{ category_images['huge'] }} 640w, {{ category_images['original'] }} 1024w, {{ category_images['1080p'] }} 1920w" alt="{{ category.name }}" />
    </div>
    <div class="yamuna-plp-hero-content">
        <h1>{{ category.name }}</h1>
        {% if category.description %}
            <div class="yamuna-plp-hero-description">{{ category.description }}</div>
        {% endif %}
    </div>
</section>
