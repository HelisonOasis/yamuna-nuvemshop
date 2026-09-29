{# Independent pair of category highlights. It does not share the native category-banner settings. #}
{% set highlight_01_image = 'yamuna_highlight_01.jpg' | has_custom_image %}
{% set highlight_02_image = 'yamuna_highlight_02.jpg' | has_custom_image %}

{% if (settings.yamuna_highlight_01_show and highlight_01_image) or (settings.yamuna_highlight_02_show and highlight_02_image) %}
  <section class="section-yamuna-category-highlights" data-store="home-yamuna-category-highlights">
    <div class="yamuna-category-highlights-container">
      {% for highlight in ['yamuna_highlight_01', 'yamuna_highlight_02'] %}
        {% set highlight_show = attribute(settings, highlight ~ '_show') %}
        {% set highlight_image = (highlight ~ '.jpg') | has_custom_image %}
        {% set highlight_title = attribute(settings, highlight ~ '_title') %}
        {% set highlight_url = attribute(settings, highlight ~ '_url') %}
        {% if highlight_show and highlight_image %}
          <a class="yamuna-category-highlight" href="{{ highlight_url ? highlight_url | setting_url : '#' }}"{% if highlight_title %} aria-label="{{ highlight_title }}"{% endif %}>
            <img src="{{ (highlight ~ '.jpg') | static_url | settings_image_url('large') }}" alt="{{ highlight_title | default('Destaque Yamuna') }}">
            <span class="yamuna-category-highlight-caption">
              <strong>{{ highlight_title | default('Ver mais') }}</strong>
              <span>Ver mais <b>→</b></span>
            </span>
          </a>
        {% endif %}
      {% endfor %}
    </div>
  </section>
{% endif %}
