<section class="yamuna-login-page yamuna-signup-page" data-store="account-register-page">
  <style id="yamuna-signup-two-col">
    /* Cenario 130: 2 colunas como prod
       Esq: Email, CPF, Nome, Nascimento | Dir: Gênero, Senha, Confirma, Telefone
       Slots NubeSDK vazios nao podem ocupar celulas do grid. */
    .yamuna-signup-page {
      display: flex !important;
      flex-direction: column !important;
      align-items: center !important;
      box-sizing: border-box !important;
      width: min(900px, 100%) !important;
      max-width: 900px !important;
      margin: 0 auto !important;
      padding: 0 16px !important;
    }
    .yamuna-signup-page > .yamuna-login-heading {
      width: 100% !important;
      max-width: 900px !important;
      margin-left: auto !important;
      margin-right: auto !important;
      text-align: center !important;
    }
    .yamuna-signup-page .yamuna-signup-card {
      max-width: 900px !important;
      width: 100% !important;
      margin-left: auto !important;
      margin-right: auto !important;
    }
    .yamuna-signup-page .yamuna-signup-type {
      margin-bottom: 20px !important;
    }
    form.yamuna-login-form.yamuna-signup-form,
    .yamuna-signup-page form.yamuna-signup-form,
    .yamuna-signup-page #login-form {
      display: grid !important;
      direction: ltr !important;
      grid-auto-flow: row !important;
      grid-template-columns: minmax(0, 1fr) minmax(0, 1fr) !important;
      grid-template-areas: "email gender" "cpf password" "name confirm" "birth phone" "captcha captcha" "news submit" !important;
      gap: 16px 28px !important;
      width: 100% !important;
      max-width: none !important;
      flex-direction: unset !important;
    }
    /* Empty SDK slots were taking the first grid cell and shifting all fields. */
    .yamuna-signup-page .yamuna-signup-form > .js-nubesdk-slot {
      display: contents !important;
    }
    .yamuna-signup-page .yamuna-signup-form .form-group,
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell {
      width: 100% !important;
      max-width: none !important;
      margin: 0 !important;
      float: none !important;
      direction: ltr !important;
    }
    .yamuna-signup-page .yamuna-signup-cell--email,
    .yamuna-signup-page #email { grid-area: email !important; }
    .yamuna-signup-page .yamuna-signup-cell--gender,
    .yamuna-signup-page #yamuna-gender { grid-area: gender !important; }
    .yamuna-signup-page .yamuna-signup-cell--cpf,
    .yamuna-signup-page #yamuna-cpf { grid-area: cpf !important; }
    .yamuna-signup-page .yamuna-signup-cell--password,
    .yamuna-signup-page #password { grid-area: password !important; }
    .yamuna-signup-page .yamuna-signup-cell--name,
    .yamuna-signup-page #name { grid-area: name !important; }
    .yamuna-signup-page .yamuna-signup-cell--confirm,
    .yamuna-signup-page #password_confirmation { grid-area: confirm !important; }
    .yamuna-signup-page .yamuna-signup-cell--birth,
    .yamuna-signup-page #yamuna-birthdate { grid-area: birth !important; }
    .yamuna-signup-page .yamuna-signup-cell--phone,
    .yamuna-signup-page #phone { grid-area: phone !important; }
    /* Place the form-group wrapper, not only the input (inputs are nested). */
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#email),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#email) { grid-area: email !important; }
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#yamuna-gender),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#yamuna-gender) { grid-area: gender !important; }
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#yamuna-cpf),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#yamuna-cpf) { grid-area: cpf !important; }
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#password),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#password) { grid-area: password !important; }
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#name),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#name) { grid-area: name !important; }
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#password_confirmation),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#password_confirmation) { grid-area: confirm !important; }
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#yamuna-birthdate),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#yamuna-birthdate) { grid-area: birth !important; }
    .yamuna-signup-page .yamuna-signup-form .form-group:has(#phone),
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell:has(#phone) { grid-area: phone !important; }
    .yamuna-signup-page .yamuna-signup-form .g-recaptcha,
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-recaptcha {
      grid-area: captcha !important;
      justify-content: flex-start;
    }
    .yamuna-signup-page .yamuna-signup-newsletter {
      grid-area: news !important;
      align-self: center;
    }
    .yamuna-signup-page .yamuna-signup-form .yamuna-login-submit,
    .yamuna-signup-page .yamuna-signup-form .btn.btn-primary.yamuna-login-submit {
      grid-area: submit !important;
      justify-self: stretch !important;
      width: 100% !important;
      max-width: none !important;
      margin: 0 !important;
    }
    .yamuna-signup-page .yamuna-signup-form .clear-both {
      display: none !important;
    }
    /* Floating labels sit inside the field and rise when it is focused or filled. */
    .yamuna-signup-page .yamuna-signup-form .form-group {
      position: relative !important;
    }
    .yamuna-signup-page .yamuna-signup-form .form-label {
      position: absolute !important;
      left: 14px !important;
      top: 50% !important;
      z-index: 2 !important;
      max-width: calc(100% - 36px) !important;
      margin: 0 !important;
      padding: 0 !important;
      overflow: hidden !important;
      color: #4a1d3a !important;
      background: transparent !important;
      font-size: 14px !important;
      font-weight: 400 !important;
      line-height: 1 !important;
      white-space: nowrap !important;
      text-overflow: ellipsis !important;
      pointer-events: none !important;
      transform: translateY(-50%) !important;
      transition: top .15s ease, transform .15s ease, font-size .15s ease !important;
    }
    .yamuna-signup-page .yamuna-signup-form .form-group:focus-within .form-label,
    .yamuna-signup-page .yamuna-signup-form .form-group.is-filled .form-label,
    .yamuna-signup-page .yamuna-signup-form .form-group:has(input:-webkit-autofill) .form-label {
      top: 8px !important;
      font-size: 11px !important;
      transform: none !important;
    }
    .yamuna-signup-page .yamuna-signup-form .form-control {
      height: 52px !important;
      padding: 20px 14px 6px !important;
      line-height: 1.2 !important;
    }
    .yamuna-signup-page .yamuna-signup-form .js-password-input {
      padding-right: 44px !important;
    }
    .yamuna-signup-page .yamuna-signup-form .form-control::placeholder {
      color: transparent !important;
    }
    .yamuna-signup-page .yamuna-signup-form .form-group:focus-within .form-control::placeholder {
      color: #8d8490 !important;
    }
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell--gender select {
      color: transparent !important;
    }
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell--gender:focus-within select,
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell--gender.is-filled select {
      color: #4a1d3a !important;
    }
    .yamuna-signup-page .yamuna-signup-form .yamuna-signup-cell--gender select option {
      color: #4a1d3a !important;
    }
    .yamuna-signup-page .yamuna-signup-form .form-toggle-eye,
    .yamuna-signup-page .yamuna-login-form .form-toggle-eye {
      top: 50% !important;
      bottom: auto !important;
      right: 8px !important;
      width: 28px !important;
      height: 28px !important;
      padding: 4px !important;
      margin: 0 !important;
      display: inline-flex !important;
      align-items: center !important;
      justify-content: center !important;
      line-height: 0 !important;
      transform: translateY(-50%) !important;
    }
    @media (max-width: 767px) {
      form.yamuna-login-form.yamuna-signup-form,
      .yamuna-signup-page form.yamuna-signup-form,
      .yamuna-signup-page #login-form {
        grid-template-columns: 1fr !important;
        /* Cenário 151: senha + confirma ao final (antes de captcha) */
        grid-template-areas: "email" "gender" "cpf" "name" "birth" "phone" "password" "confirm" "captcha" "news" "submit" !important;
      }
      .yamuna-signup-page .yamuna-signup-form .yamuna-login-submit,
      .yamuna-signup-page .yamuna-signup-form .btn.btn-primary.yamuna-login-submit {
        max-width: 280px !important;
        margin-left: auto !important;
        margin-right: auto !important;
        justify-self: center !important;
      }
    }
  </style>
  <h1 class="yamuna-login-heading">Crie sua conta</h1>

  <div class="yamuna-login-card yamuna-signup-card">
    {{ component('nubesdk-slot', { type: "before_register_form" }) }}

    {% if account_validation == 'pending' %}
      <style>
        .yamuna-account-validation-pending {
          color: #4a1d3a !important;
          border-color: #c0bbc3 !important;
          background: #fff !important;
        }
        .yamuna-account-validation-title {
          color: #4a1d3a !important;
          font-family: Raleway, Roboto, Arial, sans-serif !important;
          font-weight: 700 !important;
        }
        .yamuna-account-validation-text,
        .yamuna-account-validation-lead,
        .yamuna-account-validation-email {
          color: #4a1d3a !important;
          font-family: Raleway, Roboto, Arial, sans-serif !important;
          font-size: 14px !important;
          line-height: 1.45 !important;
        }
        .yamuna-account-validation-tail {
          color: #a31460 !important;
          font-family: Raleway, Roboto, Arial, sans-serif !important;
          font-size: 14px !important;
          line-height: 1.45 !important;
        }
        .yamuna-account-validation-resend,
        .yamuna-account-validation-resend p,
        .yamuna-account-validation-resend .js-resend-validation-link,
        .yamuna-account-validation-resend .btn-link {
          color: #a31460 !important;
          font-family: Raleway, Roboto, Arial, sans-serif !important;
          font-size: 14px !important;
          line-height: 1.45 !important;
        }
        .yamuna-account-validation-resend .js-resend-validation-link {
          font-weight: 700 !important;
          text-decoration: none !important;
        }
      </style>
      <div class="js-account-validation-pending yamuna-account-validation-pending alert alert-primary p-3 mb-3">
        <h5 class="yamuna-account-validation-title my-2">{{ "Você está a um passo de criar sua conta!" | translate }}</h5>
        <p class="yamuna-account-validation-text mb-0">
          <span class="yamuna-account-validation-lead">{{ "Enviamos um link para" | translate }}</span>
          <strong class="yamuna-account-validation-email">{{ customer_email }}</strong>
          <span class="yamuna-account-validation-tail">{{ "para validar seu e-mail." | translate }}</span>
        </p>
      </div>
      <div class="yamuna-account-validation-resend text-center mb-3">
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

            {# Prod: Email|Gênero, CPF|Senha, Nome|Confirma, Nascimento|Telefone #}
            {% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_for: 'email', input_value: result.email, input_name: 'email', input_id: 'email', input_custom_class: 'yamuna-login-input', input_label_text: 'Email*' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell yamuna-signup-cell--email' } %}
              {% block input_form_alert %}
                {% if result.errors.email == 'exists' %}
                  <div class="notification-danger notification-left">{{ 'Já existe uma conta com este e-mail. Tente outro ou entre na sua conta.' | translate }}</div>
                {% elseif result.errors.email %}
                  <div class="notification-danger notification-left">{{ 'Precisamos de um e-mail válido para criar sua conta.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            <div class="form-group yamuna-signup-cell yamuna-signup-cell--gender">
              <label class="form-label" for="yamuna-gender">Gênero: *</label>
              <select id="yamuna-gender" class="form-control yamuna-login-input" required>
                <option value="">Selecione...</option>
                <option value="MALE">Masculino</option>
                <option value="FEMALE">Feminino</option>
                <option value="OTHER">Outro</option>
              </select>
            </div>

            <div class="form-group yamuna-signup-cell yamuna-signup-cell--cpf">
              <label class="form-label" for="yamuna-cpf">CPF*</label>
              <input type="text" id="yamuna-cpf" class="form-control yamuna-login-input js-yamuna-cpf" inputmode="numeric" maxlength="14" autocomplete="off" required>
            </div>

            {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_for: 'password', input_name: 'password', input_id: 'password', input_custom_class: 'yamuna-login-input', input_label_text: 'Criar senha: *' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell yamuna-signup-cell--password' } %}
              {% block input_form_alert %}
                {% if result.errors.password == 'required' %}
                  <div class="notification-danger notification-left">{{ 'Precisamos de uma senha para cadastrar você.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            {% embed "snipplets/forms/form-input.tpl" with{type_text: true, input_for: 'name', input_value: result.name, input_name: 'name', input_id: 'name', input_custom_class: 'yamuna-login-input', input_label_text: 'Nome completo*' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell yamuna-signup-cell--name' } %}
              {% block input_form_alert %}
                {% if result.errors.name %}
                  <div class="notification-danger notification-left">{{ 'Usamos seu nome para identificar seus pedidos.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            {% embed "snipplets/forms/form-input.tpl" with{type_password: true, input_for: 'password_confirmation', input_name: 'password_confirmation', input_id: 'password_confirmation', input_custom_class: 'yamuna-login-input', input_label_text: 'Confirma senha' | translate, input_required: true, input_group_custom_class: 'yamuna-signup-cell yamuna-signup-cell--confirm' } %}
              {% block input_form_alert %}
                {% if result.errors.password == 'confirmation' %}
                  <div class="notification-danger notification-left">{{ 'As senhas não coincidem.' | translate }}</div>
                {% endif %}
              {% endblock input_form_alert %}
            {% endembed %}

            <div class="form-group yamuna-signup-cell yamuna-signup-cell--birth">
              <label class="form-label" for="yamuna-birthdate">Data de nascimento*</label>
              <input type="text" id="yamuna-birthdate" class="form-control yamuna-login-input js-yamuna-birthdate" placeholder="dd/mm/aaaa" inputmode="numeric" maxlength="10" autocomplete="bday" pattern="\d{2}/\d{2}/\d{4}" required>
            </div>

            {% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_for: 'phone', input_value: result.phone, input_name: 'phone', input_id: 'phone', input_custom_class: 'yamuna-login-input js-yamuna-phone', input_label_text: 'Telefone Principal*' | translate, input_placeholder: '(00) 00000-0000' | translate, input_pattern: '\\(\\d{2}\\) \\d{4,5}-\\d{4}', input_required: true, input_group_custom_class: 'yamuna-signup-cell yamuna-signup-cell--phone' } %}
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
<script>
(function () {
  var groups = document.querySelectorAll('.yamuna-signup-form .form-group');
  function sync(group) {
    var field = group.querySelector('input, select, textarea');
    if (!field) { return; }
    group.classList.toggle('is-filled', !!(field.value && String(field.value).trim()));
  }
  groups.forEach(function (group) {
    var field = group.querySelector('input, select, textarea');
    if (!field) { return; }
    sync(group);
    field.addEventListener('input', function () { sync(group); });
    field.addEventListener('change', function () { sync(group); });
  });
  window.setTimeout(function () { groups.forEach(sync); }, 400);
})();
</script>
