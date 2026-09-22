<section class="yamuna-login-page" data-store="account-login-page">
  <h1 class="yamuna-login-heading">Entrar na sua conta</h1>

  <div class="yamuna-login-card">
    <p class="yamuna-login-intro">Informe seu e-mail para prosseguir:</p>

    {# Account validation feedback stays within the login card. #}
    {% if account_validation == 'success' %}
      {% set success_message = 'our_components.forms.login.account_validation.' ~ (customer_has_price_table ? 'success_with_price_table' : 'success') %}
      <div class="js-account-validation-success alert alert-success"><p class="mt-2">{{ success_message | tt }}</p></div>
    {% elseif account_validation == 'expired' %}
      <div class="js-account-validation-expired alert alert-danger mb-2"><p class="my-2">{{ "Tu link de validación expiró." | translate }}</p></div>
      <div class="text-center mb-4 font-small"><span class="js-resend-validation-link btn-link btn-link-primary">{{ "Enviar link de nuevo >" | translate }}</span></div>
    {% elseif account_validation == 'pending' %}
      <div class="js-account-validation-pending alert alert-danger mb-2"><p class="my-2">{{ "Validá tu email usando el link que te enviamos a <strong>{1}</strong> cuando creaste tu cuenta." | t(customer_email) }}</p></div>
      <div class="text-center mb-4 font-small"><p>{{ "¿No lo encontraste?" | translate }} <span class="js-resend-validation-link btn-link btn-link-primary">{{ "Enviar link de nuevo" | translate }}</span></p></div>
    {% endif %}
    <div class="js-resend-validation-success alert alert-success" style="display:none"><p class="m-1">{{ "¡El link fue enviado correctamente!" | translate }}</p></div>
    <div class="js-resend-validation-error alert alert-danger" style="display:none"><p class="m-1">{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p></div>
    <div class="js-too-many-attempts alert alert-danger" style="display:none"><p class="m-1">{{ 'Superaste la cantidad de intentos permitidos. <br> Volvé a probar en' | translate }} <span class="js-too-many-attempts-countdown"></span></p></div>

    {% embed "snipplets/forms/form.tpl" with{form_id: 'login-form', form_custom_class: 'yamuna-login-form', submit_custom_class: 'btn-block yamuna-login-submit', submit_text: 'Entrar' | translate, data_store: 'account-login' } %}
      {% block form_body %}
        {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', input_id: 'email', type_email: true, input_value: result.email, input_name: 'email', input_custom_class: 'js-account-input yamuna-login-input', input_label_text: 'E-mail' | translate, input_required: true } %}
        {% endembed %}

        {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', input_id: 'password', type_password: true, input_name: 'password', input_custom_class: 'js-account-input yamuna-login-input', input_label_text: 'Senha' | translate, input_required: true } %}
        {% endembed %}

        {% if result.invalid %}
          <div class="notification-centered notification-danger">{{ 'Estes dados não estão corretos. Verifique se foram preenchidos corretamente.' | translate }}</div>
        {% endif %}
      {% endblock %}
    {% endembed %}

    <p class="yamuna-login-forgot-wrap">
      <a href="{{ store.customer_reset_password_url }}" class="yamuna-login-forgot">Esqueci minha senha</a>
    </p>

    <div class="yamuna-login-options">
      <a href="{{ store.customer_reset_password_url }}" class="yamuna-login-option">Entrar com pergunta</a>
      <a href="{{ store.customer_reset_password_url }}" class="yamuna-login-option">Entrar com código</a>
    </div>

    {% if 'mandatory' not in store.customer_accounts %}
      <p class="yamuna-login-register">
        Ainda não tem conta?
        <a href="{{ store.customer_register_url }}" class="yamuna-login-register-link">Cadastre-se</a>
      </p>
    {% endif %}
  </div>
</section>
