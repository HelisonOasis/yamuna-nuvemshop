<section class="yamuna-login-page yamuna-signup-page" data-store="account-register-page">
  <h1 class="yamuna-login-heading">Crie sua conta</h1>

  <div class="yamuna-login-card yamuna-signup-card">
    {{ component('nubesdk-slot', { type: "before_register_form" }) }}

    {% if account_validation == 'pending' %}
      <div class="js-account-validation-pending alert alert-primary p-3 mb-3">
        <h5 class="my-2">{{ "Você está a um passo de criar sua conta!" | translate }}</h5>
        <p class="mb-0 font-small">{{ "Enviamos um link para <strong>{1}</strong> para validar seu e-mail." | t(customer_email) }}</p>
      </div>
      <div class="text-center mb-3 font-small">
        <p>{{ "Ainda não recebeu?" | translate }} <span class="js-resend-validation-link btn-link btn-link-primary">{{ "Enviar link de novo" | translate }}</span></p>
      </div>
      <div class="js-resend-validation-success alert alert-success" style="display:none">
        <p class="m-1">{{ "O link foi enviado corretamente!" | translate }}</p>
      </div>
      <div class="js-resend-validation-error alert alert-danger" style="display:none">
        <p class="m-1">{{ "Não foi possível enviar o e-mail. Tente de novo em alguns minutos." | translate }}</p>
      </div>
      <p class="yamuna-login-forgot-wrap">
        <a href="{{ store.customer_login_url }}" class="yamuna-login-forgot">Voltar ao login</a>
      </p>
    {% else %}
      <p class="yamuna-login-intro yamuna-signup-subtitle">Faça seu cadastro para continuar</p>

      <div class="yamuna-signup-type" role="radiogroup" aria-label="Tipo de cadastro">
        <label class="yamuna-signup-type-option">
          <input type="radio" name="yamuna_customer_type" value="person" class="js-yamuna-signup-type" checked>
          <span>Pessoa Física</span>
        </label>
        <label class="yamuna-signup-type-option">
          <input type="radio" name="yamuna_customer_type" value="company" class="js-yamuna-signup-type">
          <span>Pessoa Jurídica</span>
        </label>
      </div>

      <div class="yamuna-signup-pj js-yamuna-signup-pj" hidden>
        <h2 class="yamuna-signup-pj-title">Cadastro para Pessoa Jurídica</h2>
        <p class="yamuna-signup-pj-text">Para seguir com o atendimento como Pessoa Jurídica, fale com nossa equipe pelo Whatsapp</p>
        <a class="yamuna-signup-pj-whatsapp" href="https://api.whatsapp.com/send?phone=554884591522" target="_blank" rel="noopener">Falar no WhatsApp</a>
        <button type="button" class="yamuna-signup-pj-back js-yamuna-signup-pj-back">Voltar</button>
      </div>

      <div class="js-yamuna-signup-pf">
        {% embed "snipplets/forms/form.tpl" with{form_id: 'login-form', form_custom_class: 'yamuna-login-form yamuna-signup-form', submit_custom_class: 'js-recaptcha-button btn-block yamuna-login-submit', submit_prop: 'disabled', submit_text: 'Cadastrar' | translate, data_store: 'account-register' } %}
          {% block form_body %}
            {{ component('nubesdk-slot', { type: "before_register_form_fields" }) }}

            {% embed "snipplets/forms/form-input.tpl" with{type_text: true, input_for: 'name', input_value: result.name, input_name: 'name', input_id: 'name', input_custom_class: 'yamuna-login-input', input_label_text: 'Nome completo*' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell yamuna-signup-cell-first' } %}
              {% block input_form_alert %}
                {% if result.errors.name %}
                  <div class="notification-danger notification-left">{{ 'Usamos seu nome para identificar seus pedidos.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            {% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_for: 'email', input_value: result.email, input_name: 'email', input_id: 'email', input_custom_class: 'yamuna-login-input', input_label_text: 'Email*' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell' } %}
              {% block input_form_alert %}
                {% if result.errors.email == 'exists' %}
                  <div class="notification-danger notification-left">{{ 'Já existe uma conta com este e-mail. Tente outro ou entre na sua conta.' | translate }}</div>
                {% elseif result.errors.email %}
                  <div class="notification-danger notification-left">{{ 'Precisamos de um e-mail válido para criar sua conta.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            <div class="form-group yamuna-signup-cell">
              <label class="form-label" for="yamuna-gender">Gênero: *</label>
              <select id="yamuna-gender" class="form-control yamuna-login-input" required>
                <option value="">Selecione...</option>
                <option value="MALE">Masculino</option>
                <option value="FEMALE">Feminino</option>
                <option value="OTHER">Outro</option>
              </select>
            </div>

            <div class="form-group yamuna-signup-cell">
              <label class="form-label" for="yamuna-cpf">CPF*</label>
              <input type="text" id="yamuna-cpf" class="form-control yamuna-login-input js-yamuna-cpf" inputmode="numeric" maxlength="14" autocomplete="off" required>
            </div>

            {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_for: 'password', input_name: 'password', input_id: 'password', input_custom_class: 'yamuna-login-input', input_label_text: 'Criar senha: *' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell' } %}
              {% block input_form_alert %}
                {% if result.errors.password == 'required' %}
                  <div class="notification-danger notification-left">{{ 'Precisamos de uma senha para cadastrar você.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_for: 'password_confirmation', input_name: 'password_confirmation', input_id: 'password_confirmation', input_custom_class: 'yamuna-login-input', input_label_text: 'Confirma senha' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell' } %}
              {% block input_form_alert %}
                {% if result.errors.password == 'confirmation' %}
                  <div class="notification-danger notification-left">{{ 'As senhas não coincidem.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            <div class="form-group yamuna-signup-cell">
              <label class="form-label" for="yamuna-birthdate">Data de nascimento</label>
              <input type="text" id="yamuna-birthdate" class="form-control yamuna-login-input js-yamuna-birthdate" placeholder="dd/mm/aaaa" inputmode="numeric" maxlength="10" autocomplete="bday" required>
            </div>

            {% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_for: 'phone', input_value: result.phone, input_name: 'phone', input_id: 'phone', input_custom_class: 'yamuna-login-input js-yamuna-phone', input_label_text: 'Telefone Principal' | translate, input_placeholder: '(00) 00000-0000' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell' } %}
            {% endembed %}

            {{ component('nubesdk-slot', { type: "after_register_form_fields" }) }}

            <label class="yamuna-signup-newsletter">
              <input type="checkbox">
              <span>Recebimento de Newsletter</span>
            </label>

            <div class="g-recaptcha yamuna-login-recaptcha yamuna-signup-recaptcha" data-sitekey="{{ recaptchaSiteKey }}" data-callback="recaptchaCallback"></div>
          {% endblock %}
        {% endembed %}
      </div>
    {% endif %}

    {{ component('nubesdk-slot', { type: "after_register_form" }) }}
  </div>
</section>
