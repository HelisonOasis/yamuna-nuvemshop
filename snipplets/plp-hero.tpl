{% set plp_title = category.name | default('Creme de castanhas') %}
{% set plp_description = category.description | default('Os cremes de castanhas são feitos em moinho de pedra, num processo longo de 3 a 5 dias para que seja possível alcançar uma cremosidade finíssima sem aquecer os ingredientes. Assim conseguimos uma elevada qualidade nutricional porque os óleos naturais presentes nas castanhas e no cacau se mantém saudáveis. Seu corpo absorve muito mais e você sente um sabor incrível.') %}

<section class="yamuna-plp-hero" aria-labelledby="yamuna-plp-hero-title">
    <div class="yamuna-plp-hero-image">
        <img src="{{ 'images/yamuna/plp-hero-castanhas.png' | static_url }}" alt="{{ plp_title }}" fetchpriority="high" />
    </div>
    <div class="yamuna-plp-hero-content">
        <h1 id="yamuna-plp-hero-title">{{ plp_title }}</h1>
        <div class="yamuna-plp-hero-description">{{ plp_description }}</div>
    </div>
</section>
