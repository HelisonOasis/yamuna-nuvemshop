{# Out-of-stock notify form — matches yamuna.com.br PDP layout.
   Submits via Nuvemshop contact (/winnie-pooh) and requires reCAPTCHA when enabled. #}
{% set avise_message = 'Quero ser avisado(a) quando o produto "' ~ product.name ~ '" voltar ao estoque. URL: ' ~ product.url %}
{% set avise_needs_captcha = store.hasContactFormsRecaptcha() or recaptchaSiteKey %}

<style>
.yamuna-avise-me {
  display: block;
  width: 100%;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.yamuna-avise-me-title {
  margin: 0;
  padding: 16px 0;
  color: #4a1d3a;
  font-family: Raleway, sans-serif;
  font-size: 20px;
  font-weight: 700;
  line-height: 28px;
}
.yamuna-avise-me-copy {
  display: flex;
  width: 100%;
  margin: 0;
  padding: 0 0 16px;
  color: #000;
  font-family: Raleway, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
}
.yamuna-avise-me-form {
  display: flex !important;
  flex-direction: column !important;
  flex-wrap: nowrap !important;
  align-items: stretch !important;
  gap: 16px;
  width: 100%;
  margin: 0;
  padding: 0;
}
.yamuna-avise-me-captcha {
  display: block;
  width: 100%;
  margin: 0;
  padding: 0;
  overflow: hidden;
}
.yamuna-avise-me-captcha .g-recaptcha,
.yamuna-avise-me-captcha iframe {
  max-width: 100%;
}
.yamuna-avise-me-actions {
  display: flex;
  width: 100%;
  margin: 0;
  padding: 0;
  flex: none;
}
.yamuna-avise-me-input {
  display: flex;
  box-sizing: border-box;
  width: 100%;
  height: 42px;
  margin: 0;
  padding: 8px 12px;
  border: 1px solid #c4bfc7;
  border-radius: 24px;
  background: #fff;
  color: #000;
  font-family: Raleway, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
  outline: none;
  box-shadow: none;
  -webkit-appearance: none;
  appearance: none;
}
.yamuna-avise-me-input:focus {
  border-color: #a31460;
}
.yamuna-avise-me-input::placeholder {
  color: #9ca3af;
  opacity: 1;
}
.yamuna-avise-me-submit {
  display: block;
  box-sizing: border-box;
  width: auto;
  min-width: 0;
  height: 42px;
  min-height: 42px;
  margin: 0;
  padding: 9px 16px;
  border: 0;
  border-radius: 24px;
  background: #e5c3da;
  color: #4a1d3a;
  font-family: Raleway, sans-serif;
  font-size: 16px;
  font-weight: 700;
  letter-spacing: normal;
  line-height: 24px;
  text-transform: uppercase;
  cursor: pointer;
}
.yamuna-avise-me-submit:hover,
.yamuna-avise-me-submit:focus {
  background: #d9aecc;
  color: #4a1d3a;
}
.yamuna-avise-me-submit:disabled {
  opacity: 0.55;
  cursor: not-allowed;
}
.yamuna-avise-me-alert {
  margin: 0 0 16px;
  padding: 12px 14px;
  border-radius: 8px;
  font-family: Raleway, sans-serif;
  font-size: 14px;
  line-height: 1.4;
}
.yamuna-avise-me-alert-success {
  background: #e8f6f1;
  color: #1f6b4a;
}
.yamuna-avise-me-alert-error {
  background: #fdeced;
  color: #9b1c1c;
}
@media (min-width: 1024px) {
  .yamuna-avise-me-submit {
    width: 150px;
  }
}
</style>

<div class="yamuna-avise-me" data-store="product-avise-me-{{ product.id }}">
  <h3 class="yamuna-avise-me-title">{{ 'Produto esgotado' | translate }}</h3>
  <p class="yamuna-avise-me-copy">{{ 'Preencha os campos para ser avisado assim que o produto voltar ao estoque!' | translate }}</p>

  {% if contact and contact.type == 'contact' %}
    {% if contact.success %}
      <div class="yamuna-avise-me-alert yamuna-avise-me-alert-success" role="status">
        {{ 'Aviso criado! Você será avisado quando o produto voltar ao estoque.' | translate }}
      </div>
    {% else %}
      <div class="yamuna-avise-me-alert yamuna-avise-me-alert-error" role="alert">
        {{ 'Precisamos do seu nome e e-mail para avisar você.' | translate }}
      </div>
    {% endif %}
  {% endif %}

  {% if not contact or contact.type != 'contact' or not contact.success %}
    <form
      id="yamuna-avise-me-form"
      class="yamuna-avise-me-form js-winnie-pooh-form"
      method="post"
      action="/winnie-pooh"
      novalidate
    >
      <div class="winnie-pooh" style="display: none;">
        <label for="winnie-pooh-avise-{{ product.id }}">{{ 'No completar este campo' | translate }}</label>
        <input id="winnie-pooh-avise-{{ product.id }}" type="text" name="winnie-pooh" tabindex="-1" autocomplete="off" />
      </div>
      <input type="hidden" name="type" value="contact" />
      <input type="hidden" name="product" value="{{ product.id }}" />
      <input type="hidden" name="message" value="{{ avise_message | escape }}" />

      <input
        class="yamuna-avise-me-input"
        type="text"
        name="name"
        id="yamuna-avise-name-{{ product.id }}"
        placeholder="{{ 'Nome' | translate }}"
        required
        autocomplete="name"
        aria-label="{{ 'Nome' | translate }}"
      />
      <input
        class="yamuna-avise-me-input"
        type="email"
        name="email"
        id="yamuna-avise-email-{{ product.id }}"
        placeholder="{{ 'E-mail' | translate }}"
        required
        autocomplete="email"
        aria-label="{{ 'E-mail' | translate }}"
      />

      {% if avise_needs_captcha %}
        <div class="yamuna-avise-me-captcha" id="yamuna-avise-me-captcha-{{ product.id }}"></div>
      {% endif %}

      <div class="yamuna-avise-me-actions">
        <button
          type="submit"
          name="contact"
          class="yamuna-avise-me-submit{% if avise_needs_captcha %} js-recaptcha-button{% endif %}"
          value="{{ 'Enviar' | translate }}"
          {% if avise_needs_captcha %}disabled{% endif %}
        >
          {{ 'AVISE-ME' | translate }}
        </button>
      </div>
    </form>

    {% if avise_needs_captcha %}
      <script>
        (function () {
          var form = document.getElementById('yamuna-avise-me-form');
          var mount = document.getElementById('yamuna-avise-me-captcha-{{ product.id }}');
          if (!form || !mount) return;

          var siteKey =
            (window.recaptchaV2 && window.recaptchaV2.siteKey) ||
            '{{ recaptchaSiteKey | escape('js') }}';
          if (!siteKey) return;

          window.yamunaAviseRecaptchaCallback = function () {
            var buttons = form.querySelectorAll('.js-recaptcha-button');
            for (var i = 0; i < buttons.length; i++) {
              buttons[i].disabled = false;
            }
          };

          function renderWidget() {
            if (mount.getAttribute('data-rendered') === '1') return;
            if (!window.grecaptcha || typeof window.grecaptcha.render !== 'function') return;
            try {
              window.grecaptcha.render(mount, {
                sitekey: siteKey,
                callback: window.yamunaAviseRecaptchaCallback,
                'expired-callback': function () {
                  var buttons = form.querySelectorAll('.js-recaptcha-button');
                  for (var i = 0; i < buttons.length; i++) {
                    buttons[i].disabled = true;
                  }
                }
              });
              mount.setAttribute('data-rendered', '1');
            } catch (err) {
              /* Widget may already be rendered */
            }
          }

          function ensureScript() {
            if (window.grecaptcha && typeof window.grecaptcha.render === 'function') {
              renderWidget();
              return;
            }
            var existing = document.querySelector('script[src*="google.com/recaptcha/api.js"]');
            if (existing) {
              var tries = 0;
              var timer = setInterval(function () {
                tries += 1;
                if (window.grecaptcha && typeof window.grecaptcha.render === 'function') {
                  clearInterval(timer);
                  renderWidget();
                } else if (tries > 40) {
                  clearInterval(timer);
                }
              }, 250);
              return;
            }
            var script = document.createElement('script');
            script.src = 'https://www.google.com/recaptcha/api.js?onload=yamunaAviseRecaptchaOnload&render=explicit';
            script.async = true;
            script.defer = true;
            window.yamunaAviseRecaptchaOnload = function () {
              renderWidget();
            };
            document.head.appendChild(script);
          }

          if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', ensureScript);
          } else {
            ensureScript();
          }
        })();
      </script>
    {% endif %}
  {% endif %}
</div>
