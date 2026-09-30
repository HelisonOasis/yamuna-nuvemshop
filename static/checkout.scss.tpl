{% if store.allows_checkout_styling %}

@import url("https://fonts.googleapis.com/css2?family=Dosis:wght@400;500;600;700&family=Raleway:wght@400;500;600;700&family=Roboto:wght@400;500;600;700&display=swap");
@import url("https://d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static/css/yamuna-checkout-fix.css?v=140");

{#/*============================================================================
checkout.scss.tpl

    -This file contains all the theme styles related to the checkout based on settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/style-colors.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style-async.scss.tpl --> For non critical styles witch will be loaded asynchronously
        -static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{#/*============================================================================
  Global
==============================================================================*/#}

{# /* // Colors */ #}

$accent-brand-color: #000000;
$foreground-color: {{ settings.text_color | default('rgb(102, 102, 102)' | raw ) }};
$background-color: #f6f6f6;

{# /* // Font - Yamuna site stack */ #}

$heading-font: Raleway, sans-serif;
$body-font: Dosis, sans-serif;

{# /* // Box */ #}
$box-border-color: rgba($foreground-color, .3);

$box-radius: 10px;
$box-background: lighten($background-color, 10%);
$box-shadow: none;
$form-control-radius: 6px;

{# /* // Functions */ #}

@function set-background-color($background-color) {
  @if lightness($background-color) > 95% {
    @return lighten($background-color, 10%);
  } @else {
    @return desaturate(lighten($background-color, 7%), 5%);
  }
}

@function set-input-color($background-color, $foreground-color) {
  @if lightness($background-color) > 70% {
    @return desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    @return desaturate(lighten($background-color, 5%), 80%);
  }
}

{# /* // Mixins */ #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

{#/*============================================================================
  React
==============================================================================*/#}

{# /* // Box */ #}

$box-background: lighten($background-color, 10%);
$box-text-shadow: null;
@if lightness($foreground-color) > 95% {
  $box-text-shadow: 0 2px 1px rgba(darken($foreground-color, 80%), 0.1);
} @else {
  $box-text-shadow: 0 2px 1px rgba(lighten($foreground-color, 80%), 0.1);
}

$base-red: #c13a3a;

$xs: 0;
$sm: 576px;
$md: 768px;
$lg: 992px;
$xl: 1200px;

{#/*============================================================================
  # Checkout tokens
==============================================================================*/#}
:root {

  {#### Color tokens #}

  {% set accent_color = '#a31460' %}
  {% set main_foreground = settings.text_color %}
  {% set main_background = settings.background_color %}

  {# Auxiliar opacity hex levels #}
  {% set opacity_05 = '0D' %}
  {% set opacity_10 = '1A' %}
  {% set opacity_20 = '33' %}
  {% set opacity_30 = '4D' %}
  {% set opacity_50 = '80' %}
  {% set opacity_60 = '99' %}
  {% set opacity_80 = 'CC' %}

  {# Accent color #}
  --accent-color: {{ accent_color }};
  --accent-color-opacity-05: {{ accent_color }}{{ opacity_05 }};
  --accent-color-opacity-10: {{ accent_color }}{{ opacity_10 }};
  --accent-color-opacity-20: {{ accent_color }}{{ opacity_20 }};
  --accent-color-opacity-30: {{ accent_color }}{{ opacity_30 }};
  --accent-color-opacity-50: {{ accent_color }}{{ opacity_50 }};
  --accent-color-opacity-60: {{ accent_color }}{{ opacity_60 }};
  --accent-color-opacity-80: {{ accent_color }}{{ opacity_80 }};

  {# Foreground color #}
  --main-foreground: {{ main_foreground }};
  --main-foreground-opacity-05: {{ main_foreground }}{{ opacity_05 }};
  --main-foreground-opacity-10: {{ main_foreground }}{{ opacity_10 }};
  --main-foreground-opacity-20: {{ main_foreground }}{{ opacity_20 }};
  --main-foreground-opacity-30: {{ main_foreground }}{{ opacity_30 }};
  --main-foreground-opacity-50: {{ main_foreground }}{{ opacity_50 }};
  --main-foreground-opacity-60: {{ main_foreground }}{{ opacity_60 }};
  --main-foreground-opacity-80: {{ main_foreground }}{{ opacity_80 }};

  {# Background color #}
  --main-background: {{ main_background }};
  --main-background-opacity-05: {{ main_background }}{{ opacity_05 }};
  --main-background-opacity-10: {{ main_background }}{{ opacity_10 }};
  --main-background-opacity-20: {{ main_background }}{{ opacity_20 }};
  --main-background-opacity-30: {{ main_background }}{{ opacity_30 }};
  --main-background-opacity-50: {{ main_background }}{{ opacity_50 }};
  --main-background-opacity-60: {{ main_background }}{{ opacity_60 }};
  --main-background-opacity-80: {{ main_background }}{{ opacity_80 }};

  {#### Component tokens #}

  {# General #}
  --border-radius: 10px;
  --box-border-radius: var(--border-radius);
  --border-color: var(--main-foreground-opacity-10);

  {# Buttons #}
  --button-foreground: var(--main-background);
  --button-background: var(--accent-color);
  --button-border-color: var(--accent-color);
  --button-border-radius: 40px;

  {# Labels #}
  --label-foreground: var(--main-background);
  --label-background: var(--accent-color);

  {# Header - Yamuna /comprar style #}
  --header-foreground: #a31460;
  --header-background: #f6f6f6;
  --header-logo-max-width: 160px;
  --header-logo-max-height: 96px;

  {# Footer - Yamuna cart burgundy #}
  --footer-foreground: #ffffff;
  --footer-background: #501735;

  {#### Typography #}

  {# Headings #}
  --heading-font: Raleway, sans-serif;
  --heading-font-weight: 700;
  --heading-text-transform: none;
  --heading-letter-spacing: normal;

  {# Header #}
  --header-logo-font: Raleway, sans-serif;
  --header-logo-font-size: 20px;
  --header-logo-font-weight: 700;
  --header-logo-text-transform: none;
  --header-logo-letter-spacing: normal;
}

body {
  font-family: $body-font;
  color: $foreground-color;
  background-color: $background-color;
}
a {
  color: $accent-brand-color;
  text-decoration: none;
  &:hover, &:focus {
    color: darken($accent-brand-color, 20%);
    
    svg {
      fill: darken($accent-brand-color, 20%);
    }
  }

  svg {
    fill: $accent-brand-color;
  }
}

{# /* // Text */ #}

.title {
  color: $foreground-color;
}

{# /* // Header */ #}

.header { 
  background-color: lighten($background-color, 10%);
  border-color: $accent-brand-color;
}

.security-seal {
  color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
}

{# /* // Headbar */ #}

.headbar {
  background: #f6f6f6 !important;
  border-bottom: 0;
  box-shadow: none;

  .container {
    max-width: 100%;
    width: 100%;

    .row {
      -ms-flex-align: center;
      align-items: center;

    }
  }
}

.headbar-logo-img {
  max-width: 100%;
  max-height: 80px;
}

.headbar-logo-text {
  float: none;
  color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
  font-weight: 700;

  &:hover {
    color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
    opacity: .8;
  }

  &:focus {
    color: $background-color;
  }
}

.headbar-continue {
  margin: 0 !important;
  font-weight: 400;
  color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
  &:hover,
  &:focus {
    color: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
    opacity: .8;

    .headbar-continue-icon {
      fill: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
    }
  }
  &-icon {
    margin-left: 5px;
    fill: {% if settings.head_background == 'light' %}$foreground-color{% else %}$background-color{% endif %};
  }
}

{# /* // Form */ #}

.form-control {
  background: #fff;
  border-color: $box-border-color;
  color: $foreground-color;
  font-family: $body-font;
  border-radius: $box-radius;

  &:focus {
    border-color: $accent-brand-color;
    outline: none;    
  }
}
.form-options-content {
  font-size: 12px;
  line-height: 20px;
  color: rgba($foreground-color, .6);
  border: 0;
}
.form-group input[type="radio"] + .form-options-content .unchecked {
  fill: darken($background-color, 10%);
}
.form-group input[type="radio"] + .form-options-content .checked {
  fill: $accent-brand-color;
}
.form-group input[type="radio"]:checked + .form-options-content {
  border: 1px solid $accent-brand-color;
  border-color: darken($background-color, 10%);
  
  + .form-options-accordion {
    border-color: darken($background-color, 10%);
  }
  
  .checked {
    fill: $accent-brand-color;
  }
}
.form-group input[type="checkbox"]:checked + .form-options-content .checked {
  fill: $foreground-color;
}
.form-group input[disabled] + .form-options-content {
  border-color: darken($background-color, 10%) !important;
  
  .form-options-label {
    color: $foreground-color !important;
  }
  .checked {
    fill: $foreground-color !important;
  }
}
.form-group input[type="checkbox"] + .form-options-content .unchecked {
  width: 13px;
  fill: $foreground-color;
}

{# /* // Input */ #}

.has-float-label>span,
.has-float-label label {
  padding: 1px 0 0 7px;
  font-weight: 400;
}

.input-label {
  color: $foreground-color;
}

.select-icon {
  fill: $foreground-color;
}

{# /* // Buttons */ #}

.btn-primary {
  color: $background-color;
  background: $accent-brand-color;
  border-radius: 40px;

  &:hover,
  &:focus,
  &:active {
    color: $background-color;
    background: $accent-brand-color;
    opacity: 0.9;
  }
}
.btn-secondary {
  color: $accent-brand-color;
  text-transform: uppercase;
  font-weight: bold;
  letter-spacing: 1px;
  border-color: $accent-brand-color;
  border-radius: 40px;
  background: $background-color;

  &:hover,
  &:focus,
  &:active,
  &:active:focus {
    background: $background-color;
    color: lighten($accent-brand-color, 15%);
    border-color: lighten($accent-brand-color, 15%);

    .btn-icon-right {
      fill: lighten($accent-brand-color, 15%);
    }
  }
  .btn-icon-right {
    fill: $accent-brand-color;
  }
}
.btn-transparent {
  color: $accent-brand-color;
  font-weight: 700;

  &:hover {
    color: $accent-brand-color;
    
    .btn-icon-right {
      fill: $accent-brand-color;
    }
  }

  .btn-icon-right {
    fill: $accent-brand-color;
  }
}

.btn-link {
  color: $accent-brand-color;
  text-decoration: none;

  &:hover {
    color: darken($accent-brand-color, 10%);

    svg {
      fill: darken($accent-brand-color, 10%);
    }
  }
}

.btn-picker {
  border-color: $box-border-color;
  border-radius: $box-radius;
}

.login-info {
  margin: 10px 0 0;
  font-size: 12px;
  text-align: left;
}

{# /* // Breadcrumb */ #}

.breadcrumb li .breadcrumb-step {
  margin: 0;
  font-size: 12px;
  color: rgba($foreground-color, .6);
  background: none;
  text-transform: none;

  &.active {
    color: $foreground-color;
    background: none;

    &:before,
    &:after {
      position: relative;
      margin: 0 10px;
      border: 0;
      content: ">";
      opacity: .6;
    }
  }

  &.visited {
    color: rgba($foreground-color, .6);
    background: none;
  }
}
.breadcrumb li:first-child .breadcrumb-step,
.breadcrumb li:last-child .breadcrumb-step {
  padding: 0;
}

{# /* // Accordion */ #}

.accordion {
  color: $foreground-color;
  background-color: $background-color;
  border-radius: $box-radius;
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  border-color: rgba($foreground-color, .15); 
}

.accordion-section-header-icon {
  fill: $foreground-color;
}

.accordion-rotate-icon {
  fill: $foreground-color;
}

{# /* // Summary */ #}

.mobile-discount-coupon_btn {
  border-radius: $box-radius;
  border-color: darken($background-color, 10%);
  color: lighten($foreground-color, 20%);
  
  .icon {
    color: lighten($foreground-color, 20%);
  }
}
.summary .overlay + .summary-container {
  border: 0;
}
.summary-details {
  background: lighten($background-color, 15%);
}
.summary-container {
  background: $background-color;
  border-bottom: 1px solid rgba($foreground-color, .1);
  box-shadow: none;
}
.summary-total {
  font-size: 16px;
  font-weight: 700;
  color: $accent-brand-color;
  background: $background-color;
}
.summary-img-thumb {
  border-radius: 0;
}
.summary-arrow-rounded {
  background: none;
  border: 1px solid $accent-brand-color;
  .summary-arrow-icon {
    fill: $accent-brand-color;
  }
}

.summary-title {
  color: darken($accent-brand-color, 10%);
}

{# /* // Radio */ #}

.radio-group {
  border-radius: $box-radius;

  &.radio-group-accordion {
    border-color: rgba($foreground-color, .15);
    box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
    overflow: hidden;

    .radio {
      border-color: rgba($foreground-color, .15);
      &.active {
        color: $background-color;
        background: $accent-brand-color;
        padding-bottom: 25px;
        margin-bottom: -10px;
        .description {
          color: $background-color;
        }
        & + .radio-content {
          border: 2px solid $accent-brand-color;
          border-top-right-radius: 10px;
          border-top-left-radius: 10px;
        }
        .payment-item-discount {
          color: $background-color;
        }
      }
      .label {
        font-weight: 400;
      }
      .description {
        width: calc(100% - 35px);
        margin-left: 35px;
        font-weight: 400;
      }
      &-content:last-child {
        border-radius: 0 0 $box-radius $box-radius;
      }
    }
  }
}

.radio input:checked + .selector:before {
  background: $background-color;
  border-color: $background-color;
}
.radio input:checked + .selector:after {
  position: absolute;
  top: 4px;
  left: 4px;
  width: 12px;
  content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.primary_color |trim('#') }}"><path d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"/></svg>');
}
.radio input:disabled:checked + .selector:before {
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 50%, transparent 50%, transparent 100%);
}
.radio .selector {
  position: relative;

  &:before {
    width: 20px;
    height: 20px;
    margin: 1px 15px 0 0;
    border-color: rgba($foreground-color, 0.5);
  }
}

.radio-content {
  background: #fff;
  border: 0;
  box-shadow: none;
}

.shipping-option {
  position: relative;
  margin-bottom: -1px;
  padding-left: 55px;
  background: #fff;
  border-radius: 0;
  border-color: rgba($foreground-color, .15);

  &:first-child {
    border-radius: $box-radius $box-radius 0 0;
  }
  &:last-child {
    border-radius: 0 0 $box-radius $box-radius;
  }
  &:only-child {
    border-radius: $box-radius;
  }
  &.active {
    margin-bottom: 0;
    border: 2px solid $accent-brand-color;
    border-radius: 10px;
    overflow: hidden;

    .selector {
      background: #fff;
      background-color: #fff;
      border-radius: 10px 0 0 10px;
    }
  }

  .selector {
    position: absolute;
    top: 0;
    left: 0;
    width: 45px;
    height: 100%;
    margin: 0;
    text-align: center;
    &:before {
      margin: 15px 0 0 0;
    }
  }

  input:checked + .selector:after {
    top: 17px;
    left: 16px;
  }
}

{# /* // Panel */ #}

.panel {
  padding: 0;
  color: $foreground-color;
  background-color: transparent;
  border-radius: $box-radius;
  box-shadow: none;
  border: 0;
  &.panel-with-header {
    padding-top: 0;
    p {
      margin-top: 0;
    }
  }
  &.summary-details {
    border: 1px solid rgba($foreground-color, .1);
    box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  }
  &.text-center {
    text-align: left !important;
  }
  .panel-subheader:before {
    display: inline-block;
    width: 18px;
    margin: 0 14px 0 1px;
    vertical-align: middle;
    {% if settings.icons_solid %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 29 32.49" fill="%23{{ settings.text_color |trim('#') }}"><path d="M26.5,32.49H2.5A2.5,2.5,0,0,1,0,30C0,23.8,6.5,18.76,14.5,18.76S29,23.8,29,30A2.5,2.5,0,0,1,26.5,32.49Zm-20.67-5H23.17c-1.5-2.17-4.87-3.73-8.67-3.73S7.33,25.32,5.83,27.49ZM14.5,5a4,4,0,1,1-4,4,4,4,0,0,1,4-4m0-5a9,9,0,1,0,9,9,9,9,0,0,0-9-9Z"/></svg>');
    {% else %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" fill="%23{{ settings.text_color |trim('#') }}"><path d="M15,17.41A8.33,8.33,0,1,0,6.68,9.08,8.33,8.33,0,0,0,15,17.41Zm0-14A5.55,5.55,0,1,1,9.45,9,5.56,5.56,0,0,1,15,3.44Zm0,14.62C7.1,18.06.66,22.5.66,28a1.36,1.36,0,0,0,1.39,1.39A1.36,1.36,0,0,0,3.44,28c0-3.86,5.29-7.12,11.56-7.12S26.56,24.09,26.56,28a1.39,1.39,0,0,0,2.78,0C29.34,22.5,22.9,18.06,15,18.06Z"/></svg>');
    {% endif %}
  }
  .panel-submodule:last-child .panel-subheader:before,
  .shipping-options .panel-subheader:before {
    {% if settings.icons_solid %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"/></svg>');
    {% else %}
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M192 96c-52.935 0-96 43.065-96 96s43.065 96 96 96 96-43.065 96-96-43.065-96-96-96zm0 160c-35.29 0-64-28.71-64-64s28.71-64 64-64 64 28.71 64 64-28.71 64-64 64zm0-256C85.961 0 0 85.961 0 192c0 77.413 26.97 99.031 172.268 309.67 9.534 13.772 29.929 13.774 39.465 0C357.03 291.031 384 269.413 384 192 384 85.961 298.039 0 192 0zm0 473.931C52.705 272.488 32 256.494 32 192c0-42.738 16.643-82.917 46.863-113.137S149.262 32 192 32s82.917 16.643 113.137 46.863S352 149.262 352 192c0 64.49-20.692 80.47-160 281.931z"/></svg>');
    {% endif %}
  }

  .new-shipping-flow .panel-subheader-ship:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M226.8 94.6H0V63.8h242.2c8.5 0 15.4 6.9 15.4 15.4v41.6h70.1c4.7 0 9.1 2.1 12 5.8l57 71.2c2.2 2.7 3.4 6.1 3.4 9.6v85.5c0 8.5-6.9 15.4-15.4 15.4h-30.1c-6.2 16.6-22.3 28.5-41.1 28.5-24.2 0-43.9-19.6-43.9-43.9 0-24.2 19.6-43.9 43.9-43.9 18.8 0 34.9 11.8 41.1 28.5h14.7v-64.7l-49-61.2h-62.7v141.3c0 8.5-6.9 15.4-15.4 15.4h-85.5v-30.8h70.1V94.6zm-70.1 56.9H28.5v-30.8h128.2v30.8zm-28.5 57H0v-30.8h128.2v30.8zm-42.7 71.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1zm-43.9 13.2c0-24.2 19.6-43.9 43.9-43.9s43.9 19.6 43.9 43.9c0 24.2-19.6 43.9-43.9 43.9s-43.9-19.7-43.9-43.9zm271.8-13.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1z"/></svg>');
  }
  .new-shipping-flow .panel-subheader-pickup:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M198.3 0c-82.5 0-150 67.5-150 150 0 60 20 77.5 135 242.5 3.8 5 9.4 7.5 15 7.5s11.3-2.5 15-7.5c115-165 135-182.5 135-242.5 0-82.5-67.5-150-150-150zm0 348.5c-11.3-16.1-21.5-30.6-30.8-43.7C93.9 200.4 85.8 187.7 85.8 150c0-62 50.5-112.5 112.5-112.5S310.8 88 310.8 150c0 37.7-8.1 50.4-81.7 154.8-9.3 13.1-19.5 27.6-30.8 43.7z"/></svg>');
  }

  .shipping-address-container .panel-subheader:before {
    display: none;
  }
}
.panel-header {
  margin: 0;
  font-size: 34px;
  font-weight: bold;
  color: $foreground-color;
  text-align: left;
  border: 0;
  text-shadow: none;
}
.panel-header-tooltip {
  padding: 0 5px;
}
.panel-header-sticky {
  background-color: transparent;
}
.panel-header-button {
  position: absolute;
  top: 9px;
  right: 0;
  z-index: 2;
  width: auto;
}
.panel-footer {
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
  background: darken($background-color, 2%);
  &-wa {
    border-color: darken($background-color, 5%);
  }
}
.panel-footer-form {
  input {
    border-color: $foreground-color;
  }
  .input-group-addon {
    background: $background-color;
    border-color: $foreground-color;
  }
  .disabled {
    background: darken($background-color, 15%) !important;
  }
}

{# /* // Table */ #}

.table-footer {
  font-size: 22px;
  font-weight: 700;
  color: $accent-brand-color;
  border: 0;
  .text-semi-bold {
    font-weight: 700;
  }
}

.table-subtotal {
  padding-top: 10px;
  border-color: rgba($foreground-color, .15);
}

.table .table-discount-coupon,
.table .table-discount-promotion {
  color: $accent-brand-color;
  border: 0;
}

{# /* // Shipping Options */ #}

.shipping-options {
  color: lighten($foreground-color, 7%);

  .radio-group {
    border-radius: $box-radius;
    box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
    overflow: hidden;
  }

  .btn {
    margin: 0;
    background: $background-color;
    border: 1px solid rgba($foreground-color, .1);
    border-radius: 0 0 $box-radius $box-radius;
    border-top: 0;
  }
}

.shipping-options-ship, 
.shipping-options-pickup {
  border-radius: $box-radius;
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  overflow: hidden;
}

.new-shipping-flow .shipping-options .radio-group {
  box-shadow: none;
  overflow: inherit;
}

.new-shipping-flow .shipping-options .btn {
  margin-top: -10px;
  padding-top: 20px;
  border: 0;
}

.shipping-method-item > span {
  width: 100%;
}

.shipping-method-item-desc,
.shipping-method-item-name {
  max-width: 70%;
  color: desaturate(lighten($foreground-color, 10%), 80%)
}

.shipping-method-item-price {
  float: right;
  font-size: 16px;
  color: $accent-brand-color;
}

.price-striked {
  display: block;
  margin: 5px 0 0 !important;
  font-size: 14px;
  color: rgba($foreground-color, .6);
}

{# /* // Discount Coupon */ #}

.box-discount-coupon button {
  @if lightness($foreground-color) < 90% {
    color: lighten($foreground-color, 80%);
  } @else {
    color: $foreground-color;
  }
  background: $accent-brand-color;

  &:hover {
    background: lighten($accent-brand-color, 15%) radial-gradient(circle,transparent 1%, lighten($accent-brand-color, 15%) 1%) center/15000%;
  }
}
.box-discount-coupon-applied {
  color: $accent-brand-color;
  background: none;
  border: 1px solid $accent-brand-color !important;
  border-radius: 40px;

  .coupon-icon {
    fill: $accent-brand-color;
  }
}

{# /* // Order Status */ #}

.orderstatus {
  border: 1px solid rgba($foreground-color, .1);
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
}

{# /* // Support */ #}

.support .btn-secondary {
  border-radius: 40px;
  letter-spacing: 0;
}

{# /* // Destination */ #}

.destination {
  border-color: rgba($foreground-color, 0.1);
  &-icon svg {
    fill: $accent-brand-color;
  }
}


{# /* // User Detail */ #}

.user-detail-icon svg {
  fill: $accent-brand-color;
}

{# /* // History */ #}

.history-item-done .history-item-title {
  color: $foreground-color;
}
.history-item-failure .history-item-title {
  color: $base-red;
}
.history-item-progress-icon svg {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);  
  } @else {
    fill: $background-color;
  }
}
.history-item-progress-icon:after {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);
    border-color: darken($background-color, 10%);
  } @else {
    fill: $background-color;
    border-color: $background-color;
  }
}
.history-item-progress-icon-failure svg {
  fill: $base-red;
}
.history-item-progress-icon-success svg {
  fill: $accent-brand-color;
}
.history-item-progress-icon-success:after {
  border-color: $accent-brand-color;
}

{# /* // History Canceled */ #}

.history-canceled {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.history-canceled-header {
  border-color: rgba($box-border-color, 0.7);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.history-canceled-icon svg {
  fill: darken($background-color, 45%);
}

{# /* // Offline Payment */ #}

.ticket-coupon {
  background: darken($background-color, 4%);
  border-color: $box-border-color;
}

{# /* // Status */ #}

.status {
  border: 1px solid rgba($foreground-color, .1); 
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  padding: 25px 0;
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // Tracking */ #}

.tracking-item-time {
  color: $foreground-color;
}

{# /* // WhatsApp Opt-in */ #}

.whatsapp-form input, 
.whatsapp-form .input-group-addon {
  border-color: $accent-brand-color;
}

{# /* // Helpers */ #}

.border-top {
  border-color: rgba($box-border-color, .4);
}

{# /* // Errors */ #}

.alert-danger-bagged {
  margin-top: 4px;
  padding: 2px 0 0;
  border: 0;
  border-radius: 0;
  float: none;
  width: 100%;
  background: transparent;
  color: #db3e3e;
  text-align: left;
  justify-content: flex-start;
}

.general-error {
  background: transparent;
  border: 0;
  color: #db3e3e;
}

{# /* 021  validation alerts: red text only (no solid BG) */ #}
.alert.alert-danger,
.alert.m-top.alert-danger,
.alert.m-top-half.alert-danger,
.alert.full-width.alert-danger {
  background: transparent !important;
  background-color: transparent !important;
  border: 0 !important;
  box-shadow: none !important;
  color: #db3e3e !important;
  justify-content: flex-start !important;
  text-align: left !important;
  padding: 8px 16px !important;
}

.alert.alert-danger span,
.alert.alert-danger *,
.alert-danger-bagged,
.alert-danger-bagged span,
.alert-danger-bagged * {
  color: #db3e3e !important;
}

{# /* Payment required alert  Raleway + inset padding (not glued to edge) */ #}
#main-column .alert.alert-danger.m-bottom.full-width,
#main-column .alert.m-bottom.full-width.alert-danger,
#checkout-payment-options > .alert.alert-danger,
#checkout-payment-options .alert.alert-danger.full-width,
#checkout-payment-options .alert.m-bottom.alert-danger,
.payment-option-group > .alert.alert-danger,
.radio-group-accordion > .alert.alert-danger,
.yamuna-payment-option-alert {
  display: flex !important;
  align-items: center !important;
  justify-content: flex-start !important;
  box-sizing: border-box !important;
  width: 100% !important;
  margin: 8px 0 16px !important;
  padding: 8px 20px 10px !important;
  float: none !important;
  font-family: "Raleway", Raleway, sans-serif !important;
  font-size: 13px !important;
  font-style: normal !important;
  font-weight: 500 !important;
  line-height: 1.4 !important;
  letter-spacing: 0.01em !important;
  text-align: left !important;
  color: #db3e3e !important;
}
#main-column .alert.alert-danger.m-bottom.full-width span,
#main-column .alert.alert-danger.m-bottom.full-width *,
#checkout-payment-options .alert.alert-danger span,
#checkout-payment-options .alert.alert-danger *,
.yamuna-payment-option-alert span,
.yamuna-payment-option-alert * {
  font-family: "Raleway", Raleway, sans-serif !important;
  font-size: 13px !important;
  font-style: normal !important;
  font-weight: 500 !important;
  line-height: 1.4 !important;
  color: #db3e3e !important;
}

#checkout-payment-options {
  display: flex !important;
  flex-direction: column !important;
}
#checkout-payment-options > .alert.alert-danger,
#checkout-payment-options > .alert.m-bottom.alert-danger {
  order: 99 !important;
  margin: 14px 0 8px !important;
  padding: 10px 20px !important;
}

.yamuna-payment-option-alert {
  margin: 10px 0 12px !important;
  width: 100% !important;
  max-width: 100% !important;
  padding: 10px 20px !important;
}

{# /* 021  restore full borders on address/CEP inputs (+ outline fallback) */ #}
[name="shippingAddress.zipcode"],
[name="shippingAddress.zipCode"],
#shippingAddress\.zipCode,
#shippingAddress\.zipcode,
[name="shippingAddress.number"],
[name="shippingAddress.floor"],
#main-column [name="shippingAddress.zipcode"],
#main-column [name="shippingAddress.zipCode"],
#main-column [name="shippingAddress.number"],
#main-column [name="shippingAddress.floor"] {
  border: 1px solid rgba($foreground-color, .3) !important;
  border-top: 1px solid rgba($foreground-color, .3) !important;
  border-radius: $box-radius !important;
  outline: 1px solid rgba($foreground-color, .3) !important;
  outline-offset: -1px !important;
}

.form-group.form-group-error .form-control,
.form-group-error .form-control,
#main-column .form-group.form-group-error .form-control,
#main-column .form-group-error .form-control {
  border: 1px solid $base-red !important;
  border-top: 1px solid $base-red !important;
  border-radius: $box-radius !important;
  outline: 1px solid $base-red !important;
  outline-offset: -1px !important;
}

.has-float-label > label,
.has-float-label > .input-label {
  background: transparent !important;
}

.alert.alert-danger.yamuna-hide-cep-step-alert,
.alert.full-width.alert-danger.yamuna-hide-cep-step-alert {
  display: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
}

{# /* // Badge */ #}

.badge {
  border: 0;
}

{# /* // Payment */ #}

.payment-item-discount {
  display: none !important;
}

.payment-option {
  border-radius: $box-radius;
  color: $foreground-color;
  background-color: #fff;
  border-color: rgba($foreground-color, .15);
  box-shadow: 0 1px 3px -1px rgba($foreground-color, 0.05);
}

.radio-content.payment-option-content {
  background: #fff;
  border: 1px solid rgba($foreground-color, .15);
  border-top: 0;
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
}


{# /* // Overlay */ #}

.overlay {
  background: rgba(darken($background-color, 10%), 0.6);
}
.overlay-title {
  color: rgba($foreground-color, .7);
}

{# /* // List Picker */ #}

.list-picker .unchecked {
  fill: $foreground-color;
}
.list-picker li {
  border-color: $box-border-color;
  background: lighten($background-color, 10%);

  &:hover {
    color: $accent-brand-color;
  }

  &.active {
    background: $background-color;
    color: $accent-brand-color;

    .checked {
      fill: $accent-brand-color;
    }
  }
}

.list-picker-content {
  background: lighten($background-color, 10%);
  border-color: $box-border-color;
}

{# /* // Loading */ #}

.loading {
  background: rgba(darken($background-color, 2%), 0.5);
  color: $accent-brand-color;
}
.loading-spinner {
  color: $accent-brand-color;
}
.loading-skeleton-radio {
  margin: 0 0 -1px 0;
  border-color: rgba($foreground-color, .15);
  border-radius: 0;
  &:first-child {
    border-radius: $box-radius $box-radius 0 0;
  }
  &:last-child {
    border-radius: 0 0 $box-radius $box-radius;
  }
  &:not(:first-child) {
    border-top: 0;
  }
}

{# /* // Spinner */ #}

.round-spinner {
  border-color: $accent-brand-color;
  border-left-color: darken($accent-brand-color, 5%);
  
  &:after {
    border-color: $accent-brand-color;
    border-left-color: darken($accent-brand-color, 5%);
  }
}

.spinner > .spinner-elem {
  background: $accent-brand-color;
}

.spinner-inverted > .spinner-elem {
  background: $background-color;
}

{# /* // Sign Up */ #}

.signup {
  border: 1px solid rgba($foreground-color, .1); 
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04); 
  padding: 25px 0;
  &-icon svg {
    fill: $accent-brand-color;
  }
}

{# /* // Modal */ #}

.modal-dialog,
.modal .modal-dialog {
  background: $background-color;
}

{# /* // List */ #}

.list-group-item {
  border-color: rgba($foreground-color, .15);
}

{# /* // Announcement */ #}

.announcement {
  color: darken($accent-brand-color, 10%);

  &-bg {
    background: $accent-brand-color;
    box-shadow: 0px 3px 5px -1px rgba(darken($accent-brand-color, 20%), 0.35);
    border-radius: $box-radius;
  }

  &-close {
    color: $accent-brand-color;
  }
}

{# /* // Alert */ #}

.alert-info {
  background-color: rgba($accent-brand-color, .15);
  border-color: rgba($accent-brand-color, .2);
  color: desaturate(darken($accent-brand-color, 10%), 30%);

  .alert-icon {
    fill: desaturate(darken($accent-brand-color, 10%), 20%);
  }
}

{# /* // Chip */ #}

.chip {
  background-color: rgba($accent-brand-color, .15);
  color: $accent-brand-color;
  border-radius: 5px;
}

{# /* // Review Block Detailed  */ #}
.price--display__free {
  color: $accent-brand-color;
}

.review-block-detailed-item {
  border-bottom: 1px solid rgba($foreground-color, .15);
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
  &:last-child{
    border-radius: 0 0 10px 10px;
  }
}

.review-block-detailed {
  border: 1px solid rgba($foreground-color, .15);
  border-radius: 10px;
  background-color: #fff;
}

{# /* // Tooltip */ #}

.tooltip-icon {
  fill: $foreground-color;
}

{# /* // Tabs */ #}

.tabs-wrapper {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  background: darken($background-color, 5%);
  border-bottom-color: darken($background-color, 10%);
}

.tab-item.active {
  color: $accent-brand-color;
  font-weight: bold;
}

.tab-indicator {
  background-color: $accent-brand-color;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Max width 576px */ #}

@media (max-width: $sm) {

  .headbar .container .row .col {
    text-align: center !important;
    flex-basis: auto;
    &.text-left {
      order: 2;
    }
    &.text-right {
      margin: -12px 0 15px 0;
      background: #aac67b;
    }
  }

  .headbar-logo-text {
    display: inline-block;
    margin: 8px 0;
  }

  .security-seal {
    color: #000000;

    .d-inline-block:first-child {
      position: absolute;
      top: 1px;
      left: 50%;
      margin-left: -13px;
    }
    p {
      display: inline-block;
      &.text-semi-bold {
        margin-right: 50px !important;
      }
    }
    &-badge {
      margin: 0;
    }
  }

  .summary .panel {
    border: 1px solid rgba($foreground-color, .1);
  }

  .panel.summary-details {
    border: 1px solid rgba($foreground-color, .1);
    box-shadow: 0 1px 3px -1px rgba($foreground-color, 0.04);
  }

  .panel-header {
    font-size: 22px;
  }

  .panel-subheader {
    font-size: 12px;
  }

  .orderstatus-footer {
    background: $background-color;
  }

}

{# /* // Min width 768px */ #}

@media (min-width: $md) {

  .status,
  .signup {
    padding: 40px 0;
  }

}

{# /* // Max width 0px */ #}

@media (max-width: $xs) {

  .modal-xs {
    background: $background-color;
  }

}


{# Yamuna checkout brand overrides #}
body {
  font-family: Dosis, sans-serif !important;
  background-color: #f6f6f6 !important;
  color: #000 !important;
}

{# Payment / validation alerts must not inherit body Dosis #}
body .alert.alert-danger,
body .alert.alert-danger span,
body .alert.m-bottom.full-width.alert-danger,
body .alert.m-bottom.full-width.alert-danger span {
  font-family: Raleway, sans-serif !important;
}

h1, h2, h3, h4,
.panel-header,
.title,
.btn-primary,
button.btn-primary {
  font-family: Raleway, sans-serif !important;
}

.form-control,
.input-label,
.has-float-label label,
.form-options-content {
  font-family: Roboto, Arial, sans-serif !important;
}

.headbar {
  text-align: center !important;
  padding-top: 28px !important;
  padding-bottom: 18px !important;
}
.headbar .container .row {
  justify-content: center !important;
}
#headbar-left {
  text-align: center !important;
  width: 100% !important;
  max-width: 100% !important;
  flex: 0 0 100% !important;
}
.headbar-logo-text {
  display: inline-block !important;
  width: 138px !important;
  height: 96px !important;
  margin: 0 auto !important;
  overflow: hidden !important;
  color: transparent !important;
  font-size: 0 !important;
  line-height: 0 !important;
  text-indent: -9999px !important;
  background: url("https://d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static/images/yamuna/logo-yamuna-reference.png") center / contain no-repeat !important;
}
.headbar-logo-text:hover,
.headbar-logo-text:focus {
  color: transparent !important;
  opacity: 0.92;
}
.security-seal {
  color: #4a1d3a !important;
}
.security-seal::after {
  display: block;
  margin-top: 6px;
  color: #238482;
  font-family: Dosis, sans-serif;
  font-size: 12px;
  font-weight: 600;
  line-height: 1.3;
  content: "Checkout seguro - +1.300 avaliacoes 5 estrelas no Google";
}
.btn-primary {
  background: #a31460 !important;
  border-color: #a31460 !important;
  color: #fff !important;
}
.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active {
  background: #8c1052 !important;
  border-color: #8c1052 !important;
}
.table-footer,
.table-price {
  color: #000000 !important;
}
.radio.shipping-option.active,
.shipping-option.active {
  border-color: #a31460 !important;
}
.checkout-footer,
.orderstatus-footer {
  background: #501735 !important;
  color: #fff !important;
}

@media (max-width: 767px) {
  .headbar {
    padding-top: 16px !important;
    padding-bottom: 12px !important;
  }
  .headbar-logo-text {
    width: 96px !important;
    height: 72px !important;
  }
}

{# QA 868m30v22  checkout scenarios 014018 #}

/* CTA buttons  Raleway 16px / medium 500, height matches product-card COMPRAR (40px) */
.btn-primary,
button.btn-primary,
.continue-button,
.submit-button,
button[type="submit"].btn-primary,
.btn-submit-step,
#btnFinishCheckout,
#btnFinishCheckout span,
#btnFinishCheckout .text-pre-line,
.mobile-discount-coupon_btn,
.box-discount-coupon button,
button.mobile-discount-coupon_btn,
.summary .mobile-discount-coupon_btn,
.summary .box-discount-coupon button,
a.mobile-discount-coupon_btn,
.box-discount-coupon-apply {
  box-sizing: border-box !important;
  height: 40px !important;
  min-height: 40px !important;
  padding-top: 0 !important;
  padding-bottom: 0 !important;
  font-family: Raleway, sans-serif !important;
  font-size: 16px !important;
  font-weight: 500 !important;
  letter-spacing: 0.04em !important;
  line-height: 40px !important;
}

/* Coupon link CTA (Adicionar cupom)  Raleway 16/500 only */
.summary-coupon .btn,
.summary-coupon .btn-link,
.summary-coupon a.btn,
.summary-coupon .btn .text-pre-line,
.summary-coupon .btn-link .text-pre-line,
.summary .summary-coupon a.btn.btn-link {
  font-family: Raleway, sans-serif !important;
  font-size: 16px !important;
  font-weight: 500 !important;
}

/* 015  summary square prices (item/subtotal/frete): Roboto 16px / bold 700 */
.table-price,
td.table-price,
td.table-price.text-right,
.table-price span,
td.table-price span,
.table .table-price,
.table .table-subtotal .table-price,
.table .table-shipping .table-price,
.table .table-shipping-cost .table-price,
.table .table-discount .table-price,
.table-subtotal-price,
[data-testid="cart-details-desktop"] .table-price,
[data-testid="cart-details-desktop"] .table-price span,
[data-testid="total-container"] .table-price,
[data-testid="total-container"] .table-price span,
[data-testid="cart-subtotal-container"] .table-price,
[data-testid="cart-subtotal-container"] .table-price span {
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  line-height: 1.35 !important;
}

/* 015b  product name in summary (Raleway bold; size tightened in 019b) */
.table-product-name,
.table-product-name a,
.summary-product-name,
td.table-product-name {
  font-family: Raleway, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  color: #000 !important;
}

/* 016  summary labels + Total: Raleway 16px / bold 700 */
.table .table-subtotal td,
.table .table-shipping td,
.table .table-shipping-cost td,
.table .table-discount td,
.table .table-total td,
.table .table-total td:first-child,
.table-footer,
.table-footer td,
.table-footer .table-price,
.table-footer td.table-price,
#cart-total,
td#cart-total,
.table-total-price,
.summary-total,
.summary-total .table-price,
span.summary-total,
.total-price,
[data-testid="cart-total-price"],
.summary-detail .table td:first-child,
.box-container .table td:first-child,
.summary .table td:first-child,
.summary table td:first-child,
.summary table tbody td:first-child,
.summary table tfoot td,
.summary table .table-footer td {
  font-family: Raleway, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  line-height: 1.35 !important;
}

/* 017  total value color #238482 (font set in 016) */
.table .table-total .table-price,
.table-footer .table-price,
#cart-total,
.summary-total,
.summary-total .table-price,
span.summary-total,
.total-price,
[data-testid="cart-total-price"] {
  color: #238482 !important;
}

/* 015c  Subtotal / Frete / Total VALUES: all 16px Roboto */
[data-testid="cart-subtotal"] td.text-right,
[data-testid="cart-subtotal"] td:last-child,
[data-testid="cart-subtotal"] span,
[data-testid="cart-shipping-cost"] td.text-right,
[data-testid="cart-shipping-cost"] td:last-child,
[data-testid="cart-shipping-cost"] span,
[data-testid="cart-shipping-cost"] .text-light,
.table-subtotal td.text-right,
.table-subtotal td:last-child,
.table-subtotal span,
.table-shipping-cost td.text-right,
.table-shipping-cost td:last-child,
.table-shipping-cost span,
.table-shipping-cost .text-light,
#cart-total-price,
span#cart-total-price,
[data-testid="cart-total-price"],
#cart-total,
#cart-total-container span,
.table-footer td.text-right,
.table-footer td:last-child,
.table-footer .table-price,
.table-footer span {
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  line-height: 1.35 !important;
}

/* 018a  smaller secondary copy  Roboto */
.form-control,
.form-control::placeholder,
input.form-control,
input.form-control::placeholder,
textarea.form-control,
textarea.form-control::placeholder,
.input-label,
.has-float-label label,
.has-float-label .form-control,
.form-options-content,
.checkbox-label,
.custom-checkbox label,
.form-group label,
.form-group .form-options-content,
.shipping-option,
.shipping-option *,
.shipping-option-price,
.shipping-option-name,
.shipping-option-desc,
.shipping-method-item,
.shipping-method-item-desc,
.shipping-method-item-name,
.shipping-method-item-price,
.address-summary,
.address-summary *,
.review-block,
.review-block *:not(.btn-primary),
.review-block-detailed,
.review-block-detailed-item,
.review-block-detailed-item *:not(.btn-primary),
.help-block,
.form-group small,
.panel-body,
.panel-body p,
.box-container p,
label,
.custom-control-label,
#main-column .btn-link,
#main-column .btn-link .text-pre-line,
#main-column a.btn-link,
#main-column button.btn-link,
#main-column .btn-secondary,
#main-column .btn-transparent,
.more-options,
[data-testid*="shipping"],
[data-testid*="address"],
[data-testid*="contact"] label {
  font-family: Roboto, Arial, sans-serif !important;
}

/* 022  review + payment labels: normal weight (titles excluded  see 035) */
#main-column .review-block-detailed,
#main-column .review-block-detailed *:not(.btn-primary):not(.btn):not(button),
#main-column .review-block,
#main-column .review-block *:not(.btn-primary):not(.btn):not(button),
#main-column .accordion-section-header-label,
#main-column .accordion-section-header,
#main-column .radio .label,
#main-column .radio .label *,
#main-column .payment-option .label,
#main-column .payment-item-discount,
#main-column .shipping-method-item-name,
#main-column .shipping-method-item-desc,
#main-column .address-summary,
#main-column .address-summary *,
#main-column .radio-group-accordion .radio .label {
  font-weight: 400 !important;
}

/* Cenrio 035  ttulos do checkout: style normal, peso 700 (PROD) */
#main-column .panel-header,
#main-column h3.panel-header,
#main-column h3.panel-header.panel-header-sticky,
#main-column .h3,
#main-column h3 {
  font-style: normal !important;
  font-weight: 700 !important;
}

/* Hide reviews heading */
#yamuna-cart-reviews > .nube-box:first-child {
  display: none !important;
}

/* 018b  Carrinho step clickable (back to /comprar/) */
#breadcrumb ul.breadcrumb-timeline > li:first-child > .breadcrumb-timeline-item,
#breadcrumb ul.breadcrumb-timeline > li:first-child > a.breadcrumb-timeline-item,
#breadcrumb a.yamuna-breadcrumb-carrinho,
.breadcrumb-timeline-item.disabled:first-child,
.breadcrumb-timeline .breadcrumb-timeline-item:first-child {
  pointer-events: auto !important;
  cursor: pointer !important;
  opacity: 1 !important;
  color: #4a1d3a !important;
  text-decoration: none !important;
}

#breadcrumb a.yamuna-breadcrumb-carrinho:hover,
#breadcrumb ul.breadcrumb-timeline > li:first-child > a.breadcrumb-timeline-item:hover {
  color: #000000 !important;
  opacity: 1 !important;
}

#breadcrumb a.yamuna-breadcrumb-carrinho .breadcrumb-timeline-item-icon,
#breadcrumb a.yamuna-breadcrumb-carrinho .breadcrumb-timeline-item-icon svg,
#breadcrumb a.yamuna-breadcrumb-carrinho .breadcrumb-timeline-item-icon svg path,
#breadcrumb ul.breadcrumb-timeline > li:first-child > a .breadcrumb-timeline-item-icon svg path {
  fill: currentColor !important;
  color: inherit !important;
}

{# /*============================================================================
  Yamuna checkout QA  payment summary + extras (019)
==============================================================================*/ #}

/* CDN fix sheet moved to top @import (v=54)  mid-file @import is ignored by browsers */

#btnFinishCheckout,
#btnFinishCheckout::after {
  font-family: Raleway, sans-serif !important;
  font-style: normal !important;
  font-weight: 600 !important;
}

/* Force finish CTA label to match cart step 1  hide any inner text, show ::after */
#btnFinishCheckout {
  font-size: 0 !important;
}
#btnFinishCheckout > *,
#btnFinishCheckout span,
#btnFinishCheckout #btn-text,
#btnFinishCheckout .btn-text,
#btnFinishCheckout .text-pre-line {
  display: none !important;
  visibility: hidden !important;
  opacity: 0 !important;
  font-size: 0 !important;
  color: transparent !important;
  width: 0 !important;
  height: 0 !important;
  overflow: hidden !important;
  position: absolute !important;
  pointer-events: none !important;
}
#btnFinishCheckout::after {
  content: "Finalizar compra" !important;
  display: inline-block !important;
  visibility: visible !important;
  opacity: 1 !important;
  position: static !important;
  font-size: 14px !important;
  line-height: 40px !important;
  font-family: Raleway, sans-serif !important;
  font-style: normal !important;
  font-weight: 600 !important;
  color: #ffffff !important;
  text-transform: uppercase !important;
  width: auto !important;
  height: auto !important;
  overflow: visible !important;
}
@media (min-width: 992px) {
  #btnFinishCheckout::after {
    font-size: 16px !important;
  }
}

/* 019a  progressive discount label  short "5% Off:" (no double colon) */
.table-discount-promotion td:first-child > div {
  font-size: 0 !important;
  line-height: 0 !important;
  color: transparent !important;
  letter-spacing: 0 !important;
}

.table-discount-promotion td:first-child > div::before {
  content: "5% Off:";
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 700 !important;
  line-height: 1.4 !important;
  letter-spacing: normal !important;
  color: #000000 !important;
}

.table-discount-promotion td:first-child > div::after {
  content: none !important;
}

.table-discount-promotion td.text-right,
.table-discount-promotion .text-pre {
  font-size: 14px !important;
  line-height: 1.4 !important;
  color: #000000 !important;
}

/* 019b  product row: image stays in its cell; name truncates beside it.
   Root cause of "name under image": thumb was ~65px overflowing a 56px cell. */
.table.table-scrollable,
.summary .table.table-scrollable,
.summary-container .table.table-scrollable,
[data-testid="cart-details-desktop"] .table.table-scrollable,
.summary table,
.box-container .table {
  table-layout: fixed !important;
  width: 100% !important;
  border-collapse: separate !important;
  border-spacing: 0 !important;
}

.table.table-scrollable tbody tr td,
.summary table tbody tr td,
.summary-container table tbody tr td,
[data-testid="cart-details-desktop"] table tbody tr td {
  vertical-align: middle !important;
}

.summary-img-wrap,
td.summary-img-wrap {
  display: table-cell !important;
  width: 56px !important;
  max-width: 56px !important;
  min-width: 56px !important;
  overflow: hidden !important;
  padding: 0 8px 0 0 !important;
  box-sizing: border-box !important;
  background: transparent !important;
  background-color: transparent !important;
}

.summary-img-wrap .summary-img,
.summary-img-wrap .summary-img-thumb,
td.summary-img-wrap .summary-img,
td.summary-img-wrap .summary-img-thumb {
  width: 48px !important;
  max-width: 48px !important;
  height: 48px !important;
  overflow: hidden !important;
  margin: 0 !important;
  padding: 0 !important;
  background: transparent !important;
  background-color: transparent !important;
  box-shadow: none !important;
  border: 0 !important;
}

.summary-img-wrap img,
.summary-img-thumb img,
.summary-img img,
td.summary-img-wrap img {
  display: block !important;
  width: 48px !important;
  max-width: 48px !important;
  height: 48px !important;
  object-fit: cover !important;
  margin: 0 !important;
  /* 039  white JPG pixels disappear against light summary card */
  background: transparent !important;
  background-color: transparent !important;
  mix-blend-mode: darken !important;
}

.table-price,
td.table-price,
td.table-price.text-right {
  display: table-cell !important;
  width: 88px !important;
  max-width: 88px !important;
  min-width: 72px !important;
  white-space: nowrap !important;
  overflow: visible !important;
}

/* 048  discounted rows need more width + wrap */
.table-price:has(.product-discount-tag),
.table-price:has(.table-price-discount-test-id),
.table-price:has(.product-discount),
.table-price:has(.table-price-discount),
.table-price:has(.product-subtotal),
td.table-price:has(.product-discount-tag),
td.table-price:has(.product-discount),
td.table-price:has(.product-subtotal) {
  width: 130px !important;
  max-width: 150px !important;
  min-width: 110px !important;
  white-space: normal !important;
}

.table-product-name,
td.table-product-name,
[data-testid="product-name-qty"],
.summary .table-product-name,
.summary-container .table-product-name,
.summary-product-name {
  display: table-cell !important;
  position: static !important;
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  line-height: 1.35 !important;
  color: #000 !important;
  /* Do NOT use max-width:0  it collapses the cell to ~10px and hides the name */
  width: auto !important;
  max-width: none !important;
  min-width: 80px !important;
  overflow: hidden !important;
  text-overflow: clip !important;
  white-space: normal !important;
  word-break: break-word !important;
  overflow-wrap: anywhere !important;
  max-height: calc(1.35em * 2) !important;
  vertical-align: middle !important;
  padding-left: 8px !important;
  padding-right: 8px !important;
  margin: 0 !important;
  text-indent: 0 !important;
}

/* 2-line clamp via JS wrapper (keeps td as table-cell) */
.yamuna-name-clamp {
  display: -webkit-box !important;
  -webkit-box-orient: vertical !important;
  -webkit-line-clamp: 2 !important;
  line-clamp: 2 !important;
  overflow: hidden !important;
  text-overflow: ellipsis !important;
  white-space: normal !important;
  word-break: break-word !important;
  overflow-wrap: anywhere !important;
  max-width: 100% !important;
  line-height: 1.35 !important;
}

/* 019f  1024px: single column, summary FIRST, same width as main cards */
@media (max-width: 1024px) {
  #main-row {
    display: flex !important;
    flex-direction: column !important;
    align-items: stretch !important;
  }

  #secondary-column {
    order: -1 !important;
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    flex: 0 0 auto !important;
    float: none !important;
    padding-left: 15px !important;
    padding-right: 15px !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    margin-bottom: 12px !important;
    box-sizing: border-box !important;
  }

  #main-column {
    order: 1 !important;
    width: 100% !important;
    max-width: 100% !important;
    flex: 0 0 auto !important;
    float: none !important;
    padding-left: 15px !important;
    padding-right: 15px !important;
    box-sizing: border-box !important;
  }

  #main-row #secondary-column .summary,
  #main-row #secondary-column .summary.d-none,
  #main-row #secondary-column .summary.d-none.d-md-block,
  #main-row .summary.d-none.d-md-block {
    display: block !important;
    visibility: visible !important;
    position: relative !important;
    top: auto !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 auto 12px !important;
    transform: none !important;
    box-sizing: border-box !important;
  }

  #main-row #secondary-column .summary.sticky,
  #main-row #secondary-column .summary.sticky-top,
  #main-row .summary.d-none.d-md-block.sticky,
  #main-row .summary-fixed {
    position: relative !important;
    top: auto !important;
  }

  #main-row .summary.d-block.d-md-none {
    display: none !important;
    visibility: hidden !important;
    height: 0 !important;
    overflow: hidden !important;
    pointer-events: none !important;
  }

  #main-row #secondary-column [data-testid="cart-details-desktop"],
  #main-row #secondary-column .summary-details,
  #main-row #secondary-column .summary-details.panel,
  #main-row #secondary-column .summary-details.panel.p-none {
    display: flex !important;
    flex-direction: column !important;
    visibility: visible !important;
    position: relative !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 auto !important;
    padding: 0 !important;
    height: auto !important;
    max-height: none !important;
    overflow: visible !important;
    transform: none !important;
    box-sizing: border-box !important;
    background: transparent !important;
    border: 0 !important;
    box-shadow: none !important;
    gap: 0 !important;
  }

  #main-row #secondary-column .summary-details > .container,
  #main-row #secondary-column .summary-details .container.p-none {
    position: relative !important;
    top: auto !important;
    left: auto !important;
    right: auto !important;
    width: 100% !important;
    max-width: 100% !important;
    height: auto !important;
    margin: 0 !important;
    transform: none !important;
    box-sizing: border-box !important;
  }

  #main-row #secondary-column .table-subtotal,
  #main-row #secondary-column [data-testid="cart-total-container"] {
    width: 100% !important;
    max-width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 14px !important;
    padding-right: 14px !important;
    box-sizing: border-box !important;
  }

  /* Cupom mobile: card com padding lateral (no colado nas bordas) */
  html body #main-row #secondary-column .summary-coupon,
  html body #main-row #secondary-column .summary-details .summary-coupon,
  html body #main-row #secondary-column .summary-details.panel.p-none .summary-coupon {
    display: flex !important;
    flex-direction: column !important;
    align-items: stretch !important;
    justify-content: flex-start !important;
    order: -1 !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 0 12px !important;
    padding: 16px !important;
    box-sizing: border-box !important;
    background: #fff !important;
    border: 1px solid rgba(0, 0, 0, 0.1) !important;
    border-radius: 10px !important;
    box-shadow: 0 1px 3px -1px rgba(0, 0, 0, 0.04) !important;
  }
}

/* 019c  hide remove/close control beside product name (when present) */
.summary [data-testid="remove-product"],
.summary [data-testid="product-remove"],
.summary button[aria-label*="emove" i],
.summary a[aria-label*="emove" i],
.summary button[aria-label*="excluir" i],
.summary a[aria-label*="excluir" i],
.summary .js-remove-product,
.summary .product-remove,
.summary .btn-remove-product,
.table-product-name button,
.table-product-name .btn-link,
.table-product-name a[href*="remove"],
.summary-img-wrap button,
.summary-img-wrap .btn-link,
tr[data-testid="product-table"] button:not([type="submit"]),
.summary .icon-delete,
.summary .fa-times,
.summary .fa-close {
  display: none !important;
  visibility: hidden !important;
  pointer-events: none !important;
  width: 0 !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
}

/* 019d  hide blocked iframe (Iframe is unsupported in checkout) */
iframe[src*="yamuna-checkout-cart-extras"],
iframe.nube-iframe[src*="checkout-cart-extras"] {
  display: none !important;
  height: 0 !important;
  min-height: 0 !important;
  margin: 0 !important;
  border: 0 !important;
  visibility: hidden !important;
  pointer-events: none !important;
}

/* 019e  NubeSDK reviews: same width as form fields / #main-row */
#nube-sdk-slot-after_main_content {
  box-sizing: border-box !important;
  width: auto !important;
  max-width: none !important;
  margin-left: -15px !important;
  margin-right: -15px !important;
  padding-left: 0 !important;
  padding-right: 0 !important;
}

#nube-sdk-slot-after_main_content > .nube-box:not(:last-child),
#nube-sdk-slot-after_main_content > .nube-box:only-child,
#nube-sdk-slot-after_main_content #yamuna-cart-reviews {
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: 100% !important;
  min-width: 0 !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
}

/* 097 - avaliacoes no mobile: 15px laterais (vence o width:100% / margin 0 acima) */
@media (max-width: 767px) {
  html body #nube-sdk-slot-after_main_content > .nube-box:not(:last-child),
  html body #nube-sdk-slot-after_main_content > .nube-box:only-child,
  html body #nube-sdk-slot-after_main_content #yamuna-cart-reviews {
    width: calc(100% - 30px) !important;
    max-width: calc(100% - 30px) !important;
    margin-left: 15px !important;
    margin-right: 15px !important;
  }
}

/* Fixed review card (NubeSDK)  one review + nav */
#nube-sdk-slot-after_main_content #yamuna-cart-reviews {
  display: flex !important;
  flex-direction: column !important;
  padding: 16px !important;
  border: 1px solid #d9d9d9 !important;
  border-radius: 16px !important;
  background: #fff !important;
}

#nube-sdk-slot-after_main_content #yamuna-cart-reviews .yamuna-nube-review-body {
  flex: 1 1 auto !important;
  min-height: 0 !important;
  overflow: hidden !important;
}

#nube-sdk-slot-after_main_content #yamuna-cart-reviews .yamuna-nube-review-nav {
  display: flex !important;
  justify-content: center !important;
  gap: 12px !important;
  margin-top: 12px !important;
  flex-shrink: 0 !important;
}

@media (max-width: 767px) {
  #nube-sdk-slot-after_main_content #yamuna-cart-reviews {
    height: 360px !important;
    min-height: 360px !important;
    max-height: 360px !important;
    margin: 16px 0 32px !important;
  }
}

/* Fixed review card on order confirmation/success page - match /comprar mobile styling */
html:has(.success-order-id) #nube-sdk-slot-after_main_content #yamuna-cart-reviews,
html:has([test-id="order-id"]) #nube-sdk-slot-after_main_content #yamuna-cart-reviews {
  display: flex !important;
  flex-direction: column !important;
  padding: 16px !important;
  border: 1px solid #d9d9d9 !important;
  border-radius: 16px !important;
  background: #fff !important;
}

html:has(.success-order-id) #nube-sdk-slot-after_main_content #yamuna-cart-reviews .yamuna-nube-review-body,
html:has([test-id="order-id"]) #nube-sdk-slot-after_main_content #yamuna-cart-reviews .yamuna-nube-review-body {
  flex: 1 1 auto !important;
  min-height: 0 !important;
  overflow: hidden !important;
}

html:has(.success-order-id) #nube-sdk-slot-after_main_content #yamuna-cart-reviews .yamuna-nube-review-nav,
html:has([test-id="order-id"]) #nube-sdk-slot-after_main_content #yamuna-cart-reviews .yamuna-nube-review-nav {
  display: flex !important;
  justify-content: center !important;
  gap: 12px !important;
  margin-top: 12px !important;
  flex-shrink: 0 !important;
}

@media (max-width: 767px) {
  html:has(.success-order-id) #nube-sdk-slot-after_main_content #yamuna-cart-reviews,
  html:has([test-id="order-id"]) #nube-sdk-slot-after_main_content #yamuna-cart-reviews {
    height: 360px !important;
    min-height: 360px !important;
    max-height: 360px !important;
    margin: 16px 0 32px !important;
  }
}

/* legacy wrapper (if DOM inject is used)  match form column width */
.yamuna-checkout-extras {
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: 100% !important;
  margin: 24px 0 0 !important;
  padding: 0 0 32px !important;
}

.yamuna-checkout-extras .yamuna-cart-depositions {
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: 100% !important;
  margin: 0 15px 32px 15px !important;
  padding: 16px 15px !important;
  border: 1px solid #d9d9d9 !important;
  border-radius: 16px !important;
  background: #fff !important;
}

.yamuna-checkout-extras .yamuna-cart-depositions-header {
  display: flex !important;
  align-items: center !important;
  gap: 12px !important;
  margin-bottom: 20px !important;
  padding: 0 0 12px !important;
  border-bottom: 1px solid #ede8ed !important;
}

.yamuna-checkout-extras .yamuna-cart-depositions-icon-wrapper {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  width: 24px !important;
  height: 24px !important;
  border-radius: 50% !important;
  background: #5fbbc6 !important;
  flex-shrink: 0 !important;
}

.yamuna-checkout-extras .yamuna-cart-depositions-title {
  margin: 0 !important;
  color: #000000 !important;
  font-family: Raleway, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  line-height: 1.2 !important;
}

.yamuna-checkout-extras .yamuna-cart-depositions-grid,
.yamuna-checkout-extras .yamuna-cart-depositions-carousel,
.yamuna-checkout-extras .yamuna-cart-depositions .js-swiper-cart-dep {
  display: block !important;
  width: 100% !important;
  overflow: hidden !important;
}

.yamuna-checkout-extras .yamuna-cart-deposition-card {
  display: flex !important;
  flex-direction: column !important;
  gap: 10px !important;
  min-width: 0 !important;
  padding: 0 !important;
}

.yamuna-checkout-extras .yamuna-cart-deposition-stars {
  display: flex !important;
  gap: 2px !important;
}

.yamuna-checkout-extras .yamuna-cart-deposition-content p {
  margin: 0 0 10px !important;
  color: #393747 !important;
  font-family: Poppins, Roboto, sans-serif !important;
  font-size: 12px !important;
  font-weight: 400 !important;
  line-height: 1.45 !important;
  text-align: left !important;
}

.yamuna-checkout-extras .yamuna-cart-deposition-author {
  display: block !important;
  color: #393747 !important;
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
}

.yamuna-checkout-extras .yamuna-cart-depositions-nav {
  display: flex !important;
  justify-content: center !important;
  gap: 12px !important;
  margin-top: 16px !important;
  flex-shrink: 0 !important;
}

.yamuna-checkout-extras .yamuna-cart-dep-prev,
.yamuna-checkout-extras .yamuna-cart-dep-next {
  width: 32px !important;
  height: 32px !important;
  border: 0 !important;
  border-radius: 50% !important;
  background: #238482 url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='15 18 9 12 15 6'/%3E%3C/svg%3E") center / 14px 14px no-repeat !important;
  cursor: pointer !important;
}

.yamuna-checkout-extras .yamuna-cart-dep-next {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='9 18 15 12 9 6'/%3E%3C/svg%3E") !important;
}

.yamuna-checkout-extras .yamuna-cart-dep-prev.swiper-button-disabled,
.yamuna-checkout-extras .yamuna-cart-dep-next.swiper-button-disabled {
  opacity: 0.35 !important;
  cursor: default !important;
}

/* Footer  same classes as /comprar (.yamuna-cart-checkout-footer) */
.yamuna-checkout-extras-footer-root,
.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer {
  width: 100vw !important;
  margin-left: calc(50% - 50vw) !important;
  margin-right: calc(50% - 50vw) !important;
  margin-top: 0 !important;
  background: #501735 !important;
  color: #fff !important;
  font-family: Dosis, Raleway, sans-serif !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-inner {
  box-sizing: border-box !important;
  width: min(100%, 1360px) !important;
  margin: 0 auto !important;
  padding: 44px 24px 20px !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-content {
  display: flex !important;
  flex-wrap: wrap !important;
  justify-content: space-between !important;
  gap: 32px !important;
  align-items: flex-start !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-brand {
  display: inline-flex !important;
  width: 220px !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-brand img {
  display: block !important;
  width: 100% !important;
  height: auto !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-section h2 {
  margin: 0 0 14px !important;
  color: #fff !important;
  font-size: 16px !important;
  font-family: Raleway, sans-serif !important;
  font-weight: 700 !important;
  letter-spacing: 0.04em !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-section ul {
  margin: 0 !important;
  padding: 0 !important;
  list-style: none !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-section li,
.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-section a {
  color: #fff !important;
  font-size: 17px !important;
  font-weight: 300 !important;
  text-decoration: none !important;
  line-height: 1.7 !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-payments-logos {
  display: flex !important;
  flex-wrap: wrap !important;
  gap: 8px !important;
  align-items: center !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-payments-logos img,
.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-payments-logos svg {
  max-height: 28px !important;
  width: auto !important;
  background: #fff !important;
  border-radius: 4px !important;
  padding: 2px 4px !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-security {
  text-align: right !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-security-logos {
  display: flex !important;
  flex-wrap: wrap !important;
  justify-content: flex-end !important;
  gap: 12px !important;
  align-items: center !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-security-logos img {
  max-height: 40px !important;
  width: auto !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-bottom {
  margin-top: 28px !important;
  padding-top: 16px !important;
  border-top: 1px solid rgba(255, 255, 255, 0.18) !important;
}

.yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-bottom p {
  margin: 0 !important;
  color: rgba(255, 255, 255, 0.85) !important;
  font-size: 13px !important;
  font-weight: 300 !important;
  line-height: 1.5 !important;
}

@media (max-width: 991px) {
  .yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-content {
    flex-direction: column !important;
  }

  .yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-security {
    text-align: left !important;
  }

  .yamuna-checkout-extras-footer-root .yamuna-cart-checkout-footer-security-logos {
    justify-content: flex-start !important;
  }
}

@media (max-width: 767px) {
  .yamuna-checkout-extras .yamuna-cart-depositions,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-depositions,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-depositions {
    display: flex !important;
    flex-direction: column !important;
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 100% !important;
    min-width: 0 !important;
    height: 360px !important;
    min-height: 360px !important;
    max-height: 360px !important;
    margin: 16px 15px 32px 15px !important;
    padding: 16px !important;
    position: relative !important;
  }

  .yamuna-checkout-extras .yamuna-cart-depositions-header,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-depositions-header,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-depositions-header {
    flex-shrink: 0 !important;
    margin-bottom: 12px !important;
  }

  .yamuna-checkout-extras .yamuna-cart-depositions-body,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-depositions-body,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-depositions-body {
    display: flex !important;
    flex-direction: column !important;
    flex: 1 1 auto !important;
    min-height: 0 !important;
    position: relative !important;
  }

  .yamuna-checkout-extras .yamuna-cart-depositions-carousel,
  .yamuna-checkout-extras .yamuna-cart-depositions .js-swiper-cart-dep,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-depositions-carousel,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-depositions .js-swiper-cart-dep,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-depositions-carousel,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-depositions .js-swiper-cart-dep {
    flex: 1 1 auto !important;
    min-height: 0 !important;
    height: 100% !important;
    width: 100% !important;
    overflow: hidden !important;
  }

  .yamuna-checkout-extras .yamuna-cart-deposition-card,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-deposition-card,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-deposition-card {
    height: 100% !important;
    min-height: 0 !important;
  }

  .yamuna-checkout-extras .yamuna-cart-deposition-content,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-deposition-content,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-deposition-content {
    flex: 1 1 auto !important;
    min-height: 0 !important;
    overflow: hidden !important;
    display: flex !important;
    flex-direction: column !important;
  }

  .yamuna-checkout-extras .yamuna-cart-deposition-content p,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-deposition-content p,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-deposition-content p {
    flex: 1 1 auto !important;
    min-height: 0 !important;
    overflow: hidden !important;
    display: -webkit-box !important;
    -webkit-box-orient: vertical !important;
    -webkit-line-clamp: 12 !important;
    line-clamp: 12 !important;
  }

  .yamuna-checkout-extras .yamuna-cart-depositions-nav,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-depositions-nav,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-depositions-nav {
    display: none !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-prev,
  .yamuna-checkout-extras .yamuna-cart-dep-next,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-prev,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-next,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-prev,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-next {
    position: absolute !important;
    top: 50% !important;
    transform: translateY(-50%) !important;
    width: 40px !important;
    height: 40px !important;
    min-width: 40px !important;
    min-height: 40px !important;
    border: 0 !important;
    border-radius: 50% !important;
    background: rgba(255, 255, 255, 0.9) !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
    backdrop-filter: blur(6px) !important;
    -webkit-backdrop-filter: blur(6px) !important;
    cursor: pointer !important;
    pointer-events: auto !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    z-index: 10 !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-prev,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-prev,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-prev {
    left: 4px !important;
    right: auto !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-next,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-next,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-next {
    right: 4px !important;
    left: auto !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-prev::before,
  .yamuna-checkout-extras .yamuna-cart-dep-next::before,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-prev::before,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-next::before,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-prev::before,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-next::before {
    display: block !important;
    width: 16px !important;
    height: 16px !important;
    margin: 0 !important;
    border-top: 4px solid #238482 !important;
    border-right: 4px solid #238482 !important;
    background: none !important;
    content: '' !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-prev::before,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-prev::before,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-prev::before {
    margin-left: 0 !important;
    transform: rotate(-135deg) !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-next::before,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-next::before,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-next::before {
    margin-right: 0 !important;
    transform: rotate(45deg) !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-prev::after,
  .yamuna-checkout-extras .yamuna-cart-dep-next::after,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-prev::after,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-next::after,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-prev::after,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-next::after {
    display: none !important;
    content: none !important;
  }

  .yamuna-checkout-extras .yamuna-cart-dep-prev.swiper-button-disabled,
  .yamuna-checkout-extras .yamuna-cart-dep-next.swiper-button-disabled,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-prev.swiper-button-disabled,
  html:has(.success-order-id) .yamuna-checkout-extras .yamuna-cart-dep-next.swiper-button-disabled,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-prev.swiper-button-disabled,
  html:has([test-id="order-id"]) .yamuna-checkout-extras .yamuna-cart-dep-next.swiper-button-disabled {
    opacity: 0.35 !important;
    cursor: default !important;
  }
}

{# /*============================================================================
  # Cenrio 051  frase ps-pedido (announcement) igual prod
==============================================================================*/ #}
.announcement,
.announcement.m-bottom {
  background: #fff !important;
  border: 0 !important;
  box-shadow: none !important;
  justify-content: center !important;
}

.announcement-bg {
  background: #fff !important;
  opacity: 1 !important;
}

.announcement-close,
.announcement .js-close-announcement {
  display: none !important;
}

.announcement-message {
  background: #fff !important;
  color: #000000 !important;
  font-family: Dosis, sans-serif !important;
  font-size: 20px !important;
  font-weight: 700 !important;
  line-height: 1.3 !important;
  text-align: center !important;
  letter-spacing: 0 !important;
  max-width: 100% !important;
  width: 100% !important;
}

{# /*============================================================================
  # Cenrios 071073  confirmao do pedido / PIX
  # Mantm o CTA PIX em uma nica linha e alinha-o ao incio do bloco de texto.
  # Os trs cards da confirmao recebem fundo branco explcito.
==============================================================================*/ #}
html body #main-column .main-column-top > .status.panel,
html body #main-column .status.panel,
html body .destination.border-none,
html body .fulfillments,
html body .fulfillments-header,
html body #main-column .panel.orderstatus .history-canceled-round,
html body #main-column .panel.orderstatus .history-canceled-body {
  background: #fff !important;
  background-color: #fff !important;
}

html body .pix-info-data {
  align-items: flex-start !important;
}

html body .pix-info-data .m-top-half.btn.btn-primary,
html body .pix-info-data .copy-button,
html body .pix-info-data button.copy-button {
  align-self: flex-start !important;
  justify-content: flex-start !important;
  margin-left: 0 !important;
  white-space: nowrap !important;
}

html body .pix-info-data .copy-button-label,
html body .pix-info-data .copy-button-label span {
  display: inline-block !important;
  white-space: nowrap !important;
}

/* A regra global do checkout usa #main-column e centraliza todos os btn-primary.
   Este seletor reproduz a hierarquia real do PIX para manter o CTA  esquerda. */
html body #main-column .pix-info-data > .pix-info-list > li > button.m-top-half.btn.btn-primary {
  margin-left: 0 !important;
  margin-right: 0 !important;
  align-self: flex-start !important;
}

@media (max-width: 425px) {
  html body .pix-info-data .m-top-half.btn.btn-primary,
  html body .pix-info-data .copy-button,
  html body .pix-info-data button.copy-button {
    min-width: 168px !important;
  }
}

@media (max-width: 768px) {
  .announcement-message {
    font-size: 20px !important;
  }
}

@media (max-width: 767px) {
  /* Cenrio 073: mantm os 16px da frase, compactando apenas o card. */
  .announcement,
  .announcement.m-bottom {
    margin: 0 !important;
    padding: 20px 16px !important;
    border-radius: 6px !important;
  }

  .announcement-message {
    font-size: 16px !important;
  }

  /* Supera a regra global do checkout que fora Raleway neste componente. */
  html:has(#main-column .status-content) body .announcement.m-bottom > .announcement-message:not(#yamuna-dosis-a):not(#yamuna-dosis-b):not(#yamuna-dosis-c):not(#yamuna-dosis-d),
  html:has(#main-column .status.panel) body .announcement.m-bottom > .announcement-message:not(#yamuna-dosis-a):not(#yamuna-dosis-b):not(#yamuna-dosis-c):not(#yamuna-dosis-d) {
    font-family: "Dosis", sans-serif !important;
  }
}

{# /*============================================================================
  # PIX copy button  COPIAR label font-size
  Mobile 425px: 12px / above: 16px (override checkout .btn-primary 14px)
==============================================================================*/ #}
.btn-primary.copy-button,
button.btn-primary.copy-button,
.copy-button .copy-button-label,
span.copy-button-label {
  font-size: 16px !important;
  line-height: 1.2 !important;
}

@media (max-width: 425px) {
  .btn-primary.copy-button,
  button.btn-primary.copy-button,
  .copy-button .copy-button-label,
  span.copy-button-label {
    font-size: 12px !important;
  }
}

{# /*============================================================================
  # Cenrio 032  rail do checkbox branco; crculo #5fbbc6
  Borda esquerda do card ativo permanece (no cortar com border-left:0).
==============================================================================*/ #}
.shipping-option.active,
.radio.shipping-option.active,
.radio-option.shipping-option.active {
  border: 2px solid #a31460 !important;
  border-left-width: 2px !important;
  border-radius: 10px !important;
  overflow: hidden !important;
}

.shipping-option.active .selector,
.radio.shipping-option.active .selector,
.radio-option.active .selector,
.shipping-option.active > .selector,
.radio.shipping-option.active > label > .selector,
.shipping-option.active label .selector {
  background: #fff !important;
  background-color: #fff !important;
  background-image: none !important;
  border-color: transparent !important;
  border-radius: 10px 0 0 10px !important;
}

.shipping-option .selector,
.radio.shipping-option .selector {
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
}

.shipping-option .selector:before,
.radio.shipping-option .selector:before {
  display: block !important;
  flex: 0 0 20px !important;
  width: 20px !important;
  height: 20px !important;
  margin: 0 !important;
  border-radius: 50% !important;
  box-sizing: border-box !important;
}

.shipping-option input:checked + .selector:before,
.shipping-option.active input:checked + .selector:before,
.radio.shipping-option input:checked + .selector:before {
  background: #5fbbc6 !important;
  border-color: #5fbbc6 !important;
}

.shipping-option input:checked + .selector:after,
.shipping-option.active input:checked + .selector:after,
.radio.shipping-option input:checked + .selector:after {
  content: "" !important;
  position: absolute !important;
  top: 50% !important;
  left: 50% !important;
  width: 12px !important;
  height: 12px !important;
  margin: 0 !important;
  transform: translate(-50%, -50%) !important;
  background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'%3E%3Cpath fill='%23ffffff' d='M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z'/%3E%3C/svg%3E") center / 12px 12px no-repeat !important;
}

{# /*============================================================================
  LAST (inside allows_checkout_styling)  payment alert beats platform padding:0 / body Dosis
==============================================================================*/ #}
html body .alert.alert-danger,
html body .alert.full-width.alert-danger,
html body .alert.m-bottom.alert-danger,
html body .alert.m-bottom.full-width.alert-danger,
html body #main-column .alert.alert-danger,
html body #main-column .alert.alert-danger.m-bottom,
html body #main-column .alert.alert-danger.m-bottom.full-width,
html body #main-column .alert.m-bottom.full-width.alert-danger,
html body #checkout-payment-options .alert.alert-danger,
html body #checkout-payment-options > .alert.alert-danger,
html body .yamuna-payment-option-alert {
  box-sizing: border-box !important;
  display: flex !important;
  align-items: center !important;
  justify-content: flex-start !important;
  width: 100% !important;
  max-width: 100% !important;
  margin: 8px 0 16px !important;
  padding: 10px 20px !important;
  float: none !important;
  clear: both !important;
  background: transparent !important;
  background-color: transparent !important;
  border: 0 none transparent !important;
  border-width: 0 !important;
  border-style: none !important;
  border-left: 0 none transparent !important;
  border-radius: 0 !important;
  box-shadow: none !important;
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-style: normal !important;
  font-weight: 500 !important;
  line-height: 1.4 !important;
  letter-spacing: 0.01em !important;
  text-align: left !important;
  color: #db3e3e !important;
}

html body .alert.alert-danger > span,
html body .alert.alert-danger span,
html body .alert.full-width.alert-danger span,
html body .alert.m-bottom.alert-danger span,
html body .alert.m-bottom.full-width.alert-danger span,
html body #main-column .alert.alert-danger span,
html body #main-column .alert.alert-danger.m-bottom.full-width span,
html body #checkout-payment-options .alert.alert-danger span,
html body .yamuna-payment-option-alert span {
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-style: normal !important;
  font-weight: 500 !important;
  line-height: 1.4 !important;
  color: #db3e3e !important;
}

html body #checkout-payment-options {
  display: flex !important;
  flex-direction: column !important;
}
html body #checkout-payment-options > .alert.alert-danger,
html body #checkout-payment-options > .alert.m-bottom.alert-danger {
  order: 99 !important;
  margin-top: 14px !important;
  margin-bottom: 8px !important;
  padding: 10px 20px !important;
}

{# /* White ONLY on inputs + cards  panels/headers stay transparent (page #f6f6f6) */ #}
html body .form-control,
html body input.form-control,
html body textarea.form-control,
html body select.form-control,
html body .has-float-label .form-control,
html body .form-group .form-control,
html body #main-column .form-control,
html body #main-column input.form-control,
html body #main-column textarea.form-control,
html body #main-column select.form-control,
html body #main-column .form-group input:not([type="checkbox"]):not([type="radio"]):not([type="hidden"]),
html body #main-column .has-float-label input,
html body #main-column input[name*="document"],
html body #main-column input[name*="Document"],
html body #main-column input[name*="idNumber"],
html body #main-column input[name*="id_number"],
html body #main-column input[data-testid*="document"],
html body #main-column input[data-testid*="idNumber"],
html body #main-column input[id*="document"],
html body #main-column input[id*="idNumber"] {
  background: #fff !important;
  background-color: #fff !important;
}

html body .panel:not(.saved-address-box-review-block):not([class*="saved-address-box"]),
html body #main-column .panel:not(.saved-address-box-review-block):not([class*="saved-address-box"]),
html body .panel.panel-with-header:not(.saved-address-box-review-block):not([class*="saved-address-box"]),
html body #main-column .panel.panel-with-header:not(.saved-address-box-review-block):not([class*="saved-address-box"]),
html body .panel-header,
html body .panel-header-sticky,
html body #main-column .panel-header,
html body #main-column h3.panel-header,
html body #main-column h3.panel-header.panel-header-sticky,
html body #main-column .panel.panel-with-header > .panel-header,
html body #main-column .panel.panel-with-header > h3.panel-header,
html body .panel-body,
html body #main-column .panel-body,
html body .box-container,
html body #main-column .box-container,
html body .accordion,
html body .accordion-section,
html body .form-options-content,
html body .radio-content:not(.payment-option-content),
html body #yamuna-cart-reviews,
html body #nube-sdk-slot-after_main_content #yamuna-cart-reviews {
  background: transparent !important;
  background-color: transparent !important;
  box-shadow: none !important;
}

html body .table-discount-promotion td:first-child > div::before,
html body .table-discount-promotion td:first-child::before {
  font-family: Roboto, Arial, sans-serif !important;
}

/* Cards that keep #fff  ONLY the card itself, never wrappers (.summary / .box-container) */
html body .shipping-option,
html body .radio.shipping-option,
html body .shipping-option.active,
html body .radio.shipping-option.active,
html body .address-summary,
html body .payment-option,
html body .radio.payment-option,
html body .radio-option.payment-option,
html body .radio-content.payment-option-content,
html body .review-block-detailed-item,
html body #main-column .review-block-detailed .review-block-detailed-item,
html body .panel.summary-details,
html body .summary-details,
html body .summary-details.panel,
html body #secondary-column .summary-details,
html body #secondary-column [data-testid="cart-details-desktop"],
html body [data-testid="cart-details-desktop"],
html body #main-column .panel.panel-with-header:has(iframe),
html body #shipping-review,
html body #shipping-review.panel,
html body .panel.panel-address-list,
html body .shipping-review-block,
html body .panel-saved-address-box-review-block,
html body .panel.panel-saved-address-box-review-block,
html body #main-column .panel-saved-address-box-review-block {
  background: #fff !important;
  background-color: #fff !important;
}

/* Wrappers transparent  margin of the card shows page bg */
html body #secondary-column .summary,
html body #secondary-column .summary.sticky,
html body #secondary-column .box-container,
html body #secondary-column,
html body #main-column .panel.panel-with-header,
html body #main-column .panel.m-bottom-half {
  background: transparent !important;
  background-color: transparent !important;
  box-shadow: none !important;
}

html body .panel.summary-details,
html body .summary-details,
html body #secondary-column .summary-details,
html body [data-testid="cart-details-desktop"] {
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  border-radius: 10px !important;
  overflow: hidden !important;
  box-shadow: 0 1px 3px -1px rgba(0, 0, 0, 0.04) !important;
  background-clip: padding-box !important;
}

html body .shipping-option,
html body .radio.shipping-option {
  border-radius: 10px !important;
  overflow: hidden !important;
  margin-bottom: 12px !important;
}

html body .shipping-option.active,
html body .radio.shipping-option.active {
  border: 2px solid #a31460 !important;
  border-radius: 10px !important;
  overflow: hidden !important;
}

/* 12px gap between delivery / form inputs */
html body #main-column .form-group,
html body #main-column .has-float-label,
html body #main-column .form-group.has-float-label {
  margin-bottom: 12px !important;
}

html body #main-column .form-group:last-child,
html body #main-column .has-float-label:last-child {
  margin-bottom: 0 !important;
}

html body #main-column .row > [class*="col-"] .form-group,
html body #main-column .row > [class*="col-"] .has-float-label {
  margin-bottom: 12px !important;
}

html body #main-column .form-group + .form-group,
html body #main-column .has-float-label + .has-float-label,
html body #main-column .form-group + .checkbox,
html body #main-column .has-float-label + .checkbox,
html body #main-column .form-group + .form-options-content,
html body #main-column .checkbox {
  margin-top: 0 !important;
}

html body #main-column .checkbox,
html body #main-column .form-group .checkbox,
html body #main-column label.checkbox {
  display: block !important;
  margin-top: 12px !important;
  margin-bottom: 0 !important;
}

/* ==========================================================================
   065  CTAs iguais ao /comprar: "Continuar comprando" (boto NubeSDK no slot
   after_payment_options / after_billing_form) + boto nativo do passo (teal).
   NubeSDK roda em Web Worker (sem DOM), ento o layout do par  feito aqui.
   ========================================================================== */
html body #main-column form > .btn-primary.btn-submit-step:not(.hide),
html body #main-column form > #btnFinishCheckout.btn-submit-step:not(.hide),
html body #main-column form > .submit-button-container > #btnFinishCheckout.btn-submit-step:not(.hide) {
  float: none !important;
  clear: both !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: 352px !important;
  height: 40px !important;
  min-height: 40px !important;
  margin: 16px auto 0 !important;
  padding: 0 16px !important;
  border: 2px solid #238482 !important;
  border-radius: 24px !important;
  background: #238482 !important;
  background-color: #238482 !important;
  box-shadow: none !important;
  color: #fff !important;
  text-transform: uppercase !important;
}

html body #main-column form > .btn-primary.btn-submit-step:not(.hide):hover,
html body #main-column form > #btnFinishCheckout.btn-submit-step:not(.hide):hover,
html body #main-column form > .submit-button-container > #btnFinishCheckout.btn-submit-step:not(.hide):hover {
  border-color: #1e7270 !important;
  background: #1e7270 !important;
  background-color: #1e7270 !important;
}

html body #main-column form > .btn-primary.btn-submit-step:not(.hide):not(#btnFinishCheckout),
html body #main-column form > .btn-primary.btn-submit-step:not(.hide):not(#btnFinishCheckout) span {
  font-family: Raleway, sans-serif !important;
  font-size: 16px !important;
  font-weight: 600 !important;
  color: #fff !important;
}

/* Continuar comprando (renderizado pelo NubeSDK) */
html body #main-column [data-slot] [data-component-id="yamuna-continue-shopping"] {
  position: static !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  box-sizing: border-box !important;
  width: 100% !important;
  height: 40px !important;
  min-height: 40px !important;
  margin: 0 !important;
  padding: 0 16px !important;
  border: 2px solid #a31460 !important;
  border-radius: 24px !important;
  background: transparent !important;
  background-color: transparent !important;
  box-shadow: none !important;
  color: #a31460 !important;
  font-family: Raleway, sans-serif !important;
  font-size: 16px !important;
  font-weight: 500 !important;
  line-height: 1 !important;
  text-align: center !important;
  text-decoration: none !important;
  text-transform: uppercase !important;
  opacity: 1 !important;
  cursor: pointer !important;
}

html body #main-column [data-slot] [data-component-id="yamuna-continue-shopping"]:hover {
  opacity: 0.9 !important;
}

/* Pagamento: slot  irmo direto do #btnFinishCheckout.
   Entrega: slot fica dentro do painel de nota fiscal, que  "achatado". */
html body #main-column form:has(> #nube-sdk-slot-after_payment_options),
html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) {
  display: flex !important;
  flex-wrap: wrap !important;
  justify-content: center !important;
  column-gap: 16px !important;
  row-gap: 0 !important;
}

html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > .panel:has(> #nube-sdk-slot-after_billing_form) {
  display: contents !important;
}

html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > *,
html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > *,
html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > .panel:has(> #nube-sdk-slot-after_billing_form) > * {
  flex: 0 0 100% !important;
  max-width: 100% !important;
  min-width: 0 !important;
}

html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > #nube-sdk-slot-after_payment_options,
html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > .panel > #nube-sdk-slot-after_billing_form,
html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > .btn-submit-step:not(.hide),
html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > .btn-submit-step:not(.hide) {
  order: 10 !important;
  flex: 1 1 0 !important;
  max-width: 352px !important;
  margin: 16px 0 0 !important;
}

html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > #afterButtonChangeStep,
html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > #afterButtonChangeStep {
  order: 11 !important;
}

/* Mobile (<768): igual ao /comprar  Finalizar em cima, Continuar embaixo, largura total */
@media (max-width: 767px) {
  html body #main-column form > .btn-primary.btn-submit-step:not(.hide),
  html body #main-column form > #btnFinishCheckout.btn-submit-step:not(.hide),
  html body #main-column form > .submit-button-container > #btnFinishCheckout.btn-submit-step:not(.hide) {
    max-width: 100% !important;
  }

  /* Checkout envolve o boto em .submit-button-container (s vezes sticky) no mobile */
  html body #main-column form > .submit-button-container > #btnFinishCheckout.btn-submit-step:not(.hide) {
    margin: 0 !important;
  }

  html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > .submit-button-container {
    order: 10 !important;
  }

  html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > .submit-button-container:not(.submit-button-container--sticky) {
    padding-bottom: 0 !important;
  }

  html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > .btn-submit-step:not(.hide),
  html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > .btn-submit-step:not(.hide) {
    flex: 0 0 100% !important;
    max-width: 100% !important;
  }

  html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > #nube-sdk-slot-after_payment_options,
  html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > .panel > #nube-sdk-slot-after_billing_form {
    order: 11 !important;
    flex: 0 0 100% !important;
    max-width: 100% !important;
    margin: 12px 0 0 !important;
  }

  html body #main-column form:has(> #nube-sdk-slot-after_payment_options) > #afterButtonChangeStep,
  html body #main-column form:has(> .panel > #nube-sdk-slot-after_billing_form) > #afterButtonChangeStep {
    order: 12 !important;
  }
}

/* ==========================================================================
   069  Boleto bancrio: respiro entre o texto informativo e o campo CPF/CNPJ
   (markup do iframe checkout-security, que tambm carrega este CSS)
   ========================================================================== */
html body .radio-content .offline-desc-container {
  margin-bottom: 16px !important;
}

/* ==========================================================================
   082  Cupom de desconto (card polido, padro checkout Yamuna)
   ========================================================================== */
html body #secondary-column .summary-details.panel,
html body #secondary-column .summary-details.panel.p-none,
html body #secondary-column [data-testid="cart-details-desktop"],
html body #main-row #secondary-column .summary-details {
  display: flex !important;
  flex-direction: column !important;
  gap: 0 !important;
  background: transparent !important;
  border: 0 !important;
  box-shadow: none !important;
  padding: 0 !important;
  overflow: visible !important;
}

html body #secondary-column .summary-details > .table.table-scrollable,
html body #main-row #secondary-column .summary-details > .table.table-scrollable {
  order: 1 !important;
  margin: 0 !important;
  padding: 16px !important;
  background: #fff !important;
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  border-bottom: 0 !important;
  border-radius: 10px 10px 0 0 !important;
  box-sizing: border-box !important;
}

html body #secondary-column .summary-details > .table-subtotal,
html body #main-row #secondary-column .summary-details > .table-subtotal,
html body #secondary-column [data-testid="cart-total-container"] {
  order: 2 !important;
  margin: 0 !important;
  padding: 8px 16px 16px !important;
  background: #fff !important;
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  border-top: 0 !important;
  border-radius: 0 0 10px 10px !important;
  box-shadow: 0 1px 3px -1px rgba(0, 0, 0, 0.04) !important;
  box-sizing: border-box !important;
}

html body .summary-details .summary-coupon,
html body #secondary-column .summary-coupon,
html body #secondary-column .summary-details .summary-coupon,
html body #main-row #secondary-column .summary-coupon,
html body #main-row #secondary-column .summary-details .summary-coupon,
html body #main-row #secondary-column .summary-details.panel .summary-coupon,
html body #main-row #secondary-column [data-testid="cart-details-desktop"] .summary-coupon {
  order: -1 !important;
  display: flex !important;
  flex-direction: column !important;
  align-items: stretch !important;
  visibility: visible !important;
  height: auto !important;
  max-height: none !important;
  min-height: 0 !important;
  margin: 0 0 12px !important;
  padding: 16px !important;
  overflow: visible !important;
  opacity: 1 !important;
  width: 100% !important;
  max-width: 100% !important;
  box-sizing: border-box !important;
  background: #fff !important;
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  border-radius: 10px !important;
  box-shadow: 0 1px 3px -1px rgba(0, 0, 0, 0.04) !important;
  float: none !important;
  position: relative !important;
  font-family: Raleway, sans-serif !important;
}

html body #secondary-column .summary-coupon.d-md-none {
  display: none !important;
}

/* Ttulo */
html body #secondary-column .summary-coupon::before {
  content: "Cupom de desconto" !important;
  display: block !important;
  margin: 0 0 12px !important;
  padding: 0 0 0 24px !important;
  color: #222 !important;
  font-family: Raleway, sans-serif !important;
  font-size: 15px !important;
  font-weight: 700 !important;
  line-height: 1.3 !important;
  letter-spacing: 0 !important;
  pointer-events: none !important;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23a31460' d='M21.41 11.58l-9-9A2 2 0 0 0 11 2H4a2 2 0 0 0-2 2v7a2 2 0 0 0 .59 1.42l9 9a2 2 0 0 0 2.82 0l7-7a2 2 0 0 0 0-2.84zM5.5 7A1.5 1.5 0 1 1 7 5.5 1.5 1.5 0 0 1 5.5 7z'/%3E%3C/svg%3E") !important;
  background-repeat: no-repeat !important;
  background-position: left center !important;
  background-size: 16px 16px !important;
}

/* Reset pill nativo do tema */
html body #secondary-column .summary-coupon .box-discount-coupon-applied,
html body #secondary-column .summary-coupon .box-discount-coupon {
  width: 100% !important;
  max-width: 100% !important;
  min-width: 0 !important;
  float: none !important;
  background: transparent !important;
  border: 0 !important;
  border-radius: 0 !important;
  box-shadow: none !important;
  height: auto !important;
  min-height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  color: inherit !important;
  line-height: normal !important;
}

html body #secondary-column .summary-coupon .row,
html body #secondary-column .summary-coupon [class*="col-"] {
  margin: 0 !important;
  padding: 0 !important;
  width: 100% !important;
  max-width: 100% !important;
  float: none !important;
}

/*  Estado fechado: j mostra campo + APLICAR (abre form nativo no clique)  */
html body #main-row #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied,
html body #main-row #secondary-column .summary-coupon:has(.text-pre-line) > .box-discount-coupon-applied,
html body #secondary-column .summary-coupon:has(.text-pre-line) > .box-discount-coupon-applied,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied {
  display: block !important;
  position: relative !important;
  width: 100% !important;
  max-width: 100% !important;
  height: auto !important;
  min-height: 44px !important;
  overflow: visible !important;
  clip: auto !important;
  clip-path: none !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  visibility: visible !important;
  opacity: 1 !important;
  float: none !important;
}

html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied .row,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied [class*="col-"] {
  display: block !important;
  width: 100% !important;
  margin: 0 !important;
  padding: 0 !important;
  float: none !important;
}

html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied .btn-link,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied [role="button"] {
  display: flex !important;
  flex-direction: row !important;
  flex-wrap: nowrap !important;
  align-items: center !important;
  justify-content: flex-start !important;
  gap: 10px !important;
  width: 100% !important;
  height: 44px !important;
  min-height: 44px !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 0 !important;
  background: transparent !important;
  color: #8a8a8a !important;
  font-family: Raleway, sans-serif !important;
  font-size: 0 !important;
  font-weight: 500 !important;
  line-height: 1 !important;
  text-align: left !important;
  text-decoration: none !important;
  box-sizing: border-box !important;
  cursor: pointer !important;
  overflow: visible !important;
  white-space: nowrap !important;
}

/* Fake input */
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied .btn-link::before,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied [role="button"]::before {
  content: "Adicionar cupom" !important;
  display: flex !important;
  align-items: center !important;
  flex: 1 1 auto !important;
  min-width: 0 !important;
  height: 44px !important;
  min-height: 44px !important;
  max-height: 44px !important;
  margin: 0 !important;
  padding: 0 14px !important;
  border: 1px solid #d9d4dc !important;
  border-radius: 8px !important;
  background: #fff !important;
  color: #8a8a8a !important;
  font-family: Raleway, sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
  line-height: 1 !important;
  letter-spacing: 0 !important;
  text-transform: none !important;
  box-sizing: border-box !important;
}

/* Fake APLICAR  visvel desde o incio */
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied .btn-link::after,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied [role="button"]::after {
  content: "APLICAR" !important;
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  flex: 0 0 auto !important;
  min-width: 112px !important;
  height: 44px !important;
  min-height: 44px !important;
  max-height: 44px !important;
  margin: 0 !important;
  padding: 0 18px !important;
  border: 0 !important;
  border-radius: 8px !important;
  background: #a31460 !important;
  color: #fff !important;
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  letter-spacing: 0.05em !important;
  text-transform: uppercase !important;
  line-height: 1 !important;
  box-sizing: border-box !important;
}

html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .coupon-icon,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .text-pre-line,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied span,
html body #secondary-column .summary-coupon:not(:has(form)):not(:has(#removeCoupon)) .box-discount-coupon-applied svg {
  display: none !important;
}

/* Remove hint "Experimente..." (legado do fix.css) */
html body #secondary-column .summary-coupon::after,
html body #main-row #secondary-column .summary-coupon::after,
html body #secondary-column .summary-coupon:has(form)::after {
  content: none !important;
  display: none !important;
  margin: 0 !important;
  padding: 0 !important;
  height: 0 !important;
  font-size: 0 !important;
}

/*  Estado formulrio: input + APLICAR (2 IDs para vencer hide legado)  */
html body #main-row #secondary-column .summary-coupon form {
  display: block !important;
  width: 100% !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  background: transparent !important;
  visibility: visible !important;
  height: auto !important;
  overflow: visible !important;
}

html body #main-row #secondary-column .summary-coupon .box-discount-coupon,
html body #main-row #secondary-column .summary-coupon .box-discount-coupon.anin-flip-active,
html body #main-row #secondary-column .summary-coupon .box-discount-coupon.anin-flip-inactive,
html body #main-row #secondary-column .summary-coupon form > .box-discount-coupon {
  display: grid !important;
  grid-template-columns: minmax(0, 1fr) auto !important;
  grid-template-rows: auto auto !important;
  align-items: center !important;
  column-gap: 8px !important;
  row-gap: 8px !important;
  visibility: visible !important;
  opacity: 1 !important;
  width: 100% !important;
  max-width: 100% !important;
  height: auto !important;
  min-height: 44px !important;
  max-height: none !important;
  margin: 0 !important;
  padding: 0 !important;
  transform: none !important;
  overflow: visible !important;
  position: relative !important;
  float: none !important;
  background: transparent !important;
  border: 0 !important;
  box-shadow: none !important;
  flex-wrap: unset !important;
  flex-direction: unset !important;
}

/* form-group some no grid pai: input e boto na 1 linha, erro na 2 */
html body #main-row #secondary-column .summary-coupon .box-discount-coupon .form-group {
  display: contents !important;
}

html body #main-row #secondary-column .summary-coupon .has-float-label {
  display: flex !important;
  align-items: center !important;
  visibility: visible !important;
  grid-column: 1 !important;
  grid-row: 1 !important;
  position: relative !important;
  min-width: 0 !important;
  width: 100% !important;
  max-width: 100% !important;
  height: 44px !important;
  min-height: 44px !important;
  max-height: 44px !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  flex: unset !important;
  order: unset !important;
}

/* Label nativo some; overlay "Adicionar cupom" quando vazio e sem foco */
html body #main-row #secondary-column .summary-coupon .has-float-label .input-label,
html body #main-row #secondary-column .summary-coupon label.input-label {
  display: flex !important;
  align-items: center !important;
  position: absolute !important;
  left: 14px !important;
  top: 0 !important;
  bottom: 0 !important;
  right: 14px !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  background: transparent !important;
  color: #8a8a8a !important;
  font-family: Raleway, sans-serif !important;
  font-size: 0 !important;
  font-weight: 500 !important;
  line-height: 1 !important;
  transform: none !important;
  pointer-events: none !important;
  z-index: 2 !important;
  opacity: 1 !important;
  visibility: visible !important;
  white-space: nowrap !important;
  overflow: hidden !important;
  width: auto !important;
  height: auto !important;
}

html body #main-row #secondary-column .summary-coupon .has-float-label .input-label::after,
html body #main-row #secondary-column .summary-coupon label.input-label::after {
  content: "Adicionar cupom" !important;
  font-size: 14px !important;
  color: #8a8a8a !important;
  font-family: Raleway, sans-serif !important;
  font-weight: 500 !important;
  white-space: nowrap !important;
}

/* Esconde overlay ao focar OU quando h texto digitado (:placeholder-shown exige placeholder no-vazio  JS garante " ") */
html body #main-row #secondary-column .summary-coupon .has-float-label:focus-within .input-label,
html body #main-row #secondary-column .summary-coupon .has-float-label:has(input:not(:placeholder-shown)) .input-label {
  opacity: 0 !important;
  visibility: hidden !important;
}

/* Placeholder nativo invisvel; o texto vem do label::after */
html body #main-row #secondary-column .summary-coupon input#coupon::placeholder,
html body #main-row #secondary-column .summary-coupon input[name="coupon"]::placeholder {
  color: transparent !important;
  opacity: 0 !important;
}

html body #main-row #secondary-column .summary-coupon input#coupon,
html body #main-row #secondary-column .summary-coupon input[name="coupon"],
html body #main-row #secondary-column .summary-coupon input[data-testid="coupon"] {
  display: block !important;
  visibility: visible !important;
  width: 100% !important;
  height: 44px !important;
  min-height: 44px !important;
  max-height: 44px !important;
  margin: 0 !important;
  padding: 0 12px !important;
  border: 1px solid #d9d4dc !important;
  border-radius: 8px !important;
  background: #fff !important;
  color: #222 !important;
  font-family: Raleway, sans-serif !important;
  /* 16px evita zoom iOS no focus (que quebrava o layout) */
  font-size: 16px !important;
  font-weight: 500 !important;
  line-height: 42px !important;
  box-sizing: border-box !important;
  outline: none !important;
  box-shadow: none !important;
  position: relative !important;
  z-index: 1 !important;
  opacity: 1 !important;
  -webkit-appearance: none !important;
  appearance: none !important;
  transform: none !important;
}

html body #main-row #secondary-column .summary-coupon input#coupon:focus,
html body #main-row #secondary-column .summary-coupon input[name="coupon"]:focus {
  border-color: #a31460 !important;
  border-width: 1px !important;
  outline: none !important;
  box-shadow: none !important;
}

html body #main-row #secondary-column .summary-coupon button[test-id="apply-coupon-btn"],
html body #main-row #secondary-column .summary-coupon .box-discount-coupon button {
  display: inline-flex !important;
  visibility: visible !important;
  grid-column: 2 !important;
  grid-row: 1 !important;
  align-items: center !important;
  justify-content: center !important;
  align-self: center !important;
  position: relative !important;
  top: auto !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  flex: unset !important;
  order: unset !important;
  min-width: 96px !important;
  width: auto !important;
  max-width: none !important;
  height: 44px !important;
  min-height: 44px !important;
  max-height: 44px !important;
  margin: 0 !important;
  padding: 0 14px !important;
  border: 0 !important;
  border-radius: 8px !important;
  background: #a31460 !important;
  background-color: #a31460 !important;
  color: #fff !important;
  font-family: Raleway, sans-serif !important;
  font-size: 0 !important;
  font-weight: 700 !important;
  letter-spacing: 0.04em !important;
  text-transform: uppercase !important;
  line-height: 1 !important;
  cursor: pointer !important;
  box-shadow: none !important;
  opacity: 1 !important;
  float: none !important;
}

html body #main-row #secondary-column .summary-coupon button[test-id="apply-coupon-btn"] svg,
html body #main-row #secondary-column .summary-coupon .box-discount-coupon button svg {
  display: none !important;
}

html body #main-row #secondary-column .summary-coupon button[test-id="apply-coupon-btn"]::after,
html body #main-row #secondary-column .summary-coupon .box-discount-coupon button::after {
  content: "APLICAR" !important;
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  letter-spacing: 0.05em !important;
  color: #fff !important;
  text-transform: uppercase !important;
}

html body #main-row #secondary-column .summary-coupon button[test-id="apply-coupon-btn"]:hover,
html body #main-row #secondary-column .summary-coupon .box-discount-coupon button:hover {
  background: #8c1052 !important;
  background-color: #8c1052 !important;
}

/* Erro abaixo da linha input + APLICAR */
html body #main-row #secondary-column .summary-coupon .box-discount-coupon .error,
html body #main-row #secondary-column .summary-coupon .form-group .error,
html body #main-row #secondary-column .summary-coupon .error:not(:empty) {
  display: block !important;
  grid-column: 1 / -1 !important;
  grid-row: 2 !important;
  width: 100% !important;
  max-width: 100% !important;
  margin: 0 !important;
  padding: 0 !important;
  color: #c62828 !important;
  font-family: Raleway, sans-serif !important;
  font-size: 12px !important;
  font-weight: 500 !important;
  line-height: 1.4 !important;
  box-sizing: border-box !important;
  flex: unset !important;
  order: unset !important;
}

html body #main-row #secondary-column .summary-coupon .error:empty {
  display: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
}

/*  Estado aplicado: input+APLICAR (visual) em cima; sucesso embaixo  */
html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) {
  display: flex !important;
  flex-direction: column !important;
  gap: 10px !important;
}

html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) > .box-discount-coupon-applied {
  display: grid !important;
  grid-template-columns: 1fr auto !important;
  grid-template-rows: auto auto !important;
  align-items: center !important;
  column-gap: 10px !important;
  row-gap: 10px !important;
  width: 100% !important;
  max-width: 100% !important;
  min-height: 0 !important;
  height: auto !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 0 !important;
  background: transparent !important;
  box-sizing: border-box !important;
  visibility: visible !important;
  color: #1b5e20 !important;
}

/* Fake input acima do status aplicado */
html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) > .box-discount-coupon-applied::before {
  content: "Adicionar cupom" !important;
  grid-column: 1 !important;
  grid-row: 1 !important;
  display: flex !important;
  align-items: center !important;
  height: 44px !important;
  min-height: 44px !important;
  padding: 0 14px !important;
  border: 1px solid #d9d4dc !important;
  border-radius: 8px !important;
  background: #fff !important;
  color: #8a8a8a !important;
  font-family: Raleway, sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
  line-height: 1 !important;
  box-sizing: border-box !important;
}

/* Fake APLICAR acima do status aplicado */
html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) > .box-discount-coupon-applied::after {
  content: "APLICAR" !important;
  grid-column: 2 !important;
  grid-row: 1 !important;
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  min-width: 96px !important;
  height: 44px !important;
  min-height: 44px !important;
  padding: 0 14px !important;
  border: 0 !important;
  border-radius: 8px !important;
  background: #a31460 !important;
  color: #fff !important;
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  letter-spacing: 0.05em !important;
  text-transform: uppercase !important;
  line-height: 1 !important;
  box-sizing: border-box !important;
}

/* Barra verde de sucesso abaixo */
html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) .row {
  grid-column: 1 / -1 !important;
  grid-row: 2 !important;
  display: flex !important;
  align-items: center !important;
  justify-content: space-between !important;
  gap: 12px !important;
  width: 100% !important;
  max-width: 100% !important;
  margin: 0 !important;
  padding: 10px 14px !important;
  border: 1px solid #c8e6c9 !important;
  border-radius: 8px !important;
  background: #eef7ef !important;
  box-sizing: border-box !important;
  float: none !important;
}

html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) [class*="col-"] {
  display: contents !important;
  float: none !important;
  width: auto !important;
  max-width: none !important;
  margin: 0 !important;
  padding: 0 !important;
}

html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) [data-testid="coupon-code"] {
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-weight: 600 !important;
  color: #1b5e20 !important;
  line-height: 1.35 !important;
}

html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) .coupon-icon {
  display: none !important;
}

html body #main-row #secondary-column .summary-coupon #removeCoupon,
html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) a.btn-link,
html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) .btn-link {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  flex: 0 0 auto !important;
  height: auto !important;
  min-height: 0 !important;
  margin: 0 0 0 auto !important;
  padding: 0 !important;
  border: 0 !important;
  background: transparent !important;
  color: #1b5e20 !important;
  font-size: 0 !important;
  line-height: 1 !important;
  text-decoration: none !important;
  cursor: pointer !important;
  float: none !important;
  visibility: visible !important;
}

