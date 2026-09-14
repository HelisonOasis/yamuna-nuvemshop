<div class="js-informative-banner-container service-item-container col-md h-auto swiper-slide p-0 px-md-3" {% if not banner_show %}style="display: none"{% endif %}>
    <div class="service-item mx-4 mx-md-0">
        {% if banner_services_url %}
            <a href="{{ banner_services_url | setting_url }}">
        {% endif %}
        <div class="row align-items-center">
            <div class="js-informative-banner-icon-{{ banner_index }} col-auto">
                {% set yamuna_benefit_icon = banner_index == 1 ? 'benefit-shipping.svg' : (banner_index == 2 ? 'benefit-pix.svg' : (banner_index == 3 ? 'benefit-discount.svg' : (banner_index == 4 ? 'benefit-family.svg' : 'benefit-card.svg'))) %}
                <img class="yamuna-benefit-icon" src="{{ ('images/yamuna/' ~ yamuna_benefit_icon) | static_url }}" alt="" width="24" height="24" />
            </div>
            <div class="col p-0">
                <h3 class="js-informative-banner-title js-informative-banner-title-{{ banner_index }} h5 m-0">{{ banner_services_title }}</h3>
                <p class="js-informative-banner-description-{{ banner_index }} m-0">{{ banner_services_description }}</p>
            </div>
        </div>
        {% if banner_services_url %}
            </a>
        {% endif %}
    </div>
</div>
