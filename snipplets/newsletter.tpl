{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

<section data-store="home-newsletter">
    <style>
        [data-store="home-newsletter"] .newsletter-copy h3,
        [data-store="home-newsletter"] .js-home-newsletter-heading {
            margin: 0 0 4px !important;
            color: #fff !important;
            font-family: 'Raleway', sans-serif !important;
            font-size: 32px !important;
            font-weight: 700 !important;
            line-height: 1.2 !important;
            text-transform: uppercase !important;
        }

        [data-store="home-newsletter"] .newsletter-copy h2,
        [data-store="home-newsletter"] .js-home-newsletter-title,
        [data-store="home-newsletter"] .js-home-newstetter-title {
            margin: 0 !important;
            color: #fff !important;
            font-family: 'Raleway', sans-serif !important;
            font-size: 24px !important;
            font-weight: 500 !important;
            line-height: 1.3 !important;
        }

        [data-store="home-newsletter"] .newsletter-consent,
        [data-store="home-newsletter"] .newsletter-consent span {
            color: #f6f5f6 !important;
            font-family: 'Raleway', sans-serif !important;
            font-size: 16px !important;
            font-weight: 400 !important;
            line-height: 1.5 !important;
        }

        @media (min-width: 1024px) {
            [data-store="home-newsletter"] .newsletter-field input {
                height: 42px !important;
            }

            [data-store="home-newsletter"] .newsletter-consent {
                min-height: 42px !important;
            }

            [data-store="home-newsletter"] .newsletter-consent input {
                width: 14px !important;
                height: 14px !important;
                min-width: 14px !important;
                min-height: 14px !important;
                flex: 0 0 14px !important;
                box-sizing: border-box !important;
            }

            [data-store="home-newsletter"] .newsletter-btn {
                height: 42px !important;
                line-height: 42px !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-optin {
                width: 100% !important;
                max-width: none !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-header,
            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-title,
            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-text,
            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-footer,
            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-perfit-ad {
                display: none !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-body {
                display: flex !important;
                align-items: flex-end !important;
                gap: 12px !important;
                padding: 0 !important;
                background: transparent !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-field {
                flex: 1 1 0 !important;
                margin: 0 !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-field label {
                display: block !important;
                margin: 0 0 5px !important;
                color: #fff !important;
                font-size: 12px !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-field input {
                width: 100% !important;
                height: 42px !important;
                padding: 8px 12px !important;
                border: 1px solid rgba(255, 255, 255, .72) !important;
                border-radius: 24px !important;
                background: transparent !important;
                color: #fff !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-field input::placeholder {
                color: rgba(255, 255, 255, .72) !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-submit {
                height: 42px !important;
                min-width: 102px !important;
                margin: 0 !important;
                border: 0 !important;
                border-radius: 24px !important;
                background: #fff !important;
                color: #8d0751 !important;
                font-weight: 700 !important;
            }
        }

        @media (max-width: 1023px) {
            [data-store="home-newsletter"] .section-newsletter-home {
                padding: 64px 20px !important;
            }

            [data-store="home-newsletter"] .newsletter,
            [data-store="home-newsletter"] .newsletter-form {
                display: block !important;
            }

            [data-store="home-newsletter"] .newsletter {
                min-height: 0 !important;
                padding: 0 !important;
            }

            [data-store="home-newsletter"] .newsletter-copy {
                text-align: center !important;
            }

            [data-store="home-newsletter"] .newsletter-copy h2,
            [data-store="home-newsletter"] .js-home-newsletter-title,
            [data-store="home-newsletter"] .js-home-newstetter-title {
                font-family: 'Raleway', sans-serif !important;
                font-size: 14px !important;
                font-style: normal !important;
                font-weight: 500 !important;
                line-height: 130% !important;
            }

            [data-store="home-newsletter"] .newsletter-copy h3,
            [data-store="home-newsletter"] .js-home-newsletter-heading {
                font-family: 'Raleway', sans-serif !important;
                font-size: 20px !important;
                font-weight: 700 !important;
                line-height: 1.3 !important;
            }

            [data-store="home-newsletter"] .newsletter-consent,
            [data-store="home-newsletter"] .newsletter-consent span {
                font-family: 'Raleway', sans-serif !important;
                font-size: 16px !important;
                font-weight: 400 !important;
                line-height: 1.5 !important;
            }

            [data-store="home-newsletter"] .newsletter-consent {
                align-items: flex-start !important;
            }

            [data-store="home-newsletter"] .newsletter-consent input {
                margin-top: 2px !important;
                width: 14px !important;
                height: 14px !important;
                min-width: 14px !important;
                min-height: 14px !important;
                flex: 0 0 14px !important;
            }

            [data-store="home-newsletter"] .newsletter-copy {
                margin-bottom: 20px !important;
            }

            [data-store="home-newsletter"] .newsletter-fields {
                display: grid !important;
                grid-template-columns: 1fr !important;
                row-gap: 16px !important;
            }

            [data-store="home-newsletter"] .newsletter-field:nth-child(2) {
                display: block !important;
                order: 3;
            }

            [data-store="home-newsletter"] .newsletter-field:nth-child(3) {
                order: 2;
            }

            [data-store="home-newsletter"] .newsletter-field input {
                height: 42px !important;
                padding: 8px 12px !important;
                border-radius: 24px !important;
            }

            [data-store="home-newsletter"] .newsletter-field label {
                top: -6px !important;
                padding: 0 8px !important;
                font-family: 'Raleway', sans-serif !important;
                font-size: 14px !important;
                font-weight: 600 !important;
            }

            [data-store="home-newsletter"] .newsletter-consent {
                order: 4;
                min-height: 40px !important;
                margin: 0 !important;
                font-size: 16px !important;
                line-height: 1.5 !important;
            }

            [data-store="home-newsletter"] .newsletter-btn {
                height: 42px !important;
                margin-top: 16px !important;
                border-radius: 24px !important;
                font-family: 'Raleway', sans-serif !important;
                font-size: 14px !important;
                font-weight: 700 !important;
                line-height: 42px !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-body {
                display: block !important;
            }

            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-field,
            [data-store="home-newsletter"] #optin-KNcmLsC8 .p-submit {
                width: 100% !important;
                margin: 0 0 16px !important;
            }
        }
    </style>

    {{ component('nubesdk-slot', { type: 'before_section_newsletter' }) }}
    <div class="section-newsletter-home bg-primary js-home-newsletter" {% if not settings.news_show %}style="display: none"{% endif %}>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div id="home-newsletter-form-container" class="js-newsletter newsletter">
                        <div class="newsletter-copy">
                            <h3 class="js-home-newsletter-heading">{{ 'Newsletter' | translate }}</h3>
                            <h2 class="js-home-newsletter-title js-home-newstetter-title">{{ settings.news_title }}</h2>
                        </div>

                        {% if contact and contact.type == 'newsletter' %}
                            {% if contact.success %}
                                <div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
                            {% else %}
                                <div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
                            {% endif %}
                        {% endif %}

                        <form id="home-newsletter-form" class="newsletter-form" method="post" action="/winnie-pooh">
                            <div class="newsletter-fields">
                                <div class="newsletter-field">
                                    <input id="newsletter-name" type="text" name="name" required aria-label="{{ 'Nome' | translate }}" />
                                    <label for="newsletter-name">{{ 'Nome' | translate }}</label>
                                </div>
                                <div class="newsletter-field">
                                    <input id="newsletter-phone" type="tel" name="phone" inputmode="numeric" autocomplete="tel-national" maxlength="15" aria-label="WhatsApp" />
                                    <label for="newsletter-phone">WhatsApp</label>
                                </div>
                                <div class="newsletter-field">
                                    <input id="newsletter-email" type="email" name="email" required aria-label="{{ 'Email' | translate }}" />
                                    <label for="newsletter-email">{{ 'Email' | translate }}</label>
                                </div>
                                <label class="newsletter-consent" for="newsletter-consent">
                                    <input id="newsletter-consent" type="checkbox" required />
                                    <span>{{ 'Aceito receber o conteúdo nos dados cadastrados acima' | translate }}</span>
                                </label>
                            </div>
                            <input type="hidden" name="message" value="{{ 'Pedido de inscrição a newsletter' | translate }}" />
                            <input type="hidden" name="type" value="newsletter" />
                            <button type="submit" name="contact" class="btn newsletter-btn">{{ 'Enviar' | translate }}</button>
                        </form>
                        <script>
                            (function () {
                                var form = document.getElementById('home-newsletter-form');
                                if (!form) return;

                                form.addEventListener('submit', function (event) {
                                    event.preventDefault();
                                    event.stopImmediatePropagation();

                                    if (window.submitYamunaNewsletter) {
                                        window.submitYamunaNewsletter(form);
                                    }
                                }, true);
                            })();
                        </script>
                        <div id="home-newsletter-feedback" class="newsletter-feedback" role="status" aria-live="polite" hidden>
                            <span class="newsletter-feedback-icon" aria-hidden="true">✓</span>
                            <span class="newsletter-feedback-message"></span>
                            <button type="button" class="newsletter-feedback-close" aria-label="{{ 'Fechar' | translate }}">×</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{ component('nubesdk-slot', { type: 'after_section_newsletter' }) }}

</section>