html body #main-row #secondary-column .summary-coupon #removeCoupon svg,
html body #main-row #secondary-column .summary-coupon:has(#removeCoupon) .btn-link svg {
  display: none !important;
}

html body #main-row #secondary-column .summary-coupon #removeCoupon::after {
  content: "Remover" !important;
  font-family: Raleway, sans-serif !important;
  font-size: 13px !important;
  font-weight: 600 !important;
  color: #1b5e20 !important;
  text-decoration: underline !important;
  letter-spacing: 0 !important;
  text-transform: none !important;
}

/* Se form e aplicado coexistirem: form em cima, status embaixo */
html body #main-row #secondary-column .summary-coupon:has(form):has(#removeCoupon) form {
  order: 1 !important;
}
html body #main-row #secondary-column .summary-coupon:has(form):has(#removeCoupon) > .box-discount-coupon-applied {
  order: 2 !important;
}
html body #main-row #secondary-column .summary-coupon:has(form):has(#removeCoupon) > .box-discount-coupon-applied::before,
html body #main-row #secondary-column .summary-coupon:has(form):has(#removeCoupon) > .box-discount-coupon-applied::after {
  display: none !important;
  content: none !important;
}

/* Neutraliza hide legado (se ainda existir em cache/CSS antigo) */
html body #main-row #secondary-column .summary-coupon .box-discount-coupon {
  display: flex !important;
  visibility: visible !important;
  height: auto !important;
  max-height: none !important;
  overflow: visible !important;
  opacity: 1 !important;
}

