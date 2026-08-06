{# /*============================================================================
  #Form
==============================================================================*/

#Properties
 
    // id
    // action
    // custom_class for custom CSS classes
    // Cancel if cancel button is needed
#}

<form id="{{ form_id }}" action="{{ form_action }}" method="post" class="js-form form {{ form_custom_class }}" {% if data_store %}data-store="{{ data_store }}"{% endif %}>
    {% block form_body %}
    {% endblock%}
    {% if cancel %}
        <a href="#" class="{{ cancel_custom_class }} btn btn-default">{{ cancel_text }}</a>
    {% endif %}

    {% if template == 'account.register' %}
        {{ component('nubesdk-slot', { type: "before_register_form_submit" }) }}
    {% endif %}

    <button class="btn btn-primary {{ submit_custom_class }}" type="submit" value="{{ submit_text }}" name="{{ submit_name }}" {{ submit_prop }}>
        {{ submit_text }}
        <span class="js-form-spinner" style="display:none;">
            <svg class="icon-inline icon-spin h5"><use xlink:href="#circle-notch"/></svg>
        </span>
    </button>

    {% if template == 'account.register' %}
        <div class="clear-both">
            {{ component('nubesdk-slot', { type: "after_register_form_submit" }) }}
        </div>
    {% endif %}
</form>
