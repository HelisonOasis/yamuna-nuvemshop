{#/*============================================================================
style.css

    -This file contains all the theme non critical styles wich will be loaded asynchronously
    -Rest of styling can be found in:
        -static/css/style-colors.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style-colors.critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{#/*============================================================================
  Table of Contents

  #Components
    // Margin and Padding
    // Mixins
    // Animations
    // Buttons
    // Chips
    // Forms
    // Alerts and notifications
    // Progress bar
    // Modals
    // Tabs
    // Cards
    // Tooltip card
    // Captcha
  #Header and nav
    // Header
    // Nav
    // Utilities
    // Search
  #Footer
    // Nav
    // Social
    // Legal
  #Home page
    // Instafeed
    // Banners
    // Brands
    // Newsletter
    // Placeholder
  #Product grid
    // Filters
  #Product detail
  	// Image
  	// Form and info
  #Cart detail
    // Table
    // Totals
  #Contact page
  #Media queries
    // Min width 768px
    //// Components
    //// Footer
  #Critical path utilities

==============================================================================*/#}
{# /* // Margin and Padding */ #}

%section-margin {
  margin-bottom: 70px;
}

{# The compact header exists only below the desktop breakpoint. #}
@media (min-width: 1024px) {
  body .head-main .yamuna-header-mobile,
  body .head-main .yamuna-mobile-search {
    display: none !important;
  }
}

/* Institutional pages */
.yamuna-institutional-page {
  color: #4a1d3a;
  background: #fff;
}

.yamuna-institutional-hero {
  padding: 84px 24px;
  text-align: center;
  background: #f8f6f8;
}

.yamuna-institutional-inner {
  width: 100%;
  max-width: 1060px;
  margin: 0 auto;
}

.yamuna-institutional-kicker {
  display: block;
  margin-bottom: 12px;
  color: #b01962;
  font-family: 'Raleway', sans-serif;
  font-size: 13px;
  font-weight: 700;
  letter-spacing: .08em;
  text-transform: uppercase;
}

.yamuna-institutional-hero h1 {
  margin: 0;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 48px;
  font-weight: 600;
  line-height: 1.08;
}

.yamuna-institutional-lead {
  max-width: 700px;
  margin: 20px auto 0;
  font-family: 'Dosis', sans-serif;
  font-size: 23px;
  line-height: 1.35;
}

.yamuna-institutional-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 46px;
  margin-top: 30px;
  padding: 12px 30px;
  border-radius: 24px;
  color: #fff !important;
  background: #248987;
  font-family: 'Raleway', sans-serif;
  font-size: 13px;
  font-weight: 700;
  letter-spacing: .03em;
  line-height: 1.2;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  transition: background .2s ease, transform .2s ease;
}

.yamuna-institutional-button:hover {
  color: #fff !important;
  background: #1c716f;
  transform: translateY(-1px);
}

.yamuna-institutional-content {
  padding: 80px 24px;
}

.yamuna-institutional-grid {
  display: grid;
  grid-template-columns: minmax(0, 1.45fr) minmax(280px, .8fr);
  gap: 72px;
  align-items: start;
}

.yamuna-institutional-copy h2,
.yamuna-institutional-aside h2 {
  margin: 0 0 18px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 34px;
  font-weight: 600;
  line-height: 1.12;
}

.yamuna-institutional-copy p {
  margin: 0;
  font-family: 'Dosis', sans-serif;
  font-size: 21px;
  line-height: 1.5;
}

.yamuna-institutional-aside {
  padding: 34px;
  border-radius: 14px;
  background: #f8f6f8;
}

.yamuna-institutional-aside h2 {
  font-size: 29px;
}

.yamuna-institutional-list,
.yamuna-benefits-steps {
  padding: 0;
  margin: 0;
  list-style: none;
}

.yamuna-institutional-list li {
  position: relative;
  padding: 0 0 14px 24px;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  line-height: 1.3;
}

.yamuna-institutional-list li:last-child {
  padding-bottom: 0;
}

.yamuna-institutional-list li:before {
  position: absolute;
  top: .46em;
  left: 0;
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: #b01962;
  content: '';
}

.yamuna-institutional-benefits {
  padding: 0 24px 80px;
}

.yamuna-institutional-benefits h2 {
  margin: 0 0 34px;
  color: #b01962;
  font-family: 'Dosis', sans-serif;
  font-size: 37px;
  font-weight: 600;
  line-height: 1.1;
  text-align: center;
}

.yamuna-benefits-steps {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 22px;
  counter-reset: benefit-step;
}

.yamuna-benefits-steps li {
  position: relative;
  min-height: 174px;
  padding: 68px 25px 26px;
  border: 1px solid #ead3e0;
  border-radius: 14px;
  background: #fff;
  font-family: 'Dosis', sans-serif;
  font-size: 20px;
  line-height: 1.35;
  text-align: center;
  counter-increment: benefit-step;
}

.yamuna-benefits-steps li:before {
  position: absolute;
  top: 23px;
  left: 50%;
  display: flex;
  width: 30px;
  height: 30px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  color: #fff;
  background: #b01962;
  content: counter(benefit-step);
  font-family: 'Raleway', sans-serif;
  font-size: 13px;
  font-weight: 700;
  transform: translateX(-50%);
}

.yamuna-institutional-cta {
  padding: 65px 24px;
  text-align: center;
  background: #f8f6f8;
}

.yamuna-institutional-cta h2 {
  max-width: 660px;
  margin: 0 auto;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 36px;
  font-weight: 600;
  line-height: 1.15;
}

.yamuna-institutional-cta .yamuna-institutional-button {
  margin-top: 25px;
}

@media (max-width: 767px) {
  .yamuna-institutional-hero {
    padding: 52px 20px;
  }

  .yamuna-institutional-hero h1 {
    font-size: 35px;
  }

  .yamuna-institutional-lead {
    margin-top: 16px;
    font-size: 20px;
  }

  .yamuna-institutional-button {
    width: 100%;
    min-height: 44px;
    margin-top: 24px;
    padding: 11px 18px;
  }

  .yamuna-institutional-content {
    padding: 52px 20px;
  }

  .yamuna-institutional-grid {
    grid-template-columns: 1fr;
    gap: 36px;
  }

  .yamuna-institutional-copy h2,
  .yamuna-institutional-aside h2 {
    margin-bottom: 13px;
    font-size: 30px;
  }

  .yamuna-institutional-copy p {
    font-size: 19px;
  }

  .yamuna-institutional-aside {
    padding: 26px 22px;
  }

  .yamuna-institutional-benefits {
    padding: 0 20px 52px;
  }

  .yamuna-institutional-benefits h2 {
    margin-bottom: 24px;
    font-size: 32px;
  }

  .yamuna-benefits-steps {
    grid-template-columns: 1fr;
    gap: 14px;
  }

  .yamuna-benefits-steps li {
    min-height: 0;
    padding: 58px 20px 22px;
    font-size: 19px;
  }

  .yamuna-institutional-cta {
    padding: 52px 20px;
  }

  .yamuna-institutional-cta h2 {
    font-size: 31px;
  }
}

@media (max-width: 1023px) {
  /* Mini cart: final mobile geometry from Figma node 286:12876. */
  body #modal-cart:has(.js-cart-item) .yamuna-cart-shipping-promo {
    display: block !important;
  }

  body #modal-cart .yamuna-cart-subscription {
    left: 13px !important;
  }

  body #modal-cart .cart-item-delete {
    top: 93px !important;
    right: 12px !important;
    bottom: auto !important;
  }
}

/* Institutional templates: content and controls. */
.yamuna-institutional-page .yamuna-institutional-hero > .container {
  max-width: 820px;
}

.yamuna-institutional-page .yamuna-institutional-hero > .container > p:first-child {
  margin: 0 0 12px;
  color: #b01962;
  font-family: 'Raleway', sans-serif;
  font-size: 13px;
  font-weight: 700;
  letter-spacing: .08em;
  text-transform: uppercase;
}

.yamuna-institutional-page .yamuna-institutional-hero > .container > p:not(:first-child) {
  max-width: 700px;
  margin: 20px auto 0;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 23px;
  line-height: 1.35;
}

.yamuna-institutional-page .yamuna-institutional-cta {
  display: inline-flex;
  width: auto;
  min-height: 46px;
  margin-top: 30px;
  padding: 12px 30px;
  align-items: center;
  justify-content: center;
  border-radius: 24px;
  color: #fff !important;
  background: #248987;
  font-family: 'Raleway', sans-serif;
  font-size: 13px;
  font-weight: 700;
  letter-spacing: .03em;
  line-height: 1.2;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  transition: background .2s ease, transform .2s ease;
}

.yamuna-institutional-page .yamuna-institutional-cta:hover {
  color: #fff !important;
  background: #1c716f;
  transform: translateY(-1px);
}

.yamuna-institutional-page .yamuna-institutional-content {
  padding: 80px 24px;
}

.yamuna-institutional-intro {
  display: grid;
  grid-template-columns: minmax(0, 1.45fr) minmax(280px, .8fr);
  gap: 72px;
  align-items: start;
}

.yamuna-institutional-intro h2,
.yamuna-institutional-page .yamuna-institutional-content > h2,
.yamuna-institutional-action h2 {
  margin: 0 0 18px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 34px;
  font-weight: 600;
  line-height: 1.12;
}

.yamuna-institutional-intro p,
.yamuna-benefits-intro p,
.yamuna-institutional-action p {
  margin: 0 0 18px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 21px;
  line-height: 1.5;
}

.yamuna-institutional-intro aside {
  padding: 34px;
  border-radius: 14px;
  background: #f8f6f8;
}

.yamuna-institutional-intro aside h3 {
  margin: 0 0 18px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 29px;
  font-weight: 600;
  line-height: 1.12;
}

.yamuna-institutional-intro aside ul {
  padding: 0;
  margin: 0;
  list-style: none;
}

.yamuna-institutional-intro aside li {
  position: relative;
  padding: 0 0 14px 24px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  line-height: 1.3;
}

.yamuna-institutional-intro aside li:last-child {
  padding-bottom: 0;
}

.yamuna-institutional-intro aside li:before {
  position: absolute;
  top: .46em;
  left: 0;
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: #b01962;
  content: '';
}

.yamuna-institutional-action {
  margin-top: 72px;
  padding: 54px 30px;
  border-radius: 14px;
  text-align: center;
  background: #f8f6f8;
}

.yamuna-institutional-action h2 {
  margin-bottom: 12px;
}

.yamuna-institutional-action p {
  max-width: 700px;
  margin: 0 auto;
}

.yamuna-institutional-action .yamuna-institutional-cta {
  margin-top: 25px;
}

.yamuna-benefits-intro {
  max-width: 760px;
  margin: 0 auto 60px;
  text-align: center;
}

.yamuna-institutional-page .yamuna-institutional-content > h2 {
  margin-bottom: 34px;
  color: #b01962;
  font-size: 37px;
  text-align: center;
}

.yamuna-benefits-steps li {
  display: flex;
  min-height: 174px;
  padding: 68px 25px 26px;
  align-items: center;
  flex-direction: column;
  justify-content: flex-start;
}

.yamuna-benefits-steps li strong {
  margin-bottom: 8px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 23px;
  font-weight: 600;
  line-height: 1.15;
}

.yamuna-benefits-steps li span {
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  line-height: 1.3;
}

@media (max-width: 767px) {
  .yamuna-institutional-page .yamuna-institutional-hero > .container > p:not(:first-child) {
    margin-top: 16px;
    font-size: 20px;
  }

  .yamuna-institutional-page .yamuna-institutional-cta {
    width: 100%;
    min-height: 44px;
    margin-top: 24px;
    padding: 11px 18px;
  }

  .yamuna-institutional-page .yamuna-institutional-content {
    padding: 52px 20px;
  }

  .yamuna-institutional-intro {
    grid-template-columns: 1fr;
    gap: 36px;
  }

  .yamuna-institutional-intro h2,
  .yamuna-institutional-page .yamuna-institutional-content > h2,
  .yamuna-institutional-action h2 {
    margin-bottom: 13px;
    font-size: 30px;
  }

  .yamuna-institutional-intro p,
  .yamuna-benefits-intro p,
  .yamuna-institutional-action p {
    font-size: 19px;
  }

  .yamuna-institutional-intro aside {
    padding: 26px 22px;
  }

  .yamuna-institutional-intro aside h3 {
    font-size: 27px;
  }

  .yamuna-institutional-action {
    margin-top: 52px;
    padding: 42px 22px;
  }

  .yamuna-benefits-intro {
    margin-bottom: 40px;
  }

  .yamuna-institutional-page .yamuna-institutional-content > h2 {
    margin-bottom: 24px;
    font-size: 32px;
  }

  .yamuna-benefits-steps li {
    min-height: 0;
    padding: 58px 20px 22px;
  }
}

/* Evita que qualquer elemento decorativo maior que a viewport desloque a
 * p?gina inteira no mobile. Os trilhos dos sliders continuam com o pr?prio
 * overflow e, portanto, preservam o arraste horizontal. */
@media (max-width: 767px) {
  html,
  body {
    width: 100%;
    max-width: 100%;
    overflow-x: hidden;
    overscroll-behavior-x: none;
  }

  body.template-home {
    overflow-x: clip;
  }
}

{# Definitive desktop composition for the native Yamuna header. #}
@media (min-width: 1024px) {
  body.template-home .head-main .yamuna-header-desktop {
    display: grid !important;
    grid-template-columns: 174px auto minmax(240px, 392px) 112px;
    column-gap: 0;
    align-items: center;
  }

  body.template-home .head-main .yamuna-header-desktop::before {
    left: 174px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav {
    width: auto;
    min-width: 0;
    margin-left: 52px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list {
    display: flex;
    align-items: center;
    gap: 20px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-item,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item:last-child {
    display: block;
    margin: 0;
    padding: 0;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link {
    display: block;
    padding: 0;
    color: #fff !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
    font-style: normal;
    font-weight: 500 !important;
    line-height: 59px;
    letter-spacing: 0 !important;
    text-transform: uppercase;
    white-space: nowrap;
  }

  body.template-home .head-main .yamuna-header-desktop-search {
    width: auto;
    min-width: 0;
    margin: 0 16px 0 24px;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities {
    display: block !important;
    width: 112px;
    margin: 0 18px 0 0;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .utilities-container {
    display: flex !important;
    width: 112px;
    height: 59px;
    align-items: center;
    justify-content: flex-start;
    gap: 12px;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-help {
    display: none !important;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .utilities-item,
  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-favorites {
    display: flex !important;
    width: 20px;
    height: 59px;
    min-width: 20px;
    padding: 0 !important;
    align-items: center;
    justify-content: center;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .utility-head,
  body.template-home .head-main .yamuna-header-desktop-utilities #ajax-cart {
    display: flex !important;
    width: 20px;
    height: 59px;
    padding: 0;
    align-items: center;
    justify-content: center;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .icon-2x,
  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-favorites svg {
    display: block !important;
    width: 20px !important;
    height: 20px !important;
    color: #fff !important;
    fill: #fff !important;
    opacity: 1 !important;
    visibility: visible !important;
  }
  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-favorites img,
  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-action-icon {
    display: block !important;
    width: 20px !important;
    height: 20px !important;
    max-width: 20px;
    object-fit: contain;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .utility-name {
    display: none !important;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .badge-amount {
    display: block !important;
    top: 11px;
    right: -9px;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop {
    grid-template-columns: 112px auto minmax(240px, 392px) 112px;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop::before {
    left: 0;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav {
    margin-left: 28px;
  }
}

{# Final home navigation: isolated controls, no inherited utility items. #}
@media (min-width: 768px) {
  body.template-home .head-main .yamuna-header-desktop {
    display: flex !important;
    width: min(1312px, calc(100% - 128px));
    height: 59px;
    margin: 0 auto;
    align-items: center;
  }

  body.template-home .head-main .yamuna-header-desktop::before { left: 224px; }

  body.template-home .head-main .yamuna-header-desktop-logo {
    flex: 0 0 174px;
    width: 174px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav {
    flex: 0 0 auto;
    width: auto;
    margin-left: 100px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list { gap: 24px; }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link {
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 500 !important;
  }

  body.template-home .head-main .yamuna-header-desktop-search {
    position: relative;
    display: block !important;
    flex: 0 0 392px;
    width: 392px;
    min-width: 0;
    margin: 0 16px 0 auto;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-container,
  body.template-home .head-main .yamuna-header-desktop-search .form-group { position: relative !important; width: 100% !important; }

  body.template-home .head-main .yamuna-header-desktop-search .search-input {
    display: block !important;
    width: 100% !important;
    height: 35px !important;
    min-height: 35px !important;
    padding: 0 44px 0 18px !important;
    color: #fff !important;
    border: 1px solid #fff !important;
    border-radius: 32px !important;
    background: transparent !important;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-input-submit {
    position: absolute !important;
    top: 0 !important;
    right: 0 !important;
    display: flex !important;
    width: 42px !important;
    height: 35px !important;
    padding: 0 !important;
    transform: none !important;
    align-items: center;
    justify-content: center;
    color: #fff !important;
    background: transparent !important;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-input-submit svg {
    display: block !important;
    width: 20px !important;
    height: 20px !important;
    color: #fff !important;
    fill: #fff !important;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities {
    display: flex !important;
    flex: 0 0 auto;
    width: auto !important;
    height: 59px;
    margin: 0 24px 0 0 !important;
    align-items: center;
    justify-content: flex-start;
    gap: 16px;
  }

  body.template-home .head-main .yamuna-header-action {
    position: relative;
    display: flex !important;
    width: 20px !important;
    height: 20px !important;
    min-width: 20px;
    padding: 0 !important;
    align-items: center;
    justify-content: center;
    line-height: 0;
  }

  body.template-home .head-main .yamuna-header-action img {
    display: block !important;
    width: 20px !important;
    height: 20px !important;
    max-width: none !important;
    object-fit: contain;
  }

  body.template-home .head-main .yamuna-header-cart-count {
    position: absolute;
    top: -9px;
    right: -10px;
    display: flex;
    width: 16px;
    height: 16px;
    align-items: center;
    justify-content: center;
    color: #a31460;
    border-radius: 50%;
    background: #fff;
    font-size: 10px;
    font-weight: 700;
    line-height: 1;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop {
    width: min(1088px, calc(100% - 48px));
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop::before { left: 0; }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo {
    flex-basis: 112px;
    width: 112px;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav { margin-left: 36px; }
}

{# Home navbar proportions: reserve only the logo space, not a second empty column. #}
@media (min-width: 1260px) {
  body.template-home .head-main .yamuna-header-desktop::before {
    left: 162px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav {
    margin-left: 38px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-item {
    padding: 0;
    margin-right: 24px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-item:last-child {
    margin-right: 0;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link {
    padding: 0;
  }

  body.template-home .head-main .yamuna-header-desktop-search {
    margin-left: auto;
    margin-right: 16px;
  }
}

{# Home header: the brand starts beside the menu and joins it after scrolling. #}
@media (min-width: 768px) {
  body.template-home .head-main,
  body.template-home .head-main.head-fix {
    position: fixed !important;
    top: 0;
    left: 0;
    z-index: 1050;
    padding-top: 20px;
    transition: padding .24s ease;
  }

  body.template-home .yamuna-header-desktop-logo {
    position: relative;
    height: 59px;
  }

  body.template-home .yamuna-header-desktop-logo .logo-img-container,
  body.template-home .yamuna-header-desktop-logo .logo-text {
    display: none !important;
  }

  body.template-home .yamuna-header-desktop-logo::before {
    display: block;
    width: 174px;
    height: 59px;
    content: '';
    background: url('{{ 'images/yamuna/logo-header.png' | static_url }}') left center / contain no-repeat;
    transition: width .24s ease, height .24s ease, filter .24s ease;
  }

  html.yamuna-header-scrolled body.template-home .head-main,
  html.yamuna-header-scrolled body.template-home .head-main.head-fix {
    padding-top: 20px;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop {
    width: min(1088px, calc(100% - 48px));
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop::before {
    left: 0;
  }

  html.yamuna-header-scrolled body.template-home .yamuna-header-desktop-logo {
    width: 112px;
    flex-basis: 112px;
    padding-left: 18px;
  }

  html.yamuna-header-scrolled body.template-home .yamuna-header-desktop-logo::before {
    width: 76px;
    height: 42px;
    filter: brightness(0) invert(1);
  }

  html.yamuna-header-scrolled body.template-home .yamuna-header-desktop-nav {
    margin-left: 16px;
  }

  html.yamuna-header-scrolled body.template-home .yamuna-header-desktop-utilities {
    margin-right: 18px;
  }
}

{# Yamuna floating home navigation, aligned with the desktop Figma header. #}
@media (min-width: 768px) {
  body.template-home .head-main {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1050;
    width: 100%;
    padding: 25px 0 0;
    background: transparent !important;
  }

  body.template-home .head-main.head-fix {
    position: absolute;
    background: transparent !important;
  }

  body.template-home .head-main .yamuna-header-desktop {
    position: relative;
    display: flex !important;
    width: min(1312px, calc(100% - 128px));
    min-height: 59px;
    margin: 0 auto;
    padding: 0;
    border-radius: 0;
    background: transparent;
    box-shadow: none;
  }

  body.template-home .head-main .yamuna-header-desktop::before {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 224px;
    z-index: -1;
    display: block;
    content: '';
    border-radius: 32px;
    background: #a31460;
    box-shadow: 4px 4px 4px -2px rgba(0, 0, 0, .25);
  }

  body.template-home .head-main .yamuna-header-desktop-logo {
    z-index: 1;
    width: 174px;
    flex: 0 0 174px;
    align-items: center;
  }

  body.template-home .head-main .yamuna-header-desktop-logo .logo-img-container {
    max-width: 174px;
  }

  body.template-home .head-main .yamuna-header-desktop-logo .logo-img {
    width: auto;
    max-width: 174px;
    max-height: 59px;
    filter: none;
  }

  body.template-home .head-main .yamuna-header-desktop-logo .logo-text {
    color: #a31460;
    font-size: 24px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav {
    z-index: 1;
    flex: 0 0 auto;
    margin-left: 50px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-item {
    padding: 0 7px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link {
    padding: 0 5px;
    font-family: Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 500;
    line-height: 59px;
    letter-spacing: 0;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-arrow {
    margin-left: 3px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-arrow > i {
    font-size: 11px;
  }

  body.template-home .head-main .yamuna-header-desktop-search {
    z-index: 1;
    width: 392px;
    flex: 0 1 392px;
    margin: 0 18px 0 auto;
  }

  body.template-home .head-main .yamuna-header-desktop-search .form-control {
    display: block;
    height: 35px;
    padding: 0 45px 0 16px;
    border: 1px solid #fff;
    border-radius: 32px;
    background: transparent;
    color: #fff;
    font-family: Roboto, Arial, sans-serif;
    font-size: 14px;
    line-height: 33px;
  }

  body.template-home .head-main .yamuna-header-desktop-search .form-control::placeholder {
    color: rgba(255, 255, 255, .78);
  }

  body.template-home .head-main .yamuna-header-desktop-search .form-group {
    position: static;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-input-submit {
    position: absolute;
    display: flex;
    top: 0;
    right: 0;
    width: 42px;
    height: 35px;
    padding: 0;
    align-items: center;
    justify-content: center;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-input-submit svg {
    width: 20px;
    height: 20px;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities {
    z-index: 1;
    margin-right: 24px;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .utilities-container {
    display: flex;
    align-items: center;
    gap: 16px;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-help {
    display: none !important;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .utilities-item {
    display: flex !important;
    padding: 0;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .utility-head {
    display: flex;
    width: 32px;
    height: 59px;
    align-items: center;
    justify-content: center;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-favorites {
    width: 32px;
    height: 59px;
    align-items: center;
    justify-content: center;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .icon-2x {
    width: 21px;
    height: 21px;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .badge-amount {
    top: 10px;
    right: 0;
  }

  @media (max-width: 1250px) {
    body.template-home .head-main .yamuna-header-desktop-search {
      width: 270px;
      flex-basis: 270px;
      margin-right: 12px;
    }

    body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link {
      font-size: 14px;
    }
  }
}

@media (min-width: 768px) and (max-width: 1100px) {
  body.template-home .head-main {
    padding-top: 16px;
  }

  body.template-home .head-main .yamuna-header-desktop {
    width: calc(100% - 48px);
  }

  body.template-home .head-main .yamuna-header-desktop::before {
    left: 112px;
  }

  body.template-home .head-main .yamuna-header-desktop-logo {
    width: 94px;
    flex-basis: 94px;
  }

  body.template-home .head-main .yamuna-header-desktop-logo .logo-img-container,
  body.template-home .head-main .yamuna-header-desktop-logo .logo-img {
    max-width: 94px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav {
    margin-left: 25px;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link {
    font-size: 12px;
  }
}
%element-margin {
  margin-bottom: 35px;
}
%element-margin-small {
  margin-bottom: 20px;
}
%section-margin-invert {
  margin-top: -70px;
}

{# /* // Mixins */ #}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
  #{$property}: $value;
}

%border-radius-small {
  border-radius: 10px;
}


{# /* // Animations */ #}

.transition-soft {
  @include prefix(transition, all 0.3s ease, webkit ms moz o);
}

.transition-up {
    position: relative;
    top: -8px;
    @include prefix(transition, all 0.5s ease, webkit ms moz o);
    z-index: 10;
    pointer-events: none; 
    &-active {
      top: 0;
      opacity: 1; 
      z-index: 100;
      pointer-events: all; 
    }
}

.fade-in-vertical {
  transition: all .5s cubic-bezier(.16,.68,.43,.99);
  transition-delay: .3s;
  @include prefix(transform, translate(0, 40%), webkit ms moz o);
  &.visible {
    @include prefix(transform, translate(0, 0%), webkit ms moz o);
    opacity: 1;
  }
}

.swing {
  @include prefix(animation-duration, 1s, webkit ms moz o);
  @include prefix(animation-fill-mode, both, webkit ms moz o);
  @include prefix(animation-iteration-count, 3, webkit ms moz o);   
  @include prefix(transform-origin, top center, webkit ms moz o);
  @include prefix(animation-name, swing, webkit ms moz o);
}

@-webkit-keyframes swing {
  20% {
    @include prefix(transform, rotate3d(0, 0, 1, 15deg), webkit ms moz o);
  }

  40% {
    @include prefix(transform, rotate3d(0, 0, 1, -10deg), webkit ms moz o);
  }

  60% {
    @include prefix(transform, rotate3d(0, 0, 1, 5deg), webkit ms moz o);
  }

  70% {
    @include prefix(transform, rotate3d(0, 0, 1, -5deg), webkit ms moz o);
  }

  80% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }

  100% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }
}

@keyframes swing {
  20% {
    @include prefix(transform, rotate3d(0, 0, 1, 15deg), webkit ms moz o);
  }

  40% {
    @include prefix(transform, rotate3d(0, 0, 1, -10deg), webkit ms moz o);
  }

  60% {
    @include prefix(transform, rotate3d(0, 0, 1, 5deg), webkit ms moz o);
  }

  70% {
    @include prefix(transform, rotate3d(0, 0, 1, -5deg), webkit ms moz o);
  }

  80% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }

  100% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }
}

{# /* // Buttons */ #}

.btn-transition {
  position: relative;
  overflow: hidden; 
  .transition-container {
    position: absolute;
    top: -100%;
    left: 0;
    width: 100%;
    text-align: center;
    @include prefix(transition, all 0.5s ease, webkit ms moz o);
    pointer-events: none;
    cursor: not-allowed;
    &.btn-transition-progress{
      height: 14px;
      margin-top: -20px;
    }
    &.btn-transition-success {
      margin-top: -11px;
      .btn-transition-success-icon {
        font-size: 24px;
      }
    }
    &.btn-transition-success-small {
      margin-top: -10px;
      .btn-transition-success-icon {
        font-size: 20px;
      }
    }
    &.active {
      top: 50%;
    }
  } 
} 

{# /* // Chips */ #}

.chip {
  position: relative;
  margin: 5px 10px 5px 0;
  padding: 10px 35px 10px 12px;
  font-size: 11px;
  font-weight: bold;
  white-space: normal;
  word-break: break-word;
  line-height: 18px;
  border: 0;
  border-radius: 20px;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &-remove-icon{
    position: absolute;
    top: 8px;
    right: 8px;
    display: inline-block;
    width: 20px;
    height: 20px;
    padding: 4px 6px 3px 6px;
    border-radius: 50%;
  }
  &:focus {
    outline: 0;
  }
  &:hover {
    opacity: 0.6;
  }
}

{# /* // Forms */ #}

.form-group{
  @extend %element-margin-small;
  .form-label{
    float: left;
    width: 100%;
    margin-bottom: 10px;
  }
  .alert{
    margin: 10px 0 0 0;
  }
}

.input-clear-content {
  position: absolute;
  right: 4px;
  bottom: 0;
  width: 24px;
  height: 35px;
  padding: 4px;
  cursor: pointer;
  &:before {
    display: block;
    margin: 6px 0 0 4px;
  }
}

.radio-buttons-group.with-other-options {
  .radio-button-item,
  .radio-button-item:last-child,
  .radio-button-item:only-child {
    .radio-button-content,
    .radio-button input[type="radio"]:checked + .radio-button-content,
    .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container {
      border-radius: 0;
    }
  }
  > .radio-button-item:first-child{
    .radio-button-content{
      border-radius: 10px 10px 0 0;
    }
    .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container{
      border-radius: 6px 0 0 0;
    }
  }
}

.checkbox-container{
  .checkbox {
    position: relative;
    display: block;
    margin-bottom: 15px;
    padding-left: 35px;
    font-weight: normal;
    text-decoration: none;
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    cursor: pointer;
    &-icon {
      position: absolute;
      left: 0;
      display: block;
      width: 20px;
      height: 20px;
      border-radius: 3px;
      &:after {
        position: absolute;
        top: 2px;
        left: 6px;
        display: none;
        width: 6px;
        height: 12px;
        content: '';
        @include prefix(transform, rotate(45deg), webkit ms moz o);
      }
    }
    &-text {
      display: inline-block;
      padding-top: 2px;
      &.with-color {
        padding-right: 30px;
      }
    }
    &-color {
      position: absolute;
      right: 0;
      display: inline-block;
      width: 18px;
      height: 18px;
      border-radius: 50%;
    }
  }
  input {
    display: none;
    &:checked ~ .checkbox {
      opacity: 1;
      .checkbox-icon:after {
        display: block;
      }
    }
  }
}

.form-select {
  padding: 13px 35px 12px 12px;
  
  .form-select-icon {
    @include prefix(transition, all 0.2s ease, webkit ms moz o);
  }
  &:focus{
    outline:0;
  }
  &::-ms-expand {
    display: none;
  }
  &.open .form-select-icon {
    @include prefix(transform, translateY(-50%) rotate(180deg), webkit ms moz o);
  }
}

.form-select-options {
  position: absolute;
  top: 100%;
  left: 0;
  z-index: 200;
  width: 100%;
  max-height: 200px;
  margin-top: 5px;
  list-style: none;
  overflow-y: auto;
  @extend %border-radius-small;
  @include prefix(transition, all 0.2s ease, webkit ms moz o);
  opacity: 0;
  &.open {
    opacity: 1;
  }
}

.form-select-option {
  padding: 12px;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  cursor: pointer;
}


{# /* Disabled controls */ #}

input,
select,
textarea,
button{
  &[disabled],
  &[disabled]:hover,
  &[readonly],
  &[readonly]:hover{
    background-color: #DDD;
    cursor: not-allowed;
  }
}

.form-control-disabled {
  opacity: .3;
  pointer-events: none;
}

.list{
  .list-item-box{
    position: relative;
    width: 100%;
    padding: 20px;
  }
  .radio-button-icons-container{
    display: none;
  }
  .radio-button-label{
    padding-left: 0;
  }
  .list-item .radio-button-content{
    margin: 0;
    border-radius: 0;
  }
  .list-unstyled .radio-button-item:last-child .list-item,
  .list-item:last-child{
    margin-bottom: 0;
  }
}

{# /* // Alerts and notifications */ #}

.alert {
  clear: both;
  padding: 8px;
  border: 1px solid;
  text-align: center;
  @extend %element-margin;
}

.notification-hidden{
  transition: all .1s cubic-bezier(.16,.68,.43,.99);
  opacity: 0;
  @include prefix(transform, translate(0, -10%), webkit ms moz o);
  pointer-events: none;
}
.notification-visible{
  transition: all .5s cubic-bezier(.16,.68,.43,.99);
  opacity: 1;
  @include prefix(transform, translate(0, 0), webkit ms moz o);
}
.notification-floating {
  {% if settings.head_utility == 'searchbox' %}
    margin-top: -60px;
  {% else %}
    margin-top: -15px;
  {% endif %}
}
.notification-arrow-up{
  position: absolute;
  top: -8px;
  right: 5%;
  width: 0;
  height: 0;
  pointer-events: none;
}
.notification-img svg{
  position: absolute;
  top: -4px;
  right: -2px;
}
.notification-close {
  position: absolute;
  top: 0;
  right: 0;
  cursor: pointer;
  z-index: 1;
}

.related-products-notification-container {
  margin-right: -15px;
}

{# /* // Progress bar */ #}

.progress-bar {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.progress-bar-title-container {
  display: flex;
  align-items: center;
  gap: 8px;
}

.progress-bar-title {
  flex: 1;
  min-width: 0;
}

.progress-bar-subtitle:not(:has(> :not([style*="display: none"]))) {
  display: none;
}

.gift-promotion-progress {
  margin-top: 8px;
  margin-bottom: 16px;
}

.bar-progress {
  position: relative;
  height: 15px;
  border-radius: 15px;
  .bar-progress-active {
    height: 15px;
    width: 0%;
    border-radius: 15px;
  }
  .bar-progress-check {
    position: absolute;
    top: -5px;
    right: -3px;
    width: 25px;
    padding: 3px;
    line-height: 16px;
    text-align: center;
    border-radius: 50%;
    transform: scale(0.5);
    opacity: 0;
    &.active {
      transform: scale(1);
      opacity: 1;
    }
  }
}

.ship-free-rest-message .ship-free-rest-text {
  display: none;
}

.ship-free-rest-message.success .bar-progress-success,
.ship-free-rest-message.amount .bar-progress-amount,
.ship-free-rest-message.condition .bar-progress-condition {
  display: block;
}



{# /* // Modals */ #}

.modal {
  position: fixed;
  top: 0;
  display: block;
  width: 80%;
  height: 100%;
  padding: 20px;
  -webkit-overflow-scrolling: touch;
  overflow-y: auto;
  @include prefix(transition, all .4s ease-in-out, webkit ms moz o);
  z-index: 20000;
  &-zindex-top{
    z-index: 20001;
  }
  &-img-full{
    width: calc(100% + 40px);
    margin: -20px 0 0 -20px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
  &-header{
    width: calc(100% + 40px);
    margin: -20px 0px 15px -20px;
    padding: 15px;
    font-size: 20px;
    cursor: pointer;
  }
  &-footer{
    padding: 10px;
    clear: both;
  }
  &-with-fixed-footer {
    display: flex;
    flex-direction: column;
    height: 100%;
    .modal-scrollable-area {
      height: 100%;
      overflow: auto;
    }
  }
  &-full {
    width: 100%;
  }
  &-docked-md{
    width: 100%;
  }
  &-docked-small{
    width: 80%;
  }
  &-top{
    top: -100%;
  }
  &-fade{
    top: initial;
    bottom: -5%;
    opacity: 0;
  }
  &-bottom{
    top: 100%;
    left: 0;
    opacity: 0;
  }
  &-left{
    left: -100%;
  }
  &-right{
    right: -100%;
    border-radius: 0;
  }
  &-centered{
    height: 100%;
    width: 100%;
    &-small{
      width: 80%;
      height: auto;
      left: 50%;
      @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
      .modal-body{
        min-height: 150px;
        max-height: 400px;
      }
    }
  }
  &-centered-md.modal-show {
    left: initial;
    transform: none;
    &.modal-bottom {
      top: 50%;
      transform: translateY(-50%);
    }
  }
  &.modal-show{
    opacity: 1;
  }
  &-top.modal-show,
  &-bottom.modal-show {
    top: 0;
    &.modal-centered-small{
      top: 50%;
      transform: translate(-50%, -50%);
    }
  }
  &-left.modal-show,
  &-left-xs.modal-show {
    left: 0;
  }
  &-right.modal-show {
    right: 0;
  }
  &-fade.modal-show{
    bottom: 0;
    opacity: 1;
  }
  &-bottom-sheet {
    top: initial;
    bottom: -100%;
    width: 100%;
    height: auto;
    transform: none;
    border-radius: 10px 10px 0 0;
    &.modal-show,
    &.modal-show.modal-centered-md {
      top: initial;
      bottom: 0;
      left: 0;
      height: auto;
      transform: translateY(0);
    }
  }
  &-close { 
    margin-right: 10px;
    font-size: 20px;
    // Cursor pointer added to JS is triggered on IOS
    cursor: pointer;
    border: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: none;
  }
  .tab-group{
    margin:  0 -10px 15px 0;
  }
}

.modal-overlay{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #00000047;
  z-index: 10000;
  // Cursor pointer added to JS is triggered on IOS
  cursor: pointer;
  &.modal-zindex-top{
    z-index: 20000;
  }
}

.modal-full-width {
  width: 100%;
  max-width: 100%;
}

.modal-body-scrollable-auto .modal-body {
  max-height: calc(100vh - 100px);
  overflow-y: auto;
}

.modal-close-top-right {
  position: absolute;
  top: 1rem;
  right: 1.5rem;
}

{# /* // Tabs */ #}

.tab-group{
  width: 100vw;
  padding: 0;
  overflow-x: scroll;
  white-space: nowrap;
  .tab{
    display: inline-flex;
    float: none;
    &-link{
      float: left;
      padding: 10px;
      font-size: 12px;
      text-align: center;
      text-transform: uppercase;
    }
  }
}

.tab-panel:not(.active){
  display: none;
}
.tab-panel.active{
  display: block;
}

{# /* // Cards */ #}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 20px;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-clip: border-box;
  &-collapse {
    height: 52px;
    padding: 0;
    overflow: visible;
    border: none;
    @include prefix(transition, all 0.3s ease, webkit ms moz o);
    &-toggle {
      position: absolute;
      top: 6px;
      right: 8px;
      padding: 10px;
      @include prefix(transition, all 0.3s ease, webkit ms moz o);
      &.active {
        transform: rotate(90deg);
      }
    }
    &.active {
      height: calc(100% - 20px);
    }
  }
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 15px;
}

.card-header {
	padding: 15px;
	margin-bottom: 0;
  &-collapse {
    padding-right: 50px;
    position: relative;
  }
}

.card-footer {
	padding: 15px;
}

{# /* // Tooltip card */ #}

.tooltip-trigger {
  fill: currentcolor;
  background: none;
  border: none;
}

.tooltip-card {
  position: absolute;
  top: calc(100% + 8px);
  right: 0;
  z-index: 100;
  display: none;
  min-width: 260px;
  max-width: calc(100vw - 20px);
  padding: 10px;
  white-space: normal;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, .08), 0 0 1px rgba(0, 0, 0, .12);
}

.tooltip-container:hover .tooltip-card,
.tooltip-card.is-visible {
  display: block;
}

{# /* // Captcha */ #}

.g-recaptcha {
  margin-bottom: 24px;
}

.g-recaptcha > div {
  margin: 0 auto;
}

.grecaptcha-badge {
  bottom: 100px !important;
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Header */ #}

.head-main {
  &.compress {
    .logo-img {
        max-height: 35px;
    }
  }
  a {
    cursor: pointer;
  }
}

{# Yamuna desktop header: replace the theme's separated rows with one capsule. #}
@media (min-width: 768px) {
  .head-main .section-topbar,
  .head-main > .container-fluid {
    display: none !important;
  }

  .head-main {
    min-height: 0;
    padding: 10px 0;
    background: transparent !important;
  }

  .head-main.head-fix {
    background: rgba(255, 255, 255, .96) !important;
  }

  .yamuna-header-desktop {
    display: flex !important;
    width: min(100% - 48px, 760px);
    min-height: 54px;
    margin: 0 auto;
    padding: 0 14px 0 18px;
    align-items: center;
    border-radius: 28px;
    background: #a31460;
    box-shadow: 0 2px 5px rgba(70, 16, 52, .22);
    color: #fff;
  }

  .yamuna-header-desktop a,
  .yamuna-header-desktop svg {
    color: #fff;
    fill: #fff;
  }

  .yamuna-header-desktop-logo {
    display: flex;
    width: 64px;
    flex: 0 0 64px;
    align-items: center;
  }

  .yamuna-header-desktop-logo .logo-img-container {
    max-width: 58px;
  }

  .yamuna-header-desktop-logo .logo-img {
    max-width: 58px;
    max-height: 38px;
    margin: 0;
    filter: brightness(0) invert(1);
  }

  .yamuna-header-desktop-logo .logo-text {
    color: #fff;
    font-size: 15px;
  }

  .yamuna-header-desktop-nav {
    min-width: 0;
    flex: 1 1 auto;
  }

  .yamuna-header-desktop-nav .nav-desktop {
    width: auto;
  }

  .yamuna-header-desktop-nav .nav-item {
    padding: 0 3px;
  }

  .yamuna-header-desktop-nav .nav-list-link {
    padding: 0 5px;
    color: #fff;
    font-family: 'Raleway', sans-serif;
    font-size: 10px;
    font-weight: 700;
    line-height: 54px;
    letter-spacing: 0;
    text-transform: uppercase;
  }

  .yamuna-header-desktop-nav .nav-list-arrow > i {
    color: #fff;
  }

  .yamuna-header-desktop-search {
    width: 170px;
    flex: 0 1 170px;
    margin: 0 9px 0 10px;
  }

  .yamuna-header-desktop-search .search-container {
    margin: 0;
  }

  .yamuna-header-desktop-search .form-control {
    height: 28px;
    padding: 4px 30px 4px 11px;
    border: 1px solid rgba(255, 255, 255, .78);
    border-radius: 15px;
    background: transparent;
    color: #fff;
    font-size: 11px;
  }

  .yamuna-header-desktop-search .form-control::placeholder {
    color: rgba(255, 255, 255, .8);
  }

  .yamuna-header-desktop-search .search-input-submit {
    top: -4px;
    right: 0;
    padding: 6px;
  }

  .yamuna-header-desktop-search .search-input-submit svg {
    width: 16px;
    height: 16px;
  }

  .yamuna-header-desktop-utilities {
    display: flex;
    flex: 0 0 auto;
    align-items: center;
  }

  .yamuna-header-desktop-utilities .utilities-container {
    display: flex;
    align-items: center;
  }

  .yamuna-header-desktop-utilities .utilities-item {
    padding: 5px 4px;
  }

  .yamuna-header-desktop-utilities .utility-name {
    display: none !important;
  }

  .yamuna-header-desktop-utilities .icon-2x {
    width: 17px;
    height: 17px;
  }

  .yamuna-header-desktop-utilities .badge-amount {
    top: -2px;
    right: -4px;
    background: #fff;
    color: #a31460;
  }
}

@media (min-width: 768px) and (max-width: 1050px) {
  .yamuna-header-desktop {
    width: min(100% - 30px, 700px);
  }

  .yamuna-header-desktop-nav .nav-item {
    padding: 0 1px;
  }

  .yamuna-header-desktop-nav .nav-list-link {
    font-size: 9px;
  }

  .yamuna-header-desktop-search {
    width: 135px;
    margin-right: 5px;
    margin-left: 5px;
  }
}

{# /* // Nav */ #}

.modal-nav-hamburger {
  text-align: left;
  padding: 0;
  border-radius: 0;
  .modal-header {
      margin-top: 25px;
      .modal-close {
        margin: 0;
        padding: 5px;
      }
  }
  .modal-close {
    margin: 0 0 0 15px; 
  }
  .navigation-topbar {
    padding: 5px 0;
    margin: 0 0 15px 0;
    font-size: 16px;
  }
  .tooltip {
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    transition-delay: .3s;
    opacity: 0;
    @include prefix(transform, translate(0, 40%), webkit ms moz o);
  }
  &.modal-show {
    .tooltip {
      @include prefix(transform, translate(0, 0%), webkit ms moz o);
      opacity: 1;
    }
  }
}

.nav-primary {
  height: 100%;
  padding: 0 0 80px;
  overflow: auto;
  .nav-list {
    padding: 10px 0 10px 0;
    margin-top: 0;
    list-style: none;
    .nav-item {
      display: block;
      padding: 0;
      border-top-style: solid;
      border-top-width: 1px;
    }
    .item-with-subitems {
      position: relative;
    }
    .nav-list-link {
      position: relative;
      display: block;
      padding: 15px;
      font-size: 16px;
      font-weight: 500;
      line-height: 20px;
      border-bottom: 0;
    }
    &-arrow {
      position: absolute;
      top: 50%;
      right: 20px;
      margin-top: -10px;
      font-size: 14px;
      cursor: pointer;
    }
    .active .nav-list-arrow {
      transform: rotate(90deg);
    }
    .list-subitems {
      padding: 0;
      list-style: none;
      .nav-list-link {
        font-weight: 400;
      }
    }
  }

}

.nav-account {
  display: flex;
  margin: 0;
  padding: 7px 0;
  align-items: center;
  list-style: none;
  box-shadow: -9px 9px 5px 9px rgba(0,0,0,0.4);
  .nav-accounts-item {
    display: inline-block;
    margin: 10px;
    font-size: 14px;
  } 
}

.hamburger-panel{
    box-shadow: none;
    .btn-hamburger-close {
        right: 15px;
        top: 6px;
        font-size: 18px;
    }
    .list-items {
        padding: 45px 0 10px;
        .hamburger-panel-link {
            display: block;
            padding: 20px;
            letter-spacing: 1px;
            font-weight: 400;
            border-bottom: 0;
        }
        .list-subitems { 
            padding: 0;
        }
    }
    .hamburger-panel-arrow {
        font-size: 12px;
        &.selected {
            transform: rotate(90deg);
        }
    }
    .hamburger-panel-first-row {
        background: none;
        .mobile-accounts{
            padding: 0 12px;
            .mobile-accounts-item {
                width: auto;
                display: inline-block;
                .mobile-accounts-link {
                    padding: 10px 5px;
                    font-size: 12px;
                    opacity: 0.6;
                }
                &:first-child a:after {
                position: relative;
                right: -7px;
                content: "|";
                }
            }
        }
    }
  &-arrow{
    top: 15px;
    right: 10px;
    margin-top: -10px;
    &.selected i{
      transform-origin: center;
      transform: rotate(180deg);
      -webkit-transform: rotate(180deg);
      -moz-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
      -o-transform: rotate(180deg);
    }
  }
}

.desktop-dropdown::-webkit-scrollbar {
  width: 10px;
}

.desktop-list-subitems {
  padding: 15px 25px 25px 25px;
  text-align: left;
  -webkit-column-count: 5;  
  -webkit-column-gap: 20px;   
  -moz-column-count: 5;   
  -moz-column-gap: 20px;
  column-count: 5;  
  column-gap: 20px;  
  .nav-item {
    display: block;
    margin: 0;
    padding: 0;
    -webkit-column-break-inside: avoid;
    break-inside: avoid;
    .nav-list-link {
      font-weight: 700;
    }
    .list-subitems {
      padding: 0;
      margin: 0 0 35px 0;
      .nav-item {
        .nav-list-link {
          font-weight: 400;
        }
        .list-subitems {
          margin: 0 0 0 8px;
          .nav-list-link {
            padding: 0px 0 0 10px;
            border-left-width: 1px;
            border-left-style: solid;
            line-height: 15px;
            font-size: 12px;
          }
        }
      }
    }
  }
  .nav-list-link {
    display: block;
    margin-bottom: 10px;
    line-height: 20px;
  }
}

.nav-categories-container {
  position: relative;
}
.nav-categories-container:after,
.nav-categories-container:before {
  position: absolute;
  display: block;
  height: 100%;
  width: 20px;
  left: 0;
  top: 0;
  content: "";
}
.nav-categories-container:after {
  right: 0;
  left: auto;
  transform: rotate(180deg);
}

.nav-dropdown-content:hover,
.nav-dropdown:hover .nav-dropdown-content,
.nav-desktop-list:hover .nav-main-item.selected .nav-dropdown-content {
  visibility: visible;
  opacity: 1;
  pointer-events: auto;
  transition-delay: 0s;
}

{# /* // Utilities */ #}

.subutility-list {
  position: absolute;
  width: max-content;
  {% if settings.icons_size_desktop == 'small' %}
    top: 45px;
  {% else %}
    top: 65px;
  {% endif %}
  left: 50%;
  padding: 10px;
  margin: 0;
  list-style: none;
  border-radius: 4px;
  transform: translateX(-50%)!important;
  -webkit-transform: translateX(-50%)!important;
  -ms-transform: translateX(-50%)!important;
  text-align: left;
  z-index:10000;
}

.subutility-list-item {
  padding: 5px;
}

{# /* // Search */ #}

.search-input {
  padding-right: 30px;
}

.search-input[type="search"]::-webkit-search-cancel-button {
  -webkit-appearance:none
}

.search-suggest {
  position: absolute;
  z-index: 99999;
  width: 100%;
  max-height: calc(100vh - 140px);
  border-radius: 6px;
  overflow-y: auto;
  overflow-x: hidden;
  .search-suggest-list {
    margin: 0 0 10px 0;
    padding: 12px 12px 6px 12px;
    .search-suggest-item {
      padding: 10px 15px;
      text-align: left;
      list-style: none;
      .search-suggest-text,
      .search-suggest-name {
        margin-bottom: 5px;
        line-height: 18px;
      }
     .search-suggest-icon {
        margin: 0 10px;
        font-size: 14px;
      }
    }
  }
  &-image {
    width: 50px;
  }
}

{# Yamuna desktop search panel: Figma suggestions on focus, native previews while typing. #}
@media (min-width: 768px) {
  body.template-home .head-main .yamuna-header-desktop {
    position: relative;
    z-index: 2;
  }

  body.template-home .head-main .yamuna-header-desktop::before { z-index: 2; }
  body.template-home .head-main .yamuna-header-desktop-logo,
  body.template-home .head-main .yamuna-header-desktop-utilities { position: relative; z-index: 3; }

  body.template-home .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-search { z-index: auto; }

  body.template-home .head-main .yamuna-header-desktop-nav > .nav-desktop > .nav-desktop-list > .nav-main-item > .nav-item-container,
  body.template-home .head-main .yamuna-header-desktop-search .js-search-container { position: relative; z-index: 3; }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item > .nav-list-link,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item > .nav-item-container > .nav-list-link,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item > .nav-item-container .nav-list-arrow {
    position: relative;
    z-index: 4;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item {
    z-index: auto;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-suggest {
    position: fixed;
    top: var(--yamuna-menu-top, 49px);
    left: var(--yamuna-menu-left, 50%);
    z-index: 1;
    display: none;
    width: var(--yamuna-menu-width, min(1088px, calc(100vw - 48px)));
    min-height: 130px;
    max-height: 358px;
    margin: 0;
    padding: 0;
    overflow: hidden;
    transform: none;
    border-radius: 0 0 24px 24px;
    background: #fff;
    box-shadow: 4px 4px 8px rgba(0, 0, 0, .15);
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-suggest.yamuna-search-open {
    display: block;
  }

  body.template-home .head-main .yamuna-header-desktop-search .yamuna-search-default {
    display: block;
    padding: 54px 96px 32px;
  }

  body.template-home .head-main .yamuna-header-desktop-search .yamuna-search-default-title {
    display: block;
    margin-bottom: 12px;
    color: #34333d;
    font-family: Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 600;
  }

  body.template-home .head-main .yamuna-header-desktop-search .yamuna-search-chips {
    display: flex;
    flex-wrap: wrap;
    gap: 10px 14px;
  }

  body.template-home .head-main .yamuna-header-desktop-search .yamuna-search-chip {
    padding: 6px 12px;
    color: #238482;
    border: 1px solid #238482;
    border-radius: 20px;
    background: #fff;
    font-family: Dosis, Arial, sans-serif;
    font-size: 16px;
    font-weight: 600;
    line-height: 1.1;
    cursor: pointer;
  }

  body.template-home .head-main .yamuna-header-desktop-search .yamuna-search-chip:hover {
    color: #fff;
    background: #238482;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-suggest-list {
    padding: 16px 28px;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-suggest-list .search-suggest-item {
    padding: 10px;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-suggest-list .search-suggest-link {
    color: #238482;
  }
}

{# Keep carousel content inside the viewport on tablet and compact desktop widths. #}
@media (max-width: 1199px) {
  body.template-home,
  body.template-home .section-featured-home {
    overflow-x: hidden;
  }
}

.modal-nav-search {
  border-radius: 0;
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

footer {
  margin-top: 20px;
  padding-top: 50px;
  &.section-footer-home {
    @extend %section-margin-invert;
  }
}

{# /* // Nav */ #}

.footer-menu {
  margin: 0 0 35px;
  padding: 0;
  list-style: none;
  &-item{
    display: block;
    margin-bottom: 20px;
  }
  &-link{
    display: block;
  }
}

{# /* // Social */ #}

.social-icon-rounded {
  display: inline-block;
  width: 45px;
  height: 45px;
  margin: 0 10px 10px 0;
  line-height: 45px;
  text-align: center;
  border-radius: 50%;
  vertical-align: top;
  &:last-child {
    margin: 0;
  }
}

{# /* // Legal */ #}

.footer-payments-shipping-logos{
  img {
    width: auto;
    max-height: 25px;
    margin: 2px;
  }
}

.powered-by-text {
  display: inline-block;
}

.powered-by-logo {
  display: inline-block;
  width: 125px;
}

.copyright {
  padding-top: 15px;
}

.footer-legal {
  padding: 20px 0;
  font-size: 12px;
}

.footer-logo {
  display: inline-block;
  margin-right: 15px;
  img {
    max-height: 100px;
  }
  &:last-child {
    margin: 0;
  }
}    
   
{#/*============================================================================
  #Home Page
==============================================================================*/#}

.section-video-home,
.section-featured-home,
.section-brands-home,
.section-newsletter-home,
.section-instafeed-home {
  @extend %section-margin;
}

{# Newsletter sits flush against the footer (no white gap). #}
.section-newsletter-home {
  margin-bottom: 0;
}

{# Keep Yamuna's home product carousels visually continuous. #}
.section-featured-home {
  margin-top: 0;
  margin-bottom: 0;
}

{# Yamuna product-family links below the benefits bar. #}
.section-yamuna-category-slider {
  display: none;
  margin: 0;
  padding: 34px 20px 42px;
  background: #f8f7f8;
}

.section-yamuna-category-slider-desktop {
  margin: 0;
  padding: 34px 20px 42px;
  background: #f8f7f8;
}

.yamuna-category-slider-desktop-container {
  display: flex;
  align-items: center;
  max-width: 1280px;
  margin: 0 auto;
}

.yamuna-category-slider-desktop-list {
  flex: 1;
  overflow: hidden;
}

.yamuna-category-slider-desktop-track {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: clamp(22px, 6vw, 94px);
}

.yamuna-category-slider-desktop-arrow {
  width: 36px;
  height: 36px;
  padding: 0;
  flex: 0 0 36px;
  color: #238482;
  border: 0;
  background: transparent;
  font-family: Arial, sans-serif;
  font-size: 34px;
  font-weight: 300;
  line-height: 1;
  cursor: pointer;
}

.yamuna-category-slider-desktop-arrow:hover,
.yamuna-category-slider-desktop-arrow:focus {
  color: #a31460;
}

.yamuna-category-slider-desktop-item {
  display: flex;
  align-items: center;
  flex-direction: column;
  color: #68264f;
  font-family: 'Dosis', sans-serif;
  font-size: 16px;
  font-weight: 600;
  line-height: 1.2;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
}

.yamuna-category-slider-desktop-item:hover { color: #a31460; }

.yamuna-category-slider-desktop-image {
  display: flex;
  width: 142px;
  height: 142px;
  margin-bottom: 12px;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  border: 1px solid #d9d3db;
  border-radius: 50%;
  background: #fff;
}

.yamuna-category-slider-desktop-image img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: contain;
}

{# Remove the native gap between the home hero and the category links. #}
.js-home-main-slider-container .js-live-preview-home-slider-container,
.js-home-main-slider-container .js-home-main-slider-visibility,
.js-home-mobile-slider-visibility {
  margin-bottom: 0 !important;
}

.yamuna-category-slider-container {
  display: flex;
  position: relative;
  align-items: center;
  max-width: 1280px;
  margin: 0 auto;
}

.yamuna-category-slider-list {
  display: block;
  flex: 1;
}

.yamuna-category-slider-track {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: clamp(22px, 6vw, 94px);
}

.yamuna-category-slider-item {
  display: flex;
  align-items: center;
  flex-direction: column;
  color: #68264f;
  font-family: 'Dosis', sans-serif;
  font-size: 15px;
  font-weight: 600;
  line-height: 1.2;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
}

.yamuna-category-slider-item:hover {
  color: #a31460;
}

.yamuna-category-slider-image {
  display: flex;
  width: 112px;
  height: 112px;
  align-items: center;
  justify-content: center;
  margin-bottom: 12px;
  padding: 5px;
  border: 1px solid #d7d3d6;
  border-radius: 50%;
  background: #fff;
  transition: border-color .2s ease;
}

.yamuna-category-slider-item:hover .yamuna-category-slider-image {
  border-color: #238482;
}

.yamuna-category-slider-image img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: contain;
}

.yamuna-category-slider-arrow {
  display: flex;
  width: 36px;
  height: 36px;
  flex: 0 0 36px;
  align-items: center;
  justify-content: center;
  color: #238482;
  font-family: Arial, sans-serif;
  font-size: 34px;
  font-weight: 300;
  line-height: 1;
  text-decoration: none;
}

.yamuna-category-slider-arrow:hover {
  color: #a31460;
}

{# Independent Yamuna category highlights. #}
.section-yamuna-category-highlights {
  margin: 0;
  padding: 0 20px 62px;
  background: #f8f7f8;
}

{# The native image-and-text modules are Yamuna's two category highlight banners. #}
[data-store="home-image-text-module"] {
  margin: 0;
  padding: 0 20px 32px;
  background: #f8f7f8;
}

[data-store="home-image-text-module"] .js-banner-container {
  display: grid;
  width: min(1312px, calc(100vw - 128px)) !important;
  max-width: none !important;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 32px;
  margin: 0 auto;
  padding: 0;
}

[data-store="home-image-text-module"] .js-banner {
  width: 100%;
  min-width: 0;
  margin: 0;
  padding: 0;
}

[data-store="home-image-text-module"] .js-textbanner,
[data-store="home-image-text-module"] .js-textbanner .row {
  margin: 0;
}

[data-store="home-image-text-module"] .js-textbanner .row {
  display: block;
  position: relative !important;
  aspect-ratio: 640 / 348;
  overflow: hidden;
  border-radius: 24px;
}

[data-store="home-image-text-module"] .textbanner-image {
  position: absolute !important;
  inset: 0;
  width: 100% !important;
  height: 100% !important;
  padding: 0;
}

/* The native module uses Bootstrap's col-md-6 for its text/image split.
   Yamuna's version is an image card, so the image layer must span all 12 columns. */
[data-store="home-image-text-module"] .js-textbanner-image-container {
  position: absolute !important;
  inset: 0;
  width: 100% !important;
  max-width: 100% !important;
  flex: 0 0 100% !important;
}

[data-store="home-image-text-module"] .js-textbanner-text {
  position: absolute !important;
  width: auto !important;
  max-width: none !important;
  flex: none !important;
}

[data-store="home-image-text-module"] .textbanner-image img {
  width: 100%;
  height: 100%;
  aspect-ratio: 624 / 339;
  border-radius: 0;
  object-fit: cover;
}

[data-store="home-image-text-module"] .js-textbanner-text {
  display: flex;
  position: absolute;
  right: 0;
  bottom: 0;
  left: 23.125%;
  z-index: 2;
  min-height: 48px;
  align-items: center;
  justify-content: space-between;
  padding: 6px 8px 6px 30px;
  border-radius: 24px;
  background: #238482;
  color: #fff;
  text-align: left;
}

[data-store="home-image-text-module"] .textbanner-title {
  margin: 0;
  color: #fff;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 600;
  line-height: 1.2;
  text-transform: uppercase;
}

[data-store="home-image-text-module"] .js-textbanner-text .btn {
  display: inline-flex !important;
  width: 136px;
  min-width: 136px;
  min-height: 32px;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 0 12px;
  border: 1px solid #fff;
  border-radius: 999px;
  background: transparent;
  color: #fff;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 600;
  line-height: 1;
  text-transform: uppercase;
}

[data-store="home-image-text-module"] .js-textbanner-text .btn:after {
  font-size: 20px;
  font-weight: 400;
  line-height: 1;
  content: '?';
}

[data-store="home-image-text-module"] .js-textbanner-text .btn:after {
  display: none;
  content: none;
}

[data-store="home-image-text-module"] .yamuna-home-module-cta-icon {
  display: block;
  width: 16px;
  height: 16px;
  flex: 0 0 16px;
  fill: currentColor;
}

@media (min-width: 1024px) {
  [data-store="home-image-text-module"] .js-textbanner-text {
    height: 58px;
    min-height: 58px;
    padding: 0 8px 0 30px !important;
  }
}

.yamuna-category-highlights-container {
  display: grid;
  max-width: 1280px;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 20px;
  margin: 0 auto;
}

.yamuna-category-highlight {
  display: block;
  position: relative;
  overflow: hidden;
  border-radius: 24px;
  background: #e8e3e6;
  color: #fff;
  text-decoration: none;
}

.yamuna-category-highlight:after {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  height: 46%;
  background: linear-gradient(transparent, rgba(0, 0, 0, .3));
  content: '';
}

.yamuna-category-highlight img {
  display: block;
  width: 100%;
  aspect-ratio: 624 / 339;
  object-fit: cover;
  transition: transform .35s ease;
}

.yamuna-category-highlight:hover img {
  transform: scale(1.035);
}

.yamuna-category-highlight-caption {
  display: flex;
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1;
  min-height: 48px;
  align-items: center;
  justify-content: space-between;
  padding: 9px 14px 9px 23px;
  border-radius: 999px 0 0 0;
  background: #238482;
  color: #fff;
  font-family: 'Raleway', sans-serif;
  text-transform: uppercase;
}

.yamuna-category-highlight-caption strong {
  font-size: clamp(13px, 1.25vw, 19px);
  font-weight: 700;
}

.yamuna-category-highlight-caption > span {
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  gap: 7px;
  padding: 0 12px;
  border: 1px solid #fff;
  border-radius: 999px;
  font-size: 11px;
  font-weight: 700;
}

.yamuna-category-highlight-caption b {
  font-size: 16px;
  line-height: 1;
}

@media (max-width: 767px) {
  .section-yamuna-category-slider-desktop {
    display: none;
  }

  .section-yamuna-category-slider {
    display: block;
    padding: 26px 0 42px;
    background: #fff;
  }

  .yamuna-category-slider-container {
    display: block;
    position: relative;
    z-index: 1;
    width: 100%;
    min-height: 104px;
  }

  .yamuna-category-slider-list {
    display: block;
    width: 257px;
    max-width: calc(100% - 62px);
    margin: 0 auto;
    overflow: hidden;
  }

  .yamuna-category-slider-track {
    display: flex;
    align-items: flex-start;
    gap: 0 !important;
  }

  .yamuna-category-slider-item {
    width: 69px !important;
    min-width: 69px;
    flex: 0 0 69px !important;
    color: #4a1d3a;
    font-size: 12px;
    font-weight: 600;
    line-height: 15px;
    scroll-snap-align: none;
  }

  .yamuna-category-slider-image {
    width: 69px;
    height: 69px;
    margin-bottom: 5px;
    padding: 0;
    border-color: #c0bbc3;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .14);
  }

  .yamuna-category-slider-arrow {
    position: absolute;
    top: 20px;
    z-index: 1;
    display: flex;
    width: 24px;
    height: 69px;
    flex: 0 0 auto;
    color: #238482;
    padding: 0;
    border: 0;
    background: transparent;
    cursor: pointer;
    font-size: 31px;
    line-height: 1;
  }

  .yamuna-category-slider-arrow-prev {
    left: 7px;
  }

  .yamuna-category-slider-arrow-next {
    right: 7px;
  }

  .section-yamuna-category-highlights {
    padding: 0 16px;
  }

  [data-store="home-image-text-module"] {
    padding: 0 12px;
  }

  [data-store="home-image-text-module"] .js-home-modules {
    margin-bottom: 0;
  }

  [data-store="home-image-text-module"] .js-banner-container {
    width: 100% !important;
    grid-template-columns: 1fr;
    gap: 14px;
  }

  [data-store="home-image-text-module"] .textbanner-image img {
    border-radius: 0;
  }

  [data-store="home-image-text-module"] .js-textbanner .row {
    border-radius: 16px;
  }

  [data-store="home-image-text-module"] .js-textbanner-text {
    top: auto;
    right: 0;
    bottom: 0;
    left: 0;
    width: 100% !important;
    height: 32px;
    min-height: 32px;
    padding: 0 8px 0 22px;
    border-radius: 24px;
  }

  [data-store="home-image-text-module"] .textbanner-title {
    font-size: 14px;
  }

  [data-store="home-image-text-module"] .js-textbanner-text .btn {
    width: auto;
    min-width: 91px;
    min-height: 24px;
    padding: 0 10px;
    font-family: 'Dosis', sans-serif;
    font-size: 14px;
    font-weight: 600;
  }

  [data-store="home-image-text-module"] .js-textbanner-text .btn:after {
    font-size: 15px;
  }

  .yamuna-category-highlights-container {
    grid-template-columns: 1fr;
    gap: 14px;
  }

  .yamuna-category-highlight {
    border-radius: 13px;
  }

  .yamuna-category-highlight-caption {
    min-height: 43px;
    padding-left: 16px;
  }
}

{# Keep the mobile composition through tablet; the two-column card grid begins at 1024px. #}
@media (min-width: 768px) and (max-width: 1023px) {
  [data-store="home-image-text-module"] {
    padding: 0 12px;
  }

  [data-store="home-image-text-module"] .js-banner-container {
    width: 100% !important;
    grid-template-columns: 1fr;
    gap: 14px;
  }

  [data-store="home-image-text-module"] .js-textbanner .row {
    border-radius: 16px;
  }

  [data-store="home-image-text-module"] .js-textbanner-text {
    top: auto;
    right: 0;
    bottom: 0;
    left: 0;
    width: 100% !important;
    height: clamp(40px, 4.7vw, 48px);
    min-height: clamp(40px, 4.7vw, 48px);
    padding: 0 clamp(10px, 1.5vw, 16px) 0 clamp(24px, 3vw, 30px);
    border-radius: 24px;
  }

  [data-store="home-image-text-module"] .textbanner-title {
    font-size: clamp(16px, 1.9vw, 18px);
  }

  [data-store="home-image-text-module"] .js-textbanner-text .btn {
    width: auto;
    min-width: clamp(108px, 12.3vw, 126px);
    min-height: clamp(28px, 3.2vw, 32px);
    padding: 0 10px;
    font-family: 'Dosis', sans-serif;
    font-size: clamp(15px, 1.7vw, 16px);
    font-weight: 600;
  }

  [data-store="home-image-text-module"] .js-textbanner-text .btn:after {
    font-size: clamp(16px, 1.9vw, 20px);
  }
}

{# Brand statement between the Yamuna product carousels. #}
.section-yamuna-information {
  overflow: hidden;
  background: #f8f7f8;
  padding: 24px 0 70px;
}

.yamuna-information-stage {
  position: relative;
  width: 100%;
  min-height: max(668px, 46.39vw);
  margin: 0 auto;
}

.yamuna-information-images,
.yamuna-information-content {
  position: relative;
  z-index: 1;
}

.yamuna-information-image {
  display: block;
  object-fit: cover;
  border-radius: 12px;
}

.yamuna-information-images-top {
  height: max(359px, 24.93vw);
  width: 100%;
}

.yamuna-information-images-top .yamuna-information-image {
  position: absolute;
}

.info-image-top-left {
  left: 6.46%;
  top: 0;
  width: 18.89vw;
  height: 10.90vw;
}

.info-image-top-center {
  left: 62.22%;
  top: 3.125vw;
  width: 12.92vw;
  height: 15.49vw;
}

.info-image-top-right {
  left: 80.07%;
  top: 9.44vw;
  width: 29.44vw;
  height: 15.49vw;
}

.yamuna-information-marquee {
  position: absolute;
  top: 8.47vw;
  left: 0;
  z-index: 0;
  width: 100%;
  height: 10.42vw;
  overflow: hidden;
  display: flex;
  align-items: center;
  padding: 12px 0 18px;
  background: #fff;
  color: #ebc9e1;
  font-family: 'Raleway', sans-serif;
  font-size: clamp(48px, 5vw, 72px);
  font-weight: 800;
  line-height: 1.25;
  text-transform: uppercase;
  white-space: nowrap;
}

.yamuna-information-marquee-track {
  display: inline-flex;
  align-items: center;
  gap: .28em;
  width: max-content;
  animation: yamuna-marquee 30s linear infinite;
}

.yamuna-information-marquee i {
  font-style: normal;
}

@keyframes yamuna-marquee {
  from { transform: translateX(0); }
  to { transform: translateX(-50%); }
}

.yamuna-information-content {
  position: absolute;
  inset: 0;
  z-index: 1;
  display: block;
  width: 100%;
  margin: 0;
}

.info-image-bottom-left {
  position: absolute;
  left: -.90vw;
  top: 20.76vw;
  width: 16.04vw;
  height: 21.04vw;
  border-radius: 0 12px 12px 0;
}

.info-image-bottom-center {
  position: absolute;
  left: 18.54%;
  top: 16.39vw;
  width: 22.22vw;
  height: 30vw;
}

.yamuna-information-copy {
  position: absolute;
  top: 22.5vw;
  left: 44.17%;
  width: 304px;
  color: #68264f;
  font-family: 'Raleway', sans-serif;
}

.yamuna-information-copy p {
  max-width: 304px;
  margin: 0 0 8px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 500;
  line-height: 1.3;
}

.yamuna-information-copy span {
  display: block;
  margin-bottom: 28px;
  color: #393747;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 400;
  line-height: 1.5;
}

.yamuna-information-button {
  display: inline-flex;
  width: 241px;
  align-items: center;
  justify-content: center;
  min-height: 55px;
  padding: 0 48px;
  border-radius: 33px;
  background: #238482;
  color: #fff;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 700;
  line-height: 1;
  text-decoration: none;
  text-transform: uppercase;
}

.yamuna-information-button:hover {
  color: #fff;
  opacity: .9;
}

.info-image-bottom-right {
  position: absolute;
  top: 28.19vw;
  left: 69.38%;
  width: 23.61vw;
  height: 15.49vw;
}

@media (max-width: 767px) {
  .section-yamuna-information {
    padding: 0 0 34px;
    background: #f8f7f8;
  }

  {# The following products section follows the brand statement directly. #}
  [data-store="home-products-sale"].section-featured-home {
    padding-top: 30px;
  }

  .yamuna-information-stage {
    min-height: 0;
  }

  .yamuna-information-images-top {
    position: relative;
    height: 261px;
    padding: 0;
  }

  .yamuna-information-images-top .yamuna-information-image {
    position: absolute;
  }

  .yamuna-information-images-top .info-image-top-left {
    display: none;
  }

  .yamuna-information-images-top .info-image-top-center {
    top: 0;
    left: 12px;
    width: 144px;
    height: 173px;
  }

  .yamuna-information-images-top .info-image-top-right {
    top: 44px;
    right: 12px;
    left: auto;
    width: 142px;
    height: 175px;
  }

  .yamuna-information-marquee {
    position: absolute;
    top: 131px;
    z-index: 2;
    height: 150px;
    min-height: 0;
    margin: 0;
    padding: 0;
    background: transparent;
    font-size: 48px;
    font-weight: 800;
    line-height: normal;
  }

  .yamuna-information-marquee-track {
    gap: 12px;
  }

  .yamuna-information-content {
    position: relative;
    inset: auto;
    display: block;
    width: 100%;
    margin: 0;
    padding: 0;
  }

  .info-image-bottom-left {
    display: none;
  }

  .yamuna-information-copy {
    position: static;
    width: 100%;
    padding: 0 36px;
    text-align: left;
  }

  .info-image-bottom-center,
  .info-image-bottom-right,
  .yamuna-information-button {
    display: none;
  }

  .yamuna-information-copy p {
    max-width: 252px;
    margin: 0 0 8px;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.5;
  }

  .yamuna-information-copy span {
    margin: 0;
    font-size: 16px;
    font-weight: 400;
    line-height: 1.5;
  }
}

.section-banners-home {
  @extend %element-margin;
}

{# /* // Instafeed */ #}

.instafeed-title svg {
  margin-top: 3px;
}

.instafeed-user {
  display: inline-block;
  margin-bottom: 40px;
  max-width: 100%;
  vertical-align: top;
  overflow: hidden;
  text-overflow: ellipsis;
}

.instafeed-link {
  position: relative;
  display: block;
  padding-top: 100%;
  overflow: hidden;
  &:hover,
  &:focus {
    .instafeed-img{
      @include prefix(transform, scale(1.03), webkit ms moz o);
    }
    .instafeed-info {
      opacity: 1;
    }
  }
  .instafeed-img {
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
  }
  .instafeed-info {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    padding: 0;
    text-align: center;
    opacity: 0;
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
    .instafeed-info-item {
      display: inline-block;
      margin-top: 45%;
    }
  }
}


{# /* // Banners */ #}

.textbanner,
.flexible-banner {
  .textbanner-image.overlay,
  .textbanner-image:not(.overlay) img {
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
  }
  &:hover .textbanner-image.overlay,
  &:hover .textbanner-image:not(.overlay) img,
  &:focus .textbanner-image.overlay,
  &:focus .textbanner-image:not(.overlay) img {
    @include prefix(transform, scale(1.03), webkit ms moz o);
  }
}

{# /* // Brands */ #}

.section-brands-home {
  position: relative;
  padding: 50px 0;
  text-align: center;
  line-height: 100px;
}

.brand-image {
  display: inline-block;
  max-width: 100%;
  max-height: 100px;
  vertical-align: middle;
  opacity: 0.5;
  @include prefix(transition, all 0.8s ease, webkit ms moz o);
  &:hover {
    opacity: 1;
  }
}

{# /* // Newsletter */ #}

.newsletter {
  form {
    position: relative;
    .newsletter-btn {
      position: absolute;
      top: 10px;
      right: 15px;
      width: 30px;
      height: 30px;
      text-indent: -99999px;
      &.btn {
        z-index: 9;
      }
    }
  } 
}

{# /* // Placeholder */ #}

.placeholder-overlay {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 9;
    width: 100%;
    height: 100%;  
}

.placeholder-info {
  position: relative;
  top: 50%;
  left: 50%;
  width: 330px;
  padding: 30px 25px;
  text-align: center;
  line-height: 18px;
  transform: translate(-50%, -50%);
  box-sizing: border-box;
  .placeholder-description {
    margin: 20px 0;
  }
  .placeholder-button {
    padding: 8px 15px;
  }
}

{#/*============================================================================
  #Product Grid
==============================================================================*/#}

{# /* // Filters */ #}

.filters-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 30000;
  width: 100%;
  height: 100%;
  .filters-updating-message {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 80%;
    text-align: center;
    @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
    * {
      font-size: 24px;
      font-weight: normal;
    }
  }
}

.filter-input-price-container {
  position: relative; 
  display: inline-block;
  width: 85px;
  margin-right: 5px;
  .filter-input-price {
    padding: 10px 25px 10px 10px;
    font-size: 12px;
  }
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

.section-single-product,
.section-fb-comments,
.section-products-related {
  @extend %section-margin;
}

{# /* // Image */ #}

.fancybox__container .has-inline .fancybox__content,
.fancybox-slide--html .fancybox-content {
  width: 100%;
  height: calc(100% - 20px);
  padding: 0;
  @include prefix(transform, translateY(20px), webkit ms moz o);
  background: transparent;
  .fancybox-close-small {
    {# Hardcoded neutral color to match non iframe fancybox modal #}
    color: #ccc!important;
  }
}

{# Fancybox for stores with Jquery Dependencies #}
.fancybox-slide--html .fancybox-content {
  height: calc(100% - 70px);
}

.fancybox__container .fancybox__slide.has-inline::before {
  display: none
}

.fancybox-toolbar {
  opacity: 1!important;
  visibility: visible!important;
  .fancybox-button {
    display: none!important;
    &.fancybox-button--close{
      display: block!important;
    }
  }
}

.fancybox-close-small {
  display: none!important;
}

.carousel{position:relative;box-sizing:border-box}.carousel *,.carousel *:before,.carousel *:after{box-sizing:inherit}.carousel.is-draggable{cursor:move;cursor:grab}.carousel.is-dragging{cursor:move;cursor:grabbing}.carousel__viewport{position:relative;overflow:hidden;max-width:100%;max-height:100%}.carousel__track{display:flex}.carousel__slide{flex:0 0 auto;width:var(--carousel-slide-width, 60%);max-width:100%;padding:1rem;position:relative;overflow-x:hidden;overflow-y:auto;overscroll-behavior:contain}.has-dots{margin-bottom:calc(0.5rem + 22px)}.carousel__dots{margin:0 auto;padding:0;position:absolute;top:calc(100% + 0.5rem);left:0;right:0;display:flex;justify-content:center;list-style:none;user-select:none}.carousel__dots .carousel__dot{margin:0;padding:0;display:block;position:relative;width:22px;height:22px;cursor:pointer}.carousel__dots .carousel__dot:after{content:"";width:8px;height:8px;border-radius:50%;position:absolute;top:50%;left:50%;transform:translate(-50%, -50%);background-color:currentColor;opacity:.25;transition:opacity .15s ease-in-out}.carousel__dots .carousel__dot.is-selected:after{opacity:1}.carousel__button{width:var(--carousel-button-width, 48px);height:var(--carousel-button-height, 48px);padding:0;border:0;display:flex;justify-content:center;align-items:center;pointer-events:all;cursor:pointer;color:var(--carousel-button-color, currentColor);background:var(--carousel-button-bg, transparent);border-radius:var(--carousel-button-border-radius, 50%);box-shadow:var(--carousel-button-shadow, none);transition:opacity .15s ease}.carousel__button.is-prev,.carousel__button.is-next{position:absolute;top:50%;transform:translateY(-50%)}.carousel__button.is-prev{left:10px}.carousel__button.is-next{right:10px}.carousel__button[disabled]{cursor:default;opacity:.3}.carousel__button svg{width:var(--carousel-button-svg-width, 50%);height:var(--carousel-button-svg-height, 50%);fill:none;stroke:currentColor;stroke-width:var(--carousel-button-svg-stroke-width, 1.5);stroke-linejoin:bevel;stroke-linecap:round;filter:var(--carousel-button-svg-filter, none);pointer-events:none}html.with-fancybox{scroll-behavior:auto}body.compensate-for-scrollbar{overflow:hidden !important;touch-action:none}.fancybox__container{position:fixed;top:0;left:0;bottom:0;right:0;direction:ltr;margin:0;padding:env(safe-area-inset-top, 0px) env(safe-area-inset-right, 0px) env(safe-area-inset-bottom, 0px) env(safe-area-inset-left, 0px);box-sizing:border-box;display:flex;flex-direction:column;color:var(--fancybox-color, #fff);-webkit-tap-highlight-color:rgba(0,0,0,0);overflow:hidden;z-index:1050;outline:none;transform-origin:top left;--carousel-button-width: 48px;--carousel-button-height: 48px;--carousel-button-svg-width: 24px;--carousel-button-svg-height: 24px;--carousel-button-svg-stroke-width: 2.5;--carousel-button-svg-filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, 0.4))}.fancybox__container *,.fancybox__container *::before,.fancybox__container *::after{box-sizing:inherit}.fancybox__container :focus{outline:none}body:not(.is-using-mouse) .fancybox__container :focus{box-shadow:0 0 0 1px #fff,0 0 0 2px var(--fancybox-accent-color, rgba(1, 210, 232, 0.94))}@media all and (min-width: 1024px){.fancybox__container{--carousel-button-width:48px;--carousel-button-height:48px;--carousel-button-svg-width:27px;--carousel-button-svg-height:27px}}.fancybox__backdrop{position:absolute;top:0;right:0;bottom:0;left:0;z-index:-1;background:var(--fancybox-bg, rgba(24, 24, 27, 0.92))}.fancybox__carousel{position:relative;flex:1 1 auto;min-height:0;height:100%;z-index:10}.fancybox__carousel.has-dots{margin-bottom:calc(0.5rem + 22px)}.fancybox__viewport{position:relative;width:100%;height:100%;overflow:visible;cursor:default}.fancybox__track{display:flex;height:100%}.fancybox__slide{flex:0 0 auto;width:100%;max-width:100%;margin:0;padding:48px 8px 8px 8px;position:relative;overscroll-behavior:contain;display:flex;flex-direction:column;outline:0;overflow:auto;--carousel-button-width: 36px;--carousel-button-height: 36px;--carousel-button-svg-width: 22px;--carousel-button-svg-height: 22px}.fancybox__slide::before,.fancybox__slide::after{content:"";flex:0 0 0;margin:auto}@media all and (min-width: 1024px){.fancybox__slide{padding:64px 100px}}.fancybox__content{margin:0 env(safe-area-inset-right, 0px) 0 env(safe-area-inset-left, 0px);padding:36px;color:var(--fancybox-content-color, #374151);background:var(--fancybox-content-bg, #fff);position:relative;align-self:center;display:flex;flex-direction:column;z-index:20}.fancybox__content :focus:not(.carousel__button.is-close){outline:thin dotted;box-shadow:none}.fancybox__caption{align-self:center;max-width:100%;margin:0;padding:1rem 0 0 0;line-height:1.375;color:var(--fancybox-color, currentColor);visibility:visible;cursor:auto;flex-shrink:0;overflow-wrap:anywhere}.is-loading .fancybox__caption{visibility:hidden}.fancybox__container>.carousel__dots{top:100%;color:var(--fancybox-color, #fff)}.fancybox__nav .carousel__button{z-index:40}.fancybox__nav .carousel__button.is-next{right:8px}@media all and (min-width: 1024px){.fancybox__nav .carousel__button.is-next{right:40px}}.fancybox__nav .carousel__button.is-prev{left:8px}@media all and (min-width: 1024px){.fancybox__nav .carousel__button.is-prev{left:40px}}.carousel__button.is-close{position:absolute;top:8px;right:8px;top:calc(env(safe-area-inset-top, 0px) + 8px);right:calc(env(safe-area-inset-right, 0px) + 8px);z-index:40}@media all and (min-width: 1024px){.carousel__button.is-close{right:40px}}.fancybox__content>.carousel__button.is-close{position:absolute;top:-40px;right:0;color:var(--fancybox-color, #fff)}.fancybox__no-click,.fancybox__no-click button{pointer-events:none}.fancybox__spinner{position:absolute;top:50%;left:50%;transform:translate(-50%, -50%);width:50px;height:50px;color:var(--fancybox-color, currentColor)}.fancybox__slide .fancybox__spinner{cursor:pointer;z-index:1053}.fancybox__spinner svg{animation:fancybox-rotate 2s linear infinite;transform-origin:center center;position:absolute;top:0;right:0;bottom:0;left:0;margin:auto;width:100%;height:100%}.fancybox__spinner svg circle{fill:none;stroke-width:2.75;stroke-miterlimit:10;stroke-dasharray:1,200;stroke-dashoffset:0;animation:fancybox-dash 1.5s ease-in-out infinite;stroke-linecap:round;stroke:currentColor}@keyframes fancybox-rotate{100%{transform:rotate(360deg)}}@keyframes fancybox-dash{0%{stroke-dasharray:1,200;stroke-dashoffset:0}50%{stroke-dasharray:89,200;stroke-dashoffset:-35px}100%{stroke-dasharray:89,200;stroke-dashoffset:-124px}}.fancybox__backdrop,.fancybox__caption,.fancybox__nav,.carousel__dots,.carousel__button.is-close{opacity:var(--fancybox-opacity, 1)}.fancybox__container.is-animated[aria-hidden=false] .fancybox__backdrop,.fancybox__container.is-animated[aria-hidden=false] .fancybox__caption,.fancybox__container.is-animated[aria-hidden=false] .fancybox__nav,.fancybox__container.is-animated[aria-hidden=false] .carousel__dots,.fancybox__container.is-animated[aria-hidden=false] .carousel__button.is-close{animation:.15s ease backwards fancybox-fadeIn}.fancybox__container.is-animated.is-closing .fancybox__backdrop,.fancybox__container.is-animated.is-closing .fancybox__caption,.fancybox__container.is-animated.is-closing .fancybox__nav,.fancybox__container.is-animated.is-closing .carousel__dots,.fancybox__container.is-animated.is-closing .carousel__button.is-close{animation:.15s ease both fancybox-fadeOut}.fancybox-fadeIn{animation:.15s ease both fancybox-fadeIn}.fancybox-fadeOut{animation:.1s ease both fancybox-fadeOut}.fancybox-zoomInUp{animation:.2s ease both fancybox-zoomInUp}.fancybox-zoomOutDown{animation:.15s ease both fancybox-zoomOutDown}.fancybox-throwOutUp{animation:.15s ease both fancybox-throwOutUp}.fancybox-throwOutDown{animation:.15s ease both fancybox-throwOutDown}@keyframes fancybox-fadeIn{from{opacity:0}to{opacity:1}}@keyframes fancybox-fadeOut{to{opacity:0}}@keyframes fancybox-zoomInUp{from{transform:scale(0.97) translate3d(0, 16px, 0);opacity:0}to{transform:scale(1) translate3d(0, 0, 0);opacity:1}}@keyframes fancybox-zoomOutDown{to{transform:scale(0.97) translate3d(0, 16px, 0);opacity:0}}@keyframes fancybox-throwOutUp{to{transform:translate3d(0, -30%, 0);opacity:0}}@keyframes fancybox-throwOutDown{to{transform:translate3d(0, 30%, 0);opacity:0}}.fancybox__carousel .carousel__slide{scrollbar-width:thin;scrollbar-color:#ccc rgba(255,255,255,.1)}.fancybox__carousel .carousel__slide::-webkit-scrollbar{width:8px;height:8px}.fancybox__carousel .carousel__slide::-webkit-scrollbar-track{background-color:rgba(255,255,255,.1)}.fancybox__carousel .carousel__slide::-webkit-scrollbar-thumb{background-color:#ccc;border-radius:2px;box-shadow:inset 0 0 4px rgba(0,0,0,.2)}.fancybox__carousel.is-draggable .fancybox__slide,.fancybox__carousel.is-draggable .fancybox__slide .fancybox__content{cursor:move;cursor:grab}.fancybox__carousel.is-dragging .fancybox__slide,.fancybox__carousel.is-dragging .fancybox__slide .fancybox__content{cursor:move;cursor:grabbing}.fancybox__carousel .fancybox__slide .fancybox__content{cursor:auto}.fancybox__carousel .fancybox__slide.can-zoom_in .fancybox__content{cursor:zoom-in}.fancybox__carousel .fancybox__slide.can-zoom_out .fancybox__content{cursor:zoom-out}.fancybox__carousel .fancybox__slide.is-draggable .fancybox__content{cursor:move;cursor:grab}.fancybox__carousel .fancybox__slide.is-dragging .fancybox__content{cursor:move;cursor:grabbing}.fancybox__image{transform-origin:0 0;user-select:none;transition:none}.has-image .fancybox__content{padding:0;background:rgba(0,0,0,0);min-height:1px}.is-closing .has-image .fancybox__content{overflow:visible}.has-image[data-image-fit=contain]{overflow:visible;touch-action:none}.has-image[data-image-fit=contain] .fancybox__content{flex-direction:row;flex-wrap:wrap}.has-image[data-image-fit=contain] .fancybox__image{max-width:100%;max-height:100%;object-fit:contain}.has-image[data-image-fit=contain-w]{overflow-x:hidden;overflow-y:auto}.has-image[data-image-fit=contain-w] .fancybox__content{min-height:auto}.has-image[data-image-fit=contain-w] .fancybox__image{max-width:100%;height:auto}.has-image[data-image-fit=cover]{overflow:visible;touch-action:none}.has-image[data-image-fit=cover] .fancybox__content{width:100%;height:100%}.has-image[data-image-fit=cover] .fancybox__image{width:100%;height:100%;object-fit:cover}.fancybox__carousel .fancybox__slide.has-iframe .fancybox__content,.fancybox__carousel .fancybox__slide.has-map .fancybox__content,.fancybox__carousel .fancybox__slide.has-pdf .fancybox__content,.fancybox__carousel .fancybox__slide.has-video .fancybox__content,.fancybox__carousel .fancybox__slide.has-html5video .fancybox__content{max-width:100%;flex-shrink:1;min-height:1px;overflow:visible}.fancybox__carousel .fancybox__slide.has-iframe .fancybox__content,.fancybox__carousel .fancybox__slide.has-map .fancybox__content,.fancybox__carousel .fancybox__slide.has-pdf .fancybox__content{width:100%;height:80%}.fancybox__carousel .fancybox__slide.has-video .fancybox__content,.fancybox__carousel .fancybox__slide.has-html5video .fancybox__content{width:960px;height:540px;max-width:100%;max-height:100%}.fancybox__carousel .fancybox__slide.has-map .fancybox__content,.fancybox__carousel .fancybox__slide.has-pdf .fancybox__content,.fancybox__carousel .fancybox__slide.has-video .fancybox__content,.fancybox__carousel .fancybox__slide.has-html5video .fancybox__content{padding:0;background:rgba(24,24,27,.9);color:#fff}.fancybox__carousel .fancybox__slide.has-map .fancybox__content{background:#e5e3df}.fancybox__html5video,.fancybox__iframe{border:0;display:block;height:100%;width:100%;background:rgba(0,0,0,0)}.fancybox-placeholder{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0, 0, 0, 0);white-space:nowrap;border-width:0}.fancybox__thumbs{flex:0 0 auto;position:relative;padding:0px 3px;opacity:var(--fancybox-opacity, 1)}.fancybox__container.is-animated[aria-hidden=false] .fancybox__thumbs{animation:.15s ease-in backwards fancybox-fadeIn}.fancybox__container.is-animated.is-closing .fancybox__thumbs{opacity:0}.fancybox__thumbs .carousel__slide{flex:0 0 auto;width:var(--fancybox-thumbs-width, 96px);margin:0;padding:8px 3px;box-sizing:content-box;display:flex;align-items:center;justify-content:center;overflow:visible;cursor:pointer}.fancybox__thumbs .carousel__slide .fancybox__thumb::after{content:"";position:absolute;top:0;left:0;right:0;bottom:0;border-width:5px;border-style:solid;border-color:var(--fancybox-accent-color, rgba(34, 213, 233, 0.96));opacity:0;transition:opacity .15s ease;border-radius:var(--fancybox-thumbs-border-radius, 4px)}.fancybox__thumbs .carousel__slide.is-nav-selected .fancybox__thumb::after{opacity:.92}.fancybox__thumbs .carousel__slide>*{pointer-events:none;user-select:none}.fancybox__thumb{position:relative;width:100%;padding-top:calc(100%/(var(--fancybox-thumbs-ratio, 1.5)));background-size:cover;background-position:center center;background-color:rgba(255,255,255,.1);background-repeat:no-repeat;border-radius:var(--fancybox-thumbs-border-radius, 4px)}.fancybox__toolbar{position:absolute;top:0;right:0;left:0;z-index:20;background:linear-gradient(to top, hsla(0deg, 0%, 0%, 0) 0%, hsla(0deg, 0%, 0%, 0.006) 8.1%, hsla(0deg, 0%, 0%, 0.021) 15.5%, hsla(0deg, 0%, 0%, 0.046) 22.5%, hsla(0deg, 0%, 0%, 0.077) 29%, hsla(0deg, 0%, 0%, 0.114) 35.3%, hsla(0deg, 0%, 0%, 0.155) 41.2%, hsla(0deg, 0%, 0%, 0.198) 47.1%, hsla(0deg, 0%, 0%, 0.242) 52.9%, hsla(0deg, 0%, 0%, 0.285) 58.8%, hsla(0deg, 0%, 0%, 0.326) 64.7%, hsla(0deg, 0%, 0%, 0.363) 71%, hsla(0deg, 0%, 0%, 0.394) 77.5%, hsla(0deg, 0%, 0%, 0.419) 84.5%, hsla(0deg, 0%, 0%, 0.434) 91.9%, hsla(0deg, 0%, 0%, 0.44) 100%);padding:0;touch-action:none;display:flex;justify-content:space-between;--carousel-button-svg-width: 20px;--carousel-button-svg-height: 20px;opacity:var(--fancybox-opacity, 1);text-shadow:var(--fancybox-toolbar-text-shadow, 1px 1px 1px rgba(0, 0, 0, 0.4))}@media all and (min-width: 1024px){.fancybox__toolbar{padding:8px}}.fancybox__container.is-animated[aria-hidden=false] .fancybox__toolbar{animation:.15s ease-in backwards fancybox-fadeIn}.fancybox__container.is-animated.is-closing .fancybox__toolbar{opacity:0}.fancybox__toolbar__items{display:flex}.fancybox__toolbar__items--left{margin-right:auto}.fancybox__toolbar__items--center{position:absolute;left:50%;transform:translateX(-50%)}.fancybox__toolbar__items--right{margin-left:auto}@media(max-width: 640px){.fancybox__toolbar__items--center:not(:last-child){display:none}}.fancybox__counter{min-width:72px;padding:0 10px;line-height:var(--carousel-button-height, 48px);text-align:center;font-size:17px;font-variant-numeric:tabular-nums;-webkit-font-smoothing:subpixel-antialiased}.fancybox__progress{background:var(--fancybox-accent-color, rgba(34, 213, 233, 0.96));height:3px;left:0;position:absolute;right:0;top:0;transform:scaleX(0);transform-origin:0;transition-property:transform;transition-timing-function:linear;z-index:30;user-select:none}.fancybox__container:fullscreen::backdrop{opacity:0}.fancybox__button--fullscreen g:nth-child(2){display:none}.fancybox__container:fullscreen .fancybox__button--fullscreen g:nth-child(1){display:none}.fancybox__container:fullscreen .fancybox__button--fullscreen g:nth-child(2){display:block}.fancybox__button--slideshow g:nth-child(2){display:none}.fancybox__container.has-slideshow .fancybox__button--slideshow g:nth-child(1){display:none}.fancybox__container.has-slideshow .fancybox__button--slideshow g:nth-child(2){display:block}

{# Fancybox for stores with Jquery Dependencies #}
body.compensate-for-scrollbar{overflow:hidden}.fancybox-active{height:auto}.fancybox-is-hidden{left:-9999px;margin:0;position:absolute!important;top:-9999px;visibility:hidden}.fancybox-container{-webkit-backface-visibility:hidden;height:100%;left:0;outline:none;position:fixed;-webkit-tap-highlight-color:transparent;top:0;-ms-touch-action:manipulation;touch-action:manipulation;-webkit-transform:translateZ(0);transform:translateZ(0);width:100%;z-index:99992}.fancybox-container *{box-sizing:border-box}.fancybox-bg,.fancybox-inner,.fancybox-outer,.fancybox-stage{bottom:0;left:0;position:absolute;right:0;top:0}.fancybox-outer{-webkit-overflow-scrolling:touch;overflow-y:auto}.fancybox-bg{background:#1e1e1e;opacity:0;transition-duration:inherit;transition-property:opacity;transition-timing-function:cubic-bezier(.47,0,.74,.71)}.fancybox-is-open .fancybox-bg{opacity:.9;transition-timing-function:cubic-bezier(.22,.61,.36,1)}.fancybox-caption,.fancybox-infobar,.fancybox-navigation .fancybox-button,.fancybox-toolbar{direction:ltr;opacity:0;position:absolute;transition:opacity .25s ease,visibility 0s ease .25s;visibility:hidden;z-index:99997}.fancybox-show-caption .fancybox-caption,.fancybox-show-infobar .fancybox-infobar,.fancybox-show-nav .fancybox-navigation .fancybox-button,.fancybox-show-toolbar .fancybox-toolbar{opacity:1;transition:opacity .25s ease 0s,visibility 0s ease 0s;visibility:visible}.fancybox-infobar{color:#ccc;font-size:13px;-webkit-font-smoothing:subpixel-antialiased;height:44px;left:0;line-height:44px;min-width:44px;mix-blend-mode:difference;padding:0 10px;pointer-events:none;top:0;-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.fancybox-toolbar{right:0;top:0}.fancybox-stage{direction:ltr;overflow:visible;-webkit-transform:translateZ(0);transform:translateZ(0);z-index:99994}.fancybox-is-open .fancybox-stage{overflow:hidden}.fancybox-slide{-webkit-backface-visibility:hidden;display:none;height:100%;left:0;outline:none;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:absolute;text-align:center;top:0;transition-property:opacity,-webkit-transform;transition-property:transform,opacity;transition-property:transform,opacity,-webkit-transform;white-space:normal;width:100%;z-index:99994}.fancybox-slide:before{content:"";display:inline-block;font-size:0;height:100%;vertical-align:middle;width:0}.fancybox-is-sliding .fancybox-slide,.fancybox-slide--current,.fancybox-slide--next,.fancybox-slide--previous{display:block}.fancybox-slide--image{overflow:hidden;padding:44px 0}.fancybox-slide--image:before{display:none}.fancybox-slide--html{padding:6px}.fancybox-content{background:#fff;display:inline-block;margin:0;max-width:100%;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:relative;text-align:left;vertical-align:middle}.fancybox-slide--image .fancybox-content{-webkit-animation-timing-function:cubic-bezier(.5,0,.14,1);animation-timing-function:cubic-bezier(.5,0,.14,1);-webkit-backface-visibility:hidden;background:transparent;background-repeat:no-repeat;background-size:100% 100%;left:0;max-width:none;overflow:visible;padding:0;position:absolute;top:0;-webkit-transform-origin:top left;transform-origin:top left;transition-property:opacity,-webkit-transform;transition-property:transform,opacity;transition-property:transform,opacity,-webkit-transform;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;z-index:99995}.fancybox-can-zoomOut .fancybox-content{cursor:zoom-out}.fancybox-can-zoomIn .fancybox-content{cursor:zoom-in}.fancybox-can-pan .fancybox-content,.fancybox-can-swipe .fancybox-content{cursor:-webkit-grab;cursor:grab}.fancybox-is-grabbing .fancybox-content{cursor:-webkit-grabbing;cursor:grabbing}.fancybox-container [data-selectable=true]{cursor:text}.fancybox-image,.fancybox-spaceball{background:transparent;border:0;height:100%;left:0;margin:0;max-height:none;max-width:none;padding:0;position:absolute;top:0;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;width:100%}.fancybox-spaceball{z-index:1}.fancybox-slide--iframe .fancybox-content,.fancybox-slide--map .fancybox-content,.fancybox-slide--pdf .fancybox-content,.fancybox-slide--video .fancybox-content{height:100%;overflow:visible;padding:0;width:100%}.fancybox-slide--video .fancybox-content{background:#000}.fancybox-slide--map .fancybox-content{background:#e5e3df}.fancybox-slide--iframe .fancybox-content{background:#fff}.fancybox-iframe,.fancybox-video{background:transparent;border:0;display:block;height:100%;margin:0;overflow:hidden;padding:0;width:100%}.fancybox-iframe{left:0;position:absolute;top:0}.fancybox-error{background:#fff;cursor:default;max-width:400px;padding:40px;width:100%}.fancybox-error p{color:#444;font-size:16px;line-height:20px;margin:0;padding:0}.fancybox-button{background:rgba(30,30,30,.6);border:0;border-radius:0;box-shadow:none;cursor:pointer;display:inline-block;height:44px;margin:0;padding:10px;position:relative;transition:color .2s;vertical-align:top;visibility:inherit;width:44px}.fancybox-button,.fancybox-button:link,.fancybox-button:visited{color:#ccc}.fancybox-button:hover{color:#fff}.fancybox-button:focus{outline:none}.fancybox-button.fancybox-focus{outline:1px dotted}.fancybox-button[disabled],.fancybox-button[disabled]:hover{color:#888;cursor:default;outline:none}.fancybox-button div{height:100%}.fancybox-button svg{display:block;height:100%;overflow:visible;position:relative;width:100%}.fancybox-button svg path{fill:currentColor;stroke-width:0}.fancybox-button--fsenter svg:nth-child(2),.fancybox-button--fsexit svg:nth-child(1),.fancybox-button--pause svg:nth-child(1),.fancybox-button--play svg:nth-child(2){display:none}.fancybox-progress{background:#ff5268;height:2px;left:0;position:absolute;right:0;top:0;-webkit-transform:scaleX(0);transform:scaleX(0);-webkit-transform-origin:0;transform-origin:0;transition-property:-webkit-transform;transition-property:transform;transition-property:transform,-webkit-transform;transition-timing-function:linear;z-index:99998}.fancybox-close-small{background:transparent;border:0;border-radius:0;color:#ccc;cursor:pointer;opacity:.8;padding:8px;position:absolute;right:-12px;top:-44px;z-index:401}.fancybox-close-small:hover{color:#fff;opacity:1}.fancybox-slide--html .fancybox-close-small{color:currentColor;padding:10px;right:0;top:0}.fancybox-slide--image.fancybox-is-scaling .fancybox-content{overflow:hidden}.fancybox-is-scaling .fancybox-close-small,.fancybox-is-zoomable.fancybox-can-pan .fancybox-close-small{display:none}.fancybox-navigation .fancybox-button{background-clip:content-box;height:100px;opacity:0;position:absolute;top:calc(50% - 50px);width:70px}.fancybox-navigation .fancybox-button div{padding:7px}.fancybox-navigation .fancybox-button--arrow_left{left:0;padding:31px 26px 31px 6px}.fancybox-navigation .fancybox-button--arrow_right{padding:31px 6px 31px 26px;right:0}.fancybox-caption{bottom:0;color:#eee;font-size:14px;font-weight:400;left:0;line-height:1.5;padding:25px 44px;right:0;text-align:center;z-index:99996}.fancybox-caption:before{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAD6CAQAAADKSeXYAAAAYklEQVQoz42RwQ3AMAgDjfcfup8WoRykfBAK5mQHKSz5rbXJPis1hjiV3CIqgG0hLZPkVkA4p4x5oR1bVeDrdCLrW2Q0D5bcwY3TGMHbdw3mPRuOtaspYP1w//G1OIcW148H0DMCqI/3mMMAAAAASUVORK5CYII=);background-repeat:repeat-x;background-size:contain;bottom:0;content:"";display:block;left:0;pointer-events:none;position:absolute;right:0;top:-44px;z-index:-1}.fancybox-caption a,.fancybox-caption a:link,.fancybox-caption a:visited{color:#ccc;text-decoration:none}.fancybox-caption a:hover{color:#fff;text-decoration:underline}.fancybox-loading{-webkit-animation:a 1s linear infinite;animation:a 1s linear infinite;background:transparent;border:4px solid #888;border-bottom-color:#fff;border-radius:50%;height:50px;left:50%;margin:-25px 0 0 -25px;opacity:.7;padding:0;position:absolute;top:50%;width:50px;z-index:99999}@-webkit-keyframes a{to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}@keyframes a{to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}.fancybox-animated{transition-timing-function:cubic-bezier(0,0,.25,1)}.fancybox-fx-slide.fancybox-slide--previous{opacity:0;-webkit-transform:translate3d(-100%,0,0);transform:translate3d(-100%,0,0)}.fancybox-fx-slide.fancybox-slide--next{opacity:0;-webkit-transform:translate3d(100%,0,0);transform:translate3d(100%,0,0)}.fancybox-fx-slide.fancybox-slide--current{opacity:1;-webkit-transform:translateZ(0);transform:translateZ(0)}.fancybox-fx-fade.fancybox-slide--next,.fancybox-fx-fade.fancybox-slide--previous{opacity:0;transition-timing-function:cubic-bezier(.19,1,.22,1)}.fancybox-fx-fade.fancybox-slide--current{opacity:1}.fancybox-fx-zoom-in-out.fancybox-slide--previous{opacity:0;-webkit-transform:scale3d(1.5,1.5,1.5);transform:scale3d(1.5,1.5,1.5)}.fancybox-fx-zoom-in-out.fancybox-slide--next{opacity:0;-webkit-transform:scale3d(.5,.5,.5);transform:scale3d(.5,.5,.5)}.fancybox-fx-zoom-in-out.fancybox-slide--current{opacity:1;-webkit-transform:scaleX(1);transform:scaleX(1)}.fancybox-fx-rotate.fancybox-slide--previous{opacity:0;-webkit-transform:rotate(-1turn);transform:rotate(-1turn)}.fancybox-fx-rotate.fancybox-slide--next{opacity:0;-webkit-transform:rotate(1turn);transform:rotate(1turn)}.fancybox-fx-rotate.fancybox-slide--current{opacity:1;-webkit-transform:rotate(0deg);transform:rotate(0deg)}.fancybox-fx-circular.fancybox-slide--previous{opacity:0;-webkit-transform:scale3d(0,0,0) translate3d(-100%,0,0);transform:scale3d(0,0,0) translate3d(-100%,0,0)}.fancybox-fx-circular.fancybox-slide--next{opacity:0;-webkit-transform:scale3d(0,0,0) translate3d(100%,0,0);transform:scale3d(0,0,0) translate3d(100%,0,0)}.fancybox-fx-circular.fancybox-slide--current{opacity:1;-webkit-transform:scaleX(1) translateZ(0);transform:scaleX(1) translateZ(0)}.fancybox-fx-tube.fancybox-slide--previous{-webkit-transform:translate3d(-100%,0,0) scale(.1) skew(-10deg);transform:translate3d(-100%,0,0) scale(.1) skew(-10deg)}.fancybox-fx-tube.fancybox-slide--next{-webkit-transform:translate3d(100%,0,0) scale(.1) skew(10deg);transform:translate3d(100%,0,0) scale(.1) skew(10deg)}.fancybox-fx-tube.fancybox-slide--current{-webkit-transform:translateZ(0) scale(1);transform:translateZ(0) scale(1)}@media (max-height:576px){.fancybox-caption{padding:12px}.fancybox-slide{padding-left:6px;padding-right:6px}.fancybox-slide--image{padding:6px 0}.fancybox-close-small{right:-6px}.fancybox-slide--image .fancybox-close-small{background:#4e4e4e;color:#f2f4f6;height:36px;opacity:1;padding:6px;right:0;top:0;width:36px}}.fancybox-share{background:#f4f4f4;border-radius:3px;max-width:90%;padding:30px;text-align:center}.fancybox-share h1{color:#222;font-size:35px;font-weight:700;margin:0 0 20px}.fancybox-share p{margin:0;padding:0}.fancybox-share__button{border:0;border-radius:3px;display:inline-block;font-size:14px;font-weight:700;line-height:40px;margin:0 5px 10px;min-width:130px;padding:0 15px;text-decoration:none;transition:all .2s;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;white-space:nowrap}.fancybox-share__button:link,.fancybox-share__button:visited{color:#fff}.fancybox-share__button:hover{text-decoration:none}.fancybox-share__button--fb{background:#3b5998}.fancybox-share__button--fb:hover{background:#344e86}.fancybox-share__button--pt{background:#bd081d}.fancybox-share__button--pt:hover{background:#aa0719}.fancybox-share__button--tw{background:#1da1f2}.fancybox-share__button--tw:hover{background:#0d95e8}.fancybox-share__button svg{height:25px;margin-right:7px;position:relative;top:-1px;vertical-align:middle;width:25px}.fancybox-share__button svg path{fill:#fff}.fancybox-share__input{background:transparent;border:0;border-bottom:1px solid #d7d7d7;border-radius:0;color:#5d5b5b;font-size:14px;margin:10px 0 0;outline:none;padding:10px 15px;width:100%}.fancybox-thumbs{background:#ddd;bottom:0;display:none;margin:0;-webkit-overflow-scrolling:touch;-ms-overflow-style:-ms-autohiding-scrollbar;padding:2px 2px 4px;position:absolute;right:0;-webkit-tap-highlight-color:transparent;top:0;width:212px;z-index:99995}.fancybox-thumbs-x{overflow-x:auto;overflow-y:hidden}.fancybox-show-thumbs .fancybox-thumbs{display:block}.fancybox-show-thumbs .fancybox-inner{right:212px}.fancybox-thumbs__list{font-size:0;height:100%;list-style:none;margin:0;overflow-x:hidden;overflow-y:auto;padding:0;position:absolute;position:relative;white-space:nowrap;width:100%}.fancybox-thumbs-x .fancybox-thumbs__list{overflow:hidden}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar{width:7px}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-track{background:#fff;border-radius:10px;box-shadow:inset 0 0 6px rgba(0,0,0,.3)}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-thumb{background:#2a2a2a;border-radius:10px}.fancybox-thumbs__list a{-webkit-backface-visibility:hidden;backface-visibility:hidden;background-color:rgba(0,0,0,.1);background-position:50%;background-repeat:no-repeat;background-size:cover;cursor:pointer;float:left;height:75px;margin:2px;max-height:calc(100% - 8px);max-width:calc(50% - 4px);outline:none;overflow:hidden;padding:0;position:relative;-webkit-tap-highlight-color:transparent;width:100px}.fancybox-thumbs__list a:before{border:6px solid #ff5268;bottom:0;content:"";left:0;opacity:0;position:absolute;right:0;top:0;transition:all .2s cubic-bezier(.25,.46,.45,.94);z-index:99991}.fancybox-thumbs__list a:focus:before{opacity:.5}.fancybox-thumbs__list a.fancybox-thumbs-active:before{opacity:1}@media (max-width:576px){.fancybox-thumbs{width:110px}.fancybox-show-thumbs .fancybox-inner{right:110px}.fancybox-thumbs__list a{max-width:calc(100% - 10px)}}

.user-content img {
	max-width: 100%;
	height: auto !important;
}

.social-share-button {
  margin: 5px;
  &:hover,
  &:focus{
    opacity: 0.8;
  }
}

.label-top-left {
  top: 25px;
  left: 25px;
  z-index: 2;
}

.product-image-limited {
  max-height: 320px;
  max-width: 100%;
  object-fit: contain;
}

{#/*============================================================================
  #Cart detail
==============================================================================*/#}


{# /* Table */ #}

.cart-table-row{
  padding: 10px 0;
}

.cart-item{
  position: relative;
  @extend %element-margin;
  &-name{
    float: left;
    width: 100%;
    margin-bottom: 5px;
    padding: 0 40px 10px 0;
    font-weight: normal;
  }
  &-subtotal{
    float: right;
    margin: 10px 0;
    text-align: right;
    font-weight: normal;
  }
  &-btn{
    padding: 6px;
    display: inline-block;
    background: transparent;
    font-size: 16px;
    opacity: 0.8;
    &:hover{
      opacity: 0.6;
    }
  }
  &-input{
    display: inline-block;
    width: 40px;
    height: 30px;
    font-size: 16px;
    text-align: center;
    -moz-appearance:textfield;
    &::-webkit-outer-spin-button,
    &::-webkit-inner-spin-button{
      -webkit-appearance: none;
    }
  }
  .fa-cog{
    display: none;
  }
  &-spinner{
    position: absolute;
    left: 50%;
    width: 40px;
    margin-left: -20px;
    text-align: center;
  }
  &-delete{
    position: absolute;
    right: 0;
    .btn{
      padding-right:0; 
    }
  }
}

.cart-quantity-input-container i{
  padding: 6px 14px;
}

.cart-unit-price{
  float: left;
  width: 100%;
  margin: 5px 0 2px 0;
}


{# /* // Totals */ #}

{# Cart totals component: stack subtotal, taxes and discounts in a single column
   (grid items ignore the legacy .cart-subtotal float, keeping each row full width). #}
.cart-subtotals-container{
  display: grid;
  width: 100%;
}
.cart-subtotal{
  float: right;
  clear: both;
  margin: 0 0 10px 0;
}
.total-promotions-row{
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin-right: -15px;
  margin-left: -15px;
}
.cart-total{
  clear: both;
  margin: 10px 0;
  font-weight: bold;
}

.cart-promotion-detail,
.cart-promotion-number{
  -ms-flex-preferred-size: 0;
  flex-basis: 0;
  -ms-flex-positive: 1;
  flex-grow: 1;
  max-width: 100%;
  position: relative;
  width: 100%;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}

.cart-promotion-number{
  text-align: right;
  font-weight: bold;
}

{#/*============================================================================
  #Contact page
==============================================================================*/#}

.contact-page {
  @extend %section-margin;
}

.contact-item {
  position: relative;
  padding-left: 30px;
  &-icon {
    position: absolute;
    left: 0;
  }
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Min width 768px */ #}

@media (min-width: 768px) { 

  {# /* //// Components */ #}

  {# /* Modals */ #}

  .modal{
    &-centered{
      left: 10%;
      height: 80%;
      width: 80%;
      margin: 5% auto;
      &-small{
        left: 50%;
        width: 40%;
        height: auto;
        max-height: 80%;
        margin: 0;
      }
      &-md.modal-show {
        left: 50%;
        transform: translateX(-50%);
        &.modal-bottom-md,
        &.modal-bottom {
          top: 50%;
          bottom: auto;
          left: 50%;
          height: 100%;
          transform: translate(-50%, -50%);
        }
      }
      &-md-600px {
        width: 600px;
      }
    }
    &-docked-md{
      width: 500px;
    }
    &-docked-small{
      width: 350px;
    }
    &-right{
      border-radius: 6px 0 0 6px;
    }
    &-bottom-md{
      top: 100%;
      left: 0;
      right: 0;
      border-radius: 10px;
      opacity: 0;
      &.modal-show{
        top: 0;
      }
    }
    &-bottom-sheet {
      top: 100%;
      bottom: auto;
      border-radius: 10px;
      &.modal-right-md {
        top: 0;
      }
      &.modal-show {
        top: 0;
        bottom: auto;
      }
    }
    &-bottom {
      transform: translateX(-50%);
      &.modal-centered-md {
        left: 50%;
      }
    }
    &-md-width-400px {
      width: 400px;
      max-width: 90vw;
    }
  }
  .modal-close { 
    position: absolute;
    top: 10px;
    right: 15px;
    width: 32px;
    height: 32px;
    padding: 0 9px;
    margin-right: 0;
    line-height: 30px;
    vertical-align: middle;
    cursor: pointer;
  }

  .fancybox__container .has-inline .fancybox__content,
  .fancybox-slide--html .fancybox-content{
    width: 90%;
    height: auto;
  }

  {# Fancybox for stores with Jquery Dependencies #}
  .fancybox-slide--html .fancybox-content {
    width: 85%;
    padding: 44px;
  }

  {# /* Notifications */ #}

  .notification-floating {
    margin-top: -10px;
  }

  .notification-arrow-up{
    right: calc(32% / 2);
    margin-right: -30px;
  }

  .related-products-notification-container {
    margin-right: 0;
  }

  {# /* Forms */ #}

  .checkbox-container .checkbox-text{
    padding-top: 3px;
  }

  {# /* Filters */ #}

  .filter-input-price-container {
    width: calc(50% - 25px);
    .filter-input-price {
      padding: 8px;
    }
  }

  {# /* Tabs */ #}

  .tab-group{
    width: calc(100% + 20px);
    overflow-x: auto;
    white-space: normal;
    .tab{
      float: left;
    }
  }

  .head-main {
    &.compress {
      .logo-img {
          max-height: 50px;
      }
    }
  }


  {# /* //// Footer */ #}

  .copyright {
    padding: 0;
  }
}

{# /* // Max width 767px */ #}

@media (max-width: 767px) {
  .product-image-limited {
    max-height: 210px;
  }
}

{#/*============================================================================
  #Critical path utilities
==============================================================================*/#}

.visible-when-content-ready{
  visibility: visible!important;
}
.display-when-content-ready{
  display: block!important;
}

{# Yamuna footer #}
footer.yamuna-footer {
  margin-top: 0;
  padding-top: 58px;
  color: #f3f3f3;
  background: #4a1d3a;
  font-family: 'Dosis', sans-serif;
}

footer.yamuna-footer a,
footer.yamuna-footer .contact-link,
footer.yamuna-footer .contact-item-icon {
  color: #f3f3f3;
  fill: #f3f3f3;
}

footer.yamuna-footer .element-footer {
  margin-bottom: 28px;
}

footer.yamuna-footer .yamuna-footer-brand {
  min-width: 180px;
}

footer.yamuna-footer .yamuna-footer-logo {
  max-width: 174px;
  margin: 0 auto 48px;
  padding: 0;
  text-align: center;
}

footer.yamuna-footer .yamuna-footer-logo-img {
  width: 174px;
  max-width: 100%;
  height: auto;
  margin: 0;
}

footer.yamuna-footer .yamuna-footer-logo-text {
  color: #fff;
}

footer.yamuna-footer .yamuna-footer-social {
  display: flex;
  gap: 12px;
  align-items: center;
  justify-content: center;
}

footer.yamuna-footer .yamuna-footer-social a,
footer.yamuna-footer .yamuna-footer-social img {
  width: 20px;
  height: 20px;
  margin: 0;
  display: block;
}

footer.yamuna-footer .h3,
footer.yamuna-footer h4 {
  margin: 0 0 16px;
  color: #f3f3f3;
  font-family: 'Raleway', sans-serif;
  font-size: 16px;
  font-weight: 700;
  line-height: 1.5;
  text-transform: uppercase;
}

footer.yamuna-footer .footer-menu {
  margin: 0;
}

footer.yamuna-footer .footer-menu-item {
  margin-bottom: 4px;
}

footer.yamuna-footer .yamuna-footer-menu-tertiary,
footer.yamuna-footer .yamuna-footer-contact {
  display: none;
}

footer.yamuna-footer .footer-menu-link,
footer.yamuna-footer .contact-info,
footer.yamuna-footer .contact-link {
  font-size: 16px;
  font-weight: 300;
  line-height: 1.5;
}

footer.yamuna-footer .contact-item {
  padding-left: 24px;
  margin-bottom: 4px;
}

footer.yamuna-footer .contact-item-icon {
  width: 18px;
  height: 18px;
  min-width: 18px;
}

footer.yamuna-footer .divider {
  margin: 0 0 25px;
  border-color: #a31460;
  opacity: 1;
}

footer.yamuna-footer .yamuna-footer-payment-bar {
  align-items: center;
  margin-bottom: 0;
  padding: 24px 0;
  border-top: 1px solid #a31460;
  border-bottom: 1px solid #a31460;
}

footer.yamuna-footer .footer-payments-shipping-logos .row {
  margin-bottom: 0 !important;
}

footer.yamuna-footer .footer-payments-shipping-logos .h3 {
  margin-bottom: 0;
}

footer.yamuna-footer .footer-payments-shipping-logos img {
  max-height: 22px;
  margin: 2px 4px 2px 0;
}

footer.yamuna-footer .yamuna-footer-security-content,
footer.yamuna-footer .yamuna-footer-security-logos {
  display: flex;
  align-items: center;
}

footer.yamuna-footer .yamuna-footer-security-content {
  justify-content: flex-end;
  gap: 42px;
}

footer.yamuna-footer .yamuna-footer-security-content .h3 {
  margin: 0;
}

footer.yamuna-footer .yamuna-footer-security-logos {
  gap: 16px;
}

footer.yamuna-footer .yamuna-footer-security-logos img {
  display: block;
  object-fit: contain;
}

footer.yamuna-footer .yamuna-security-google {
  width: 101px;
  height: 26px;
}

footer.yamuna-footer .yamuna-security-site {
  width: 68px;
  height: 32px;
}

footer.yamuna-footer .yamuna-security-ssl {
  width: 57px;
  height: 41px;
}

footer.yamuna-footer .footer-logo img {
  max-height: 48px;
}

footer.yamuna-footer .footer-legal {
  padding: 17px 0;
  color: #f3f3f3;
  background: #4a1d3a;
  font-size: 12px;
  font-weight: 300;
}

footer.yamuna-footer .footer-legal a,
footer.yamuna-footer .powered-by-logo svg {
  color: #f3f3f3;
  fill: #f3f3f3;
}

@media (min-width: 768px) {
  footer.yamuna-footer > .container-fluid,
  footer.yamuna-footer .footer-legal > .container-fluid {
    max-width: 1536px;
    margin-right: auto;
    margin-left: auto;
  }

  footer.yamuna-footer .yamuna-footer-brand {
    flex: 0 0 22%;
    max-width: 22%;
  }

  footer.yamuna-footer .element-footer > .col,
  footer.yamuna-footer .element-footer > .col-md {
    flex-grow: 1;
  }

  footer.yamuna-footer .footer-payments-shipping-logos .row {
    align-items: center;
  }

  footer.yamuna-footer .yamuna-footer-payment-bar > .col-md-9 {
    flex: 0 0 55%;
    max-width: 55%;
  }

  footer.yamuna-footer .yamuna-footer-payment-bar > .yamuna-footer-security {
    flex: 0 0 45%;
    max-width: 45%;
  }
}

@media (max-width: 767px) {
  footer.yamuna-footer {
    padding: 39px 12px 0;
    text-align: center;
  }

  footer.yamuna-footer > .container-fluid,
  footer.yamuna-footer .footer-legal > .container-fluid {
    padding-right: 0;
    padding-left: 0;
  }

  footer.yamuna-footer .element-footer > .col,
  footer.yamuna-footer .element-footer > .col-md {
    flex: 0 0 100%;
    max-width: 100%;
    margin-bottom: 0;
  }

  footer.yamuna-footer .element-footer:first-child {
    display: flex;
    flex-direction: column;
    gap: 24px;
    margin-bottom: 24px;
  }

  footer.yamuna-footer .yamuna-footer-brand {
    order: 1;
    min-width: 0;
    margin-bottom: 0 !important;
    padding-bottom: 27px;
    border-bottom: 1px solid #a31460;
  }

  footer.yamuna-footer .yamuna-footer-logo {
    max-width: 174px;
    margin: 0 auto 28px;
  }

  footer.yamuna-footer .yamuna-footer-logo-img {
    width: 174px;
  }

  footer.yamuna-footer .yamuna-footer-social {
    gap: 20px;
  }

  footer.yamuna-footer .yamuna-footer-social a,
  footer.yamuna-footer .yamuna-footer-social img {
    width: 20px;
    height: 20px;
  }

  footer.yamuna-footer .yamuna-footer-menu-secondary {
    order: 3;
  }

  footer.yamuna-footer .yamuna-footer-menu-sac {
    order: 4;
  }

  footer.yamuna-footer .yamuna-footer-menu-primary {
    order: 2;
  }

  footer.yamuna-footer .yamuna-footer-account {
    order: 5;
  }


  footer.yamuna-footer .h3,
  footer.yamuna-footer h4 {
    margin: 0 0 12px;
    font-size: 16px;
    line-height: 1.5;
  }

  footer.yamuna-footer .footer-menu {
    margin: 0;
  }

  footer.yamuna-footer .footer-menu-item {
    margin-bottom: 3px;
  }

  footer.yamuna-footer .footer-menu-link {
    font-size: 16px;
    line-height: 1.5;
  }

  footer.yamuna-footer .yamuna-footer-payment-bar {
    display: flex;
    flex-direction: column;
    gap: 30px;
    margin: 0;
    padding: 20px 0 25px;
  }

  footer.yamuna-footer .yamuna-footer-payment-bar > .col-md-9,
  footer.yamuna-footer .yamuna-footer-payment-bar > .yamuna-footer-security {
    width: 100%;
    max-width: 100%;
  }

  footer.yamuna-footer .footer-payments-shipping-logos .row {
    display: block;
  }

  footer.yamuna-footer .footer-payments-shipping-logos .row > div {
    width: 100%;
    max-width: 100%;
  }

  footer.yamuna-footer .footer-payments-shipping-logos .h3 {
    margin-bottom: 12px;
  }

  footer.yamuna-footer .footer-payments-shipping-logos img {
    max-height: 22px;
    margin: 3px 4px;
  }

  footer.yamuna-footer .yamuna-footer-security {
    margin-top: 0;
  }

  footer.yamuna-footer .yamuna-footer-security-content {
    display: block;
  }

  footer.yamuna-footer .yamuna-footer-security-content .h3 {
    margin-bottom: 12px;
  }

  footer.yamuna-footer .yamuna-footer-security-logos {
    justify-content: center;
    gap: 16px;
  }

  footer.yamuna-footer .footer-legal {
    padding: 13px 0 20px;
    font-size: 10px;
    line-height: 1.5;
    text-align: center;
  }

  footer.yamuna-footer .footer-legal .row > div {
    text-align: center !important;
  }

  footer.yamuna-footer .powered-by-logo {
    display: inline-block;
    margin-top: 9px;
  }
}

{# Final desktop header state: fixed capsule and supplied Yamuna logo. #}
@media (min-width: 768px) {
  body.template-home .head-main,
  body.template-home .head-main.head-fix {
    position: fixed !important;
    top: 0;
    left: 0;
    z-index: 1050;
    width: 100%;
    padding-top: 20px;
    background: transparent !important;
    transition: padding .34s cubic-bezier(.22, .61, .36, 1);
  }

  body.template-home .head-main .yamuna-header-desktop {
    transition: width .34s cubic-bezier(.22, .61, .36, 1);
  }

  body.template-home .head-main .yamuna-header-desktop::before {
    transition: left .34s cubic-bezier(.22, .61, .36, 1);
  }

  body.template-home .head-main .yamuna-header-desktop-logo {
    position: relative;
    width: 174px;
    height: 59px;
    flex: 0 0 174px;
    padding-left: 0;
    transition: width .34s cubic-bezier(.22, .61, .36, 1), flex-basis .34s cubic-bezier(.22, .61, .36, 1), padding .34s cubic-bezier(.22, .61, .36, 1);
  }

  body.template-home .head-main .yamuna-header-desktop-logo .logo-img-container,
  body.template-home .head-main .yamuna-header-desktop-logo .logo-text {
    display: none !important;
  }

  body.template-home .head-main .yamuna-header-desktop-logo::before {
    display: block;
    width: 174px;
    height: 59px;
    content: '';
    background: url('{{ 'images/yamuna/logo-header.png' | static_url }}') left center / contain no-repeat;
    transition: width .34s cubic-bezier(.22, .61, .36, 1), height .34s cubic-bezier(.22, .61, .36, 1), filter .34s ease;
  }

  html.yamuna-header-scrolled body.template-home .head-main,
  html.yamuna-header-scrolled body.template-home .head-main.head-fix {
    padding-top: 20px;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop {
    width: min(1088px, calc(100% - 48px));
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop::before {
    left: 0;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo {
    width: 112px;
    flex-basis: 112px;
    padding-left: 18px;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo::before {
    width: 76px;
    height: 42px;
    filter: brightness(0) invert(1);
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav {
    margin-left: 16px;
    transition: margin .34s cubic-bezier(.22, .61, .36, 1);
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-utilities {
    margin-right: 18px;
    transition: margin .34s cubic-bezier(.22, .61, .36, 1);
  }

  body.template-home .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-utilities {
    transition: margin .34s cubic-bezier(.22, .61, .36, 1);
  }
}

{# Navbar layout overrides must remain last to beat the legacy header rules above. #}
@media (min-width: 768px) {
  body.template-home .head-main .yamuna-header-desktop {
    display: grid !important;
    grid-template-columns: 174px auto minmax(240px, 392px) 112px;
    align-items: center;
  }

  body.template-home .head-main .yamuna-header-desktop::before { left: 174px; }

  body.template-home .head-main .yamuna-header-desktop-nav { width: auto; min-width: 0; margin-left: 52px; }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list { display: flex; align-items: center; gap: 20px; }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item:last-child { display: block; margin: 0; padding: 0; }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link {
    display: block; padding: 0; color: #fff !important; font-family: Roboto, Arial, sans-serif !important;
    font-size: 16px !important; font-style: normal; font-weight: 500 !important; line-height: 59px;
    letter-spacing: 0 !important; text-transform: uppercase; white-space: nowrap;
  }

  body.template-home .head-main .yamuna-header-desktop-search { width: auto; min-width: 0; margin: 0 16px 0 24px; }
  body.template-home .head-main .yamuna-header-desktop-utilities { display: block !important; width: 112px; margin: 0 18px 0 0; }
  body.template-home .head-main .yamuna-header-desktop-utilities .utilities-container {
    display: flex !important; width: 112px; height: 59px; align-items: center; justify-content: flex-start; gap: 12px;
  }
  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-help { display: none !important; }
  body.template-home .head-main .yamuna-header-desktop-utilities .utilities-item,
  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-favorites {
    display: flex !important; width: 20px; height: 59px; min-width: 20px; padding: 0 !important; align-items: center; justify-content: center;
  }
  body.template-home .head-main .yamuna-header-desktop-utilities .utility-head,
  body.template-home .head-main .yamuna-header-desktop-utilities #ajax-cart {
    display: flex !important; width: 20px; height: 59px; padding: 0; align-items: center; justify-content: center;
  }
  body.template-home .head-main .yamuna-header-desktop-utilities .icon-2x,
  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-favorites svg {
    display: block !important; width: 20px !important; height: 20px !important; color: #fff !important; fill: #fff !important; opacity: 1 !important; visibility: visible !important;
  }
  body.template-home .head-main .yamuna-header-desktop-utilities .utility-name { display: none !important; }
  body.template-home .head-main .yamuna-header-desktop-utilities .badge-amount { display: block !important; top: 11px; right: -9px; }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop { grid-template-columns: 112px auto minmax(240px, 392px) 112px; }
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop::before { left: 0; }
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav { margin-left: 28px; }
}

{# Keep the custom home actions on one horizontal row. This is intentionally last. #}
@media (min-width: 768px) {
  body.template-home .head-main .yamuna-header-desktop-utilities {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    flex: 0 0 auto !important;
    width: auto !important;
    height: 59px !important;
    margin: 0 24px 0 0 !important;
    align-items: center !important;
    justify-content: flex-start !important;
    align-content: center !important;
    gap: 16px !important;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities .yamuna-header-action {
    display: flex !important;
    flex: 0 0 20px !important;
    flex-direction: row !important;
    width: 20px !important;
    height: 20px !important;
    min-width: 20px !important;
    max-width: 20px !important;
    min-height: 20px !important;
    margin: 0 !important;
    padding: 0 !important;
    align-items: center !important;
    justify-content: center !important;
  }
}

{# Yamuna products mega menu, matching the opened-menu Figma composition. #}
@media (min-width: 768px) {
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
    position: fixed;
    top: var(--yamuna-menu-top, 49px);
    left: var(--yamuna-menu-left, 50%);
    z-index: 1;
    width: var(--yamuna-menu-width, min(1088px, calc(100vw - 48px)));
    height: 358px;
    max-height: none !important;
    overflow: hidden;
    transform: none;
    border-radius: 0 0 24px 24px;
    background: #fff;
    box-shadow: 4px 4px 8px rgba(0, 0, 0, .15);
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .nav-item-container {
    position: relative;
    z-index: 2;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown::after {
    position: absolute;
    top: 0;
    right: 0;
    width: 298px;
    height: 100%;
    content: '';
    pointer-events: none;
    z-index: 1;
    border-radius: 0 0 24px 0;
    background: url('{{ 'images/yamuna/menu-produtos.png' | static_url }}') center / cover no-repeat;
    overflow: hidden;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems {
    position: relative;
    z-index: 1;
    display: grid;
    grid-auto-flow: column;
    grid-template-rows: repeat(8, 40px);
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
    gap: 0 42px;
    width: calc(100% - 298px);
    height: 100%;
    margin: 0;
    padding: 48px 34px 18px;
    overflow: hidden;
    background: #fff;
    column-count: auto;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item {
    display: flex;
    min-width: 0;
    margin: 0;
    padding: 0;
    align-items: center;
    break-inside: auto;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item > .nav-list-link {
    display: flex;
    width: 100%;
    min-width: 0;
    margin: 0;
    padding: 0;
    align-items: center;
    color: #238482 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 500 !important;
    line-height: 32px !important;
    text-transform: uppercase;
    white-space: nowrap;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item > .nav-list-link::before {
    display: block;
    width: 16px;
    height: 16px;
    margin-right: 16px;
    flex: 0 0 16px;
    content: '';
    background: url('{{ 'images/yamuna/menu-icon-kits.svg' | static_url }}') center / contain no-repeat;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(1) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-kits.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(2) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-manteiga.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(3) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-castanhas.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(4) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-coco.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(5) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-shampoo.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(6) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-sabonetes.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(7) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-cafes.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(8) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-chocolates.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(9) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-temperos.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(10) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-oleos.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(11) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-adocantes.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(12) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-leites.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(13) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-nutraceuticos.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(14) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-casa-sustentavel.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(15) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-shampoo.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(16) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-adocantes.svg' | static_url }}'); }
}

{# Desktop mini cart: native ajax content, presented as the Figma dropdown. #}
@media (min-width: 992px) {
  body.template-home .head-main { position: relative !important; z-index: 30001 !important; isolation: isolate; }
  body.template-home .head-main .yamuna-header-desktop { position: relative !important; z-index: 30002 !important; }
  body.template-home .head-main .yamuna-header-desktop::before { z-index: 30003 !important; }
  body.template-home .head-main .yamuna-header-desktop-logo,
  body.template-home .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-utilities { position: relative; z-index: 30004 !important; }

  body.template-home #modal-cart {
    position: fixed !important;
    top: calc(var(--yamuna-header-top, 25px) + 20px) !important;
    right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important;
    left: auto !important;
    width: 424px !important;
    max-width: calc(100vw - 32px) !important;
    height: min(759px, calc(100vh - var(--yamuna-header-top, 25px) - 36px)) !important;
    min-height: 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
    border-radius: 0 0 24px 24px !important;
    box-shadow: 4px 4px 8px rgba(0, 0, 0, .15) !important;
    transform: none !important;
    transition: opacity .18s ease !important;
    z-index: 29000 !important;
  }

  body.template-home #modal-cart.modal-show { right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important; opacity: 1; }
  body.template-home .js-modal-overlay[data-modal-id="#modal-cart"] { display: none !important; }

  body.template-home #modal-cart .js-ajax-cart-panel {
    display: flex;
    flex-direction: column;
    height: 100%;
    background: #fff;
    color: #4a1d3a;
    font-family: Roboto, Arial, sans-serif;
  }

  body.template-home #modal-cart .modal-header {
    position: relative;
    flex: 0 0 114px;
    height: 114px;
    width: 100%;
    margin: 0;
    padding: 75px 56px 16px 30px;
    border-bottom: 1px solid #d8d0d6;
    background: #fff !important;
    color: #4a1d3a;
    font-family: Dosis, Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 700;
    line-height: 1.2;
    text-transform: uppercase;
    cursor: default;
  }

  body.template-home #modal-cart .modal-header .modal-close {
    position: absolute;
    top: 70px;
    right: 28px;
    width: 24px;
    height: 24px;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    border: 0;
    border-radius: 50%;
    background: #f2edf0 !important;
    color: #4a1d3a !important;
    line-height: 1;
  }

  body.template-home #modal-cart .modal-header .modal-close-icon { display: block; width: 14px; height: 14px; margin: 0; }
  body.template-home #modal-cart .modal-header .modal-close-icon,
  body.template-home #modal-cart .modal-header .modal-close-icon use { fill: #4a1d3a !important; color: #4a1d3a !important; }
  body.template-home #modal-cart .modal-body { display: flex; flex: 1 1 auto; flex-direction: column; min-height: 0; padding: 0; overflow: auto; }
  body.template-home #modal-cart .js-ajax-cart-list { padding: 42px 20px 0; }
  body.template-home #modal-cart .cart-item { min-height: 130px; margin: 0; padding: 0 0 16px; border-bottom: 1px solid #ded8dc; }
  body.template-home #modal-cart .cart-item .col-2 { flex: 0 0 88px; max-width: 88px; padding: 0; }
  body.template-home #modal-cart .cart-item .col-10 { flex: 0 0 calc(100% - 88px); max-width: calc(100% - 88px); padding-left: 8px; }
  body.template-home #modal-cart .cart-item img { max-height: 88px; object-fit: contain; }
  body.template-home #modal-cart .cart-item-name { padding: 0 45px 7px 0; margin: 0; color: #393747; font-family: Dosis, Roboto, Arial, sans-serif; font-size: 18px; font-weight: 600; }
  body.template-home #modal-cart .cart-item-subtotal { margin: -29px 0 0; color: #4a1d3a; font-family: Dosis, Roboto, Arial, sans-serif; font-size: 18px; font-weight: 700; }
  body.template-home #modal-cart .cart-item-delete { position: absolute; z-index: 2; top: auto; bottom: 42px; right: 0; width: 18px; margin: 0; padding: 0; }
  body.template-home #modal-cart .cart-item-delete .btn { display: block; padding: 0; color: #806f7a; width: 18px; height: 18px; margin: 0; }
  body.template-home #modal-cart .yamuna-cart-trash-icon { display: block; width: 18px; height: 18px; }
  body.template-home #modal-cart .js-empty-ajax-cart .cart-item-delete,
  body.template-home #modal-cart .js-empty-ajax-cart .yamuna-cart-trash-icon { display: none !important; }
  body.template-home #modal-cart .cart-item-quantity { width: 130px; margin-top: 12px; }
  body.template-home #modal-cart .cart-item-quantity .form-group,
  body.template-home #modal-cart .form-quantity,
  body.template-home #modal-cart .form-quantity .row { display: flex; align-items: center; height: 32px; margin: 0; padding: 0; }
  body.template-home #modal-cart .form-quantity { overflow: hidden; border-color: #c0bbc3; }
  body.template-home #modal-cart .form-quantity, body.template-home #modal-cart .form-quantity .form-control { height: 32px; }
  body.template-home #modal-cart .form-quantity .form-control { min-width: 0; padding: 0; font-size: 18px; line-height: 32px; }
  body.template-home #modal-cart .form-quantity .form-quantity-icon { display: flex; align-items: center; justify-content: center; width: 38px; height: 30px; margin: 0; padding: 0; color: #9e929e; line-height: 1; }

  body.template-home #modal-cart .yamuna-cart-shipping-promo {
    position: absolute;
    top: 126px;
    right: 20px;
    left: 20px;
    height: 24px;
    padding-top: 2px;
    background: #f6f5f6;
    color: #a31460;
    font-family: Dosis, Roboto, Arial, sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 19px;
    text-align: center;
    text-transform: uppercase;
  }
  body.template-home #modal-cart .yamuna-cart-shipping-promo i { position: absolute; right: 0; bottom: 0; left: 0; height: 3px; background: rgba(192,187,195,.6); }
  body.template-home #modal-cart .yamuna-cart-shipping-promo i::before { position: absolute; left: 0; width: 9px; height: 3px; background: #a31460; content: ''; }

  body.template-home #modal-cart #error-ajax-stock,
  body.template-home #modal-cart .modal-body > .cart-row:not(.js-ajax-cart-list):not(.js-empty-ajax-cart),
  body.template-home #modal-cart .js-fulfillment-info,
  body.template-home #modal-cart .js-shipping-calculator-container,
  body.template-home #modal-cart #cart-shipping-container,
  body.template-home #modal-cart .js-ajax-cart-submit,
  body.template-home #modal-cart [data-component="cart-totals"] { display: none !important; }
  body.template-home #modal-cart .progress-bar-title-container { margin: 0; padding: 7px 20px; background: #a31460; color: #fff; text-align: center; }
  body.template-home #modal-cart .progress-bar-title, body.template-home #modal-cart .progress-bar-icon { color: #fff !important; fill: #fff; }
  body.template-home #modal-cart .progress-bar-subtitle, body.template-home #modal-cart .bar-progress { display: none; }
  body.template-home #modal-cart .yamuna-cart-dropdown-footer {
    position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    height: 160px;
    background: #fff;
  }
  body.template-home #modal-cart .yamuna-cart-discount {
    height: 32px;
    padding: 6px 20px;
    background: #a31460;
    color: #fff;
    font-family: Dosis, Roboto, Arial, sans-serif;
    font-size: 18px;
    font-weight: 700;
    line-height: 20px;
    text-align: center;
    text-transform: uppercase;
  }
  body.template-home #modal-cart .yamuna-cart-dropdown-footer p { margin: 12px 20px 0; color: #000; font-size: 16px; font-weight: 400; text-align: center; }
  body.template-home #modal-cart .yamuna-cart-checkout {
    position: absolute;
    right: 22px;
    bottom: 22px;
    left: 22px;
    height: 46px;
    border: 0;
    border-radius: 24px;
    background: #238482;
    color: #fff;
    font-family: Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
  }
  body.template-home #modal-cart .yamuna-cart-checkout { display: flex; align-items: center; justify-content: center; gap: 8px; }
  body.template-home #modal-cart .yamuna-cart-checkout img { width: 18px; height: 18px; }

  body.template-home #modal-cart .js-empty-ajax-cart { position: absolute; top: 88px; right: 0; bottom: 120px; left: 0; padding: 0; }
  body.template-home #modal-cart .js-empty-ajax-cart .alert-info { display: none; }
  body.template-home #modal-cart .yamuna-empty-cart-content { position: absolute; top: 34px; right: 38px; left: 38px; color: #4a1d3a; text-align: center; }
  body.template-home #modal-cart .yamuna-empty-cart-content p { margin: 0 0 2px; font-family: Dosis, Roboto, Arial, sans-serif; font-size: 18px; font-weight: 500; }
  body.template-home #modal-cart .yamuna-empty-cart-content strong { display: block; margin-bottom: 28px; font-family: Dosis, Roboto, Arial, sans-serif; font-size: 18px; font-weight: 700; }
  body.template-home #modal-cart .yamuna-empty-cart-links { display: grid; gap: 28px; }
  body.template-home #modal-cart .yamuna-empty-cart-link {
    display: flex;
    align-items: end;
    height: 76px;
    padding: 0 16px 9px;
    border-radius: 5px;
    background: linear-gradient(120deg, rgba(74,29,58,.76), rgba(74,29,58,.18)), url('{{ 'images/yamuna/menu-produtos.png' | static_url }}') center/cover;
    color: #fff;
    font-family: Dosis, Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 700;
    text-align: left;
    text-transform: uppercase;
  }
  body.template-home #modal-cart .yamuna-empty-cart-link-cosmetics { filter: grayscale(1); }
  body.template-home #modal-cart .yamuna-cart-empty-footer {
    position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    height: 120px;
    background: #fff;
  }
  body.template-home #modal-cart .yamuna-cart-empty-footer .yamuna-cart-discount { margin: 0; }
  body.template-home #modal-cart .yamuna-cart-empty-footer .yamuna-cart-checkout { background: #c0bbc3; }
}

{# Definitive desktop header stacking: panels are siblings below the capsule, controls stay above them. #}
@media (min-width: 768px) {
  body .head-main .yamuna-header-desktop,
  body.template-home .head-main .yamuna-header-desktop {
    display: flex !important;
    /* Do not use min(calc()) here: the theme compiler strips the nested
       calc and the browser falls back to page-specific widths on scroll. */
    width: calc(100% - 48px) !important;
    max-width: 1320px !important;
    min-width: 0 !important;
    height: 59px !important;
    align-items: center !important;
  }

  body .head-main .yamuna-header-desktop-logo,
  body.template-home .head-main .yamuna-header-desktop-logo {
    position: relative !important;
    z-index: 30004 !important;
    flex: 0 0 174px !important;
    width: 174px !important;
    height: 59px !important;
    padding: 0 !important;
    overflow: visible !important;
    transition: width .34s cubic-bezier(.22,.61,.36,1), flex-basis .34s cubic-bezier(.22,.61,.36,1), padding .34s cubic-bezier(.22,.61,.36,1) !important;
  }
  body .head-main .yamuna-header-desktop-logo::before,
  body.template-home .head-main .yamuna-header-desktop-logo::before {
    display: block !important;
    width: 174px !important;
    height: 59px !important;
    background: url('{{ 'images/yamuna/logo-header.png' | static_url }}') left center / contain no-repeat !important;
    filter: none !important;
    content: '' !important;
    transition: width .34s cubic-bezier(.22,.61,.36,1), height .34s cubic-bezier(.22,.61,.36,1), filter .34s cubic-bezier(.22,.61,.36,1) !important;
  }

  body .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-nav,
  body .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search {
    z-index: auto !important;
  }
  body .head-main .yamuna-header-desktop-nav {
    display: flex !important;
    flex: 0 0 auto !important;
    width: auto !important;
    margin: 0 0 0 38px !important;
    align-items: center !important;
    gap: 24px !important;
  }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body .head-main .yamuna-header-desktop-nav .nav-desktop,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list {
    display: flex !important;
    width: auto !important;
    margin: 0 !important;
    padding: 0 !important;
    align-items: center !important;
    gap: 24px !important;
  }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item.nav-dropdown {
    display: block !important;
    visibility: visible !important;
    opacity: 1 !important;
  }
  body .head-main .yamuna-header-desktop-nav .nav-item-container,
  body .head-main .yamuna-header-desktop-search .search-container,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item-container,
  body.template-home .head-main .yamuna-header-desktop-search .search-container {
    position: relative !important;
    z-index: 30004 !important;
  }

  body .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search {
    flex: 0 0 392px !important;
    width: 392px !important;
    margin: 0 16px 0 auto !important;
  }
  body .head-main .yamuna-header-desktop-utilities,
  body.template-home .head-main .yamuna-header-desktop-utilities {
    position: relative !important;
    z-index: 30004 !important;
    flex: 0 0 auto !important;
    margin: 0 24px 0 0 !important;
  }

  body .head-main .yamuna-header-desktop-search .search-suggest,
  body .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown,
  body.template-home .head-main .yamuna-header-desktop-search .search-suggest,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
    position: fixed !important;
    z-index: 30000 !important;
    top: var(--yamuna-menu-top, 79px) !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop { width: min(1088px, calc(100% - 48px)) !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo { flex-basis: 112px !important; width: 112px !important; padding-left: 18px !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo::before { width: 76px !important; height: 42px !important; filter: brightness(0) invert(1) !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-nav { margin-left: 16px !important; }
}

{# Final logo override: this must remain after the legacy header cascade. #}
@media (min-width: 1024px) {
  body .head-main .yamuna-header-desktop-logo::before,
  body.template-home .head-main .yamuna-header-desktop-logo::before {
    width: 96px !important;
    height: 88px !important;
    background-image: url('{{ 'images/yamuna/logo-yamuna.webp' | static_url }}') !important;
    background-position: left center !important;
    background-size: contain !important;
    background-repeat: no-repeat !important;
    filter: none !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo {
    flex-basis: 148px !important;
    width: 148px !important;
    padding-left: 24px !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo::before,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo::before {
    width: 84px !important;
    height: 76px !important;
    background-image: url('{{ 'images/yamuna/logo-yamuna-branco.webp' | static_url }}') !important;
    filter: none !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav {
    margin-left: 12px !important;
  }
}

{# Yamuna supplied logos: magenta before scrolling and white in the fixed header. #}
@media (min-width: 1024px) {
  body .head-main .yamuna-header-desktop-logo::before,
  body.template-home .head-main .yamuna-header-desktop-logo::before {
    width: 96px !important;
    height: 88px !important;
    background-image: url('{{ 'images/yamuna/logo-yamuna.webp' | static_url }}') !important;
    background-position: left center !important;
    background-size: contain !important;
    background-repeat: no-repeat !important;
    filter: none !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo {
    flex-basis: 148px !important;
    width: 148px !important;
    padding-left: 24px !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo::before,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo::before {
    width: 84px !important;
    height: 76px !important;
    background-image: url('{{ 'images/yamuna/logo-yamuna-branco.webp' | static_url }}') !important;
    filter: none !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav {
    margin-left: 12px !important;
  }
}

{# Shared dropdown panels outside home. #}
@media (min-width: 1024px) {
  body:not(.template-home) #modal-cart {
    position: fixed !important; top: calc(var(--yamuna-header-top, 25px) + 20px) !important; right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important; left: auto !important;
    z-index: 29000 !important; width: 424px !important; max-width: calc(100vw - 32px) !important; height: min(759px,calc(100vh - var(--yamuna-header-top, 25px) - 36px)) !important;
    padding: 0 !important; overflow: hidden !important; border-radius: 0 0 24px 24px !important; background: #fff; box-shadow: 4px 4px 8px rgba(0,0,0,.15) !important; transform: none !important;
  }
  body:not(.template-home) #modal-cart.modal-show { right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important; opacity: 1; }
  body:not(.template-home) #modal-cart .js-ajax-cart-panel { display: flex; flex-direction: column; height: 100%; background: #fff; }
  body:not(.template-home) #modal-cart .modal-header { position: relative; flex: 0 0 114px; height: 114px; width: 100%; margin: 0; padding: 75px 56px 16px 30px; border-bottom: 1px solid #d8d0d6; background: #fff !important; color: #4a1d3a; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 16px; font-weight: 700; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .modal-header .modal-close { position: absolute; top: 70px; right: 28px; display: flex; width: 24px; height: 24px; margin: 0; padding: 0; align-items: center; justify-content: center; border: 0; border-radius: 50%; background: #f2edf0 !important; color: #4a1d3a !important; }
  body:not(.template-home) #modal-cart .modal-body { flex: 1 1 auto; min-height: 0; padding: 0; overflow: auto; }
  body:not(.template-home) #modal-cart .js-ajax-cart-list { padding: 42px 20px 0; }
  body:not(.template-home) #modal-cart .cart-item { min-height: 130px; margin: 0; padding: 0 0 16px; border-bottom: 1px solid #ded8dc; }
  body:not(.template-home) #modal-cart .cart-item .col-2 { flex: 0 0 88px; max-width: 88px; padding: 0; }
  body:not(.template-home) #modal-cart .cart-item .col-10 { flex: 0 0 calc(100% - 88px); max-width: calc(100% - 88px); padding-left: 8px; }
  body:not(.template-home) #modal-cart .cart-item img { max-height: 88px; object-fit: contain; }
  body:not(.template-home) #modal-cart .cart-item-name { padding: 0 45px 7px 0; margin: 0; color: #393747; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 18px; font-weight: 600; }
  body:not(.template-home) #modal-cart .cart-item-subtotal { margin: -29px 0 0; color: #4a1d3a; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 18px; font-weight: 700; }
  body:not(.template-home) #modal-cart .cart-item-delete { position: absolute; z-index: 2; top: auto; bottom: 42px; right: 0; width: 18px; margin: 0; padding: 0; }
  body:not(.template-home) #modal-cart .cart-item-quantity { width: 130px; margin-top: 12px; }
  body:not(.template-home) #modal-cart .form-quantity { height: 32px; overflow: hidden; border-color: #c0bbc3; }
  body:not(.template-home) #modal-cart .yamuna-cart-shipping-promo { position: absolute; top: 126px; right: 20px; left: 20px; height: 24px; padding-top: 2px; background: #f6f5f6; color: #a31460; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 14px; font-weight: 600; line-height: 19px; text-align: center; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .yamuna-cart-shipping-promo i { position: absolute; right: 0; bottom: 0; left: 0; height: 3px; background: rgba(192,187,195,.6); }
  body:not(.template-home) #modal-cart .yamuna-cart-shipping-promo i::before { display: block; width: 9px; height: 3px; background: #a31460; content: ''; }
  body:not(.template-home) #modal-cart #error-ajax-stock, body:not(.template-home) #modal-cart .modal-body > .cart-row:not(.js-ajax-cart-list):not(.js-empty-ajax-cart), body:not(.template-home) #modal-cart .js-fulfillment-info { display: none !important; }
  body:not(.template-home) #modal-cart .yamuna-cart-dropdown-footer, body:not(.template-home) #modal-cart .yamuna-cart-empty-footer { position: absolute; right: 0; bottom: 0; left: 0; height: 160px; background: #fff; }
  body:not(.template-home) #modal-cart .yamuna-cart-discount { height: 32px; padding: 6px 20px; background: #a31460; color: #fff; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 18px; font-weight: 700; text-align: center; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .yamuna-cart-dropdown-footer p { margin: 12px 20px 0; text-align: center; }
  body:not(.template-home) #modal-cart .yamuna-cart-checkout { position: absolute; right: 22px; bottom: 22px; left: 22px; display: flex; height: 46px; align-items: center; justify-content: center; gap: 8px; border: 0; border-radius: 24px; background: #238482; color: #fff; font-size: 16px; font-weight: 700; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .yamuna-cart-checkout img { width: 18px; height: 18px; }
  body:not(.template-home) #modal-cart .js-empty-ajax-cart { position: absolute; top: 126px; right: 0; bottom: 120px; left: 0; padding: 0; }
  body:not(.template-home) #modal-cart .js-empty-ajax-cart .alert-info { display: none; }
  body:not(.template-home) #modal-cart .yamuna-empty-cart-content { position: absolute; top: 34px; right: 38px; left: 38px; text-align: center; }
  body:not(.template-home) #modal-cart .yamuna-empty-cart-content p, body:not(.template-home) #modal-cart .yamuna-empty-cart-content strong { font-family: Dosis,Roboto,Arial,sans-serif; font-size: 18px; }
  body:not(.template-home) #modal-cart .yamuna-empty-cart-content strong { display: block; margin-bottom: 28px; }
  body:not(.template-home) #modal-cart .yamuna-empty-cart-links { display: grid; gap: 28px; }
  body:not(.template-home) #modal-cart .yamuna-empty-cart-link { display: flex; height: 76px; padding: 0 16px 9px; align-items: end; border-radius: 5px; background: linear-gradient(120deg,rgba(74,29,58,.76),rgba(74,29,58,.18)),url('{{ 'images/yamuna/menu-produtos.png' | static_url }}') center/cover; color: #fff; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 16px; font-weight: 700; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .yamuna-empty-cart-link-cosmetics { filter: grayscale(1); }
  body:not(.template-home) #modal-cart .yamuna-cart-empty-footer { height: 120px; }
  body:not(.template-home) #modal-cart .yamuna-cart-empty-footer .yamuna-cart-checkout { background: #c0bbc3; }

  body .yamuna-header-desktop-search .search-suggest { display: none; min-height: 130px; max-height: 358px; padding: 0; overflow: hidden; background: #fff; box-shadow: 4px 4px 8px rgba(0,0,0,.15); }
  body .yamuna-header-desktop-search .search-suggest.yamuna-search-open { display: block; }
  body .yamuna-header-desktop-search .yamuna-search-default { padding: 54px 96px 32px; }
  body .yamuna-header-desktop-search .yamuna-search-default-title { display: block; margin-bottom: 12px; font-size: 16px; }
  body .yamuna-header-desktop-search .yamuna-search-chips { display: flex; flex-wrap: wrap; gap: 10px 14px; }
  body .yamuna-header-desktop-search .yamuna-search-chip { padding: 6px 12px; color: #238482; border: 1px solid #238482; border-radius: 20px; background: #fff; font-family: Dosis,Arial,sans-serif; font-size: 16px; }
}

{# Global Yamuna header: the desktop capsule is shared by every storefront template. #}
@media (min-width: 1024px) {
  body .head-main { position: relative; z-index: 30001; padding: 20px 0 0; background: transparent !important; }
  body .head-main > .container-fluid { display: none !important; }
  body .head-main .yamuna-header-desktop {
    position: relative;
    z-index: 30002;
    display: flex !important;
    width: min(1312px, calc(100% - 128px));
    height: 59px;
    margin: 0 auto;
    align-items: center;
  }
  body .head-main .yamuna-header-desktop::before {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 162px;
    z-index: -1;
    display: block;
    border-radius: 32px;
    background: #a31460;
    box-shadow: 4px 4px 4px -2px rgba(0,0,0,.25);
    content: '';
  }
  body .yamuna-header-desktop-logo { position: relative; z-index: 30004; flex: 0 0 174px; width: 174px; height: 59px; }
  body .yamuna-header-desktop-logo .logo-img-container,
  body .yamuna-header-desktop-logo .logo-text { display: none !important; }
  body .yamuna-header-desktop-logo::before { display: block; width: 174px; height: 59px; background: url('{{ 'images/yamuna/logo-header.png' | static_url }}') left center / contain no-repeat; content: ''; }
  body .yamuna-header-desktop-nav { position: relative; z-index: 30004; flex: 0 0 auto; margin-left: 38px; }
  body .yamuna-header-desktop-nav { display: flex; align-items: center; }
  body .yamuna-header-desktop-nav .yamuna-static-nav,
  body .yamuna-header-desktop-nav .nav-desktop-list { display: flex; margin: 0; padding: 0; align-items: center; gap: 24px; list-style: none; }
  body .yamuna-header-desktop-nav .yamuna-static-nav { flex: 0 0 auto; }
  body .yamuna-header-desktop-nav .nav-desktop { display: block; flex: 0 0 auto; width: auto; }
  body .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item:not(.nav-dropdown) { display: none !important; }
  body .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item,
  body .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item > .nav-list-link {
    display: block !important; visibility: visible !important; opacity: 1 !important;
  }
  body .yamuna-header-desktop-nav .nav-item { margin: 0 !important; padding: 0 !important; }
  body .yamuna-header-desktop-nav .nav-list-link { padding: 0 !important; color: #fff !important; font-family: Roboto,Arial,sans-serif !important; font-size: 16px !important; font-weight: 500 !important; line-height: 59px; text-transform: uppercase; white-space: nowrap; }
  body .yamuna-header-desktop-search { position: relative; z-index: 30004; flex: 0 0 392px; width: 392px; margin: 0 16px 0 auto; }
  body .yamuna-header-desktop-search .search-container,
  body .yamuna-header-desktop-search .form-group { position: relative !important; width: 100%; margin: 0; }
  body .yamuna-header-desktop-search .search-input { width: 100% !important; height: 35px !important; padding: 0 44px 0 18px !important; color: #fff !important; border: 1px solid #fff !important; border-radius: 32px !important; background: transparent !important; }
  body .yamuna-header-desktop-search .search-input-submit { position: absolute !important; top: 0 !important; right: 0 !important; display: flex !important; width: 42px !important; height: 35px !important; padding: 0 !important; align-items: center; justify-content: center; color: #fff !important; background: transparent !important; }
  body .yamuna-header-desktop-utilities { position: relative; z-index: 30004; display: flex !important; height: 59px; margin: 0 24px 0 0; align-items: center; gap: 16px; }
  body .yamuna-header-desktop-utilities .utilities-container { display: flex !important; align-items: center; gap: 16px; }
  body .yamuna-header-desktop-utilities .utility-name,
  body .yamuna-header-desktop-utilities .yamuna-header-help { display: none !important; }
  body .yamuna-header-desktop-utilities .utilities-item,
  body .yamuna-header-desktop-utilities .yamuna-header-action { position: relative; display: flex !important; width: 20px; height: 20px; padding: 0 !important; align-items: center; justify-content: center; }
  body .yamuna-header-desktop-utilities img,
  body .yamuna-header-desktop-utilities svg { width: 20px !important; height: 20px !important; color: #fff !important; fill: #fff !important; }
  body .yamuna-header-desktop-utilities .badge-amount,
  body .yamuna-header-cart-count { position: absolute; top: -9px; right: -10px; display: flex; width: 16px; height: 16px; align-items: center; justify-content: center; color: #a31460; border-radius: 50%; background: #fff; font-size: 10px; font-weight: 700; }

  body .yamuna-header-desktop-search .search-suggest,
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown { z-index: 30000 !important; }
  body .yamuna-header-desktop-search .search-suggest { position: fixed; top: var(--yamuna-menu-top,49px); left: var(--yamuna-menu-left,50%); width: var(--yamuna-menu-width,min(1088px,calc(100vw - 48px))); border-radius: 0 0 24px 24px; }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown { position: fixed; top: var(--yamuna-menu-top,49px); left: var(--yamuna-menu-left,50%); width: var(--yamuna-menu-width,min(1088px,calc(100vw - 48px))); }
  html.yamuna-header-scrolled body .yamuna-header-desktop { width: min(1088px,calc(100% - 48px)); }
  html.yamuna-header-scrolled body .yamuna-header-desktop::before { left: 0; }
  html.yamuna-header-scrolled body .yamuna-header-desktop-logo { flex-basis: 112px; width: 112px; padding-left: 18px; }
  html.yamuna-header-scrolled body .yamuna-header-desktop-logo::before { width: 76px; height: 42px; filter: brightness(0) invert(1); }
  html.yamuna-header-scrolled body .yamuna-header-desktop-nav { margin-left: 16px; }
}

{# The mega-menu uses the same panel on every template, not only on the home. #}
@media (min-width: 1024px) {
  {# Do not make a parent stacking context for a floating panel: only its visible controls stay above it. #}
  body .yamuna-header-desktop-nav,
  body .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-search { z-index: auto !important; }
  body .yamuna-header-desktop-nav .nav-item-container,
  body .yamuna-header-desktop-search .search-container,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item-container,
  body.template-home .head-main .yamuna-header-desktop-search .search-container { z-index: 30004 !important; }

  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
    height: 384px !important;
    max-height: none !important;
    overflow: hidden !important;
    transform: none !important;
    border-radius: 0 0 24px 24px !important;
    background: #fff !important;
    box-shadow: 4px 4px 8px rgba(0,0,0,.15) !important;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .nav-item-container { position: relative; z-index: 30004; }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown::after {
    position: absolute; top: 0; right: 0; z-index: 1; width: 298px; height: 100%;
    border-radius: 0 0 24px 0; background: url('{{ 'images/yamuna/menu-produtos.png' | static_url }}') center / cover no-repeat; content: ''; pointer-events: none;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems {
    position: relative; z-index: 2; display: grid; grid-auto-flow: column; grid-template-rows: repeat(8,40px); grid-template-columns: minmax(0,1fr) minmax(0,1fr);
    gap: 0 42px; width: calc(100% - 298px); height: 100%; margin: 0; padding: 48px 34px 16px; overflow: hidden; background: #fff; column-count: auto;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item { display: flex; min-width: 0; margin: 0; padding: 0; align-items: center; }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item > .nav-list-link {
    display: flex; width: 100%; min-width: 0; margin: 0; padding: 0; align-items: center; color: #238482 !important;
    font-family: Dosis,Arial,sans-serif !important; font-size: 16px !important; font-weight: 500 !important; line-height: 32px !important; text-transform: uppercase; white-space: nowrap;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item > .nav-list-link::before {
    display: block; flex: 0 0 16px; width: 16px; height: 16px; margin-right: 16px; background: url('{{ 'images/yamuna/menu-icon-kits.svg' | static_url }}') center / contain no-repeat; content: '';
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(2) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-manteiga.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(3) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-castanhas.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(4) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-coco.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(5) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-shampoo.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(6) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-sabonetes.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(7) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-cafes.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(8) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-chocolates.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(9) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-temperos.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(10) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-oleos.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(11) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-adocantes.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(12) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-leites.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(13) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-nutraceuticos.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(14) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-casa-sustentavel.svg' | static_url }}'); }
}

{# Final shared desktop capsule: do not let legacy home/page rules collapse its three menu entries. #}
@media (min-width: 1024px) {
  body .head-main,
  body.template-home .head-main,
  body.template-home .head-main.head-fix {
    position: fixed !important;
    top: 0;
    left: 0;
    z-index: 30001 !important;
    width: 100%;
    padding: 20px 0 0 !important;
    background: transparent !important;
    transition: padding .34s cubic-bezier(.22,.61,.36,1);
  }
  body .head-main .yamuna-header-desktop,
  body.template-home .head-main .yamuna-header-desktop {
    display: grid !important;
    grid-template-columns: 174px max-content 392px max-content;
    width: min(1312px,calc(100% - 128px)) !important;
    height: 59px !important;
    margin: 0 auto !important;
    align-items: center;
    transition: width .34s cubic-bezier(.22,.61,.36,1);
  }
  body .head-main .yamuna-header-desktop::before,
  body.template-home .head-main .yamuna-header-desktop::before {
    left: 162px !important;
    z-index: -1 !important;
    transition: left .34s cubic-bezier(.22,.61,.36,1);
  }
  body .head-main .yamuna-header-desktop-logo,
  body.template-home .head-main .yamuna-header-desktop-logo {
    display: block !important;
    width: 174px !important;
    height: 59px !important;
    padding: 0 !important;
  }
  body .head-main .yamuna-header-desktop-logo::before,
  body.template-home .head-main .yamuna-header-desktop-logo::before {
    display: block !important;
    width: 174px !important;
    height: 59px !important;
    filter: none !important;
  }
  body .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-nav {
    display: grid !important;
    grid-template-columns: max-content max-content max-content;
    width: max-content !important;
    min-width: 0 !important;
    margin: 0 0 0 38px !important;
    align-items: center;
    column-gap: 24px;
  }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body .head-main .yamuna-header-desktop-nav .nav-desktop,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list {
    display: contents !important;
  }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item.nav-dropdown {
    display: block !important;
    margin: 0 !important;
    padding: 0 !important;
    visibility: visible !important;
    opacity: 1 !important;
  }
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item:not(.nav-dropdown) { display: none !important; }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item > .nav-list-link,
  body .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown > .nav-item-container > .nav-list-link {
    display: block !important;
    color: #fff !important;
    font-family: Roboto,Arial,sans-serif !important;
    font-size: 16px !important;
    font-weight: 500 !important;
    line-height: 59px !important;
    opacity: 1 !important;
    visibility: visible !important;
  }
  body .head-main .yamuna-header-desktop-search { margin-left: 42px !important; }
  body .head-main .yamuna-header-desktop-utilities { margin-left: 0 !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop { width: min(1088px,calc(100% - 48px)) !important; grid-template-columns: 112px max-content 392px max-content; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop::before { left: 0 !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo { width: 112px !important; padding-left: 18px !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo::before { width: 76px !important; height: 42px !important; filter: brightness(0) invert(1) !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-nav { margin-left: 16px !important; }
}

{# Last paint/layer pass: header controls are above panels; panels start after the 59px capsule. #}
@media (min-width: 1024px) {
  body .head-main .yamuna-header-desktop,
  body.template-home .head-main .yamuna-header-desktop {
    display: flex !important;
    width: min(1312px,calc(100% - 128px)) !important;
    padding: 0 !important;
    align-items: center !important;
  }
  body .head-main .yamuna-header-desktop-logo,
  body.template-home .head-main .yamuna-header-desktop-logo { flex: 0 0 174px !important; }
  body .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-nav {
    position: relative !important;
    z-index: 30004 !important;
    display: flex !important;
    flex: 0 0 auto !important;
    width: auto !important;
    margin: 0 0 0 38px !important;
    align-items: center !important;
    gap: 24px !important;
  }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body .head-main .yamuna-header-desktop-nav .nav-desktop,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list,
  body.template-home .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list {
    display: flex !important;
    width: auto !important;
    margin: 0 !important;
    padding: 0 !important;
    align-items: center !important;
    gap: 24px !important;
  }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item.nav-dropdown,
  body.template-home .head-main .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item.nav-dropdown { display: block !important; }
  body .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search {
    position: relative !important;
    z-index: 30004 !important;
    flex: 0 0 392px !important;
    width: 392px !important;
    margin: 0 16px 0 auto !important;
  }
  body .head-main .yamuna-header-desktop-utilities,
  body.template-home .head-main .yamuna-header-desktop-utilities {
    position: relative !important;
    z-index: 30004 !important;
    flex: 0 0 auto !important;
    margin: 0 24px 0 0 !important;
  }
  body .head-main .yamuna-header-desktop-search .search-suggest,
  body .head-main .yamuna-header-desktop-nav .desktop-dropdown,
  body.template-home .head-main .yamuna-header-desktop-search .search-suggest,
  body.template-home .head-main .yamuna-header-desktop-nav .desktop-dropdown {
    z-index: 30000 !important;
    top: var(--yamuna-menu-top,79px) !important;
  }
  body .head-main .yamuna-header-desktop-nav .nav-item-container,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item-container { position: relative !important; z-index: 30005 !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop { width: min(1088px,calc(100% - 48px)) !important; }
}

{# Figma mobile navbar: 80px header, left logo and three 32px circular actions. #}
@media (max-width: 767px) {
  body .head-main {
    min-height: 80px;
    padding: 0 !important;
    background: #fff !important;
  }

  body .head-main > .container-fluid,
  body .head-main .section-topbar {
    display: none !important;
  }

  body .head-main .yamuna-header-mobile {
    display: flex !important;
    width: 100%;
    height: 80px;
    padding: 0 12px;
    align-items: center;
    justify-content: space-between;
    background: #fff;
  }

  body .head-main .yamuna-header-mobile-logo {
    display: flex;
    width: 125.57px;
    height: 44.79px;
    flex: 0 0 125.57px;
    align-items: center;
  }

  body .head-main .yamuna-header-mobile-logo img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  body .head-main .yamuna-header-mobile-actions {
    display: flex;
    gap: 16px;
    align-items: center;
  }

  body .head-main .yamuna-header-mobile-action {
    position: relative;
    display: inline-flex;
    width: 32px;
    height: 32px;
    padding: 0;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: transparent;
  }

  body .head-main .yamuna-header-mobile-button {
    display: block;
    width: 32px;
    height: 32px;
  }

  body .head-main .yamuna-header-mobile-glyph {
    position: absolute;
    top: 6px;
    left: 6px;
    display: block;
    width: 20px;
    height: 20px;
  }

  body .head-main .yamuna-header-mobile-cart-count {
    position: absolute;
    top: -4px;
    right: -4px;
    display: none;
    min-width: 14px;
    height: 14px;
    padding: 0 3px;
    border: 1px solid #ab0d60;
    border-radius: 7px;
    background: #fff;
    color: #ab0d60;
    font-size: 9px;
    font-weight: 700;
    line-height: 12px;
    text-align: center;
  }

  body .head-main .yamuna-header-mobile-cart-count:not(:empty) {
    display: block;
  }
}

{# Yamuna mobile menu: Figma navigation panel below the desktop breakpoint. #}
@media (max-width: 991px) {
  body #nav-hamburger.modal-nav-hamburger {
    position: fixed !important;
    top: 0 !important;
    left: 0 !important;
    width: min(100vw, 320px) !important;
    max-width: 320px !important;
    height: 100dvh !important;
    min-height: 100vh !important;
    display: block !important;
    padding: 0 !important;
    overflow-y: auto !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: #fff !important;
    color: #363544;
    opacity: 0;
    visibility: hidden;
    transform: translate3d(-100%, 0, 0) !important;
    transition: transform .42s cubic-bezier(.22, .61, .36, 1), opacity .24s ease, visibility 0s linear .42s !important;
  }

  body #nav-hamburger.modal-nav-hamburger.modal-show {
    opacity: 1;
    visibility: visible;
    transform: translate3d(0, 0, 0) !important;
    transition: transform .42s cubic-bezier(.22, .61, .36, 1), opacity .24s ease, visibility 0s !important;
  }

  body #nav-hamburger .modal-body {
    min-height: 100%;
    padding: 0 !important;
  }

  body #nav-hamburger .modal-close {
    position: absolute;
    z-index: 2;
    top: 20px;
    left: 16px;
    display: flex;
    width: 24px;
    height: 24px;
    margin: 0;
    padding: 0;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: #f2f0f3;
    color: #6f5265;
  }

  body #nav-hamburger .modal-close svg {
    width: 14px;
    height: 14px;
    fill: currentColor;
  }

  body #nav-hamburger .yamuna-mobile-menu {
    width: 100%;
    min-height: 100%;
    padding: 56px 16px 30px;
    background: #fff;
    font-family: 'Montserrat', sans-serif;
  }

  body #nav-hamburger .yamuna-mobile-menu-account {
    display: flex;
    height: 64px;
    align-items: center;
    justify-content: center;
    border-top: 3px solid #f2f0f3;
    border-bottom: 3px solid #f2f0f3;
  }

  body #nav-hamburger .yamuna-mobile-menu-account a {
    color: #58223f;
    font-size: 18px;
    font-weight: 400;
    text-decoration: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-login {
    display: inline-flex;
    gap: 10px;
    align-items: center;
  }

  body #nav-hamburger .yamuna-mobile-menu-login img {
    width: 18px;
    height: 18px;
    filter: brightness(0) saturate(100%) invert(16%) sepia(24%) saturate(1957%) hue-rotate(278deg) brightness(95%) contrast(88%);
  }

  body #nav-hamburger .yamuna-mobile-menu-account-divider {
    width: 1px;
    height: 32px;
    margin: 0 40px;
    background: #b20d61;
  }

  body #nav-hamburger .yamuna-mobile-menu-search {
    display: flex;
    height: 58px;
    align-items: center;
    justify-content: space-between;
    border-bottom: 3px solid #f2f0f3;
    color: #805a71;
    font-size: 18px;
    font-weight: 300;
    text-decoration: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-search img {
    width: 24px;
    height: 24px;
  }

  body #nav-hamburger .yamuna-mobile-menu-products {
    padding: 16px 2px 18px;
    border-bottom: 3px solid #f2f0f3;
  }

  body #nav-hamburger .yamuna-mobile-menu h2 {
    margin: 0 0 18px;
    color: #363544;
    font-size: 18px;
    font-weight: 700;
    line-height: 1;
  }

  body #nav-hamburger .yamuna-mobile-menu ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-products li + li {
    margin-top: 16px;
  }

  body #nav-hamburger .yamuna-mobile-menu-products a {
    display: flex;
    min-height: 20px;
    padding-left: 38px;
    align-items: center;
    color: #238482;
    font-size: 16px;
    font-weight: 500;
    line-height: 1.15;
    text-decoration: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-products li:nth-child(-n + 4) a {
    padding-left: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-products img {
    width: 20px;
    height: 20px;
    margin-right: 18px;
    object-fit: contain;
  }

  body #nav-hamburger .yamuna-mobile-menu-links {
    display: grid;
    gap: 18px;
    padding: 28px 2px 24px;
    border-bottom: 3px solid #f2f0f3;
  }

  body #nav-hamburger .yamuna-mobile-menu-links-last {
    gap: 26px;
    padding-bottom: 2px;
    border-bottom: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-links a {
    color: #363544;
    font-size: 17px;
    font-weight: 700;
    line-height: 1;
    text-decoration: none;
  }
}

{# Exact 320px geometry from Figma node 291:13023. #}
@media (max-width: 1023px) {
  body #nav-hamburger.modal-nav-hamburger {
    width: min(100vw, 320px) !important;
    max-width: 320px !important;
    background: #fff !important;
  }

  body #nav-hamburger .modal-close {
    top: 15px;
    left: 12px;
    width: 19px;
    height: 19px;
    border-radius: 0;
    background: url('{{ 'images/yamuna/menu-close.svg' | static_url }}') center / 19px 19px no-repeat;
  }

  body #nav-hamburger .modal-close svg { display: none; }

  body #nav-hamburger .yamuna-mobile-menu {
    position: relative;
    width: 100%;
    min-height: 670px;
    padding: 0;
    overflow: hidden;
    background-color: #fff;
    background-image: url('{{ 'images/yamuna/menu-divider-light.svg' | static_url }}'), url('{{ 'images/yamuna/menu-divider-light.svg' | static_url }}'), url('{{ 'images/yamuna/menu-divider-light.svg' | static_url }}'), url('{{ 'images/yamuna/menu-divider-dark.svg' | static_url }}'), url('{{ 'images/yamuna/menu-divider-dark.svg' | static_url }}');
    background-repeat: no-repeat;
    background-position: 12px 45px, 12px 93px, 12px 138px, 12px 476px, 12px 590px;
    background-size: calc(100% - 24px) 2px, calc(100% - 24px) 2px, calc(100% - 24px) 2px, calc(100% - 24px) 2px, calc(100% - 24px) 2px;
    font-family: 'Raleway', sans-serif;
  }

  body #nav-hamburger .yamuna-mobile-menu-account {
    position: absolute;
    top: 57px;
    left: 40px;
    width: calc(100% - 80px);
    height: 24px;
    display: block;
    border: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-account a {
    position: absolute;
    top: 0;
    color: #4a1d3a;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 500;
    line-height: 24px;
    text-decoration: none;
    text-transform: uppercase;
  }

  body #nav-hamburger .yamuna-mobile-menu-login {
    left: 0;
    display: flex;
    gap: 8px;
    align-items: center;
  }

  body #nav-hamburger .yamuna-mobile-menu-login img {
    width: 14px;
    height: 14px;
    filter: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-register {
    right: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-account-divider {
    position: absolute;
    top: 0;
    left: calc(50% - 8px);
    width: 1px;
    height: 24px;
    margin: 0;
    background: #a31460;
  }

  body #nav-hamburger .yamuna-mobile-menu-search {
    position: absolute;
    top: 102px;
    right: 12px;
    left: 14px;
    display: flex;
    height: 27px;
    padding: 0;
    align-items: center;
    justify-content: space-between;
    border: 0;
    color: rgba(74, 29, 58, .7);
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 21px;
    text-decoration: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-search img {
    width: 27px;
    height: 27px;
  }

  body #nav-hamburger .yamuna-mobile-menu-products {
    position: absolute;
    top: 150px;
    right: 12px;
    left: 14px;
    padding: 0;
    border: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu h2 {
    height: 17px;
    margin: 0 0 11px;
    color: #393747;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: 17px;
    text-transform: uppercase;
  }

  body #nav-hamburger .yamuna-mobile-menu-products ul {
    margin: 0;
    padding: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-products li,
  body #nav-hamburger .yamuna-mobile-menu-products li + li {
    position: relative;
    height: 32px;
    margin: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-products a {
    position: relative;
    display: block;
    height: 32px;
    min-height: 0;
    padding: 0 0 0 30px;
    color: #238482;
    font-family: 'Raleway', sans-serif;
    font-size: 12px;
    font-weight: 600;
    line-height: 32.28px;
    text-decoration: none;
    text-transform: uppercase;
    white-space: nowrap;
  }

  body #nav-hamburger .yamuna-mobile-menu-products li:nth-child(-n + 4) a { padding-left: 30px; }

  body #nav-hamburger .yamuna-mobile-menu-products img {
    position: absolute;
    top: 8px;
    left: 0;
    width: 16px;
    height: 16px;
    margin: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-links {
    position: absolute;
    top: 491px;
    left: 14px;
    display: block;
    padding: 0;
    border: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-links-last {
    top: 602px;
    left: 12px;
    padding: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-links a,
  body #nav-hamburger .yamuna-mobile-menu-links-last a {
    display: block;
    height: 28px;
    padding: 0;
    color: #393747;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: 28px;
    text-decoration: none;
    text-transform: uppercase;
  }

  body #nav-hamburger .yamuna-mobile-menu-links-last a + a { margin-top: 8px; }

  /* The mobile search remains in the page flow, immediately after the navbar. */
  body .head-main .yamuna-mobile-search {
    display: none;
    width: 100%;
    padding: 7px 12px 10px;
    background: #fff;
    border-top: 1px solid rgba(192, 187, 195, .2);
    border-bottom: 1px solid rgba(192, 187, 195, .2);
  }

  body .head-main .yamuna-mobile-search.is-open { display: block; }

  body .head-main .yamuna-mobile-search-form { margin: 0; }

  body .head-main .yamuna-mobile-search-form .form-group { position: relative; }

  body .head-main .yamuna-mobile-search-input.form-control {
    width: 100%;
    height: 38px;
    margin: 0;
    padding: 0 46px 0 12px;
    border: 1px solid rgba(74, 29, 58, .32);
    border-radius: 0;
    box-shadow: none;
    color: #4a1d3a;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 38px;
  }

  body .head-main .yamuna-mobile-search-input::placeholder { color: rgba(74, 29, 58, .62); opacity: 1; }

  body .head-main .yamuna-mobile-search-submit {
    position: absolute;
    top: 0;
    right: 0;
    display: flex;
    width: 42px;
    height: 38px;
    padding: 0;
    align-items: center;
    justify-content: center;
    border: 0;
    background: transparent;
  }

  body .head-main .yamuna-mobile-search-submit img { width: 21px; height: 21px; }

  body .head-main .yamuna-mobile-search-suggest {
    position: static;
    width: 100%;
    margin: 0;
  }

  body #nav-search.modal-nav-search { display: none !important; }

}

{# PDP desktop ??? Figma node 798:5606. These rules intentionally override the
   native product-detail layout only; catalogue and checkout remain untouched. #}
@media (min-width: 1024px) {
  body.template-product {
    background: #f6f6f6;
    color: #393747;
  }

  {# The regular theme header is fixed. In the Figma PDP it occupies document
     flow, so the product title is never hidden behind the navigation. #}
  body.template-product .head-main,
  body.template-product .head-main.head-fix {
    position: relative !important;
    top: auto !important;
    right: auto !important;
    left: auto !important;
    z-index: 30;
    padding: 22px 0 0 !important;
    background: transparent !important;
    box-shadow: none !important;
  }

  body.template-product .head-main .yamuna-header-desktop {
    position: relative;
    width: min(100% - 80px, 1120px);
    min-height: 52px;
    margin: 0 auto;
    padding: 0;
    border-radius: 0;
    background: transparent;
    box-shadow: none;
  }

  body.template-product .head-main .yamuna-header-desktop::before {
    position: absolute;
    z-index: -1;
    top: 0;
    right: 0;
    bottom: 0;
    left: 188px;
    display: block;
    border-radius: 28px;
    background: #a31460;
    box-shadow: 0 3px 6px rgba(70, 16, 52, .20);
    content: '';
  }

  body.template-product .head-main .yamuna-header-desktop-logo {
    width: 188px;
    flex: 0 0 188px;
    padding-left: 2px;
  }

  body.template-product .head-main .yamuna-header-logo-link {
    display: flex;
    align-items: center;
    height: 52px;
  }

  body.template-product .head-main .yamuna-header-logo-default {
    display: block;
    width: 148px;
    max-width: 148px;
    height: auto;
  }

  body.template-product .head-main .yamuna-header-logo-scrolled {
    display: none !important;
  }

  body.template-product .head-main .yamuna-header-desktop-nav {
    display: flex;
    align-items: center;
    min-width: 0;
    flex: 1 1 auto;
  }

  body.template-product .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body.template-product .head-main .yamuna-header-desktop-nav .nav-desktop-list {
    display: flex;
    align-items: center;
    gap: 24px;
    width: auto;
    margin: 0;
    padding: 0;
  }

  body.template-product .head-main .yamuna-header-desktop-nav .nav-item {
    margin: 0;
    padding: 0;
  }

  body.template-product .head-main .yamuna-header-desktop-nav .nav-list-link {
    padding: 0;
    color: #fff;
    font-family: 'Dosis', sans-serif;
    font-size: 14px;
    font-weight: 500;
    line-height: 52px;
    text-transform: uppercase;
  }

  body.template-product .head-main .yamuna-header-desktop-search {
    width: 330px;
    flex: 0 0 330px;
    margin: 0 16px 0 30px;
  }

  body.template-product .head-main .yamuna-header-desktop-search .form-control {
    height: 32px;
    border-radius: 18px;
    font-family: 'Dosis', sans-serif;
    font-size: 13px;
  }

  body.template-product .head-main .yamuna-header-desktop-utilities {
    gap: 12px;
    padding-right: 18px;
  }

  body.template-product .head-main .yamuna-header-action {
    display: flex;
    width: 20px;
    height: 20px;
    align-items: center;
    justify-content: center;
  }

  body.template-product .head-main .yamuna-header-action img {
    width: 20px;
    height: 20px;
  }

  body.template-product #single-product {
    padding: 48px 0 0;
  }

  body.template-product #single-product > .container {
    width: min(100% - 128px, 1312px);
    max-width: 1312px;
    padding: 0;
  }

  body.template-product .section-single-product {
    display: grid;
    /* Figma PDP 1440 source of truth: gallery 672px, information panel 528px and 112px gutter. */
    grid-template-columns: 672px 528px;
    gap: 112px;
    width: 100%;
    margin: 0;
    align-items: start;
  }

  body.template-product .section-single-product > .yamuna-pdp-gallery-column,
  body.template-product .section-single-product > .yamuna-pdp-summary {
    min-width: 0;
    width: auto;
    max-width: none;
    margin: 0;
    padding: 0;
  }

  body.template-product .yamuna-product-gallery-desktop {
    gap: 20px;
  }

  body.template-product .yamuna-product-gallery-item {
    width: 672px;
    height: 672px;
    box-sizing: border-box;
    border-radius: 28px;
    background: #fff;
  }

  body.template-product .yamuna-pdp-summary {
    width: 528px !important;
    min-width: 0;
    max-width: 528px !important;
    box-sizing: border-box;
  }

  body.template-product .yamuna-pdp-summary .page-header,
  body.template-product .yamuna-pdp-summary .page-header .container,
  body.template-product .yamuna-pdp-summary .page-header .row {
    width: auto;
    max-width: none;
    margin: 0;
    padding: 0;
  }

  body.template-product .yamuna-pdp-summary .breadcrumbs {
    margin: 0 0 8px;
    color: #6a6871;
    font-family: 'Dosis', sans-serif;
    font-size: 15px;
    line-height: 1.2;
  }

  body.template-product .yamuna-pdp-summary .page-header .h2 {
    margin: 0 0 12px;
    color: #4b1b3a;
    font-family: 'Dosis', sans-serif;
    font-size: 36px;
    font-weight: 700;
    line-height: 1;
  }

  body.template-product .yamuna-pdp-summary .price-container {
    position: relative;
    width: 248px;
    min-height: 136px;
    margin: 28px 0 24px;
    padding: 62px 24px 20px;
    overflow: hidden;
    border-radius: 24px;
    background: #fff;
    box-shadow: 0 5px 10px rgba(51, 35, 46, .14);
  }

  body.template-product .yamuna-pdp-summary .price-container::before {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    height: 42px;
    border-radius: 24px 24px 18px 18px;
    background: #4b1b3a;
    color: #fff;
    content: 'UNIDADE';
    font-family: 'Dosis', sans-serif;
    font-size: 17px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
  }

  body.template-product .yamuna-pdp-summary .price-container .js-price-display {
    color: #208a8c;
    font-family: 'Dosis', sans-serif;
    font-size: 28px;
    font-weight: 700;
    line-height: 1;
  }

  body.template-product .yamuna-pdp-summary .js-product-payments-container {
    width: 248px;
    margin: -44px 0 28px !important;
    padding: 0 24px 18px;
  }

  body.template-product .yamuna-pdp-summary .js-product-payments-container .js-product-installments-container,
  body.template-product .yamuna-pdp-summary .js-product-payments-container #btn-installments {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product_form {
    border-top: 1px solid #cac4ca;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    display: flex;
    flex-direction: row-reverse;
    gap: 24px;
    margin: 20px 0 0;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8,
  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    flex: initial;
    max-width: none;
    padding: 0;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8 {
    width: 370px;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    width: 134px;
  }

  body.template-product .yamuna-pdp-summary .js-addtocart:not(.js-addtocart-placeholder) {
    height: 42px;
    margin: 0 !important;
    border: 0;
    border-radius: 22px;
    background: #218c8d;
    font-family: 'Dosis', sans-serif;
    font-size: 15px;
    font-weight: 700;
    letter-spacing: .02em;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .js-addtocart-placeholder {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity {
    height: 42px;
    overflow: hidden;
    border: 1px solid #d1cbd1;
    border-radius: 22px;
    background: #f5f3f5;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon {
    min-width: 38px;
    height: 40px;
    padding: 10px !important;
    border: 0;
    border-radius: 0;
    color: #867f88;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control {
    height: 40px;
    padding: 0;
    border: 0;
    background: transparent;
    color: #4b1b3a;
    font-family: 'Dosis', sans-serif;
    font-size: 17px;
    text-align: center;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container {
    margin-top: 16px;
    padding-top: 16px;
    border-top: 1px solid #cac4ca;
  }

  body.template-product .yamuna-pdp-summary .shipping-calculator-form .form-label,
  body.template-product .yamuna-pdp-summary .shipping-calculator-form .form-control,
  body.template-product .yamuna-pdp-summary .shipping-calculator-form .btn {
    font-family: 'Dosis', sans-serif;
  }

  body.template-product .yamuna-pdp-summary .shipping-calculator-form .form-control,
  body.template-product .yamuna-pdp-summary .shipping-calculator-form .btn {
    height: 40px;
    border-radius: 20px;
  }

  body.template-product .yamuna-pdp-summary .shipping-calculator-form .btn {
    border-color: #d9b4c8;
    background: #e6bfd7;
    color: #4b1b3a;
    font-weight: 700;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .product-shipping-calculator + .form-row,
  body.template-product .yamuna-pdp-summary .form-row.mb-4.mt-4,
  body.template-product .yamuna-pdp-summary .form-row.mb-4 {
    margin-top: 18px !important;
    margin-bottom: 18px !important;
  }

  body.template-product #product-description {
    width: 528px;
    max-width: 528px;
    margin-top: 48px !important;
  }

  body.template-product #product-description .yamuna-product-description-main {
    width: 100%;
    max-width: 100%;
    padding-top: 20px;
    border-top: 2px solid #a31460;
  }

  body.template-product #product-description .yamuna-product-description-main h3:first-child::before {
    content: none !important;
    display: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .yamuna-product-description-main p,
  body.template-product #product-description .yamuna-product-description-main li {
    max-width: 100%;
    overflow-wrap: anywhere;
    color: #393747;
    font-family: 'Dosis', sans-serif;
    font-size: 16px;
    line-height: 1.5;
    white-space: normal;
  }

  body.template-product #product-description .yamuna-product-description-main p {
    margin: 0 0 18px;
  }

  body.template-product #product-description-accordions {
    width: 100%;
    margin-top: 64px;
    padding: 32px 0 40px;
    background: #ebebeb;
  }

  body.template-product #product-description-accordions .yamuna-product-description-blocks {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    column-gap: 192px;
  }

  body.template-product #product-description-accordions .yamuna-product-description-accordion {
    min-width: 0;
  }

  body.template-product #product-description-accordions .infoToOpen,
  body.template-product #product-description-accordions .infoToOpen * {
    overflow-wrap: anywhere;
  }
}

{# Keep the Figma overrides last: the base theme ships product rules after most
   component styles and would otherwise win by source order. #}
@media (min-width: 1024px) {
  body.template-product .section-single-product {
    margin: 0 !important;
  }

  body.template-product #product-description .yamuna-product-description-main h3:first-child::before {
    content: none !important;
    display: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .yamuna-product-description-main p,
  body.template-product #product-description .yamuna-product-description-main li,
  body.template-product #product-description .yamuna-product-description-main strong,
  body.template-product #product-description .yamuna-product-description-main em {
    overflow-wrap: anywhere;
    white-space: normal;
  }
}

{# Definitive final cascade for all desktop templates. #}
@media (min-width: 1024px) {
  body .head-main .yamuna-header-desktop,
  body.template-home .head-main .yamuna-header-desktop { display: flex !important; width: min(1312px,calc(100% - 128px)) !important; height: 80px !important; align-items: center !important; }
  body .head-main .yamuna-header-desktop-logo,
  body.template-home .head-main .yamuna-header-desktop-logo { position: relative !important; z-index: 30004 !important; display: flex !important; flex: 0 0 174px !important; width: 174px !important; height: 80px !important; padding: 0 !important; align-items: center !important; overflow: visible !important; transition: width .34s cubic-bezier(.22,.61,.36,1),flex-basis .34s cubic-bezier(.22,.61,.36,1),padding .34s cubic-bezier(.22,.61,.36,1) !important; }
  body .head-main .yamuna-header-desktop-logo::before,
  body.template-home .head-main .yamuna-header-desktop-logo::before { display: none !important; content: none !important; }

  body .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-nav,
  body .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search { z-index: auto !important; }
  body .head-main .yamuna-header-desktop-nav { display: flex !important; flex: 0 0 auto !important; width: auto !important; margin: 0 0 0 38px !important; align-items: center !important; gap: 24px !important; }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body .head-main .yamuna-header-desktop-nav .nav-desktop,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list { display: flex !important; width: auto !important; margin: 0 !important; padding: 0 !important; align-items: center !important; gap: 24px !important; }
  body .head-main .yamuna-header-desktop-nav .yamuna-static-nav > .nav-item,
  body .head-main .yamuna-header-desktop-nav .nav-desktop-list > .nav-main-item.nav-dropdown { display: block !important; visibility: visible !important; opacity: 1 !important; }
  body .head-main .yamuna-header-desktop-nav .nav-item-container,
  body .head-main .yamuna-header-desktop-search .search-container,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item-container,
  body.template-home .head-main .yamuna-header-desktop-search .search-container { position: relative !important; z-index: 30004 !important; }

  body .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search { flex: 0 0 392px !important; width: 392px !important; margin: 0 16px 0 auto !important; }
  body .head-main .yamuna-header-desktop-utilities,
  body.template-home .head-main .yamuna-header-desktop-utilities { position: relative !important; z-index: 30004 !important; flex: 0 0 auto !important; margin: 0 24px 0 0 !important; }
  body .head-main .yamuna-header-desktop-search .search-suggest,
  body .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown,
  body.template-home .head-main .yamuna-header-desktop-search .search-suggest,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown { position: fixed !important; z-index: 30000 !important; top: var(--yamuna-menu-top,79px) !important; }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop { width: min(1088px,calc(100% - 48px)) !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-logo { flex-basis: 148px !important; width: 148px !important; padding-left: 24px !important; }
  body .head-main .yamuna-header-logo-link { display: flex !important; width: 86px !important; height: 80px !important; align-items: center !important; }
  body .head-main .yamuna-header-logo-image { display: block !important; width: 86px !important; height: 80px !important; max-width: none !important; object-fit: contain !important; }
  body .head-main .yamuna-header-logo-scrolled { display: none !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-logo-link { width: 86px !important; height: 80px !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-logo-image { width: 86px !important; height: 80px !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-logo-default { display: none !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-logo-scrolled { display: block !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop-nav { margin-left: 12px !important; }
}

{#
  Internal pages do not have a hero behind the header.  Starting them in the
  wide, pre-scroll state leaves the magenta logo outside the capsule and makes
  it appear clipped.  Their resting state is therefore the same compact
  capsule used after scrolling; the home page retains its hero transition.
#}
@media (min-width: 1024px) {
  body:not(.template-home) .head-main .yamuna-header-desktop {
    width: min(1088px, calc(100% - 48px)) !important;
  }

  body:not(.template-home) .head-main .yamuna-header-desktop::before {
    left: 0 !important;
  }

  body:not(.template-home) .head-main .yamuna-header-desktop-logo {
    flex-basis: 148px !important;
    width: 148px !important;
    padding-left: 24px !important;
  }

  body:not(.template-home) .head-main .yamuna-header-logo-default {
    display: none !important;
  }

  body:not(.template-home) .head-main .yamuna-header-logo-scrolled {
    display: block !important;
  }

  body:not(.template-home) .head-main .yamuna-header-desktop-nav {
    margin-left: 12px !important;
  }
}

{# Mobile cart drawer: Yamuna Figma composition for filled and empty states. #}
@media (max-width: 1023px) {
  body #modal-cart.modal {
    position: fixed !important;
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: auto !important;
    display: block !important;
    width: 100vw !important;
    max-width: none !important;
    height: 100dvh !important;
    max-height: none !important;
    padding: 0 !important;
    overflow: hidden !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: #fff !important;
    box-shadow: -12px 0 32px rgba(41, 23, 37, .16) !important;
    opacity: 0;
    visibility: hidden;
    transform: translate3d(100%, 0, 0) !important;
    transition: transform .42s cubic-bezier(.22, .61, .36, 1), opacity .24s ease, visibility 0s linear .42s !important;
    z-index: 31000 !important;
  }

  body .js-modal-overlay[data-modal-id="#modal-cart"] {
    z-index: 30000 !important;
  }

  body #modal-cart.modal.modal-show {
    opacity: 1;
    visibility: visible;
    transform: translate3d(0, 0, 0) !important;
    transition: transform .42s cubic-bezier(.22, .61, .36, 1), opacity .24s ease, visibility 0s !important;
  }

  body #modal-cart .js-ajax-cart-panel {
    position: relative;
    display: flex;
    height: 100%;
    min-height: 0;
    flex-direction: column;
    background: #fff;
  }

  body #modal-cart .modal-header {
    position: relative;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex: 0 0 58px;
    width: 100%;
    height: 58px;
    min-height: 58px;
    max-height: 58px;
    margin: 0;
    padding: 0 12px;
    box-sizing: border-box;
    border-bottom: 1px solid #d8d0d6;
    background: #fff !important;
    color: #4a1d3a;
    font-family: 'Raleway', sans-serif;
    font-size: 16px;
    font-weight: 700;
    line-height: 1;
    text-transform: uppercase;
    letter-spacing: 0.02em;
  }

  body #modal-cart .yamuna-cart-modal-header,
  body #modal-cart .yamuna-cart-header-title {
    color: #4a1d3a;
    font-family: 'Raleway', sans-serif;
    font-size: 16px;
    font-weight: 700;
    line-height: 1;
    text-transform: uppercase;
    letter-spacing: 0.02em;
    display: flex;
    align-items: center;
    margin: 0;
    padding: 0;
  }

  body #modal-cart .modal-header .modal-close,
  body #modal-cart .yamuna-cart-modal-close {
    position: static;
    transform: none;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    min-width: 24px;
    min-height: 24px;
    margin: 0;
    padding: 0;
    border: 0;
    border-radius: 50%;
    background: #f3eef1;
    cursor: pointer;
    z-index: 11;
    flex-shrink: 0;
  }

  body #modal-cart .modal-header .modal-close svg,
  body #modal-cart .yamuna-cart-modal-close svg {
    display: block;
    width: 10px;
    height: 10px;
    stroke: #4a1d3a;
    fill: none;
  }

  body #modal-cart .modal-body {
    position: relative;
    flex: 1 1 auto;
    min-height: 0;
    padding: 0 !important;
    overflow-y: auto;
    overflow-x: hidden;
    background: #fff;
  }

  body #modal-cart .js-ajax-cart-list { position: relative; z-index: 1; padding: 53px 12px 0; }

  body #modal-cart .cart-item {
    position: relative;
    display: flex;
    min-height: 130px;
    height: 130px;
    margin: 0;
    padding: 0;
    border-bottom: 1px solid #c0bbc3;
  }

  body #modal-cart .cart-item > .col-2 { flex: 0 0 80px; width: 80px; max-width: 80px; padding: 0; }
  body #modal-cart .cart-item > .col-2 a,
  body #modal-cart .cart-item > .col-2 img { display: block; width: 80px; height: 80px; }
  body #modal-cart .cart-item > .col-2 img { object-fit: contain; }

  body #modal-cart .cart-item > .col-10 {
    position: relative;
    display: block !important;
    flex: 1 1 auto;
    width: calc(100% - 80px);
    max-width: calc(100% - 80px);
    height: 129px;
    padding: 0 0 0 13px;
  }

  body #modal-cart .cart-item > .col-10 > .w-100 { position: relative; height: 100%; }

  body #modal-cart .cart-item-name {
    width: calc(100% - 70px);
    margin: 0;
    padding: 0;
    color: #393747;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 17px;
  }

  body #modal-cart .cart-item-name a { color: inherit; text-decoration: none; }
  body #modal-cart .cart-item-name small,
  body #modal-cart .cart-item-name [data-component="cart-labels"],
  body #modal-cart .js-cart-item-subtotal-compare-price-container { display: none !important; }

  body #modal-cart .yamuna-cart-item-promo {
    position: absolute;
    top: 40px;
    left: 13px;
    display: flex;
    width: 99px;
    min-height: 30px;
    padding: 4px 6px;
    align-items: center;
    border-radius: 3px;
    background: rgba(192, 187, 195, .2);
    color: #393747;
    font-family: 'Dosis', sans-serif;
    font-size: 10px;
    font-weight: 400;
    line-height: 11px;
    text-align: center;
  }

  body #modal-cart .yamuna-cart-item-promo strong { font-weight: 600; }

  body #modal-cart .cart-item-subtotal {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    color: #238482;
    font-family: 'Inter', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: 17px;
  }

  body #modal-cart .cart-item-subtotal .js-cart-item-subtotal { margin: 0; }

  body #modal-cart .cart-item > .col-10 > .w-100 > .cart-item-quantity { position: absolute; top: 87px; left: 0; width: 81px; margin: 0; }

  body #modal-cart .cart-item-quantity .form-group,
  body #modal-cart .cart-item-quantity .form-quantity,
  body #modal-cart .cart-item-quantity .form-quantity .row {
    display: flex;
    width: 81px;
    height: 30px;
    margin: 0;
    padding: 0;
    align-items: center;
  }

  body #modal-cart .cart-item-quantity .form-quantity { overflow: visible; border: 0; }

  body #modal-cart .cart-item-quantity .form-quantity-icon,
  body #modal-cart .cart-item-quantity .form-control {
    height: 30px !important;
    min-height: 30px;
    margin: 0;
    border: 1px solid #c0bbc3;
    border-radius: 0;
  }

  body #modal-cart .cart-item-quantity .form-quantity-icon {
    display: flex;
    flex: 0 0 23px;
    width: 23px;
    padding: 0;
    align-items: center;
    justify-content: center;
    background: rgba(192, 187, 195, .28);
    color: #9e929e;
  }

  body #modal-cart .cart-item-quantity .form-control {
    flex: 0 0 35px;
    width: 35px;
    padding: 0;
    border-right: 0;
    border-left: 0;
    background: #fff;
    color: #393747;
    font-family: 'Inter', sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 28px;
  }

  body #modal-cart .cart-item-quantity .form-quantity-icon svg,
  body #modal-cart .cart-item-quantity .form-quantity-icon use { width: 12px; height: 12px; fill: #9e929e; }

  body #modal-cart .yamuna-cart-subscription {
    position: absolute;
    top: 87px;
    left: 94px;
    display: block;
    width: 138px;
    height: 30px;
    padding: 0;
    border: 1px solid #a31460;
    border-radius: 2px;
    color: #a31460;
    font-family: 'Inter', sans-serif;
    font-size: 10px;
    font-weight: 500;
    line-height: 28px;
    text-align: center;
    white-space: nowrap;
  }

  body #modal-cart .cart-item-delete { position: absolute; z-index: 2; top: 87px; right: 0; width: 18px; height: 28px; display: flex; align-items: center; justify-content: flex-end; margin: 0; padding: 0; }
  body #modal-cart .cart-item-delete .btn { display: flex; align-items: center; justify-content: center; width: 18px; height: 18px; margin: 0; padding: 0; border: 0; background: transparent; }
  body #modal-cart .yamuna-cart-trash-icon { display: block; width: 14px; height: 16px; }

  body #modal-cart .yamuna-cart-shipping-promo {
    position: relative;
    top: auto;
    right: auto;
    bottom: auto;
    left: auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: calc(100% - 24px);
    height: 28px;
    min-height: 28px;
    margin: 16px 12px 14px 12px;
    padding: 0 8px 4px 8px;
    background: #f7f5f6;
    border-radius: 2px;
    overflow: hidden;
    box-sizing: border-box;
  }

  body #modal-cart .yamuna-cart-shipping-promo .yamuna-cart-promo-text,
  body #modal-cart .yamuna-cart-shipping-promo > span {
    display: block;
    color: #a31460;
    font-family: 'Raleway', sans-serif;
    font-size: 11px;
    font-weight: 700;
    line-height: 16px;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 0.04em;
    white-space: nowrap;
  }

  body #modal-cart .yamuna-cart-shipping-promo i,
  body #modal-cart .yamuna-cart-shipping-promo .yamuna-cart-promo-bar {
    position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    display: block;
    width: 100%;
    height: 3px;
    background: rgba(192, 187, 195, 0.4);
  }

  body #modal-cart .yamuna-cart-shipping-promo i::before,
  body #modal-cart .yamuna-cart-shipping-promo .yamuna-cart-promo-progress {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    display: block;
    height: 3px;
    background: #a31460;
    content: '';
  }

  body #modal-cart #error-ajax-stock,
  body #modal-cart .modal-body > .cart-row:not(.js-ajax-cart-list):not(.js-empty-ajax-cart),
  body #modal-cart .js-fulfillment-info,
  body #modal-cart .js-shipping-calculator-container,
  body #modal-cart #cart-shipping-container,
  body #modal-cart .js-ajax-cart-submit,
  body #modal-cart [data-component="cart-totals"] { display: none !important; }

  body #modal-cart .js-empty-ajax-cart { position: absolute; top: 15px; right: 12px; bottom: 136px; left: 12px; padding: 0; }
  body #modal-cart .js-empty-ajax-cart .alert-info,
  body #modal-cart .yamuna-empty-cart-content > p,
  body #modal-cart .yamuna-empty-cart-content > strong { display: none; }
  body #modal-cart .yamuna-empty-cart-content { position: static; margin: 0; padding: 0; }
  body #modal-cart .yamuna-empty-cart-links { display: grid; gap: 16px; margin: 0; }

  body #modal-cart .yamuna-empty-cart-link {
    position: relative;
    display: flex;
    height: 64px;
    padding: 0;
    align-items: flex-end;
    overflow: hidden;
    border-radius: 5px;
    background: #d9d9d9;
    color: #fff;
    font-family: 'Raleway', sans-serif;
    font-size: 12px;
    font-weight: 700;
    line-height: 22px;
    text-decoration: none;
    text-transform: uppercase;
  }

  body #modal-cart .yamuna-empty-cart-link::before { position: absolute; inset: 0; background-position: center; background-size: cover; filter: grayscale(1); content: ''; }
  body #modal-cart .yamuna-empty-cart-link::after { position: absolute; inset: 0; background: rgba(74, 29, 58, .12); content: ''; }
  body #modal-cart .yamuna-empty-cart-link-super::before { background-image: url('{{ 'images/yamuna/cart-empty-superfoods.png' | static_url }}'); }
  body #modal-cart .yamuna-empty-cart-link-cosmetics::before { background-image: url('{{ 'images/yamuna/cart-empty-cosmetics.png' | static_url }}'); }

  body #modal-cart .yamuna-empty-cart-link span {
    position: relative;
    z-index: 1;
    display: block;
    height: 22px;
    padding: 0 8px;
    border-radius: 0 6px 6px 0;
    background: #4a1d3a;
    color: #fff;
  }

  body #modal-cart .yamuna-cart-dropdown-footer,
  body #modal-cart .yamuna-cart-empty-footer { position: absolute; z-index: 3; right: 0; bottom: 0; left: 0; display: block; height: 136px; background: #fff; }
  body #modal-cart .yamuna-cart-dropdown-footer p { display: none; }

  body #modal-cart .yamuna-cart-discount {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    display: flex;
    height: 32px;
    padding: 0;
    align-items: center;
    justify-content: center;
    background: #a31460;
    color: #fff;
    font-family: 'Dosis', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: 17px;
    text-align: center;
    text-transform: uppercase;
  }

  body #modal-cart .yamuna-cart-discount::before { display: block; width: 18px; height: 18px; margin-right: 8px; background: url('{{ 'images/yamuna/cart-discount.svg' | static_url }}') center / 18px 18px no-repeat; content: ''; }

  body #modal-cart .yamuna-cart-checkout {
    position: absolute;
    right: 12px;
    bottom: 24px;
    left: 12px;
    display: flex;
    width: calc(100% - 24px);
    height: 42px;
    padding: 0;
    align-items: center;
    justify-content: center;
    gap: 8px;
    border: 0;
    border-radius: 23px;
    background: #238482;
    color: #fff;
    font-family: 'Raleway', sans-serif;
    font-size: 18px;
    font-weight: 700;
    line-height: 22px;
    text-transform: uppercase;
  }

  body #modal-cart .yamuna-cart-checkout img { display: block; width: 18px; height: 18px; }
  body #modal-cart .yamuna-cart-empty-footer .yamuna-cart-checkout { background: #c0bbc3; }
}

{# Tablet bridge: desktop navigation begins at 1024px, so 768-1023px keeps the compact Yamuna header. #}
@media (min-width: 768px) and (max-width: 1023px) {
  body .head-main > .yamuna-header-desktop,
  body.template-home .head-main > .yamuna-header-desktop,
  body .head-main > .container-fluid,
  body.template-home .head-main > .container-fluid,
  body .head-main .section-topbar { display: none !important; }

  body .head-main .yamuna-header-mobile {
    display: flex !important;
    width: 100%;
    height: 80px;
    padding: 0 24px;
    align-items: center;
    justify-content: space-between;
    background: #fff;
  }

  body .head-main .yamuna-header-mobile-logo {
    display: flex;
    width: 125.57px;
    height: 44.79px;
    flex: 0 0 125.57px;
    align-items: center;
  }

  body .head-main .yamuna-header-mobile-logo img { display: block; width: 100%; height: 100%; object-fit: contain; }
  body .head-main .yamuna-header-mobile-actions { display: flex; gap: 16px; align-items: center; }

  body .head-main .yamuna-header-mobile-action {
    position: relative;
    display: inline-flex;
    width: 32px;
    height: 32px;
    padding: 0;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: transparent;
  }

  body .head-main .yamuna-header-mobile-button { display: block; width: 32px; height: 32px; }
  body .head-main .yamuna-header-mobile-glyph { position: absolute; top: 6px; left: 6px; display: block; width: 20px; height: 20px; }

  body .head-main .yamuna-header-mobile-cart-count {
    position: absolute;
    top: -4px;
    right: -4px;
    display: none;
    min-width: 14px;
    height: 14px;
    padding: 1px 3px;
    border-radius: 7px;
    background: #a31460;
    color: #fff;
    font-size: 10px;
    font-weight: 700;
    line-height: 12px;
    text-align: center;
  }

  body .head-main .yamuna-header-mobile-cart-count:not(:empty) { display: block; }

  body .head-main .yamuna-mobile-search {
    display: none !important;
    width: 100%;
    padding: 7px 24px 10px;
    background: #fff;
    border-top: 1px solid rgba(192, 187, 195, .2);
    border-bottom: 1px solid rgba(192, 187, 195, .2);
  }

  body .head-main .yamuna-mobile-search.is-open { display: block !important; }
  body .head-main .yamuna-mobile-search-form { margin: 0; }
  body .head-main .yamuna-mobile-search-form .form-group { position: relative; }

  body .head-main .yamuna-mobile-search-input.form-control {
    width: 100%;
    height: 38px;
    margin: 0;
    padding: 0 46px 0 12px;
    border: 1px solid rgba(74, 29, 58, .32);
    border-radius: 0;
    box-shadow: none;
    color: #4a1d3a;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 38px;
  }

  body .head-main .yamuna-mobile-search-input::placeholder { color: rgba(74, 29, 58, .62); opacity: 1; }
  body .head-main .yamuna-mobile-search-submit { position: absolute; top: 0; right: 0; display: flex; width: 42px; height: 38px; padding: 0; align-items: center; justify-content: center; border: 0; background: transparent; }
  body .head-main .yamuna-mobile-search-submit img { width: 21px; height: 21px; }
  body .head-main .yamuna-mobile-search-suggest { position: static; width: 100%; margin: 0; }
}

{# Mobile header: softly blend into the hero on every viewport below desktop. #}
@media (max-width: 1023px) {
  body.template-home .head-main,
  body.template-home .head-main.head-fix {
    position: fixed !important;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1050;
    height: 80px;
    padding-top: 0 !important;
    background: #fff !important;
    overflow: visible;
    transition: background .28s ease, box-shadow .28s ease;
  }

  /* O header termina exatamente onde o hero come?a: sem a faixa/gradiente
   * branco sobre o topo do banner no mobile e tablet. */
  body.template-home .head-main::after {
    position: absolute;
    top: calc(100% - 1px);
    right: 0;
    left: 0;
    z-index: 1;
    display: block;
    height: 96px;
    content: '';
    pointer-events: none;
    background: linear-gradient(180deg, #fff 0%, rgba(255, 255, 255, .96) 13%, rgba(255, 255, 255, .82) 31%, rgba(255, 255, 255, .55) 55%, rgba(255, 255, 255, .24) 78%, rgba(255, 255, 255, 0) 100%);
  }

  body.template-home .head-main .yamuna-header-mobile,
  body.template-home .head-main .yamuna-mobile-search { position: relative; z-index: 2; }
}

{# Responsive benefits carousel: 1 / 2 / 3 / all items. #}
[data-store="banner-services"] .js-informative-banners { width: 100%; overflow: hidden; }
[data-store="banner-services"] .js-informative-banners .swiper-wrapper { align-items: center; }
[data-store="banner-services"] .js-informative-banners .service-item { min-height: 52px; }
[data-store="banner-services"] .js-informative-banners .service-item .row { margin-right: 0; margin-left: 0; justify-content: center; }
[data-store="banner-services"] .js-informative-banners .service-item .row > .col.p-0 { width: auto; max-width: calc(100% - 54px); flex: 0 1 auto; }

@media (max-width: 479px) {
  [data-store="banner-services"] .section-informative-banners { padding: 16px 0 18px; }
  [data-store="banner-services"] .js-informative-banners .swiper-slide { width: 100% !important; }
}

@media (min-width: 480px) and (max-width: 767px) {
  [data-store="banner-services"] .section-informative-banners { padding: 18px 0 20px; }
  [data-store="banner-services"] .js-informative-banners .swiper-slide { width: 50% !important; }
}

@media (min-width: 768px) and (max-width: 1023px) {
  [data-store="banner-services"] .section-informative-banners { padding: 20px 0; }
  [data-store="banner-services"] .js-informative-banners .swiper-slide {
    width: 50% !important;
    max-width: 50% !important;
    flex: 0 0 50% !important;
  }
}

@media (min-width: 1024px) {
  {# Match the desktop header's horizontal grid and distribute each benefit by its content width. #}
  [data-store="banner-services"] .section-informative-banners > .container {
    width: min(1312px, calc(100% - 128px));
    max-width: none;
    padding-right: 0;
    padding-left: 0;
  }
  [data-store="banner-services"] .section-informative-banners > .container > .row {
    margin-right: 0;
    margin-left: 0;
  }
  [data-store="banner-services"] .js-informative-banners { overflow: visible; }
  [data-store="banner-services"] .js-informative-banners .swiper-wrapper {
    display: grid !important;
    grid-template-columns: repeat(5, max-content);
    justify-content: space-between;
    width: 100% !important;
    transform: none !important;
    transition: none !important;
  }
  [data-store="banner-services"] .js-informative-banners .swiper-slide {
    width: auto !important;
    max-width: none !important;
    padding-right: 0 !important;
    padding-left: 0 !important;
    flex: 0 0 auto !important;
  }
  [data-store="banner-services"] .js-informative-banners .service-item .row {
    margin-right: 0;
    margin-left: 0;
    column-gap: 12px;
    justify-content: flex-start;
  }
  [data-store="banner-services"] .js-informative-banners .service-item .row > .col-auto { padding-right: 0; padding-left: 0; }
  [data-store="banner-services"] .js-informative-banners .service-item .row > .col.p-0 {
    width: auto;
    max-width: none;
    flex: 0 0 auto;
  }
  [data-store="banner-services"] .service-pagination { display: none; }
}

@media (prefers-reduced-motion: reduce) {
  [data-store="banner-services"] .swiper-wrapper { transition-duration: 0ms !important; }
}

{# Compact desktop header: preserve space for navigation at 1024?1439px. #}
@media (min-width: 1024px) and (max-width: 1439px) {
  body .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search {
    flex: 0 0 266px !important;
    width: 266px !important;
    margin-right: 12px !important;
  }
}

@media (min-width: 1440px) {
  body .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search {
    flex-basis: 392px !important;
    width: 392px !important;
  }
}

{# Figma desktop header (node 845:5824). This is intentionally global: the
   same capsule must render identically on every storefront page. #}
@media (min-width: 1024px) {
  body .head-main > .container-fluid,
  body .head-main .section-topbar {
    display: none !important;
  }

  body .head-main .yamuna-header-desktop {
    position: relative !important;
    z-index: 1;
    display: flex !important;
    width: min(1312px, calc(100% - 128px)) !important;
    height: 59px !important;
    min-height: 59px !important;
    margin: 25px auto 0 !important;
    padding: 0 !important;
    align-items: center;
    isolation: isolate;
  }

  body .head-main .yamuna-header-desktop::before {
    position: absolute;
    z-index: -1;
    top: 0;
    right: 0;
    bottom: 0;
    left: 224px;
    display: block;
    border-radius: 54px;
    background: #a31460;
    box-shadow: 4px 4px 4px -2px rgba(0, 0, 0, .25);
    content: '';
  }

  body .head-main .yamuna-header-desktop-logo {
    display: flex;
    width: 174px;
    height: 59px;
    flex: 0 0 174px;
    align-items: center;
  }

  body .head-main .yamuna-header-logo-link,
  body .head-main .yamuna-header-logo-image {
    display: block;
    width: 174px;
    height: 59px;
  }

  body .head-main .yamuna-header-logo-image {
    object-fit: contain;
  }

  body .head-main .yamuna-header-desktop-nav {
    display: flex;
    margin-left: 108px;
    gap: 24px;
    align-items: center;
    white-space: nowrap;
  }

  body .head-main .yamuna-header-desktop-nav .nav-list-link {
    color: #fff;
    font-family: Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 500;
    line-height: 59px;
    text-decoration: none;
    text-transform: uppercase;
  }

  body .head-main .yamuna-header-desktop-search {
    width: 392px;
    margin: 0 8px 0 auto;
    flex: 0 0 392px;
  }

  body .head-main .yamuna-header-desktop-search .search-input {
    height: 35px;
    border: 1px solid #fff;
    border-radius: 32px;
    color: #fff;
    background: transparent;
  }

  body .head-main .yamuna-header-desktop-search .search-input::placeholder {
    color: rgba(255, 255, 255, .84);
  }

  body .head-main .yamuna-header-desktop-search .search-input-submit {
    color: #fff;
  }

  body .head-main .yamuna-header-desktop-utilities {
    display: flex;
    width: 128px;
    margin-right: 32px;
    gap: 16px;
    flex: 0 0 128px;
    align-items: center;
  }

  body .head-main .yamuna-header-action {
    position: relative;
    display: flex;
    width: 32px;
    height: 32px;
    flex: 0 0 32px;
    align-items: center;
    justify-content: center;
  }

  body .head-main .yamuna-header-action img {
    display: block;
    width: 32px;
    height: 32px;
  }

  body .head-main .yamuna-header-cart-count {
    position: absolute;
    top: -5px;
    right: -5px;
  }

  /* Supersede earlier page-specific header experiments. */
  body[class] .head-main .yamuna-header-desktop {
    display: flex !important;
    width: min(1312px, calc(100% - 128px)) !important;
    height: 59px !important;
    min-height: 59px !important;
    margin: 25px auto 0 !important;
  }

  body[class] .head-main .yamuna-header-desktop::before {
    z-index: -1 !important;
    /* 1320px shell - 1090px initial bar. The shell is always centered;
       only this left edge moves when the header expands. */
    left: 230px !important;
    border-radius: 54px !important;
    background: #a31460 !important;
  }

  body[class] .head-main .yamuna-header-desktop-logo,
  body[class] .head-main .yamuna-header-logo-link,
  body[class] .head-main .yamuna-header-logo-image {
    width: 174px !important;
    height: 62px !important;
  }

  body[class] .head-main .yamuna-header-desktop-logo {
    padding-left: 0 !important;
    flex-basis: 174px !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav {
    margin-left: 108px !important;
  }

  body[class] .head-main .yamuna-header-desktop-search {
    width: 392px !important;
    flex-basis: 392px !important;
  }

  body[class] .head-main .yamuna-header-desktop-utilities {
    width: 128px !important;
    flex-basis: 128px !important;
  }

  body[class] .head-main .yamuna-header-action,
  body[class] .head-main .yamuna-header-action {
    width: 32px !important;
    height: 32px !important;
  }

  body[class] .head-main .yamuna-header-action img {
    width: 20px !important;
    height: 20px !important;
  }
}

{# PLP: desktop and filter drawer composition from the Yamuna catalog designs. #}
body.template-category {
  background: #f6f5f6;
}

body.template-category .yamuna-plp-page-heading {
  display: none;
}

body.template-category .yamuna-plp-hero {
  display: grid;
  grid-template-columns: minmax(0, 862px) minmax(320px, 416px);
  gap: 34px;
  width: min(1312px, calc(100% - 48px));
  margin: 0 auto 32px;
  align-items: center;
}

body.template-category .yamuna-plp-hero-image {
  height: 254px;
  overflow: hidden;
  border-radius: 12px;
  background: #fff;
}

body.template-category .yamuna-plp-hero-image img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

body.template-category .yamuna-plp-hero-content {
  color: #4a1d3a;
}

body.template-category .yamuna-plp-hero-content h1 {
  margin: 0 0 12px;
  color: #4a1d3a;
  font-family: 'Raleway', sans-serif;
  font-size: 18px;
  font-weight: 700;
  line-height: 1.2;
  text-transform: uppercase;
}

body.template-category .yamuna-plp-hero-description,
body.template-category .yamuna-plp-hero-description * {
  margin: 0;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 17px;
  font-weight: 400;
  line-height: 1.42;
}

body.template-category .yamuna-plp-body > .container {
  width: min(1312px, calc(100% - 48px));
  max-width: none;
  padding: 0;
}

body.template-category .yamuna-plp-body > .container > .row > .col-md-2 {
  display: none !important;
}

body.template-category .yamuna-plp-body [data-store^="category-grid-"] {
  width: 100%;
  max-width: 100%;
  flex: 0 0 100%;
  padding: 0;
}

body.template-category .category-controls {
  position: static;
  width: min(1312px, calc(100% - 48px));
  margin: 0 auto 24px;
  padding: 0;
}

body.template-category .category-controls .row {
  margin: 0;
}

body.template-category .yamuna-plp-filter-trigger {
  display: inline-flex;
  min-width: 132px;
  height: 42px;
  padding: 0 18px;
  align-items: center;
  justify-content: center;
  gap: 9px;
  border: 1px solid #a31460;
  border-radius: 24px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 600;
  line-height: 1;
  text-decoration: none;
  text-transform: uppercase;
}

body.template-category .yamuna-plp-filter-trigger .yamuna-plp-filter-trigger-icon {
  width: 18px;
  height: 6px;
  flex: 0 0 18px;
}

body.template-category .yamuna-plp-sort {
  display: flex;
  justify-content: flex-end;
  padding: 0;
}

body.template-category .yamuna-plp-sort .form-group,
body.template-category .yamuna-plp-sort .form-select {
  margin: 0;
}

body.template-category .yamuna-plp-sort select {
  min-width: 195px;
  border: 0;
  background-color: transparent;
  color: #a31460;
  font-family: 'Dosis', sans-serif;
  font-size: 16px;
  font-weight: 400;
}

body.template-category .js-product-table {
  margin-right: -16px;
  margin-left: -16px;
}

body.template-category .js-product-table > .js-item-product {
  display: flex;
  flex: 0 0 33.333333%;
  width: 33.333333%;
  max-width: 33.333333%;
  padding: 0 16px 32px;
}

body.template-category .js-product-table .item-product {
  display: flex;
  width: 100%;
  min-height: 580px;
  margin: 0;
  padding: 0;
  flex-direction: column;
  overflow: hidden;
  border-radius: 12px;
  background: #fff;
  box-shadow: none;
  text-align: left;
}

body.template-category .js-product-table .item-image {
  width: calc(100% - 56px);
  height: 360px;
  max-height: 360px;
  margin: 24px 28px 0;
  overflow: hidden;
  border-radius: 8px;
}

body.template-category .js-product-table .item-image img {
  width: 100%;
  height: 100%;
  max-height: none;
  object-fit: contain;
}

body.template-category .js-product-table .item-description {
  padding: 5px 28px 0 !important;
}

body.template-category .js-product-table .item-name {
  margin: 0 0 6px !important;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 600;
  line-height: 1.2;
}

body.template-category .js-product-table .item-price-container {
  display: inline-flex;
  margin: 0 !important;
  align-items: baseline;
  gap: 10px;
}

body.template-category .js-product-table .item-price {
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 24px;
  font-weight: 600;
  line-height: 1.1;
}

body.template-category .js-product-table .item-installments {
  display: inline;
  margin: 0 0 0 10px;
  color: #9e929e;
  font-family: 'Dosis', sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.1;
}

body.template-category .yamuna-plp-item-actions {
  margin-top: auto;
  padding: 18px 28px 24px;
}

body.template-category .yamuna-plp-item-actions form {
  display: grid;
  gap: 10px;
}

body.template-category .yamuna-plp-buy-one,
body.template-category .yamuna-plp-buy-three {
  display: flex;
  width: 100%;
  min-height: 40px;
  padding: 8px 18px;
  align-items: center;
  justify-content: center;
  border: 1px solid #238482;
  border-radius: 24px;
  background: #238482;
  color: #fff;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 600;
  line-height: 1.1;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
}

body.template-category .yamuna-plp-buy-three {
  background: #fff;
  color: #238482;
  font-size: 12px;
}

body.template-category .yamuna-plp-buy-three span {
  margin-left: 4px;
  font-weight: 600;
}

body.template-category .yamuna-plp-buy-one img,
body.template-category .yamuna-plp-buy-three img {
  width: 14px;
  height: 14px;
  margin-right: 8px;
}

{# Search uses the same PLP component tree as category. #}
body.template-search {
  background: #f6f5f6;
}

body.template-search .page-header {
  display: none;
}

body.template-search .yamuna-plp-body > .container {
  width: min(1312px, calc(100% - 48px));
  max-width: none;
  padding: 0;
}

body.template-search .yamuna-plp-body > .container > .row > .col-md-2 {
  display: none !important;
}

body.template-search .yamuna-plp-body [data-store^="category-grid-"] {
  width: 100%;
  max-width: 100%;
  flex: 0 0 100%;
  padding: 0;
}

body.template-search .category-controls {
  position: static;
  width: min(1312px, calc(100% - 48px));
  margin: 0 auto 24px;
  padding: 0;
}

body.template-search .category-controls .row { margin: 0; }

body.template-search .yamuna-plp-filter-trigger {
  display: inline-flex;
  min-width: 132px;
  height: 42px;
  padding: 0 18px;
  align-items: center;
  justify-content: center;
  gap: 9px;
  border: 1px solid #a31460;
  border-radius: 24px;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 600;
  line-height: 1;
  text-decoration: none;
  text-transform: uppercase;
}

body.template-search .yamuna-plp-filter-trigger .yamuna-plp-filter-trigger-icon {
  width: 18px;
  height: 6px;
  flex: 0 0 18px;
}

body.template-search .yamuna-plp-sort {
  display: flex;
  justify-content: flex-end;
  padding: 0;
}

body.template-search .yamuna-plp-sort .form-group,
body.template-search .yamuna-plp-sort .form-select { margin: 0; }

body.template-search .yamuna-plp-sort select {
  min-width: 195px;
  border: 0;
  background-color: transparent;
  color: #a31460;
  font-family: 'Dosis', sans-serif;
  font-size: 16px;
  font-weight: 400;
}

body.template-search .js-product-table {
  margin-right: -16px;
  margin-left: -16px;
}

body.template-search .js-product-table > .js-item-product {
  display: flex;
  flex: 0 0 33.333333%;
  width: 33.333333%;
  max-width: 33.333333%;
  padding: 0 16px 32px;
}

body.template-search .js-product-table .item-product {
  display: flex;
  width: 100%;
  min-height: 580px;
  margin: 0;
  padding: 0;
  flex-direction: column;
  overflow: hidden;
  border-radius: 12px;
  background: #fff;
  box-shadow: none;
  text-align: left;
}

body.template-search .js-product-table .item-image {
  width: calc(100% - 56px);
  height: 360px;
  max-height: 360px;
  margin: 24px 28px 0;
  overflow: hidden;
  border-radius: 8px;
}

body.template-search .js-product-table .item-image img {
  width: 100%;
  height: 100%;
  max-height: none;
  object-fit: contain;
}

body.template-search .js-product-table .item-description {
  padding: 5px 28px 0 !important;
}

body.template-search .js-product-table .item-name {
  margin: 0 0 6px !important;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 600;
  line-height: 1.2;
}

body.template-search .js-product-table .item-price-container {
  display: inline-flex;
  margin: 0 !important;
  align-items: baseline;
  gap: 10px;
}

body.template-search .js-product-table .item-price {
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 24px;
  font-weight: 600;
  line-height: 1.1;
}

body.template-search .js-product-table .item-installments {
  display: inline;
  margin: 0 0 0 10px;
  color: #9e929e;
  font-family: 'Dosis', sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.1;
}

body.template-search .yamuna-plp-item-actions {
  margin-top: auto;
  padding: 18px 28px 24px;
}

body.template-search .yamuna-plp-item-actions form {
  display: grid;
  gap: 10px;
}

body.template-search .yamuna-plp-buy-one,
body.template-search .yamuna-plp-buy-three {
  display: flex;
  width: 100%;
  min-height: 40px;
  padding: 8px 18px;
  align-items: center;
  justify-content: center;
  border: 1px solid #238482;
  border-radius: 24px;
  background: #238482;
  color: #fff;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 600;
  line-height: 1.1;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
}

body.template-search .yamuna-plp-buy-three {
  background: #fff;
  color: #238482;
  font-size: 12px;
}

body.template-search .yamuna-plp-buy-three span { margin-left: 4px; }

body.template-search .yamuna-plp-buy-one img,
body.template-search .yamuna-plp-buy-three img {
  width: 14px;
  height: 14px;
  margin-right: 8px;
}

{# Filter drawer: base and selected states follow the two Figma filter modal variants. #}
#nav-filters.yamuna-plp-filters-modal {
  width: 360px;
  max-width: 100vw;
  height: 100dvh;
  padding: 0;
  overflow: hidden;
  border-radius: 0;
  background: #fff;
  box-shadow: 12px 0 32px rgba(74, 29, 58, .08);
}

#nav-filters.yamuna-plp-filters-modal.modal-show {
  display: flex !important;
  flex-direction: column;
}

#nav-filters.yamuna-plp-filters-modal .modal-header {
  position: relative;
  width: 100%;
  min-height: 78px;
  margin: 0;
  padding: 30px 70px 18px 27px;
  color: #4a1d3a;
  font-family: 'Raleway', sans-serif;
  font-size: 17px;
  font-weight: 700;
  line-height: 1.2;
  text-transform: uppercase;
}

#nav-filters.yamuna-plp-filters-modal .modal-close {
  top: 26px;
  right: 27px;
  display: flex;
  width: 24px;
  height: 24px;
  padding: 0;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: #f1eef1;
}

#nav-filters.yamuna-plp-filters-modal .modal-close-icon {
  width: 12px;
  height: 12px;
  fill: #4a1d3a;
}

#nav-filters.yamuna-plp-filters-modal .modal-body {
  position: relative;
  flex: 1 1 auto;
  min-height: 0;
  padding: 0 16px 136px;
  overflow-y: auto;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-list {
  display: grid;
  gap: 4px;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option {
  position: relative;
  display: block;
  margin: 0;
  cursor: pointer;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option input {
  position: absolute;
  opacity: 0;
  pointer-events: none;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option-content {
  display: flex;
  min-height: 60px;
  padding: 10px 12px;
  align-items: center;
  gap: 12px;
  border-radius: 30px;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option.is-selected .yamuna-plp-filter-option-content {
  background: #e5f3f2;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon {
  position: relative;
  display: block;
  width: 40px;
  height: 40px;
  flex: 0 0 40px;
  border: 2px solid #c8e4e3;
  border-radius: 50%;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon::after {
  position: absolute;
  top: 10px;
  left: 10px;
  width: 16px;
  height: 16px;
  border: 2px solid #238482;
  border-radius: 50%;
  content: '';
}

#nav-filters.yamuna-plp-filters-modal .checkbox-text {
  color: #238482;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 600;
  line-height: 1.25;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-remove {
  display: none;
  margin-left: auto;
  color: #238482;
  font-family: Arial, sans-serif;
  font-size: 25px;
  font-weight: 300;
  line-height: 1;
}

#nav-filters.yamuna-plp-filters-modal .is-selected .yamuna-plp-filter-remove {
  display: block;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-actions {
  position: absolute;
  right: 24px;
  bottom: 28px;
  left: 24px;
  z-index: 1;
  display: grid;
  gap: 18px;
  text-align: center;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply {
  display: flex;
  min-height: 40px;
  align-items: center;
  justify-content: center;
  border: 1px solid #a31460;
  border-radius: 24px;
  background: #fff;
  color: #4a1d3a;
  font-family: 'Raleway', sans-serif;
  font-size: 16px;
  font-weight: 700;
  text-decoration: none;
  text-transform: uppercase;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-clear-filters {
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 16px;
  font-weight: 500;
  text-decoration: underline;
  text-transform: uppercase;
}

@media (max-width: 1023px) {
  body.template-category .yamuna-plp-hero,
  body.template-category .yamuna-plp-body > .container,
  body.template-category .category-controls {
    width: min(100% - 32px, 680px);
  }

  body.template-category .yamuna-plp-hero {
    grid-template-columns: 1fr;
    gap: 18px;
    margin-bottom: 22px;
  }

  body.template-category .yamuna-plp-hero-image {
    height: 180px;
  }

  body.template-category .yamuna-plp-hero-description,
  body.template-category .yamuna-plp-hero-description * {
    font-size: 16px;
  }

  body.template-category .js-product-table > .js-item-product {
    flex-basis: 50%;
    width: 50%;
    max-width: 50%;
    padding: 0 8px 16px;
  }

  body.template-category .js-product-table {
    margin-right: -8px;
    margin-left: -8px;
  }

  body.template-category .js-product-table .item-product {
    min-height: 430px;
  }

  body.template-category .js-product-table .item-image {
    width: calc(100% - 24px);
    height: 190px;
    margin: 12px 12px 0;
  }

  body.template-category .js-product-table .item-description {
    padding: 8px 16px 0 !important;
  }

  body.template-category .js-product-table .item-name { font-size: 16px; }
  body.template-category .js-product-table .item-price { font-size: 20px; }
  body.template-category .js-product-table .item-installments { display: none; }
  body.template-category .yamuna-plp-item-actions { padding: 14px 16px 16px; }
  body.template-category .yamuna-plp-buy-one,
  body.template-category .yamuna-plp-buy-three { min-height: 36px; font-size: 11px; }
  body.template-category .yamuna-plp-buy-three { font-size: 9px; }
}

{# Remaining PLP states: the inline filter selection frame and the two modal variants. #}
@media (min-width: 1024px) {
  body.template-category .yamuna-plp-hero {
    margin-top: 94px;
  }

  body.template-search .category-controls {
    margin-top: 108px;
  }
}

body.template-category .yamuna-plp-quick-filters {
  width: min(1312px, calc(100% - 48px));
  margin: 0 auto 32px;
}

body.template-category .yamuna-plp-quick-filters-heading {
  display: flex;
  min-height: 28px;
  margin-bottom: 8px;
  align-items: center;
  gap: 6px;
  color: #4a1d3a;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 600;
  line-height: 1.2;
  text-transform: uppercase;
}

body.template-category .yamuna-plp-quick-filters-heading .icon-inline {
  width: 18px;
  height: 18px;
  fill: #a31460;
}

body.template-category .yamuna-plp-quick-filters-list {
  display: flex;
  min-height: 88px;
  padding: 24px 78px;
  align-items: center;
  justify-content: center;
  gap: 28px 32px;
  flex-wrap: wrap;
  border-radius: 16px;
  background: #fff;
}

body.template-category .yamuna-plp-quick-filter {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  color: #238482;
  cursor: pointer;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  font-weight: 600;
  line-height: 1.3;
  white-space: nowrap;
}

body.template-category .yamuna-plp-quick-filter input {
  position: absolute;
  opacity: 0;
  pointer-events: none;
}

body.template-category .yamuna-plp-quick-filter-icon,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  background: transparent !important;
}

body.template-category .yamuna-plp-quick-filter-icon {
  width: 40px;
  height: 40px;
  flex: 0 0 40px;
  border: 2px solid #c8e4e3;
  border-radius: 50%;
}

body.template-category .yamuna-plp-quick-filter-icon img,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon img {
  display: block;
  width: 100%;
  height: 100%;
}

body.template-category .yamuna-plp-quick-filter-icon:not(:has(img))::after {
  width: 16px;
  height: 16px;
  border: 2px solid #238482;
  border-radius: 50%;
  content: '';
}

body.template-category .yamuna-plp-quick-filter.is-selected {
  margin: -8px -12px;
  padding: 8px 12px;
  border-radius: 28px;
  background: #e5f3f2;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon:has(img)::after {
  display: none;
}

@media (max-width: 1023px) {
  body.template-category .yamuna-plp-quick-filters {
    display: none;
  }

  body.template-search .category-controls {
    width: min(100% - 32px, 680px);
    margin-top: 86px;
  }

  body.template-search .js-product-table > .js-item-product {
    flex-basis: 50%;
    width: 50%;
    max-width: 50%;
    padding: 0 8px 16px;
  }

  body.template-search .js-product-table {
    margin-right: -8px;
    margin-left: -8px;
  }

  body.template-search .js-product-table .item-product { min-height: 430px; }
  body.template-search .js-product-table .item-image { width: calc(100% - 24px); height: 190px; margin: 12px 12px 0; }
  body.template-search .js-product-table .item-description { padding: 8px 16px 0 !important; }
  body.template-search .js-product-table .item-name { font-size: 16px; }
  body.template-search .js-product-table .item-price { font-size: 20px; }
  body.template-search .js-product-table .item-installments { display: none; }
  body.template-search .yamuna-plp-item-actions { padding: 14px 16px 16px; }
  body.template-search .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-buy-three { min-height: 36px; font-size: 11px; }
  body.template-search .yamuna-plp-buy-three { font-size: 9px; }
}

{# PLP desktop masthead: external logo at rest, compact logo in the capsule on scroll. #}
@media (min-width: 1024px) {
  body.template-category .head-main,
  body.template-search .head-main {
    padding-top: 20px !important;
    background: transparent !important;
  }

  body.template-category .head-main.head-fix,
  body.template-search .head-main.head-fix {
    position: sticky !important;
    top: 0;
    z-index: 30001;
  }

  body.template-category > .mt-4,
  body.template-search > .mt-4 {
    margin-top: 0 !important;
  }

  body.template-category .head-main .yamuna-header-desktop,
  body.template-search .head-main .yamuna-header-desktop {
    width: calc(100% - 128px) !important;
    max-width: 1312px !important;
    height: 80px !important;
    overflow: visible !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: transparent !important;
    box-shadow: none !important;
    transition: width .42s cubic-bezier(.22, .61, .36, 1), max-width .42s cubic-bezier(.22, .61, .36, 1) !important;
  }

  body.template-category .head-main .yamuna-header-desktop::before,
  body.template-search .head-main .yamuna-header-desktop::before {
    left: 134px !important;
    z-index: 0 !important;
    transition: left .42s cubic-bezier(.22, .61, .36, 1) !important;
  }

  body.template-category .head-main .yamuna-header-desktop-nav,
  body.template-category .head-main .yamuna-header-desktop-search,
  body.template-category .head-main .yamuna-header-desktop-utilities,
  body.template-search .head-main .yamuna-header-desktop-nav,
  body.template-search .head-main .yamuna-header-desktop-search,
  body.template-search .head-main .yamuna-header-desktop-utilities {
    position: relative !important;
    z-index: 1 !important;
  }

  body.template-category .head-main .yamuna-header-desktop-logo,
  body.template-search .head-main .yamuna-header-desktop-logo {
    position: absolute !important;
    top: 0;
    left: 0;
    display: flex !important;
    width: 174px !important;
    height: 80px !important;
    padding: 0 !important;
    z-index: 2 !important;
    align-items: center;
    transition: top .42s cubic-bezier(.22, .61, .36, 1), left .42s cubic-bezier(.22, .61, .36, 1), width .42s cubic-bezier(.22, .61, .36, 1), padding .42s cubic-bezier(.22, .61, .36, 1) !important;
  }

  body.template-category .head-main .yamuna-header-logo-link,
  body.template-search .head-main .yamuna-header-logo-link {
    width: 86px !important;
    height: 80px !important;
  }

  body.template-category .head-main .yamuna-header-logo-image,
  body.template-search .head-main .yamuna-header-logo-image {
    width: 86px !important;
    height: 80px !important;
    object-fit: contain !important;
  }

  body.template-category .head-main .yamuna-header-logo-default,
  body.template-search .head-main .yamuna-header-logo-default {
    display: block !important;
  }

  body.template-category .head-main .yamuna-header-logo-scrolled,
  body.template-search .head-main .yamuna-header-logo-scrolled {
    display: none !important;
  }

  body.template-category .head-main .yamuna-header-desktop-nav,
  body.template-search .head-main .yamuna-header-desktop-nav {
    margin-left: 192px !important;
    transition: margin-left .42s cubic-bezier(.22, .61, .36, 1) !important;
  }

  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-desktop {
    width: calc(100% - 48px) !important;
    max-width: 1320px !important;
  }

  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-desktop::before,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-desktop::before {
    left: 0 !important;
  }

  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-desktop-logo,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-desktop-logo {
    position: absolute !important;
    top: 0;
    left: 0;
    width: 148px !important;
    height: 80px !important;
    flex: 0 0 148px !important;
    padding-left: 24px !important;
  }

  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-logo-link,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-logo-link,
  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-logo-image,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-logo-image {
    width: 86px !important;
    height: 80px !important;
  }

  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-logo-default,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-logo-default {
    display: none !important;
  }

  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-logo-scrolled,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-logo-scrolled {
    display: block !important;
  }

  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-desktop-nav {
    margin-left: 148px !important;
  }

  @media (prefers-reduced-motion: reduce) {
    body.template-category .head-main .yamuna-header-desktop,
    body.template-search .head-main .yamuna-header-desktop,
    body.template-category .head-main .yamuna-header-desktop::before,
    body.template-search .head-main .yamuna-header-desktop::before,
    body.template-category .head-main .yamuna-header-desktop-logo,
    body.template-search .head-main .yamuna-header-desktop-logo,
    body.template-category .head-main .yamuna-header-desktop-nav,
    body.template-search .head-main .yamuna-header-desktop-nav {
      transition: none !important;
    }
  }

  body.template-category .yamuna-plp-hero,
  body.template-search .yamuna-plp-hero {
    display: grid;
    grid-template-columns: minmax(0, 862px) minmax(320px, 416px);
    gap: 34px;
    width: calc(100% - 48px);
    max-width: 1312px;
    margin: 94px auto 32px;
    align-items: center;
  }

  body.template-category .yamuna-plp-hero-image,
  body.template-search .yamuna-plp-hero-image {
    height: 254px;
    overflow: hidden;
    border-radius: 12px;
    background: #fff;
  }

  body.template-category .yamuna-plp-hero-image img,
  body.template-search .yamuna-plp-hero-image img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  body.template-category .yamuna-plp-hero-content,
  body.template-search .yamuna-plp-hero-content {
    color: #4a1d3a;
  }

  body.template-category .yamuna-plp-hero-content h1,
  body.template-search .yamuna-plp-hero-content h1 {
    margin: 0 0 12px;
    color: #4a1d3a;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 700;
    line-height: normal;
    text-transform: uppercase;
  }

  body.template-category .yamuna-plp-hero-description,
  body.template-category .yamuna-plp-hero-description *,
  body.template-search .yamuna-plp-hero-description,
  body.template-search .yamuna-plp-hero-description * {
    margin: 0;
    color: #393747;
    font-family: 'Dosis', sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 1.5;
  }

  body.template-category .category-controls,
  body.template-category .category-controls .row,
  body.template-search .category-controls,
  body.template-search .category-controls .row {
    background: transparent !important;
  }

  body.template-search .category-controls {
    margin-top: 24px;
  }
}

/* Tables supplied by the product-description content tool. */
#product-description .infoToOpen table {
  width: 100%;
  margin: 1rem 0;
  border-collapse: collapse;
}

#product-description .infoToOpen td {
  padding: .5rem;
  vertical-align: top;
  border: 1px solid #d8d0d6;
}

#product-description .infoToOpen tr:first-child td {
  font-weight: 700;
}

#product-description .infoToOpen td p {
  margin: 0;
}

#product-description .yamuna-product-description-blocks {
  display: grid;
  grid-template-columns: minmax(0, 1fr);
}

#product-description .yamuna-product-description-main {
  grid-column: 1 / -1;
}

#product-description .yamuna-product-description-accordion {
  position: relative;
  display: flex;
  flex-direction: column;
  width: 100%;
  min-width: 0;
  padding: 1rem;
  background: #f0f0f0;
}

#product-description .informationDiv {
  display: flex;
  gap: .5rem;
  padding-top: .5rem;
  padding-bottom: .5rem;
  align-items: center;
  cursor: pointer;
}

#product-description .informationDiv > h3 {
  width: auto;
  margin: 0 .5rem 0 0;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 1rem;
  font-weight: 600;
  line-height: normal;
  text-transform: uppercase;
}

@media (min-width: 768px) {
  #product-description .yamuna-product-description-blocks {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }

  #product-description .informationDiv > h3 {
    font-size: 1.125rem;
  }
}

{# PDP desktop composition ? derived from Figma node 798:5606. #}
@media (min-width: 1024px) {
  body.template-product #single-product > .container {
    max-width: 1312px;
  }

  body.template-product .section-single-product {
    display: grid;
    grid-template-columns: minmax(0, 672px) minmax(0, 528px);
    gap: 112px;
    margin-top: 54px;
    align-items: start;
  }

  body.template-product .section-single-product > .col-12.col-md-8,
  body.template-product .section-single-product > .col {
    width: auto;
    max-width: none;
    padding: 0;
  }

  .yamuna-product-gallery-desktop {
    display: grid;
    gap: 20px;
  }

  .yamuna-product-gallery-item {
    display: block;
    height: 672px;
    overflow: hidden;
    border-radius: 24px;
    background: #f0f0f0;
  }

  .yamuna-product-gallery-item img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  body.template-product .page-header {
    margin: 0 0 16px;
  }

  body.template-product .page-header .h2 {
    margin: 0;
    color: #4a1d3a;
    font-family: 'Dosis', sans-serif;
    font-size: 36px;
    font-weight: 700;
    line-height: 1.05;
  }

  body.template-product #product-description {
    display: block !important;
    margin-top: 48px !important;
  }

  body.template-product #product-description .yamuna-product-description-main {
    margin: 0;
    padding-top: 20px;
    border-top: 2px solid #a31460;
  }

  body.template-product #product-description .yamuna-product-description-main h3:first-child {
    margin: 0 0 16px;
    color: #4a1d3a;
    font-family: 'Dosis', sans-serif;
    font-size: 19px;
    font-weight: 700;
    line-height: 1.2;
    text-transform: uppercase;
  }

  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .yamuna-product-description-main p,
  body.template-product #product-description .yamuna-product-description-main li {
    color: #393747;
    font-family: 'Dosis', sans-serif;
    font-size: 16px;
    line-height: 1.5;
  }

  body.template-product #product-description-accordions {
    margin-top: 64px;
    padding: 32px 0 40px;
    background: #f0f0f0;
  }

  body.template-product #product-description-accordions .yamuna-product-description-blocks {
    grid-template-columns: repeat(2, minmax(0, 1fr));
    column-gap: 192px;
    row-gap: 0;
  }

  body.template-product #product-description-accordions .yamuna-product-description-accordion {
    min-height: 68px;
    padding: 0;
    background: transparent;
    border-top: 1px solid #d8a0be;
  }

  body.template-product #product-description-accordions .yamuna-product-description-accordion:last-child {
    border-bottom: 1px solid #d8a0be;
  }

  body.template-product #product-description-accordions .informationDiv {
    min-height: 68px;
    padding: 16px 0;
  }

  body.template-product #product-description-accordions .informationDiv > h3 {
    margin-right: 0;
    color: #393747;
    font-size: 24px;
    font-weight: 600;
    line-height: 1.5;
  }

  body.template-product #product-description-accordions .informationDiv img {
    width: 16px;
    height: 16px;
    transform: none;
    transition: transform .2s ease;
  }

  body.template-product #product-description-accordions .informationDiv.is-open img {
    transform: scaleY(-1);
  }

  body.template-product #product-description-accordions .infoToOpen {
    padding: 0 0 24px 40px;
    margin: 0;
    color: #393747;
  }
}

@media (max-width: 1023px) {
  .yamuna-product-gallery-desktop {
    display: none;
  }

  body.template-product #product-description-accordions {
    margin-top: 32px;
    padding: 16px;
    background: #f0f0f0;
  }
}

{# Final source-order overrides for the Figma PDP. #}
@media (min-width: 1024px) {
  body.template-product .section-single-product { margin: 0 !important; }

  body.template-product #product-description .yamuna-product-description-main h3:first-child::before {
    content: none !important;
    display: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .yamuna-product-description-main p,
  body.template-product #product-description .yamuna-product-description-main li,
  body.template-product #product-description .yamuna-product-description-main strong,
  body.template-product #product-description .yamuna-product-description-main em {
    overflow-wrap: anywhere;
    white-space: normal;
  }
}

{# Final PLP filter drawer overrides ??? Figma node 3428:38466. #}
body.template-category .yamuna-plp-filter-trigger,
body.template-search .yamuna-plp-filter-trigger {
  width: 132px;
  min-width: 132px;
  height: 42px;
  padding: 0 16px;
  gap: 10px;
  border-color: #ae1761;
  color: #4b1b3a;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 600;
}

body.template-category .yamuna-plp-filter-trigger .yamuna-plp-filter-trigger-icon,
body.template-search .yamuna-plp-filter-trigger .yamuna-plp-filter-trigger-icon {
  display: block;
  width: 18px;
  height: 18px;
  flex: 0 0 18px;
}

#nav-filters.yamuna-plp-filters-modal {
  width: 360px !important;
  max-width: calc(100vw - 24px);
  background: #fff !important;
}

#nav-filters.yamuna-plp-filters-modal .modal-header {
  min-height: 72px;
  padding: 26px 64px 18px 24px;
  border: 0;
  background: #fff !important;
  color: #4b1b3a !important;
  font-family: 'Dosis', sans-serif;
  font-size: 18px;
  font-weight: 700;
}

#nav-filters.yamuna-plp-filters-modal .modal-close {
  top: 24px;
  right: 24px;
  width: 20px;
  height: 20px;
  background: #f1edf1 !important;
}

#nav-filters.yamuna-plp-filters-modal .modal-close-icon {
  width: 10px;
  height: 10px;
  fill: #4b1b3a !important;
}

#nav-filters.yamuna-plp-filters-modal .modal-body {
  padding: 0 24px 132px;
  background: #fff;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-list {
  gap: 4px;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option-content {
  min-height: 60px;
  padding: 10px 0;
  gap: 12px;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option.is-selected .yamuna-plp-filter-option-content {
  padding-right: 12px;
  padding-left: 12px;
  background: #e5f3f2 !important;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon {
  width: 40px;
  height: 40px;
  flex-basis: 40px;
  border-color: #c8e4e3;
}

#nav-filters.yamuna-plp-filters-modal .checkbox-text {
  color: #238482;
  font-family: 'Dosis', sans-serif;
  font-size: 14px;
  font-weight: 600;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-actions {
  right: 24px;
  bottom: 28px;
  left: 24px;
  gap: 16px;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply {
  min-height: 36px;
  border-color: #ae1761;
  color: #4b1b3a;
  font-family: 'Dosis', sans-serif;
  font-size: 16px;
  font-weight: 700;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-clear-filters {
  display: block;
  color: #4b1b3a;
  font-family: 'Dosis', sans-serif;
  font-size: 15px;
  font-weight: 500;
}

.modal-overlay[data-modal-id="#nav-filters"] {
  background: rgba(31, 24, 30, .52) !important;
}

{# Keep every desktop PLP section on the same content axis as the header and hero. #}
@media (min-width: 1024px) {
  body.template-category .yamuna-plp-hero,
  body.template-category .category-controls,
  body.template-category .yamuna-plp-body > .container,
  body.template-search .yamuna-plp-hero,
  body.template-search .category-controls,
  body.template-search .yamuna-plp-body > .container {
    width: min(1312px, calc(100% - 128px));
    max-width: 1312px;
  }

  body.template-category .category-controls .row > .col-auto,
  body.template-search .category-controls .row > .col-auto {
    padding-left: 0;
  }

  body.template-category .category-controls .yamuna-plp-sort,
  body.template-search .category-controls .yamuna-plp-sort {
    padding-right: 0;
  }

  body.template-category .yamuna-plp-body > .container > .row,
  body.template-search .yamuna-plp-body > .container > .row {
    margin-right: 0;
    margin-left: 0;
  }

  body.template-category .yamuna-plp-body .js-product-table,
  body.template-search .yamuna-plp-body .js-product-table {
    width: 100%;
    margin-right: 0;
    margin-left: 0;
    gap: 32px;
  }

  body.template-category .yamuna-plp-body .js-product-table > .js-item-product,
  body.template-search .yamuna-plp-body .js-product-table > .js-item-product {
    display: flex;
    flex: 0 0 calc((100% - 64px) / 3);
    width: calc((100% - 64px) / 3);
    max-width: calc((100% - 64px) / 3);
    min-height: 580px;
    padding: 0;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-product,
  body.template-search .yamuna-plp-body .js-product-table .item-product {
    min-height: 580px;
    border: 0;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-description,
  body.template-category .yamuna-plp-body .js-product-table .yamuna-plp-item-actions,
  body.template-search .yamuna-plp-body .js-product-table .item-description,
  body.template-search .yamuna-plp-body .js-product-table .yamuna-plp-item-actions {
    border-top: 0 !important;
    border-bottom: 0 !important;
  }
}

{# PLP ordering control: preserve the native sort behavior while matching the compact Figma control. #}
body.template-category .yamuna-plp-sort,
body.template-search .yamuna-plp-sort {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  min-height: 39px;
  color: #4a1d3a;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  line-height: 16px;
}

body.template-category .yamuna-plp-sort-label,
body.template-search .yamuna-plp-sort-label {
  margin-right: 8px;
  font-weight: 600;
  white-space: nowrap;
}

{# Desktop hero content card. #}
.yamuna-home-hero-copy-mobile {
  display: none;
}

@media (min-width: 768px) {
  body.template-home .js-home-main-slider-container .slide-container .slider-slide {
    position: relative !important;
  }

  body.template-home .yamuna-home-hero-overlay {
    position: absolute;
    bottom: 61px;
    left: 0;
    z-index: 4;
    display: flex;
    width: 439px;
    height: 248px;
    padding: 36px 0 0 84px;
    flex-direction: column;
    justify-content: flex-start;
    color: #4a1d3a;
    background: #fff;
    border-radius: 0 40px 40px 0;
  }

  body.template-home .yamuna-home-hero-overlay-title {
    margin: 0 0 10px;
    color: #a31460;
    font-family: 'Dosis', sans-serif;
    font-size: 28px;
    font-weight: 700;
    line-height: 1.1;
  }

  body.template-home .yamuna-home-hero-overlay-description {
    margin: 0 0 18px;
    font-family: 'Dosis', sans-serif;
    font-size: 20px;
    font-weight: 500;
    line-height: 1.4;
  }

  body.template-home .yamuna-home-hero-overlay-button {
    display: inline-flex;
    width: max-content;
    width: 235px;
    min-width: 235px;
    min-height: 52px;
    padding: 0;
    align-items: center;
    justify-content: center;
    color: #fff;
    border-radius: 999px;
    background: #238482;
    font-family: 'Roboto', sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: normal;
    text-decoration: none;
    text-transform: uppercase;
  }

  body.template-home a .yamuna-home-hero-overlay-button {
    pointer-events: none;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-prev,
  body.template-home .js-home-main-slider-container .js-swiper-home-next {
    top: 50%;
    z-index: 6;
    display: flex !important;
    width: 24px;
    height: 24px;
    margin-top: -12px;
    padding: 0 !important;
    align-items: center;
    justify-content: center;
    border: 0 !important;
    background-color: transparent !important;
    background-image: none !important;
    box-shadow: none !important;
    line-height: 0;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-prev {
    left: 16px;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-next {
    right: 16px;
  }

  body.template-home .yamuna-home-hero-arrow-icon {
    display: block;
    width: 24px;
    height: 24px;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-prev .yamuna-home-hero-arrow-icon {
    transform: scaleX(-1);
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-pagination {
    bottom: 8px;
    z-index: 6;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-pagination .swiper-pagination-bullet {
    width: 8px;
    height: 8px;
    margin: 0 4px;
    border: 0 !important;
    background-color: #fff !important;
    background-image: none !important;
    box-shadow: none !important;
    opacity: .7 !important;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-pagination .swiper-pagination-bullet-active {
    background-color: #fff !important;
    opacity: 1 !important;
  }
}

{# Mobile hero content card ??? Figma node 156:3359. #}
@media (max-width: 767px) {
  body.template-home .js-home-slider-mobile .slide-container .slider-slide {
    position: relative !important;
  }

  body.template-home .js-home-slider-mobile .yamuna-home-hero-overlay {
    position: absolute;
    right: 16.5625%;
    bottom: 53px;
    left: 0;
    z-index: 4;
    display: block;
    width: auto;
    min-width: 0;
    height: 137px;
    min-height: 0;
    padding: 0;
    color: #4a1d3a;
    border-radius: 0 63.5px 63.5px 0;
    background: #fff;
  }

  body.template-home .yamuna-home-hero-overlay-title {
    position: absolute;
    top: 18px;
    left: 8.125vw;
    width: 58.4375vw;
    margin: 0;
    color: #a31460;
    font-family: 'Roboto', sans-serif;
    font-size: 20px;
    font-weight: 800;
    line-height: normal;
    text-align: center;
    white-space: nowrap;
  }

  body.template-home .yamuna-home-hero-overlay-description {
    position: absolute;
    top: 45px;
    left: 7.8125vw;
    width: 63.4375vw;
    margin: 0;
    color: #4a1d3a;
    font-family: 'Dosis', sans-serif;
    font-size: 16px;
    font-weight: 500;
    line-height: normal;
    opacity: .8;
  }

  body.template-home .yamuna-home-hero-copy-desktop {
    display: none;
  }

  body.template-home .yamuna-home-hero-copy-mobile {
    display: inline;
  }

  body.template-home .yamuna-home-hero-overlay-button {
    position: absolute;
    top: 91px;
    left: 7.8125vw;
    display: inline-flex;
    width: max-content;
    min-width: 0;
    min-height: 0;
    padding: 6px 12px;
    align-items: center;
    justify-content: center;
    color: #fff;
    border-radius: 23px;
    background: #238482;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: normal;
    text-decoration: none;
    text-transform: uppercase;
  }

  body.template-home .js-home-slider-mobile .js-swiper-home-pagination {
    bottom: 16px;
    z-index: 6;
  }

  body.template-home .js-home-slider-mobile .js-swiper-home-pagination .swiper-pagination-bullet {
    width: 8px;
    height: 8px;
    margin: 0 4px;
    border: 0 !important;
    background-color: #fff !important;
    background-image: none !important;
    box-shadow: none !important;
    opacity: .7 !important;
  }

  body.template-home .js-home-slider-mobile .js-swiper-home-pagination .swiper-pagination-bullet-active {
    background-color: #fff !important;
    opacity: 1 !important;
  }
}

body.template-category .yamuna-plp-sort .form-group,
body.template-search .yamuna-plp-sort .form-group {
  position: relative;
  display: inline-flex;
  width: auto;
  margin: 0;
  align-items: center;
}

body.template-category .yamuna-plp-sort .form-group::after,
body.template-search .yamuna-plp-sort .form-group::after {
  position: absolute;
  top: 50%;
  right: 0;
  width: 0;
  height: 0;
  border-top: 6px solid #4a1d3a;
  border-right: 4px solid transparent;
  border-left: 4px solid transparent;
  content: '';
  pointer-events: none;
  transform: translateY(-35%);
}

body.template-category .yamuna-plp-sort .form-select,
body.template-category .yamuna-plp-sort select,
body.template-search .yamuna-plp-sort .form-select,
body.template-search .yamuna-plp-sort select {
  width: auto;
  min-width: 0;
  height: 16px;
  padding: 0 16px 0 0;
  border: 0;
  border-radius: 0;
  appearance: none;
  background: transparent;
  color: #a31460;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300 !important;
  line-height: 16px;
  text-align-last: left;
}

body.template-category .yamuna-plp-sort .form-select:focus,
body.template-category .yamuna-plp-sort select:focus,
body.template-search .yamuna-plp-sort .form-select:focus,
body.template-search .yamuna-plp-sort select:focus {
  outline: 0;
  box-shadow: none;
}

body.template-category .yamuna-plp-sort .form-select-icon,
body.template-search .yamuna-plp-sort .form-select-icon {
  display: none;
}

.yamuna-plp-filter-label-mobile {
  display: none;
}

{# PLP mobile / tablet ? preserve the mobile composition up to the desktop breakpoint. #}
@media (max-width: 1023px) {
  body.template-category .yamuna-plp-hero,
  body.template-category .category-controls,
  body.template-category .yamuna-plp-body > .container,
  body.template-search .yamuna-plp-hero,
  body.template-search .category-controls,
  body.template-search .yamuna-plp-body > .container {
    width: calc(100% - 24px);
    max-width: none;
  }

  body.template-category .yamuna-plp-hero,
  body.template-search .yamuna-plp-hero {
    display: block;
    margin: 0 auto 20px;
  }

  body.template-category .yamuna-plp-hero-image,
  body.template-search .yamuna-plp-hero-image {
    height: 77px;
    border-radius: 12px;
  }

  body.template-category .yamuna-plp-hero-content,
  body.template-search .yamuna-plp-hero-content {
    padding-top: 20px;
  }

  body.template-category .yamuna-plp-hero-content h1,
  body.template-search .yamuna-plp-hero-content h1 {
    margin: 0 0 8px;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    line-height: 16px;
  }

  body.template-category .yamuna-plp-hero-description,
  body.template-category .yamuna-plp-hero-description *,
  body.template-search .yamuna-plp-hero-description,
  body.template-search .yamuna-plp-hero-description * {
    font-family: 'Dosis', sans-serif;
    font-size: 16px;
    line-height: 24px;
  }

  body.template-category .category-controls,
  body.template-search .category-controls {
    margin: 0 auto 20px;
  }

  body.template-category .category-controls .row,
  body.template-search .category-controls .row {
    display: flex;
    min-height: 30px;
    margin: 0;
    align-items: center;
    justify-content: space-between;
  }

  body.template-category .category-controls .row > .col-auto,
  body.template-search .category-controls .row > .col-auto,
  body.template-category .category-controls .yamuna-plp-sort,
  body.template-search .category-controls .yamuna-plp-sort {
    width: auto;
    margin: 0;
    padding: 0;
    flex: 0 0 auto;
  }

  body.template-category .yamuna-plp-filter-trigger,
  body.template-search .yamuna-plp-filter-trigger {
    width: 103px;
    min-width: 103px;
    height: 30px;
    padding: 0 14px;
    gap: 6px;
    font-size: 16px;
  }

  .yamuna-plp-filter-label-desktop {
    display: none;
  }

  .yamuna-plp-filter-label-mobile {
    display: inline;
  }

  body.template-category .yamuna-plp-filter-trigger .yamuna-plp-filter-trigger-icon,
  body.template-search .yamuna-plp-filter-trigger .yamuna-plp-filter-trigger-icon {
    width: 14px;
    height: 14px;
    flex-basis: 14px;
  }

  body.template-category .yamuna-plp-sort,
  body.template-search .yamuna-plp-sort {
    min-height: 30px;
    font-size: 14px;
  }

  body.template-category .yamuna-plp-sort-label,
  body.template-search .yamuna-plp-sort-label {
    margin: 0;
  }

  body.template-category .yamuna-plp-sort .form-group,
  body.template-search .yamuna-plp-sort .form-group {
    width: 10px;
    height: 30px;
    margin-left: 8px;
  }

  body.template-category .yamuna-plp-sort .form-select,
  body.template-category .yamuna-plp-sort select,
  body.template-search .yamuna-plp-sort .form-select,
  body.template-search .yamuna-plp-sort select {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    padding: 0;
    opacity: 0;
    cursor: pointer;
  }

  body.template-category .yamuna-plp-sort .form-group::after,
  body.template-search .yamuna-plp-sort .form-group::after {
    right: 0;
  }

  body.template-category .yamuna-plp-body > .container > .row,
  body.template-search .yamuna-plp-body > .container > .row,
  body.template-category .yamuna-plp-body .js-product-table,
  body.template-search .yamuna-plp-body .js-product-table {
    display: grid;
    width: 100%;
    margin: 0;
    grid-template-columns: 1fr;
    gap: 32px;
  }

  body.template-category .yamuna-plp-body .js-product-table > .js-item-product,
  body.template-search .yamuna-plp-body .js-product-table > .js-item-product {
    display: flex;
    width: 100%;
    max-width: 100%;
    min-height: 456px;
    padding: 0;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-product,
  body.template-search .yamuna-plp-body .js-product-table .item-product {
    min-height: 456px;
    height: 456px;
    border-radius: 12px;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-image,
  body.template-search .yamuna-plp-body .js-product-table .item-image {
    width: calc(100% - 40px);
    height: 256px;
    max-height: 256px;
    margin: 17px 20px 0;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-description,
  body.template-search .yamuna-plp-body .js-product-table .item-description {
    padding: 0 20px !important;
    border-bottom: 0 !important;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-name,
  body.template-search .yamuna-plp-body .js-product-table .item-name {
    margin: 0 0 4px !important;
    font-size: 18px;
    line-height: 23px;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-price,
  body.template-search .yamuna-plp-body .js-product-table .item-price {
    font-size: 24px;
    line-height: 30px;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-installments,
  body.template-search .yamuna-plp-body .js-product-table .item-installments {
    margin: 0;
    font-size: 14px;
    line-height: 18px;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-item-actions,
  body.template-search .yamuna-plp-body .yamuna-plp-item-actions {
    padding: 12px 20px 22px;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-item-actions form,
  body.template-search .yamuna-plp-body .yamuna-plp-item-actions form {
    gap: 6px;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
    min-height: 28px;
    font-size: 14px;
  }
}

{# PLP mobile fine tuning ? Figma node 784:8733 (320px). #}
@media (max-width: 1023px) {
  body.template-category .yamuna-plp-hero,
  body.template-search .yamuna-plp-hero {
    margin-bottom: 20px;
  }

  body.template-category .yamuna-plp-hero-image,
  body.template-search .yamuna-plp-hero-image {
    height: 77px;
    min-height: 77px;
    max-height: 77px;
    overflow: hidden !important;
    position: relative;
  }

  body.template-category .yamuna-plp-hero-image img,
  body.template-search .yamuna-plp-hero-image img {
    display: block;
    width: 100%;
    height: 77px !important;
    min-height: 77px;
    max-height: 77px;
    object-fit: cover;
  }

  body.template-category .yamuna-plp-hero-content,
  body.template-search .yamuna-plp-hero-content {
    position: static !important;
    inset: auto !important;
    z-index: auto !important;
    display: block;
    width: auto;
    height: auto;
    min-height: 0;
    padding-top: 20px;
    transform: none !important;
  }

  body.template-category .yamuna-plp-hero-content h1,
  body.template-search .yamuna-plp-hero-content h1 {
    margin: 0 0 8px;
    color: #4a1d3a;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: 16px;
    text-transform: uppercase;
  }

  body.template-category .yamuna-plp-hero-description,
  body.template-category .yamuna-plp-hero-description *,
  body.template-search .yamuna-plp-hero-description,
  body.template-search .yamuna-plp-hero-description * {
    margin: 0;
    color: #393747;
    font-family: 'Dosis', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 18px;
  }

  body.template-category .category-controls,
  body.template-category .category-controls .row,
  body.template-search .category-controls,
  body.template-search .category-controls .row {
    background: transparent !important;
  }

  body.template-category .yamuna-plp-filter-trigger,
  body.template-search .yamuna-plp-filter-trigger {
    display: inline-flex;
    width: 103px;
    min-width: 103px;
    height: 30px;
    padding: 0;
    gap: 6px;
    border: 1px solid #a31460;
    border-radius: 30px;
    color: #4a1d3a;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 16px;
  }

  body.template-category .yamuna-plp-sort,
  body.template-search .yamuna-plp-sort,
  body.template-category .yamuna-plp-sort-label,
  body.template-search .yamuna-plp-sort-label {
    color: #4a1d3a;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 16px;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
    box-sizing: border-box;
    min-height: 28px;
    height: 28px;
    padding: 6px 12px;
    gap: 8px;
    flex-wrap: nowrap;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 16px;
    white-space: nowrap;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
    border-color: #238482;
    background: #fff;
    color: #238482;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three img,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three img {
    width: 14px;
    min-width: 14px;
    height: 14px;
    margin-right: 0;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-prefix,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-prefix {
    margin-left: 0;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 500;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-price,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-price {
    margin-left: 0;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 600;
  }
}

body.template-category .yamuna-plp-sort-options,
body.template-search .yamuna-plp-sort-options {
  display: none;
}

{# Mobile PLP: right-aligned transparent sorting trigger; the native menu opens below it. #}
@media (max-width: 1023px) {
  body.template-category .yamuna-plp-sort,
  body.template-search .yamuna-plp-sort {
    display: flex;
    width: 130px;
    min-height: 30px;
    flex: 0 0 auto;
    align-items: center;
    justify-content: flex-end;
    position: relative;
  }

  body.template-category .yamuna-plp-sort-label,
  body.template-search .yamuna-plp-sort-label {
    display: block;
    width: 100%;
    height: 30px;
    margin: 0;
    padding: 0 20px 0 0;
    border: 0;
    border-radius: 0;
    background: transparent;
    overflow: hidden;
    color: #a31460;
    font-family: 'Roboto', sans-serif;
    font-size: 13px;
    font-weight: 500;
    line-height: 30px;
    text-align: right;
    text-overflow: ellipsis;
    white-space: nowrap;
    cursor: pointer;
  }

  body.template-category .yamuna-plp-sort .form-group,
  body.template-search .yamuna-plp-sort .form-group {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 30px;
    margin: 0;
    pointer-events: none;
  }

  body.template-category .yamuna-plp-sort .form-select,
  body.template-category .yamuna-plp-sort select,
  body.template-search .yamuna-plp-sort .form-select,
  body.template-search .yamuna-plp-sort select {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 30px;
    padding: 0;
    border: 0;
    border-radius: 0;
    opacity: 0;
    appearance: none;
    cursor: pointer;
  }

  body.template-category .yamuna-plp-sort .form-group::after,
  body.template-search .yamuna-plp-sort .form-group::after {
    right: 3px;
  }

  body.template-category .yamuna-plp-sort-options,
  body.template-search .yamuna-plp-sort-options {
    position: absolute;
    top: calc(100% + 4px);
    right: 0;
    z-index: 30;
    display: none;
    width: max-content;
    min-width: 160px;
    max-width: calc(100vw - 24px);
    margin: 0;
    padding: 4px 0;
    border: 1px solid #d7c9d1;
    background: #fff;
    box-shadow: 0 6px 14px rgba(74, 29, 58, .16);
    list-style: none;
  }

  body.template-category .yamuna-plp-sort.is-open .yamuna-plp-sort-options,
  body.template-search .yamuna-plp-sort.is-open .yamuna-plp-sort-options {
    display: block;
  }

  body.template-category .yamuna-plp-sort-option,
  body.template-search .yamuna-plp-sort-option {
    display: block;
    width: 100%;
    padding: 7px 12px;
    border: 0;
    background: transparent;
    color: #a31460;
    font-family: 'Roboto', sans-serif;
    font-size: 13px;
    font-weight: 500;
    line-height: 16px;
    text-align: left;
    white-space: nowrap;
  }

  body.template-category .yamuna-plp-sort-option:focus,
  body.template-category .yamuna-plp-sort-option:hover,
  body.template-search .yamuna-plp-sort-option:focus,
  body.template-search .yamuna-plp-sort-option:hover {
    background: #f7edf3;
    outline: 0;
  }
}

{# Product artwork is transparent in several catalogue images. Keep its canvas white
   instead of exposing the lazy-load placeholder colour at intermediate widths. #}
body.template-category .yamuna-plp-body .item-image,
body.template-category .yamuna-plp-body .item-image::before,
body.template-category .yamuna-plp-body .item-image a,
body.template-category .yamuna-plp-body .item-image img,
body.template-search .yamuna-plp-body .item-image,
body.template-search .yamuna-plp-body .item-image::before,
body.template-search .yamuna-plp-body .item-image a,
body.template-search .yamuna-plp-body .item-image img {
  background-color: #fff !important;
}

{# Three-column cards become narrow around the tablet/desktop breakpoint. #}
@media (min-width: 1024px) and (max-width: 1100px) {
  body.template-category .yamuna-plp-body .js-product-table .item-name,
  body.template-search .yamuna-plp-body .js-product-table .item-name {
    font-size: 16px;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-one *,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three *,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-one *,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three * {
    font-size: 10px !important;
    line-height: 12px;
    white-space: nowrap;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
    padding-right: 8px;
    padding-left: 8px;
    gap: 4px;
  }
}

{# Shared Figma navigation for the home and PDP.  This final, scoped cascade
   deliberately supersedes the legacy header rules above. #}
@media (min-width: 1024px) {
  body.template-home .head-main,
  body.template-home .head-main.head-fix,
  body.template-product .head-main,
  body.template-product .head-main.head-fix {
    position: fixed !important;
    top: 0 !important;
    right: 0;
    left: 0 !important;
    z-index: 30001 !important;
    width: 100%;
    padding: 25px 0 0 !important;
    background: transparent !important;
    transition: padding .34s cubic-bezier(.22,.61,.36,1);
  }

  body.template-home .head-main .yamuna-header-desktop,
  body.template-product .head-main .yamuna-header-desktop {
    position: relative !important;
    display: flex !important;
    width: min(1312px, calc(100% - 128px)) !important;
    height: 59px !important;
    min-height: 59px !important;
    margin: 0 auto !important;
    padding: 0 !important;
    align-items: center !important;
    background: transparent !important;
    box-shadow: none !important;
    transition: width .34s cubic-bezier(.22,.61,.36,1);
  }

  body.template-home .head-main .yamuna-header-desktop::before,
  body.template-product .head-main .yamuna-header-desktop::before {
    z-index: -1 !important;
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: 224px !important;
    display: block !important;
    border-radius: 54px !important;
    background: #a31460 !important;
    box-shadow: 4px 4px 4px -2px rgba(0, 0, 0, .25) !important;
    transition: left .34s cubic-bezier(.22,.61,.36,1);
  }

  body.template-home .head-main .yamuna-header-desktop-logo,
  body.template-product .head-main .yamuna-header-desktop-logo {
    position: relative !important;
    z-index: 1 !important;
    display: flex !important;
    width: 174px !important;
    height: 59px !important;
    padding: 0 !important;
    flex: 0 0 174px !important;
    align-items: center !important;
    overflow: visible !important;
    transition: width .34s cubic-bezier(.22,.61,.36,1), flex-basis .34s cubic-bezier(.22,.61,.36,1), padding .34s cubic-bezier(.22,.61,.36,1);
  }

  body.template-home .head-main .yamuna-header-logo-link,
  body.template-product .head-main .yamuna-header-logo-link {
    position: relative !important;
    display: block !important;
    width: 174px !important;
    height: 59px !important;
    overflow: visible;
    transition: width .34s cubic-bezier(.22,.61,.36,1);
  }

  body.template-home .head-main .yamuna-header-logo-image,
  body.template-product .head-main .yamuna-header-logo-image {
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    display: block !important;
    width: 174px !important;
    height: 59px !important;
    max-width: none !important;
    object-fit: contain !important;
    transition: width .34s cubic-bezier(.22,.61,.36,1), height .34s cubic-bezier(.22,.61,.36,1), opacity .20s ease, transform .34s cubic-bezier(.22,.61,.36,1);
  }

  body.template-home .head-main .yamuna-header-logo-default,
  body.template-product .head-main .yamuna-header-logo-default {
    opacity: 1 !important;
    transform: scale(1);
  }

  body.template-home .head-main .yamuna-header-logo-scrolled,
  body.template-product .head-main .yamuna-header-logo-scrolled {
    width: 76px !important;
    height: 42px !important;
    opacity: 0 !important;
    transform: scale(.9);
  }

  body.template-home .head-main .yamuna-header-desktop-nav,
  body.template-product .head-main .yamuna-header-desktop-nav {
    display: flex !important;
    width: auto !important;
    margin: 0 0 0 108px !important;
    gap: 24px !important;
    align-items: center !important;
    transition: margin .34s cubic-bezier(.22,.61,.36,1);
  }

  body.template-home .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-desktop-list,
  body.template-product .head-main .yamuna-header-desktop-nav .yamuna-static-nav,
  body.template-product .head-main .yamuna-header-desktop-nav .nav-desktop,
  body.template-product .head-main .yamuna-header-desktop-nav .nav-desktop-list {
    display: flex !important;
    margin: 0 !important;
    padding: 0 !important;
    gap: 24px !important;
    align-items: center !important;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-list-link,
  body.template-product .head-main .yamuna-header-desktop-nav .nav-list-link {
    color: #fff !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 500 !important;
    line-height: 59px !important;
  }

  body.template-home .head-main .yamuna-header-desktop-search,
  body.template-product .head-main .yamuna-header-desktop-search {
    width: 392px !important;
    margin: 0 8px 0 auto !important;
    flex: 0 0 392px !important;
  }

  body.template-home .head-main .yamuna-header-desktop-search .search-input,
  body.template-product .head-main .yamuna-header-desktop-search .search-input {
    height: 35px !important;
    border: 1px solid #fff !important;
    border-radius: 32px !important;
  }

  body.template-home .head-main .yamuna-header-desktop-utilities,
  body.template-product .head-main .yamuna-header-desktop-utilities {
    display: flex !important;
    width: 128px !important;
    margin: 0 32px 0 0 !important;
    gap: 16px !important;
    flex: 0 0 128px !important;
    align-items: center !important;
  }

  body.template-home .head-main .yamuna-header-action,
  body.template-product .head-main .yamuna-header-action,
  body.template-home .head-main .yamuna-header-action img,
  body.template-product .head-main .yamuna-header-action img {
    width: 32px !important;
    height: 32px !important;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-desktop {
    width: min(1088px, calc(100% - 48px)) !important;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop::before,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-desktop::before {
    left: 0 !important;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-logo,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-desktop-logo {
    width: 112px !important;
    padding-left: 18px !important;
    flex-basis: 112px !important;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-logo-link,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-logo-link {
    width: 76px !important;
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-logo-default,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-logo-default {
    width: 76px !important;
    height: 42px !important;
    opacity: 0 !important;
    transform: scale(.9);
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-logo-scrolled,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-logo-scrolled {
    opacity: 1 !important;
    transform: scale(1);
  }

  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-desktop-nav {
    margin-left: 16px !important;
  }
}

@media (prefers-reduced-motion: reduce) {
  body.template-home .head-main *,
  body.template-product .head-main * {
    transition-duration: .01ms !important;
  }
}

{# Final PDP size lock: prevents the native Bootstrap columns from shrinking
   the Figma desktop gallery and its information panel. #}
@media (min-width: 1440px) {
  body.template-product #single-product {
    /* Figma: the image container starts 140px below the viewport top. */
    padding-top: 140px !important;
  }

  body.template-product #single-product > .container {
    width: 1312px !important;
    max-width: 1312px !important;
    padding-right: 0 !important;
    padding-left: 0 !important;
  }

  body.template-product .section-single-product {
    display: grid !important;
    grid-template-columns: 672px 528px !important;
    column-gap: 112px !important;
    width: 1312px !important;
  }

  body.template-product .yamuna-pdp-gallery-column,
  body.template-product .yamuna-product-gallery-desktop,
  body.template-product .yamuna-product-gallery-item {
    width: 672px !important;
    min-width: 672px !important;
    max-width: 672px !important;
  }

  body.template-product .yamuna-product-gallery-item {
    height: 672px !important;
  }

  body.template-product .yamuna-pdp-summary {
    width: 528px !important;
    min-width: 528px !important;
    max-width: 528px !important;
  }

}

{# Absolute final Figma header dimensions: later source order is required to
   override legacy PDP header rules. #}
@media (min-width: 1024px) {
  body.template-home .head-main .yamuna-header-logo-image,
  body.template-product .head-main .yamuna-header-logo-image,
  body.template-category .head-main .yamuna-header-logo-image,
  body.template-search .head-main .yamuna-header-logo-image,
  body[class] .head-main .yamuna-header-logo-image {
    width: 174px !important;
    height: 62px !important;
    max-width: 174px !important;
    object-fit: contain !important;
  }

  body.template-home .head-main .yamuna-header-action img,
  body.template-product .head-main .yamuna-header-action img,
  body.template-category .head-main .yamuna-header-action img,
  body.template-search .head-main .yamuna-header-action img,
  body[class] .head-main .yamuna-header-action img {
    width: 20px !important;
    height: 20px !important;
    max-width: 20px !important;
  }

  body[class] .head-main .yamuna-header-action {
    width: 32px !important;
    height: 32px !important;
    min-width: 32px !important;
    max-width: 32px !important;
  }
}

{# Requested desktop capsule height. #}
@media (min-width: 1024px) {
  body[class] .head-main .yamuna-header-desktop {
    height: 80px !important;
    min-height: 80px !important;
    align-items: center !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-list-link {
    line-height: 80px !important;
  }
}

{# Keep the brand mark constant before and after the sticky-header transition. #}
@media (min-width: 1024px) {
  body[class] .head-main .yamuna-header-logo-link {
    width: 66px !important;
    height: 50px !important;
  }

  body[class] .head-main .yamuna-header-logo-default,
  body[class] .head-main .yamuna-header-logo-scrolled {
    width: 86px !important;
    height: 80px !important;
    max-width: 86px !important;
    object-fit: contain !important;
  }
}

{# PDP breadcrumb ? Figma node 829:4111. #}
@media (min-width: 1024px) {
  body.template-product .yamuna-pdp-summary .breadcrumbs {
    display: flex !important;
    margin: 0 0 8px !important;
    align-items: center;
    color: #393747 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 18px !important;
    font-weight: 400 !important;
    line-height: 23px !important;
    white-space: nowrap;
  }

  body.template-product .yamuna-pdp-summary .breadcrumbs .crumb {
    color: #393747 !important;
    font: inherit;
    text-decoration: none;
  }

  body.template-product .yamuna-pdp-summary .breadcrumbs .divider {
    display: inline-flex;
    width: 12px;
    height: 12px;
    margin: 0 4px;
    align-items: center;
    justify-content: center;
    color: #238482;
    font-size: 0;
    line-height: 1;
  }

  body.template-product .yamuna-pdp-summary .breadcrumbs .divider::after {
    content: '\203A';
    font-family: Arial, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 12px;
  }
}

{# PDP product title and rating: Figma node 804:5651 / mobile 853:9590. #}
body.template-product .yamuna-pdp-rating {
  display: flex;
  align-items: center;
  gap: 8px;
  width: 100%;
  margin: 8px 0 0;
  min-height: 18px;
}

body.template-product .yamuna-pdp-rating-stars {
  display: inline-flex;
  align-items: center;
  gap: 0.75px;
  flex: 0 0 auto;
}

body.template-product .yamuna-pdp-rating-star {
  display: block;
  width: 18px;
  height: 18px;
  flex: 0 0 18px;
}

body.template-product .yamuna-pdp-rating-label {
  color: #9e929e;
  font-family: Roboto, Arial, sans-serif;
  font-size: 10px;
  font-weight: 400;
  line-height: 1.1;
  text-decoration: none;
  white-space: nowrap;
}

body.template-product .yamuna-pdp-rating-label:hover {
  color: #4a1d3a;
  text-decoration: underline;
}

@media (min-width: 1024px) {
  body.template-product .yamuna-pdp-summary .page-header .js-product-name {
    margin: 0 !important;
    color: #4a1d3a !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 36px !important;
    font-style: normal !important;
    font-weight: 800 !important;
    line-height: normal !important;
  }

  body.template-product .yamuna-pdp-rating {
    margin: 12px 0 0;
  }
}

{# PDP price cards: Figma nodes 847:9252, 807:5670 and 807:5656. #}
.yamuna-pdp-price-card-buy-three {
  display: none;
}

@media (min-width: 1024px) {
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards {
    display: flex;
    width: 528px;
    margin: 24px 0;
    gap: 32px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card {
    position: relative;
    box-sizing: border-box;
    width: 248px;
    min-width: 248px;
    height: 170px;
    min-height: 170px;
    margin: 0 !important;
    padding: 0;
    overflow: hidden;
    border: 0;
    border-radius: 24px;
    background: #fff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, .16);
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit {
    display: block;
    padding: 70px 12px 12px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit::before {
    height: 48px;
    border-radius: 24px 24px 18px 18px;
    background: #4a1d3a;
    color: #fff;
    font-family: Roboto, Arial, sans-serif;
    font-size: 20px;
    font-weight: 400;
    line-height: 48px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit > .d-inline-block,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .tooltip-container,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .price-discount-disclaimer,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-price-without-taxes,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-payment-discount-price,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-compare-price-saved-amount {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit > .d-inline-flex {
    display: flex !important;
    width: 100%;
    justify-content: center;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-price-display,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-buy-three-price {
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif;
    font-size: 24px !important;
    font-weight: 800;
    line-height: 28px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-meta,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-body {
    position: absolute;
    top: 101px;
    right: 12px;
    left: 12px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    color: #9e929e;
    font-family: Dosis, Arial, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 17px;
    text-align: center;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-installments {
    width: 100%;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-pix {
    color: #9e929e;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-pix > span {
    color: #393747;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three {
    display: block;
    cursor: pointer;
    border: 0;
    color: inherit;
    font: inherit;
    text-align: inherit;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three.is-selected {
    outline: 2px solid #238482;
    outline-offset: 2px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-heading {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    box-sizing: border-box;
    height: 48px;
    border: 1px solid #a31460;
    border-radius: 24px 24px 18px 18px;
    color: #a31460;
    font-family: Roboto, Arial, sans-serif;
    font-size: 20px;
    font-weight: 400;
    line-height: 46px;
    text-align: center;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount {
    position: absolute;
    z-index: 1;
    top: 36px;
    left: 9px;
    display: flex;
    width: 47px;
    height: 47px;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #fff;
    font-family: Dosis, Arial, sans-serif;
    line-height: 1;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount img {
    position: absolute;
    inset: 0;
    width: 47px;
    height: 47px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount strong,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount small {
    position: relative;
    z-index: 1;
    color: #fff;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount strong {
    font-size: 20px;
    font-weight: 800;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount small {
    margin-top: -2px;
    font-size: 16px;
    font-weight: 600;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    top: 58px;
    display: grid;
    grid-template-columns: 1fr 45px;
    align-items: end;
    padding-left: 40px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit-label {
    padding-bottom: 2px;
    color: #9e929e;
    font-family: Dosis, Arial, sans-serif;
    font-size: 8px;
    font-weight: 600;
    line-height: 9px;
    text-align: left;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    grid-column: 1 / -1;
  }

  body.template-product .yamuna-pdp-summary .js-product-payments-container {
    display: none !important;
  }
}

@media (min-width: 1024px) {
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    top: 58px;
    right: 12px;
    left: 12px;
    display: grid;
    grid-template-columns: minmax(0, 1fr) 42px;
    align-items: end;
    padding-left: 40px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-buy-three-price {
    display: block;
    line-height: 28px;
    text-align: center;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-unit-label {
    margin: 0;
    padding: 0 0 2px;
    color: #9e929e;
    font-size: 8px;
    line-height: 9px;
    text-align: left;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    grid-column: 1 / -1;
    width: 100%;
    line-height: 16px;
    text-align: center;
  }
}

{# Desktop header ? behavior and measurements from yamuna.com.br.
   The platform adds .compress to .js-head-main on scroll; the visual change is
   intentionally driven by that existing state rather than a second scroll listener. #}
@media (min-width: 1024px) {
  body[class] .head-main,
  body[class] .head-main.head-fix {
    position: fixed !important;
    top: 0 !important;
    right: 0 !important;
    left: 0 !important;
    z-index: 30001 !important;
    padding: 20px 0 0 !important;
    background: transparent !important;
    box-shadow: none !important;
    transition: padding .3s ease-in-out !important;
  }

  body[class] .head-main .yamuna-header-desktop {
    position: relative !important;
    display: flex !important;
    width: min(1312px, calc(100% - 80px)) !important;
    height: 80px !important;
    min-height: 80px !important;
    margin: 0 auto !important;
    padding: 0 !important;
    align-items: center !important;
    background: transparent !important;
    box-shadow: none !important;
    transition: width .3s ease-in-out !important;
  }

  body[class] .head-main .yamuna-header-desktop::before {
    position: absolute !important;
    z-index: -1 !important;
    top: 10px !important;
    right: 0 !important;
    bottom: 10px !important;
    left: 174px !important;
    display: block !important;
    border-radius: 32px !important;
    background: #a31460 !important;
    box-shadow: 0 3px 6px rgba(70, 16, 52, .20) !important;
    content: '' !important;
    transition: left .3s ease-in-out !important;
  }

  body[class] .head-main .yamuna-header-desktop-logo {
    position: relative !important;
    z-index: 2 !important;
    display: flex !important;
    width: 174px !important;
    height: 80px !important;
    min-width: 174px !important;
    flex: 0 0 174px !important;
    padding: 0 !important;
    align-items: center !important;
    justify-content: flex-start !important;
    overflow: visible !important;
    transition: width .3s ease-in-out, min-width .3s ease-in-out, flex-basis .3s ease-in-out, padding .3s ease-in-out !important;
  }

  body[class] .head-main .yamuna-header-logo-link {
    position: relative !important;
    display: block !important;
    width: 87px !important;
    height: 80px !important;
    min-width: 87px !important;
  }

  body[class] .head-main .yamuna-header-logo-image,
  body[class] .head-main .yamuna-header-logo-default,
  body[class] .head-main .yamuna-header-logo-scrolled {
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    display: block !important;
    width: 87px !important;
    height: 80px !important;
    max-width: 87px !important;
    object-fit: contain !important;
    transition: opacity .22s ease-in-out, visibility .22s ease-in-out, transform .3s ease-in-out !important;
  }

  body[class] .head-main .yamuna-header-logo-default {
    opacity: 1 !important;
    visibility: visible !important;
    transform: translateX(0) scale(1) !important;
  }

  body[class] .head-main .yamuna-header-logo-scrolled {
    opacity: 0 !important;
    visibility: hidden !important;
    transform: translateX(-18px) scale(.96) !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-list-link {
    line-height: 60px !important;
  }

  body[class] .head-main.compress,
  body[class] .head-main.head-fix.compress {
    padding-top: 0 !important;
  }

  body[class] .head-main.compress .yamuna-header-desktop {
    width: min(1088px, calc(100% - 80px)) !important;
  }

  body[class] .head-main.compress .yamuna-header-desktop::before {
    left: 0 !important;
  }

  body[class] .head-main.compress .yamuna-header-desktop-logo {
    width: 112px !important;
    min-width: 112px !important;
    flex-basis: 112px !important;
    padding-left: 18px !important;
  }

  body[class] .head-main.compress .yamuna-header-logo-default {
    opacity: 0 !important;
    visibility: hidden !important;
    transform: translateX(18px) scale(.96) !important;
  }

  body[class] .head-main.compress .yamuna-header-logo-scrolled {
    opacity: 1 !important;
    visibility: visible !important;
    transform: translateX(0) scale(1) !important;
  }
}

{# Mobile header ? Figma 156:3337. #}
@media (max-width: 1023px) {
  body .head-main .yamuna-header-mobile {
    position: relative !important;
    z-index: 3 !important;
    display: flex !important;
    width: 100% !important;
    height: 80px !important;
    min-height: 80px !important;
    margin: 0 !important;
    padding: 0 12px !important;
    align-items: center !important;
    justify-content: space-between !important;
    box-sizing: border-box !important;
    background: #fff !important;
  }

  body .head-main .yamuna-header-mobile-logo {
    display: flex !important;
    width: 125.48px !important;
    height: 80px !important;
    min-width: 125.48px !important;
    flex: 0 0 125.48px !important;
    align-items: center !important;
  }

  body .head-main .yamuna-header-mobile-logo img {
    display: block !important;
    width: 125.48px !important;
    height: 44.79px !important;
    max-width: none !important;
    object-fit: contain !important;
  }

  body .head-main .yamuna-header-mobile-actions {
    display: flex !important;
    margin-left: auto !important;
    gap: 16px !important;
    align-items: center !important;
  }

  body .head-main .yamuna-header-mobile-action {
    position: relative !important;
    display: flex !important;
    width: 32px !important;
    height: 32px !important;
    min-width: 32px !important;
    flex: 0 0 32px !important;
    padding: 0 !important;
    align-items: center !important;
    justify-content: center !important;
    overflow: visible !important;
    border: 0 !important;
    border-radius: 50% !important;
    background: transparent !important;
  }

  body .head-main .yamuna-header-mobile-action .yamuna-header-mobile-glyph {
    position: absolute !important;
    inset: 0 !important;
    display: block !important;
    width: 32px !important;
    height: 32px !important;
    max-width: 32px !important;
  }

  body .head-main .yamuna-header-mobile-cart-count {
    z-index: 1 !important;
    top: -4px !important;
    right: -4px !important;
  }
}

{# Desktop header ? Figma 845:5824.  These declarations deliberately come
   last because the PDP experiment appended incompatible desktop dimensions. #}
@media (min-width: 1024px) {
  body[class] .head-main,
  body[class] .head-main.head-fix,
  body[class] .head-main.compress,
  body[class] .head-main.head-fix.compress {
    padding: 0 !important;
    background: transparent !important;
  }

  body[class] .head-main .yamuna-header-desktop,
  body[class] .head-main.compress .yamuna-header-desktop {
    width: min(1312px, calc(100% - 128px)) !important;
    height: 80px !important;
    min-height: 80px !important;
    margin: 25px auto 0 !important;
    padding: 0 !important;
  }

  body[class] .head-main .yamuna-header-desktop::before,
  body[class] .head-main.compress .yamuna-header-desktop::before {
    top: 0 !important;
    bottom: 0 !important;
    left: 224px !important;
    border-radius: 54px !important;
    background: #a31460 !important;
    box-shadow: 4px 4px 4px -2px rgba(0, 0, 0, .25) !important;
  }

  body[class] .head-main .yamuna-header-desktop-logo,
  body[class] .head-main.compress .yamuna-header-desktop-logo {
    width: 174px !important;
    height: 80px !important;
    min-width: 174px !important;
    flex-basis: 174px !important;
    padding-left: 0 !important;
  }

  body[class] .head-main .yamuna-header-logo-link,
  body[class] .head-main .yamuna-header-logo-image {
    width: 174px !important;
    height: 80px !important;
    min-width: 0 !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav,
  body[class] .head-main.compress .yamuna-header-desktop-nav {
    margin-left: 108px !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-list-link {
    line-height: 80px !important;
  }

  body[class] .head-main .yamuna-header-desktop-utilities {
    width: 128px !important;
    margin-right: 32px !important;
    flex-basis: 128px !important;
  }
}



{# The live mobile header uses the compact 96 by 80 brand lockup. #}
@media (max-width: 1023px) {
  body .head-main .yamuna-header-mobile-logo {
    width: 128px !important;
    min-width: 96px !important;
    flex-basis: 96px !important;
  }

  body .head-main .yamuna-header-mobile-logo img {
    width: 96px !important;
    height: 80px !important;
    object-fit: contain !important;
  }
}

{# Single desktop header geometry: smooth convergent animation on scroll #}
@media (min-width: 1024px) {
  body[class] .head-main .yamuna-header-desktop,
  body[class] .head-main.compress .yamuna-header-desktop,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop {
    position: relative !important;
    display: block !important;
    width: calc(100% - 48px) !important;
    max-width: 1320px !important;
    min-width: 0 !important;
    height: 80px !important;
    min-height: 80px !important;
    margin: 25px auto 0 !important;
    padding: 0 !important;
    transition: none !important;
  }

  body[class] .head-main .yamuna-header-desktop::before {
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: 17.424242% !important;
    border-radius: 54px !important;
    background: #a31460 !important;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08) !important;
    transition: left .55s cubic-bezier(.22, 1, .36, 1), box-shadow .4s ease !important;
  }

  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop::before {
    left: 60px !important;
    box-shadow: 0 8px 28px rgba(163, 20, 96, 0.28) !important;
  }

  body[class] .head-main .yamuna-header-desktop-logo,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-logo {
    position: absolute !important;
    z-index: 3 !important;
    top: 0 !important;
    left: 60px !important;
    display: block !important;
    width: 86px !important;
    min-width: 86px !important;
    height: 80px !important;
    padding: 0 !important;
    overflow: visible !important;
    transform: translateX(0) !important;
    transition: transform .55s cubic-bezier(.22, 1, .36, 1) !important;
  }

  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-logo {
    transform: translateX(45px) !important;
  }

  body[class] .head-main .yamuna-header-logo-link {
    position: relative !important;
    display: block !important;
    width: 86px !important;
    height: 80px !important;
  }

  body[class] .head-main .yamuna-header-logo-image {
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    width: 86px !important;
    height: 80px !important;
    max-width: 86px !important;
    object-fit: contain !important;
    visibility: visible !important;
    will-change: opacity, transform;
    transition: opacity .35s ease, transform .55s cubic-bezier(.22, 1, .36, 1) !important;
  }

  body[class] .head-main .yamuna-header-logo-default {
    opacity: 1 !important;
    transform: scale(1) !important;
  }
  body[class] .head-main .yamuna-header-logo-scrolled {
    opacity: 0 !important;
    transform: scale(0.92) !important;
  }
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-logo-default {
    opacity: 0 !important;
    transform: scale(0.92) !important;
    visibility: visible !important;
  }
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-logo-scrolled {
    opacity: 1 !important;
    transform: scale(1) !important;
    visibility: visible !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-nav {
    position: absolute !important;
    z-index: 2 !important;
    top: 0 !important;
    left: 200px !important;
    display: flex !important;
    height: 80px !important;
    margin: 0 !important;
    align-items: center !important;
    gap: 16px !important;
    transform: none !important;
    transition: left .55s cubic-bezier(.22, 1, .36, 1) !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-list-link { line-height: 80px !important; }

  body[class] .head-main .yamuna-header-desktop-search,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-search {
    position: absolute !important;
    z-index: 2 !important;
    top: 22px !important;
    right: 164px !important;
    width: 260px !important;
    margin: 0 !important;
    transform: none !important;
    transition: none !important;
  }

  body[class] .head-main .yamuna-header-desktop-utilities,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-utilities {
    position: absolute !important;
    z-index: 2 !important;
    top: 0 !important;
    right: 24px !important;
    display: flex !important;
    width: 124px !important;
    height: 80px !important;
    margin: 0 !important;
    align-items: center !important;
    gap: 14px !important;
    transform: none !important;
    transition: none !important;
  }

  body[class] .head-main .yamuna-header-desktop-utilities .utilities-container {
    display: flex !important;
    width: 124px !important;
    height: 80px !important;
    align-items: center !important;
    justify-content: flex-end !important;
    gap: 14px !important;
  }

  body[class] .head-main .yamuna-header-desktop-utilities .utilities-item,
  body[class] .head-main .yamuna-header-desktop-utilities .yamuna-header-favorites,
  body[class] .head-main .yamuna-header-desktop-utilities .yamuna-header-action,
  body[class] .head-main .yamuna-header-desktop-utilities .utility-head,
  body[class] .head-main .yamuna-header-desktop-utilities #ajax-cart {
    display: flex !important;
    flex: 0 0 32px !important;
    width: 32px !important;
    height: 32px !important;
    min-width: 32px !important;
    padding: 6px !important;
    box-sizing: border-box !important;
    align-items: center !important;
    justify-content: center !important;
  }

  body[class] .head-main .yamuna-header-desktop-utilities img,
  body[class] .head-main .yamuna-header-desktop-utilities svg,
  body[class] .head-main .yamuna-header-desktop-utilities .icon-2x {
    width: 20px !important;
    height: 20px !important;
  }
}

@media (min-width: 1200px) {
  body[class] .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-nav { left: 282px !important; gap: 24px !important; }
  body[class] .head-main .yamuna-header-desktop-search,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-search { right: 164px !important; width: 392px !important; }
  body[class] .head-main .yamuna-header-desktop-utilities,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-utilities { right: 32px !important; width: 124px !important; }
}

/* Toast popup feedback on add to cart */
.yamuna-cart-toast {
  position: fixed;
  top: 110px;
  right: 24px;
  z-index: 99999;
  display: flex;
  align-items: center;
  gap: 12px;
  min-width: 280px;
  max-width: calc(100vw - 32px);
  padding: 12px 18px;
  border-radius: 8px;
  background: #ffffff;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
  border-left: 4px solid #238482;
  opacity: 0;
  transform: translateY(-12px);
  pointer-events: none;
  transition: opacity 0.28s ease, transform 0.28s ease;
}

.yamuna-cart-toast.yamuna-cart-toast-show {
  opacity: 1;
  transform: translateY(0);
  pointer-events: auto;
}

.yamuna-cart-toast-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  flex: 0 0 24px;
}

.yamuna-cart-toast-text {
  flex: 1 1 auto;
}

.yamuna-cart-toast-title {
  font-family: 'Dosis', Roboto, Arial, sans-serif;
  font-size: 15px;
  font-weight: 700;
  color: #393747;
  line-height: 1.2;
}

.yamuna-cart-toast-subtitle {
  font-family: Roboto, Arial, sans-serif;
  font-size: 13px;
  color: #806f7a;
  margin-top: 2px;
}

.yamuna-cart-toast-close {
  display: flex;
  align-items: center;
  justify-content: center;
  background: none;
  border: none;
  font-size: 20px;
  line-height: 1;
  color: #9e929e;
  cursor: pointer;
  padding: 0 0 0 8px;
}

.yamuna-cart-toast-close:hover {
  color: #393747;
}

@media (max-width: 767px) {
  .yamuna-cart-toast {
    top: 20px;
    right: 16px;
    left: 16px;
    min-width: 0;
    max-width: none;
  }
}

{# ==========================================================================
   PDP FINAL OVERRIDES ? recovered from Sep 3 session (Figma 798:5606 + ERROS)
   Scoped ONLY to body.template-product / .yamuna-pdp* ? do not touch home.
   ========================================================================== #}
@media (min-width: 1024px) {
  body.template-product .yamuna-pdp-informative-banners {
    display: none !important;
  }

  body.template-product #product-description .social-share {
    display: none !important;
  }

  {# Benefits row ? Figma 804:5665..804:5721: one row between 2 lines, ~12px gaps, 528px #}
  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits {
    display: flex !important;
    flex-wrap: nowrap !important;
    align-items: center !important;
    justify-content: space-between !important;
    box-sizing: border-box !important;
    width: 528px !important;
    max-width: 528px !important;
    height: 40px !important;
    margin: 8px 0 24px !important;
    padding: 0 !important;
    gap: 0 !important;
    border-top: 1px solid #c0bbc3 !important;
    border-bottom: 1px solid #c0bbc3 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefit {
    display: inline-flex !important;
    flex: 0 0 auto !important;
    align-items: center !important;
    gap: 8px !important;
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 12px !important;
    font-weight: 600 !important;
    line-height: 1.3 !important;
    letter-spacing: -0.41px !important;
    white-space: nowrap !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefit img {
    display: block !important;
    width: 24px !important;
    height: 24px !important;
    flex: 0 0 24px !important;
    object-fit: contain !important;
  }

  {# Price cards ? Figma: price ABOVE pix/installments #}
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards {
    width: 528px !important;
    margin: 32px 0 !important;
    gap: 32px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit {
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit > .d-inline-flex {
    position: absolute !important;
    top: 72px !important;
    right: 12px !important;
    left: 12px !important;
    display: flex !important;
    width: auto !important;
    justify-content: center !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-price-display {
    margin: 0 !important;
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 28px !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .yamuna-pdp-price-card-meta {
    position: absolute !important;
    top: 102px !important;
    right: 12px !important;
    left: 12px !important;
    display: flex !important;
    flex-direction: column !important;
    flex-wrap: nowrap !important;
    align-items: center !important;
    justify-content: flex-start !important;
    gap: 0 !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    line-height: 18px !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-discount {
    z-index: 3 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-heading {
    z-index: 1 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    top: 72px !important;
    right: 12px !important;
    left: 12px !important;
    display: grid !important;
    grid-template-columns: minmax(0, 1fr) 42px !important;
    align-items: end !important;
    justify-items: center !important;
    column-gap: 4px !important;
    row-gap: 0 !important;
    padding: 0 0 0 28px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-buy-three-price {
    grid-column: 1 !important;
    grid-row: 1 !important;
    justify-self: end !important;
    margin: 0 !important;
    color: #238482 !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 28px !important;
    text-align: right !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-unit-label {
    grid-column: 2 !important;
    grid-row: 1 !important;
    align-self: end !important;
    justify-self: start !important;
    margin: 0 0 2px !important;
    padding: 0 !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 8px !important;
    font-weight: 600 !important;
    line-height: 9px !important;
    text-align: left !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    grid-column: 1 / -1 !important;
    justify-self: center !important;
    width: 100% !important;
    line-height: 18px !important;
    text-align: center !important;
  }

  {# Quantity pill ? Figma 810:7937, radius ~32 ends, 48px tall #}
  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    align-items: center !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    display: flex !important;
    align-items: center !important;
    height: 48px !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity {
    width: 150px !important;
    height: 48px !important;
    overflow: hidden !important;
    border: 1px solid #c0bbc3 !important;
    border-radius: 32px !important;
    background: #fff !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    min-width: 48px !important;
    width: 48px !important;
    height: 46px !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 0 !important;
    color: #9e929e !important;
    background: rgba(192, 187, 195, 0.28) !important;
    line-height: 1 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:first-child {
    border-radius: 32px 0 0 32px !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:last-child {
    border-radius: 0 32px 32px 0 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control {
    flex: 1 1 auto !important;
    width: auto !important;
    min-width: 0 !important;
    height: 46px !important;
    padding: 0 !important;
    border: 0 !important;
    border-top: 1px solid #c0bbc3 !important;
    border-bottom: 1px solid #c0bbc3 !important;
    background: #fff !important;
    color: #393747 !important;
    font-family: Inter, Roboto, Arial, sans-serif !important;
    font-size: 18px !important;
    line-height: 46px !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn {
    height: 48px !important;
    min-height: 48px !important;
    border-radius: 23px !important;
    box-sizing: border-box !important;
  }
  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    display: flex !important;
    flex-direction: row-reverse !important;
    justify-content: flex-end !important;
    align-items: center !important;
    column-gap: 32px !important;
    row-gap: 0 !important;
    gap: 32px !important;
    width: 528px;
    margin: 19px 0 0 !important;
    padding: 0 0 21px !important;
    border-bottom: 1px solid #c0bbc3;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-12 {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8,
  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    flex: initial !important;
    max-width: none !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8 {
    width: 304px !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    width: 150px !important;
  }

  {# Add to cart ? ERROS / Figma 807-7931 #}
  body.template-product .yamuna-pdp-summary .js-addtocart:not(.js-addtocart-placeholder) {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 8px !important;
    width: 100% !important;
    height: 48px !important;
    margin: 0 !important;
    padding: 12px 24px !important;
    border: 0 !important;
    border-radius: 23px !important;
    background: #238482 !important;
    color: #fff !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: normal !important;
    letter-spacing: normal !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-summary .js-addtocart-placeholder {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary .js-addtocart:not(.js-addtocart-placeholder) img,
  body.template-product .yamuna-pdp-summary .js-addtocart:not(.js-addtocart-placeholder) svg {
    width: 14px !important;
    height: 14px !important;
  }

  {# Quantity ? 150x48 #}
  body.template-product .yamuna-pdp-summary .form-quantity {
    width: 150px !important;
    height: 48px !important;
    overflow: hidden !important;
    border: 1px solid #c0bbc3 !important;
    border-radius: 32px !important;
    background: #fff !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon {
    min-width: 42px !important;
    height: 46px !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 0 !important;
    color: #4a1d3a !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:first-child,
  body.template-product .yamuna-pdp-summary .form-quantity-icon:last-child {
    background: rgba(192, 187, 195, 0.28) !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control {
    height: 46px !important;
    padding: 0 !important;
    border: 0 !important;
    background: #fff !important;
    color: #4a1d3a !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 18px !important;
    text-align: center !important;
  }

  {# CEP block ? HTML children: label (col-12), input wrap, button wrap, help (col-12) #}
  body.template-product .yamuna-pdp-summary #product-shipping-container {
    margin-top: 16px !important;
    padding-top: 0 !important;
    border-top: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline {
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
    column-gap: 12px !important;
    row-gap: 8px !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12.form-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12.mb-2 {
    flex: 0 0 100% !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 0 4px !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-6.col-lg-7,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > [class*="col-lg-7"] {
    flex: 0 0 224px !important;
    width: 224px !important;
    max-width: 224px !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-6.col-lg-5,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > [class*="col-lg-5"] {
    flex: 0 0 125px !important;
    width: 125px !important;
    max-width: 125px !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control {
    width: 100% !important;
    height: 48px !important;
    border: 1px solid #c0bbc3 !important;
    border-radius: 23px !important;
    color: #9e929e !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 18px !important;
    font-weight: 400 !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control::placeholder {
    color: #9e929e !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 18px !important;
    text-transform: uppercase !important;
    opacity: 1 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn {
    width: 100% !important;
    height: 48px !important;
    border: 0 !important;
    border-radius: 23px !important;
    background: #e5c3da !important;
    color: #4a1d3a !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 700 !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-product-quick-login {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12:has(.js-shipping-zipcode-help) {
    flex: 0 0 auto !important;
    width: auto !important;
    max-width: none !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-zipcode-help {
    display: inline-block !important;
    margin: 0 !important;
    color: #238482 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 12px !important;
    font-weight: 700 !important;
    line-height: 1.2 !important;
    text-decoration: underline !important;
    white-space: nowrap !important;
  }

  {# Description main ? Figma title with minus icon #}
  body.template-product #product-description {
    display: block !important;
    width: 528px !important;
    max-width: 528px !important;
    margin-top: 24px !important;
  }

  body.template-product #product-description .yamuna-product-description-main {
    width: 476px !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border-top: 0 !important;
  }

  body.template-product #product-description .yamuna-product-description-main::before {
    content: none !important;
    display: none !important;
  }

  body.template-product #product-description .yamuna-pdp-description-title {
    display: flex !important;
    align-items: center !important;
    gap: 2px !important;
    margin: 0 0 16px !important;
    color: #4a1d3a !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 19px !important;
    text-transform: uppercase !important;
  }

  body.template-product #product-description .yamuna-pdp-description-title::before {
    content: none !important;
    display: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main h3:first-child {
    font-size: inherit !important;
  }

  body.template-product #product-description .yamuna-product-description-main h3:first-child::before {
    content: none !important;
    display: none !important;
  }

  body.template-product #product-description .yamuna-pdp-description-title-icon {
    width: 24px !important;
    height: 24px !important;
    flex: 0 0 24px !important;
  }

  body.template-product #product-description .yamuna-pdp-description-duplicate {
    display: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main > *:not(.yamuna-pdp-description-title) {
    margin-left: 26px !important;
  }

  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .yamuna-product-description-main p,
  body.template-product #product-description .yamuna-product-description-main li {
    color: #393747 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.5 !important;
  }

  body.template-product #product-description .yamuna-product-description-main p {
    margin-bottom: 24px !important;
  }

  body.template-product #product-description .yamuna-pdp-desc-label {
    color: #a31460 !important;
    font-weight: 700 !important;
  }

  body.template-product #product-description .yamuna-pdp-nutrition-btn {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    margin: 8px 0 0 !important;
    padding: 8px 16px !important;
    border-radius: 40px !important;
    background: #e5c3da !important;
    color: #4a1d3a !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1.2 !important;
    text-decoration: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main li {
    font-size: 18px !important;
    font-weight: 700 !important;
    line-height: 1.8 !important;
  }

  {# Accordions ? final spacing #}
  body.template-product #product-description-accordions {
    margin-top: 64px !important;
    padding: 32px 0 40px !important;
    background: #f0f0f0 !important;
  }

  body.template-product #product-description-accordions .yamuna-product-description-blocks {
    display: grid !important;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr) !important;
    column-gap: 192px !important;
    row-gap: 0 !important;
    max-width: 1312px !important;
    margin: 0 auto !important;
  }

  body.template-product #product-description-accordions .yamuna-product-description-accordion {
    min-height: 0 !important;
    padding: 0 !important;
    background: transparent !important;
    border-top: 1px solid rgba(195, 136, 162, 0.25) !important;
  }

  body.template-product #product-description-accordions .yamuna-product-description-accordion:last-child,
  body.template-product #product-description-accordions .yamuna-product-description-accordion:nth-last-child(2) {
    border-bottom: 1px solid rgba(195, 136, 162, 0.25) !important;
  }

  body.template-product #product-description-accordions .informationDiv {
    display: flex !important;
    min-height: 0 !important;
    padding: 16px 0 !important;
    gap: 34px !important;
    align-items: center !important;
  }

  body.template-product #product-description-accordions .informationDiv > h3 {
    margin: 0 !important;
    color: #393747 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 24px !important;
    font-weight: 600 !important;
    line-height: 1.5 !important;
    text-transform: none !important;
  }

  body.template-product #product-description-accordions .yamuna-pdp-accordion-icon,
  body.template-product #product-description-accordions .informationDiv img {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 16px !important;
    height: 16px !important;
    flex: 0 0 16px !important;
    line-height: 0 !important;
    transform: none !important;
    transition: transform .2s ease !important;
  }

  body.template-product #product-description-accordions .yamuna-pdp-accordion-icon svg {
    display: block !important;
    width: 16px !important;
    height: 16px !important;
  }

  body.template-product #product-description-accordions .informationDiv.is-open .yamuna-pdp-accordion-icon,
  body.template-product #product-description-accordions .informationDiv.is-open img {
    transform: scaleY(-1) !important;
  }

  body.template-product #product-description-accordions .infoToOpen {
    padding: 0 0 24px 40px !important;
    color: #393747 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 16px !important;
    line-height: 1.5 !important;
    overflow: hidden !important;
    max-width: 100% !important;
    box-sizing: border-box !important;
  }

  /* Responsive YouTube embeds inside description / accordions */
  body.template-product .yamuna-video,
  body.template-product #product-description .yamuna-video,
  body.template-product #product-description-accordions .yamuna-video {
    position: relative !important;
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 12px 0 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
    aspect-ratio: 16 / 9 !important;
    background: #000 !important;
  }

  body.template-product .yamuna-video iframe,
  body.template-product #product-description iframe,
  body.template-product #product-description-accordions iframe,
  body.template-product #product-description-accordions .infoToOpen iframe {
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    height: 100% !important;
    margin: 0 !important;
    border: 0 !important;
  }

  body.template-product .yamuna-pdp-reviews {
    margin-top: 48px;
  }

  body.template-product .yamuna-pdp-newsletter {
    margin-top: 48px;
    margin-bottom: 0 !important;
  }

  body.template-product .yamuna-pdp-newsletter .section-newsletter-home,
  body.template-product .yamuna-pdp-newsletter [data-store="home-newsletter"] {
    margin-bottom: 0 !important;
  }

  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .h1 {
    margin: 0 0 32px !important;
    color: #a31460 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 32px !important;
    font-weight: 600 !important;
    line-height: 1.2 !important;
    text-transform: uppercase !important;
  }

  {# Final PDP polish vs Figma circled gaps ? qty was wrapping (padding 12 + icons 48+48) #}
  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    align-items: center !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    display: flex !important;
    align-items: center !important;
    align-self: center !important;
    width: 150px !important;
    height: 48px !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8 {
    display: flex !important;
    align-items: center !important;
    align-self: center !important;
    height: 48px !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form .js-quantity.form-group {
    display: flex !important;
    align-items: center !important;
    width: 150px !important;
    height: 48px !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    align-items: stretch !important;
    box-sizing: border-box !important;
    width: 150px !important;
    max-width: 150px !important;
    height: 48px !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
    border: 1px solid #c0bbc3 !important;
    border-radius: 32px !important;
    background: #fff !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon {
    display: flex !important;
    flex: 0 0 42px !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    width: 42px !important;
    min-width: 42px !important;
    max-width: 42px !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 0 !important;
    color: #9e929e !important;
    background: rgba(192, 187, 195, 0.28) !important;
    line-height: 1 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:first-child {
    border-radius: 32px 0 0 32px !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:last-child {
    border-radius: 0 32px 32px 0 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon svg,
  body.template-product .yamuna-pdp-summary .form-quantity-icon use {
    width: 14px !important;
    height: 14px !important;
    fill: #9e929e !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control-container {
    display: flex !important;
    flex: 1 1 auto !important;
    align-items: center !important;
    justify-content: center !important;
    width: auto !important;
    min-width: 0 !important;
    max-width: none !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border-top: 1px solid #c0bbc3 !important;
    border-bottom: 1px solid #c0bbc3 !important;
    background: #fff !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control {
    display: block !important;
    box-sizing: border-box !important;
    width: 100% !important;
    min-width: 0 !important;
    max-width: 100% !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: #fff !important;
    color: #393747 !important;
    font-family: Inter, Roboto, Arial, sans-serif !important;
    font-size: 18px !important;
    font-weight: 400 !important;
    line-height: 46px !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary .js-addtocart:not(.js-addtocart-placeholder) {
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three {
    overflow: visible !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    top: 72px !important;
    right: 16px !important;
    left: 16px !important;
    display: grid !important;
    grid-template-columns: auto auto !important;
    grid-template-rows: auto auto auto !important;
    align-items: center !important;
    justify-content: center !important;
    justify-items: start !important;
    column-gap: 6px !important;
    row-gap: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-buy-three-price {
    grid-column: 1 !important;
    grid-row: 1 !important;
    justify-self: end !important;
    margin: 0 !important;
    line-height: 28px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-unit-label {
    grid-column: 2 !important;
    grid-row: 1 !important;
    align-self: center !important;
    justify-self: start !important;
    margin: 0 !important;
    padding-top: 2px !important;
    line-height: 9px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix {
    grid-column: 1 / -1 !important;
    grid-row: 2 !important;
    justify-self: center !important;
    margin-top: 2px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    grid-column: 1 / -1 !important;
    grid-row: 3 !important;
    justify-self: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit > .d-inline-flex {
    top: 72px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .yamuna-pdp-price-card-meta {
    top: 102px !important;
    flex-direction: column !important;
    gap: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn {
    box-sizing: border-box !important;
    height: 48px !important;
    min-height: 48px !important;
    border-radius: 24px !important;
    line-height: 46px !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control {
    padding: 0 18px !important;
    line-height: 46px !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    padding: 0 !important;
    line-height: 1 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline {
    align-items: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits {
    display: flex !important;
    flex-wrap: nowrap !important;
    align-items: center !important;
    justify-content: space-between !important;
    box-sizing: border-box !important;
    width: 528px !important;
    max-width: 528px !important;
    height: 40px !important;
    margin: 8px 0 24px !important;
    padding: 0 !important;
    gap: 0 !important;
    border-top: 1px solid #c0bbc3 !important;
    border-bottom: 1px solid #c0bbc3 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefit {
    display: inline-flex !important;
    flex: 0 0 auto !important;
    align-items: center !important;
    gap: 8px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefit img {
    display: block !important;
    width: 24px !important;
    height: 24px !important;
    flex: 0 0 24px !important;
    object-fit: contain !important;
  }
}


{# PDP page canvas — Figma uses #F6F6F6 behind gallery, related, reviews, etc. #}
body.template-product,
body.template-product #single-product,
body.template-product .yamuna-pdp-related,
body.template-product .yamuna-pdp-reviews,
body.template-product #related-products {
  background-color: #f6f6f6 !important;
}

{# PDP related carousel ? Figma product v6 / 838:4078. Scoped so home spots stay untouched. #}
body.template-product .yamuna-pdp-related {
  margin: 48px 0 0 !important;
  padding: 0 0 48px !important;
}

body.template-product .yamuna-pdp-related .container {
  max-width: 1312px;
}

body.template-product .yamuna-pdp-related .products-section-title-container,
body.template-product .yamuna-pdp-related .text-center.px-3 {
  margin-bottom: 8px;
}

body.template-product .yamuna-pdp-related .products-section-title,
body.template-product .yamuna-pdp-related .h1 {
  margin: 0 0 32px !important;
  color: #a31460 !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 32px !important;
  font-weight: 600 !important;
  line-height: 1.2 !important;
  text-transform: uppercase !important;
}

body.template-product .yamuna-pdp-related .swiper-slide {
  height: 530px !important;
  padding: 0 !important;
  box-sizing: border-box;
}

body.template-product .yamuna-pdp-related .item,
body.template-product .yamuna-pdp-related .js-product-container {
  position: relative;
  height: 100%;
}

body.template-product .yamuna-pdp-related .item {
  overflow: hidden;
  margin: 0;
  padding: 0 !important;
  text-align: left;
  border-radius: 12px;
  background: #fff;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
}

body.template-product .yamuna-pdp-related .item-image {
  height: 360px;
  margin: 10px 10px 0;
  overflow: hidden;
  border: 0 !important;
  border-radius: 8px;
  background: transparent;
  aspect-ratio: auto;
}

body.template-product .yamuna-pdp-related .item-image img {
  width: 100%;
  height: 100%;
  max-height: none;
  object-fit: contain;
}

body.template-product .yamuna-pdp-related .item-description {
  min-height: 0;
  padding: 5px 10px 110px !important;
  border-bottom: 0 !important;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  text-align: left;
}

body.template-product .yamuna-pdp-related .item-name {
  min-height: 0;
  margin: 0 0 4px !important;
  overflow: hidden;
  color: #4a1d3a !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 18px !important;
  font-weight: 600 !important;
  line-height: 23px !important;
  text-overflow: ellipsis;
  white-space: nowrap;
}

/* Figma related spot: price stacked above installments (flex-col). */
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-price-row {
  display: flex !important;
  flex-direction: column !important;
  flex-wrap: nowrap !important;
  align-items: flex-start !important;
  gap: 2px !important;
  width: 100% !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-price-row > :empty {
  display: none !important;
}

body.template-product .yamuna-pdp-related .item-price-container {
  display: block !important;
  margin: 0 !important;
  padding: 0 !important;
  width: 100% !important;
  flex: 0 0 auto;
}

body.template-product .yamuna-pdp-related .item-price {
  color: #4a0b2c !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 24px !important;
  font-weight: 600 !important;
  line-height: normal !important;
  white-space: nowrap;
}

body.template-product .yamuna-pdp-related .price-compare,
body.template-product .yamuna-pdp-related [data-component="payment-discount-price"] {
  display: none !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-payment,
body.template-product .yamuna-pdp-related .item-installments {
  display: block !important;
  margin: 0 !important;
  padding: 0 !important;
  color: #9e9e9e !important;
  font-family: 'Roboto', sans-serif !important;
  font-size: 10px !important;
  font-weight: 400 !important;
  line-height: normal !important;
  white-space: nowrap;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-payment {
  width: 100%;
}

body.template-product .yamuna-pdp-related .item-installments *,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-payment * {
  color: inherit !important;
  font-family: inherit !important;
  font-size: inherit !important;
  font-weight: 400 !important;
  line-height: inherit !important;
}

body.template-product .yamuna-pdp-related .item-actions {
  position: absolute;
  right: 10px;
  bottom: 10px;
  left: 10px;
  display: flex !important;
  flex-direction: column;
  align-items: center;
  height: auto;
  margin: 0 !important;
  padding: 0 !important;
  visibility: visible;
  opacity: 1;
  gap: 10px;
}

body.template-product .yamuna-pdp-related .item-actions > div:first-child {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 0 0 100% !important;
  width: 100% !important;
  max-width: 100% !important;
  padding: 0 !important;
  gap: 10px;
}

body.template-product .yamuna-pdp-related .item-actions form.js-product-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  max-width: 224px;
  gap: 10px;
  margin: 0;
}

body.template-product .yamuna-pdp-related .item-actions > div:last-child {
  display: none !important;
}

body.template-product .yamuna-pdp-related .js-addtocart-placeholder,
body.template-product .yamuna-pdp-related .item-actions .js-addtocart-placeholder {
  display: none !important;
  visibility: hidden !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
}

/* Figma btn-vitrine: 224x40, radius 31, gap 10, pad 12/24 */
body.template-product .yamuna-pdp-related .item-actions .btn,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three {
  display: flex !important;
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: 224px !important;
  height: 40px !important;
  min-height: 40px !important;
  margin: 0 !important;
  padding: 12px 24px !important;
  align-items: center !important;
  justify-content: center !important;
  gap: 10px !important;
  border-radius: 31px !important;
  line-height: normal !important;
  text-align: center !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-bag {
  display: block !important;
  width: 12px !important;
  height: 12px !important;
  flex: 0 0 12px !important;
  margin: 0 !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one {
  border: 0 !important;
  color: #fff !important;
  background: #238482 !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 12px !important;
  font-weight: 800 !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one span {
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 12px !important;
  font-weight: 800 !important;
  line-height: normal !important;
  text-transform: uppercase !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three {
  border: 1px solid #238482 !important;
  color: #238482 !important;
  background: #fff !important;
  font-family: 'Roboto', sans-serif !important;
  font-size: 12px !important;
  font-weight: 900 !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-label {
  display: inline-flex !important;
  align-items: baseline !important;
  color: #238482 !important;
  font-family: 'Roboto', sans-serif !important;
  font-size: 12px !important;
  font-weight: 900 !important;
  line-height: normal !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-prefix,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-price {
  color: inherit !important;
  font-family: inherit !important;
  font-size: inherit !important;
  font-weight: 900 !important;
  line-height: inherit !important;
}

/* Anchor arrows to the product track (same pattern as home featured). */
body.template-product .yamuna-pdp-related .products-section-container {
  position: relative;
  overflow: visible;
}

body.template-product .yamuna-pdp-related .swiper-button-prev,
body.template-product .yamuna-pdp-related .swiper-button-next {
  width: 24px;
  height: 24px;
  margin-top: -12px;
  top: calc(50% + 24px);
  padding: 0;
  color: #238482;
  fill: #238482;
  background: transparent !important;
  border: 0 !important;
  border-radius: 0 !important;
  box-shadow: none !important;
}

body.template-product .yamuna-pdp-related .swiper-button-prev {
  left: -24px;
}

body.template-product .yamuna-pdp-related .swiper-button-next {
  right: -8px;
}

body.template-product .yamuna-pdp-related .swiper-button-prev .icon-inline,
body.template-product .yamuna-pdp-related .swiper-button-next .icon-inline,
body.template-product .yamuna-pdp-related .swiper-button-prev svg,
body.template-product .yamuna-pdp-related .swiper-button-next svg {
  width: 24px;
  height: 24px;
  color: #238482;
  fill: #238482;
}

body.template-product .yamuna-pdp-related .swiper-button-prev:after,
body.template-product .yamuna-pdp-related .swiper-button-next:after {
  display: none;
}

body.template-product .yamuna-pdp-related .swiper-pagination {
  display: none !important;
}

@media (max-width: 767px) {
  body.template-product .yamuna-pdp-related .swiper-slide {
    height: auto !important;
    min-height: 420px;
  }

  body.template-product .yamuna-pdp-related .item {
    width: 100% !important;
    max-width: 100% !important;
  }

  body.template-product .yamuna-pdp-related .item-image {
    height: 220px;
  }

  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .h1 {
    font-size: 18px !important;
    font-family: 'Roboto', sans-serif !important;
    font-weight: 900 !important;
    color: #a01440 !important;
    line-height: normal !important;
  }

  /* Figma mobile: swipe + peek, no side arrows over the cards. */
  body.template-product .yamuna-pdp-related .swiper-button-prev,
  body.template-product .yamuna-pdp-related .swiper-button-next {
    display: none !important;
  }
}

/* benefits-bar-figma-153243 */

{# ==========================================================================
   PDP MOBILE — Figma 853:9541 (320px)
   First pass: gallery, benefits, price cards, CTA, qty, CEP.
   ========================================================================== #}
@media (max-width: 1023px) {
  body.template-product {
    background-color: #f6f6f6 !important;
  }

  body.template-product .yamuna-pdp-informative-banners {
    display: none !important;
  }

  body.template-product .section-single-product {
    display: block !important;
    width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product #single-product > .container {
    max-width: 100% !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-product .yamuna-pdp-gallery-column,
  body.template-product .yamuna-pdp-summary {
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-product-gallery-desktop {
    display: none !important;
  }

  body.template-product .yamuna-product-gallery-mobile {
    display: block !important;
    position: relative;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-product-gallery-mobile > .row {
    margin: 0 !important;
    width: 100% !important;
  }

  body.template-product .yamuna-product-gallery-mobile .product-image-container {
    position: relative;
    width: 100% !important;
    max-width: 100% !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-product-gallery-mobile .js-swiper-product {
    position: relative !important;
    width: 100% !important;
    height: 432px !important;
    margin: 0 !important;
    overflow: hidden !important;
    visibility: visible !important;
  }

  body.template-product .yamuna-product-gallery-mobile .swiper-wrapper,
  body.template-product .yamuna-product-gallery-mobile .swiper-slide {
    height: 432px !important;
  }

  body.template-product .yamuna-product-gallery-mobile .js-product-slide-link {
    position: relative !important;
    display: block !important;
    width: 100% !important;
    height: 432px !important;
    padding-bottom: 0 !important;
    overflow: hidden !important;
  }

  body.template-product .yamuna-product-gallery-mobile .product-slider-image,
  body.template-product .yamuna-product-gallery-mobile .js-product-slide-img,
  body.template-product .yamuna-product-gallery-mobile .img-absolute,
  body.template-product .yamuna-product-gallery-mobile .img-absolute-centered {
    position: absolute !important;
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: 0 !important;
    width: 100% !important;
    height: 100% !important;
    max-width: none !important;
    max-height: none !important;
    margin: 0 !important;
    /* Cover fills the 432px frame so arrows/dots overlay the photo (Figma), not letterbox gap */
    object-fit: cover !important;
    object-position: center center !important;
    transform: none !important;
    -webkit-transform: none !important;
    -ms-transform: none !important;
    z-index: 1 !important;
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-arrow {
    position: absolute !important;
    z-index: 6 !important;
    bottom: 16px !important;
    top: auto !important;
    display: flex !important;
    width: 32px !important;
    height: 32px !important;
    align-items: center !important;
    justify-content: center !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 50% !important;
    background: rgba(255, 255, 255, 0.95) !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.14) !important;
    cursor: pointer;
    pointer-events: auto;
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-arrow::after {
    display: block;
    width: 8px;
    height: 8px;
    border: solid #393747;
    border-width: 0 2px 2px 0;
    content: '';
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-arrow-prev {
    left: 12px !important;
    right: auto !important;
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-arrow-prev::after {
    margin-left: 2px;
    transform: rotate(135deg);
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-arrow-next {
    left: 52px !important;
    right: auto !important;
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-arrow-next::after {
    margin-right: 2px;
    transform: rotate(-45deg);
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-pagination {
    position: absolute !important;
    z-index: 6 !important;
    right: 12px !important;
    bottom: 26px !important;
    left: auto !important;
    top: auto !important;
    display: flex !important;
    width: auto !important;
    align-items: center;
    justify-content: flex-end;
    gap: 6px;
    transform: none !important;
    pointer-events: none;
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-pagination .swiper-pagination-bullet {
    width: 8px !important;
    height: 8px !important;
    margin: 0 !important;
    opacity: 1 !important;
    background: rgba(255, 255, 255, 0.55) !important;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.35) !important;
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-pagination .swiper-pagination-bullet-active {
    background: #ffffff !important;
  }

  body.template-product .yamuna-pdp-summary {
    padding: 0 12px !important;
    box-sizing: border-box !important;
  }

  /* Figma: only 12px side inset via summary padding — no lateral margins on children */
  body.template-product .yamuna-pdp-summary .page-header,
  body.template-product .yamuna-pdp-summary .page-header .container,
  body.template-product .yamuna-pdp-summary .page-header .row,
  body.template-product .yamuna-pdp-summary .breadcrumbs,
  body.template-product .yamuna-pdp-summary .js-product-name,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-rating,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards,
  body.template-product .yamuna-pdp-summary #product_form,
  body.template-product .yamuna-pdp-summary #product-shipping-container,
  body.template-product .yamuna-pdp-summary .product-shipping-calculator,
  body.template-product .yamuna-pdp-summary .social-share {
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .page-header,
  body.template-product .yamuna-pdp-summary .page-header .container,
  body.template-product .yamuna-pdp-summary .page-header .row {
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .breadcrumbs {
    display: flex !important;
    margin: 16px 0 8px !important;
    padding: 0 !important;
    align-items: center;
    overflow-x: auto;
    color: #393747 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 12px !important;
    font-weight: 400 !important;
    line-height: 18px !important;
    white-space: nowrap;
  }

  body.template-product .yamuna-pdp-summary .page-header .js-product-name {
    margin: 0 !important;
    color: #4a0342 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: normal !important;
    text-align: left !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-rating {
    margin: 8px 0 0 !important;
    width: 100% !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits {
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 296px !important;
    height: auto !important;
    margin: 8px auto 16px !important;
    padding: 12px 0 !important;
    gap: 12px 16px !important;
    border-top: 1px solid #c0bbc3 !important;
    border-bottom: 1px solid #c0bbc3 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefit {
    display: inline-flex !important;
    flex: 0 1 auto !important;
    align-items: center !important;
    max-width: calc(50% - 8px) !important;
    gap: 8px !important;
    color: #238482 !important;
    font-family: 'Montserrat', Arial, sans-serif !important;
    font-size: 12px !important;
    font-style: normal !important;
    font-weight: 400 !important;
    line-height: 110% !important;
    letter-spacing: -0.48px !important;
    white-space: normal !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefit span {
    color: inherit !important;
    font: inherit !important;
    letter-spacing: inherit !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefit img {
    display: block !important;
    width: 24px !important;
    height: 24px !important;
    flex: 0 0 24px !important;
    object-fit: contain !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    width: 100% !important;
    margin: 16px 0 !important;
    padding: 0 !important;
    gap: 16px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card {
    position: relative !important;
    box-sizing: border-box !important;
    width: 248px !important;
    min-width: 248px !important;
    height: 149px !important;
    min-height: 149px !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: visible !important;
    border: 0 !important;
    border-radius: 24px !important;
    background: #fff !important;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.16) !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three {
    display: block !important;
    order: -1 !important;
    cursor: pointer;
    color: inherit;
    font: inherit;
    text-align: inherit;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three.is-selected {
    outline: 2px solid #238482;
    outline-offset: 2px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-heading {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    box-sizing: border-box;
    height: 43px;
    border: 1px solid #a31460;
    border-radius: 46px;
    color: #a31460;
    font-family: Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 41px;
    text-align: center;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount {
    position: absolute;
    z-index: 2;
    top: 27px;
    left: 9px;
    display: flex;
    width: 40px;
    height: 40px;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #fff;
    font-family: Dosis, Arial, sans-serif;
    line-height: 1;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount img {
    position: absolute;
    inset: 0;
    width: 40px;
    height: 40px;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount strong,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount small {
    position: relative;
    z-index: 1;
    color: #fff;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount strong {
    font-size: 16px;
    font-weight: 800;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount small {
    margin-top: -2px;
    font-size: 12px;
    font-weight: 600;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    position: absolute;
    top: 59px !important;
    right: 0 !important;
    left: 0 !important;
    display: grid !important;
    grid-template-columns: auto auto !important;
    grid-template-rows: auto auto auto !important;
    align-items: center !important;
    justify-content: center !important;
    justify-items: start !important;
    column-gap: 15px !important;
    row-gap: 0 !important;
    padding: 0 12px !important;
    color: #9e929e;
    font-family: Dosis, Arial, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 18px;
    text-align: center;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-buy-three-price {
    grid-column: 1 !important;
    grid-row: 1 !important;
    justify-self: end !important;
    display: block;
    margin: 0 !important;
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 28px !important;
    text-align: right !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit-label {
    grid-column: 2 !important;
    grid-row: 1 !important;
    align-self: center !important;
    justify-self: start !important;
    margin: 0 !important;
    padding: 0 !important;
    color: #9e929e;
    font-family: Dosis, Arial, sans-serif;
    font-size: 8px;
    font-weight: 600;
    line-height: 9px;
    text-align: left;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    grid-column: 1 / -1 !important;
    justify-self: center !important;
    width: auto !important;
    margin: 0 !important;
    line-height: 18px !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix {
    grid-row: 2 !important;
    margin-top: 2px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    grid-row: 3 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-pix > span {
    color: #393747;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit {
    display: block !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit::before {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1;
    box-sizing: border-box;
    height: 43px;
    border: 1px solid #a31460;
    border-radius: 46px;
    background: #fff;
    color: #a31460;
    content: 'UNIDADE';
    font-family: Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 41px;
    text-align: center;
    text-transform: uppercase;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit > .d-inline-block,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .tooltip-container,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .price-discount-disclaimer,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-price-without-taxes,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-payment-discount-price,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-compare-price-saved-amount {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit > .d-inline-flex {
    position: absolute !important;
    top: 59px !important;
    right: 12px !important;
    left: 12px !important;
    display: flex !important;
    width: auto !important;
    justify-content: center !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-price-display {
    margin: 0 !important;
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 28px !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .yamuna-pdp-price-card-meta {
    position: absolute !important;
    top: 89px !important;
    right: 12px !important;
    left: 12px !important;
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    line-height: 18px !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary .js-product-payments-container {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product_form {
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    align-items: center !important;
    justify-content: flex-start !important;
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 16px 0 0 !important;
    padding: 24px 0 !important;
    gap: 20px !important;
    border-top: 1px solid #c0bbc3 !important;
    border-bottom: 1px solid #c0bbc3 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-12 {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8,
  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    flex: 0 0 auto !important;
    max-width: none !important;
    width: auto !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8 {
    order: 1 !important;
    width: 168px !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    order: 2 !important;
    display: flex !important;
    align-items: center !important;
    width: 108px !important;
  }

  /* Figma 853:9689 — Adicionar à sacola (1 linha, ~122px de texto) */
  body.template-product .yamuna-pdp-summary input.js-addtocart:not(.js-addtocart-placeholder),
  body.template-product .yamuna-pdp-summary .js-addtocart.btn:not(.js-addtocart-placeholder) {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    width: 168px !important;
    min-width: 168px !important;
    max-width: 168px !important;
    height: 40px !important;
    min-height: 40px !important;
    max-height: 40px !important;
    margin: 0 !important;
    padding: 0 12px !important;
    border: 0 !important;
    border-radius: 23px !important;
    background: #238482 !important;
    color: #fff !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 12px !important;
    font-weight: 900 !important;
    line-height: 14px !important;
    letter-spacing: normal !important;
    text-align: center !important;
    text-transform: uppercase !important;
    white-space: nowrap !important;
    overflow: hidden !important;
    text-overflow: clip !important;
    box-shadow: none !important;
    -webkit-appearance: none !important;
    appearance: none !important;
  }

  body.template-product .yamuna-pdp-summary .js-addtocart-placeholder,
  body.template-product .yamuna-pdp-summary .js-addtocart.js-addtocart-placeholder {
    display: none !important;
    visibility: hidden !important;
    height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
  }

  /* Figma 853:9693 — quantity selector */
  body.template-product .yamuna-pdp-summary .form-group.js-quantity {
    width: 108px !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    align-items: stretch !important;
    box-sizing: border-box !important;
    width: 108px !important;
    max-width: 108px !important;
    height: 40px !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
    border: 1px solid #c0bbc3 !important;
    border-radius: 32px !important;
    background: #fff !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control-container,
  body.template-product .yamuna-pdp-summary .form-quantity .col {
    display: flex !important;
    flex: 1 1 40px !important;
    align-items: center !important;
    justify-content: center !important;
    width: 40px !important;
    max-width: 40px !important;
    min-width: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon {
    display: flex !important;
    flex: 0 0 34px !important;
    align-items: center !important;
    justify-content: center !important;
    min-width: 34px !important;
    width: 34px !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: rgba(192, 187, 195, 0.28) !important;
    color: #9e929e !important;
    font-family: Inter, Roboto, Arial, sans-serif !important;
    font-size: 18px !important;
    font-weight: 400 !important;
    line-height: 22px !important;
    text-align: center !important;
    box-shadow: none !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon svg {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon.js-quantity-down::before {
    content: '-' !important;
    color: #9e929e !important;
    font-family: Inter, Roboto, Arial, sans-serif !important;
    font-size: 18px !important;
    font-weight: 400 !important;
    line-height: 22px !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon.js-quantity-up::before {
    content: '+' !important;
    color: #9e929e !important;
    font-family: Inter, Roboto, Arial, sans-serif !important;
    font-size: 18px !important;
    font-weight: 400 !important;
    line-height: 22px !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:first-child {
    border-radius: 32px 0 0 32px !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:last-child {
    border-radius: 0 32px 32px 0 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control,
  body.template-product .yamuna-pdp-summary .form-quantity .form-control-inline {
    display: block !important;
    flex: 1 1 auto !important;
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 40px !important;
    min-width: 0 !important;
    height: 38px !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    border-top: 1px solid #c0bbc3 !important;
    border-bottom: 1px solid #c0bbc3 !important;
    border-radius: 0 !important;
    background: #fff !important;
    color: #393747 !important;
    font-family: Inter, Roboto, Arial, sans-serif !important;
    font-size: 18px !important;
    font-weight: 400 !important;
    line-height: 38px !important;
    text-align: center !important;
    -moz-appearance: textfield;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control::-webkit-outer-spin-button,
  body.template-product .yamuna-pdp-summary .form-quantity .form-control::-webkit-inner-spin-button {
    margin: 0;
    -webkit-appearance: none;
  }

  body.template-product .yamuna-pdp-summary .js-quantity > label,
  body.template-product .yamuna-pdp-summary .form-group.js-quantity > label {
    display: none !important;
  }

  /* Figma 853:9700 / 9702 / 9705 / 9707 — CEP block */
  body.template-product .yamuna-pdp-summary #product-shipping-container {
    width: 100% !important;
    max-width: 100% !important;
    margin: 16px 0 0 !important;
    padding: 0 !important;
    border-top: 0 !important;
    overflow: hidden !important;
    box-sizing: border-box !important;
  }

  /* Kill Bootstrap row/form-row negative margins that bleed past the 12px inset */
  body.template-product .yamuna-pdp-summary #product-shipping-container.row,
  body.template-product .yamuna-pdp-summary #product-shipping-container .row,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-wrap,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-inner,
  body.template-product .yamuna-pdp-summary #product-shipping-container .form-row,
  body.template-product .yamuna-pdp-summary #product-shipping-container .form-group,
  body.template-product .yamuna-pdp-summary #product-shipping-container .form-group-inline,
  body.template-product .yamuna-pdp-summary #product-shipping-container .col,
  body.template-product .yamuna-pdp-summary #product-shipping-container .col-12,
  body.template-product .yamuna-pdp-summary #product-shipping-container [class*="col-"] {
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
    max-width: 100% !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container > .row,
  body.template-product .yamuna-pdp-summary #product-shipping-container > .yamuna-pdp-shipping-wrap,
  body.template-product .yamuna-pdp-summary #product-shipping-container > .mb-2.col-12,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-inner,
  body.template-product .yamuna-pdp-summary #product-shipping-container [data-store="shipping-calculator"] {
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head,
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form {
    position: relative !important;
    width: 100% !important;
    max-width: 100% !important;
    height: auto !important;
    margin: 0 !important;
    padding: 0 !important;
    transform: none !important;
    top: 0 !important;
    left: 0 !important;
    pointer-events: auto !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline {
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 100% !important;
    column-gap: 20px !important;
    row-gap: 8px !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  /* 853:9700 — label */
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12.form-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .yamuna-pdp-shipping-label,
  body.template-product .yamuna-pdp-summary .shipping-calculator-form .form-label,
  body.template-product .yamuna-pdp-summary .shipping-calculator-form .yamuna-pdp-shipping-label {
    flex: 0 0 100% !important;
    width: 100% !important;
    max-width: 198px !important;
    margin: 0 0 15px !important;
    padding: 0 !important;
    color: #393747 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 500 !important;
    line-height: normal !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-6.col-lg-7,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > [class*="col-lg-7"] {
    flex: 0 0 197px !important;
    width: 197px !important;
    max-width: 197px !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-6.col-lg-5,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > [class*="col-lg-5"] {
    flex: 0 0 79px !important;
    width: 79px !important;
    max-width: 79px !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  /* 853:9702 + 853:9703 — input */
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control {
    box-sizing: border-box !important;
    width: 197px !important;
    max-width: 100% !important;
    height: 34px !important;
    min-height: 34px !important;
    margin: 0 !important;
    padding: 0 23px !important;
    border: 1px solid #c0bbc3 !important;
    border-radius: 23px !important;
    background: #fff !important;
    color: #393747 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    line-height: 34px !important;
    text-align: center !important;
    text-transform: uppercase !important;
    box-shadow: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control::placeholder {
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    text-align: center !important;
    text-transform: uppercase !important;
    opacity: 1 !important;
  }

  /* 853:9705 + 853:9706 — BUSCAR */
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-calculate-shipping {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    width: 79px !important;
    max-width: 79px !important;
    height: 34px !important;
    min-height: 34px !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 23px !important;
    background: #e5c3da !important;
    color: #4a1d3a !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 12px !important;
    font-weight: 700 !important;
    line-height: 1 !important;
    letter-spacing: normal !important;
    text-align: center !important;
    text-transform: uppercase !important;
    white-space: nowrap !important;
    box-shadow: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-product-quick-login {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12:has(.js-shipping-zipcode-help),
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12:has(.yamuna-pdp-shipping-help) {
    flex: 0 0 100% !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  /* 853:9707 — Não sei meu CEP */
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-zipcode-help,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-help {
    display: inline-block !important;
    margin: 8px 0 0 !important;
    padding: 0 !important;
    color: #238482 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 12px !important;
    font-weight: 700 !important;
    line-height: normal !important;
    text-align: left !important;
    text-decoration: underline !important;
    text-underline-position: from-font !important;
    text-decoration-skip-ink: none !important;
    white-space: nowrap !important;
  }

  /* Keep CEP form always visible after search (yamuna.com.br) */
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode {
    display: none !important;
    visibility: hidden !important;
    pointer-events: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head.with-zip,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head.with-form {
    height: auto !important;
    min-height: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form {
    display: block !important;
    position: relative !important;
    opacity: 1 !important;
    visibility: visible !important;
    pointer-events: auto !important;
    top: 0 !important;
    z-index: 2 !important;
  }

  /* Shipping quotes list — match yamuna.com.br */
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response {
    float: none !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 16px 0 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-product-shipping-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-section-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-toggle-more-shipping-options {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response > .font-small.float-left {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response .list-unstyled.box,
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response ul.list-unstyled {
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    background: transparent !important;
    box-shadow: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote,
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-list-item {
    float: none !important;
    width: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    list-style: none !important;
    border: 0 !important;
    border-bottom: 1px solid #e8e4e8 !important;
    background: transparent !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote:last-child,
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-list-item:last-child {
    border-bottom: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote .radio-button,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote .list-item {
    display: block !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    background: transparent !important;
    cursor: default !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote .radio-button-content,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-content {
    display: block !important;
    margin: 0 !important;
    padding: 12px 0 !important;
    border: 0 !important;
    background: transparent !important;
    box-shadow: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote .radio-button-icons-container {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote .radio-button-label {
    display: block !important;
    width: 100% !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-row {
    display: flex !important;
    flex-wrap: nowrap !important;
    align-items: flex-start !important;
    justify-content: space-between !important;
    width: 100% !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-info {
    flex: 1 1 auto !important;
    width: auto !important;
    max-width: none !important;
    padding: 0 12px 0 0 !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-name {
    margin: 0 0 2px !important;
    color: #393747 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1.3 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-time {
    display: block !important;
    margin: 0 !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 12px !important;
    font-weight: 400 !important;
    line-height: 1.3 !important;
    opacity: 1 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-time-icon {
    display: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price {
    flex: 0 0 auto !important;
    width: auto !important;
    max-width: none !important;
    padding: 0 !important;
    margin: 0 !important;
    text-align: right !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price h5,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price .text-primary {
    margin: 0 !important;
    color: #393747 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1.3 !important;
  }

  body.template-product .yamuna-pdp-related {
    margin: 32px 0 0 !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding: 0 0 32px !important;
  }

  body.template-product .yamuna-pdp-related .container {
    max-width: 100% !important;
    padding-left: 12px !important;
    padding-right: 12px !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    box-sizing: border-box !important;
  }

  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .h1 {
    margin: 0 0 16px !important;
    color: #a01440 !important;
    font-family: 'Roboto', sans-serif !important;
    font-size: 18px !important;
    font-weight: 900 !important;
    font-style: normal !important;
    line-height: normal !important;
    text-align: center !important;
    text-transform: uppercase !important;
    background: transparent !important;
  }

  body.template-product .yamuna-pdp-related .products-section-title-container,
  body.template-product .yamuna-pdp-related .text-center.px-3 {
    background: transparent !important;
  }

  body.template-product .yamuna-pdp-related .swiper-slide {
    height: auto !important;
    min-height: 420px;
  }

  body.template-product .yamuna-pdp-related .item {
    width: 100% !important;
    max-width: 100% !important;
  }

  body.template-product .yamuna-pdp-related .item-image {
    height: 220px;
  }

  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-label {
    font-size: 12px !important;
    font-weight: 900 !important;
    white-space: nowrap !important;
  }

  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three {
    max-width: 224px !important;
    height: 40px !important;
    border-radius: 31px !important;
  }

  body.template-product .yamuna-pdp-related .swiper-button-prev,
  body.template-product .yamuna-pdp-related .swiper-button-next {
    display: none !important;
  }

  body.template-product #product-description,
  body.template-product #product-description-accordions {
    width: 100% !important;
    max-width: 100% !important;
    margin: 16px 0 0 !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding: 0 12px !important;
    box-sizing: border-box !important;
  }

  body.template-product #product-description-accordions {
    background: #f0f0f0 !important;
    padding: 8px 12px 16px !important;
  }

  body.template-product #product-description-accordions .yamuna-pdp-accordion-icon {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 16px !important;
    height: 16px !important;
    flex: 0 0 16px !important;
    line-height: 0 !important;
    transform: none !important;
    transition: transform .2s ease !important;
  }

  body.template-product #product-description-accordions .yamuna-pdp-accordion-icon svg {
    display: block !important;
    width: 16px !important;
    height: 16px !important;
  }

  body.template-product #product-description-accordions .informationDiv.is-open .yamuna-pdp-accordion-icon {
    transform: scaleY(-1) !important;
  }

  body.template-product #product-description .yamuna-product-description-blocks,
  body.template-product #product-description-accordions .yamuna-product-description-blocks {
    display: block !important;
    width: 100% !important;
    grid-template-columns: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main {
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 16px 0 8px !important;
    border-top: 0 !important;
  }

  body.template-product #product-description .yamuna-pdp-description-title {
    display: flex !important;
    align-items: center !important;
    gap: 2px !important;
    margin: 0 0 12px !important;
    color: #4a1d3a !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 19px !important;
    text-transform: uppercase !important;
  }

  body.template-product #product-description .yamuna-pdp-description-title-icon {
    width: 24px !important;
    height: 24px !important;
    flex: 0 0 24px !important;
  }

  body.template-product #product-description .yamuna-pdp-description-duplicate {
    display: none !important;
  }

  body.template-product #product-description .yamuna-product-description-main > *:not(.yamuna-pdp-description-title) {
    margin-left: 0 !important;
  }

  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .yamuna-product-description-main p,
  body.template-product #product-description .yamuna-product-description-main li {
    color: #393747 !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    line-height: 1.5 !important;
  }

  body.template-product #product-description .yamuna-product-description-main p {
    margin: 0 0 12px !important;
  }

  body.template-product #product-description .yamuna-pdp-desc-label {
    color: #a31460 !important;
    font-weight: 700 !important;
  }

  body.template-product #product-description .yamuna-pdp-nutrition-btn {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    margin: 8px 0 16px !important;
    padding: 4px 12px !important;
    min-height: 29px !important;
    border: 0 !important;
    border-radius: 40px !important;
    background: #e5c3da !important;
    color: #4a1d3a !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1.5 !important;
    text-transform: uppercase !important;
    text-decoration: none !important;
    cursor: pointer;
  }

  body.template-product #product-description .informationDiv,
  body.template-product #product-description-accordions .informationDiv {
    display: flex !important;
    align-items: center !important;
    gap: 8px !important;
    width: 100% !important;
    margin: 0 !important;
    padding: 12px 0 !important;
    border-bottom: 1px solid #c0bbc3;
  }

  body.template-product #product-description .informationDiv > h3,
  body.template-product #product-description-accordions .informationDiv > h3 {
    flex: 1 1 auto !important;
    width: auto !important;
    margin: 0 !important;
    color: #4a1d3a !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    text-transform: uppercase !important;
  }

  body.template-product #product-description .infoToOpen,
  body.template-product #product-description-accordions .infoToOpen {
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
    padding: 8px 0 16px !important;
    overflow: hidden !important;
    box-sizing: border-box !important;
  }

  /* Responsive YouTube embeds (mobile): fixed 560x315 iframes overflow at 320px */
  body.template-product .yamuna-video,
  body.template-product #product-description .yamuna-video,
  body.template-product #product-description-accordions .yamuna-video {
    position: relative !important;
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 12px 0 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
    aspect-ratio: 16 / 9 !important;
    background: #000 !important;
    box-sizing: border-box !important;
  }

  body.template-product .yamuna-video iframe,
  body.template-product #product-description iframe,
  body.template-product #product-description-accordions iframe,
  body.template-product #product-description-accordions .infoToOpen iframe {
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    height: 100% !important;
    margin: 0 !important;
    border: 0 !important;
  }

  body.template-product #product-description .social-share,
  body.template-product .yamuna-pdp-summary .social-share,
  body.template-product .social-share {
    display: none !important;
  }

  body.template-product .yamuna-pdp-related .products-section-container {
    position: relative;
    overflow: hidden;
  }
}