/* =============================================================================
 * Cenrio 074: Aumentar fonte para 14px, fonte Raleway e cor para #0000 (#000000)
 * Alvo: nmero do pedido (/checkout/v3/success/) "Pedido: #..."
 * ============================================================================= */
html body .order-id-number:not(#yamuna-074a):not(#yamuna-074b):not(#yamuna-074c),
html body .order-id-number:not(#yamuna-074a):not(#yamuna-074b):not(#yamuna-074c) *,
html body [test-id="order-id"]:not(#yamuna-074a):not(#yamuna-074b):not(#yamuna-074c),
html body [test-id="order-id"]:not(#yamuna-074a):not(#yamuna-074b):not(#yamuna-074c) *,
html body .success-order-id .order-id-number:not(#yamuna-074a):not(#yamuna-074b):not(#yamuna-074c),
html body .Success-order-id .order-id-number:not(#yamuna-074a):not(#yamuna-074b):not(#yamuna-074c) {
  font-family: "Raleway", sans-serif !important;
  font-size: 14px !important;
  color: #000 !important;
  color: #000000 !important;
}

/* =============================================================================
 * Cenrio 078: Na tela de pedido concludo, o progresso deve ser Pagamento
 * ============================================================================= */
/* Breadcrumb nativo (#breadcrumb) */
body.yamuna-step-pagamento #breadcrumb ul.breadcrumb-timeline > li.breadcrumb-timeline-line,
html:has(.status-content) body #breadcrumb ul.breadcrumb-timeline > li.breadcrumb-timeline-line,
html:has(.status.panel) body #breadcrumb ul.breadcrumb-timeline > li.breadcrumb-timeline-line,
html:has(.success-order-id) body #breadcrumb ul.breadcrumb-timeline > li.breadcrumb-timeline-line,
html:has([test-id="order-id"]) body #breadcrumb ul.breadcrumb-timeline > li.breadcrumb-timeline-line {
  background-color: #a31460 !important;
  background: #a31460 !important;
}

body.yamuna-step-pagamento #breadcrumb li:nth-child(3) .breadcrumb-timeline-item,
body.yamuna-step-pagamento #breadcrumb li:nth-child(5) .breadcrumb-timeline-item,
html:has(.status-content) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item,
html:has(.status-content) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item,
html:has(.status.panel) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item,
html:has(.status.panel) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item,
html:has(.success-order-id) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item,
html:has(.success-order-id) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item,
html:has([test-id="order-id"]) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item,
html:has([test-id="order-id"]) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item {
  color: #000000 !important;
}

body.yamuna-step-pagamento #breadcrumb li:nth-child(3) .breadcrumb-timeline-item-icon svg path,
body.yamuna-step-pagamento #breadcrumb li:nth-child(5) .breadcrumb-timeline-item-icon svg path,
html:has(.status-content) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item-icon svg path,
html:has(.status-content) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item-icon svg path,
html:has(.status.panel) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item-icon svg path,
html:has(.status.panel) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item-icon svg path,
html:has(.success-order-id) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item-icon svg path,
html:has(.success-order-id) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item-icon svg path,
html:has([test-id="order-id"]) body #breadcrumb li:nth-child(3) .breadcrumb-timeline-item-icon svg path,
html:has([test-id="order-id"]) body #breadcrumb li:nth-child(5) .breadcrumb-timeline-item-icon svg path {
  fill: #a31460 !important;
  stroke: #a31460 !important;
}

/* NubeSDK custom steps em #nube-sdk-slot-after_header */
/* Linha 2 (entre Entrega e Pagamento) */
body.yamuna-step-pagamento #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(4),
html:has(.status-content) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(4),
html:has(.status.panel) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(4),
html:has(.success-order-id) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(4),
html:has([test-id="order-id"]) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(4) {
  background: #a31460 !important;
  background-color: #a31460 !important;
}

/* Coluna 3 (Entrega) -> concluda: crculo branco com borda #a31460 */
body.yamuna-step-pagamento #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) > .nube-box:first-child,
html:has(.status-content) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) > .nube-box:first-child,
html:has(.status.panel) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) > .nube-box:first-child,
html:has(.success-order-id) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) > .nube-box:first-child,
html:has([test-id="order-id"]) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) > .nube-box:first-child {
  background: #ffffff !important;
  border-color: #a31460 !important;
}

