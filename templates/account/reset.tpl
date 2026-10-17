<section class="yamuna-login-page" data-store="account-reset-page">
  <h1 class="yamuna-login-heading">Mudar a senha</h1>

  <div class="yamuna-login-card">
    <p class="yamuna-login-intro">Nosso site mudou para melhor. Se voc&ecirc; comprou em nosso site antes de 23/09/26, <a href="{{ store.customer_register_url }}" class="yamuna-login-register-link">clique aqui</a>, registre-se novamente e crie sua nova senha.</p>

    {% if success %}
      <div class="alert alert-success">{{ 'Pronto! Enviamos um e-mail para {1}' | translate(email) }}</div>
    {% endif %}

    {% embed "snipplets/forms/form.tpl" with{form_id: 'resetpass-form', form_custom_class: 'yamuna-login-form', submit_custom_class: 'js-recaptcha-button btn-block yamuna-login-submit', submit_text: 'Enviar e-mail' | translate } %}
      {% block form_body %}
        {% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_for: 'email', input_value: email, input_name: 'email', input_id: 'email', input_custom_class: 'yamuna-login-input', input_label_text: 'E-mail' | translate, input_required: true } %}
          {% block input_form_alert %}
            {% if failure %}
              <div class="notification-centered notification-danger">{{ 'Não encontramos nenhuma conta registrada com este e-mail. Confira se está escrito corretamente.' | translate }}</div>
            {% endif %}
          {% endblock input_form_alert %}
        {% endembed %}
      {% endblock %}
    {% endembed %}

    <p class="yamuna-login-forgot-wrap">
      <a href="{{ store.customer_login_url }}" class="yamuna-login-forgot">Voltar ao login</a>
    </p>
  </div>
</section>
