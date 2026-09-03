{# /*============================================================================
  #Modal
==============================================================================*/

#Properties
    // ID
    // Position - Top, Right, Bottom, Left
    // Transition - Slide and Fade
    // Width - Full and Box
    // modal_form_action - For modals that has a form
    // modal_fixed_footer - For modals with fixed footer. Need to include the fixed part inside the footer


#Topbar
    // Block - modal_topbar
#Head
    // Block - modal_head
#Body
    // Block - modal_body
#Footer
    // Block - modal_footer

#}

{% set modal_overlay = modal_overlay | default(true) %}

<div id="{{ modal_id }}" class="js-modal {% if modal_mobile_full_screen %}js-fullscreen-modal{% endif %} modal modal-{{ modal_class }} modal-{{modal_position}} transition-{{modal_transition}} modal-{{modal_width}} transition-soft {% if modal_zindex_top %}modal-zindex-top{% endif %}" style="display: none;" {% if data_component %}data-component="{{ data_component }}"{% endif %} {% if custom_data_attribute %}data-{{ custom_data_attribute }}="{{ custom_data_attribute_value }}"{% endif %} {% if modal_mobile_full_screen %}data-modal-url="{{ modal_url}}"{% endif %}>
    {% if modal_form_action %}
    <form action="{{ modal_form_action }}" method="post" class="{{ modal_form_class }} {% if modal_footer and modal_fixed_footer %}modal-with-fixed-footer{% endif %}" {% if modal_form_hook %}data-store="{{ modal_form_hook }}"{% endif %}>
    {% endif %}
    {% if modal_footer and modal_fixed_footer %}
        <div class="modal-with-fixed-footer">
            <div class="modal-scrollable-area">
    {% endif %}
                {% if modal_topbar %}
                    <div class="modal-topbar">
                        {% block modal_topbar %}{% endblock %}
                    </div>
                {% endif %}
                {% if modal_header %}
                    <div class="modal-header {{ modal_header_class }}{% if modal_id == 'modal-cart' %} yamuna-cart-modal-header{% endif %}" {% if modal_id == 'modal-cart' %}style="position: relative !important; display: flex !important; align-items: center !important; justify-content: space-between !important; height: 58px !important; min-height: 58px !important; max-height: 58px !important; padding: 0 12px !important; margin: 0 !important; box-sizing: border-box !important; border-bottom: 1px solid #d8d0d6 !important; background: #ffffff !important; width: 100% !important; z-index: 10 !important;"{% endif %}>
                        {% if modal_id == 'modal-cart' %}
                            <span class="yamuna-cart-header-title" style="color: #4a1d3a !important; font-family: 'Raleway', sans-serif !important; font-size: 16px !important; font-weight: 700 !important; line-height: 1 !important; text-transform: uppercase !important; letter-spacing: 0.02em !important; display: flex !important; align-items: center !important; margin: 0 !important; padding: 0 !important;">SACOLA DE COMPRAS</span>
                            <button type="button" class="js-modal-close modal-close yamuna-cart-modal-close" aria-label="Fechar" style="position: static !important; transform: none !important; display: flex !important; align-items: center !important; justify-content: center !important; width: 24px !important; height: 24px !important; min-width: 24px !important; min-height: 24px !important; margin: 0 !important; padding: 0 !important; border: 0 !important; border-radius: 50% !important; background: #f3eef1 !important; cursor: pointer !important; z-index: 31010 !important; flex-shrink: 0 !important;">
                                <svg width="10" height="10" viewBox="0 0 10 10" fill="none" style="display: block !important; width: 10px !important; height: 10px !important; stroke: #4a1d3a !important;"><path d="M1.5 1.5L8.5 8.5M8.5 1.5L1.5 8.5" stroke="#4A1D3A" stroke-width="1.6" stroke-linecap="round"/></svg>
                            </button>
                        {% else %}
                            <span class="js-modal-close modal-close {{ modal_close_class }}">
                                <svg class="icon-inline modal-close-icon icon-w-10"><use xlink:href="#times"/></svg>
                            </span>
                            {% block modal_head %}{% endblock %}
                        {% endif %}
                    </div>
                {% else %}
                    <span class="js-modal-close modal-close no-header {{ modal_close_class }}">
                        <svg class="icon-inline icon-lg modal-close-icon icon-w-10"><use xlink:href="#times"/></svg>
                    </span>
                {% endif %}
         
                <div class="modal-body">
                    {% block modal_body %}{% endblock %}
                </div>
    {% if modal_footer and modal_fixed_footer %}
            </div>
    {% endif %}
    {% if modal_footer %}
            <div class="modal-footer {% if not modal_fixed_footer %}d-md-block{% endif %} {{ modal_footer_class }}">
                {% block modal_foot %}{% endblock %}
            </div>
        {% if modal_fixed_footer %}
        </div>
        {% endif %}
    {% endif %}

    {% if modal_form_action %}
    </form>
    {% endif %}
</div>

<div class="js-modal-overlay modal-overlay {% if modal_zindex_top %}modal-zindex-top{% endif %}" data-modal-id="#{{ modal_id }}" style="display: none;"></div>