/* cone de Entrega: quando concludo, deve ser vinho #a31460 */
body.yamuna-step-pagamento #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) img,
html:has(.status-content) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) img,
html:has(.status.panel) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) img,
html:has(.success-order-id) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) img,
html:has([test-id="order-id"]) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(3) img {
  filter: brightness(0) saturate(100%) invert(14%) sepia(87%) saturate(3500%) hue-rotate(308deg) brightness(85%) contrast(97%) !important;
}

/* Coluna 5 (Pagamento) -> ativo (current): crculo preenchido #a31460 */
body.yamuna-step-pagamento #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) > .nube-box:first-child,
html:has(.status-content) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) > .nube-box:first-child,
html:has(.status.panel) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) > .nube-box:first-child,
html:has(.success-order-id) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) > .nube-box:first-child,
html:has([test-id="order-id"]) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) > .nube-box:first-child {
  background: #a31460 !important;
  border-color: #a31460 !important;
}

/* cone de Pagamento: quando ativo em crculo #a31460, deve ser branco puro */
body.yamuna-step-pagamento #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) img,
html:has(.status-content) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) img,
html:has(.status.panel) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) img,
html:has(.success-order-id) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) img,
html:has([test-id="order-id"]) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) img {
  filter: brightness(0) invert(1) !important;
}

