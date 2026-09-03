{% set has_module = has_module | default(false) %}

{% if has_module %}
    {% set section_name = 'module' %}
    {% set section_format = settings.module_slider ? 'slider' : 'grid' %}
    {% set section_image_size = settings.module_same_size ? 'same' : 'original' %}
{% endif %}

{% if has_module %}
    <div class="js-home-{{ section_name }} section-banners-home" data-format="{{ section_format }}" data-image="{{ section_image_size }}">
        {% if has_module %}
            {% include 'snipplets/home/home-modules-grid.tpl' with {'module': true} %}
        {% endif %}
    </div>
    <script>
        (function () {
            var modules = document.currentScript.previousElementSibling;
            if (!modules || !window.matchMedia) return;

            function syncMobileMargin() {
                if (window.matchMedia('(max-width: 767px)').matches) {
                    modules.style.setProperty('margin-bottom', '0', 'important');
                } else {
                    modules.style.removeProperty('margin-bottom');
                }
            }

            syncMobileMargin();
            window.addEventListener('resize', syncMobileMargin);
        })();
    </script>
{% endif %}
