{% set is_account_activation = action == 'account_activation' %}

<section class="yamuna-login-page" data-store="account-newpass-page">
  <h1 class="yamuna-login-heading">{{ (is_account_activation ? 'Ativar conta' : 'Mudar minha senha') | translate }}</h1>

  <div class="yamuna-login-card">
    {% if link_expired %}
      {% set contact_links = store.whatsapp or store.phone or store.email %}

      <div class="yamuna-login-intro">
        {% if is_account_activation %}
          <strong>{{ 'O link para ativar sua conta expirou' | translate }}</strong>
          <p>{{ 'Fale com a gente para enviarmos um novo.' | translate }}</p>
        {% else %}
          <strong>{{ 'O link para alterar sua senha expirou' | translate }}</strong>
          <p>{{ 'Informe seu e-mail para receber um novo.' | translate }}</p>
        {% endif %}
      </div>

      {% if is_account_activation %}
        {% if contact_links %}
          {% include "snipplets/contact-links.tpl" with {
            phone_and_mail_only: true,
            centered_info: true
          } %}
        {% endif %}
      {% else %}
        <a href="{{ store.customer_reset_password_url }}" class="btn btn-primary yamuna-login-submit">Informar e-mail</a>
      {% endif %}

      <p class="yamuna-login-forgot-wrap">
        <a href="{{ store.customer_login_url }}" class="yamuna-login-forgot">Voltar ao login</a>
      </p>
    {% else %}
      {% if failure %}
        <div class="alert alert-danger">{{ 'As senhas não coincidem.' | translate }}</div>
      {% endif %}

      {% embed "snipplets/forms/form.tpl" with{form_id: 'newpass-form', form_custom_class: 'yamuna-login-form', submit_custom_class: 'btn-block yamuna-login-submit', submit_text: (is_account_activation ? 'Ativar conta' : 'Alterar senha') | translate } %}
        {% block form_body %}
          {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_for: 'password', input_name: 'password', input_id: 'password', input_custom_class: 'yamuna-login-input', input_label_text: 'Senha' | translate, input_required: true } %}
          {% endembed %}

          {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_for: 'password_confirm', input_name: 'password_confirm', input_id: 'password_confirm', input_custom_class: 'yamuna-login-input', input_label_text: 'Confirmar senha' | translate, input_required: true } %}
          {% endembed %}
        {% endblock %}
      {% endembed %}

      <p class="yamuna-login-forgot-wrap">
        <a href="{{ store.customer_login_url }}" class="yamuna-login-forgot">Voltar ao login</a>
      </p>
    {% endif %}
  </div>
</section>