/* Texto de Pagamento: cor vinho #a31460 */
body.yamuna-step-pagamento #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) .nube-text,
body.yamuna-step-pagamento #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) [class*="nube-text"],
html:has(.status-content) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) .nube-text,
html:has(.status-content) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) [class*="nube-text"],
html:has(.status.panel) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) .nube-text,
html:has(.status.panel) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) [class*="nube-text"],
html:has(.success-order-id) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) .nube-text,
html:has(.success-order-id) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) [class*="nube-text"],
html:has([test-id="order-id"]) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) .nube-text,
html:has([test-id="order-id"]) body #nube-sdk-slot-after_header > .nube-box > .nube-box:nth-child(5) [class*="nube-text"] {
  color: #000000 !important;
}

/* =============================================================================
 * CenÃ¡rio 079/080: EndereÃ§os e opÃ§Ãµes de frete â€” Roboto 14px, bg #fff, check verde
 * ============================================================================= */

/* ---- 1. Lista expandida de endereÃ§os (DomicÃ­lio de entrega) ---- */
html body .list-picker *,
html body .list-picker-content *,
html body .panel-address-list *,
html body .saved-addresses * {
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
}

html body .list-picker li,
html body .panel-address-list .radio,
html body .panel-address-list .radio-option {
  background: #ffffff !important;
  background-color: #ffffff !important;
  border-radius: 10px !important;
  margin-bottom: 12px !important;
  color: #212529 !important;
}

html body .list-picker li.active *,
html body .panel-address-list .radio.active *,
html body .panel-address-list .radio-option.active *,
html body .saved-addresses .radio.active * {
  color: #212529 !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
}

html body .list-picker li.active,
html body .panel-address-list .radio.active,
html body .panel-address-list .radio-option.active {
  background: #ffffff !important;
  background-color: #ffffff !important;
  border: 2px solid #a31460 !important;
  border-radius: 10px !important;
}

html body .list-picker li.active .checked,
html body .list-picker li.active svg.checked path,
html body .list-picker li.active svg.checked circle,
html body .panel-address-list .radio.active .checked,
html body .panel-address-list .radio.active svg.checked path,
html body .saved-addresses .radio.active .checked {
  fill: #238482 !important;
  color: #238482 !important;
  stroke: #238482 !important;
}

/* ---- 2. Desativar sticky nos tÃ­tulos para NÃƒO descerem com o scroll ---- */
html body #main-column .panel-header-sticky,
html body #main-column .panel-header,
html body .panel-header-sticky,
html body h3.panel-header-sticky,
html body h4.panel-header-sticky,
html body [class*="panel-header-sticky"] {
  position: static !important;
  top: auto !important;
  bottom: auto !important;
  transform: none !important;
  background: transparent !important;
  background-color: transparent !important;
}

/* ---- 3. Wrapper externo (.panel.panel-with-header) do card de endereÃ§o consolidado ---- */
html body .panel.panel-with-header:has(> .saved-address-box-review-block),
html body #main-column .panel.panel-with-header:has(> .saved-address-box-review-block),
html body #main-column .panel.panel-with-header:has(.saved-address-box-review-block),
html body #main-column > .panel:has(.saved-address-box-review-block) {
  padding: 0 !important;
  background: transparent !important;
  background-color: transparent !important;
  box-shadow: none !important;
  border: none !important;
}

/* ---- 4. Box de endereÃ§o consolidado (saved-address-box-review-block) ---- */
html body .saved-address-box-review-block,
html body .panel.saved-address-box-review-block,
html body #main-column .saved-address-box-review-block,
html body #main-column .panel.saved-address-box-review-block,
html body [class*="saved-address-box-review-block"] {
  background: #ffffff !important;
  background-color: #ffffff !important;
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  border-radius: 10px !important;
  box-shadow: 0 1px 3px -1px rgba(0, 0, 0, 0.04) !important;
  display: flex !important;
  flex-direction: row !important;
  align-items: center !important;
  justify-content: space-between !important;
  gap: 16px !important;
  padding: 16px 20px !important;
  overflow: visible !important;
  box-sizing: border-box !important;
}

html body .saved-address-box-review-block .saved-address-box-review-block-content,
html body #main-column .saved-address-box-review-block .saved-address-box-review-block-content {
  display: flex !important;
  flex-direction: row !important;
  align-items: center !important;
  gap: 12px !important;
  flex: 1 1 auto !important;
  min-width: 0 !important;
  background: transparent !important;
  border: none !important;
  box-shadow: none !important;
  padding: 0 !important;
  margin: 0 !important;
}

html body .saved-address-box-review-block .saved-address-box-review-block-btn,
html body #main-column .saved-address-box-review-block .saved-address-box-review-block-btn {
  flex: 0 0 auto !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  align-self: center !important;
  margin: 0 !important;
  padding: 0 !important;
  background: transparent !important;
  border: none !important;
}

html body .saved-address-box-review-block .btn-link,
html body .saved-address-box-review-block a {
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
  color: #a31460 !important;
  background: transparent !important;
  border: none !important;
  padding: 6px 12px !important;
  text-decoration: none !important;
  white-space: nowrap !important;
  cursor: pointer !important;
}

/* ---- 5. Div da img2 / img4: Card de endereÃ§o selecionado (formless-address) Desktop e Mobile ---- */
html body [data-testid="shipping_formless"],
html body #main-column [data-testid="shipping_formless"],
html body .form-group[data-testid="shipping_formless"],
html body #main-column .form-group[data-testid="shipping_formless"] {
  background: transparent !important;
  background-color: transparent !important;
  padding: 0 !important;
  margin: 0 0 18px 0 !important;
  border: none !important;
  box-shadow: none !important;
  height: auto !important;
  min-height: unset !important;
}

html body .formless-address,
html body #main-column .formless-address,
html body .form-control.formless-address,
html body #main-column .form-control.formless-address,
html body [data-testid="shipping_formless"] .form-control,
html body [data-testid="shipping_formless"] .formless-address {
  height: auto !important;
  min-height: unset !important;
  max-height: none !important;
  background: #ffffff !important;
  background-color: #ffffff !important;
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  border-radius: 10px !important;
  box-shadow: 0 1px 3px -1px rgba(0, 0, 0, 0.04) !important;
  padding: 16px 20px !important;
  display: flex !important;
  flex-direction: row !important;
  align-items: center !important;
  justify-content: space-between !important;
  box-sizing: border-box !important;
  margin: 0 !important;
  overflow: visible !important;
}

html body #main-column .formless-address .review-block.detailed-item,
html body .formless-address .review-block.detailed-item {
  display: flex !important;
  flex-direction: row !important;
  align-items: center !important;
  justify-content: space-between !important;
  width: 100% !important;
  padding: 0 !important;
  margin: 0 !important;
  background: transparent !important;
  border: none !important;
  gap: 12px !important;
}

html body #main-column .formless-address .center-area,
html body .formless-address .center-area {
  flex: 1 1 auto !important;
  padding: 0 12px !important;
}

html body #main-column .formless-address .content p,
html body .formless-address .content p {
  margin: 0 0 2px 0 !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  line-height: 1.4 !important;
  color: #212529 !important;
}

html body #main-column .formless-address .user-detail-icon-area,
html body .formless-address .user-detail-icon-area {
  flex: 0 0 auto !important;
  display: flex !important;
  align-items: center !important;
}

html body #main-column .formless-address .change-button-area,
html body .formless-address .change-button-area {
  flex: 0 0 auto !important;
  display: flex !important;
  align-items: center !important;
}

html body #main-column .formless-address .change-button-area a,
html body .formless-address .change-button-area a,
html body #main-column .formless-address .change-button-area button,
html body .formless-address .change-button-area button,
html body #main-column .formless-address .btn-link,
html body .formless-address .btn-link {
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
  color: #a31460 !important;
  background: transparent !important;
  border: none !important;
  padding: 4px 8px !important;
  cursor: pointer !important;
  text-decoration: none !important;
  white-space: nowrap !important;
}

/* ---- 6. OpÃ§Ãµes de frete ---- */
html body .shipping-option,
html body .radio.shipping-option,
html body .radio-option.shipping-option {
  background: #ffffff !important;
  background-color: #ffffff !important;
  border-radius: 10px !important;
  margin-bottom: 12px !important;
}

html body .shipping-option .label *,
html body .shipping-option span,
html body .shipping-option p,
html body .radio.shipping-option .label *,
html body .radio.shipping-option span,
html body .radio.shipping-option p {
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
}

html body .shipping-option.active,
html body .radio.shipping-option.active {
  background: #ffffff !important;
  background-color: #ffffff !important;
  border: 2px solid #a31460 !important;
  border-radius: 10px !important;
}

html body .shipping-option.active .selector::before,
html body .radio.shipping-option.active .selector::before,
html body .shipping-option input:checked + .selector::before,
html body .radio.shipping-option input:checked + .selector::before {
  background: #238482 !important;
  background-color: #238482 !important;
  border-color: #238482 !important;
}

/* ---- 7. REMOVER OS 2 BOTÃ•ES DO FLUXO DE CEP / NOVO ENDEREÃ‡O ---- */
html body [data-testid="btnSubmitZipCode"],
html body #main-column [data-testid="btnSubmitZipCode"],
html body div[data-testid="btnSubmitZipCode"],
html body .btn-submit-step[data-testid="btnSubmitZipCode"],
html body #shipping-section [data-testid="btnSubmitZipCode"],
html body .shipping-calculator [data-testid="btnSubmitZipCode"],
html body .shipping-calculator ~ [data-testid="btnSubmitZipCode"],
html body #main-column div.btn-submit-step[data-testid="btnSubmitZipCode"] {
  display: none !important;
  visibility: hidden !important;
  opacity: 0 !important;
  height: 0 !important;
  width: 0 !important;
  padding: 0 !important;
  margin: 0 !important;
  pointer-events: none !important;
  position: absolute !important;
  left: -9999px !important;
}

html body #main-column .hide,
html body #main-column button.hide,
html body #main-column .btn.hide,
html body #main-column .btn-primary.hide,
html body #main-column .btn-submit-step.hide,
html body #main-column button.btn-primary.btn-submit-step.hide,
html body #main-column button.hide.btn-primary.btn-submit-step,
html body button[class*="hide"],
html body .hide {
  display: none !important;
  visibility: hidden !important;
  opacity: 0 !important;
  height: 0 !important;
  width: 0 !important;
  padding: 0 !important;
  margin: 0 !important;
  pointer-events: none !important;
}

/* ---- 8. BotÃ£o "Buscar" CEP dentro do input ---- */
.yamuna-cep-buscar-btn {
  position: absolute !important;
  right: 8px !important;
  top: 50% !important;
  transform: translateY(-50%) !important;
  height: 32px !important;
  line-height: 32px !important;
  padding: 0 16px !important;
  background: #a31460 !important;
  background-color: #a31460 !important;
  color: #ffffff !important;
  border: none !important;
  border-radius: 6px !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 13px !important;
  font-weight: 600 !important;
  cursor: pointer !important;
  white-space: nowrap !important;
  z-index: 10 !important;
  box-shadow: none !important;
}

.yamuna-cep-buscar-btn:hover,
.yamuna-cep-buscar-btn:focus {
  background: #82104d !important;
  background-color: #82104d !important;
  outline: none !important;
}

/* =============================================================================
 * INPUTS: EspaÃ§amento maior Desktop e Mobile + TÃ­tulos Flutuantes
 * ============================================================================= */

html body #main-column .form-group,
html body #main-column .has-float-label,
html body #main-column .form-group.has-float-label,
html body #main-column [class*="col-"] > .has-float-label,
html body #main-column [class*="col-"].form-group,
html body #main-column .row > [class*="col-"] {
  margin-bottom: 20px !important;
  position: relative !important;
}

@media (max-width: 767px) {
  html body #main-column .row > [class*="col-"],
  html body #main-column .row > .form-group,
  html body #main-column .form-group,
  html body #main-column .has-float-label,
  html body #main-column [class*="col-"].form-group {
    margin-bottom: 18px !important;
  }
}

html body #main-column .has-float-label input.form-control,
html body #main-column .form-group input.form-control,
html body #main-column input.form-control,
html body #main-column input[type="text"],
html body #main-column input[type="email"],
html body #main-column input[type="tel"] {
  height: 52px !important;
  min-height: 52px !important;
  padding: 22px 14px 6px 14px !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  line-height: 22px !important;
  border-radius: 8px !important;
  box-sizing: border-box !important;
  background-color: #ffffff !important;
  border: 1px solid #ced4da !important;
  color: #212529 !important;
}

html body #main-column .has-float-label input.form-control:focus,
html body #main-column input.form-control:focus {
  border-color: #a31460 !important;
  outline: none !important;
  box-shadow: 0 0 0 2px rgba(163, 20, 96, 0.15) !important;
}

html body #main-column .has-float-label label,
html body #main-column .has-float-label .input-label,
html body #main-column .has-float-label > label,
html body #main-column .has-float-label > .input-label,
html body #main-column label.input-label {
  position: absolute !important;
  left: 14px !important;
  top: 7px !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 11px !important;
  font-weight: 500 !important;
  line-height: 14px !important;
  color: #777777 !important;
  background: transparent !important;
  margin: 0 !important;
  padding: 0 !important;
  pointer-events: none !important;
  z-index: 3 !important;
  transition: all 0.15s ease-in-out !important;
}

html body #main-column .has-float-label:focus-within label,
html body #main-column .has-float-label:focus-within .input-label,
html body #main-column .has-float-label:focus-within > label,
html body #main-column .has-float-label:focus-within > .input-label {
  color: #a31460 !important;
}

html body #main-column .has-float-label input:placeholder-shown:not(:focus) ~ label,
html body #main-column .has-float-label input:placeholder-shown:not(:focus) ~ .input-label {
  top: 16px !important;
  font-size: 14px !important;
  line-height: 20px !important;
  font-weight: 400 !important;
  color: #888888 !important;
}

/* =============================================================================
 * Checkbox "Sem nÃºmero": 100% Centralizado Verticalmente (Desktop e Mobile - 14px)
 * ============================================================================= */

html body #main-column .form-group.col-md-5,
html body #main-column .col-md-5,
html body #main-column .col-sm-12.col-md-5,
html body #main-column .form-group:has(.input-button),
html body #main-column .form-group:has([name="shippingAddress.number"]) .has-float-label {
  position: relative !important;
  height: 52px !important;
  min-height: 52px !important;
}

/* O input-button ocupa a altura total (52px) e centraliza via flex align-items: center */
html body #main-column .input-button,
html body .input-button {
  position: absolute !important;
  right: 14px !important;
  top: 0 !important;
  bottom: 0 !important;
  height: 100% !important;
  max-height: 100% !important;
  transform: none !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  margin: 0 !important;
  padding: 0 !important;
  z-index: 5 !important;
  max-width: 125px !important;
  pointer-events: auto !important;
}

html body #main-column .input-button .form-group,
html body .input-button .form-group {
  margin: 0 !important;
  margin-bottom: 0 !important;
  margin-top: 0 !important;
  padding: 0 !important;
  height: 100% !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  line-height: 1 !important;
}

html body #main-column .input-button label,
html body #main-column .input-button .form-checkbox,
html body #main-column .input-button .form-options-label {
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  height: 100% !important;
  margin: 0 !important;
  padding: 0 !important;
  line-height: 1 !important;
  cursor: pointer !important;
}

html body #main-column .input-button .form-options-content {
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  gap: 6px !important;
  margin: 0 !important;
  padding: 0 !important;
  height: 100% !important;
  line-height: 1 !important;
}

/* Esconde o input checkbox nativo para nÃ£o desalinhar o Ã­cone customizado */
html body #main-column .input-button input[type="checkbox"],
html body .input-button input[type="checkbox"] {
  position: absolute !important;
  opacity: 0 !important;
  width: 0 !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  pointer-events: none !important;
}

/* Ãcone do checkbox alinhado ao centro */
html body #main-column .input-button .form-options-icon {
  width: 16px !important;
  height: 16px !important;
  min-width: 16px !important;
  margin: 0 !important;
  padding: 0 !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  vertical-align: middle !important;
}

/* Texto "Sem nÃºmero" alinhado e com fonte 14px */
html body #main-column .input-button span.form-options-label,
html body #main-column .input-button .form-options-label,
html body #main-column label[for="shipping_isnumbercheckbox"],
html body #main-column label[for="shipping_isnumbercheckbox"] * {
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 400 !important;
  line-height: 1 !important;
  color: #555555 !important;
  white-space: nowrap !important;
  margin: 0 !important;
  padding: 0 !important;
  display: inline-flex !important;
  align-items: center !important;
  vertical-align: middle !important;
}

html body #main-column input[name="shippingAddress.number"],
html body #main-column #shippingAddress\\.number {
  padding-right: 135px !important;
}

/* =============================================================================
 * Img5: PreÃ§os dos produtos na tabela de resumo do pedido -> Cor #000
 * ============================================================================= */

html body #secondary-column .table-price,
html body #secondary-column .table-price *,
html body #secondary-column td.table-price,
html body #secondary-column td.table-price *,
html body #secondary-column .product-price,
html body #secondary-column .table-price-total,
html body #secondary-column .table-price-total *,
html body #secondary-column .product-subtotal,
html body #secondary-column .product-subtotal *,
html body #secondary-column .table-scrollable td.table-price,
html body #secondary-column .table-scrollable td.table-price * {
  color: #000000 !important;
}

{% endif %}
