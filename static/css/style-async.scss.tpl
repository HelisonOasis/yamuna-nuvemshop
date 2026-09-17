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
    left: auto !important;
  }

  body #modal-cart .cart-item-delete {
    position: static !important;
    top: auto !important;
    right: auto !important;
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

/* Original Fbits /revenda layout */
body.template-page:has(.yamuna-resale-page) > .mt-4,
body.template-page:has(.yamuna-about-page) > .mt-4,
body.template-page > .yamuna-resale-wrap {
  margin-top: 0 !important;
}

.yamuna-resale-page {
  --yamuna-resale-magenta: #a31460;
  --yamuna-resale-magenta-alt: #9f145e;
  --yamuna-resale-teal: #238482;
  --yamuna-resale-text: #393747;
  color: var(--yamuna-resale-text);
  background: #fff;
  overflow: hidden;
  font-family: 'Roboto', sans-serif;
}

.yamuna-resale-page h1,
.yamuna-resale-page h2,
.yamuna-resale-page p,
.yamuna-resale-page a,
.yamuna-resale-page figcaption {
  margin-top: 0;
  font-family: 'Roboto', sans-serif !important;
}

.yamuna-resale-page img {
  max-width: 100%;
  height: auto;
}

.yamuna-resale-section {
  width: 100%;
  max-width: 1330px;
  margin: 0 auto;
  padding: 93px 20px 0;
}

.yamuna-resale-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
  width: 100%;
  padding: 12px 16px;
  border-radius: 8px;
  color: #fff !important;
  font-family: 'Roboto', sans-serif !important;
  font-size: 16px;
  font-weight: 400;
  letter-spacing: normal;
  line-height: 1.55;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  transition: background .2s ease;
}

.yamuna-resale-btn:hover {
  color: #fff !important;
  opacity: .92;
}

.yamuna-resale-btn-teal {
  background: var(--yamuna-resale-teal);
}

.yamuna-resale-btn-teal:hover {
  background: #1c6d6b;
}

.yamuna-resale-btn-magenta {
  background: var(--yamuna-resale-magenta);
}

.yamuna-resale-btn-magenta:hover {
  background: #8a1051;
}

.yamuna-resale-hero {
  position: relative;
  width: 100%;
}

.yamuna-resale-hero-media,
.yamuna-resale-hero-media picture,
.yamuna-resale-hero-media img {
  display: block;
  width: 100%;
}

.yamuna-resale-hero-media img {
  object-fit: cover;
}

.yamuna-resale-hero-card {
  position: absolute;
  left: 0;
  bottom: 16px;
  box-sizing: border-box;
  width: min(284px, calc(100% - 16px));
  max-width: 284px;
  padding: 16px;
  border-radius: 0 24px 24px 0;
  background: #fff;
}

.yamuna-resale-hero-card h1 {
  margin: 0;
  color: var(--yamuna-resale-magenta);
  font-family: 'Roboto', sans-serif !important;
  font-size: 20px;
  font-weight: 800;
  line-height: 1.4;
  text-align: left;
}

.yamuna-resale-hero-card > p {
  margin: 0;
  padding: 8px 0;
  color: var(--yamuna-resale-text);
  font-family: 'Dosis', sans-serif !important;
  font-size: 14px;
  font-weight: 500;
  line-height: 1.35;
  text-align: left;
}

.yamuna-resale-hero-note {
  margin: 0 !important;
  padding-top: 20px !important;
  color: var(--yamuna-resale-text) !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 10px !important;
  font-weight: 400 !important;
  line-height: 1.5 !important;
  text-align: left;
}

.yamuna-resale-hero-card .yamuna-resale-btn {
  padding: 8px 32px;
  font-family: 'Raleway', sans-serif !important;
  font-size: 12px;
  font-weight: 700;
  line-height: 1.25;
}

.yamuna-resale-intro {
  display: grid;
  grid-template-columns: 1fr;
  gap: 40px;
  align-items: center;
}

.yamuna-resale-intro-copy {
  display: flex;
  flex-direction: column;
  gap: 24px;
  align-items: center;
  text-align: center;
}

.yamuna-resale-intro-copy p {
  margin: 0;
  color: var(--yamuna-resale-text);
  font-family: 'Roboto', sans-serif !important;
  font-size: 18px;
  font-weight: 400;
  line-height: 28px;
  text-align: center;
}

.yamuna-resale-intro-copy strong {
  font-weight: 700;
}

.yamuna-resale-people {
  display: block;
  width: min(100%, 464px);
  margin: 0 auto;
  order: -1;
}

.yamuna-resale-video-frame {
  position: relative;
  width: 100%;
  padding-bottom: 56.25%;
  overflow: hidden;
  background: #111;
}

.yamuna-resale-video-frame iframe {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  border: 0;
}

.yamuna-resale-seals-featured {
  display: flex;
  justify-content: center;
  margin-bottom: 40px;
}

.yamuna-resale-seals-featured img,
.yamuna-resale-seals-grid img {
  width: 150px;
  height: 150px;
  object-fit: contain;
}

.yamuna-resale-seals-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 16px;
}

.yamuna-resale-banner {
  max-width: 1330px;
  margin: 93px auto 0;
  padding: 0 20px;
}

.yamuna-resale-banner img {
  display: block;
  width: 100%;
}

.yamuna-resale-why,
.yamuna-resale-join {
  max-width: 1115px;
  text-align: center;
}

.yamuna-resale-why h2,
.yamuna-resale-join h2 {
  margin: 0;
  padding-bottom: 44px;
  color: var(--yamuna-resale-teal);
  font-family: 'Roboto', sans-serif !important;
  font-size: 32px;
  font-weight: 900;
  line-height: 1.2;
  text-align: center;
}

.yamuna-resale-why p,
.yamuna-resale-join p {
  margin: 0;
  padding-bottom: 8px;
  color: #000;
  font-family: 'Roboto', sans-serif !important;
  font-size: 18px;
  font-weight: 400;
  line-height: 1.45;
  text-align: center;
}

.yamuna-resale-join p {
  padding-bottom: 32px;
}

.yamuna-resale-join p:last-of-type {
  padding-bottom: 8px;
}

.yamuna-resale-diffs {
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 1319px;
}

.yamuna-resale-diffs h2 {
  width: 100%;
  margin: 0 0 32px;
  color: #000;
  font-family: 'Roboto', sans-serif !important;
  font-size: 24px;
  font-weight: 700;
  line-height: 1.25;
  text-align: center;
  text-transform: uppercase;
}

.yamuna-resale-diffs-grid {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  justify-content: center;
  gap: 16px 16px;
}

.yamuna-resale-diffs-grid figure {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  width: 150px;
  margin: 0;
}

.yamuna-resale-diffs-grid img {
  width: 132px;
  height: 132px;
  object-fit: contain;
}

.yamuna-resale-diffs-grid figcaption {
  color: #000;
  font-family: 'Roboto', sans-serif !important;
  font-size: 14px;
  font-weight: 700;
  line-height: 1.4;
  text-align: center;
  text-transform: uppercase;
}

.yamuna-resale-diffs .yamuna-resale-btn {
  display: flex;
  width: 100%;
  max-width: 589px;
  margin: 80px auto 0;
}

.yamuna-resale-join .yamuna-resale-btn {
  display: flex;
  width: 100%;
  max-width: 359px;
  margin: 80px auto;
  background: var(--yamuna-resale-magenta-alt);
}

@media (min-width: 768px) {
  .yamuna-resale-hero-card {
    bottom: 80px;
    width: 432px;
    max-width: 432px;
    padding: 20px 16px 20px 64px;
  }

  .yamuna-resale-hero-card h1 {
    font-size: 32px;
    line-height: 40px;
  }

  .yamuna-resale-hero-card > p {
    padding: 20px 0;
    font-size: 24px;
    line-height: 32px;
  }

  .yamuna-resale-hero-note {
    font-size: 16px !important;
    line-height: 24px !important;
  }

  .yamuna-resale-btn {
    font-size: 18px;
    line-height: 28px;
  }

  .yamuna-resale-intro-copy p {
    font-size: 20px;
    line-height: 28px;
  }

  .yamuna-resale-seals-featured {
    margin-bottom: 64px;
  }

  .yamuna-resale-seals-featured img,
  .yamuna-resale-seals-grid img {
    width: 196px;
    height: 196px;
  }

  .yamuna-resale-seals-grid {
    gap: 32px 32px;
  }

  .yamuna-resale-why h2,
  .yamuna-resale-join h2 {
    font-size: 64px;
    line-height: 96px;
  }

  .yamuna-resale-why p,
  .yamuna-resale-join p {
    font-size: 30px;
    line-height: 36px;
  }

  .yamuna-resale-diffs h2 {
    margin-bottom: 64px;
    font-size: 36px;
    line-height: 40px;
  }

  .yamuna-resale-diffs-grid {
    gap: 64px 32px;
  }

  .yamuna-resale-diffs-grid figure {
    width: 192px;
  }

  .yamuna-resale-diffs-grid img {
    width: 164px;
    height: 164px;
  }

  .yamuna-resale-diffs-grid figcaption {
    font-size: 20px;
    line-height: 28px;
  }
}

@media (min-width: 1024px) {
  .yamuna-resale-intro {
    grid-template-columns: minmax(0, 1fr) 464px;
    gap: 40px;
  }

  .yamuna-resale-intro-copy {
    align-items: stretch;
    text-align: left;
  }

  .yamuna-resale-intro-copy p {
    text-align: left;
  }

  .yamuna-resale-people {
    order: 0;
  }

  .yamuna-resale-hero-card .yamuna-resale-btn {
    font-size: 18px;
  }

  .yamuna-resale-btn-wide {
    width: 100%;
  }
}

/* Original Fbits /QuemSomos layout */
.yamuna-about-page {
  --yamuna-about-wine: #4a1d3a;
  --yamuna-about-teal: #238482;
  color: #000;
  background: #fff;
  font-family: 'Dosis', sans-serif;
}

.yamuna-about-page h1,
.yamuna-about-page h2,
.yamuna-about-page h3,
.yamuna-about-page p,
.yamuna-about-page a,
.yamuna-about-page cite,
.yamuna-about-page blockquote,
.yamuna-about-page strong,
.yamuna-about-page li,
.yamuna-about-page dt,
.yamuna-about-page dd,
.yamuna-about-page summary,
.yamuna-about-page details {
  font-family: 'Dosis', sans-serif !important;
}

.yamuna-about-page h1,
.yamuna-about-page h2,
.yamuna-about-page h3,
.yamuna-about-page p,
.yamuna-about-page strong,
.yamuna-about-page li {
  margin: 0;
}

.yamuna-about-layout {
  display: flex;
  flex-direction: column;
  gap: 28px;
  width: 100%;
  max-width: 1330px;
  margin: 0 auto;
  padding: 16px 16px 64px;
}

.yamuna-inst-sidebar {
  flex: 0 0 auto;
  width: 100%;
  padding: 0 0 16px;
  border-bottom: 1px solid rgba(69, 69, 79, 0.25);
  font-family: 'Poppins', sans-serif;
}

.yamuna-inst-title,
.yamuna-inst-nav a {
  font-family: 'Poppins', sans-serif !important;
}

.yamuna-about-page .yamuna-inst-title,
.yamuna-about-page .yamuna-inst-nav a {
  font-family: 'Poppins', sans-serif !important;
}

.yamuna-inst-title {
  margin: 0 0 12px;
  color: var(--yamuna-about-wine);
  font-size: 22px;
  font-weight: 700;
  line-height: 1.25;
}

.yamuna-inst-nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

.yamuna-inst-nav li + li {
  margin-top: 2px;
}

.yamuna-inst-nav a {
  display: block;
  padding: 5px 0;
  color: #1a1a1a !important;
  font-size: 15px;
  font-weight: 500;
  line-height: 1.35;
  text-decoration: none !important;
}

.yamuna-inst-nav a:hover {
  color: var(--yamuna-about-teal) !important;
}

.yamuna-inst-nav a.is-active {
  color: var(--yamuna-about-teal) !important;
  font-weight: 700;
  text-decoration: underline !important;
  text-underline-offset: 3px;
}

.yamuna-about-content {
  min-width: 0;
  text-align: justify;
}

.yamuna-about-content h1 {
  margin-bottom: 18px;
  color: var(--yamuna-about-wine);
  font-size: 28px;
  font-weight: 800;
  line-height: 1.2;
  text-align: left;
}

.yamuna-about-content h2 {
  margin: 28px 0 12px;
  color: var(--yamuna-about-wine);
  font-size: 22px;
  font-weight: 700;
  line-height: 1.3;
  text-align: left;
}

.yamuna-about-content h3 {
  margin: 22px 0 8px;
  color: var(--yamuna-about-wine);
  font-size: 18px;
  font-weight: 700;
  line-height: 1.35;
  text-align: left;
}

.yamuna-about-content p {
  margin: 0 0 16px;
  color: #222;
  font-size: 16px;
  font-weight: 400;
  line-height: 1.7;
}

.yamuna-about-lead {
  font-size: 18px !important;
  line-height: 1.75 !important;
}

.yamuna-about-content p strong {
  color: #111;
  font-weight: 700;
}

.yamuna-about-highlight {
  margin: 8px 0 16px !important;
  color: var(--yamuna-about-wine) !important;
  font-size: 22px !important;
  font-weight: 700 !important;
  line-height: 1.35 !important;
  text-align: left;
}

.yamuna-about-content ul {
  margin: 0 0 24px;
  padding: 0 0 0 22px;
}

.yamuna-about-content li {
  margin: 0 0 8px;
  color: #222;
  font-size: 16px;
  font-weight: 400;
  line-height: 1.7;
}

.yamuna-policy-defs {
  margin: 0 0 12px;
}

.yamuna-policy-defs dt {
  margin: 20px 0 6px;
  color: var(--yamuna-about-wine);
  font-size: 18px;
  font-weight: 700;
  line-height: 1.3;
}

.yamuna-policy-defs dd {
  margin: 0;
  color: #222;
  font-size: 16px;
  font-weight: 400;
  line-height: 1.7;
}

.yamuna-policy-content a {
  color: var(--yamuna-about-teal);
  font-weight: 700;
  text-decoration: underline;
  text-underline-offset: 2px;
}

.yamuna-policy-callout {
  margin: 0 0 24px;
  padding: 16px 20px;
  border-radius: 16px;
  background: rgba(35, 132, 130, 0.08);
}

.yamuna-policy-callout p {
  margin: 0;
  text-align: left;
}

.yamuna-policy-callout p + p {
  margin-top: 8px;
}

.yamuna-policy-address {
  margin: 0 0 16px;
  padding: 16px 20px;
  border-left: 3px solid var(--yamuna-about-wine);
  background: #f7f4f5;
  color: #222;
  font-size: 16px;
  font-style: normal;
  font-weight: 600;
  line-height: 1.6;
  text-align: left;
}

.yamuna-faq-group {
  margin: 0 0 12px;
  overflow: hidden;
  border: 1px solid rgba(69, 69, 79, 0.18);
  border-radius: 16px;
  background: #fff;
}

.yamuna-faq-group summary {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  padding: 14px 20px;
  color: var(--yamuna-about-wine);
  cursor: pointer;
  font-size: 18px;
  font-weight: 700;
  line-height: 1.3;
  list-style: none;
  text-align: left;
}

.yamuna-faq-group summary::-webkit-details-marker {
  display: none;
}

.yamuna-faq-group summary::after {
  flex: 0 0 auto;
  width: 10px;
  height: 10px;
  margin-top: -4px;
  border-right: 2px solid var(--yamuna-about-wine);
  border-bottom: 2px solid var(--yamuna-about-wine);
  transform: rotate(45deg);
  transition: transform .2s ease;
  content: '';
}

.yamuna-faq-group[open] summary::after {
  margin-top: 4px;
  transform: rotate(-135deg);
}

.yamuna-faq-body {
  padding: 0 20px 20px;
}

.yamuna-faq-body h3 {
  margin: 18px 0 8px;
  color: var(--yamuna-about-teal);
  font-size: 17px;
}

.yamuna-faq-body h3:first-child {
  margin-top: 4px;
}

.yamuna-about-media {
  position: relative;
  width: 100%;
  aspect-ratio: 16 / 9;
  margin: 20px 0 8px;
  overflow: hidden;
  border-radius: 24px;
  background: #f3f1f2;
}

.yamuna-about-media img,
.yamuna-about-video iframe {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

.yamuna-about-media--jars img {
  object-position: center 28%;
}

.yamuna-about-media--portrait img {
  object-position: center 18%;
}

.yamuna-about-media--soaps img {
  object-position: center 22%;
}

.yamuna-about-media--jobs img {
  object-position: center 40%;
}

.yamuna-about-video {
  margin-top: 12px;
}

.yamuna-about-video iframe {
  position: absolute;
  inset: 0;
  border: 0;
}

.yamuna-about-closing {
  margin-top: 36px;
  padding-top: 8px;
}

.yamuna-about-page .yamuna-about-quote {
  margin: 0;
}

.yamuna-about-page .yamuna-about-quote p {
  margin: 0;
  color: var(--yamuna-about-wine) !important;
  font-size: 22px !important;
  font-weight: 600 !important;
  line-height: 1.4 !important;
  text-align: left;
}

.yamuna-about-page .yamuna-about-quote cite {
  display: block;
  margin: 10px 0 0;
  color: var(--yamuna-about-wine);
  font-size: 18px;
  font-style: normal;
  font-weight: 700;
  letter-spacing: .02em;
  line-height: 1.3;
}

.yamuna-about-page a.yamuna-about-btn {
  display: inline-flex;
  box-sizing: border-box;
  align-items: center;
  justify-content: center;
  min-height: 44px;
  margin: 32px 0 0;
  padding: 10px 22px;
  border-radius: 36px;
  color: #fff !important;
  background: var(--yamuna-about-teal);
  font-family: 'Dosis', sans-serif !important;
  font-size: 16px;
  font-weight: 700;
  line-height: 1.3;
  text-align: center;
  text-decoration: none !important;
  white-space: nowrap;
}

.yamuna-about-page a.yamuna-about-btn:hover {
  color: #fff !important;
  background: #1c6e6c;
}

.yamuna-about-page a.yamuna-about-btn-wine {
  background: #a31460;
  margin-top: 16px;
}

.yamuna-about-page a.yamuna-about-btn-wine:hover {
  color: #fff !important;
  background: #8a1051;
}

.yamuna-about-contacts {
  margin-top: 36px;
}

.yamuna-about-contacts h2 {
  margin: 0 0 14px;
}

.yamuna-about-contacts p {
  margin: 0 0 8px;
  color: #222;
  font-size: 16px;
  font-weight: 400;
  line-height: 1.55;
  text-align: left;
}

.yamuna-about-contacts strong {
  color: var(--yamuna-about-wine);
  font-weight: 700;
}

.yamuna-about-contacts a {
  color: var(--yamuna-about-teal);
  font-weight: 700;
  text-decoration: underline;
  text-underline-offset: 2px;
}

@media (max-width: 767px) {
  .yamuna-about-layout {
    gap: 20px;
    padding: 12px 16px 56px;
  }

  .yamuna-inst-sidebar {
    padding-bottom: 12px;
  }

  .yamuna-inst-title {
    font-size: 20px;
  }

  .yamuna-inst-nav a {
    padding: 4px 0;
    font-size: 15px;
  }

  .yamuna-about-content h1 {
    font-size: 24px;
  }

  .yamuna-about-content h2 {
    margin-top: 22px;
    font-size: 20px;
  }

  .yamuna-about-content h3,
  .yamuna-faq-group summary {
    font-size: 17px;
  }

  .yamuna-faq-group summary,
  .yamuna-faq-body {
    padding-left: 16px;
    padding-right: 16px;
  }

  .yamuna-about-content p,
  .yamuna-about-contacts p {
    font-size: 16px;
  }

  .yamuna-about-highlight,
  .yamuna-about-quote p {
    font-size: 18px !important;
  }

  .yamuna-about-media {
    margin: 16px 0 4px;
    aspect-ratio: 4 / 3;
    border-radius: 20px;
  }

  .yamuna-about-page a.yamuna-about-btn {
    display: flex;
    width: 100%;
    white-space: normal;
  }
}

@media (min-width: 1024px) {
  .yamuna-about-layout {
    flex-direction: row;
    align-items: flex-start;
    gap: 48px;
    padding: 145px 24px 80px;
  }

  .yamuna-inst-sidebar {
    position: sticky;
    top: 120px;
    flex: 0 0 248px;
    width: 248px;
    max-height: calc(100vh - 140px);
    padding: 0 24px 24px 0;
    overflow: auto;
    border-bottom: 0;
    border-right: 1px solid rgba(69, 69, 79, 0.25);
  }

  .yamuna-inst-title {
    font-size: 24px;
  }

  .yamuna-inst-nav a {
    font-size: 16px;
  }

  .yamuna-about-content {
    flex: 1 1 auto;
    max-width: 974px;
  }

  .yamuna-about-content h1 {
    font-size: 32px;
  }

  .yamuna-about-content h2 {
    font-size: 24px;
  }

  .yamuna-about-content h3 {
    font-size: 20px;
  }

  .yamuna-faq-group summary {
    font-size: 20px;
  }

  .yamuna-faq-body h3 {
    font-size: 18px;
  }

  .yamuna-policy-address {
    font-size: 17px;
  }

  .yamuna-about-content p {
    font-size: 17px;
    line-height: 1.75;
  }

  .yamuna-about-content li,
  .yamuna-policy-defs dd {
    font-size: 17px;
    line-height: 1.75;
  }

  .yamuna-about-lead {
    font-size: 19px !important;
  }

  .yamuna-about-media {
    border-radius: 36px;
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

  body.template-home .head-main .yamuna-header-desktop-utilities .badge-amount,
  body.template-home .head-main .yamuna-header-cart-count {
    position: absolute !important;
    top: -6px !important;
    right: -6px !important;
    display: flex !important;
    width: 16px !important;
    height: 16px !important;
    align-items: center;
    justify-content: center;
    color: #a31460 !important;
    border-radius: 50%;
    background: #fff !important;
    font-size: 10px;
    font-weight: 700;
    line-height: 1;
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
    position: absolute !important;
    top: -6px !important;
    right: -6px !important;
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
    width: min(1312px, calc(100% - 48px));
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
    width: min(1312px, calc(100% - 48px));
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

  body.template-home .head-main .yamuna-header-desktop-utilities .badge-amount,
  body.template-home .head-main .yamuna-header-cart-count {
    top: -6px !important;
    right: -6px !important;
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
    width: min(1312px, calc(100% - 48px));
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
    top: -6px;
    right: -6px;
    background: #fff;
    color: #a31460;
  }
}

@media (min-width: 768px) and (max-width: 1050px) {
  .yamuna-header-desktop {
    width: min(1312px, calc(100% - 48px));
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
    top: var(--yamuna-panel-top, 0px);
    left: var(--yamuna-menu-left, 50%);
    z-index: 1;
    display: none;
    width: var(--yamuna-menu-width, min(1312px, calc(100vw - 48px)));
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

{# Keep horizontal scroll from breaking the layout on tablet widths.
   Do NOT set overflow-x:hidden on .section-featured-home ? that forces
   overflow-y to auto and clips product CTAs / pagination. #}
@media (max-width: 1199px) {
  body.template-home {
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

{# Home section rhythm: padding-top only (same-bg sections abut ? no flex gap,
   which painted white body stripes between colored blocks). #}
.section-featured-home {
  margin-top: 0;
  margin-bottom: 0;
  overflow: visible;
}

{# Continuous warm cream band — desktop + mobile (same #FBF7F0). #}
body.template-home [data-store="banner-services"],
body.template-home [data-store="banner-services"] .section-informative-banners,
body.template-home .section-yamuna-category-slider,
body.template-home .section-yamuna-category-slider-desktop,
body.template-home [data-store="home-image-text-module"],
body.template-home .section-featured-home,
body.template-home .section-yamuna-category-highlights,
body.template-home .section-yamuna-information {
  margin: 0;
  background: #FBF7F0;
}

@media (min-width: 768px) {
  body.template-home .js-home-sections-container {
    display: block;
  }

  body.template-home .section-yamuna-category-slider-desktop {
    padding: 40px 20px 0;
  }

  body.template-home [data-store="home-image-text-module"] {
    padding: 40px 20px 0;
  }

  {# Title space above + room below cards/pagination before next title. #}
  body.template-home .section-featured-home {
    padding: 80px 0 32px;
  }

  body.template-home .section-yamuna-information {
    padding: 0;
  }

  body.template-home .yamuna-home-blog {
    padding: 80px 0 40px;
    background: #f6f6f6;
  }

  body.template-home .section-testimonials-home {
    padding: 64px 0;
  }

  body.template-home .section-instagram-placeholder,
  body.template-home .section-home-content-placeholder.section-instagram-placeholder,
  body.template-home .section-instafeed-home {
    margin: 0;
    /* Figma: ~33px above handle; keep bottom air before next section. */
    padding: 33px 20px 40px;
  }

  {# Bootstrap mb-4 / mb-md-5 on textbanners was stacking with section padding. #}
  body.template-home [data-store="home-image-text-module"] .js-textbanner,
  body.template-home [data-store="home-image-text-module"] .js-textbanner.mb-4,
  body.template-home [data-store="home-image-text-module"] .js-textbanner.mb-md-5 {
    margin-bottom: 0 !important;
    padding-bottom: 0 !important;
  }

  body.template-home [data-store="home-image-text-module"] .js-home-modules {
    margin-bottom: 0 !important;
  }

  body.template-home .section-yamuna-category-highlights {
    margin: 0;
    padding: 0 20px;
  }
}

{# Yamuna product-family links below the benefits bar. #}
.section-yamuna-category-slider {
  display: none;
  margin: 0;
  padding: 34px 20px 42px;
  background: #FBF7F0;
}

.section-yamuna-category-slider-desktop {
  margin: 0;
  padding: 40px 20px 0;
  background: #FBF7F0;
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
  display: flex;
  align-items: flex-start;
  gap: clamp(22px, 4vw, 64px);
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
  font-size: 42px;
  font-weight: 400;
  line-height: 1;
  cursor: pointer;
}

.yamuna-category-slider-desktop-arrow:hover,
.yamuna-category-slider-desktop-arrow:focus {
  color: #a31460;
}

.yamuna-category-slider-desktop-item {
  display: flex;
  flex: 0 0 calc((100% - 3 * clamp(22px, 4vw, 64px)) / 4);
  max-width: calc((100% - 3 * clamp(22px, 4vw, 64px)) / 4);
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
  box-sizing: border-box;
}

.yamuna-category-slider-desktop-item:hover { color: #a31460; }

.yamuna-category-slider-desktop-item:hover .yamuna-category-slider-desktop-image {
  border-color: #238482;
  box-shadow: none;
}

.yamuna-category-slider-desktop-image {
  display: block;
  width: 142px;
  height: 142px;
  margin: 0 auto 12px;
  padding: 2px;
  overflow: hidden;
  border: 1px solid #c4bfc7;
  border-radius: 50%;
  background: transparent;
  box-sizing: border-box;
  transition: border-color .2s ease;
}

.yamuna-category-slider-desktop-image img {
  display: block;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: cover;
  object-position: center center;
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
  display: block;
  width: 112px;
  height: 112px;
  margin: 0 auto 12px;
  padding: 2px;
  overflow: hidden;
  border: 1px solid #c4bfc7;
  border-radius: 50%;
  background: transparent;
  box-sizing: border-box;
  transition: border-color .2s ease;
}

.yamuna-category-slider-item:hover .yamuna-category-slider-image {
  border-color: #238482;
  box-shadow: none;
}

.yamuna-category-slider-image img {
  display: block;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: cover;
  object-position: center center;
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
  font-size: 42px;
  font-weight: 400;
  line-height: 1;
  text-decoration: none;
}

.yamuna-category-slider-arrow:hover {
  color: #a31460;
}

{# Independent Yamuna category highlights. #}
.section-yamuna-category-highlights {
  margin: 0;
  padding: 0 20px;
  background: #FBF7F0;
}

{# The native image-and-text modules are Yamuna's two category highlight banners. #}
[data-store="home-image-text-module"] {
  margin: 0;
  padding: 0 20px;
  background: #FBF7F0;
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
  left: 0 !important;
  right: 0 !important;
  width: 100% !important;
  max-width: 100% !important;
  flex: 0 0 100% !important;
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
  position: absolute !important;
  right: 0;
  bottom: 0;
  left: 0 !important;
  z-index: 2;
  width: 100% !important;
  max-width: 100% !important;
  flex: 0 0 100% !important;
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
  font-family: 'Raleway', sans-serif;
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
  font-family: 'Raleway', sans-serif;
  font-size: 16px;
  font-weight: 600;
  line-height: 1;
  text-transform: uppercase;
  transition: all 0.3s ease;
}

[data-store="home-image-text-module"] .js-textbanner-text .btn:hover,
[data-store="home-image-text-module"] .js-textbanner-text .btn:focus,
[data-store="home-image-text-module"] .textbanner-link:hover .js-textbanner-text .btn,
[data-store="home-image-text-module"] .textbanner-link:focus .js-textbanner-text .btn {
  background: #fff !important;
  color: #000 !important;
  border-color: #fff !important;
}

[data-store="home-image-text-module"] .textbanner-link:hover .yamuna-home-module-cta-icon,
[data-store="home-image-text-module"] .textbanner-link:focus .yamuna-home-module-cta-icon,
[data-store="home-image-text-module"] .js-textbanner-text .btn:hover .yamuna-home-module-cta-icon,
[data-store="home-image-text-module"] .js-textbanner-text .btn:focus .yamuna-home-module-cta-icon {
  fill: #000 !important;
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
    padding: 40px 0 0;
    background: #FBF7F0;
  }

  .yamuna-category-slider-container {
    display: flex;
    position: relative;
    z-index: 1;
    width: 100%;
    min-height: 104px;
    align-items: center;
    justify-content: center;
  }

  {# 103: 3 full 84px circles + 16px gaps = 284px; keep arrows in the remaining ~18px/side at 320. #}
  .yamuna-category-slider-list {
    display: block;
    width: 284px;
    max-width: calc(100vw - 36px);
    margin: 0 auto;
    overflow: hidden;
  }

  .yamuna-category-slider-track {
    display: flex;
    align-items: flex-start;
    gap: 0 !important;
  }

  .yamuna-category-slider-item {
    box-sizing: border-box;
    color: #4a1d3a;
    font-family: 'Raleway', sans-serif;
    font-size: 12px;
    font-weight: 600;
    line-height: 1.2;
    text-align: center;
    overflow: hidden;
  }

  .yamuna-category-slider-item > span:not(.yamuna-category-slider-image) {
    display: block;
    width: 100%;
    max-width: 84px;
    margin: 0 auto;
    line-height: 1.15;
  }

  .yamuna-category-slider-image {
    width: 84px;
    height: 84px;
    max-width: 100%;
    margin: 0 auto 6px;
    padding: 2px;
    border: 1px solid #c4bfc7;
    background: transparent;
    box-shadow: none;
  }

  .yamuna-category-slider-image img {
    object-fit: cover;
    object-position: center center;
  }

  .yamuna-category-slider-arrow {
    position: absolute;
    top: 28px;
    z-index: 1;
    display: flex;
    width: 18px;
    height: 84px;
    flex: 0 0 auto;
    color: #238482;
    padding: 0;
    border: 0;
    background: transparent;
    cursor: pointer;
    font-size: 28px;
    line-height: 1;
  }

  .yamuna-category-slider-arrow-prev {
    left: 0;
  }

  .yamuna-category-slider-arrow-next {
    right: 0;
  }

  .section-yamuna-category-highlights {
    padding: 0 16px;
  }

  [data-store="home-image-text-module"] {
    padding: 40px 16px 0;
  }

  [data-store="home-image-text-module"] .js-home-modules {
    margin-bottom: 0 !important;
  }

  [data-store="home-image-text-module"] .js-textbanner,
  [data-store="home-image-text-module"] .js-textbanner.mb-4 {
    margin-bottom: 0 !important;
    padding-bottom: 0 !important;
  }

  [data-store="home-image-text-module"] .js-banner-container {
    width: 100% !important;
    grid-template-columns: 1fr;
    gap: 32px;
  }

  [data-store="home-image-text-module"] .textbanner-image img {
    border-radius: 0;
  }

  [data-store="home-image-text-module"] .js-textbanner .row {
    border-radius: 24px;
    overflow: hidden;
  }

  [data-store="home-image-text-module"] .js-textbanner-text {
    top: auto;
    right: 0;
    bottom: 0;
    left: 0 !important;
    width: 100% !important;
    max-width: 100% !important;
    height: 48px;
    min-height: 48px;
    padding: 8px 16px;
    border-radius: 24px;
    box-sizing: border-box;
  }

  [data-store="home-image-text-module"] .textbanner-title {
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 1;
  }

  [data-store="home-image-text-module"] .js-textbanner-text .btn {
    width: 120px;
    min-width: 120px;
    max-width: 120px;
    height: 32px;
    min-height: 32px;
    padding: 0 12px;
    font-family: 'Raleway', sans-serif;
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
    padding: 0 16px;
  }

  [data-store="home-image-text-module"] .js-banner-container {
    width: 100% !important;
    grid-template-columns: 1fr;
    gap: 32px;
  }

  [data-store="home-image-text-module"] .js-textbanner .row {
    border-radius: 24px;
  }

  [data-store="home-image-text-module"] .js-textbanner-text {
    top: auto;
    right: 0;
    bottom: 0;
    left: 0;
    width: 100% !important;
    height: 48px;
    min-height: 48px;
    padding: 8px 16px;
    border-radius: 24px;
  }

  [data-store="home-image-text-module"] .textbanner-title {
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 600;
  }

  [data-store="home-image-text-module"] .js-textbanner-text .btn {
    width: 120px;
    min-width: 120px;
    height: 32px;
    min-height: 32px;
    padding: 0 12px;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 600;
  }

  [data-store="home-image-text-module"] .js-textbanner-text .btn:after {
    display: none;
  }
}

{# Brand statement between the Yamuna product carousels.
   Vertical spacing handled by .js-home-sections-container gap. #}
.section-yamuna-information {
  overflow: hidden;
  background: #FBF7F0;
  padding: 0;
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
    background: #FBF7F0;
  }

  {# Match featured/promoções mobile title band (54px above title). #}
  [data-store="home-products-sale"].section-featured-home {
    padding-top: 54px;
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

.instafeed-title {
  margin-bottom: 27px;
}

.instafeed-user {
  display: inline-block;
  margin-bottom: 0;
  max-width: 100%;
  vertical-align: top;
  overflow: hidden;
  text-overflow: ellipsis;
  color: #a31460;
  font-family: 'Dosis', sans-serif;
  font-size: 32px;
  font-weight: 500;
  line-height: normal;
}

{# Cen?rio 090: Bootstrap mt-3 on the grid was stacking with the title gap. #}
.section-instafeed-home .js-ig-success {
  margin-top: 0 !important;
}

.section-instafeed-home {
  margin-bottom: 40px;
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
    width: min(1312px, calc(100% - 48px));
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
  body.template-home .head-main .yamuna-header-desktop-utilities .badge-amount,
  body.template-home .head-main .yamuna-header-cart-count {
    display: flex !important;
    top: -6px !important;
    right: -6px !important;
  }

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
    top: var(--yamuna-panel-top, 0px);
    left: var(--yamuna-menu-left, 50%);
    z-index: 1;
    width: var(--yamuna-menu-width, min(1312px, calc(100vw - 48px)));
    height: auto;
    min-height: calc(48px + 320px + 48px + var(--yamuna-panel-overlap, 105px));
    max-height: none !important;
    overflow: hidden;
    transform: none;
    border-radius: 0 0 24px 24px;
    background: #fff;
    box-shadow: 4px 4px 8px rgba(0, 0, 0, .15);
    box-sizing: border-box;
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
    padding: 48px 34px 40px;
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
    background: url('{{ 'images/yamuna/menu-icon-degustacao.svg' | static_url }}') center / contain no-repeat;
  }

  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(1) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-degustacao.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(2) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-kits.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(3) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-manteiga.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(4) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-castanhas.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(5) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-coco.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(6) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-shampoo.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(7) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-sabonetes.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(8) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-cafes.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(9) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-chocolates.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(10) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-temperos.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(11) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-oleos.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(12) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-adocantes.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(13) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-leites.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(14) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-nutraceuticos.svg' | static_url }}'); }
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(15) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-casa-sustentavel.svg' | static_url }}'); }
}

{# Desktop mini cart: native ajax content, presented as the Figma dropdown. #}
@media (min-width: 992px) {
  body.template-home .head-main { position: relative !important; z-index: 30001 !important; isolation: isolate; }
  body.template-home .head-main .yamuna-header-desktop { position: relative !important; z-index: 30002 !important; }
  body.template-home .head-main .yamuna-header-desktop::before { z-index: 30003 !important; }
  body.template-home .head-main .yamuna-header-desktop-nav { position: relative; z-index: auto !important; }
  body.template-home .head-main .yamuna-header-desktop-logo,
  body.template-home .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-utilities { position: relative; z-index: 30004 !important; }

  body.template-home #modal-cart {
    position: fixed !important;
    top: var(--yamuna-panel-top, 0px) !important;
    right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important;
    left: auto !important;
    width: 424px !important;
    max-width: calc(100vw - 32px) !important;
    height: min(759px, calc(100vh - var(--yamuna-panel-top, 0px) - 24px)) !important;
    min-height: 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
    border-radius: 0 0 24px 24px !important;
    box-shadow: 4px 4px 8px rgba(0, 0, 0, .15) !important;
    transform: none !important;
    transition: opacity .18s ease !important;
    z-index: 29000 !important;
    background: #fff !important;
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
  body.template-home #modal-cart .yamuna-minicart-item,
  body.template-home #modal-cart .cart-item.yamuna-minicart-item {
    position: relative;
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    gap: 16px;
    min-height: 0;
    height: auto;
    margin: 0;
    padding: 16px 0;
    border-bottom: 1px solid #ded8dc;
  }
  body.template-home #modal-cart .yamuna-minicart-item-image { flex: 0 0 88px; width: 88px; max-width: 88px; padding: 0; }
  body.template-home #modal-cart .yamuna-minicart-item-image img { width: 88px; height: 88px; max-height: 88px; object-fit: contain; }
  body.template-home #modal-cart .cart-item-name {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    margin: 0;
    padding: 0;
    color: #393747;
    font-family: Dosis, Roboto, Arial, sans-serif;
    font-size: 18px;
    font-weight: 600;
    line-height: 22px;
  }
  body.template-home #modal-cart .cart-item-subtotal { position: static; margin: 0; color: #4a1d3a; font-family: Dosis, Roboto, Arial, sans-serif; font-size: 18px; font-weight: 700; }
  body.template-home #modal-cart .yamuna-minicart-item-controls { display: flex; align-items: center; justify-content: space-between; width: 100%; margin-top: 10px; }
  body.template-home #modal-cart .cart-item-delete { position: static; z-index: 2; width: 24px; height: 32px; margin: 0 0 0 auto; padding: 0; display: flex; align-items: center; justify-content: flex-end; }
  body.template-home #modal-cart .cart-item-delete .btn { display: flex; padding: 0; color: #806f7a; width: 24px; height: 24px; margin: 0; align-items: center; justify-content: center; }
  body.template-home #modal-cart .yamuna-cart-trash-icon { display: block; width: 14px; height: 16px; }
  body.template-home #modal-cart .js-empty-ajax-cart .cart-item-delete,
  body.template-home #modal-cart .js-empty-ajax-cart .yamuna-cart-trash-icon { display: none !important; }
  body.template-home #modal-cart .cart-item-quantity { width: 88px; margin-top: 0; }
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
    position: relative;
    right: auto;
    bottom: auto;
    left: auto;
    display: flex;
    flex-direction: column;
    height: auto;
    min-height: 0;
    padding: 0 0 28px;
    background: #fff;
    box-sizing: border-box;
    flex: 0 0 auto;
  }
  body.template-home #modal-cart .yamuna-cart-discount {
    flex: 0 0 auto;
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
  body.template-home #modal-cart .yamuna-cart-dropdown-footer p {
    position: static;
    margin: 12px 20px 0;
    color: #000;
    font-size: 16px;
    font-weight: 400;
    line-height: 1.25;
    text-align: center;
  }
  body.template-home #modal-cart .yamuna-cart-checkout {
    position: relative;
    top: auto;
    right: auto;
    bottom: auto;
    left: auto;
    display: flex;
    width: calc(100% - 44px);
    height: 46px;
    margin: 16px 22px 0;
    align-items: center;
    justify-content: center;
    gap: 8px;
    border: 0;
    border-radius: 24px;
    background: #238482;
    color: #fff;
    font-family: Roboto, Arial, sans-serif;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
  }
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
    z-index: 1 !important;
    top: var(--yamuna-panel-top, 0px) !important;
    padding-top: var(--yamuna-panel-overlap, 105px) !important;
    background: #fff !important;
  }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop { width: min(1312px, calc(100% - 48px)) !important; }
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
    position: fixed !important; top: var(--yamuna-panel-top, 0px) !important; right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important; left: auto !important;
    z-index: 29000 !important; width: 424px !important; max-width: calc(100vw - 32px) !important; height: min(759px,calc(100vh - var(--yamuna-panel-top, 0px) - 24px)) !important;
    padding: 0 !important; overflow: hidden !important; border-radius: 0 0 24px 24px !important; background: #fff; box-shadow: 4px 4px 8px rgba(0,0,0,.15) !important; transform: none !important;
  }
  body:not(.template-home) #modal-cart.modal-show { right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important; opacity: 1; }
  body:not(.template-home) #modal-cart .js-ajax-cart-panel { display: flex; flex-direction: column; height: 100%; background: #fff; }
  body:not(.template-home) #modal-cart .modal-header { position: relative; flex: 0 0 114px; height: 114px; width: 100%; margin: 0; padding: 75px 56px 16px 30px; border-bottom: 1px solid #d8d0d6; background: #fff !important; color: #4a1d3a; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 16px; font-weight: 700; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .modal-header .modal-close { position: absolute; top: 70px; right: 28px; display: flex; width: 24px; height: 24px; margin: 0; padding: 0; align-items: center; justify-content: center; border: 0; border-radius: 50%; background: #f2edf0 !important; color: #4a1d3a !important; }
  body:not(.template-home) #modal-cart .modal-body { flex: 1 1 auto; min-height: 0; padding: 0; overflow: auto; }
  body:not(.template-home) #modal-cart .js-ajax-cart-list { padding: 42px 20px 0; }
  body:not(.template-home) #modal-cart .yamuna-minicart-item,
  body:not(.template-home) #modal-cart .cart-item.yamuna-minicart-item {
    position: relative;
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    gap: 16px;
    min-height: 0;
    height: auto;
    margin: 0;
    padding: 16px 0;
    border-bottom: 1px solid #ded8dc;
  }
  body:not(.template-home) #modal-cart .yamuna-minicart-item-image { flex: 0 0 88px; max-width: 88px; padding: 0; }
  body:not(.template-home) #modal-cart .yamuna-minicart-item-image img { max-height: 88px; height: 88px; width: 88px; object-fit: contain; }
  body:not(.template-home) #modal-cart .cart-item-name {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    padding: 0;
    margin: 0;
    color: #393747;
    font-family: Dosis,Roboto,Arial,sans-serif;
    font-size: 18px;
    font-weight: 600;
    line-height: 22px;
  }
  body:not(.template-home) #modal-cart .cart-item-subtotal { position: static; margin: 0; color: #4a1d3a; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 18px; font-weight: 700; }
  body:not(.template-home) #modal-cart .yamuna-minicart-item-controls { display: flex; align-items: center; justify-content: space-between; width: 100%; margin-top: 10px; }
  body:not(.template-home) #modal-cart .cart-item-delete { position: static; z-index: 2; width: 24px; height: 32px; margin: 0 0 0 auto; padding: 0; display: flex; align-items: center; justify-content: flex-end; }
  body:not(.template-home) #modal-cart .cart-item-quantity { width: 88px; margin-top: 0; }
  body:not(.template-home) #modal-cart .form-quantity { height: 32px; overflow: hidden; border-color: #c0bbc3; }
  body:not(.template-home) #modal-cart .yamuna-cart-shipping-promo { position: absolute; top: 126px; right: 20px; left: 20px; height: 24px; padding-top: 2px; background: #f6f5f6; color: #a31460; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 14px; font-weight: 600; line-height: 19px; text-align: center; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .yamuna-cart-shipping-promo i { position: absolute; right: 0; bottom: 0; left: 0; height: 3px; background: rgba(192,187,195,.6); }
  body:not(.template-home) #modal-cart .yamuna-cart-shipping-promo i::before { display: block; width: 9px; height: 3px; background: #a31460; content: ''; }
  body:not(.template-home) #modal-cart #error-ajax-stock, body:not(.template-home) #modal-cart .modal-body > .cart-row:not(.js-ajax-cart-list):not(.js-empty-ajax-cart), body:not(.template-home) #modal-cart .js-fulfillment-info { display: none !important; }
  body:not(.template-home) #modal-cart .yamuna-cart-dropdown-footer, body:not(.template-home) #modal-cart .yamuna-cart-empty-footer { position: relative; right: auto; bottom: auto; left: auto; display: flex; flex-direction: column; height: auto; min-height: 0; padding: 0 0 28px; background: #fff; box-sizing: border-box; }
  body:not(.template-home) #modal-cart .yamuna-cart-discount { flex: 0 0 auto; height: 32px; padding: 6px 20px; background: #a31460; color: #fff; font-family: Dosis,Roboto,Arial,sans-serif; font-size: 18px; font-weight: 700; text-align: center; text-transform: uppercase; }
  body:not(.template-home) #modal-cart .yamuna-cart-dropdown-footer p { position: static; margin: 12px 20px 0; color: #000; font-size: 16px; font-weight: 400; line-height: 1.25; text-align: center; }
  body:not(.template-home) #modal-cart .yamuna-cart-checkout { position: relative; top: auto; right: auto; bottom: auto; left: auto; display: flex; width: calc(100% - 44px); height: 46px; margin: 16px 22px 0; align-items: center; justify-content: center; gap: 8px; border: 0; border-radius: 24px; background: #238482; color: #fff; font-size: 16px; font-weight: 700; text-transform: uppercase; }
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
  body .yamuna-header-cart-count {
    position: absolute !important;
    top: -6px !important;
    right: -6px !important;
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
  }

  body .yamuna-header-desktop-search .search-suggest,
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown { z-index: 1 !important; }
  body .yamuna-header-desktop-search .search-suggest { position: fixed; top: var(--yamuna-panel-top, 0px); left: var(--yamuna-menu-left,50%); width: var(--yamuna-menu-width,min(1312px,calc(100vw - 48px))); border-radius: 0 0 24px 24px; background: #fff; }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown { position: fixed; top: var(--yamuna-panel-top, 0px); left: var(--yamuna-menu-left,50%); width: var(--yamuna-menu-width,min(1312px,calc(100vw - 48px))); }
  html.yamuna-header-scrolled body .yamuna-header-desktop { width: min(1312px,calc(100% - 48px)); }
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
    height: auto !important;
    min-height: calc(48px + 320px + 48px + var(--yamuna-panel-overlap, 105px)) !important;
    max-height: none !important;
    overflow: hidden !important;
    transform: none !important;
    border-radius: 0 0 24px 24px !important;
    background: #fff !important;
    box-shadow: 4px 4px 8px rgba(0,0,0,.15) !important;
    box-sizing: border-box !important;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .nav-item-container { position: relative; z-index: 30004; }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown::after {
    position: absolute; top: var(--yamuna-panel-overlap, 105px); right: 0; z-index: 1; width: 298px; height: calc(100% - var(--yamuna-panel-overlap, 105px));
    border-radius: 0 0 24px 0; background: url('{{ 'images/yamuna/menu-produtos.png' | static_url }}') center / cover no-repeat; content: ''; pointer-events: none;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems {
    position: relative; z-index: 2; display: grid; grid-auto-flow: column; grid-template-rows: repeat(8,40px); grid-template-columns: minmax(0,1fr) minmax(0,1fr);
    gap: 0 42px; width: calc(100% - 298px); height: auto; margin: 0; padding: 48px 34px 48px; overflow: visible; background: #fff; column-count: auto; align-content: start; box-sizing: border-box;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item { display: flex; min-width: 0; margin: 0; padding: 0; align-items: center; }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item > .nav-list-link {
    display: flex; width: 100%; min-width: 0; margin: 0; padding: 0; align-items: center; color: #238482 !important;
    font-family: Dosis,Arial,sans-serif !important; font-size: 16px !important; font-weight: 500 !important; line-height: 32px !important; text-transform: uppercase; white-space: nowrap;
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item > .nav-list-link::before {
    display: block; flex: 0 0 16px; width: 16px; height: 16px; margin-right: 16px; background: url('{{ 'images/yamuna/menu-icon-degustacao.svg' | static_url }}') center / contain no-repeat; content: '';
  }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(1) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-degustacao.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(2) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-kits.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(3) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-manteiga.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(4) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-castanhas.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(5) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-coco.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(6) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-shampoo.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(7) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-sabonetes.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(8) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-cafes.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(9) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-chocolates.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(10) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-temperos.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(11) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-oleos.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(12) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-adocantes.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(13) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-leites.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(14) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-nutraceuticos.svg' | static_url }}'); }
  body .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems > .nav-item:nth-child(15) > .nav-list-link::before { background-image: url('{{ 'images/yamuna/menu-icon-casa-sustentavel.svg' | static_url }}'); }
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
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop { width: min(1312px,calc(100% - 48px)) !important; grid-template-columns: 112px max-content 392px max-content; }
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
    z-index: 1 !important;
    top: var(--yamuna-panel-top, 0px) !important;
    padding-top: var(--yamuna-panel-overlap, 105px) !important;
    background: #fff !important;
  }
  body .head-main .yamuna-header-desktop-nav .nav-item-container,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-item-container { position: relative !important; z-index: 30005 !important; }
  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop { width: min(1312px,calc(100% - 48px)) !important; }
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
    overflow: visible;
    border-radius: 50%;
    background: #a31460;
  }

  body .head-main .yamuna-header-mobile-button {
    display: block;
    width: 32px;
    height: 32px;
  }

  body .head-main .yamuna-header-mobile-glyph {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 32px;
    height: 32px;
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
    position: relative !important;
    top: auto !important;
    width: 100% !important;
    min-height: 0 !important;
    height: auto !important;
    padding: 45px 0 32px !important;
    overflow: visible !important;
    background: #fff !important;
    background-image: none !important;
    font-family: 'Raleway', sans-serif;
  }

  body #nav-hamburger .yamuna-mobile-menu-account {
    position: static !important;
    top: auto !important;
    left: auto !important;
    display: flex !important;
    width: auto !important;
    height: 48px !important;
    margin: 0 12px !important;
    padding: 0 28px !important;
    align-items: center !important;
    justify-content: space-between !important;
    border-top: 2px solid #e8e4ea !important;
    border-bottom: 2px solid #e8e4ea !important;
  }

  body #nav-hamburger .yamuna-mobile-menu-account a {
    position: static !important;
    top: auto !important;
    left: auto !important;
    right: auto !important;
    color: #4a1d3a !important;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 500;
    line-height: 24px;
    text-decoration: none;
    text-transform: uppercase;
  }

  body #nav-hamburger .yamuna-mobile-menu-login {
    position: static !important;
    left: auto !important;
    display: flex !important;
    gap: 8px;
    align-items: center;
  }

  body #nav-hamburger .yamuna-mobile-menu-login img {
    width: 14px;
    height: 14px;
    filter: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-register {
    position: static !important;
    right: auto !important;
  }

  body #nav-hamburger .yamuna-mobile-menu-account-divider {
    position: static !important;
    top: auto !important;
    left: auto !important;
    width: 1px;
    height: 24px;
    margin: 0;
    background: #a31460;
  }

  body #nav-hamburger .yamuna-mobile-menu-search {
    position: static !important;
    top: auto !important;
    right: auto !important;
    left: auto !important;
    display: flex !important;
    width: auto !important;
    height: 45px !important;
    margin: 0 12px !important;
    padding: 0 2px 0 2px !important;
    align-items: center !important;
    justify-content: space-between !important;
    border: 0 !important;
    border-bottom: 2px solid #e8e4ea !important;
    color: rgba(74, 29, 58, .7);
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 21px;
    text-decoration: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-search-input {
    flex: 1 1 auto;
    width: auto;
    height: 27px;
    margin: 0;
    padding: 0;
    border: 0;
    background: transparent;
    color: #4a1d3a;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 400;
    text-transform: uppercase;
  }

  body #nav-hamburger .yamuna-mobile-menu-search-input::placeholder {
    color: rgba(74, 29, 58, .7);
    opacity: 1;
    text-transform: uppercase;
  }

  body #nav-hamburger .yamuna-mobile-menu-search-submit {
    display: flex;
    width: 27px;
    height: 27px;
    margin: 0;
    padding: 0;
    flex: 0 0 27px;
    align-items: center;
    justify-content: center;
    border: 0;
    background: transparent;
  }

  body #nav-hamburger .yamuna-mobile-menu-search img {
    width: 27px;
    height: 27px;
  }

  body #nav-hamburger .yamuna-mobile-menu-products {
    position: static !important;
    top: auto !important;
    right: auto !important;
    left: auto !important;
    margin: 0 12px !important;
    padding: 12px 2px 16px !important;
    border: 0 !important;
    border-bottom: 2px solid #c0bbc3 !important;
  }

  body #nav-hamburger .yamuna-mobile-menu h2 {
    height: auto;
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
    height: auto !important;
    min-height: 32px;
    margin: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-products a {
    position: relative;
    display: flex !important;
    height: auto !important;
    min-height: 32px;
    padding: 0 0 0 30px !important;
    align-items: center;
    color: #238482;
    font-family: 'Raleway', sans-serif;
    font-size: 12px;
    font-weight: 600;
    line-height: 16px;
    text-decoration: none;
    text-transform: uppercase;
    white-space: normal;
  }

  body #nav-hamburger .yamuna-mobile-menu-products img {
    position: absolute;
    top: 8px;
    left: 0;
    width: 16px;
    height: 16px;
    margin: 0;
  }

  body #nav-hamburger .yamuna-mobile-menu-products li:nth-child(n + 5) img {
    display: none;
  }

  body #nav-hamburger .yamuna-mobile-menu-links {
    position: static !important;
    top: auto !important;
    left: auto !important;
    display: flex !important;
    flex-direction: column !important;
    gap: 0 !important;
    margin: 0 12px !important;
    padding: 16px 2px !important;
    border: 0 !important;
    border-bottom: 2px solid #c0bbc3 !important;
  }

  body #nav-hamburger .yamuna-mobile-menu-links-last {
    position: static !important;
    top: auto !important;
    left: auto !important;
    margin: 0 12px !important;
    padding: 16px 0 8px !important;
    border-bottom: 0 !important;
  }

  body #nav-hamburger .yamuna-mobile-menu-links a,
  body #nav-hamburger .yamuna-mobile-menu-links-last a {
    display: block;
    height: 28px;
    margin: 0;
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
    border-radius: 24px;
    box-shadow: none;
    background: #fff;
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
@media (min-width: 1360px) {
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
@media (min-width: 1360px) {
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
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown { position: fixed !important; z-index: 1 !important; top: var(--yamuna-panel-top, 0px) !important; padding-top: var(--yamuna-panel-overlap, 105px) !important; background: #fff !important; }

  html.yamuna-header-scrolled body .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop { width: min(1312px,calc(100% - 48px)) !important; }
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
    width: min(1312px, calc(100% - 48px)) !important;
  }

  body:not(.template-home) .head-main .yamuna-header-desktop::before {
    left: 17.424242% !important;
  }

  body:not(.template-home) .head-main .yamuna-header-desktop-logo {
    flex-basis: 148px !important;
    width: 148px !important;
    padding-left: 24px !important;
  }

  body:not(.template-home) .head-main .yamuna-header-logo-default {
    display: block !important;
  }

  body:not(.template-home) .head-main .yamuna-header-logo-scrolled {
    display: none !important;
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
    display: none !important;
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
    z-index: 41000 !important;
    pointer-events: none;
  }

  body .js-modal-overlay[data-modal-id="#modal-cart"] {
    z-index: 40500 !important;
  }

  body #modal-cart.modal.modal-show {
    display: flex !important;
    flex-direction: column !important;
    opacity: 1;
    visibility: visible;
    pointer-events: auto;
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

  body #modal-cart .yamuna-minicart-item,
  body #modal-cart .cart-item.yamuna-minicart-item {
    position: relative;
    display: grid;
    grid-template-columns: 80px minmax(0, 1fr);
    grid-template-rows: auto auto;
    align-items: start;
    column-gap: 13px;
    row-gap: 8px;
    min-height: 0;
    height: auto;
    margin: 0;
    padding: 12px 0;
    border-bottom: 1px solid #c0bbc3;
  }

  body #modal-cart .yamuna-minicart-item-image {
    grid-column: 1;
    grid-row: 1;
    flex: none;
    width: 80px;
    max-width: 80px;
    padding: 0;
  }
  body #modal-cart .yamuna-minicart-item-image a,
  body #modal-cart .yamuna-minicart-item-image img { display: block; width: 80px; height: 80px; object-fit: contain; }

  body #modal-cart .yamuna-minicart-item-body {
    grid-column: 2;
    grid-row: 1;
    display: flex;
    flex: none;
    flex-direction: column;
    min-width: 0;
    padding: 0;
  }

  body #modal-cart .yamuna-minicart-item-controls {
    grid-column: 1 / -1;
    grid-row: 2;
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: flex-start;
    gap: 8px;
    width: 100%;
    margin: 0;
  }

  body #modal-cart .yamuna-minicart-item-top {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    justify-content: space-between;
    gap: 8px;
    width: 100%;
  }

  body #modal-cart .cart-item-name {
    flex: 1 1 auto;
    min-width: 0;
    width: auto;
    margin: 0;
    padding: 0;
    color: #393747;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 17px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  body #modal-cart .cart-item-name a { color: inherit; text-decoration: none; }
  body #modal-cart .cart-item-name small,
  body #modal-cart .cart-item-name [data-component="cart-labels"],
  body #modal-cart .js-cart-item-subtotal-compare-price-container { display: none !important; }

  body #modal-cart .yamuna-cart-item-promo {
    position: static;
    display: flex;
    width: 99px;
    min-height: 30px;
    margin: 8px 0 0;
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
    position: static;
    flex: 0 0 auto;
    margin: 0;
    color: #238482;
    font-family: 'Inter', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: 17px;
    white-space: nowrap;
  }

  body #modal-cart .cart-item-subtotal .js-cart-item-subtotal { margin: 0; }

  body #modal-cart .yamuna-minicart-item-controls .cart-item-quantity { position: static; width: 81px; margin: 0; }

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

  body #modal-cart .yamuna-minicart-item-controls {
    flex-wrap: nowrap;
    justify-content: flex-start;
    gap: 8px;
  }

  body #modal-cart .yamuna-minicart-item-controls .cart-item-quantity { order: 1; flex: 0 0 auto; }
  body #modal-cart .yamuna-minicart-item-controls .yamuna-cart-subscription {
    order: 2;
    flex: 0 0 auto;
    position: static;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    width: 138px;
    max-width: calc(100% - 110px);
    height: 30px;
    margin: 0;
    padding: 0 4px;
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
  body #modal-cart .yamuna-minicart-item-controls .cart-item-delete {
    order: 3;
    flex: 0 0 auto;
    margin: 0 0 0 auto;
  }

  body #modal-cart .cart-item-delete {
    position: static;
    z-index: 2;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    width: 18px;
    height: 28px;
    margin: 0 0 0 auto;
    padding: 0;
  }
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

  /* Hide empty-state banners whenever line items exist (AJAX can leave both in DOM). */
  body #modal-cart:has(.js-cart-item) .js-empty-ajax-cart,
  body #modal-cart:has(.js-cart-item) .yamuna-cart-empty-footer {
    display: none !important;
  }

  body #modal-cart:not(:has(.js-cart-item)) .js-empty-ajax-cart {
    position: relative;
    top: auto;
    right: auto;
    bottom: auto;
    left: auto;
    display: block;
    padding: 12px;
  }

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
    text-decoration: none;
    box-sizing: border-box;
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
    overflow: visible;
    border-radius: 50%;
    background: #a31460;
  }

  body .head-main .yamuna-header-mobile-button { display: block; width: 32px; height: 32px; }
  body .head-main .yamuna-header-mobile-glyph { position: absolute; top: 0; left: 0; display: block; width: 32px; height: 32px; }

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
    border-radius: 24px;
    box-shadow: none;
    background: #fff;
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

{# Responsive benefits carousel ? Figma 156:3366. #}
[data-store="banner-services"] .js-informative-banners { width: 100%; overflow: hidden; }
[data-store="banner-services"] .js-informative-banners .swiper-wrapper { align-items: center; }
[data-store="banner-services"] .js-informative-banners .service-item {
  min-height: 0;
  margin-right: 0 !important;
  margin-left: 0 !important;
}
[data-store="banner-services"] .js-informative-banners .service-item .row {
  margin-right: 0;
  margin-left: 0;
  flex-wrap: nowrap;
  align-items: center;
  justify-content: center;
  column-gap: 18px;
}
[data-store="banner-services"] .js-informative-banners .service-item .row > .col-auto {
  padding-right: 0;
  padding-left: 0;
}
[data-store="banner-services"] .js-informative-banners .service-item .row > .col.p-0 {
  width: auto;
  max-width: none;
  flex: 0 1 auto;
  text-align: center;
}

{# Mobile: bar 73px tall, content centered, 10px side padding (Figma 156:3365). #}
@media (max-width: 767px) {
  [data-store="banner-services"] .section-informative-banners {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 73px;
    min-height: 73px;
    max-height: 73px;
    padding: 0 10px;
    overflow: visible;
    background: #FBF7F0;
    box-sizing: border-box;
  }

  [data-store="banner-services"] .section-informative-banners > .container {
    width: 100%;
    max-width: none;
    padding-right: 0;
    padding-left: 0;
    height: 100%;
  }

  [data-store="banner-services"] .section-informative-banners > .container > .row {
    margin-right: 0;
    margin-left: 0;
    height: 100%;
    align-items: center;
  }

  [data-store="banner-services"] .js-informative-banners {
    position: relative;
    display: flex;
    align-items: center;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }

  [data-store="banner-services"] .js-informative-banners .swiper-wrapper {
    align-items: center;
    height: 100%;
  }

  [data-store="banner-services"] .js-informative-banners .swiper-slide {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
  }

  [data-store="banner-services"] .js-informative-banners .service-item-container {
    width: 100% !important;
    max-width: 100%;
    height: auto;
  }

  [data-store="banner-services"] .js-informative-banners .service-item {
    width: 100%;
    padding: 0;
  }

  [data-store="banner-services"] .yamuna-benefit-icon {
    width: 24px;
    height: 24px;
  }

  [data-store="banner-services"] .service-item h3,
  [data-store="banner-services"] .service-item p {
    font-size: 14px;
    line-height: 1.2;
  }

  [data-store="banner-services"] .service-pagination {
    position: absolute;
    right: 0;
    bottom: 2px;
    left: 0;
    z-index: 2;
    margin-top: 0;
    line-height: 0;
  }

  [data-store="banner-services"] .service-pagination .swiper-pagination-bullet {
    width: 6px;
    height: 6px;
    margin: 0 3px;
  }
}

@media (max-width: 479px) {
  [data-store="banner-services"] .js-informative-banners .swiper-slide { width: 100% !important; }
}

@media (min-width: 480px) and (max-width: 767px) {
  [data-store="banner-services"] .js-informative-banners .swiper-slide { width: 50% !important; }
}

@media (min-width: 768px) and (max-width: 1023px) {
  [data-store="banner-services"] .section-informative-banners {
    min-height: 73px;
    padding: 16px 0;
  }
  [data-store="banner-services"] .js-informative-banners .swiper-slide {
    width: 50% !important;
    max-width: 50% !important;
    flex: 0 0 50% !important;
  }
  [data-store="banner-services"] .yamuna-benefit-icon {
    width: 34px;
    height: 34px;
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
    column-gap: 18px;
    justify-content: flex-start;
  }
  [data-store="banner-services"] .js-informative-banners .service-item .row > .col-auto { padding-right: 0; padding-left: 0; }
  [data-store="banner-services"] .js-informative-banners .service-item .row > .col.p-0 {
    width: auto;
    max-width: none;
    flex: 0 0 auto;
    text-align: left;
  }
  [data-store="banner-services"] .yamuna-benefit-icon {
    width: 34px;
    height: 34px;
  }
  [data-store="banner-services"] .section-informative-banners {
    min-height: 73px;
    padding: 18px 0;
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
    position: absolute !important;
    top: -6px !important;
    right: -6px !important;
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
  margin: 0 auto;
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
  margin: 0 auto;
  padding: 48px 0 !important;
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
  align-items: center;
  gap: 8px;
}

body.template-category .js-product-table .yamuna-plp-price-row {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  align-items: baseline;
  justify-content: flex-start;
  gap: 8px;
  width: 100%;
}

body.template-category .js-product-table .yamuna-plp-price-row .item-price-container {
  width: auto;
  flex: 0 0 auto;
}

body.template-category .js-product-table .item-price {
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 24px;
  font-weight: 600;
  line-height: 1.1;
  white-space: nowrap;
}

body.template-category .js-product-table .item-installments {
  display: inline;
  margin: 0;
  color: #9e9e9e;
  font-family: 'Dosis', sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: normal;
  white-space: nowrap;
}

body.template-category .js-product-table .item-installments *,
body.template-search .js-product-table .item-installments * {
  color: inherit;
  font-family: inherit;
  font-size: inherit;
  font-weight: 400;
  line-height: inherit;
}

{# Production / Figma discount ribbon (yamuna.com.br selo): light pink banner, centered. #}
body.template-category .yamuna-plp-body .item-product,
body.template-search .yamuna-plp-body .item-product,
body.template-category .yamuna-plp-body .js-product-table .item-product,
body.template-search .yamuna-plp-body .js-product-table .item-product,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item-product,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item {
  overflow: visible !important;
}

body.template-category .yamuna-plp-body .item-image,
body.template-search .yamuna-plp-body .item-image,
body.template-category .yamuna-plp-body .js-product-table .item-image,
body.template-search .yamuna-plp-body .js-product-table .item-image,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image {
  overflow: visible !important;
}

body.template-category .yamuna-plp-body .labels,
body.template-search .yamuna-plp-body .labels,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .labels {
  top: 0 !important;
  left: 50% !important;
  right: auto !important;
  /* Keep ribbon dead-centered on the image. */
  transform: translateX(-50%) !important;
  display: flex !important;
  width: calc(100% - 24px);
  max-width: 300px;
  margin: 0 !important;
  align-items: flex-start;
  justify-content: center !important;
  z-index: 12 !important;
  text-align: center !important;
  pointer-events: none;
}

body.template-category .yamuna-plp-body .yamuna-hide-offer .js-offer-label,
body.template-search .yamuna-plp-body .yamuna-hide-offer .js-offer-label,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-hide-offer .js-offer-label,
body.template-category .yamuna-plp-body .js-offer-label.yamuna-offer-zero,
body.template-category .yamuna-plp-body .js-offer-label.d-none,
body.template-search .yamuna-plp-body .js-offer-label.yamuna-offer-zero,
body.template-search .yamuna-plp-body .js-offer-label.d-none,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .js-offer-label.yamuna-offer-zero,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .js-offer-label.d-none,
body .js-offer-label.yamuna-offer-zero,
body .js-offer-label.d-none {
  display: none !important;
  visibility: hidden !important;
  pointer-events: none !important;
}

body.template-category .yamuna-plp-body .label-accent:not(.js-offer-label),
body.template-search .yamuna-plp-body .label-accent:not(.js-offer-label),
[data-store^="home-products-"].section-featured-home .yamuna-home-products .label-accent:not(.js-offer-label) {
  background: #a31460 !important;
  color: #fff !important;
}

{# Production ribbon: ~261?300 ? 40px, Dosis 18 / #A31460 on #E5C3DA. #}
body.template-category .yamuna-plp-body .js-offer-label,
body.template-category .yamuna-plp-body .label-accent.js-offer-label,
body.template-search .yamuna-plp-body .js-offer-label,
body.template-search .yamuna-plp-body .label-accent.js-offer-label,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .js-offer-label,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .label-accent.js-offer-label {
  position: relative;
  display: flex !important;
  width: 100% !important;
  min-width: 0 !important;
  max-width: 300px !important;
  height: 40px !important;
  margin: 0 auto !important;
  padding: 0 24px !important;
  align-items: center;
  justify-content: center !important;
  overflow: visible;
  border-radius: 0 !important;
  background-color: transparent !important;
  background-image: url('{{ "images/yamuna/offer-ribbon.svg" | static_url }}') !important;
  background-position: center center !important;
  background-repeat: no-repeat !important;
  background-size: 100% 100% !important;
  color: #a31460 !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 18px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  letter-spacing: 0.02em;
  text-align: center !important;
  text-transform: uppercase;
  white-space: nowrap;
  box-sizing: border-box;
}

body.template-category .yamuna-plp-body .label-circle,
body.template-search .yamuna-plp-body .label-circle,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .label-circle {
  width: 100% !important;
  height: 40px !important;
  border-radius: 0 !important;
  line-height: 1 !important;
}

@media (max-width: 767px) {
  body.template-category .yamuna-plp-body .labels,
  body.template-search .yamuna-plp-body .labels,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .labels {
    left: 50% !important;
    width: calc(100% - 16px);
    max-width: 260px;
    transform: translateX(-50%) !important;
    justify-content: center !important;
  }

  body.template-category .yamuna-plp-body .js-offer-label,
  body.template-search .yamuna-plp-body .js-offer-label,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .js-offer-label {
    height: 36px !important;
    margin-left: auto !important;
    margin-right: auto !important;
    font-size: 16px !important;
  }

  body.template-category .yamuna-plp-body .label-circle,
  body.template-search .yamuna-plp-body .label-circle,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .label-circle {
    height: 36px !important;
  }
}

{# PLP / related spots: keep image-slider dots off the right edge; active = brand pink. #}
body.template-category .yamuna-plp-body .item-slider-pagination-container,
body.template-search .yamuna-plp-body .item-slider-pagination-container,
body.template-product .yamuna-pdp-related .item-slider-pagination-container {
  left: auto !important;
  right: 16px !important;
  width: auto !important;
  max-width: none !important;
  overflow: visible !important;
  justify-content: flex-end !important;
  transform: none !important;
  -webkit-transform: none !important;
}

body.template-category .yamuna-plp-body .item-slider-pagination,
body.template-search .yamuna-plp-body .item-slider-pagination,
body.template-product .yamuna-pdp-related .item-slider-pagination {
  transform: none !important;
}

body.template-category .yamuna-plp-body .item-slider-pagination .swiper-pagination-bullet,
body.template-search .yamuna-plp-body .item-slider-pagination .swiper-pagination-bullet,
body.template-product .yamuna-pdp-related .item-slider-pagination .swiper-pagination-bullet {
  left: 0 !important;
  background: rgba(255, 255, 255, 0.55) !important;
}

body.template-category .yamuna-plp-body .item-slider-pagination .swiper-pagination-bullet-active,
body.template-search .yamuna-plp-body .item-slider-pagination .swiper-pagination-bullet-active,
body.template-product .yamuna-pdp-related .item-slider-pagination .swiper-pagination-bullet-active,
body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-pagination .swiper-pagination-bullet-active {
  background: #a31460 !important;
}

{# PDP gallery: same production ribbon as spots (not the theme label-circle). #}
body.template-product .yamuna-product-gallery-mobile .labels,
body.template-product .yamuna-product-gallery-mobile .js-labels-floating-group,
body.template-product .yamuna-product-gallery-mobile .labels-product-slider {
  top: 0 !important;
  left: 50% !important;
  right: auto !important;
  transform: translateX(-50%) !important;
  display: flex !important;
  width: calc(100% - 24px);
  max-width: 300px;
  margin: 0 !important;
  align-items: flex-start;
  justify-content: center !important;
  z-index: 12 !important;
  text-align: center !important;
  pointer-events: none;
}

body.template-product .yamuna-product-gallery-mobile .yamuna-hide-offer .js-offer-label,
body.template-product .yamuna-product-gallery-mobile .js-offer-label.yamuna-offer-zero,
body.template-product .yamuna-product-gallery-mobile .js-offer-label.d-none {
  display: none !important;
  visibility: hidden !important;
  pointer-events: none !important;
}

body.template-product .yamuna-product-gallery-mobile .js-offer-label,
body.template-product .yamuna-product-gallery-mobile .label-accent.js-offer-label,
body.template-product .yamuna-product-gallery-mobile .js-offer-label.label-circle {
  position: relative;
  display: flex !important;
  width: 100% !important;
  min-width: 0 !important;
  max-width: 300px !important;
  height: 40px !important;
  margin: 0 auto !important;
  padding: 0 24px !important;
  align-items: center;
  justify-content: center !important;
  overflow: visible;
  border-radius: 0 !important;
  background-color: transparent !important;
  background-image: url('{{ "images/yamuna/offer-ribbon.svg" | static_url }}') !important;
  background-position: center center !important;
  background-repeat: no-repeat !important;
  background-size: 100% 100% !important;
  color: #a31460 !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 18px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  letter-spacing: 0.02em;
  text-align: center;
  text-transform: uppercase;
  white-space: nowrap;
  box-sizing: border-box;
}

body.template-product .yamuna-product-gallery-mobile .label-circle {
  width: 100% !important;
  height: 40px !important;
  border-radius: 0 !important;
  line-height: 1 !important;
}

{# Related spots on PDP also use the same ribbon. #}
body.template-product .yamuna-pdp-related .item,
body.template-product .yamuna-pdp-related .item-product,
body.template-product .yamuna-pdp-related .item-image {
  overflow: visible !important;
}

body.template-product .yamuna-pdp-related .labels {
  top: 0 !important;
  left: 50% !important;
  right: auto !important;
  transform: translate(-50%, 0);
  width: calc(100% - 24px);
  max-width: 300px;
  z-index: 12 !important;
  text-align: center;
  pointer-events: none;
}

body.template-product .yamuna-pdp-related .js-offer-label,
body.template-product .yamuna-pdp-related .label-accent.js-offer-label,
body.template-product .yamuna-pdp-related .js-offer-label.label-circle {
  position: relative;
  display: flex !important;
  width: 100% !important;
  min-width: 0 !important;
  max-width: 300px !important;
  height: 40px !important;
  margin: 0 !important;
  padding: 0 24px !important;
  align-items: center;
  justify-content: center;
  overflow: visible;
  border-radius: 0 !important;
  background-color: transparent !important;
  background-image: url('{{ "images/yamuna/offer-ribbon.svg" | static_url }}') !important;
  background-position: center center !important;
  background-repeat: no-repeat !important;
  background-size: 100% 100% !important;
  color: #a31460 !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 18px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  letter-spacing: 0.02em;
  text-align: center;
  text-transform: uppercase;
  white-space: nowrap;
  box-sizing: border-box;
}

body.template-product .yamuna-pdp-related .label-circle {
  width: 100% !important;
  height: 40px !important;
  border-radius: 0 !important;
  line-height: 1 !important;
}

@media (max-width: 767px) {
  body.template-product .yamuna-product-gallery-mobile .labels,
  body.template-product .yamuna-product-gallery-mobile .js-labels-floating-group,
  body.template-product .yamuna-product-gallery-mobile .labels-product-slider,
  body.template-product .yamuna-pdp-related .labels {
    left: 50% !important;
    width: calc(100% - 16px);
    max-width: 260px;
    transform: translateX(-50%) !important;
    justify-content: center !important;
  }

  body.template-product .yamuna-product-gallery-mobile .js-offer-label,
  body.template-product .yamuna-pdp-related .js-offer-label {
    height: 36px !important;
    margin-left: auto !important;
    margin-right: auto !important;
    font-size: 16px !important;
  }

  body.template-product .yamuna-product-gallery-mobile .label-circle,
  body.template-product .yamuna-pdp-related .label-circle {
    height: 36px !important;
  }
}

{# Cen?rio 006: load-more matches the brand capsule, not theme btn-primary. #}
body.template-category .js-load-more.btn,
body.template-search .js-load-more.btn {
  display: inline-flex;
  min-height: 48px;
  padding: 12px 32px;
  align-items: center;
  justify-content: center;
  border: 0;
  border-radius: 30px;
  background: #A31460 !important;
  background-color: #A31460 !important;
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 14px;
  font-weight: 700;
  letter-spacing: 0.04em;
  line-height: 1;
  text-transform: uppercase;
}

body.template-category .js-load-more.btn:hover,
body.template-category .js-load-more.btn:focus,
body.template-search .js-load-more.btn:hover,
body.template-search .js-load-more.btn:focus {
  background: #8c1052 !important;
  background-color: #8c1052 !important;
  color: #fff !important;
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

body.template-category .yamuna-plp-buy-one {
  font-family: 'Raleway', sans-serif;
}

body.template-category .yamuna-plp-buy-three {
  background: #fff;
  color: #238482;
  font-size: 14px;
}

body.template-category .yamuna-plp-buy-three span,
body.template-category .yamuna-plp-buy-three-prefix,
body.template-category .yamuna-plp-buy-three-price {
  margin-left: 4px;
  font-size: 14px;
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
  align-items: center;
  gap: 8px;
}

body.template-search .js-product-table .yamuna-plp-price-row {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  align-items: baseline;
  justify-content: flex-start;
  gap: 8px;
  width: 100%;
}

body.template-search .js-product-table .yamuna-plp-price-row .item-price-container {
  width: auto;
  flex: 0 0 auto;
}

body.template-search .js-product-table .item-price {
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 24px;
  font-weight: 600;
  line-height: 1.1;
  white-space: nowrap;
}

body.template-search .js-product-table .item-installments {
  display: inline;
  margin: 0;
  color: #9e9e9e;
  font-family: 'Dosis', sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: normal;
  white-space: nowrap;
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

body.template-search .yamuna-plp-buy-one {
  font-family: 'Raleway', sans-serif;
}

body.template-search .yamuna-plp-buy-three {
  background: #fff;
  color: #238482;
  font-size: 14px;
}

body.template-search .yamuna-plp-buy-three span,
body.template-search .yamuna-plp-buy-three-prefix,
body.template-search .yamuna-plp-buy-three-price {
  margin-left: 4px;
  font-size: 14px;
  font-weight: 600;
}

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
    margin-bottom: 0;
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
  body.template-category .yamuna-plp-buy-three { min-height: 40px; font-size: 14px; }
  body.template-category .yamuna-plp-buy-one { height: 40px; min-height: 40px; }
  body.template-category .yamuna-plp-buy-three { height: 42px; min-height: 42px; font-size: 14px; }
  body.template-category .yamuna-plp-buy-three-prefix,
  body.template-category .yamuna-plp-buy-three-price { font-size: 14px; }
}

{# Remaining PLP states: the inline filter selection frame and the two modal variants. #}
@media (min-width: 1024px) {
  body.template-category .yamuna-plp-hero,
  body.template-search .yamuna-plp-hero {
    /* Figma PLP: 27px clear below the magenta capsule (--yamuna-menu-top). */
    margin-top: calc(var(--yamuna-menu-top, 105px) + 27px) !important;
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
  body.template-search .yamuna-plp-buy-three { min-height: 40px; font-size: 14px; }
  body.template-search .yamuna-plp-buy-one { height: 40px; min-height: 40px; }
  body.template-search .yamuna-plp-buy-three { height: 42px; min-height: 42px; font-size: 14px; }
  body.template-search .yamuna-plp-buy-three-prefix,
  body.template-search .yamuna-plp-buy-three-price { font-size: 14px; }
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
    width: min(1312px, calc(100% - 48px)) !important;
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
    left: 17.424242% !important;
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
    width: min(1312px, calc(100% - 48px)) !important;
    max-width: 1312px !important;
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
    margin: calc(var(--yamuna-menu-top, 105px) + 27px) auto 0;
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
@media (min-width: 1360px) {
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

@media (max-width: 1359px) {
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
@media (min-width: 1360px) {
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
  position: fixed !important;
  top: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  left: 0 !important;
  background: rgba(31, 24, 30, .52) !important;
  z-index: 50000 !important;
  transition: none !important;
}

#nav-filters.yamuna-plp-filters-modal {
  position: fixed !important;
  top: 0 !important;
  left: -100% !important;
  z-index: 50001 !important;
  height: 100vh !important;
  transition: none !important;
}

html.yamuna-filters-open .head-main,
html.yamuna-filters-open .head-main.head-fix,
html.yamuna-filters-open .head-main .yamuna-header-desktop {
  z-index: 40000 !important;
}

#nav-filters.yamuna-plp-filters-modal.modal-show {
  left: 0 !important;
}

body.template-category,
body.template-search {
  scrollbar-gutter: stable;
}

body.template-category .yamuna-plp-body,
body.template-search .yamuna-plp-body {
  margin-top: 0;
  padding-top: 0;
}

body.template-category .category-controls,
body.template-search .category-controls {
  position: relative;
  z-index: auto;
  display: flex;
  width: min(1312px, calc(100% - 48px));
  min-height: 0;
  margin: 0 auto;
  padding: 48px 0 !important;
  align-items: center;
  justify-content: flex-start;
}

body.template-category .category-controls .row,
body.template-search .category-controls .row {
  position: relative;
  display: flex;
  width: 100%;
  min-height: 42px;
  margin: 0 !important;
  align-items: center;
  justify-content: flex-start;
}

body.template-category .category-controls .row > .col-auto,
body.template-search .category-controls .row > .col-auto {
  position: relative;
  z-index: 2;
  width: auto;
  margin: 0;
  padding: 0;
  flex: 0 0 auto;
}

body.template-category .yamuna-plp-sort,
body.template-search .yamuna-plp-sort {
  position: absolute;
  top: 50%;
  right: 0;
  left: auto;
  z-index: 1;
  width: auto !important;
  max-width: none !important;
  margin: 0;
  padding: 0;
  flex: 0 0 auto !important;
  transform: translateY(-50%);
}

@media (min-width: 1024px) {
  body.template-category .category-controls,
  body.template-search .category-controls {
    width: min(1312px, calc(100% - 48px));
    max-width: 1312px;
    margin: 0 auto;
    padding: 48px 0 !important;
  }
}

{# Keep every desktop PLP section on the same content axis as the header and hero. #}
@media (min-width: 1024px) {
  body.template-category .yamuna-plp-hero,
  body.template-category .category-controls,
  body.template-category .yamuna-plp-body > .container,
  body.template-search .yamuna-plp-hero,
  body.template-search .category-controls,
  body.template-search .yamuna-plp-body > .container {
    width: min(1312px, calc(100% - 48px));
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

  {# Hero arrows: keep glass circle cards; enlarge/thicken chevron inside. #}
  body.template-home .js-home-main-slider-container .js-swiper-home-prev,
  body.template-home .js-home-main-slider-container .js-swiper-home-next {
    top: 50%;
    z-index: 6;
    display: flex !important;
    width: 48px !important;
    height: 48px !important;
    min-width: 48px !important;
    min-height: 48px !important;
    margin-top: -24px !important;
    padding: 0 !important;
    align-items: center;
    justify-content: center;
    border: 1px solid rgba(255, 255, 255, 0.55) !important;
    border-radius: 50% !important;
    background: rgba(255, 255, 255, 0.42) !important;
    background-color: rgba(255, 255, 255, 0.42) !important;
    background-image: none !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
    line-height: 0;
    color: #238482 !important;
    fill: #238482 !important;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-prev:after,
  body.template-home .js-home-main-slider-container .js-swiper-home-next:after,
  body.template-home .js-home-main-slider-container .js-swiper-home-prev:before,
  body.template-home .js-home-main-slider-container .js-swiper-home-next:before,
  body.template-home .js-home-main-slider-container .swiper-button-prev:after,
  body.template-home .js-home-main-slider-container .swiper-button-next:after,
  body.template-home .js-home-main-slider-container .swiper-button-prev:before,
  body.template-home .js-home-main-slider-container .swiper-button-next:before {
    display: none !important;
    content: none !important;
    width: 0 !important;
    height: 0 !important;
    font-size: 0 !important;
    opacity: 0 !important;
    background: none !important;
    background-image: none !important;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-prev {
    left: max(20px, calc((100% - 1280px) / 2));
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-next {
    right: max(20px, calc((100% - 1280px) / 2));
  }

  body.template-home .yamuna-home-hero-arrow-icon,
  body.template-home .js-home-main-slider-container .js-swiper-home-prev .icon-inline,
  body.template-home .js-home-main-slider-container .js-swiper-home-next .icon-inline,
  body.template-home .js-home-main-slider-container .js-swiper-home-prev svg,
  body.template-home .js-home-main-slider-container .js-swiper-home-next svg {
    display: block !important;
    width: 22px !important;
    height: 22px !important;
    color: #238482 !important;
    fill: #238482 !important;
    filter: none !important;
  }

  body.template-home .js-home-main-slider-container .js-swiper-home-prev .yamuna-home-hero-arrow-icon,
  body.template-home .js-home-main-slider-container .js-swiper-home-prev .icon-inline {
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
    right: auto;
    bottom: 40px;
    left: 0;
    z-index: 4;
    display: flex;
    width: min(282px, calc(100% - 16px));
    min-width: 0;
    height: auto;
    min-height: 170px;
    padding: 16px;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    color: #4a1d3a;
    border-radius: 0 24px 24px 0;
    background: #fff;
    box-sizing: border-box;
  }

  body.template-home .yamuna-home-hero-overlay-title {
    position: static;
    top: auto;
    left: auto;
    width: 100%;
    max-width: 250px;
    margin: 0 0 4px;
    color: #a31460;
    font-family: 'Raleway', sans-serif;
    font-size: 20px;
    font-weight: 800;
    line-height: 1.2;
    text-align: left;
    white-space: normal;
  }

  body.template-home .yamuna-home-hero-overlay-description {
    position: static;
    top: auto;
    left: auto;
    width: 100%;
    max-width: 250px;
    margin: 0 0 12px;
    color: #4a1d3a;
    font-family: 'Dosis', sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.3;
    opacity: 1;
    text-align: left;
  }

  body.template-home .yamuna-home-hero-copy-desktop {
    display: none;
  }

  body.template-home .yamuna-home-hero-copy-mobile {
    display: inline;
  }

  body.template-home .yamuna-home-hero-overlay-button {
    position: static;
    top: auto;
    left: auto;
    display: inline-flex;
    width: auto;
    min-width: 0;
    min-height: 38px;
    height: 38px;
    padding: 8px 32px;
    align-items: center;
    justify-content: center;
    color: #fff;
    border-radius: 24px;
    background: #238482;
    font-family: 'Raleway', sans-serif;
    font-size: 14px;
    font-weight: 700;
    line-height: 1;
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
    margin: 0 auto;
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
    margin: 0 auto;
    padding: 32px 0;
  }

  body.template-category .category-controls .row,
  body.template-search .category-controls .row {
    display: flex;
    min-height: 30px;
    margin: 0;
    align-items: center;
    justify-content: flex-start;
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
    min-height: 40px;
    font-size: 14px;
  }
}

{# PLP mobile fine tuning ? Figma node 784:8733 (320px). #}
@media (max-width: 1023px) {
  body.template-category .yamuna-plp-hero,
  body.template-search .yamuna-plp-hero {
    margin-bottom: 0;
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
    min-height: 40px;
    height: 40px;
    padding: 0 16px;
    gap: 8px;
    flex-wrap: nowrap;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 1;
    white-space: nowrap;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-one {
    height: 40px;
    min-height: 40px;
    font-family: 'Raleway', sans-serif;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
    height: 42px;
    min-height: 42px;
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
    width: min(1312px, calc(100% - 48px)) !important;
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
@media (min-width: 1360px) {
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

@media (min-width: 1360px) {
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

@media (min-width: 1360px) {
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

@media (min-width: 1360px) {
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
    width: min(1312px, calc(100% - 80px)) !important;
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
    background: #a31460 !important;
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
    width: min(1312px, calc(100% - 48px)) !important;
    height: 80px !important;
    min-height: 80px !important;
    margin: 25px auto 0 !important;
    padding: 0 !important;
  }

  body[class] .head-main .yamuna-header-desktop::before {
    top: 0 !important;
    bottom: 0 !important;
    left: 224px !important;
    border-radius: 54px !important;
    background: #a31460 !important;
    box-shadow: 4px 4px 4px -2px rgba(0, 0, 0, .25) !important;
  }

  body[class] .head-main.compress .yamuna-header-desktop::before {
    top: 0 !important;
    bottom: 0 !important;
    left: 0 !important;
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

{# Single desktop header geometry: the 1312px shell stays aligned with the
   page; the magenta capsule starts inset and stretches left on scroll to
   wrap the logo. #}
@media (min-width: 1024px) {
  body[class] .head-main .yamuna-header-desktop,
  body[class] .head-main.compress .yamuna-header-desktop,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop {
    position: relative !important;
    display: block !important;
    width: min(1312px, calc(100% - 48px)) !important;
    max-width: 1312px !important;
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

  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop::before,
  body[class] .head-main.compress .yamuna-header-desktop::before {
    left: 0 !important;
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
    visibility: visible !important;
    display: block !important;
  }
  body[class] .head-main .yamuna-header-logo-scrolled {
    opacity: 0 !important;
    transform: scale(0.92) !important;
    visibility: hidden !important;
    display: block !important;
  }
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-logo-default {
    opacity: 0 !important;
    transform: scale(0.92) !important;
    visibility: hidden !important;
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
    right: 20px !important;
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
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-utilities { right: 20px !important; width: 124px !important; }
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
@media (min-width: 1360px) {
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
    column-gap: 16px !important;
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
    color: #393747 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 500 !important;
    line-height: 1.3 !important;
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
    font-size: 14px !important;
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
    gap: 18px !important;
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


{# PDP page canvas - Figma uses #F6F6F6 behind gallery, related, reviews, etc. #}
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
  /* CTAs are in normal flow below - no absolute reserve needed. */
  padding: 5px 15px 0 !important;
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

/* Figma product v6 / 838:4078: price + installments on one row. */
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-price-row {
  display: flex !important;
  flex-direction: row !important;
  flex-wrap: nowrap !important;
  align-items: baseline !important;
  justify-content: flex-start !important;
  gap: 8px !important;
  width: 100% !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-price-row > :empty {
  display: none !important;
}

body.template-product .yamuna-pdp-related .item-price-container {
  display: inline-flex !important;
  margin: 0 !important;
  padding: 0 !important;
  width: auto !important;
  flex: 0 0 auto;
}

body.template-product .yamuna-pdp-related .item-price {
  color: #4a1d3a !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 20px !important;
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
  display: inline-block !important;
  margin: 0 !important;
  padding: 0 !important;
  color: #9e929e !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 14px !important;
  font-weight: 400 !important;
  line-height: normal !important;
  white-space: nowrap;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-payment {
  width: auto;
  flex: 0 1 auto;
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
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
  /* Figma product v6: 13px gap price->CTA, 15px sides, 32px bottom. Flow layout
     so price never collides with absolute CTAs. Overrides theme item-rounded hover. */
  position: relative !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  width: auto !important;
  display: flex !important;
  flex-direction: column;
  align-items: stretch;
  height: auto !important;
  margin: 13px 15px 32px !important;
  padding: 0 !important;
  visibility: visible !important;
  opacity: 1 !important;
  gap: 8px;
}

body.template-product .yamuna-pdp-related .item-actions > div:first-child {
  display: flex;
  flex-direction: column;
  align-items: stretch;
  flex: 0 0 100% !important;
  width: 100% !important;
  max-width: 100% !important;
  padding: 0 !important;
  gap: 8px;
}

body.template-product .yamuna-pdp-related .item-actions form.js-product-form {
  display: flex;
  flex-direction: column;
  align-items: stretch;
  width: 100%;
  max-width: none;
  gap: 8px;
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

/* Figma btn-vitrine: full card width (360 in 380), h37, radius ~23/27 */
body.template-product .yamuna-pdp-related .item-actions .btn,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three {
  display: flex !important;
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: none !important;
  height: 37px !important;
  min-height: 37px !important;
  margin: 0 !important;
  padding: 0 24px !important;
  align-items: center !important;
  justify-content: center !important;
  gap: 8px !important;
  border-radius: 23px !important;
  line-height: normal !important;
  text-align: center !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-bag {
  display: block !important;
  width: 14px !important;
  height: 14px !important;
  flex: 0 0 14px !important;
  margin: 0 !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one {
  border: 0 !important;
  color: #fff !important;
  background: #238482 !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 14px !important;
  font-weight: 600 !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one span {
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 14px !important;
  font-weight: 600 !important;
  line-height: normal !important;
  text-transform: uppercase !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three {
  border: 1px solid #238482 !important;
  color: #238482 !important;
  background: #fff !important;
  border-radius: 27px !important;
  font-family: 'Roboto', sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-label {
  display: inline-flex !important;
  align-items: baseline !important;
  color: #238482 !important;
  font-family: 'Roboto', sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
  line-height: normal !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-prefix,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-price {
  color: inherit !important;
  font-family: inherit !important;
  font-size: inherit !important;
  font-weight: 500 !important;
  line-height: inherit !important;
}

body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-price {
  font-weight: 600 !important;
}

/* Anchor arrows to the product track ? keep them over the first/last cards. */
body.template-product .yamuna-pdp-related .products-section-container {
  position: relative;
  overflow: hidden;
}

body.template-product .yamuna-pdp-related .swiper-button-prev,
body.template-product .yamuna-pdp-related .swiper-button-next {
  display: flex;
  width: 40px;
  height: 40px;
  margin-top: 0;
  top: 220px;
  padding: 0;
  align-items: center;
  justify-content: center;
  color: #238482;
  fill: #238482;
  background: rgba(255, 255, 255, 0.42) !important;
  border: 1px solid rgba(255, 255, 255, 0.55) !important;
  border-radius: 50% !important;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
  backdrop-filter: blur(6px);
  -webkit-backdrop-filter: blur(6px);
  z-index: 5;
}

body.template-product .yamuna-pdp-related .swiper-button-prev {
  left: 20px;
}

body.template-product .yamuna-pdp-related .swiper-button-next {
  right: 20px;
}

body.template-product .yamuna-pdp-related .swiper-button-prev .icon-inline,
body.template-product .yamuna-pdp-related .swiper-button-next .icon-inline,
body.template-product .yamuna-pdp-related .swiper-button-prev svg,
body.template-product .yamuna-pdp-related .swiper-button-next svg {
  width: 18px;
  height: 18px;
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


{# Early gallery/stack bridge only. Centering overrides come AFTER the mobile
   PDP block so they win source order at 768-1359. #}
@media (min-width: 768px) and (max-width: 1359px) {
  body.template-product .yamuna-product-gallery-mobile > .row > .col-2.d-none.d-md-block {
    display: none !important;
  }

  body.template-product .yamuna-product-gallery-mobile .product-image-container {
    flex: 0 0 100% !important;
    width: 100% !important;
    max-width: 100% !important;
  }

  body.template-product .yamuna-product-gallery-mobile .js-swiper-product,
  body.template-product .yamuna-product-gallery-mobile .swiper-wrapper,
  body.template-product .yamuna-product-gallery-mobile .swiper-slide,
  body.template-product .yamuna-product-gallery-mobile .js-product-slide-link {
    height: 420px !important;
  }

  body.template-product .yamuna-product-gallery-mobile .product-slider-image,
  body.template-product .yamuna-product-gallery-mobile .js-product-slide-img {
    object-fit: contain !important;
  }
}

@media (min-width: 1024px) and (max-width: 1359px) {
  body.template-product #single-product {
    padding-top: 120px !important;
  }

  body.template-product .yamuna-product-gallery-desktop {
    display: none !important;
  }

  body.template-product .yamuna-product-gallery-mobile {
    display: block !important;
  }

  body.template-product .section-single-product {
    display: block !important;
  }

  body.template-product .section-single-product > .yamuna-pdp-gallery-column,
  body.template-product .section-single-product > .yamuna-pdp-summary,
  body.template-product .section-single-product > .col-12,
  body.template-product .section-single-product > .col {
    flex: 0 0 100% !important;
    width: 100% !important;
    max-width: 100% !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }
}
{# ==========================================================================
   PDP MOBILE - Figma 853:9541 (320px)
   First pass: gallery, benefits, price cards, CTA, qty, CEP.
   ========================================================================== #}
@media (max-width: 1359px) {
  body.template-product {
    background-color: #f6f5f6 !important;
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
    border: 1px solid rgba(255, 255, 255, 0.55) !important;
    border-radius: 50% !important;
    background: rgba(255, 255, 255, 0.42) !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
    cursor: pointer;
    pointer-events: auto;
  }

  body.template-product .yamuna-product-gallery-mobile .yamuna-pdp-gallery-arrow::after {
    display: block;
    width: 8px;
    height: 8px;
    border: solid #238482;
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
    /* Keep dots off the right edge of the gallery / screen. */
    right: 24px !important;
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
    background: #a31460 !important;
  }

  body.template-product .yamuna-pdp-summary {
    padding: 0 12px !important;
    box-sizing: border-box !important;
  }

  /* Figma: 12px side inset via summary padding. Keep auto margins available for
     benefits/price-cards so they can center when narrower than the viewport. */
  body.template-product .yamuna-pdp-summary .page-header,
  body.template-product .yamuna-pdp-summary .page-header .container,
  body.template-product .yamuna-pdp-summary .page-header .row,
  body.template-product .yamuna-pdp-summary .breadcrumbs,
  body.template-product .yamuna-pdp-summary .js-product-name,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-rating,
  body.template-product .yamuna-pdp-summary #product_form,
  body.template-product .yamuna-pdp-summary #product-shipping-container,
  body.template-product .yamuna-pdp-summary .product-shipping-calculator,
  body.template-product .yamuna-pdp-summary .social-share {
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards {
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
    justify-content: center !important;
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

  /* Figma 853:9689 - Adicionar ? sacola (1 linha, ~122px de texto) */
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

  /* Figma 853:9693 - quantity selector */
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

  /* Figma 853:9700 / 9702 / 9705 / 9707 - CEP block */
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

  /* 853:9700 - label */
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

  /* 853:9702 + 853:9703 - input */
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

  /* 853:9705 + 853:9706 - BUSCAR */
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

  /* 853:9707 - N?o sei meu CEP */
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

  /* Shipping quotes list - match yamuna.com.br */
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

{# Final tablet/laptop PDP centering (after mobile block so it wins). #}
@media (min-width: 768px) and (max-width: 1359px) {
  body.template-product .yamuna-pdp-summary {
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 auto !important;
    padding: 0 24px !important;
    box-sizing: border-box !important;
  }

  body.template-product .yamuna-pdp-summary .page-header,
  body.template-product .yamuna-pdp-summary .page-header > div,
  body.template-product .yamuna-pdp-summary .page-header .container,
  body.template-product .yamuna-pdp-summary .page-header .row,
  body.template-product .yamuna-pdp-summary .page-header .col {
    display: block !important;
    width: 100% !important;
    max-width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .breadcrumbs,
  body.template-product .yamuna-pdp-summary .page-header .js-product-name,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-rating {
    width: 100% !important;
    max-width: 528px !important;
    margin-left: auto !important;
    margin-right: auto !important;
    text-align: center !important;
    justify-content: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-rating {
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits {
    display: flex !important;
    flex-wrap: wrap !important;
    justify-content: center !important;
    width: 100% !important;
    max-width: 528px !important;
    margin-left: auto !important;
    margin-right: auto !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    align-items: stretch !important;
    justify-content: center !important;
    width: 100% !important;
    max-width: 528px !important;
    margin: 24px auto !important;
    gap: 32px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card {
    width: 248px !important;
    min-width: 248px !important;
  }

  body.template-product .yamuna-pdp-summary #product_form,
  body.template-product .yamuna-pdp-summary #product-shipping-container,
  body.template-product .yamuna-pdp-summary .product-shipping-calculator {
    width: 100% !important;
    max-width: 528px !important;
    margin-left: auto !important;
    margin-right: auto !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    justify-content: center !important;
    width: 100% !important;
    max-width: 528px !important;
    margin-left: auto !important;
    margin-right: auto !important;
  }
}

/* ===== Yamuna pre-checkout cart page (matches yamuna.com.br/checkout) ===== */
html:has(body.template-cart),
body.template-cart {
  min-height: 100%;
  background: #f6f6f6 !important;
}

body.template-cart {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

body.template-cart > .yamuna-cart-wrap {
  flex: 1 0 auto;
  width: 100%;
  margin-top: 0 !important;
  background: #f6f6f6;
}

/* Logo-only checkout header */
body.template-cart .yamuna-cart-checkout-header {
  display: flex !important;
  visibility: visible !important;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
  width: 100%;
  padding: 40px 40px 24px;
  background: #f6f6f6;
}

body.template-cart .yamuna-cart-checkout-logo-link {
  display: inline-flex;
  line-height: 0;
}

body.template-cart .yamuna-cart-checkout-logo {
  display: block;
  width: 138px;
  height: 112px;
  max-width: 160px;
  object-fit: contain;
}

body.template-cart .yamuna-cart-page {
  display: block !important;
  visibility: visible !important;
  box-sizing: border-box;
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 32px 24px 0;
}

body.template-cart .yamuna-cart-page-inner {
  position: relative;
  display: block !important;
  visibility: visible !important;
  width: 100%;
  max-width: 1152px;
  margin: 0 auto;
}

body.template-cart .yamuna-cart-nav {
  display: flex !important;
  visibility: visible !important;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  margin: 0 0 20px;
}

body.template-cart .yamuna-cart-page-back {
  display: inline-block;
  flex: 0 0 auto;
  min-width: 72px;
  color: #4a1d3a;
  font-family: Poppins, Raleway, sans-serif;
  font-size: 16px;
  font-weight: 600;
  line-height: 24px;
  text-decoration: underline;
}

body.template-cart .yamuna-cart-page-back:hover {
  color: #4a1d3a;
  text-decoration: underline;
  opacity: 0.85;
}

body.template-cart .yamuna-cart-page-title {
  flex: 1 1 auto;
  margin: 0;
  color: #a31460;
  font-family: Raleway, Roboto, Arial, sans-serif;
  font-size: 24px;
  font-weight: 700;
  letter-spacing: 1.2px;
  line-height: 1.25;
  text-align: center;
  text-transform: uppercase;
}

body.template-cart .yamuna-cart-nav-spacer {
  display: block;
  flex: 0 0 auto;
  min-width: 72px;
}

body.template-cart .yamuna-cart-table {
  display: block !important;
  visibility: visible !important;
  overflow: visible;
  border: 0;
  border-radius: 0;
  background: transparent;
  box-shadow: none;
}

body.template-cart .yamuna-cart-table-head {
  display: grid !important;
  grid-template-columns: 32px 85px minmax(140px, 1fr) 120px 150px 160px;
  gap: 12px;
  align-items: center;
  min-height: 45px;
  height: 45px;
  padding: 0 20px;
  background: #c388a2;
  border-radius: 4px 4px 0 0;
  color: #4a1d3a;
  font-family: Raleway, Roboto, Arial, sans-serif;
  font-size: 14px;
  font-weight: 700;
  letter-spacing: 0.56px;
  text-transform: uppercase;
}

body.template-cart .yamuna-cart-col-desc {
  grid-column: 2 / 4;
  padding: 0;
  text-align: left;
}

body.template-cart .yamuna-cart-col-qty,
body.template-cart .yamuna-cart-col-unit {
  padding: 0;
  text-align: center;
}

body.template-cart .yamuna-cart-col-total {
  padding: 0;
  text-align: right;
}

body.template-cart .yamuna-cart-table-body {
  display: block !important;
  visibility: visible !important;
  padding: 0;
  background: #fff;
  border-radius: 0 0 4px 4px;
}

body.template-cart .yamuna-cart-row {
  display: grid !important;
  visibility: visible !important;
  grid-template-columns: 32px 85px minmax(140px, 1fr) 120px 150px 160px;
  gap: 12px;
  align-items: center;
  min-height: 117px;
  padding: 16px 20px;
  border-bottom: 1px solid #e6e2e6;
  position: relative;
  background: #fff;
}

body.template-cart .yamuna-cart-row:last-child {
  border-bottom: 0;
}

body.template-cart .yamuna-cart-row-delete,
body.template-cart .yamuna-cart-row .cart-item-delete {
  position: static !important;
  top: auto !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  display: flex;
  align-items: center;
  justify-content: center;
}

body.template-cart .yamuna-cart-row-delete .btn {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 24px;
  height: 24px;
  margin: 0;
  padding: 0;
  border: 0;
  background: transparent;
}

body.template-cart .yamuna-cart-row-delete .yamuna-cart-trash-icon {
  display: block;
  width: 23px;
  height: 24px;
}

body.template-cart .yamuna-cart-row-image {
  display: block;
  width: 85px;
  height: 85px;
  overflow: hidden;
}

body.template-cart .yamuna-cart-row-image img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

body.template-cart .yamuna-cart-row-desc {
  min-width: 0;
  color: #393747;
  font-family: Roboto, Arial, sans-serif;
  font-size: 14px;
  font-weight: 600;
  line-height: 1.25;
}

body.template-cart .yamuna-cart-row-desc a {
  color: #393747;
  text-decoration: none;
}

body.template-cart .yamuna-cart-row-desc small {
  display: block;
  margin-top: 2px;
  color: #5f5d5f;
  font-size: 12px;
  font-weight: 400;
}

body.template-cart .yamuna-cart-row-qty {
  display: flex;
  justify-content: center;
}

{# Qty pill ? prod /checkout (96x36, border #d1d1d1) #}
body.template-cart .yamuna-cart-page-qty.form-quantity,
body.template-cart .yamuna-cart-page-qty.form-group {
  display: flex !important;
  flex-direction: row !important;
  flex-wrap: nowrap !important;
  align-items: stretch !important;
  box-sizing: border-box !important;
  width: 96px !important;
  max-width: 96px !important;
  min-width: 96px !important;
  height: 36px !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  border: 1px solid #d1d1d1 !important;
  border-radius: 999px !important;
  background: #fff !important;
  gap: 0 !important;
}

body.template-cart .yamuna-cart-page-qty .yamuna-cart-page-qty-field,
body.template-cart .yamuna-cart-page-qty .form-control-container {
  display: flex !important;
  flex: 1 1 auto !important;
  align-items: stretch !important;
  box-sizing: border-box !important;
  width: auto !important;
  max-width: none !important;
  min-width: 0 !important;
  height: 34px !important;
  margin: 0 !important;
  padding: 0 !important;
  float: none !important;
  position: static !important;
}

body.template-cart .yamuna-cart-page-qty .form-quantity-icon.btn,
body.template-cart .yamuna-cart-page-qty .yamuna-cart-minus,
body.template-cart .yamuna-cart-page-qty .yamuna-cart-plus {
  display: flex !important;
  flex: 0 0 32px !important;
  align-items: center !important;
  justify-content: center !important;
  box-sizing: border-box !important;
  width: 32px !important;
  min-width: 32px !important;
  max-width: 32px !important;
  height: 34px !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  background: #f4f4f4 !important;
  box-shadow: none !important;
  color: #393747 !important;
  line-height: 1 !important;
  cursor: pointer !important;
}

body.template-cart .yamuna-cart-page-qty .yamuna-cart-minus {
  border-radius: 999px 0 0 999px !important;
}

body.template-cart .yamuna-cart-page-qty .yamuna-cart-plus {
  border-radius: 0 999px 999px 0 !important;
}

body.template-cart .yamuna-cart-page-qty .form-control,
body.template-cart .yamuna-cart-page-qty .js-cart-quantity-input {
  display: block !important;
  box-sizing: border-box !important;
  width: 100% !important;
  min-width: 0 !important;
  max-width: none !important;
  height: 34px !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 0 !important;
  background: #fff !important;
  box-shadow: none !important;
  color: #393747 !important;
  font-family: Roboto, Inter, Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 400 !important;
  line-height: 34px !important;
  text-align: center !important;
  -moz-appearance: textfield;
}

body.template-cart .yamuna-cart-page-qty .js-cart-quantity-input::-webkit-outer-spin-button,
body.template-cart .yamuna-cart-page-qty .js-cart-quantity-input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

body.template-cart .yamuna-cart-page-qty .cart-item-spinner {
  display: none !important;
  width: 0 !important;
  height: 0 !important;
  overflow: hidden !important;
}

body.template-cart .yamuna-cart-page-qty .form-quantity-icon svg,
body.template-cart .yamuna-cart-page-qty .form-quantity-icon use {
  width: 12px !important;
  height: 12px !important;
  fill: #393747 !important;
  color: #393747 !important;
}

body.template-cart .yamuna-cart-row-unit,
body.template-cart .yamuna-cart-row-total {
  text-align: center;
}

body.template-cart .yamuna-cart-row-total {
  text-align: right;
}

body.template-cart .yamuna-cart-row-price {
  color: #238482;
  font-family: Roboto, Arial, sans-serif;
  font-size: 16px;
  font-weight: 700;
  line-height: 1.3;
}

body.template-cart .yamuna-cart-row-price-compare {
  color: #4f4f4f;
  font-family: Roboto, Arial, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 1.3;
  text-decoration: line-through;
}

body.template-cart .yamuna-cart-row-installments {
  margin-top: 4px;
  color: #5f5d5f;
  font-family: Poppins, Roboto, Arial, sans-serif;
  font-size: 12px;
  font-weight: 300;
  line-height: 1.1;
}

body.template-cart .yamuna-cart-page-actions {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-end;
  gap: 24px;
  margin-top: 48px;
}

body.template-cart .yamuna-cart-page-continue,
body.template-cart .yamuna-cart-page-checkout {
  box-sizing: border-box;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  max-width: 352px;
  height: 40px;
  margin: 0;
  padding: 0 16px;
  border-radius: 100px;
  font-family: Raleway, Roboto, Arial, sans-serif;
  font-size: 16px;
  line-height: 1;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  cursor: pointer;
  appearance: none;
}

body.template-cart .yamuna-cart-page-continue {
  border: 2px solid #a31460;
  background: transparent;
  color: #a31460;
  font-weight: 500;
}

body.template-cart .yamuna-cart-page-checkout {
  border: 2px solid #238482;
  background: #238482;
  color: #fff;
  font-weight: 600;
}

body.template-cart .yamuna-cart-page-continue:hover {
  color: #a31460;
  text-decoration: none;
  opacity: 0.9;
}

body.template-cart .yamuna-cart-page-checkout:hover {
  background: #1e7270;
  border-color: #1e7270;
  color: #fff;
}

body.template-cart .yamuna-cart-page-empty {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 12px;
  padding: 56px 16px 40px;
  text-align: center;
}

body.template-cart .yamuna-cart-page-empty-icon {
  display: block;
  width: 127px;
  height: 120px;
  margin: 0 0 8px;
}

body.template-cart .yamuna-cart-page-empty-title {
  margin: 0;
  color: #4a1d3a;
  font-family: Raleway, Roboto, Arial, sans-serif;
  font-size: 24px;
  font-weight: 700;
  line-height: 1.25;
}

body.template-cart .yamuna-cart-page-empty-subtitle {
  margin: 0 0 16px;
  color: #5f5d5f;
  font-family: Poppins, Roboto, Arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 1.4;
}

body.template-cart .yamuna-cart-page-empty-continue {
  max-width: 280px;
}

body.template-cart .yamuna-cart-page-platform-totals {
  display: none !important;
}

/* Order summary ? production checkout has none; keep hidden */
body.template-cart .yamuna-cart-page-summary {
  display: none !important;
}

body.template-cart .yamuna-cart-page-validation {
  margin-top: 16px;
}

/* Extras: recommendations + depositions */
body.template-cart .yamuna-checkout-extras {
  box-sizing: border-box;
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px 48px;
}

body.template-cart .yamuna-cart-recommendations {
  margin: 48px 0 40px;
}

body.template-cart .yamuna-cart-recommendations-title {
  margin: 0 0 32px;
  color: #a31460;
  font-family: Roboto, sans-serif;
  font-size: 32px;
  font-weight: 500;
  line-height: 1.2;
  text-align: center;
  text-transform: uppercase;
}

body.template-cart .yamuna-cart-recommendations-carousel-wrapper {
  position: relative;
  padding-bottom: 52px;
}

body.template-cart .yamuna-cart-recommendations-carousel {
  overflow: hidden;
  padding-bottom: 0;
}

/* Prod: small teal chevrons under first card, left-aligned (not side circles) */
body.template-cart .yamuna-cart-reco-prev,
body.template-cart .yamuna-cart-reco-next {
  position: absolute;
  top: auto;
  bottom: 0;
  z-index: 2;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 28px;
  height: 44px;
  margin: 0;
  padding: 0;
  border: 0;
  border-radius: 0;
  background: transparent;
  box-shadow: none;
  cursor: pointer;
}

body.template-cart .yamuna-cart-reco-prev {
  left: 0;
}

body.template-cart .yamuna-cart-reco-next {
  left: 36px;
  right: auto;
  background-image: none;
}

body.template-cart .yamuna-cart-reco-prev img,
body.template-cart .yamuna-cart-reco-next img {
  display: block;
  width: 12px;
  height: 20px;
}

body.template-cart .yamuna-cart-reco-prev.swiper-button-disabled,
body.template-cart .yamuna-cart-reco-next.swiper-button-disabled {
  opacity: 0.35;
  cursor: default;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-one,
body.template-cart .yamuna-cart-recommendations .yamuna-home-spot-buy-one {
  background: #238482 !important;
  color: #fff !important;
  border: 0 !important;
  border-radius: 23px !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three,
body.template-cart .yamuna-cart-recommendations .yamuna-home-spot-buy-three {
  color: #238482 !important;
  border: 1px solid #238482 !important;
  border-radius: 23px !important;
  background: transparent !important;
}

/* Force spot CTAs visible (theme hides .item-actions until hover) */
body.template-cart .yamuna-cart-recommendations .item-actions {
  position: relative !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  width: 100% !important;
  max-width: 242px !important;
  display: flex !important;
  flex-direction: column !important;
  align-items: stretch !important;
  height: auto !important;
  margin: auto auto 12px !important;
  margin-top: auto !important;
  padding: 16px 0 0 !important;
  visibility: visible !important;
  opacity: 1 !important;
  gap: 8px !important;
}

body.template-cart .yamuna-cart-recommendations .item-actions > div:first-child {
  display: flex !important;
  flex-direction: column !important;
  align-items: stretch !important;
  flex: 0 0 100% !important;
  width: 100% !important;
  max-width: 100% !important;
  padding: 0 !important;
  visibility: visible !important;
  opacity: 1 !important;
  gap: 8px !important;
}

body.template-cart .yamuna-cart-recommendations .item-actions form.js-product-form {
  display: flex !important;
  flex-direction: column !important;
  width: 100% !important;
  gap: 8px !important;
  margin: 0 !important;
  visibility: visible !important;
  opacity: 1 !important;
}

body.template-cart .yamuna-cart-recommendations .item-actions > div:last-child {
  display: none !important;
}

/* COMPRAR ? prod: Raleway 14/600, h37, radius 23, cursor pointer */
body.template-cart .yamuna-cart-recommendations .item-actions .btn,
body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-one,
body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three,
body.template-cart .yamuna-cart-recommendations .item-actions button,
body.template-cart .yamuna-cart-recommendations .item-actions a {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  visibility: visible !important;
  opacity: 1 !important;
  box-sizing: border-box !important;
  width: 100% !important;
  min-height: 37px !important;
  height: 37px !important;
  margin: 0 !important;
  padding: 0 10px !important;
  border-radius: 23px !important;
  font-family: Raleway, sans-serif !important;
  font-size: 14px !important;
  font-weight: 600 !important;
  letter-spacing: normal !important;
  line-height: 1.15 !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
  cursor: pointer !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-one,
body.template-cart .yamuna-cart-recommendations .item-actions .btn-primary {
  background: #238482 !important;
  border: 0 !important;
  color: #fff !important;
  gap: 6px !important;
  font-size: 14px !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-one span {
  display: inline-flex !important;
  align-items: center !important;
  color: #fff !important;
  font-family: Raleway, sans-serif !important;
  font-size: 14px !important;
  font-weight: 600 !important;
  line-height: 1.15 !important;
  text-transform: uppercase !important;
  cursor: pointer !important;
}

/* COMPRE 3 ? always ONE line; fixed h37 so spots stay equal height */
body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three,
body.template-cart .yamuna-cart-recommendations .item-actions .btn-secondary {
  background: transparent !important;
  border: 1px solid #238482 !important;
  color: #238482 !important;
  height: 37px !important;
  min-height: 37px !important;
  max-height: 37px !important;
  padding: 0 6px !important;
  overflow: hidden !important;
  white-space: nowrap !important;
  flex-wrap: nowrap !important;
  gap: 4px !important;
  font-size: 12px !important;
  font-weight: 600 !important;
  line-height: 1 !important;
  cursor: pointer !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three *,
body.template-cart .yamuna-cart-recommendations .item-actions .btn-secondary * {
  white-space: nowrap !important;
  flex-wrap: nowrap !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-label {
  display: inline-flex !important;
  flex-direction: row !important;
  flex-wrap: nowrap !important;
  align-items: center !important;
  justify-content: center !important;
  gap: 3px !important;
  margin: 0 !important;
  padding: 0 !important;
  min-width: 0 !important;
  max-width: 100% !important;
  overflow: hidden !important;
  line-height: 1 !important;
  text-align: center !important;
  white-space: nowrap !important;
  text-overflow: ellipsis !important;
  cursor: pointer !important;
  color: #238482 !important;
  font-family: Raleway, sans-serif !important;
  font-size: inherit !important;
  font-weight: 600 !important;
  text-transform: uppercase !important;
  vertical-align: middle !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-prefix {
  display: inline !important;
  flex-shrink: 0 !important;
  color: #238482 !important;
  font-family: Raleway, sans-serif !important;
  font-size: inherit !important;
  font-weight: 600 !important;
  letter-spacing: normal !important;
  line-height: 1 !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
  cursor: pointer !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-price {
  display: inline !important;
  min-width: 0 !important;
  overflow: hidden !important;
  color: #238482 !important;
  font-family: Raleway, sans-serif !important;
  font-size: inherit !important;
  font-weight: 600 !important;
  letter-spacing: normal !important;
  line-height: 1 !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
  text-overflow: ellipsis !important;
  cursor: pointer !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-bag,
body.template-cart .yamuna-cart-recommendations .yamuna-home-spot-bag {
  display: block !important;
  width: 14px !important;
  height: 14px !important;
  margin: 0 !important;
  padding: 0 !important;
  flex-shrink: 0 !important;
  align-self: center !important;
  pointer-events: none !important;
}

body.template-cart .yamuna-cart-recommendations .swiper-container,
body.template-cart .yamuna-cart-recommendations .swiper-wrapper,
body.template-cart .yamuna-cart-recommendations .swiper-slide {
  cursor: default !important;
}

body.template-cart .yamuna-cart-recommendations .swiper-wrapper {
  align-items: stretch !important;
}

body.template-cart .yamuna-cart-recommendations .js-product-container,
body.template-cart .yamuna-cart-recommendations .js-quickshop-container {
  display: flex !important;
  flex-direction: column !important;
  flex: 1 1 auto !important;
  height: 100% !important;
  width: 100% !important;
}

body.template-cart .yamuna-cart-recommendations .item-actions,
body.template-cart .yamuna-cart-recommendations .item-actions form,
body.template-cart .yamuna-cart-recommendations .item-actions button,
body.template-cart .yamuna-cart-recommendations .item-actions span,
body.template-cart .yamuna-cart-recommendations .item-actions img {
  cursor: pointer !important;
}

body.template-cart .yamuna-cart-recommendations .swiper-slide {
  height: auto !important;
  box-sizing: border-box !important;
  display: flex !important;
}

body.template-cart .yamuna-cart-recommendations .item.item-product {
  display: flex !important;
  flex-direction: column !important;
  align-items: center !important;
  flex: 1 1 auto !important;
  height: 100% !important;
  min-height: 100% !important;
  overflow: hidden;
  width: 100% !important;
  max-width: 276px;
  margin: 0 auto;
  padding: 0 8px 12px !important;
  border: 0 !important;
  border-radius: 6px !important;
  background: #fff !important;
  box-shadow: none !important;
  text-align: center;
}

body.template-cart .yamuna-cart-recommendations .js-product-container,
body.template-cart .yamuna-cart-recommendations .js-quickshop-container,
body.template-cart .yamuna-cart-recommendations .product-item-image-container {
  display: block !important;
  width: 100% !important;
  max-width: 100% !important;
}

/* Image spot ? prod ~234x234 square, fill card width */
body.template-cart .yamuna-cart-recommendations .item-image {
  position: relative !important;
  display: block !important;
  box-sizing: border-box !important;
  align-self: center !important;
  flex: 0 0 auto !important;
  width: 100% !important;
  max-width: 234px !important;
  height: auto !important;
  min-height: 0 !important;
  margin: 8px auto 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  border: 0 !important;
  border-radius: 8px !important;
  background: #fff !important;
  aspect-ratio: 1 / 1 !important;
}

body.template-cart .yamuna-cart-recommendations .item-image img,
body.template-cart .yamuna-cart-recommendations .item-image .js-item-image,
body.template-cart .yamuna-cart-recommendations .item-image .product-item-image,
body.template-cart .yamuna-cart-recommendations .item-image .img-absolute,
body.template-cart .yamuna-cart-recommendations .item-image .img-absolute-centered {
  position: absolute !important;
  top: 0 !important;
  left: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  display: block !important;
  width: 100% !important;
  height: 100% !important;
  max-width: none !important;
  max-height: none !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 8px !important;
  object-fit: fill !important;
  object-position: center center !important;
  transform: none !important;
  -webkit-transform: none !important;
  -ms-transform: none !important;
  text-indent: 0 !important;
  opacity: 1 !important;
  visibility: visible !important;
  background: #fff !important;
}

/* Kill theme .img-absolute-centered translateX(-50%) if class still present */
body.template-cart .yamuna-cart-recommendations .item-image .img-absolute-centered {
  left: 0 !important;
  transform: none !important;
  -webkit-transform: none !important;
  -ms-transform: none !important;
}

/* Remove Nuvemshop padding-bottom aspect hack ? we already use aspect-ratio */
body.template-cart .yamuna-cart-recommendations .item-image > div[style*="padding-bottom"] {
  position: absolute !important;
  inset: 0 !important;
  width: 100% !important;
  height: 100% !important;
  padding: 0 !important;
  margin: 0 !important;
}

body.template-cart .yamuna-cart-recommendations .item-image .js-product-item-image-link-private {
  position: absolute !important;
  inset: 0 !important;
  display: block !important;
  width: 100% !important;
  height: 100% !important;
}

/* Hide hover secondary image that can flash/misalign like prod primary static fill */
body.template-cart .yamuna-cart-recommendations .item-image .item-image-secondary,
body.template-cart .yamuna-cart-recommendations .item-image img.item-image-secondary {
  display: none !important;
}

body.template-cart .yamuna-cart-recommendations .item-image a,
body.template-cart .yamuna-cart-recommendations .item-image {
  cursor: pointer !important;
}

body.template-cart .yamuna-cart-recommendations .item-description {
  display: flex !important;
  flex-direction: column !important;
  align-items: center !important;
  flex: 1 1 auto !important;
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: 242px !important;
  min-height: 0 !important;
  margin: 0 auto !important;
  padding: 8px 4px 0 !important;
  border-bottom: 0 !important;
  text-align: center !important;
}

/* Prod-like: clamp from the END (not center-clipped mid-string) */
body.template-cart .yamuna-cart-recommendations .item-name,
body.template-cart .yamuna-cart-recommendations .js-item-name,
body.template-cart .yamuna-cart-recommendations .item-name a,
body.template-cart .yamuna-cart-recommendations .js-item-name a {
  display: -webkit-box !important;
  -webkit-box-orient: vertical !important;
  -webkit-line-clamp: 1 !important;
  width: 100% !important;
  max-width: 100% !important;
  height: 22px !important;
  max-height: 22px !important;
  margin: 0 auto 4px !important;
  padding: 0 !important;
  overflow: hidden !important;
  color: #4a1d3a !important;
  font-family: Dosis, sans-serif !important;
  font-size: 18px !important;
  font-weight: 600 !important;
  line-height: 22px !important;
  text-align: center !important;
  text-decoration: none !important;
  text-overflow: ellipsis !important;
  white-space: normal !important;
  word-break: normal !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-price-row,
body.template-cart .yamuna-cart-recommendations .yamuna-home-spot-price-row {
  display: flex !important;
  flex-direction: column !important;
  align-items: center !important;
  gap: 2px !important;
  width: 100% !important;
  min-height: 48px !important;
}

body.template-cart .yamuna-cart-recommendations .item-price-container {
  display: flex !important;
  justify-content: center !important;
  width: 100% !important;
  margin: 0 !important;
}

body.template-cart .yamuna-cart-recommendations .item-price,
body.template-cart .yamuna-cart-recommendations .js-price-display {
  color: #4a1d3a !important;
  font-family: Dosis, sans-serif !important;
  font-size: 20px !important;
  font-weight: 600 !important;
  line-height: 1.2 !important;
  text-align: center !important;
}

body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-payment,
body.template-cart .yamuna-cart-recommendations .yamuna-home-spot-payment {
  display: block !important;
  box-sizing: border-box !important;
  width: 100% !important;
  height: 16px !important;
  max-height: 16px !important;
  margin: 0 !important;
  overflow: hidden !important;
  color: #9e929e !important;
  font-family: Dosis, sans-serif !important;
  font-size: 11px !important;
  font-weight: 400 !important;
  line-height: 16px !important;
  text-align: center !important;
  text-overflow: ellipsis !important;
  white-space: nowrap !important;
}

/* Depositions ? prod: white card, border #d9d9d9, teal icon #5fbbc6, left header */
body.template-cart .yamuna-cart-depositions {
  box-sizing: border-box;
  width: 100%;
  max-width: 1152px;
  margin: 40px auto 48px;
  padding: 16px 12px 20px;
  border: 1px solid #d9d9d9;
  border-radius: 16px;
  background: #fff;
}

body.template-cart .yamuna-cart-depositions-header {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 12px;
  margin-bottom: 20px;
  padding: 0 0 12px;
  border-bottom: 1px solid #ede8ed;
}

body.template-cart .yamuna-cart-depositions-icon-wrapper {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 24px;
  height: 24px;
  border-radius: 50%;
  background: #5fbbc6;
  flex-shrink: 0;
}

body.template-cart .yamuna-cart-depositions-title {
  margin: 0;
  color: #a31460;
  font-family: Raleway, sans-serif;
  font-size: 16px;
  font-weight: 700;
  line-height: 1.2;
}

body.template-cart .yamuna-cart-depositions-grid {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 16px;
}

body.template-cart .yamuna-cart-deposition-card {
  display: flex;
  flex-direction: column;
  gap: 10px;
  min-width: 0;
}

body.template-cart .yamuna-cart-deposition-stars {
  display: flex;
  gap: 2px;
}

body.template-cart .yamuna-cart-deposition-content p {
  margin: 0 0 10px;
  color: #393747;
  font-family: Poppins, Roboto, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 1.45;
  text-align: left;
}

body.template-cart .yamuna-cart-deposition-author {
  display: block;
  color: #393747;
  font-family: Raleway, sans-serif;
  font-size: 13px;
  font-weight: 700;
}

body.template-cart .yamuna-cart-depositions-nav {
  display: none;
  justify-content: center;
  gap: 12px;
  margin-top: 16px;
}

body.template-cart .yamuna-cart-dep-prev,
body.template-cart .yamuna-cart-dep-next {
  width: 32px;
  height: 32px;
  border: 0;
  border-radius: 50%;
  background: #238482 url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='15 18 9 12 15 6'/%3E%3C/svg%3E") center / 14px 14px no-repeat;
  cursor: pointer;
}

body.template-cart .yamuna-cart-dep-next {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='9 18 15 12 9 6'/%3E%3C/svg%3E");
}

/* Checkout footer */
body.template-cart .yamuna-cart-checkout-footer {
  width: 100%;
  margin-top: auto;
  background: #501735;
  color: #fff;
  font-family: Dosis, Raleway, sans-serif;
  flex-shrink: 0;
}

body.template-cart .yamuna-cart-checkout-footer-inner {
  box-sizing: border-box;
  width: min(100%, 1360px);
  margin: 0 auto;
  padding: 44px 24px 20px;
}

body.template-cart .yamuna-cart-checkout-footer-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: flex-start;
  column-gap: clamp(40px, 4vw, 72px);
  row-gap: 32px;
  width: min(100%, 1152px);
  margin: 0 auto;
  padding-bottom: 34px;
  border-bottom: 1px solid #a31460;
}

body.template-cart .yamuna-cart-checkout-footer-brand {
  display: inline-flex;
  width: 220px;
}

body.template-cart .yamuna-cart-checkout-footer-brand img {
  display: block;
  width: 100%;
  height: auto;
}

body.template-cart .yamuna-cart-checkout-footer-section h2 {
  margin: 0 0 14px;
  color: #fff;
  font-size: 16px;
  font-weight: 700;
  line-height: 1;
  text-transform: uppercase;
}

body.template-cart .yamuna-cart-checkout-footer-section ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

body.template-cart .yamuna-cart-checkout-footer-section li,
body.template-cart .yamuna-cart-checkout-footer-section a {
  color: #fff;
  font-size: 17px;
  font-weight: 300;
  line-height: 1.45;
  text-decoration: none;
}

body.template-cart .yamuna-cart-checkout-footer-payments-logos {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  max-width: 240px;
}

body.template-cart .yamuna-cart-checkout-footer-payments-logos img,
body.template-cart .yamuna-cart-checkout-footer-payments-logos svg {
  max-height: 28px;
  width: auto;
}

body.template-cart .yamuna-cart-checkout-footer-security {
  text-align: right;
}

body.template-cart .yamuna-cart-checkout-footer-security-logos {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-end;
  gap: 14px 18px;
  max-width: 280px;
}

body.template-cart .yamuna-cart-checkout-footer-security-logos img {
  max-width: 136px;
  max-height: 52px;
}

body.template-cart .yamuna-cart-checkout-footer-bottom {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
  width: min(100%, 1152px);
  margin: 0 auto;
  padding-top: 20px;
}

body.template-cart .yamuna-cart-checkout-footer-bottom p {
  max-width: 820px;
  margin: 0;
  color: #fff;
  font-size: 12px;
  font-weight: 300;
  line-height: 1.3;
}

@media (max-width: 1279px) {
  body.template-cart .yamuna-cart-recommendations .item-actions {
    max-width: 100% !important;
  }

  body.template-cart .yamuna-cart-recommendations .item-description {
    max-width: 100% !important;
  }

  body.template-cart .yamuna-cart-recommendations .item-name,
  body.template-cart .yamuna-cart-recommendations .js-item-name,
  body.template-cart .yamuna-cart-recommendations .item-name a,
  body.template-cart .yamuna-cart-recommendations .js-item-name a {
    display: -webkit-box !important;
    -webkit-box-orient: vertical !important;
    -webkit-line-clamp: 1 !important;
    max-width: 100% !important;
    height: 20px !important;
    max-height: 20px !important;
    font-size: 15px !important;
    line-height: 20px !important;
    white-space: normal !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
  }

  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three,
  body.template-cart .yamuna-cart-recommendations .item-actions .btn-secondary {
    font-size: 10px !important;
    padding: 0 4px !important;
    gap: 3px !important;
    height: 37px !important;
    min-height: 37px !important;
    max-height: 37px !important;
    overflow: hidden !important;
    white-space: nowrap !important;
  }

  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-label {
    font-size: 10px !important;
  }

  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three .yamuna-pdp-spot-bag,
  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three .yamuna-home-spot-bag {
    width: 12px !important;
    height: 12px !important;
  }
}

/* 768?991: keep desktop-like cart table (prod at 768 shows all columns + 3 spots) */
@media (max-width: 991px) and (min-width: 768px) {
  body.template-cart .yamuna-cart-checkout-header {
    padding: 24px 16px 16px;
  }

  body.template-cart .yamuna-cart-checkout-logo {
    width: 96px;
  }

  body.template-cart .yamuna-cart-page {
    padding: 16px 16px 0;
  }

  body.template-cart .yamuna-cart-page-title {
    font-size: 22px;
  }

  body.template-cart .yamuna-cart-table-head {
    grid-template-columns: 28px 64px minmax(100px, 1fr) 100px 110px 120px;
    font-size: 12px;
    padding: 0 12px;
  }

  body.template-cart .yamuna-cart-row {
    grid-template-columns: 28px 64px minmax(100px, 1fr) 100px 110px 120px;
    padding: 12px;
    gap: 8px;
  }

  body.template-cart .yamuna-cart-page-actions {
    flex-direction: row;
    justify-content: center;
    align-items: stretch;
    gap: 12px;
    margin-top: 28px;
  }

  body.template-cart .yamuna-cart-page-continue,
  body.template-cart .yamuna-cart-page-checkout {
    flex: 1 1 0;
    max-width: none;
  }

  body.template-cart .yamuna-checkout-extras {
    padding: 0 16px 32px;
  }

  body.template-cart .yamuna-cart-recommendations-title {
    margin-bottom: 20px;
    font-size: 24px;
  }

  body.template-cart .yamuna-cart-recommendations .item.item-product {
    max-width: none;
  }

  body.template-cart .yamuna-cart-recommendations .item-image {
    max-width: 100% !important;
  }

  body.template-cart .yamuna-cart-depositions-grid {
    grid-template-columns: 1fr 1fr;
  }
}

/* <768: match yamuna.com.br/checkout mobile */
@media (max-width: 767px) {
  body.template-cart .yamuna-cart-checkout-header {
    padding: 24px 16px 16px;
  }

  body.template-cart .yamuna-cart-checkout-logo {
    width: 96px;
  }

  body.template-cart .yamuna-cart-page {
    padding: 16px 16px 0;
  }

  body.template-cart .yamuna-cart-nav {
    flex-wrap: wrap;
    justify-content: flex-start;
    margin-bottom: 16px;
  }

  body.template-cart .yamuna-cart-page-back {
    order: 1;
    width: 100%;
    margin-bottom: 8px;
  }

  body.template-cart .yamuna-cart-page-title {
    order: 2;
    width: 100%;
    font-size: 20px;
    letter-spacing: 0.8px;
  }

  body.template-cart .yamuna-cart-nav-spacer {
    display: none;
  }

  /* Prod mobile: only "DESCRI??O DO PRODUTO" bar */
  body.template-cart .yamuna-cart-table-head {
    display: flex !important;
    align-items: center !important;
    justify-content: flex-start !important;
    grid-template-columns: none !important;
    min-height: 40px !important;
    height: auto !important;
    padding: 10px 16px !important;
    color: #fff !important;
  }

  body.template-cart .yamuna-cart-col-spacer,
  body.template-cart .yamuna-cart-col-qty,
  body.template-cart .yamuna-cart-col-unit,
  body.template-cart .yamuna-cart-col-total {
    display: none !important;
  }

  body.template-cart .yamuna-cart-col-desc {
    grid-column: auto !important;
    display: block !important;
    width: 100% !important;
    color: #fff !important;
    font-size: 13px !important;
  }

  body.template-cart .yamuna-cart-table-body {
    padding: 8px 12px 12px;
  }

  /* Prod mobile row: trash | image | name+prices ; qty below */
  body.template-cart .yamuna-cart-row {
    grid-template-columns: 24px 72px 1fr;
    grid-template-areas:
      "delete image desc"
      "delete image prices"
      "qty qty qty";
    gap: 8px 12px;
    align-items: start;
    min-height: 0;
    padding: 16px 4px;
  }

  body.template-cart .yamuna-cart-row-delete { grid-area: delete; padding-top: 8px; }
  body.template-cart .yamuna-cart-row-image { grid-area: image; width: 72px; height: 72px; }
  body.template-cart .yamuna-cart-row-desc { grid-area: desc; }
  body.template-cart .yamuna-cart-row-qty { grid-area: qty; justify-content: flex-start; margin-top: 4px; }
  body.template-cart .yamuna-cart-row-unit,
  body.template-cart .yamuna-cart-row-total {
    grid-area: prices;
  }

  body.template-cart .yamuna-cart-row-unit {
    display: none !important;
  }

  body.template-cart .yamuna-cart-row-total {
    text-align: left !important;
    padding-top: 0;
  }

  body.template-cart .yamuna-cart-page-actions {
    flex-direction: column-reverse;
    align-items: stretch;
    gap: 12px;
    margin-top: 28px;
  }

  body.template-cart .yamuna-cart-page-continue,
  body.template-cart .yamuna-cart-page-checkout {
    max-width: none;
  }

  body.template-cart .yamuna-checkout-extras {
    padding: 0 16px 32px;
  }

  body.template-cart .yamuna-cart-recommendations {
    margin: 36px 0 28px;
  }

  body.template-cart .yamuna-cart-recommendations-title {
    margin-bottom: 20px;
    font-size: 22px;
  }

  body.template-cart .yamuna-cart-recommendations .item.item-product {
    max-width: none;
    padding: 0 4px 12px !important;
  }

  body.template-cart .yamuna-cart-recommendations .item-image {
    max-width: 100% !important;
  }

  body.template-cart .yamuna-cart-recommendations .item-actions {
    max-width: 100% !important;
  }

  /* Prod mobile: COMPRE 3 stays one line inside fixed h37 */
  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three,
  body.template-cart .yamuna-cart-recommendations .item-actions .btn-secondary {
    height: 37px !important;
    min-height: 37px !important;
    max-height: 37px !important;
    padding: 0 6px !important;
    overflow: hidden !important;
    white-space: nowrap !important;
    font-size: 10px !important;
  }

  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-label {
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    overflow: hidden !important;
    white-space: nowrap !important;
    font-size: 10px !important;
    line-height: 1 !important;
  }

  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-prefix,
  body.template-cart .yamuna-cart-recommendations .yamuna-pdp-spot-buy-three-price {
    display: inline !important;
    white-space: nowrap !important;
    font-size: inherit !important;
  }

  body.template-cart .yamuna-cart-recommendations .item-name,
  body.template-cart .yamuna-cart-recommendations .js-item-name,
  body.template-cart .yamuna-cart-recommendations .item-name a,
  body.template-cart .yamuna-cart-recommendations .js-item-name a {
    display: -webkit-box !important;
    -webkit-box-orient: vertical !important;
    -webkit-line-clamp: 1 !important;
    height: 22px !important;
    max-height: 22px !important;
    font-size: 16px !important;
    line-height: 22px !important;
    max-width: 100% !important;
    margin-left: auto !important;
    margin-right: auto !important;
    white-space: normal !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
  }

  body.template-cart .yamuna-cart-reco-prev { left: 0; right: auto; }
  body.template-cart .yamuna-cart-reco-next { left: 36px; right: auto; }

  body.template-cart .yamuna-cart-depositions {
    margin: 24px 0 32px;
    padding: 14px 10px 16px;
  }

  body.template-cart .yamuna-cart-depositions-grid {
    grid-template-columns: 1fr;
  }

  body.template-cart .yamuna-cart-depositions-nav {
    display: flex;
  }

  body.template-cart .yamuna-cart-checkout-footer-inner {
    padding: 32px 16px 18px;
  }

  body.template-cart .yamuna-cart-checkout-footer-content,
  body.template-cart .yamuna-cart-checkout-footer-bottom {
    flex-direction: column;
    align-items: flex-start;
  }

  body.template-cart .yamuna-cart-checkout-footer-content {
    gap: 22px;
    padding-bottom: 16px;
    border-bottom: 0;
  }

  body.template-cart .yamuna-cart-checkout-footer-brand {
    width: 120px;
  }

  body.template-cart .yamuna-cart-checkout-footer-section h2 {
    margin-bottom: 8px;
    font-size: 13px;
  }

  body.template-cart .yamuna-cart-checkout-footer-section li,
  body.template-cart .yamuna-cart-checkout-footer-section a {
    font-size: 12px;
  }

  body.template-cart .yamuna-cart-checkout-footer-security {
    text-align: left;
  }

  body.template-cart .yamuna-cart-checkout-footer-security-logos {
    justify-content: flex-start;
  }

  body.template-cart .yamuna-cart-checkout-footer-bottom {
    width: 100%;
    margin-top: 8px;
    padding-top: 14px;
    border-top: 1px solid #a31460;
  }

  body.template-cart .yamuna-cart-checkout-footer-bottom p {
    font-size: 10px;
  }
}

/* Yamuna blog listing, article and home carousel */
body.template-blog > .yamuna-resale-wrap,
body.template-blog-post > .yamuna-resale-wrap {
  margin-top: 0 !important;
}

.yamuna-blog-page,
.yamuna-blog-post-page,
.yamuna-home-blog {
  --yamuna-blog-wine: #4a1d3a;
  --yamuna-blog-magenta: #a31460;
  --yamuna-blog-teal: #238482;
  color: #222;
  font-family: 'Dosis', sans-serif;
}

.yamuna-blog-page,
.yamuna-blog-post-page {
  background: #fff;
}

.yamuna-home-blog {
  background: #f6f6f6;
}

.yamuna-blog-page {
  padding: 24px 0 80px;
}

.yamuna-blog-page-title,
.yamuna-home-blog-title {
  margin: 0 0 28px;
  color: var(--yamuna-blog-magenta);
  font-family: 'Roboto', sans-serif !important;
  font-size: 32px;
  font-weight: 500;
  letter-spacing: normal;
  line-height: 1.2;
  text-align: left;
  text-transform: uppercase;
}

.yamuna-blog-page-title {
  margin: 0 0 32px;
}

.yamuna-home-blog-title {
  text-align: center;
  margin-bottom: 40px;
}

@media (max-width: 1023px) {
  .yamuna-home-blog-title {
    margin-bottom: 24px;
    color: #a31460 !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 24px !important;
    font-weight: 500 !important;
    letter-spacing: normal;
    line-height: normal;
    text-align: center;
    text-transform: uppercase;
  }

  .yamuna-blog-card--home .yamuna-blog-card-title,
  .yamuna-blog-card--home .item-name,
  .yamuna-blog-card--home .item-name a {
    color: #4a1d3a !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 16px !important;
    font-weight: 700 !important;
    line-height: normal;
  }
}

.yamuna-blog-featured {
  display: grid;
  grid-template-columns: 1fr;
  gap: 16px;
  margin-bottom: 48px;
}

.yamuna-blog-card--featured {
  position: relative;
  overflow: hidden;
  min-height: 240px;
  border-radius: 16px;
}

.yamuna-blog-card--featured .yamuna-blog-card-inner,
.yamuna-blog-card--featured .yamuna-blog-card-image,
.yamuna-blog-card--featured .post-item-image-container {
  height: 100%;
  min-height: 240px;
}

.yamuna-blog-card--featured .yamuna-blog-card-info {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 2;
  padding: 28px 22px 22px;
  background: linear-gradient(180deg, rgba(74, 29, 58, 0) 0%, rgba(74, 29, 58, 0.88) 62%);
}

.yamuna-blog-card--featured .yamuna-blog-card-title,
.yamuna-blog-card--featured .yamuna-blog-card-title a,
.yamuna-blog-card--featured .item-name,
.yamuna-blog-card--featured .item-name a {
  color: #fff !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 26px;
  font-weight: 700;
  letter-spacing: 0.02em;
  line-height: 1.15;
  text-transform: uppercase;
}

.yamuna-blog-card--featured .yamuna-blog-card-summary,
.yamuna-blog-card--featured .item-description p,
.yamuna-blog-card--featured .post-item-summary {
  color: #fff !important;
  font-size: 15px;
}

.yamuna-blog-cta {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 40px;
  padding: 8px 18px;
  border-radius: 8px;
  font-family: 'Poppins', sans-serif !important;
  font-size: 13px;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-decoration: none !important;
  text-transform: uppercase;
}

.yamuna-blog-cta-continue {
  color: #fff !important;
  background: var(--yamuna-blog-teal);
  border: 0;
  font-size: 0;
}

.yamuna-blog-cta-continue::after {
  content: 'Continue lendo';
  font-size: 13px;
}

.yamuna-blog-cta-more {
  color: var(--yamuna-blog-teal) !important;
  background: #fff;
  border: 1px solid var(--yamuna-blog-teal);
  border-radius: 999px;
  margin-top: 24px;
  min-height: 32px;
  height: 32px;
  min-width: 120px;
  padding: 0 16px;
  font-family: 'Raleway', sans-serif !important;
  font-size: 0;
  font-weight: 600;
  line-height: 1;
  text-align: center;
  justify-content: center;
  align-items: center;
  transition: all 0.3s ease;
}

.yamuna-blog-cta-more::after {
  content: "Leia mais →";
  display: block;
  width: 100%;
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px;
  font-weight: 600;
  line-height: 1;
  text-align: center;
}

.yamuna-blog-cta-more:hover,
.yamuna-blog-cta-more:focus {
  background: #238482 !important;
  border-color: #238482 !important;
  color: #fff !important;
}

.yamuna-blog-cta-more:hover::after,
.yamuna-blog-cta-more:focus::after {
  color: #fff !important;
}

.yamuna-blog-layout {
  display: grid;
  grid-template-columns: 1fr;
  gap: 32px;
}

.yamuna-blog-search-row {
  display: grid;
  grid-template-columns: 1fr;
  gap: 16px;
  margin: 0 0 40px;
  align-items: center;
}

.yamuna-blog-search-label {
  margin: 0;
  color: var(--yamuna-blog-magenta);
  font-family: 'Dosis', sans-serif !important;
  font-size: 22px;
  font-weight: 700;
  letter-spacing: 0.02em;
  line-height: 1.15;
  text-transform: uppercase;
}

.yamuna-blog-cats-title {
  margin: 0 0 20px;
  color: var(--yamuna-blog-wine);
  font-family: 'Dosis', sans-serif !important;
  font-size: 28px;
  font-weight: 800;
  letter-spacing: 0.02em;
  line-height: 1.15;
  text-transform: none;
}

.yamuna-blog-search-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  overflow: hidden;
  clip: rect(0 0 0 0);
}

.yamuna-blog-search-field {
  display: flex;
  position: relative;
  align-items: center;
  width: 100%;
  min-height: 52px;
  padding: 0 8px 0 18px;
  border: 1px solid var(--yamuna-blog-magenta);
  border-radius: 999px;
  background: #fff;
}

.yamuna-blog-search-float {
  position: absolute;
  top: -10px;
  left: 22px;
  padding: 0 8px;
  color: var(--yamuna-blog-magenta);
  background: #fff;
  font-family: 'Poppins', sans-serif;
  font-size: 13px;
  font-weight: 600;
}

.yamuna-blog-search input {
  flex: 1 1 auto;
  width: 100%;
  height: 50px;
  padding: 0 8px 0 4px;
  border: 0;
  color: #333;
  background: transparent;
  font-family: 'Poppins', sans-serif;
  font-size: 15px;
  outline: none;
}

.yamuna-blog-search-submit {
  display: flex;
  flex: 0 0 auto;
  align-items: center;
  justify-content: center;
  width: 48px;
  height: 48px;
  padding: 0;
  border: 0;
  background: transparent;
  cursor: pointer;
}

.yamuna-blog-search-submit img {
  display: block;
  width: 20px;
  height: 20px;
}

.yamuna-blog-sidebar {
  display: flex;
  flex-direction: column;
}

.yamuna-blog-cats {
  display: flex;
  flex-direction: column;
  gap: 16px;
  margin: 0 0 16px;
}

.yamuna-blog-cats button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  min-height: 52px;
  padding: 0 16px;
  border: 1px solid #d1d5db;
  border-radius: 999px;
  color: var(--yamuna-blog-wine);
  background: #fff;
  font-family: 'Poppins', sans-serif;
  font-size: 15px;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
}

.yamuna-blog-cats button:hover {
  border-color: var(--yamuna-blog-wine);
  color: var(--yamuna-blog-wine);
}

.yamuna-blog-cats button.is-active {
  color: #fff;
  background: var(--yamuna-blog-wine);
  border-color: var(--yamuna-blog-wine);
}

.yamuna-blog-shop-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  min-height: 56px;
  padding: 10px 16px;
  border-radius: 999px;
  color: #fff !important;
  background: var(--yamuna-blog-teal);
  font-family: 'Poppins', sans-serif !important;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-align: center;
  text-decoration: none !important;
  text-transform: uppercase;
}

.yamuna-blog-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 32px 24px;
  align-items: stretch;
}

.yamuna-blog-card--grid,
.yamuna-blog-card--home {
  display: flex;
  flex-direction: column;
  background: #f6f5f6;
  border-radius: 8px;
}

{# Home blog depth uses box-shadow (drop-shadow clips inside Swiper overflow). #}
.yamuna-blog-card--home {
  filter: none;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.18), 0 1px 4px rgba(0, 0, 0, 0.08);
}

.yamuna-blog-card--grid {
  height: 100%;
  filter: drop-shadow(4px 4px 7px rgba(0, 0, 0, 0.08));
}

.yamuna-blog-card-tags {
  order: 2;
  margin: 12px 0 6px;
  color: var(--yamuna-blog-teal);
  font-family: 'Poppins', sans-serif;
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 0.08em;
}

.yamuna-blog-card-tags span + span {
  margin-left: 6px;
}

.yamuna-blog-card--grid .yamuna-blog-card-inner,
.yamuna-blog-card--home .yamuna-blog-card-inner {
  display: contents;
}

.yamuna-blog-card--grid .yamuna-blog-card-image,
.yamuna-blog-card--home .yamuna-blog-card-image,
.yamuna-blog-card--grid .post-item-image-container,
.yamuna-blog-card--home .post-item-image-container {
  order: 1;
  overflow: hidden;
  height: 210px;
  border-radius: 16px;
  box-shadow: 0 8px 24px rgba(74, 29, 58, 0.12);
}

.yamuna-blog-card--grid .yamuna-blog-card-image,
.yamuna-blog-card--grid .post-item-image-container {
  height: 209px;
  margin: 16px 16px 0;
  padding: 0;
  background: #f3f4f6;
  border: 12px solid #f3f4f6;
  border-radius: 12px;
  box-shadow: none;
}

.yamuna-blog-card--grid .yamuna-blog-card-image img,
.yamuna-blog-card--grid .post-item-image-container img {
  border-radius: 8px;
  object-fit: cover;
}

.yamuna-blog-card--grid .yamuna-blog-card-info,
.yamuna-blog-card--home .yamuna-blog-card-info {
  order: 3;
}

.yamuna-blog-card--grid .yamuna-blog-card-info,
.yamuna-blog-card--grid .post-item-info,
.yamuna-blog-card--grid .post-item-link {
  display: flex;
  flex-direction: column;
  flex: 1 1 auto;
  height: 100%;
  align-items: center;
  padding: 16px 24px 24px;
  text-align: center;
}

.yamuna-blog-card--grid .yamuna-blog-card-title,
.yamuna-blog-card--home .yamuna-blog-card-title,
.yamuna-blog-card--grid .item-name,
.yamuna-blog-card--home .item-name,
.yamuna-blog-card--grid .item-name a,
.yamuna-blog-card--home .item-name a {
  color: var(--yamuna-blog-magenta) !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 22px;
  font-weight: 700;
  line-height: 1.25;
}

.yamuna-blog-card--grid .yamuna-blog-card-title,
.yamuna-blog-card--grid .item-name,
.yamuna-blog-card--grid .item-name a {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
  min-height: 2.5em;
  font-size: 18px;
}

.yamuna-blog-card--grid .yamuna-blog-card-summary,
.yamuna-blog-card--home .yamuna-blog-card-summary,
.yamuna-blog-card--grid .post-item-summary,
.yamuna-blog-card--home .post-item-summary {
  color: #444;
  font-size: 16px;
  line-height: 1.5;
}

.yamuna-blog-card--grid .yamuna-blog-card-summary,
.yamuna-blog-card--grid .post-item-summary,
.yamuna-blog-card--grid .item-description,
.yamuna-blog-card--grid .item-description p {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 4;
  overflow: hidden;
  min-height: 6em;
  margin-bottom: 8px;
  flex: 1 1 auto;
}

.yamuna-blog-card--grid .yamuna-blog-cta-more {
  margin-top: auto;
  align-self: center;
}

.yamuna-blog-empty {
  margin: 24px 0 0;
  color: #666;
  text-align: center;
}

.yamuna-blog-post-page {
  padding: 24px 0 80px;
}

.yamuna-blog-post-page .page-header h1,
.yamuna-blog-post-title,
.yamuna-blog-post-page h1 {
  color: var(--yamuna-blog-magenta) !important;
  font-family: 'Dosis', sans-serif !important;
  font-size: 32px;
  font-weight: 700;
  line-height: 1.25;
  text-align: center;
}

.yamuna-blog-post {
  max-width: 780px;
  margin: 0 auto;
}

.yamuna-blog-post-image,
.yamuna-blog-post .post-item-image,
.yamuna-blog-post img {
  display: block;
  width: 100%;
  max-width: 640px;
  height: auto;
  margin: 8px auto 28px;
  border-radius: 12px;
}

.yamuna-blog-post-date {
  margin-bottom: 16px;
  color: #777;
  font-size: 13px;
  text-align: center;
}

.yamuna-blog-post-page .post-author,
.yamuna-blog-post-page .blog-post-author,
.yamuna-blog-post-date a {
  display: none !important;
}

.yamuna-blog-post-body,
.yamuna-blog-post .post-content,
.yamuna-blog-post .post-content p,
.yamuna-blog-post .post-content li {
  color: #222;
  font-family: 'Dosis', sans-serif !important;
  font-size: 18px;
  line-height: 1.7;
}

.yamuna-blog-post .post-content h2,
.yamuna-blog-post .post-content h3,
.yamuna-blog-post .post-content h4 {
  color: var(--yamuna-blog-wine);
  font-family: 'Dosis', sans-serif !important;
  font-weight: 700;
}

.yamuna-blog-post .post-content a {
  color: var(--yamuna-blog-teal);
}

.yamuna-home-blog {
  padding: 80px 0 40px;
  background: #f6f6f6;
}

.yamuna-home-blog-slider {
  position: relative;
  padding: 0 16px 4px;
  overflow: visible;
}

.yamuna-home-blog .swiper-container {
  width: 100%;
  overflow: hidden;
  padding: 8px 6px 28px;
  margin: -8px -6px 0;
}

.yamuna-home-blog .swiper-wrapper {
  align-items: stretch;
}

.yamuna-home-blog .swiper-slide {
  height: auto;
  box-sizing: border-box;
  margin-bottom: 0;
  padding-bottom: 0;
}

@media (max-width: 425px) {
  .yamuna-home-blog-slider {
    padding-left: 20px;
    padding-right: 20px;
  }
}

body.template-home .yamuna-blog-card--home,
.yamuna-home-blog .yamuna-blog-card--home {
  width: 100%;
  height: 100%;
  margin: 0;
  background: #fff;
  border-radius: 8px;
  filter: none !important;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.18), 0 1px 4px rgba(0, 0, 0, 0.08);
}

body.template-home .yamuna-blog-card--home .yamuna-blog-card-image,
body.template-home .yamuna-blog-card--home .post-item-image-container,
.yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-card-image,
.yamuna-home-blog .yamuna-blog-card--home .post-item-image-container {
  position: relative !important;
  display: block !important;
  width: 100% !important;
  height: 210px !important;
  min-height: 210px !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  border: 0 !important;
  border-radius: 8px 8px 0 0 !important;
  background: #f3f4f6 !important;
  box-shadow: none !important;
}

body.template-home .yamuna-blog-card--home .yamuna-blog-card-image img,
body.template-home .yamuna-blog-card--home .post-item-image-container img,
.yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-card-image img,
.yamuna-home-blog .yamuna-blog-card--home .post-item-image-container img {
  position: absolute !important;
  top: 0 !important;
  left: 0 !important;
  width: 100% !important;
  height: 100% !important;
  object-fit: cover !important;
  opacity: 1 !important;
  transform: none !important;
}

.yamuna-blog-card--home .yamuna-blog-card-inner,
.yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-card-inner {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.yamuna-blog-card--home .yamuna-blog-card-info,
.yamuna-blog-card--home .post-item-info,
.yamuna-blog-card--home .post-item-link {
  display: flex;
  flex-direction: column;
  flex: 1 1 auto;
  height: auto;
}

.yamuna-blog-card--home .yamuna-blog-card-info,
.yamuna-blog-card--home .post-item-info,
.yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-card-info,
.yamuna-home-blog .yamuna-blog-card--home .post-item-info {
  padding: 20px 24px 28px !important;
  box-sizing: border-box;
}

.yamuna-blog-card--home .yamuna-blog-card-title,
.yamuna-blog-card--home .item-name,
.yamuna-blog-card--home .item-name a {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
  min-height: 3.75em;
  margin: 0 0 10px !important;
  padding: 0 !important;
  text-align: center;
  color: #a31460 !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 18px !important;
  font-weight: 700 !important;
  line-height: 1.25 !important;
}

.yamuna-blog-card--home .yamuna-blog-card-summary,
.yamuna-blog-card--home .post-item-summary,
.yamuna-blog-card--home .item-description,
.yamuna-blog-card--home .item-description p {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
  min-height: 4.5em;
  margin: 0 0 16px !important;
  padding: 0 !important;
  flex: 1 1 auto;
  text-align: center;
  color: #6b6570 !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 400 !important;
  line-height: 1.45 !important;
}

.yamuna-blog-card--home .yamuna-blog-cta-more,
.yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-cta-more {
  margin-top: auto !important;
  margin-bottom: 0 !important;
  padding: 0 16px !important;
  min-width: 120px !important;
  width: auto !important;
  height: 36px !important;
  min-height: 36px !important;
  align-self: center;
}

.yamuna-home-blog-arrow {
  display: none;
}

.yamuna-home-blog-all {
  margin: 32px 0 0;
  text-align: center;
}

.yamuna-home-blog-all a {
  color: var(--yamuna-blog-teal);
  font-family: 'Poppins', sans-serif;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

.yamuna-home-blog-pagination {
  position: static !important;
  display: flex;
  justify-content: center;
  gap: 8px;
  width: 100%;
  margin-top: 20px;
}

.yamuna-home-blog-pagination .swiper-pagination-bullet {
  width: 8px;
  height: 8px;
  margin: 0;
  border-radius: 8px;
  background: #c9c9c9;
  opacity: 1;
}

.yamuna-home-blog-pagination .swiper-pagination-bullet-active {
  background: var(--yamuna-blog-teal);
}

.yamuna-blog-pagination {
  margin-top: 56px;
  color: var(--yamuna-blog-wine);
}

.yamuna-blog-pagination .h4,
.yamuna-blog-pagination span {
  color: var(--yamuna-blog-wine);
  font-family: 'Dosis', sans-serif;
  font-weight: 600;
}

.yamuna-blog-pagination a {
  color: var(--yamuna-blog-teal);
}

.yamuna-blog-page-link {
  margin: 0 12px;
  color: var(--yamuna-blog-teal) !important;
  font-family: 'Poppins', sans-serif;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

@media (min-width: 768px) {
  .yamuna-blog-featured {
    grid-template-columns: 1.35fr 1fr;
    grid-template-rows: 1fr 1fr;
    min-height: 520px;
  }

  .yamuna-blog-featured .yamuna-blog-card--featured:first-child {
    grid-row: span 2;
    min-height: 520px;
  }

  .yamuna-blog-search-row,
  .yamuna-blog-layout {
    grid-template-columns: 220px minmax(0, 1fr);
    gap: 24px;
    align-items: start;
  }

  .yamuna-blog-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 36px 20px;
  }
}

@media (min-width: 1024px) {
  .yamuna-blog-page,
  .yamuna-blog-post-page {
    padding-top: 145px;
  }

  .yamuna-blog-search-label {
    font-size: 30px;
  }

  .yamuna-blog-cats-title {
    font-size: 36px;
  }

  .yamuna-blog-search-row {
    grid-template-columns: 260px minmax(0, 1fr);
    gap: 28px;
    margin-bottom: 48px;
  }

  .yamuna-blog-layout {
    grid-template-columns: 260px minmax(0, 1fr);
    gap: 28px;
    align-items: start;
  }

  .yamuna-blog-cats {
    flex-direction: column;
    align-items: stretch;
  }

  .yamuna-blog-cats button {
    min-height: 56px;
  }

  .yamuna-blog-grid {
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 36px 16px;
  }

  .yamuna-blog-post-page .page-header h1,
  .yamuna-blog-post-title,
  .yamuna-blog-post-page h1 {
    font-size: 40px;
  }

  .yamuna-home-blog-slider {
    padding: 0 64px 4px;
  }

  .yamuna-home-blog-arrow {
    display: flex;
    position: absolute;
    top: 50%;
    z-index: 2;
    width: 48px;
    height: 48px;
    align-items: center;
    justify-content: center;
    border: 1px solid rgba(255, 255, 255, 0.55);
    border-radius: 50%;
    color: #238482;
    background: rgba(255, 255, 255, 0.85);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
    cursor: pointer;
    transform: translateY(-50%);
  }

  .yamuna-home-blog-arrow-prev {
    left: 8px;
  }

  .yamuna-home-blog-arrow-next {
    right: 8px;
  }

  .yamuna-home-blog-arrow-prev::before,
  .yamuna-home-blog-arrow-next::before {
    content: '';
    width: 14px;
    height: 14px;
    border-top: 3px solid #238482;
    border-right: 3px solid #238482;
  }

  .yamuna-home-blog-arrow-prev::before {
    transform: rotate(-135deg);
    margin-left: 3px;
  }

  .yamuna-home-blog-arrow-next::before {
    transform: rotate(45deg);
    margin-right: 3px;
  }
}

{# Cen?rio 010: PLP/search mobile header stays pinned like the home header.
   overflow-x: hidden on html/body breaks position:sticky below 768px. #}
@media (max-width: 1023px) {
  body.template-category .head-main,
  body.template-category .head-main.head-fix,
  body.template-search .head-main,
  body.template-search .head-main.head-fix {
    position: fixed !important;
    top: 0 !important;
    right: 0 !important;
    left: 0 !important;
    z-index: 1050 !important;
    width: 100% !important;
    height: 80px !important;
    padding: 0 !important;
    background: #F6F5F6 !important;
    box-shadow: none !important;
  }

  body.template-category .head-main .yamuna-header-mobile,
  body.template-search .head-main .yamuna-header-mobile {
    background: #F6F5F6 !important;
  }

  body.template-category > .mt-4,
  body.template-search > .mt-4 {
    margin-top: 0 !important;
    padding-top: 80px !important;
  }
}

html.yamuna-filters-open body.template-category .head-main,
html.yamuna-filters-open body.template-category .head-main.head-fix,
html.yamuna-filters-open body.template-search .head-main,
html.yamuna-filters-open body.template-search .head-main.head-fix {
  z-index: 40000 !important;
}

{# Filter drawer header: FILTROS and close (x) share one row, both mobile and desktop. #}
#nav-filters.yamuna-plp-filters-modal .modal-header {
  position: relative !important;
  display: flex !important;
  min-height: 56px !important;
  margin: 0 !important;
  padding: 16px 20px 12px 24px !important;
  align-items: center !important;
  justify-content: space-between !important;
  box-sizing: border-box !important;
}

#nav-filters.yamuna-plp-filters-modal .modal-close {
  position: static !important;
  top: auto !important;
  right: auto !important;
  left: auto !important;
  order: 2 !important;
  display: flex !important;
  width: 24px !important;
  height: 24px !important;
  margin: 0 0 0 auto !important;
  padding: 0 !important;
  flex-shrink: 0 !important;
  align-items: center !important;
  justify-content: center !important;
  transform: none !important;
  border-radius: 50% !important;
  background: #f1eef1 !important;
  z-index: 2 !important;
}

{# PLP mobile: FILTROS trigger and Ordenar por on the same baseline. #}
@media (max-width: 1023px) {
  body.template-category .category-controls,
  body.template-search .category-controls {
    display: flex !important;
    min-height: 0 !important;
    margin: 0 auto !important;
    padding: 24px 0 24px !important;
    align-items: center !important;
  }

  body.template-category .category-controls .row,
  body.template-search .category-controls .row {
    position: relative !important;
    display: flex !important;
    width: 100% !important;
    min-height: 30px !important;
    margin: 0 !important;
    align-items: center !important;
    justify-content: space-between !important;
  }

  body.template-category .category-controls .row > .col-auto,
  body.template-search .category-controls .row > .col-auto {
    display: flex !important;
    height: 30px !important;
    margin: 0 !important;
    padding: 0 !important;
    align-items: center !important;
  }

  body.template-category .yamuna-plp-filter-trigger,
  body.template-search .yamuna-plp-filter-trigger {
    display: inline-flex !important;
    height: 30px !important;
    min-height: 30px !important;
    align-items: center !important;
  }

  body.template-category .yamuna-plp-sort,
  body.template-search .yamuna-plp-sort {
    position: relative !important;
    top: auto !important;
    right: auto !important;
    left: auto !important;
    display: flex !important;
    height: 30px !important;
    min-height: 30px !important;
    margin: 0 0 0 auto !important;
    padding: 0 !important;
    align-items: center !important;
    transform: none !important;
  }

  body.template-category .yamuna-plp-sort-label,
  body.template-search .yamuna-plp-sort-label {
    display: flex !important;
    height: 30px !important;
    margin: 0 !important;
    align-items: center !important;
    font-size: 14px !important;
    line-height: 16px !important;
  }
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option-content,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option-content.checkbox {
  display: flex !important;
  align-items: center !important;
  margin-bottom: 0 !important;
  padding: 10px 16px 10px 12px !important;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option.is-selected .yamuna-plp-filter-option-content {
  padding-right: 16px !important;
  padding-left: 12px !important;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon {
  position: relative !important;
  top: auto !important;
  left: auto !important;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-remove {
  display: none;
  margin-left: auto !important;
  flex: 0 0 auto;
  align-self: center;
  color: #238482 !important;
  font-family: Arial, sans-serif !important;
  font-size: 18px !important;
  font-weight: 400 !important;
  line-height: 1 !important;
}

#nav-filters.yamuna-plp-filters-modal .is-selected .yamuna-plp-filter-remove {
  display: flex !important;
  width: 16px;
  height: 16px;
  align-items: center;
  justify-content: center;
}

{# Cen?rio 014 / 017: equal card gutters and button row locked to the bottom
   so a 1-line vs 2-line product name does not shift COMPRAR. #}
body.template-category .yamuna-plp-body .js-item-product,
body.template-search .yamuna-plp-body .js-item-product {
  display: flex !important;
}

body.template-category .yamuna-plp-body .item-product,
body.template-search .yamuna-plp-body .item-product,
body.template-category .yamuna-plp-body .js-product-container,
body.template-search .yamuna-plp-body .js-product-container {
  display: flex !important;
  width: 100% !important;
  height: 100% !important;
  min-height: 100% !important;
  flex: 1 1 auto !important;
  flex-direction: column !important;
}

body.template-category .yamuna-plp-body .item-name,
body.template-search .yamuna-plp-body .item-name {
  display: -webkit-box !important;
  min-height: calc(1.2em * 2);
  overflow: hidden !important;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  line-height: 1.2;
}

body.template-category .yamuna-plp-body .yamuna-plp-item-actions,
body.template-search .yamuna-plp-body .yamuna-plp-item-actions {
  margin-top: auto !important;
}

{# Cen?rio 015: show installment copy on mobile, stacked under the price. #}
@media (max-width: 1023px) {
  body.template-category .js-product-table .item-installments,
  body.template-search .js-product-table .item-installments,
  body.template-category .yamuna-plp-body .js-product-table .item-installments,
  body.template-search .yamuna-plp-body .js-product-table .item-installments {
    display: block !important;
    margin: 4px 0 0 !important;
    color: #9e9e9e !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    line-height: 18px !important;
    white-space: normal !important;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-price-container,
  body.template-search .yamuna-plp-body .js-product-table .item-price-container {
    display: flex !important;
    flex-direction: column !important;
    align-items: flex-start !important;
    gap: 0 !important;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-product,
  body.template-search .yamuna-plp-body .js-product-table .item-product {
    height: auto !important;
    min-height: 456px !important;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-image,
  body.template-search .yamuna-plp-body .js-product-table .item-image {
    width: calc(100% - 40px) !important;
    margin: 16px 20px 0 !important;
  }

  body.template-category .yamuna-plp-body .js-product-table .item-description,
  body.template-search .yamuna-plp-body .js-product-table .item-description {
    padding: 12px 20px 0 !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-item-actions,
  body.template-search .yamuna-plp-body .yamuna-plp-item-actions {
    padding: 12px 20px 20px !important;
  }
}

{# Cen?rio 016: mobile footer mark closer to the compact Figma lockup. #}
@media (max-width: 767px) {
  footer.yamuna-footer .yamuna-footer-logo {
    max-width: 96px !important;
    margin: 0 auto 20px !important;
  }

  footer.yamuna-footer .yamuna-footer-logo-img {
    width: 96px !important;
    max-width: 96px !important;
    height: auto !important;
  }
}

{# Keep the outlined Compre 3 pill (border + bag icon) on mobile, but let
   long prices wrap inside the card padding instead of overflowing. #}
body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
  max-width: 100% !important;
  min-width: 0 !important;
  box-sizing: border-box !important;
}

body.template-category .yamuna-plp-body .yamuna-plp-buy-three span,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three-prefix,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three-price,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three span,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three-prefix,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three-price {
  margin: 0 !important;
}

@media (max-width: 1023px) {
  body.template-category .yamuna-plp-body .yamuna-plp-item-actions,
  body.template-search .yamuna-plp-body .yamuna-plp-item-actions {
    overflow: hidden !important;
    box-sizing: border-box !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-item-actions form,
  body.template-search .yamuna-plp-body .yamuna-plp-item-actions form {
    min-width: 0 !important;
    gap: 8px !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
    display: flex !important;
    width: 100% !important;
    height: auto !important;
    min-height: 28px !important;
    padding: 6px 8px !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 4px !important;
    flex-wrap: nowrap !important;
    overflow: hidden !important;
    border: 1px solid #238482 !important;
    border-radius: 24px !important;
    background: #fff !important;
    color: #238482 !important;
    font-family: 'Roboto', sans-serif !important;
    font-size: 11px !important;
    font-weight: 600 !important;
    line-height: 14px !important;
    letter-spacing: 0 !important;
    text-align: center !important;
    text-transform: uppercase !important;
    white-space: nowrap !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three img,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three img {
    display: block !important;
    width: 14px !important;
    min-width: 14px !important;
    height: 14px !important;
    margin: 0 !important;
    flex: 0 0 14px !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-prefix,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-price,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-prefix,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-price {
    display: inline !important;
    margin: 0 !important;
    min-width: 0 !important;
    font: inherit !important;
    color: inherit !important;
    white-space: nowrap !important;
  }
}

{# FILTROS / Ordenar por: the theme JS writes inline top: headerHeight for
   sticky controls. Combined with position:relative that offset painted the
   bar over the first product card. Keep the row in normal flow. #}
@media (max-width: 1023px) {
  body.template-category .js-category-controls,
  body.template-category .category-controls,
  body.template-search .js-category-controls,
  body.template-search .category-controls {
    position: relative !important;
    top: auto !important;
    right: auto !important;
    bottom: auto !important;
    left: auto !important;
    z-index: 2 !important;
    display: flex !important;
    width: calc(100% - 24px) !important;
    max-width: none !important;
    min-height: 30px !important;
    margin: 0 auto !important;
    padding: 16px 0 32px !important;
    overflow: visible !important;
    transform: none !important;
    box-shadow: none !important;
  }

  body.template-category .category-controls.is-sticky,
  body.template-search .category-controls.is-sticky {
    position: relative !important;
    top: auto !important;
    box-shadow: none !important;
  }

  body.template-category .category-controls .row,
  body.template-search .category-controls .row {
    position: relative !important;
    display: flex !important;
    width: 100% !important;
    min-height: 30px !important;
    margin: 0 !important;
    align-items: center !important;
    justify-content: space-between !important;
    transform: none !important;
  }

  body.template-category .yamuna-plp-sort,
  body.template-search .yamuna-plp-sort {
    position: relative !important;
    top: auto !important;
    right: auto !important;
    left: auto !important;
    display: flex !important;
    width: auto !important;
    max-width: none !important;
    min-height: 30px !important;
    margin: 0 0 0 auto !important;
    padding: 0 !important;
    flex: 0 0 auto !important;
    transform: none !important;
  }

  body.template-category .yamuna-plp-sort-label,
  body.template-search .yamuna-plp-sort-label {
    position: static !important;
    display: flex !important;
    width: auto !important;
    height: 30px !important;
    margin: 0 !important;
    padding: 0 18px 0 0 !important;
    align-items: center !important;
    line-height: 16px !important;
  }

  body.template-category .yamuna-plp-body,
  body.template-search .yamuna-plp-body {
    position: relative !important;
    z-index: 1 !important;
    margin-top: 0 !important;
    padding-top: 0 !important;
  }
}

{# Desktop nav: PRODUTOS sits in a dropdown wrapper, so line-height alone
   left it a few pixels above QUEM SOMOS / REVENDA / BLOG. Same flex box. #}
@media (min-width: 1024px) {
  body[class] .head-main .yamuna-header-desktop-nav {
    display: flex !important;
    align-items: center !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav > .nav-list-link,
  body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-menu,
  body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-menu > .nav-item-container,
  body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-menu > .nav-item-container > .nav-list-link {
    display: flex !important;
    height: 80px !important;
    margin: 0 !important;
    padding: 0 !important;
    align-items: center !important;
    line-height: 1 !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-menu {
    overflow: visible !important;
    flex: 0 0 auto !important;
  }
}

{# Drawers tuck under the magenta capsule with a solid white fill so the
   rounded header does not leave holes. Empty-cart Figma banners stay.
   cart-totals stays off the ajax panel so quantity/remove can complete. #}
@media (min-width: 1024px) {
  body[class] .head-main,
  body[class] .head-main.head-fix,
  body.template-home .head-main,
  body.template-home .head-main.head-fix {
    z-index: 40000 !important;
  }

  body[class] .head-main .yamuna-header-desktop {
    isolation: isolate;
  }

  body[class] .head-main,
  body[class] .head-main.head-fix,
  body[class] .head-main.compress,
  body.template-home .head-main,
  body.template-home .head-main.head-fix,
  html.yamuna-header-scrolled body[class] .head-main,
  html.yamuna-header-scrolled body[class] .head-main.head-fix,
  html.yamuna-header-scrolled body.template-home .head-main,
  html.yamuna-header-scrolled body.template-home .head-main.head-fix {
    padding-top: 0 !important;
  }

  body[class] .head-main .yamuna-header-desktop,
  body[class] .head-main.compress .yamuna-header-desktop,
  body.template-home .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop {
    margin-top: 0 !important;
  }

  body[class] .head-main .yamuna-header-desktop::before,
  body.template-home .head-main .yamuna-header-desktop::before,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop::before,
  body[class] .head-main.compress .yamuna-header-desktop::before {
    z-index: 3 !important;
    top: 0 !important;
    border-top-left-radius: 0 !important;
    border-top-right-radius: 0 !important;
    border-bottom-left-radius: 54px !important;
    border-bottom-right-radius: 54px !important;
  }

  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop::before,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop::before,
  body[class] .head-main.compress .yamuna-header-desktop::before {
    left: 0 !important;
  }

  {# Keep the nav stacking context open so the mega-menu can sit under the
     capsule, but never let scroll rules bury the links behind the pill. #}
  body[class] .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-desktop-nav {
    z-index: auto !important;
  }

  {# Search/nav containers stay z-index:auto (see C108 block) so fixed panels
     are not trapped and do not cover the magenta chrome. #}
  body[class] .head-main .yamuna-header-desktop-logo,
  body[class] .head-main .yamuna-header-desktop-utilities,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-logo,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-utilities {
    z-index: 5 !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav > .nav-list-link,
  body[class] .head-main .yamuna-products-menu > .nav-item-container,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-nav > .nav-list-link,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-products-menu > .nav-item-container {
    position: relative !important;
    z-index: 4 !important;
  }

  html.yamuna-header-scrolled body[class] #modal-cart,
  html.yamuna-header-scrolled body[class] #modal-cart.modal {
    top: 0 !important;
  }

  body[class] .head-main .desktop-dropdown,
  body[class] .head-main .yamuna-products-dropdown,
  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown,
  body[class] .head-main .yamuna-header-desktop-search .search-suggest,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
    top: var(--yamuna-panel-top, 0px) !important;
    z-index: 1 !important;
    padding-top: var(--yamuna-panel-overlap, 105px) !important;
    background: #fff !important;
    background-color: #fff !important;
    box-sizing: border-box !important;
  }

  body[class] .head-main .yamuna-products-menu:hover .yamuna-products-dropdown,
  body[class] .head-main .nav-dropdown:hover > .desktop-dropdown {
    visibility: visible !important;
    opacity: 1 !important;
    pointer-events: auto !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
    height: auto !important;
    min-height: calc(48px + 320px + 48px + var(--yamuna-panel-overlap, 105px)) !important;
    max-height: none !important;
    overflow: hidden !important;
    box-sizing: border-box !important;
    border-top-right-radius: 0 !important;
    border-bottom-right-radius: 24px !important;
    border-bottom-left-radius: 24px !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown::after {
    top: var(--yamuna-panel-overlap, 105px) !important;
    right: 0 !important;
    bottom: 0 !important;
    left: auto !important;
    width: min(420px, 38%) !important;
    height: auto !important;
    border-radius: 0 0 24px 0 !important;
    background-position: center right !important;
    background-size: cover !important;
    opacity: 1 !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems {
    width: calc(100% - min(420px, 38%)) !important;
    height: auto !important;
    max-height: none !important;
    padding: 48px 34px 48px !important;
    align-content: start !important;
    box-sizing: border-box !important;
    overflow: visible !important;
  }

  body[class] #modal-cart,
  body[class] #modal-cart.modal,
  body.template-home #modal-cart,
  body:not(.template-home) #modal-cart {
    top: var(--yamuna-panel-top, 0px) !important;
    z-index: 29000 !important;
    background: #fff !important;
    background-color: #fff !important;
  }

  body[class] #modal-cart .js-ajax-cart-panel,
  body.template-home #modal-cart .js-ajax-cart-panel {
    display: flex !important;
    flex-direction: column !important;
    height: 100% !important;
    min-height: 0 !important;
    overflow: hidden !important;
    background: #fff !important;
    background-color: #fff !important;
  }

  body[class] #modal-cart .modal-body,
  body.template-home #modal-cart .modal-body {
    display: flex !important;
    flex: 1 1 auto !important;
    flex-direction: column !important;
    min-height: 0 !important;
    overflow: hidden !important;
  }

  body[class] #modal-cart .js-ajax-cart-list,
  body.template-home #modal-cart .js-ajax-cart-list {
    flex: 0 0 auto !important;
    min-height: 0 !important;
    overflow: visible !important;
  }

  body[class] #modal-cart .yamuna-minicart-scroll,
  body.template-home #modal-cart .yamuna-minicart-scroll {
    flex: 1 1 auto !important;
    min-height: 240px !important;
    max-height: none !important;
    width: 100% !important;
    overflow-x: hidden !important;
    overflow-y: auto !important;
  }

  body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer,
  body.template-home #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer {
    position: relative !important;
    right: auto !important;
    bottom: auto !important;
    left: auto !important;
    z-index: 2 !important;
    display: flex !important;
    flex: 0 0 auto !important;
    flex-direction: column !important;
    height: auto !important;
    min-height: 0 !important;
    background: #fff !important;
  }

  body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer p {
    display: block !important;
    position: static !important;
  }

  body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-discount {
    position: relative !important;
    top: auto !important;
  }

  body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-checkout {
    position: relative !important;
    top: auto !important;
    right: auto !important;
    bottom: auto !important;
    left: auto !important;
  }

  body[class] .js-modal-overlay[data-modal-id="#modal-cart"] {
    z-index: 28000 !important;
  }
}

@media (max-width: 1023px) {
  body[class] .head-main,
  body[class] .head-main.head-fix {
    z-index: 40000 !important;
  }

  body[class] #modal-cart.modal {
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: 0 !important;
    width: 100vw !important;
    height: 100dvh !important;
    max-height: none !important;
    margin: 0 !important;
    border-radius: 0 !important;
    z-index: 41000 !important;
  }

  body[class] #nav-hamburger.modal-nav-hamburger {
    top: 80px !important;
    height: calc(100dvh - 80px) !important;
    min-height: 0 !important;
    z-index: 29000 !important;
  }

  body[class] .js-modal-overlay[data-modal-id="#modal-cart"] {
    z-index: 40500 !important;
  }

  body[class] .js-modal-overlay[data-modal-id="#nav-hamburger"] {
    z-index: 28000 !important;
  }
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-dropdown-footer,
body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-summary,
body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-empty-footer,
body[class] #modal-cart:has(.js-cart-item) .js-empty-ajax-cart {
  display: none !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer {
  display: block !important;
}

body[class] #modal-cart .js-empty-ajax-cart .alert-info {
  display: none !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .js-empty-ajax-cart {
  position: relative !important;
  top: auto !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  display: block !important;
  flex: 1 1 auto !important;
  padding: 20px !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-content,
body.template-home #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-content {
  position: static !important;
  top: auto !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  display: block !important;
}

body[class] #modal-cart .yamuna-empty-cart-content > p,
body[class] #modal-cart .yamuna-empty-cart-content > strong {
  display: block !important;
  color: #4a1d3a !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  text-align: center !important;
}

body[class] #modal-cart .yamuna-empty-cart-content > p {
  margin: 0 0 2px !important;
  font-size: 18px !important;
  font-weight: 500 !important;
}

body[class] #modal-cart .yamuna-empty-cart-content > strong {
  margin: 0 0 16px !important;
  font-size: 18px !important;
  font-weight: 700 !important;
}

body[class] #modal-cart .yamuna-empty-cart-links {
  display: grid !important;
  gap: 16px !important;
}

body[class] #modal-cart .yamuna-empty-cart-link,
body.template-home #modal-cart .yamuna-empty-cart-link,
body:not(.template-home) #modal-cart .yamuna-empty-cart-link {
  position: relative !important;
  display: flex !important;
  height: 90px !important;
  padding: 0 !important;
  align-items: flex-end !important;
  overflow: hidden !important;
  border-radius: 8px !important;
  background: #d9d9d9 !important;
  background-image: none !important;
  color: #fff !important;
  filter: none !important;
  text-decoration: none !important;
}

body[class] #modal-cart .yamuna-empty-cart-link-cosmetics,
body.template-home #modal-cart .yamuna-empty-cart-link-cosmetics {
  filter: none !important;
}

body[class] #modal-cart .yamuna-empty-cart-link::before {
  position: absolute !important;
  inset: 0 !important;
  background-position: center !important;
  background-size: cover !important;
  filter: grayscale(1) !important;
  content: '' !important;
}

body[class] #modal-cart .yamuna-empty-cart-link::after {
  display: none !important;
}

body[class] #modal-cart .yamuna-empty-cart-link-super::before {
  background-image: url('{{ 'images/yamuna/cart-empty-superfoods.png' | static_url }}') !important;
}

body[class] #modal-cart .yamuna-empty-cart-link-cosmetics::before {
  background-image: url('{{ 'images/yamuna/cart-empty-cosmetics.png' | static_url }}') !important;
}

body[class] #modal-cart .yamuna-empty-cart-link span {
  position: relative !important;
  z-index: 1 !important;
  display: inline-flex !important;
  height: 28px !important;
  margin: 0 !important;
  padding: 0 14px !important;
  align-items: center !important;
  border-radius: 0 6px 0 0 !important;
  background: #4a1d3a !important;
  color: #fff !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  text-transform: uppercase !important;
}

@media (min-width: 1024px) {
  body[class] #modal-cart .yamuna-empty-cart-link {
    height: 110px !important;
  }

  body[class] #modal-cart .yamuna-empty-cart-links {
    gap: 20px !important;
  }

  body[class] #modal-cart .yamuna-empty-cart-link span {
    height: 30px !important;
    padding: 0 16px !important;
    font-size: 14px !important;
  }
}

body[class] #modal-cart .yamuna-cart-summary,
body[class] #modal-cart .js-ajax-cart-submit,
body[class] #modal-cart .yamuna-cart-shipping-promo,
body[class] #modal-cart .yamuna-cart-discount,
body[class] #modal-cart .yamuna-cart-subscription,
body[class] #modal-cart .yamuna-cart-item-promo,
body[class] #modal-cart .progress-bar:not(.js-ship-free-rest),
body.template-home #modal-cart .yamuna-cart-shipping-promo,
body.template-home #modal-cart .js-ajax-cart-submit,
body:not(.template-home) #modal-cart .js-ajax-cart-submit {
  display: none !important;
}

body[class] #modal-cart .js-fulfillment-info,
body[class] #modal-cart .js-shipping-calculator-container,
body[class] #modal-cart #cart-shipping-container,
body[class] #modal-cart [data-component="cart-totals"],
body[class] #modal-cart .yamuna-minicart-totals,
body[class] #modal-cart .yamuna-minicart-fulfillment,
body.template-home #modal-cart .js-fulfillment-info,
body.template-home #modal-cart .js-shipping-calculator-container,
body.template-home #modal-cart #cart-shipping-container,
body.template-home #modal-cart [data-component="cart-totals"],
body:not(.template-home) #modal-cart .js-fulfillment-info,
body:not(.template-home) #modal-cart [data-component="cart-totals"],
body #modal-cart .js-fulfillment-info,
body #modal-cart .js-shipping-calculator-container,
body #modal-cart #cart-shipping-container,
body #modal-cart [data-component="cart-totals"] {
  display: block !important;
}

body[class] #modal-cart:has(.js-cart-item) .yamuna-minicart-fulfillment.js-allows-non-shippable[style*="display: none"],
body[class] #modal-cart:not(:has(.js-cart-item)) .js-fulfillment-info,
body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-minicart-totals,
body[class] #modal-cart:not(:has(.js-cart-item)) [data-component="cart-totals"] {
  display: none !important;
}

body[class] #modal-cart .yamuna-minicart-item,
body[class] #modal-cart .cart-item.yamuna-minicart-item {
  display: grid !important;
  grid-template-columns: 88px minmax(0, 1fr) !important;
  align-items: start !important;
  column-gap: 16px !important;
  min-height: 0 !important;
  overflow: visible !important;
}

body[class] #modal-cart .yamuna-minicart-item-image,
body[class] #modal-cart .yamuna-minicart-item-image a,
body[class] #modal-cart .yamuna-minicart-item-image img {
  width: 88px !important;
  max-width: 88px !important;
  height: 88px !important;
  max-height: 88px !important;
  object-fit: contain !important;
}

body[class] #modal-cart .js-cart-quantity-btn {
  pointer-events: auto !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer {
  position: relative !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  z-index: 3 !important;
  display: flex !important;
  flex: 0 0 auto !important;
  flex-direction: column !important;
  height: auto !important;
  min-height: 0 !important;
  padding: 0 0 24px !important;
  background: #fff !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer .yamuna-cart-discount {
  position: relative !important;
  top: auto !important;
  right: auto !important;
  left: auto !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer .yamuna-cart-checkout,
body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer .yamuna-cart-checkout,
body[class] #modal-cart .yamuna-cart-checkout {
  position: relative !important;
  top: auto !important;
  right: auto !important;
  bottom: auto !important;
  left: auto !important;
  display: flex !important;
  box-sizing: border-box !important;
  width: calc(100% - 32px) !important;
  max-width: none !important;
  height: 48px !important;
  margin: 16px 16px 0 !important;
  padding: 0 16px !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer .yamuna-cart-checkout {
  margin: 16px 22px 8px !important;
  background: #c0bbc3 !important;
}

body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer {
  display: block !important;
}

@media (max-width: 1023px) {
  body[class] #modal-cart .modal-header,
  body[class] #modal-cart .yamuna-cart-modal-header {
    height: 58px !important;
    min-height: 58px !important;
    max-height: 58px !important;
    padding: 0 12px !important;
  }
}

{# ============================================================
   Minicart layout mirrored from yamuna.com.br (prod).
   Preserves drawer height + navbar alignment; restyles internals.
   ============================================================ #}

body[class] #modal-cart .yamuna-cart-top-promo {
  display: flex !important;
  flex: 0 0 auto !important;
  align-items: center !important;
  justify-content: center !important;
  gap: 12px !important;
  width: 100% !important;
  margin: 0 !important;
  padding: 6px 12px !important;
  box-sizing: border-box !important;
  background: #a31460 !important;
  color: #fff !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 800 !important;
  line-height: 1.2 !important;
  text-transform: uppercase !important;
  letter-spacing: 0.02em !important;
}

body[class] #modal-cart .yamuna-cart-top-promo img {
  display: block !important;
  width: 18px !important;
  height: 18px !important;
  flex: 0 0 18px !important;
}

body[class] #modal-cart .yamuna-cart-free-shipping {
  flex: 0 0 auto !important;
  margin: 0 !important;
  padding: 8px 16px 4px !important;
  box-sizing: border-box !important;
}

body[class] #modal-cart .yamuna-cart-free-shipping .js-ship-free-rest,
body[class] #modal-cart .yamuna-cart-free-shipping .progress-bar {
  display: block !important;
  margin: 0 !important;
  padding: 8px 10px 6px !important;
  background: #f6f5f6 !important;
  border-radius: 0 !important;
}

body[class] #modal-cart .yamuna-cart-free-shipping .progress-bar-title,
body[class] #modal-cart .yamuna-cart-free-shipping .ship-free-rest-message {
  margin: 0 0 6px !important;
  color: #a31460 !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  line-height: 1.25 !important;
  text-align: center !important;
  text-transform: uppercase !important;
}

body[class] #modal-cart .yamuna-cart-free-shipping .progress-bar-icon {
  display: none !important;
}

body[class] #modal-cart .yamuna-cart-free-shipping .bar-progress {
  display: block !important;
  height: 3px !important;
  margin: 0 !important;
  overflow: hidden !important;
  border-radius: 8px !important;
  background: #c0bbc3 !important;
}

body[class] #modal-cart .yamuna-cart-free-shipping .bar-progress-active {
  height: 3px !important;
  border-radius: 8px !important;
  background: #a31460 !important;
}

body[class] #modal-cart .js-ajax-cart-list {
  flex: 0 0 auto !important;
  min-height: 0 !important;
  max-height: none !important;
  margin: 0 !important;
  padding: 0 16px !important;
  overflow: visible !important;
}

body[class] #modal-cart.modal {
  display: flex !important;
  flex-direction: column !important;
}

body[class] #modal-cart .modal-header,
body[class] #modal-cart .yamuna-cart-top-promo,
body[class] #modal-cart .yamuna-cart-free-shipping {
  flex: 0 0 auto !important;
}

body[class] #modal-cart .modal-body {
  display: flex !important;
  flex: 1 1 auto !important;
  flex-direction: column !important;
  min-height: 0 !important;
  height: auto !important;
  overflow: hidden !important;
}

body[class] #modal-cart .yamuna-minicart-scroll {
  display: flex !important;
  flex: 1 1 auto !important;
  flex-direction: column !important;
  width: 100% !important;
  max-width: 100% !important;
  min-height: 240px !important;
  max-height: none !important;
  height: auto !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow-x: hidden !important;
  overflow-y: auto !important;
  -webkit-overflow-scrolling: touch !important;
  box-sizing: border-box !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-minicart-scroll {
  display: none !important;
}

body[class] #modal-cart .yamuna-minicart-item,
body[class] #modal-cart .cart-item.yamuna-minicart-item {
  display: grid !important;
  grid-template-columns: 88px minmax(0, 1fr) !important;
  grid-template-areas:
    "image body"
    "image controls" !important;
  column-gap: 16px !important;
  row-gap: 12px !important;
  margin: 0 !important;
  padding: 20px 0 !important;
  border-bottom: 1px solid #e5e1e4 !important;
  background: transparent !important;
}

body[class] #modal-cart .yamuna-minicart-item-image {
  grid-area: image !important;
}

body[class] #modal-cart .yamuna-minicart-item-body {
  grid-area: body !important;
  min-width: 0 !important;
}

body[class] #modal-cart .yamuna-minicart-item-controls {
  grid-area: controls !important;
  display: flex !important;
  align-items: center !important;
  justify-content: space-between !important;
  gap: 12px !important;
  width: 100% !important;
  margin: 0 !important;
}

body[class] #modal-cart .yamuna-minicart-item-top {
  display: flex !important;
  align-items: flex-start !important;
  justify-content: space-between !important;
  gap: 12px !important;
}

body[class] #modal-cart .cart-item-name,
body[class] #modal-cart .cart-item-name a {
  margin: 0 !important;
  color: #4a1d3a !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  line-height: 1.25 !important;
  text-decoration: none !important;
}

body[class] #modal-cart .cart-item-subtotal,
body[class] #modal-cart .cart-item-subtotal .js-cart-item-subtotal,
body[class] #modal-cart .cart-item-subtotal .h6 {
  margin: 0 !important;
  color: #4a1d3a !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 18px !important;
  font-weight: 800 !important;
  line-height: 1.2 !important;
  white-space: nowrap !important;
}

body[class] #modal-cart .form-quantity,
body[class] #modal-cart .yamuna-minicart-qty,
body[class] #modal-cart .cart-item-quantity .form-quantity {
  display: inline-flex !important;
  align-items: center !important;
  width: 96px !important;
  min-width: 96px !important;
  height: 32px !important;
  margin: 0 !important;
  overflow: hidden !important;
  border: 1px solid #c0bbc3 !important;
  border-radius: 999px !important;
  background: #fff !important;
}

body[class] #modal-cart .cart-item-quantity .form-quantity-icon,
body[class] #modal-cart .cart-item-quantity .form-quantity-icon:first-child,
body[class] #modal-cart .cart-item-quantity .form-quantity-icon:last-child {
  border: 0 !important;
  border-radius: 0 !important;
  background: transparent !important;
}

body[class] #modal-cart .form-quantity .form-control,
body[class] #modal-cart .js-cart-quantity-input,
body[class] #modal-cart .cart-item-quantity .js-cart-quantity-input {
  display: block !important;
  box-sizing: border-box !important;
  width: 34px !important;
  min-width: 34px !important;
  height: 30px !important;
  min-height: 30px !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  color: #4a1d3a !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  line-height: 30px !important;
  text-align: center !important;
  vertical-align: middle !important;
  background: #fff !important;
  appearance: textfield !important;
  -moz-appearance: textfield !important;
}

body[class] #modal-cart .js-cart-quantity-input::-webkit-outer-spin-button,
body[class] #modal-cart .js-cart-quantity-input::-webkit-inner-spin-button {
  -webkit-appearance: none !important;
  margin: 0 !important;
}

body[class] #modal-cart .form-quantity-icon,
body[class] #modal-cart .js-cart-quantity-btn {
  display: inline-flex !important;
  width: 30px !important;
  height: 30px !important;
  align-items: center !important;
  justify-content: center !important;
  margin: 0 !important;
  padding: 0 !important;
  color: #4a1d3a !important;
  background: transparent !important;
  border: 0 !important;
  box-shadow: none !important;
  line-height: 1 !important;
}

body[class] #modal-cart .cart-item-delete,
body[class] #modal-cart .cart-item-delete .btn {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  width: 24px !important;
  height: 24px !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  background: transparent !important;
}

body[class] #modal-cart .yamuna-cart-trash-icon {
  display: block !important;
  width: 18px !important;
  height: 18px !important;
}

body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer {
  display: flex !important;
  flex: 0 0 auto !important;
  flex-direction: column !important;
  gap: 0 !important;
  max-height: none !important;
  min-height: 0 !important;
  margin: 0 !important;
  padding: 0 0 20px !important;
  overflow: visible !important;
  border-top: 0 !important;
  background: #fff !important;
}

body[class] #modal-cart .yamuna-minicart-fulfillment,
body[class] #modal-cart .yamuna-minicart-shipping,
body[class] #modal-cart .js-shipping-calculator-container {
  display: block !important;
  width: 100% !important;
  height: auto !important;
  max-height: none !important;
  margin: 0 !important;
  padding: 0 !important;
  float: none !important;
  min-height: 0 !important;
  overflow: visible !important;
  flex: 0 0 auto !important;
  pointer-events: auto !important;
  border-top: 1px solid #e5e1e4 !important;
}

body[class] #modal-cart .shipping-calculator-head,
body[class] #modal-cart .js-shipping-calculator-head,
body[class] #modal-cart .js-shipping-calculator-form,
body[class] #modal-cart .shipping-calculator-form,
body[class] #modal-cart .shipping-calculator-head.with-zip .js-shipping-calculator-form {
  position: static !important;
  display: block !important;
  width: 100% !important;
  height: auto !important;
  margin: 0 !important;
  padding: 20px 16px 0 !important;
  transform: none !important;
  opacity: 1 !important;
  visibility: visible !important;
  pointer-events: auto !important;
  z-index: 2 !important;
}

body[class] #modal-cart .shipping-calculator-head.with-form,
body[class] #modal-cart .shipping-calculator-head.with-zip,
body[class] #modal-cart .shipping-calculator-head.with-error {
  height: auto !important;
  min-height: 0 !important;
  max-height: none !important;
}

body[class] #modal-cart .transition-up,
body[class] #modal-cart .js-shipping-calculator-form.transition-up,
body[class] #modal-cart .js-shipping-calculator-with-zipcode.transition-up {
  top: 0 !important;
  opacity: 1 !important;
  pointer-events: auto !important;
  z-index: 2 !important;
}


body[class] #modal-cart .js-shipping-calculator-with-zipcode,
body[class] #modal-cart .shipping-calculator-head.with-zip .js-shipping-calculator-with-zipcode {
  position: absolute !important;
  left: -9999px !important;
  display: none !important;
  visibility: hidden !important;
  height: 0 !important;
  width: 0 !important;
  overflow: hidden !important;
  margin: 0 !important;
  padding: 0 !important;
  opacity: 0 !important;
  pointer-events: none !important;
}

body[class] #modal-cart .shipping-calculator-form .js-shipping-input,
body[class] #modal-cart .shipping-calculator-form .js-calculate-shipping,
body[class] #modal-cart .shipping-calculator-form .form-control,
body[class] #modal-cart .shipping-calculator-form button {
  pointer-events: auto !important;
  position: relative !important;
  z-index: 3 !important;
}

body[class] #modal-cart .yamuna-minicart-totals,
body[class] #modal-cart [data-component="cart-totals"] {
  border-top: 1px solid #4a1d3a !important;
}

body[class] #modal-cart .yamuna-pdp-shipping-label,
body[class] #modal-cart .shipping-calculator-form .form-label {
  display: block !important;
  width: 100% !important;
  margin: 0 0 8px !important;
  padding: 0 !important;
  color: #000 !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 600 !important;
  line-height: 1.3 !important;
  text-align: left !important;
}

body[class] #modal-cart [data-store="shipping-calculator"],
body[class] #modal-cart [data-store="shipping-calculator"].col-12,
body[class] #modal-cart .yamuna-minicart-shipping,
body[class] #modal-cart .yamuna-minicart-fulfillment,
body[class] #modal-cart .js-shipping-calculator-container {
  float: none !important;
  clear: both !important;
  display: block !important;
  width: 100% !important;
  max-width: 100% !important;
  box-sizing: border-box !important;
}

body[class] #modal-cart .shipping-calculator-form .form-group-inline,
body[class] #modal-cart .shipping-calculator-form .form-row {
  display: flex !important;
  flex-wrap: wrap !important;
  align-items: center !important;
  gap: 12px !important;
  margin: 0 !important;
  width: 100% !important;
  max-width: 100% !important;
  float: none !important;
}

body[class] #modal-cart .shipping-calculator-form .form-group-inline > .col-12,
body[class] #modal-cart .shipping-calculator-form .form-group-inline > .form-label,
body[class] #modal-cart .shipping-calculator-form .form-group-inline > .yamuna-pdp-shipping-label {
  float: none !important;
  flex: 0 0 100% !important;
  width: 100% !important;
  max-width: 100% !important;
  padding: 0 !important;
}

body[class] #modal-cart .shipping-calculator-form .form-group-inline > [class*="col-6"],
body[class] #modal-cart .shipping-calculator-form .form-group-inline > [class*="col-lg"] {
  float: none !important;
  flex: 1 1 0 !important;
  max-width: none !important;
  padding: 0 !important;
  width: auto !important;
  min-width: 0 !important;
}

body[class] #modal-cart .shipping-calculator-form .form-group-inline > .col-6.col-lg-5,
body[class] #modal-cart .shipping-calculator-form .form-group-inline > [class*="col-lg-5"] {
  flex: 0 0 110px !important;
  width: 110px !important;
  max-width: 110px !important;
}

body[class] #modal-cart .shipping-calculator-form .js-shipping-input,
body[class] #modal-cart .shipping-calculator-form .form-control {
  width: 100% !important;
  height: 40px !important;
  margin: 0 !important;
  padding: 0 16px !important;
  border: 1px solid #c0bbc3 !important;
  border-radius: 999px !important;
  color: #4a1d3a !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  text-align: center !important;
  background: #fff !important;
  box-shadow: none !important;
}

body[class] #modal-cart .shipping-calculator-form .js-calculate-shipping {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  width: 100% !important;
  min-width: 100px !important;
  height: 40px !important;
  margin: 0 !important;
  padding: 0 18px !important;
  border: 0 !important;
  border-radius: 999px !important;
  background: #f2d6e4 !important;
  color: #4a1d3a !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 700 !important;
  text-transform: uppercase !important;
  box-shadow: none !important;
}

body[class] #modal-cart .shipping-calculator-form .js-shipping-zipcode-help,
body[class] #modal-cart .shipping-calculator-form a.font-small {
  display: none !important;
}

body[class] #modal-cart .js-shipping-calculator-response,
body[class] #modal-cart .shipping-calculator-response {
  float: none !important;
  width: 100% !important;
  margin: 12px 0 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 8px !important;
  background: #f6f5f6 !important;
  overflow: hidden !important;
  box-shadow: none !important;
}

/* Prod: quotes only after Buscar ? hide auto-loaded / pre-searched results */
body[class] #modal-cart:not(.yamuna-shipping-searched) .js-shipping-calculator-response,
body[class] #modal-cart:not(.yamuna-shipping-searched) .shipping-calculator-response,
body[class] #modal-cart:not(.yamuna-shipping-searched) .js-shipping-calculator-spinner {
  display: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  visibility: hidden !important;
}

body[class] #modal-cart .js-shipping-calculator-response .yamuna-shipping-section-label,
body[class] #modal-cart .js-shipping-calculator-response .form-label {
  display: none !important;
}

body[class] #modal-cart .js-shipping-calculator-response .list-unstyled,
body[class] #modal-cart .js-shipping-calculator-response .box,
body[class] #modal-cart .js-shipping-calculator-response ul {
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 0 !important;
  background: transparent !important;
  box-shadow: none !important;
  list-style: none !important;
}

body[class] #modal-cart .yamuna-shipping-quote,
body[class] #modal-cart .js-shipping-list-item,
body[class] #modal-cart .radio-button-item {
  display: block !important;
  float: none !important;
  width: 100% !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-bottom: 1px solid #c0bbc3 !important;
  background: transparent !important;
  list-style: none !important;
}

body[class] #modal-cart .yamuna-shipping-quote:last-child,
body[class] #modal-cart .js-shipping-list-item:last-child,
body[class] #modal-cart .radio-button-item:last-child {
  border-bottom: 0 !important;
}

body[class] #modal-cart .yamuna-shipping-quote .radio-button,
body[class] #modal-cart .yamuna-shipping-quote .list-item,
body[class] #modal-cart .yamuna-shipping-quote .radio-button-content,
body[class] #modal-cart .yamuna-shipping-quote .yamuna-shipping-quote-content,
body[class] #modal-cart .yamuna-shipping-quote .radio-button input[type="radio"]:checked + .radio-button-content,
body[class] #modal-cart .yamuna-shipping-quote .radio-button input[type="radio"] + .radio-button-content {
  display: block !important;
  margin: 0 !important;
  padding: 10px 14px !important;
  border: 0 !important;
  border-radius: 0 !important;
  background: transparent !important;
  box-shadow: none !important;
  cursor: pointer !important;
}

body[class] #modal-cart .yamuna-shipping-quote .radio-button-icons-container,
body[class] #modal-cart .yamuna-shipping-quote .radio-button-icons,
body[class] #modal-cart .yamuna-shipping-quote .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container {
  display: none !important;
}

body[class] #modal-cart .yamuna-shipping-quote .radio-button-label {
  display: block !important;
  width: 100% !important;
  margin: 0 !important;
  padding: 0 !important;
}

body[class] #modal-cart .yamuna-shipping-quote-row {
  display: flex !important;
  align-items: flex-start !important;
  justify-content: space-between !important;
  gap: 12px !important;
  margin: 0 !important;
  width: 100% !important;
}

body[class] #modal-cart .yamuna-shipping-quote-info,
body[class] #modal-cart .yamuna-shipping-quote-row > [class*="col-"] {
  flex: 1 1 auto !important;
  max-width: none !important;
  width: auto !important;
  padding: 0 !important;
  float: none !important;
}

body[class] #modal-cart .yamuna-shipping-quote-name {
  margin: 0 !important;
  color: #292525 !important;
  font-family: Roboto, Dosis, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 400 !important;
  line-height: 1.3 !important;
}

body[class] #modal-cart .yamuna-shipping-quote-time,
body[class] #modal-cart .yamuna-shipping-quote-time-icon {
  display: block !important;
  float: none !important;
  margin: 2px 0 0 !important;
  color: #000 !important;
  opacity: 1 !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 12px !important;
  font-weight: 500 !important;
}

body[class] #modal-cart .yamuna-shipping-quote-time svg {
  display: none !important;
}

body[class] #modal-cart .yamuna-shipping-quote .shipping-method-price,
body[class] #modal-cart .yamuna-shipping-quote [data-component="option.price"],
body[class] #modal-cart .yamuna-shipping-quote-row > [class*="col-"]:last-child,
body[class] #modal-cart .yamuna-shipping-quote-price,
body[class] #modal-cart .yamuna-shipping-quote-price h5 {
  flex: 0 0 auto !important;
  margin: 0 !important;
  color: #292525 !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 600 !important;
  text-align: right !important;
  background: transparent !important;
}

body[class] #modal-cart .js-toggle-more-shipping-options,
body[class] #modal-cart .js-show-more-shipping-options {
  margin: 8px 0 0 !important;
  padding: 0 14px 10px !important;
  text-align: left !important;
}

body[class] #modal-cart .js-toggle-more-shipping-options a {
  color: #4a1d3a !important;
  font-family: Roboto, Arial, sans-serif !important;
  font-size: 13px !important;
  font-weight: 500 !important;
  text-decoration: underline !important;
}

body[class] #modal-cart .yamuna-minicart-totals,
body[class] #modal-cart [data-component="cart-totals"] {
  flex: 0 0 auto !important;
  width: 100% !important;
  margin: 0 !important;
  padding: 12px 16px 0 !important;
  box-sizing: border-box !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 16px !important;
  color: #000 !important;
}

body[class] #modal-cart .yamuna-minicart-totals-row,
body[class] #modal-cart [data-component="cart-totals"] .h5,
body[class] #modal-cart [data-component="cart-totals"] .h2,
body[class] #modal-cart [data-component="cart-totals"] .d-flex {
  display: flex !important;
  align-items: center !important;
  justify-content: space-between !important;
  gap: 12px !important;
  margin: 0 0 4px !important;
  padding: 0 !important;
  font-size: 16px !important;
  font-weight: 400 !important;
  line-height: 1.4 !important;
  color: #000 !important;
}

body[class] #modal-cart .yamuna-minicart-totals-total,
body[class] #modal-cart [data-component="cart-totals"] .h2 {
  margin-top: 2px !important;
  font-weight: 700 !important;
}

body[class] #modal-cart .yamuna-minicart-totals-total-price,
body[class] #modal-cart [data-component="cart-totals"] .h2 .js-cart-total,
body[class] #modal-cart [data-component="cart-totals"] .h2 [data-component="total.value"] {
  color: #238482 !important;
  font-weight: 700 !important;
}

body[class] #modal-cart .yamuna-minicart-totals .divider,
body[class] #modal-cart [data-component="cart-totals"] .divider,
body[class] #modal-cart .yamuna-minicart-totals .opacity-60,
body[class] #modal-cart .yamuna-minicart-totals .font-small {
  display: none !important;
}

body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-checkout,
body[class] #modal-cart .yamuna-cart-dropdown-footer .yamuna-cart-checkout {
  display: flex !important;
  flex: 0 0 auto !important;
  align-items: center !important;
  justify-content: center !important;
  gap: 10px !important;
  box-sizing: border-box !important;
  width: calc(100% - 32px) !important;
  max-width: none !important;
  height: 48px !important;
  min-height: 48px !important;
  margin: 16px 16px 0 !important;
  padding: 0 16px !important;
  border: 0 !important;
  border-radius: 999px !important;
  background: #238482 !important;
  color: #fff !important;
  font-family: Dosis, Roboto, Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  text-transform: uppercase !important;
  text-decoration: none !important;
  box-shadow: none !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer {
  display: flex !important;
  flex: 0 0 auto !important;
  flex-direction: column !important;
  padding: 0 0 20px !important;
  border-top: 0 !important;
  background: #fff !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer .yamuna-cart-checkout {
  width: calc(100% - 32px) !important;
  height: 48px !important;
  margin: 16px 16px 0 !important;
  border-radius: 999px !important;
  background: #c0bbc3 !important;
  color: #fff !important;
}

body[class] #modal-cart .yamuna-cart-checkout img {
  width: 18px !important;
  height: 18px !important;
  filter: brightness(0) invert(1) !important;
}

body[class] #modal-cart:not(:has(.js-cart-item)) .js-empty-ajax-cart {
  padding: 20px 16px 16px !important;
}

body[class] #modal-cart .js-visible-on-cart-filled.divider {
  display: none !important;
}

@media (max-width: 1023px) {
  body[class] #modal-cart .js-ajax-cart-list {
    padding: 0 12px !important;
  }

  body[class] #modal-cart .yamuna-minicart-item,
  body[class] #modal-cart .cart-item.yamuna-minicart-item {
    grid-template-columns: 80px minmax(0, 1fr) !important;
    padding: 16px 0 !important;
  }

  body[class] #modal-cart .yamuna-minicart-item-image,
  body[class] #modal-cart .yamuna-minicart-item-image a,
  body[class] #modal-cart .yamuna-minicart-item-image img {
    width: 80px !important;
    max-width: 80px !important;
    height: 80px !important;
    max-height: 80px !important;
  }

  body[class] #modal-cart .shipping-calculator-form,
  body[class] #modal-cart .js-shipping-calculator-form,
  body[class] #modal-cart .yamuna-minicart-totals,
  body[class] #modal-cart [data-component="cart-totals"] {
    padding-left: 12px !important;
    padding-right: 12px !important;
  }

  body[class] #modal-cart:has(.js-cart-item) .yamuna-cart-checkout,
  body[class] #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer .yamuna-cart-checkout {
    width: calc(100% - 24px) !important;
    margin-left: 12px !important;
    margin-right: 12px !important;
  }
}

{# Cen?rios 017-021: PLP filters, CTA hover, kit copy, footer gap, mobile dropdown, icon bg. #}

body.template-category .yamuna-plp-body .js-item-product.is-yamuna-filtered-out,
body.template-search .yamuna-plp-body .js-item-product.is-yamuna-filtered-out {
  display: none !important;
}

body.template-category .yamuna-plp-body .js-yamuna-filter-empty,
body.template-search .yamuna-plp-body .js-yamuna-filter-empty {
  width: 100%;
  margin: 24px 0 0;
  color: #4a1d3a;
  font-family: 'Dosis', sans-serif;
  font-size: 16px;
}

body.template-category .yamuna-plp-body,
body.template-search .yamuna-plp-body {
  padding-bottom: 64px !important;
}

body.template-category .yamuna-plp-body .yamuna-plp-buy-one,
body.template-search .yamuna-plp-body .yamuna-plp-buy-one,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three,
.yamuna-home-spot-buy-one,
.yamuna-home-spot-buy-three,
.yamuna-pdp-spot-buy-one,
.yamuna-pdp-spot-buy-three,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply,
.btn-primary,
.btn-secondary,
.yamuna-cart-checkout,
.yamuna-institutional-button,
.yamuna-resale-btn,
.yamuna-blog-cta-more,
.js-category-banner-button,
.section-banners-home[data-store="home-banner-categories"] .textbanner,
.section-banners-home[data-store="home-banner-promotional"] .textbanner {
  /* Cen?rio 091: match prod Tailwind transition-all ease-in-out (~150ms). */
  transition: all 0.15s cubic-bezier(0.4, 0, 0.2, 1);
}

.section-banners-home[data-store="home-banner-categories"] .textbanner-image img,
.section-banners-home[data-store="home-banner-promotional"] .textbanner-image img {
  transition: transform 0.15s cubic-bezier(0.4, 0, 0.2, 1);
}

.section-banners-home[data-store="home-banner-categories"] .textbanner:hover .textbanner-image img,
.section-banners-home[data-store="home-banner-promotional"] .textbanner:hover .textbanner-image img {
  transform: scale(1.03);
}

.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:hover,
.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:focus {
  background: #238482;
  color: #fff;
}

.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:hover .category-banner-button-icon,
.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:focus .category-banner-button-icon,
.section-banners-home[data-store="home-banner-categories"] .textbanner-link:hover .category-banner-button-icon,
.section-banners-home[data-store="home-banner-categories"] .textbanner-link:focus .category-banner-button-icon {
  filter: brightness(0) invert(1);
}

.yamuna-home-spot-buy-three img,
.yamuna-pdp-spot-buy-three img,
.yamuna-plp-buy-three img {
  transition: filter 0.15s cubic-bezier(0.4, 0, 0.2, 1);
}

body.template-category .yamuna-plp-body .yamuna-plp-buy-one:hover,
body.template-category .yamuna-plp-body .yamuna-plp-buy-one:focus,
body.template-search .yamuna-plp-body .yamuna-plp-buy-one:hover,
body.template-search .yamuna-plp-body .yamuna-plp-buy-one:focus,
.yamuna-home-spot-buy-one:hover,
.yamuna-home-spot-buy-one:focus,
.yamuna-pdp-spot-buy-one:hover,
.yamuna-pdp-spot-buy-one:focus {
  background: #1a6a68 !important;
  background-color: #1a6a68 !important;
  border-color: #1a6a68 !important;
  color: #fff !important;
  opacity: 1;
}

body.template-category .yamuna-plp-body .yamuna-plp-buy-three:hover,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:focus,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:hover,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:focus,
.yamuna-home-spot-buy-three:hover,
.yamuna-home-spot-buy-three:focus,
.yamuna-pdp-spot-buy-three:hover,
.yamuna-pdp-spot-buy-three:focus {
  background: #238482 !important;
  background-color: #238482 !important;
  border-color: #238482 !important;
  color: #fff !important;
  opacity: 1;
}

body.template-category .yamuna-plp-body .yamuna-plp-buy-three:hover img,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:focus img,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:hover img,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:focus img,
.yamuna-home-spot-buy-three:hover img,
.yamuna-home-spot-buy-three:focus img,
.yamuna-pdp-spot-buy-three:hover img,
.yamuna-pdp-spot-buy-three:focus img {
  filter: brightness(0) invert(1);
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply:hover,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply:focus,
.btn-primary:hover:not(.yamuna-home-spot-buy-one):not(.yamuna-pdp-spot-buy-one):not(.yamuna-plp-buy-one),
.btn-primary:focus:not(.yamuna-home-spot-buy-one):not(.yamuna-pdp-spot-buy-one):not(.yamuna-plp-buy-one),
.yamuna-cart-checkout:hover,
.yamuna-cart-checkout:focus {
  background: #8c1052 !important;
  background-color: #8c1052 !important;
  border-color: #8c1052 !important;
  color: #fff !important;
  opacity: 1;
}

{# Spot / PLP CTAs: keep teal hover (must win over .btn-primary / .btn-secondary). #}
body .btn.yamuna-home-spot-buy-one:hover,
body .btn.yamuna-home-spot-buy-one:focus,
body .btn-primary.yamuna-home-spot-buy-one:hover,
body .btn-primary.yamuna-home-spot-buy-one:focus,
body .btn.yamuna-pdp-spot-buy-one:hover,
body .btn.yamuna-pdp-spot-buy-one:focus,
body .btn-primary.yamuna-pdp-spot-buy-one:hover,
body .btn-primary.yamuna-pdp-spot-buy-one:focus,
body .yamuna-plp-buy-one:hover,
body .yamuna-plp-buy-one:focus,
body.template-category .yamuna-plp-body .yamuna-plp-buy-one:hover,
body.template-category .yamuna-plp-body .yamuna-plp-buy-one:focus,
body.template-search .yamuna-plp-body .yamuna-plp-buy-one:hover,
body.template-search .yamuna-plp-body .yamuna-plp-buy-one:focus,
body.template-home .yamuna-home-spot-buy-one:hover,
body.template-home .yamuna-home-spot-buy-one:focus,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one:hover,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one:focus,
[data-store^="home-products-"] .yamuna-home-spot-buy-one:hover,
[data-store^="home-products-"] .yamuna-home-spot-buy-one:focus {
  background: #1a6a68 !important;
  background-color: #1a6a68 !important;
  border-color: #1a6a68 !important;
  color: #fff !important;
  opacity: 1 !important;
}

body .btn.yamuna-home-spot-buy-three:hover,
body .btn.yamuna-home-spot-buy-three:focus,
body .btn-secondary.yamuna-home-spot-buy-three:hover,
body .btn-secondary.yamuna-home-spot-buy-three:focus,
body .btn.yamuna-pdp-spot-buy-three:hover,
body .btn.yamuna-pdp-spot-buy-three:focus,
body .btn-secondary.yamuna-pdp-spot-buy-three:hover,
body .btn-secondary.yamuna-pdp-spot-buy-three:focus,
body .yamuna-plp-buy-three:hover,
body .yamuna-plp-buy-three:focus,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:hover,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:focus,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:hover,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:focus,
body.template-home .yamuna-home-spot-buy-three:hover,
body.template-home .yamuna-home-spot-buy-three:focus,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three:hover,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three:focus,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus {
  background: #238482 !important;
  background-color: #238482 !important;
  border-color: #238482 !important;
  color: #fff !important;
  opacity: 1 !important;
}

body .btn.yamuna-home-spot-buy-three:hover,
body .btn.yamuna-home-spot-buy-three:focus,
body .btn-secondary.yamuna-home-spot-buy-three:hover,
body .btn-secondary.yamuna-home-spot-buy-three:focus,
body .btn.yamuna-pdp-spot-buy-three:hover,
body .btn.yamuna-pdp-spot-buy-three:focus,
body .yamuna-plp-buy-three:hover,
body .yamuna-plp-buy-three:focus,
body.template-home .yamuna-home-spot-buy-three:hover,
body.template-home .yamuna-home-spot-buy-three:focus,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:hover,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:focus,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:hover,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:focus,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three:hover,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three:focus {
  color: #fff !important;
}

body .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-label,
body .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-label,
body .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-prefix,
body .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-prefix,
body .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-price,
body .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-price,
body .yamuna-home-spot-buy-three:hover span,
body .yamuna-home-spot-buy-three:focus span,
body .yamuna-pdp-spot-buy-three:hover .yamuna-pdp-spot-buy-three-label,
body .yamuna-pdp-spot-buy-three:focus .yamuna-pdp-spot-buy-three-label,
body .yamuna-pdp-spot-buy-three:hover .yamuna-pdp-spot-buy-three-prefix,
body .yamuna-pdp-spot-buy-three:focus .yamuna-pdp-spot-buy-three-prefix,
body .yamuna-pdp-spot-buy-three:hover .yamuna-pdp-spot-buy-three-price,
body .yamuna-pdp-spot-buy-three:focus .yamuna-pdp-spot-buy-three-price,
body .yamuna-pdp-spot-buy-three:hover span,
body .yamuna-pdp-spot-buy-three:focus span,
body .yamuna-plp-buy-three:hover .yamuna-plp-buy-three-prefix,
body .yamuna-plp-buy-three:focus .yamuna-plp-buy-three-prefix,
body .yamuna-plp-buy-three:hover .yamuna-plp-buy-three-price,
body .yamuna-plp-buy-three:focus .yamuna-plp-buy-three-price,
body .yamuna-plp-buy-three:hover span,
body .yamuna-plp-buy-three:focus span,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-label,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-label,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-prefix,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-prefix,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-price,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-price,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover span,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus span {
  color: #fff !important;
}

body .btn.yamuna-home-spot-buy-three:hover img,
body .btn.yamuna-home-spot-buy-three:focus img,
body .btn-secondary.yamuna-home-spot-buy-three:hover img,
body .btn-secondary.yamuna-home-spot-buy-three:focus img,
body .btn.yamuna-pdp-spot-buy-three:hover img,
body .btn.yamuna-pdp-spot-buy-three:focus img,
body .yamuna-plp-buy-three:hover img,
body .yamuna-plp-buy-three:focus img,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:hover img,
body.template-category .yamuna-plp-body .yamuna-plp-buy-three:focus img,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:hover img,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three:focus img,
body.template-home .yamuna-home-spot-buy-three:hover img,
body.template-home .yamuna-home-spot-buy-three:focus img,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three:hover img,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three:focus img,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover img,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus img {
  filter: brightness(0) invert(1) !important;
}

body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
  gap: 6px !important;
}

body.template-category .yamuna-plp-body .yamuna-plp-buy-three-price,
body.template-search .yamuna-plp-body .yamuna-plp-buy-three-price {
  margin-left: 0 !important;
}

@media (max-width: 1023px) {
  body.template-category .yamuna-plp-hero-content,
  body.template-search .yamuna-plp-hero-content {
    padding-top: 24px !important;
  }

  body.template-category .yamuna-plp-hero-content h1,
  body.template-search .yamuna-plp-hero-content h1 {
    margin: 0 0 16px !important;
    line-height: 1.3 !important;
  }

  body.template-category .yamuna-plp-hero-description,
  body.template-category .yamuna-plp-hero-description *,
  body.template-search .yamuna-plp-hero-description,
  body.template-search .yamuna-plp-hero-description * {
    line-height: 1.6 !important;
  }

  body.template-category .yamuna-plp-sort-options,
  body.template-search .yamuna-plp-sort-options {
    position: absolute !important;
    top: calc(100% + 6px) !important;
    right: 0 !important;
    left: auto !important;
    z-index: 20 !important;
    min-width: 220px !important;
    max-width: min(280px, calc(100vw - 24px)) !important;
    overflow: auto !important;
    white-space: normal !important;
  }

  body.template-category .yamuna-plp-sort-option,
  body.template-search .yamuna-plp-sort-option {
    white-space: normal !important;
  }

  html:has(#nav-hamburger.modal-show) .head-main .yamuna-mobile-search {
    display: none !important;
  }

  body #nav-hamburger .yamuna-mobile-menu-account {
    position: relative !important;
    z-index: 1 !important;
  }

  body #nav-hamburger .yamuna-mobile-menu-search {
    position: relative !important;
    z-index: 1 !important;
    margin-top: 0 !important;
  }

  {# PLP reference: magenta circular header icons on every mobile page. #}
  body .head-main .yamuna-header-mobile-action {
    overflow: visible !important;
    border-radius: 50% !important;
    background: #a31460 !important;
  }

  body .head-main .yamuna-header-mobile-action .yamuna-header-mobile-glyph {
    top: 0 !important;
    left: 0 !important;
    width: 32px !important;
    height: 32px !important;
    overflow: visible !important;
    background: transparent !important;
  }
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-icon.checkbox-icon {
  background: transparent !important;
  border-color: #c8e4e3 !important;
}

{# Bugs 1-6 follow-ups: sticky footer, search focus, cart badge, stacking, dropdown pad. #}
html {
  height: 100%;
}

body {
  min-height: 100%;
  min-height: 100dvh;
  display: flex;
  flex-direction: column;
}

footer.yamuna-footer,
footer.yamuna-footer-cart {
  margin-top: auto;
  flex-shrink: 0;
}

body.template-category .yamuna-plp-body,
body.template-search .yamuna-plp-body {
  z-index: 0 !important;
}

html.yamuna-filters-open body.template-category .yamuna-plp-body,
html.yamuna-filters-open body.template-search .yamuna-plp-body {
  position: relative !important;
  z-index: 0 !important;
}

body .head-main .yamuna-header-desktop-search .js-search-input:focus,
body .head-main .yamuna-header-desktop-search .js-search-input:focus-visible,
body .head-main .yamuna-header-desktop-search .form-control:focus,
body .head-main .yamuna-header-desktop-search .form-control:focus-visible,
body .head-main .yamuna-mobile-search-input:focus,
body .head-main .yamuna-mobile-search-input:focus-visible,
body .head-main .yamuna-mobile-search-input.form-control:focus,
body .head-main .yamuna-mobile-search-input.form-control:focus-visible,
body #nav-hamburger .yamuna-mobile-menu-search-input:focus,
body #nav-hamburger .yamuna-mobile-menu-search-input:focus-visible,
body #nav-hamburger .yamuna-mobile-menu-search:focus-within {
  outline: none !important;
  outline-width: 0 !important;
  outline-color: transparent !important;
  box-shadow: none !important;
  -webkit-box-shadow: none !important;
  border-color: rgba(74, 29, 58, .32) !important;
}

body #nav-hamburger .yamuna-mobile-menu-search:focus-within {
  border-bottom-color: #e8e4ea !important;
}

body .head-main .yamuna-header-mobile-action {
  overflow: visible !important;
  border-radius: 50% !important;
  background: #a31460 !important;
}

body .head-main .yamuna-header-mobile,
body .head-main .yamuna-header-mobile-actions,
body .head-main .yamuna-header-desktop-utilities,
body .head-main .yamuna-header-desktop {
  overflow: visible !important;
}

body .head-main .yamuna-header-mobile-action .yamuna-header-mobile-glyph {
  top: 0 !important;
  left: 0 !important;
  width: 32px !important;
  height: 32px !important;
  overflow: visible !important;
  border-radius: 0 !important;
  background: transparent !important;
}

body .head-main .yamuna-header-mobile-cart-count,
body .head-main .yamuna-header-mobile-action .yamuna-header-mobile-cart-count,
body .head-main .yamuna-header-mobile-action .badge-amount {
  position: absolute !important;
  top: -5px !important;
  right: -5px !important;
  z-index: 2 !important;
  display: flex !important;
  min-width: 16px !important;
  height: 16px !important;
  padding: 0 3px !important;
  align-items: center !important;
  justify-content: center !important;
  overflow: visible !important;
  border: 1px solid #fff !important;
  border-radius: 999px !important;
  background: #a31460 !important;
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 9px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  text-align: center !important;
  box-sizing: border-box !important;
}

body .head-main .yamuna-header-cart-count,
body .head-main .yamuna-header-desktop-utilities .yamuna-header-cart-count,
body .head-main .yamuna-header-desktop-utilities .badge-amount {
  position: absolute !important;
  top: -8px !important;
  right: -10px !important;
  z-index: 2 !important;
  display: flex !important;
  min-width: 16px !important;
  height: 16px !important;
  padding: 0 3px !important;
  align-items: center !important;
  justify-content: center !important;
  overflow: visible !important;
  border: 0 !important;
  border-radius: 999px !important;
  background: #fff !important;
  color: #a31460 !important;
  font-size: 10px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  box-sizing: border-box !important;
}

@media (min-width: 1024px) {
  {# Last word: grow with list padding. Fixed 358px clipped bottom items. #}
  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown,
  body[class].template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
    height: auto !important;
    min-height: calc(48px + 320px + 48px + var(--yamuna-panel-overlap, 105px)) !important;
    max-height: none !important;
    box-sizing: border-box !important;
    overflow: hidden !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems,
  body[class].template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown .desktop-list-subitems {
    height: auto !important;
    min-height: 0 !important;
    max-height: none !important;
    margin: 0 !important;
    padding: 48px 34px 56px !important;
    align-content: start !important;
    align-self: start !important;
    box-sizing: border-box !important;
    overflow: visible !important;
  }
}

{# Active Yamuna PLP filter chips under FILTRAR / Ordenar. #}
.yamuna-plp-active-filters {
  display: none;
  width: min(1312px, calc(100% - 48px));
  margin: 0 auto 8px;
  padding: 0 0 8px;
  flex-wrap: wrap;
  gap: 8px;
  align-items: center;
}

.yamuna-plp-active-filters.is-visible {
  display: flex;
}

.yamuna-plp-active-filters-label {
  color: #4a1d3a;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  font-weight: 600;
  text-transform: uppercase;
}

.yamuna-plp-active-filter-chip {
  display: inline-flex;
  min-height: 28px;
  padding: 4px 10px 4px 12px;
  align-items: center;
  gap: 8px;
  border: 1px solid #238482;
  border-radius: 999px;
  background: #e5f3f2;
  color: #238482;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  font-weight: 600;
  line-height: 1.2;
  cursor: pointer;
}

.yamuna-plp-active-filter-chip-remove {
  display: inline-flex;
  width: 16px;
  height: 16px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: #238482;
  color: #fff;
  font-size: 12px;
  font-weight: 700;
  line-height: 1;
}

.yamuna-plp-active-filters-clear {
  margin-left: 4px;
  color: #a31460;
  font-family: 'Dosis', sans-serif;
  font-size: 13px;
  font-weight: 600;
  text-decoration: underline;
  text-transform: uppercase;
}

@media (max-width: 1023px) {
  .yamuna-plp-active-filters {
    width: calc(100% - 24px);
    margin: 0 auto 16px;
  }
}

{# sync 2026-09-10T10:09:43.1444373-03:00 #}

{# ==========================================================================
   Cen?rios 001-004 (Sep 2026): ribbon tag, mobile bg/icons, kit copy, menu top.
   ========================================================================== #}

{# Cenario 002: align every mobile page bg to PLP #f6f5f6 and header icon circles. #}
@media (max-width: 1023px) {
  body.template-product,
  body.template-home,
  body.template-category,
  body.template-search,
  body.template-cart,
  body.template-account,
  body.template-blog,
  body.template-page {
    background-color: #f6f5f6 !important;
  }

  body .head-main .yamuna-header-mobile-action,
  body.template-product .head-main .yamuna-header-mobile-action,
  body.template-home .head-main .yamuna-header-mobile-action,
  body.template-category .head-main .yamuna-header-mobile-action,
  body.template-search .head-main .yamuna-header-mobile-action {
    overflow: visible !important;
    border-radius: 50% !important;
    background: #a31460 !important;
  }

  body .head-main .yamuna-header-mobile-glyph,
  body.template-product .head-main .yamuna-header-mobile-glyph,
  body.template-home .head-main .yamuna-header-mobile-glyph,
  body.template-category .head-main .yamuna-header-mobile-glyph,
  body.template-search .head-main .yamuna-header-mobile-glyph {
    top: 0 !important;
    left: 0 !important;
    width: 32px !important;
    height: 32px !important;
  }
}

{# Cenario 003: home kit copy spacing + PLP mobile kit font bump without wrap. #}
@media (max-width: 767px) {
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-buy-three-label {
    display: inline-flex !important;
    align-items: baseline !important;
    gap: 0.3em !important;
    max-width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    letter-spacing: 0.02em !important;
    word-spacing: 0.14em !important;
  }

  [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-buy-three-prefix {
    flex: 0 0 auto;
    margin-right: 0 !important;
  }

  [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-buy-three-price {
    flex: 0 1 auto;
    min-width: 0;
    margin-left: 0 !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three {
    gap: 6px !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-prefix,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-price,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-prefix,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-price {
    margin-left: 0 !important;
    letter-spacing: 0.01em;
    word-spacing: 0.08em;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three img,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three img {
    width: 14px !important;
    min-width: 14px !important;
    height: 14px !important;
  }
}

{# Cenario 004: full-viewport hamburger + body scroll lock.
   Must beat body[class] #nav-hamburger { top: 80px; height: calc(100dvh - 80px) }. #}
@media (max-width: 1023px) {
  body[class] #nav-hamburger.modal-nav-hamburger,
  body[class] #nav-hamburger.modal.modal-nav-hamburger,
  body #nav-hamburger.modal-nav-hamburger,
  body #nav-hamburger.modal.modal-nav-hamburger {
    position: fixed !important;
    top: 0 !important;
    right: auto !important;
    bottom: 0 !important;
    left: 0 !important;
    z-index: 40000 !important;
    width: min(100vw, 320px) !important;
    max-width: 320px !important;
    height: 100vh !important;
    height: 100dvh !important;
    min-height: 100vh !important;
    min-height: 100dvh !important;
    max-height: none !important;
    margin: 0 !important;
    padding: 0 !important;
    transform: translate3d(-100%, 0, 0) !important;
  }

  body[class] #nav-hamburger.modal-nav-hamburger.modal-show,
  body[class] #nav-hamburger.modal.modal-nav-hamburger.modal-show,
  body #nav-hamburger.modal-nav-hamburger.modal-show,
  body #nav-hamburger.modal.modal-nav-hamburger.modal-show {
    top: 0 !important;
    bottom: 0 !important;
    height: 100vh !important;
    height: 100dvh !important;
    min-height: 100vh !important;
    min-height: 100dvh !important;
    z-index: 40000 !important;
    transform: translate3d(0, 0, 0) !important;
  }

  body[class] #nav-hamburger .modal-body,
  body #nav-hamburger .modal-body {
    min-height: 100% !important;
    height: 100% !important;
    overflow-y: auto !important;
    -webkit-overflow-scrolling: touch;
  }

  body[class] .js-modal-overlay[data-modal-id="#nav-hamburger"],
  body .js-modal-overlay[data-modal-id="#nav-hamburger"] {
    z-index: 39999 !important;
  }

  html:has(#nav-hamburger.modal-show) .head-main,
  html:has(#nav-hamburger.modal-show) .head-main.head-fixed,
  html:has(#nav-hamburger.modal-show) body .head-main {
    z-index: 1 !important;
  }

  html:has(#nav-hamburger.modal-show),
  html:has(#nav-hamburger.modal-show) body,
  html.yamuna-menu-scroll-lock,
  html.yamuna-menu-scroll-lock body,
  body.overflow-none {
    overflow: hidden !important;
    overscroll-behavior: none !important;
  }
}

{# Cenario 002 follow-up: transparent ? #fff on scroll applies on mobile only.
   Desktop navbar keeps the pre-existing theme rules (do not restyle here). #}
@media (max-width: 1023px) {
  body[class] .head-main,
  body[class] .head-main.head-fixed,
  body.template-category .head-main,
  body.template-category .head-main.head-fixed,
  body.template-search .head-main,
  body.template-search .head-main.head-fixed,
  body.template-product .head-main,
  body.template-cart .head-main,
  body.template-page .head-main,
  body.template-blog .head-main,
  body.template-account .head-main,
  body.template-home .head-main {
    position: fixed !important;
    top: 0 !important;
    right: 0 !important;
    left: 0 !important;
    z-index: 1050 !important;
    width: 100% !important;
    height: 80px !important;
    padding: 0 !important;
    background: transparent !important;
    box-shadow: none !important;
    transition: background-color .24s ease, box-shadow .24s ease;
  }

  body[class] .head-main .yamuna-header-mobile,
  body.template-category .head-main .yamuna-header-mobile,
  body.template-search .head-main .yamuna-header-mobile,
  body.template-product .head-main .yamuna-header-mobile,
  body.template-home .head-main .yamuna-header-mobile {
    background: transparent !important;
  }

  html.yamuna-header-scrolled body[class] .head-main,
  html.yamuna-header-scrolled body[class] .head-main.head-fixed,
  html.yamuna-header-scrolled body.template-category .head-main,
  html.yamuna-header-scrolled body.template-search .head-main,
  html.yamuna-header-scrolled body.template-product .head-main,
  html.yamuna-header-scrolled body.template-cart .head-main,
  html.yamuna-header-scrolled body.template-page .head-main,
  html.yamuna-header-scrolled body.template-blog .head-main,
  html.yamuna-header-scrolled body.template-account .head-main,
  html.yamuna-header-scrolled body.template-home .head-main {
    background: #fff !important;
    background-color: #fff !important;
    box-shadow: 0 1px 0 rgba(54, 53, 68, .08);
  }

  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-mobile,
  html.yamuna-header-scrolled body.template-category .head-main .yamuna-header-mobile,
  html.yamuna-header-scrolled body.template-search .head-main .yamuna-header-mobile,
  html.yamuna-header-scrolled body.template-product .head-main .yamuna-header-mobile,
  html.yamuna-header-scrolled body.template-home .head-main .yamuna-header-mobile {
    background: #fff !important;
    background-color: #fff !important;
  }

  body.template-category > .mt-4,
  body.template-search > .mt-4,
  body.template-product > .mt-4,
  body.template-cart > .mt-4,
  body.template-page > .mt-4,
  body.template-blog > .mt-4,
  body.template-account > .mt-4 {
    padding-top: 80px !important;
    margin-top: 0 !important;
  }
}

{# Final: keep discount ribbon unclipped (prod cards use overflow:visible). #}
body.template-category .yamuna-plp-body .js-item-product,
body.template-search .yamuna-plp-body .js-item-product,
body.template-category .yamuna-plp-body .item-product,
body.template-search .yamuna-plp-body .item-product,
body.template-category .yamuna-plp-body .item-image,
body.template-search .yamuna-plp-body .item-image,
body.template-category .js-product-table .item-product,
body.template-search .js-product-table .item-product,
body.template-category .js-product-table .item-image,
body.template-search .js-product-table .item-image,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .js-item-product,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item-product,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item {
  overflow: visible !important;
}

{# ==========================================================================
   PDP Cen?rios 001-005 (Sep 2026)
   001/002 price cards Figma ? 003 CEP label 16px ? 004 gap/help ? 005 sticky
   ========================================================================== #}
@media (min-width: 1360px) {
  {# C005: right info column sticks; gallery scrolls underneath. #}
  body.template-product #single-product,
  body.template-product #single-product > .container,
  body.template-product .section-single-product {
    overflow: visible !important;
  }

  body.template-product .section-single-product {
    align-items: start !important;
  }

  body.template-product .yamuna-pdp-summary {
    position: sticky !important;
    top: 120px !important;
    z-index: 5 !important;
    align-self: start !important;
    max-height: none !important;
    overflow: visible !important;
  }

  {# Figma 807:5656 + 807:5670 + 847:9252 ? UNIDADE / price stack / COMPRE 3. #}
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards {
    display: flex !important;
    flex-direction: row !important;
    align-items: stretch !important;
    width: 528px !important;
    margin: 24px 0 !important;
    gap: 32px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card {
    position: relative !important;
    box-sizing: border-box !important;
    width: 248px !important;
    min-width: 248px !important;
    height: 170px !important;
    min-height: 170px !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: visible !important;
    border: 0 !important;
    border-radius: 24px !important;
    background: #fff !important;
    box-shadow: 0 4px 10px rgba(0, 0, 0, .16) !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit {
    display: block !important;
    padding: 0 !important;
  }

  {# 807:5656 ? filled stadium header #}
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit::before {
    position: absolute !important;
    top: 0 !important;
    right: 0 !important;
    left: 0 !important;
    z-index: 1 !important;
    box-sizing: border-box !important;
    width: 248px !important;
    height: 48px !important;
    border: 0 !important;
    border-radius: 46px !important;
    background: #4a1d3a !important;
    color: #fff !important;
    content: 'UNIDADE' !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 20px !important;
    font-weight: 400 !important;
    line-height: 48px !important;
    text-align: center !important;
    text-transform: uppercase !important;
  }

  {# 847:9252 ? outlined stadium header #}
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-heading {
    position: absolute !important;
    top: 0 !important;
    right: 0 !important;
    left: 0 !important;
    z-index: 1 !important;
    box-sizing: border-box !important;
    width: 100% !important;
    height: 48px !important;
    border: 1px solid #a31460 !important;
    border-radius: 46px !important;
    background: #fff !important;
    color: #a31460 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 20px !important;
    font-weight: 400 !important;
    line-height: 46px !important;
    text-align: center !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount {
    position: absolute !important;
    top: 36px !important;
    left: 9px !important;
    display: flex !important;
    width: 47px !important;
    height: 47px !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
    z-index: 3 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount img {
    position: absolute !important;
    inset: 0 !important;
    width: 47px !important;
    height: 47px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount strong {
    position: relative !important;
    z-index: 1 !important;
    color: #fff !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 20px !important;
    font-weight: 800 !important;
    line-height: 1 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-discount small {
    position: relative !important;
    z-index: 1 !important;
    margin-top: -2px !important;
    color: #fff !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1 !important;
  }

  {# 807:5670 ? centered price stack inside UNIDADE #}
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
    top: 72px !important;
    right: 0 !important;
    left: 0 !important;
    display: flex !important;
    width: 100% !important;
    justify-content: center !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .js-price-display {
    margin: 0 !important;
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 28px !important;
    text-align: center !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit .yamuna-pdp-price-card-meta {
    position: absolute !important;
    top: 102px !important;
    right: 12px !important;
    left: 12px !important;
    display: flex !important;
    flex-direction: column !important;
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

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-installments {
    display: block !important;
    width: 100% !important;
    margin: 0 !important;
    text-align: center !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-pix > span {
    color: #393747 !important;
  }

  {# 847:9252 ? COMPRE 3 body: center on price start (aligns with COMPRE 3);
     "pre?o unit?rio" hangs to the right and does not shift the anchor #}
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three {
    display: block !important;
    order: 0 !important;
    cursor: pointer;
    border: 0 !important;
    color: inherit;
    font: inherit;
    text-align: inherit;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    position: absolute !important;
    top: 72px !important;
    right: 12px !important;
    left: 12px !important;
    display: grid !important;
    grid-template-columns: max-content 0 !important;
    grid-template-rows: auto auto auto !important;
    justify-content: center !important;
    justify-items: stretch !important;
    align-items: end !important;
    column-gap: 8px !important;
    row-gap: 0 !important;
    padding: 0 !important;
    text-align: left !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-buy-three-price {
    grid-column: 1 !important;
    grid-row: 1 !important;
    justify-self: stretch !important;
    margin: 0 !important;
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 28px !important;
    text-align: left !important;
    text-transform: uppercase !important;
    white-space: nowrap !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-unit-label {
    grid-column: 2 !important;
    grid-row: 1 !important;
    justify-self: start !important;
    align-self: end !important;
    width: max-content !important;
    max-width: none !important;
    margin: 0 0 2px !important;
    padding: 0 !important;
    overflow: visible !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 8px !important;
    font-weight: 600 !important;
    line-height: 9px !important;
    text-align: left !important;
    text-transform: uppercase !important;
    white-space: nowrap !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    grid-column: 1 !important;
    justify-self: start !important;
    box-sizing: content-box !important;
    width: 0 !important;
    min-width: 0 !important;
    max-width: none !important;
    overflow: visible !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    line-height: 18px !important;
    text-align: left !important;
    white-space: nowrap !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card .js-shipping-label,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card .labels,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card .js-labels-floating-group {
    display: none !important;
  }


  {# C003: CEP instruction 16px on desk. #}
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-label span,
  body.template-product .yamuna-pdp-summary .shipping-calculator-form .form-label,
  body.template-product .yamuna-pdp-summary .shipping-calculator-form .yamuna-pdp-shipping-label {
    max-width: none !important;
    color: #393747 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 500 !important;
    line-height: 1.3 !important;
  }

  {# C004: 16px gaps between CEP input / BUSCAR / help; help link 14px inline. #}
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline {
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
    column-gap: 16px !important;
    row-gap: 12px !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12:has(.js-shipping-zipcode-help),
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12:has(.yamuna-pdp-shipping-help) {
    flex: 0 0 auto !important;
    width: auto !important;
    max-width: none !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-zipcode-help,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-help,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-shipping-help {
    display: inline-block !important;
    margin: 0 !important;
    color: #238482 !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 700 !important;
    line-height: 1.2 !important;
    text-decoration: underline !important;
    white-space: nowrap !important;
  }
}

{# ==========================================================================
   PDP Cen?rios 006-010 ? final overrides (source order wins)
   006/007: Tabela nutricional uppercase, sem borda, tamanho Figma (~147x29)
   008: Gallery 650x650 + favoritos (t?tulo + overlay na 1? imagem)
   009: Qty selector 150x48 com espa?o interno Figma
   010: CEP sem background + texto centralizado
   ========================================================================== #}
@media (min-width: 1360px) {
  /* 008 ? gallery card 650x650 (prod) with room for favorite icon */
  body.template-product #single-product > .container {
    width: 1312px !important;
    max-width: 1312px !important;
  }

  body.template-product .section-single-product {
    display: grid !important;
    grid-template-columns: 650px 528px !important;
    column-gap: 134px !important;
    width: 1312px !important;
  }

  body.template-product .yamuna-pdp-gallery-column,
  body.template-product .yamuna-product-gallery-desktop,
  body.template-product .yamuna-product-gallery-item {
    width: 650px !important;
    min-width: 650px !important;
    max-width: 650px !important;
  }

  body.template-product .yamuna-product-gallery-item {
    position: relative !important;
    height: 650px !important;
    overflow: hidden !important;
    border-radius: 24px !important;
    background: #fff !important;
  }

  body.template-product .yamuna-product-gallery-item img {
    width: 100% !important;
    height: 100% !important;
    object-fit: cover !important;
  }

  /* 008 ? favorite beside title (like prod) */
  body.template-product .yamuna-pdp-summary .yamuna-pdp-title-row {
    display: flex !important;
    flex-direction: row !important;
    align-items: flex-start !important;
    justify-content: space-between !important;
    gap: 16px !important;
    width: 100% !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-title-row .js-product-name {
    flex: 1 1 auto !important;
    min-width: 0 !important;
    margin: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-favorite {
    flex: 0 0 auto !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 32px !important;
    height: 32px !important;
    margin-top: 4px !important;
    padding: 0 !important;
    border: 0 !important;
    background: transparent !important;
    line-height: 0 !important;
    cursor: pointer !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-favorite svg {
    width: 32px !important;
    height: 32px !important;
    display: block !important;
  }

  /* 006 + 007 ? nutrition button: uppercase, no border, Figma size */
  body.template-product #product-description .yamuna-pdp-nutrition-btn,
  body.template-product #product-description button.yamuna-pdp-nutrition-btn,
  body.template-product #product-description a.yamuna-pdp-nutrition-btn {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    width: auto !important;
    min-width: 0 !important;
    min-height: 29px !important;
    height: auto !important;
    margin: 8px 0 0 0 !important;
    padding: 4px 12px !important;
    border: 0 !important;
    outline: 0 !important;
    box-shadow: none !important;
    border-radius: 40px !important;
    background: #e5c3da !important;
    color: #4a1d3a !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1.5 !important;
    letter-spacing: 0 !important;
    text-transform: uppercase !important;
    text-decoration: none !important;
    cursor: pointer !important;
    appearance: none !important;
    -webkit-appearance: none !important;
  }

  /* 009 ? qty 150x48, equal internal thirds (~50px) */
  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4,
  body.template-product .yamuna-pdp-summary #product_form .js-quantity.form-group,
  body.template-product .yamuna-pdp-summary .form-group.js-quantity {
    width: 150px !important;
    max-width: 150px !important;
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
    flex: 0 0 50px !important;
    align-items: center !important;
    justify-content: center !important;
    width: 50px !important;
    min-width: 50px !important;
    max-width: 50px !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    background: rgba(192, 187, 195, 0.28) !important;
    color: #9e929e !important;
    box-shadow: none !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:first-child {
    border-radius: 32px 0 0 32px !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity-icon:last-child {
    border-radius: 0 32px 32px 0 !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control-container,
  body.template-product .yamuna-pdp-summary .form-quantity .col {
    display: flex !important;
    flex: 0 0 48px !important;
    align-items: center !important;
    justify-content: center !important;
    width: 48px !important;
    max-width: 48px !important;
    min-width: 48px !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
    border-top: 0 !important;
    border-bottom: 0 !important;
    border-left: 1px solid #c0bbc3 !important;
    border-right: 1px solid #c0bbc3 !important;
    background: #fff !important;
    box-sizing: border-box !important;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control,
  body.template-product .yamuna-pdp-summary .form-quantity .form-control-inline,
  body.template-product .yamuna-pdp-summary .form-quantity .js-quantity-input {
    display: block !important;
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: 100% !important;
    min-width: 0 !important;
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
    -moz-appearance: textfield;
  }

  body.template-product .yamuna-pdp-summary .form-quantity .form-control::-webkit-outer-spin-button,
  body.template-product .yamuna-pdp-summary .form-quantity .form-control::-webkit-inner-spin-button {
    margin: 0;
    -webkit-appearance: none;
  }

  /* 010 ? CEP: no white bg, centered text */
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-shipping-input,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form input.form-control {
    background: transparent !important;
    background-color: transparent !important;
    text-align: center !important;
    padding: 0 12px !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control::placeholder,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-shipping-input::placeholder {
    text-align: center !important;
    opacity: 1 !important;
  }
}

/* Nutrition button also on tablet/mobile (006/007) */
@media (max-width: 1359px) {
  body.template-product #product-description .yamuna-pdp-nutrition-btn,
  body.template-product #product-description button.yamuna-pdp-nutrition-btn,
  body.template-product #product-description a.yamuna-pdp-nutrition-btn {
    border: 0 !important;
    outline: 0 !important;
    box-shadow: none !important;
    text-transform: uppercase !important;
    background: #e5c3da !important;
    color: #4a1d3a !important;
    padding: 4px 12px !important;
    min-height: 29px !important;
    border-radius: 40px !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    appearance: none !important;
    -webkit-appearance: none !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-title-row {
    display: flex !important;
    align-items: flex-start !important;
    justify-content: space-between !important;
    gap: 12px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-favorite {
    flex: 0 0 auto !important;
    display: inline-flex !important;
    margin-top: 4px !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-shipping-input {
    background: transparent !important;
    background-color: transparent !important;
    text-align: center !important;
  }
}

{# ==========================================================================
   PDP Cen?rios 011-015
   011: BUSCAR ? texto centrado verticalmente no bot?o
   012: Accordion band altura 277px (Figma)
   013: Accordion full-bleed na PDP
   014: Gap seta ? texto 35px
   015: Raleway (accordions + VOC? PODE GOSTAR)
   ========================================================================== #}
@media (min-width: 1360px) {
  /* 011 ? BUSCAR vertical center */
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-calculate-shipping,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form button.btn {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    height: 48px !important;
    min-height: 48px !important;
    max-height: 48px !important;
    padding: 0 16px !important;
    border: 0 !important;
    line-height: 1 !important;
    vertical-align: middle !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn *,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-calculate-shipping * {
    line-height: 1 !important;
    margin: 0 !important;
    padding: 0 !important;
    vertical-align: middle !important;
  }

  /* 012 + 013 ? full-bleed accordion band, 277px collapsed */
  body.template-product #single-product {
    overflow: visible !important;
  }

  body.template-product #product-description-accordions {
    display: flex !important;
    align-items: center !important;
    box-sizing: border-box !important;
    width: 100% !important;
    max-width: none !important;
    min-height: 277px !important;
    height: auto !important;
    margin: 64px 0 0 !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding: 24px 0 !important;
    background: #f0f0f0 !important;
  }

  body.template-product #product-description-accordions .yamuna-pdp-accordions-inner {
    box-sizing: border-box !important;
    width: 1312px !important;
    max-width: 1312px !important;
    margin: 0 auto !important;
    padding: 0 !important;
  }

  body.template-product #product-description-accordions .yamuna-product-description-blocks {
    display: grid !important;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr) !important;
    column-gap: 192px !important;
    row-gap: 0 !important;
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
  }

  body.template-product #product-description-accordions .yamuna-product-description-accordion {
    min-height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    background: transparent !important;
    border-top: 1px solid rgba(195, 136, 162, 0.25) !important;
  }

  body.template-product #product-description-accordions .yamuna-product-description-accordion:last-child,
  body.template-product #product-description-accordions .yamuna-product-description-accordion:nth-last-child(2) {
    border-bottom: 1px solid rgba(195, 136, 162, 0.25) !important;
  }

  /* 011 (accordion) + 014 ? icon/text vertical center + 18px gap (Figma) */
  body.template-product #product-description-accordions .informationDiv {
    display: flex !important;
    flex-direction: row !important;
    align-items: center !important;
    gap: 18px !important;
    min-height: 48px !important;
    margin: 0 !important;
    padding: 8px 0 !important;
    border-bottom: 0 !important;
  }

  body.template-product #product-description-accordions .yamuna-pdp-accordion-icon,
  body.template-product #product-description-accordions .informationDiv img {
    display: inline-flex !important;
    flex: 0 0 16px !important;
    align-items: center !important;
    justify-content: center !important;
    align-self: center !important;
    width: 16px !important;
    height: 16px !important;
    margin: 0 !important;
    line-height: 0 !important;
  }

  body.template-product #product-description-accordions .informationDiv > h3 {
    display: flex !important;
    flex: 1 1 auto !important;
    align-items: center !important;
    margin: 0 !important;
    padding: 0 !important;
    color: #393747 !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 20px !important;
    font-weight: 600 !important;
    line-height: 1.2 !important;
    text-transform: none !important;
  }

  body.template-product #product-description-accordions .infoToOpen {
    padding: 0 0 16px 34px !important;
    color: #393747 !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 16px !important;
    line-height: 1.5 !important;
  }

  /* 015 ? Raleway on related title */
  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .products-section-title.h1,
  body.template-product .yamuna-pdp-related h2.products-section-title,
  body.template-product .yamuna-pdp-related .h1 {
    font-family: 'Raleway', sans-serif !important;
  }
}

@media (max-width: 1359px) {
  body.template-product #product-description-accordions {
    width: 100% !important;
    max-width: none !important;
    margin: 24px 0 0 !important;
    padding: 16px 12px !important;
    background: #f0f0f0 !important;
  }

  body.template-product #product-description-accordions .yamuna-pdp-accordions-inner {
    width: 100% !important;
    max-width: 100% !important;
    margin: 0 !important;
  }

  body.template-product #product-description-accordions .informationDiv {
    display: flex !important;
    align-items: center !important;
    gap: 18px !important;
  }

  body.template-product #product-description-accordions .informationDiv > h3,
  body.template-product #product-description-accordions .infoToOpen {
    font-family: 'Raleway', sans-serif !important;
  }

  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .h1 {
    font-family: 'Raleway', sans-serif !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-calculate-shipping {
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    padding: 0 12px !important;
    line-height: 1 !important;
  }
}

{# ==========================================================================
   PDP/PLP/Home Cen?rios 016-022
   ========================================================================== #}

/* 016 ? arrows OVER the first/last cards (inside the card section),
   not in the page gutters. Keep swiper overflow:hidden. */
@media (min-width: 768px) {
  .section-featured-home .yamuna-home-products,
  body.template-product .yamuna-pdp-related .products-section-container,
  body.template-product .yamuna-pdp-related .products-slider {
    position: relative !important;
  }

  .section-featured-home .yamuna-home-products .swiper-container,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-container,
  body.template-product .yamuna-pdp-related .swiper-container {
    overflow: hidden !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev,
  body.template-product .yamuna-pdp-related .swiper-button-prev,
  body.template-product .yamuna-pdp-related .js-swiper-related-prev {
    left: 20px !important;
    right: auto !important;
    z-index: 2 !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-next,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next,
  body.template-product .yamuna-pdp-related .swiper-button-next,
  body.template-product .yamuna-pdp-related .js-swiper-related-next {
    right: 20px !important;
    left: auto !important;
    z-index: 2 !important;
  }

  /* Home: keep vertical center on the product image area */
  .section-featured-home .yamuna-home-products .swiper-button-prev,
  .section-featured-home .yamuna-home-products .swiper-button-next,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next {
    top: calc(50% + 24px) !important;
    margin-top: -24px !important;
  }

  /* PDP related: over the image band of the cards */
  body.template-product .yamuna-pdp-related .swiper-button-prev,
  body.template-product .yamuna-pdp-related .swiper-button-next,
  body.template-product .yamuna-pdp-related .js-swiper-related-prev,
  body.template-product .yamuna-pdp-related .js-swiper-related-next {
    top: 220px !important;
    margin-top: 0 !important;
  }

  /* Glass circle arrows over product/related cards — keep card style, thicker chevron. */
  .section-featured-home .yamuna-home-products .swiper-button-prev,
  .section-featured-home .yamuna-home-products .swiper-button-next,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next,
  body.template-product .yamuna-pdp-related .swiper-button-prev,
  body.template-product .yamuna-pdp-related .swiper-button-next {
    display: flex !important;
    width: 48px !important;
    height: 48px !important;
    min-width: 48px !important;
    min-height: 48px !important;
    padding: 0 !important;
    align-items: center !important;
    justify-content: center !important;
    background: rgba(255, 255, 255, 0.42) !important;
    background-color: rgba(255, 255, 255, 0.42) !important;
    background-image: none !important;
    border: 1px solid rgba(255, 255, 255, 0.55) !important;
    border-radius: 50% !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
    color: #238482 !important;
    fill: #238482 !important;
    line-height: 0 !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev.svg-circle,
  .section-featured-home .yamuna-home-products .swiper-button-next.svg-circle,
  .section-featured-home .yamuna-home-products .swiper-button-prev.svg-solid,
  .section-featured-home .yamuna-home-products .swiper-button-next.svg-solid,
  .section-featured-home .yamuna-home-products .swiper-button-prev.svg-icon-text,
  .section-featured-home .yamuna-home-products .swiper-button-next.svg-icon-text,
  body.template-product .yamuna-pdp-related .swiper-button-prev.svg-circle,
  body.template-product .yamuna-pdp-related .swiper-button-next.svg-circle,
  body.template-product .yamuna-pdp-related .swiper-button-prev.svg-solid,
  body.template-product .yamuna-pdp-related .swiper-button-next.svg-solid {
    border: 1px solid rgba(255, 255, 255, 0.55) !important;
    background: rgba(255, 255, 255, 0.42) !important;
    background-color: rgba(255, 255, 255, 0.42) !important;
    background-image: none !important;
    fill: #238482 !important;
    line-height: 0 !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev:after,
  .section-featured-home .yamuna-home-products .swiper-button-next:after,
  body.template-product .yamuna-pdp-related .swiper-button-prev:after,
  body.template-product .yamuna-pdp-related .swiper-button-next:after {
    display: none !important;
    content: none !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev .icon-inline,
  .section-featured-home .yamuna-home-products .swiper-button-next .icon-inline,
  .section-featured-home .yamuna-home-products .swiper-button-prev svg,
  .section-featured-home .yamuna-home-products .swiper-button-next svg,
  body.template-product .yamuna-pdp-related .swiper-button-prev .icon-inline,
  body.template-product .yamuna-pdp-related .swiper-button-next .icon-inline,
  body.template-product .yamuna-pdp-related .swiper-button-prev svg,
  body.template-product .yamuna-pdp-related .swiper-button-next svg {
    display: block !important;
    width: 22px !important;
    height: 22px !important;
    color: #238482 !important;
    fill: #238482 !important;
  }
}

/* 017 ? first CTA (COMPRAR / buy-one) ? Raleway on all screens */
body .yamuna-plp-buy-one,
body .yamuna-home-spot-buy-one,
body .yamuna-pdp-spot-buy-one,
body.template-category .yamuna-plp-buy-one,
body.template-search .yamuna-plp-buy-one,
body.template-home .yamuna-home-spot-buy-one,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one span,
[data-store^="home-products-"] .yamuna-home-spot-buy-one {
  font-family: 'Raleway', sans-serif !important;
}

/* 018 ? Konfidency reviews band (prod-like spacing) */
body.template-product .yamuna-pdp-reviews {
  box-sizing: border-box !important;
  width: 100% !important;
  max-width: 1312px !important;
  min-height: 120px !important;
  margin: 48px auto 0 !important;
  padding: 0 16px 32px !important;
}

body.template-product .yamuna-pdp-reviews #reviewsapp,
body.template-product .yamuna-pdp-reviews .yamuna-konfidency-reviews,
body.template-product .yamuna-pdp-reviews .konfidency-reviews {
  width: 100% !important;
  max-width: 100% !important;
}

/* 019 / 020 / 021 ? newsletter fonts (Figma ? Raleway) */
body .section-newsletter-home .newsletter-copy h3,
body .section-newsletter-home .js-home-newsletter-heading,
body[class] .section-newsletter-home .newsletter-copy h3 {
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 32px !important;
  font-weight: 700 !important;
  line-height: 1.2 !important;
  text-transform: uppercase !important;
}

body .section-newsletter-home .newsletter-copy h2,
body .section-newsletter-home .js-home-newsletter-title,
body .section-newsletter-home .js-home-newstetter-title,
body[class] .section-newsletter-home .newsletter-copy h2 {
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 24px !important;
  font-weight: 500 !important;
  line-height: 1.3 !important;
}

body .section-newsletter-home .newsletter-consent,
body .section-newsletter-home .newsletter-consent span,
body[class] .section-newsletter-home .newsletter-consent span {
  color: #f6f5f6 !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 400 !important;
  line-height: 1.3 !important;
}

@media (max-width: 1023px) {
  body .section-newsletter-home .newsletter-copy h3,
  body .section-newsletter-home .js-home-newsletter-heading,
  body[class] .section-newsletter-home .newsletter-copy h3 {
    font-size: 20px !important;
  }

  body .section-newsletter-home .newsletter-copy h2,
  body .section-newsletter-home .js-home-newsletter-title,
  body .section-newsletter-home .js-home-newstetter-title,
  body[class] .section-newsletter-home .newsletter-copy h2 {
    font-size: 14px !important;
  }

  body .section-newsletter-home .newsletter-consent span {
    font-size: 16px !important;
    line-height: 1.5 !important;
  }
}

{# Mobile header icons: magenta circle via CSS only (SVG is glyph-only ? kills white square). #}
@media (max-width: 1023px) {
  body[class] .head-main .yamuna-header-mobile-action,
  body[class] .head-main a.yamuna-header-mobile-action,
  body.template-home .head-main .yamuna-header-mobile-action,
  body.template-product .head-main .yamuna-header-mobile-action,
  body.template-category .head-main .yamuna-header-mobile-action,
  body.template-search .head-main .yamuna-header-mobile-action,
  body.template-cart .head-main .yamuna-header-mobile-action,
  body.template-account .head-main .yamuna-header-mobile-action,
  body.template-blog .head-main .yamuna-header-mobile-action,
  body.template-page .head-main .yamuna-header-mobile-action,
  body .head-main .yamuna-header-mobile-actions .yamuna-header-mobile-action,
  body .head-main .yamuna-header-mobile-actions a {
    width: 32px !important;
    height: 32px !important;
    min-width: 32px !important;
    padding: 0 !important;
    overflow: visible !important;
    border: 0 !important;
    border-radius: 50% !important;
    outline: 0 !important;
    background: #a31460 !important;
    background-color: #a31460 !important;
    background-image: none !important;
    box-shadow: none !important;
  }

  body[class] .head-main .yamuna-header-mobile-action .yamuna-header-mobile-glyph,
  body[class] .head-main .yamuna-header-mobile-action img,
  body .head-main .yamuna-header-mobile-actions .yamuna-header-mobile-glyph,
  body .head-main .yamuna-header-mobile-actions img {
    background: transparent !important;
    background-color: transparent !important;
    box-shadow: none !important;
    border: 0 !important;
    border-radius: 0 !important;
  }
}

{# Mobile spot CTAs: unify Home / PLP / Search / PDP related / Cart to prod 40 + 42 @ 14px. #}
@media (max-width: 1023px) {
  body.template-category .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-one,
  body.template-category .yamuna-plp-buy-one,
  body.template-search .yamuna-plp-buy-one,
  body .yamuna-home-spot-buy-one,
  body.template-home .yamuna-home-spot-buy-one,
  [data-store^="home-products-"] .yamuna-home-spot-buy-one,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions .btn.yamuna-home-spot-buy-one,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-buy-one,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-one,
  body.template-product .yamuna-pdp-related .item-actions .btn.yamuna-pdp-spot-buy-one,
  body.template-cart .yamuna-cart-recommendations .yamuna-home-spot-buy-one {
    box-sizing: border-box !important;
    height: 40px !important;
    min-height: 40px !important;
    max-height: 40px !important;
    margin-bottom: 8px !important;
    padding: 0 16px !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 8px !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1 !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three,
  body.template-category .yamuna-plp-buy-three,
  body.template-search .yamuna-plp-buy-three,
  body .yamuna-home-spot-buy-three,
  body.template-home .yamuna-home-spot-buy-three,
  [data-store^="home-products-"] .yamuna-home-spot-buy-three,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-actions .btn.yamuna-home-spot-buy-three,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-buy-three,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three,
  body.template-product .yamuna-pdp-related .item-actions .btn.yamuna-pdp-spot-buy-three,
  body.template-cart .yamuna-cart-recommendations .yamuna-home-spot-buy-three {
    box-sizing: border-box !important;
    height: 42px !important;
    min-height: 42px !important;
    max-height: 42px !important;
    margin-bottom: 0 !important;
    padding: 0 16px !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 8px !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1 !important;
  }

  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-prefix,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-price,
  body.template-category .yamuna-plp-body .yamuna-plp-buy-three-label,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-prefix,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-price,
  body.template-search .yamuna-plp-body .yamuna-plp-buy-three-label,
  body .yamuna-home-spot-buy-three-prefix,
  body .yamuna-home-spot-buy-three-price,
  body .yamuna-home-spot-buy-three-label,
  [data-store^="home-products-"] .yamuna-home-spot-buy-three-prefix,
  [data-store^="home-products-"] .yamuna-home-spot-buy-three-price,
  [data-store^="home-products-"] .yamuna-home-spot-buy-three-label,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-prefix,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-price,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-label {
    font-size: 14px !important;
    line-height: 1 !important;
  }
}

{# COMPRE 3 default: teal text on white (children included). Hover: white text. #}
body .yamuna-home-spot-buy-three,
body .btn.yamuna-home-spot-buy-three,
body .btn-secondary.yamuna-home-spot-buy-three,
body .yamuna-pdp-spot-buy-three,
body .btn.yamuna-pdp-spot-buy-three,
body .yamuna-plp-buy-three,
[data-store^="home-products-"] .yamuna-home-spot-buy-three,
body.template-home .yamuna-home-spot-buy-three,
body.template-category .yamuna-plp-buy-three,
body.template-search .yamuna-plp-buy-three,
body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three {
  background: #fff !important;
  background-color: #fff !important;
  border: 1px solid #238482 !important;
  color: #238482 !important;
}

body .yamuna-home-spot-buy-three .yamuna-home-spot-buy-three-label,
body .yamuna-home-spot-buy-three .yamuna-home-spot-buy-three-prefix,
body .yamuna-home-spot-buy-three .yamuna-home-spot-buy-three-price,
body .yamuna-home-spot-buy-three span,
body .yamuna-pdp-spot-buy-three .yamuna-pdp-spot-buy-three-label,
body .yamuna-pdp-spot-buy-three .yamuna-pdp-spot-buy-three-prefix,
body .yamuna-pdp-spot-buy-three .yamuna-pdp-spot-buy-three-price,
body .yamuna-pdp-spot-buy-three span,
body .yamuna-plp-buy-three .yamuna-plp-buy-three-prefix,
body .yamuna-plp-buy-three .yamuna-plp-buy-three-price,
body .yamuna-plp-buy-three span,
[data-store^="home-products-"] .yamuna-home-spot-buy-three span,
[data-store^="home-products-"] .yamuna-home-spot-buy-three-label,
[data-store^="home-products-"] .yamuna-home-spot-buy-three-prefix,
[data-store^="home-products-"] .yamuna-home-spot-buy-three-price {
  color: #238482 !important;
}

body .yamuna-home-spot-buy-three:hover,
body .yamuna-home-spot-buy-three:focus,
body .btn.yamuna-home-spot-buy-three:hover,
body .btn.yamuna-home-spot-buy-three:focus,
body .btn-secondary.yamuna-home-spot-buy-three:hover,
body .btn-secondary.yamuna-home-spot-buy-three:focus,
body .yamuna-pdp-spot-buy-three:hover,
body .yamuna-pdp-spot-buy-three:focus,
body .yamuna-plp-buy-three:hover,
body .yamuna-plp-buy-three:focus,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus {
  background: #238482 !important;
  background-color: #238482 !important;
  border-color: #238482 !important;
  color: #fff !important;
}

body .yamuna-home-spot-buy-three:hover span,
body .yamuna-home-spot-buy-three:focus span,
body .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-label,
body .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-label,
body .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-prefix,
body .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-prefix,
body .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-price,
body .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-price,
body .yamuna-pdp-spot-buy-three:hover span,
body .yamuna-pdp-spot-buy-three:focus span,
body .yamuna-plp-buy-three:hover span,
body .yamuna-plp-buy-three:focus span,
body .yamuna-plp-buy-three:hover .yamuna-plp-buy-three-prefix,
body .yamuna-plp-buy-three:focus .yamuna-plp-buy-three-prefix,
body .yamuna-plp-buy-three:hover .yamuna-plp-buy-three-price,
body .yamuna-plp-buy-three:focus .yamuna-plp-buy-three-price,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover span,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus span,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-label,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-label,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-prefix,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-prefix,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:hover .yamuna-home-spot-buy-three-price,
[data-store^="home-products-"] .yamuna-home-spot-buy-three:focus .yamuna-home-spot-buy-three-price {
  color: #fff !important;
}



{#/*============================================================================
  # Cenarios 021-025: PLP sort hit area, search suggest CTA/layout, mobile :active
==============================================================================*/#}

{# 021: Ordenar por - ONLY larger click/hit area covering value + arrow. No white box. #}
body.template-category .yamuna-plp-sort,
body.template-search .yamuna-plp-sort {
  min-height: 44px !important;
  height: auto !important;
  align-items: center !important;
}

body.template-category .yamuna-plp-sort-label,
body.template-search .yamuna-plp-sort-label {
  min-height: 44px !important;
  height: auto !important;
  padding: 12px 8px 12px 0 !important;
  align-items: center !important;
  border: 0 !important;
  border-radius: 0 !important;
  background: transparent !important;
  box-shadow: none !important;
  line-height: 20px !important;
}

{# Desktop: visible value + chevron; native select is inert; whole form-group opens custom menu. #}
@media (min-width: 1024px) {
  body.template-category .yamuna-plp-sort,
  body.template-search .yamuna-plp-sort {
    position: relative !important;
  }

  body.template-category .yamuna-plp-sort .form-group,
  body.template-search .yamuna-plp-sort .form-group {
    position: relative !important;
    display: inline-flex !important;
    width: auto !important;
    min-width: 148px !important;
    height: 44px !important;
    min-height: 44px !important;
    margin: 0 !important;
    padding: 0 22px 0 0 !important;
    align-items: center !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: transparent !important;
    box-shadow: none !important;
    cursor: pointer !important;
  }

  body.template-category .yamuna-plp-sort .yamuna-plp-sort-current,
  body.template-search .yamuna-plp-sort .yamuna-plp-sort-current {
    display: inline-flex !important;
    height: 44px !important;
    min-height: 44px !important;
    padding: 0 !important;
    align-items: center !important;
    color: #a31460 !important;
    font-family: 'Roboto', sans-serif !important;
    font-size: 14px !important;
    font-weight: 300 !important;
    line-height: 1 !important;
    white-space: nowrap !important;
    pointer-events: none !important;
  }

  body.template-category .yamuna-plp-sort .form-group::after,
  body.template-search .yamuna-plp-sort .form-group::after {
    right: 2px !important;
    z-index: 1 !important;
    pointer-events: none !important;
  }

  body.template-category .yamuna-plp-sort .form-select,
  body.template-category .yamuna-plp-sort select,
  body.template-search .yamuna-plp-sort .form-select,
  body.template-search .yamuna-plp-sort select,
  body.template-category .yamuna-plp-sort .form-select-icon,
  body.template-search .yamuna-plp-sort .form-select-icon {
    position: absolute !important;
    width: 1px !important;
    height: 1px !important;
    margin: -1px !important;
    padding: 0 !important;
    overflow: hidden !important;
    border: 0 !important;
    opacity: 0 !important;
    pointer-events: none !important;
    clip: rect(0, 0, 0, 0) !important;
  }

  body.template-category .yamuna-plp-sort-options,
  body.template-search .yamuna-plp-sort-options {
    position: absolute !important;
    top: calc(100% + 4px) !important;
    right: 0 !important;
    z-index: 40 !important;
    display: none !important;
    width: max-content !important;
    min-width: 180px !important;
    margin: 0 !important;
    padding: 4px 0 !important;
    border: 1px solid #d7c9d1 !important;
    background: #fff !important;
    box-shadow: 0 6px 14px rgba(74, 29, 58, .16) !important;
    list-style: none !important;
  }

  body.template-category .yamuna-plp-sort.is-open .yamuna-plp-sort-options,
  body.template-search .yamuna-plp-sort.is-open .yamuna-plp-sort-options {
    display: block !important;
  }

  body.template-category .yamuna-plp-sort-option,
  body.template-search .yamuna-plp-sort-option {
    display: block !important;
    width: 100% !important;
    padding: 10px 14px !important;
    border: 0 !important;
    background: transparent !important;
    color: #a31460 !important;
    font-family: 'Roboto', sans-serif !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    line-height: 1.2 !important;
    text-align: left !important;
    white-space: nowrap !important;
    cursor: pointer !important;
  }

  body.template-category .yamuna-plp-sort-option:hover,
  body.template-category .yamuna-plp-sort-option:focus,
  body.template-category .yamuna-plp-sort-option:active,
  body.template-search .yamuna-plp-sort-option:hover,
  body.template-search .yamuna-plp-sort-option:focus,
  body.template-search .yamuna-plp-sort-option:active {
    background: #f7edf3 !important;
    outline: 0 !important;
  }
}

{# Mobile: label is the trigger; pad right so the chevron stays inside the hit box. #}
@media (max-width: 1023px) {
  body.template-category .category-controls .row,
  body.template-search .category-controls .row,
  body.template-category .category-controls .row > .col-auto,
  body.template-search .category-controls .row > .col-auto {
    min-height: 44px !important;
    height: auto !important;
  }

  body.template-category .yamuna-plp-sort,
  body.template-search .yamuna-plp-sort {
    position: relative !important;
    min-width: 160px !important;
    width: auto !important;
    min-height: 44px !important;
    height: 44px !important;
    cursor: pointer !important;
  }

  body.template-category .yamuna-plp-sort-label,
  body.template-search .yamuna-plp-sort-label {
    position: relative !important;
    z-index: 2 !important;
    display: flex !important;
    width: 100% !important;
    min-width: 160px !important;
    height: 44px !important;
    min-height: 44px !important;
    padding: 0 22px 0 8px !important;
    align-items: center !important;
    justify-content: flex-end !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: transparent !important;
    box-shadow: none !important;
    line-height: 1 !important;
    cursor: pointer !important;
  }

  body.template-category .yamuna-plp-sort .form-group,
  body.template-search .yamuna-plp-sort .form-group {
    position: absolute !important;
    inset: 0 !important;
    z-index: 1 !important;
    width: 100% !important;
    height: 44px !important;
    min-height: 44px !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 0 !important;
    background: transparent !important;
    pointer-events: none !important;
  }

  body.template-category .yamuna-plp-sort .form-group::after,
  body.template-search .yamuna-plp-sort .form-group::after {
    right: 4px !important;
    z-index: 1 !important;
    pointer-events: none !important;
  }

  body.template-category .yamuna-plp-sort .form-select,
  body.template-category .yamuna-plp-sort select,
  body.template-search .yamuna-plp-sort .form-select,
  body.template-search .yamuna-plp-sort select {
    position: absolute !important;
    inset: 0 !important;
    width: 100% !important;
    height: 44px !important;
    min-height: 44px !important;
    padding: 0 !important;
    border: 0 !important;
    border-radius: 0 !important;
    opacity: 0 !important;
    pointer-events: none !important;
    cursor: pointer !important;
  }
}

{# 023: mobile search input (header lupa panel) - white box + border-radius. #}
body .head-main .yamuna-mobile-search-input,
body .head-main .yamuna-mobile-search-input.form-control,
body .head-main .yamuna-mobile-search .yamuna-mobile-search-input,
body .head-main .yamuna-mobile-search .yamuna-mobile-search-input.form-control,
body .head-main .yamuna-mobile-search-input.form-control:focus,
body .head-main .yamuna-mobile-search-input.form-control:focus-visible {
  background: #fff !important;
  background-color: #fff !important;
  border-radius: 24px !important;
}

{# 022 + 023: VER TODOS OS RESULTADOS - Raleway, 36px, icon bg, pill radius. #}
body .search-suggest .js-search-suggest-all-link.btn,
body .search-suggest .js-search-suggest-all-link.btn.btn-primary,
body .yamuna-mobile-search-suggest .js-search-suggest-all-link.btn,
body .yamuna-mobile-search-suggest .js-search-suggest-all-link.btn.btn-primary,
.head-light .search-suggest a.js-search-suggest-all-link.btn,
.head-dark .search-suggest a.js-search-suggest-all-link.btn,
.head-primary .search-suggest a.js-search-suggest-all-link.btn {
  display: flex !important;
  width: 100% !important;
  max-width: 100% !important;
  height: 36px !important;
  min-height: 36px !important;
  margin: 12px 0 0 !important;
  padding: 0 16px !important;
  align-items: center !important;
  justify-content: center !important;
  border: 0 !important;
  border-radius: 24px !important;
  background: #a31460 !important;
  background-color: #a31460 !important;
  color: #fff !important;
  fill: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  letter-spacing: .02em !important;
  text-transform: uppercase !important;
  box-sizing: border-box !important;
}

{# 022 + 023: modal FILTRAR apply - same treatment. #}
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply {
  display: flex !important;
  height: 36px !important;
  min-height: 36px !important;
  padding: 0 16px !important;
  align-items: center !important;
  justify-content: center !important;
  border: 0 !important;
  border-radius: 24px !important;
  background: #a31460 !important;
  background-color: #a31460 !important;
  color: #fff !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 14px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  text-transform: uppercase !important;
  box-sizing: border-box !important;
}

{# 024: search suggest - kill stray markers; align image/text/chevrons with lupa column. #}
body .search-suggest .search-suggest-list,
body .yamuna-mobile-search-suggest .search-suggest-list,
body .head-main .yamuna-mobile-search-suggest .search-suggest-list {
  margin: 0 !important;
  padding: 8px 0 4px !important;
  list-style: none !important;
  list-style-type: none !important;
}

body .search-suggest .search-suggest-item,
body .yamuna-mobile-search-suggest .search-suggest-item,
body .head-main .yamuna-mobile-search-suggest .search-suggest-item {
  margin: 0 !important;
  padding: 8px 0 !important;
  list-style: none !important;
  list-style-type: none !important;
}

body .search-suggest .search-suggest-item::marker,
body .yamuna-mobile-search-suggest .search-suggest-item::marker,
body .search-suggest .search-suggest-item::before,
body .yamuna-mobile-search-suggest .search-suggest-item::before {
  content: none !important;
  display: none !important;
  font-size: 0 !important;
}

body .search-suggest .search-suggest-link,
body .yamuna-mobile-search-suggest .search-suggest-link,
body .head-main .yamuna-mobile-search-suggest .search-suggest-link {
  display: flex !important;
  width: 100% !important;
  margin: 0 !important;
  padding: 0 0 0 12px !important;
  align-items: center !important;
  flex-wrap: nowrap !important;
  text-decoration: none !important;
}

body .search-suggest .search-suggest-image-container,
body .yamuna-mobile-search-suggest .search-suggest-image-container {
  display: flex !important;
  flex: 0 0 auto !important;
  width: auto !important;
  max-width: none !important;
  padding: 0 !important;
  margin: 0 12px 0 0 !important;
  align-items: center !important;
  align-self: center !important;
}

body .search-suggest .search-suggest-image,
body .yamuna-mobile-search-suggest .search-suggest-image {
  display: block !important;
  width: 48px !important;
  height: 48px !important;
  object-fit: contain !important;
}

body .search-suggest .search-suggest-text,
body .yamuna-mobile-search-suggest .search-suggest-text {
  display: flex !important;
  flex: 1 1 auto !important;
  min-width: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  flex-direction: column !important;
  justify-content: center !important;
  align-self: center !important;
}

body .search-suggest .search-suggest-text p,
body .search-suggest .search-suggest-name,
body .yamuna-mobile-search-suggest .search-suggest-text p,
body .yamuna-mobile-search-suggest .search-suggest-name {
  margin: 0 !important;
  padding: 0 !important;
  list-style: none !important;
}

body .search-suggest .search-suggest-link > .col-xs-auto:last-child,
body .yamuna-mobile-search-suggest .search-suggest-link > .col-xs-auto:last-child {
  display: flex !important;
  flex: 0 0 42px !important;
  width: 42px !important;
  min-width: 42px !important;
  max-width: 42px !important;
  margin: 0 !important;
  padding: 0 !important;
  align-items: center !important;
  justify-content: center !important;
  align-self: center !important;
}

body .search-suggest .search-suggest-icon,
body .yamuna-mobile-search-suggest .search-suggest-icon {
  display: block !important;
  width: 14px !important;
  height: 14px !important;
  margin: 0 !important;
  color: #a31460 !important;
  fill: #a31460 !important;
}

{# Desktop suggest: keep lupa column alignment (submit is 42px on the right). #}
@media (min-width: 1024px) {
  body .yamuna-header-desktop-search .search-suggest .search-suggest-list {
    padding: 12px 0 8px !important;
  }

  body .yamuna-header-desktop-search .search-suggest .search-suggest-link {
    padding-left: 16px !important;
  }

  body .yamuna-header-desktop-search .search-suggest .js-search-suggest-all-link.btn {
    width: calc(100% - 32px) !important;
    margin-left: 16px !important;
    margin-right: 16px !important;
  }
}

{# 025: same hover/focus treatment on touch (:active). #}
body .search-suggest .search-suggest-link:hover,
body .search-suggest .search-suggest-link:focus,
body .search-suggest .search-suggest-link:active,
body .yamuna-mobile-search-suggest .search-suggest-link:hover,
body .yamuna-mobile-search-suggest .search-suggest-link:focus,
body .yamuna-mobile-search-suggest .search-suggest-link:active {
  background: #f7edf3 !important;
  outline: 0 !important;
}

body .search-suggest .js-search-suggest-all-link.btn:hover,
body .search-suggest .js-search-suggest-all-link.btn:focus,
body .search-suggest .js-search-suggest-all-link.btn:active,
body .yamuna-mobile-search-suggest .js-search-suggest-all-link.btn:hover,
body .yamuna-mobile-search-suggest .js-search-suggest-all-link.btn:focus,
body .yamuna-mobile-search-suggest .js-search-suggest-all-link.btn:active,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply:hover,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply:focus,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply:active {
  background: #8c1052 !important;
  background-color: #8c1052 !important;
  border-color: #8c1052 !important;
  color: #fff !important;
  opacity: 1 !important;
}

body.template-category .yamuna-plp-sort-option:hover,
body.template-category .yamuna-plp-sort-option:focus,
body.template-category .yamuna-plp-sort-option:active,
body.template-search .yamuna-plp-sort-option:hover,
body.template-search .yamuna-plp-sort-option:focus,
body.template-search .yamuna-plp-sort-option:active {
  background: #f7edf3 !important;
  outline: 0 !important;
}

body.template-category .yamuna-plp-sort-label:active,
body.template-search .yamuna-plp-sort-label:active {
  opacity: .72;
}

#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option-content:hover,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option-content:focus,
#nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-option-content:active {
  background: #eef8f7 !important;
}

@media (hover: none) {
  body .search-suggest .search-suggest-link:active,
  body .yamuna-mobile-search-suggest .search-suggest-link:active {
    background: #f7edf3 !important;
  }

  body .search-suggest .js-search-suggest-all-link.btn:active,
  body .yamuna-mobile-search-suggest .js-search-suggest-all-link.btn:active,
  #nav-filters.yamuna-plp-filters-modal .yamuna-plp-filter-apply:active {
    background: #8c1052 !important;
    background-color: #8c1052 !important;
    color: #fff !important;
  }
}

{# ==========================================================================
   PDP Cenarios 020-024 (Sep 2026)
   021: summary spans search-left to navbar-right (556px @1440)
   022/024: 25px vertical rhythm (Figma rating -> line = 25px)
   023: stop gallery crop (contain + inset)
   ========================================================================== #}
@media (min-width: 1360px) {
  /* 021 - align info column with search start and navbar end */
  body.template-product .section-single-product {
    grid-template-columns: 650px 556px !important;
    column-gap: 106px !important;
  }

  body.template-product .yamuna-pdp-summary {
    width: 556px !important;
    min-width: 556px !important;
    max-width: 556px !important;
  }

  /* 023 - product photos must not clip lid/base inside rounded frames */
  body.template-product .yamuna-product-gallery-desktop {
    gap: 25px !important;
  }

  body.template-product .yamuna-product-gallery-item {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    padding: 28px !important;
    overflow: hidden !important;
    background: #fff !important;
  }

  body.template-product .yamuna-product-gallery-item img {
    width: 100% !important;
    height: 100% !important;
    max-width: 100% !important;
    max-height: 100% !important;
    object-fit: contain !important;
    object-position: center center !important;
  }

  /* 021 - children fill the 556px info column */
  body.template-product .yamuna-pdp-summary .breadcrumbs,
  body.template-product .yamuna-pdp-summary .page-header,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-title-row,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-rating,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards,
  body.template-product .yamuna-pdp-summary #product_form,
  body.template-product .yamuna-pdp-summary #product_form > .form-row,
  body.template-product .yamuna-pdp-summary #product-shipping-container,
  body.template-product .yamuna-pdp-summary .product-shipping-calculator,
  body.template-product #product-description {
    width: 556px !important;
    max-width: 556px !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    box-sizing: border-box !important;
  }

  /* 022 - 25px between rating and benefits line (Figma Line 8) */
  body.template-product .yamuna-pdp-summary .yamuna-pdp-rating {
    margin: 12px 0 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits {
    margin: 25px 0 25px !important;
  }

  /* 022/024 - 25px rhythm: cards -> CTA */
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-cards {
    display: flex !important;
    width: 556px !important;
    margin: 0 0 25px !important;
    gap: 32px !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card {
    width: calc((100% - 32px) / 2) !important;
    min-width: 0 !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit::before,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-heading {
    width: 100% !important;
  }

  body.template-product .yamuna-pdp-summary #product_form {
    border-top: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: nowrap !important;
    align-items: center !important;
    justify-content: flex-start !important;
    column-gap: 25px !important;
    row-gap: 0 !important;
    gap: 25px !important;
    width: 556px !important;
    margin: 0 !important;
    padding: 0 0 25px !important;
    border-top: 0 !important;
    border-bottom: 1px solid #c0bbc3 !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-8 {
    order: 1 !important;
    flex: 1 1 auto !important;
    width: auto !important;
    max-width: none !important;
  }

  body.template-product .yamuna-pdp-summary #product_form > .form-row > .col-4 {
    order: 2 !important;
    flex: 0 0 150px !important;
    width: 150px !important;
  }

  body.template-product .yamuna-pdp-summary .js-addtocart:not(.js-addtocart-placeholder) {
    width: 100% !important;
    max-width: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container {
    margin-top: 25px !important;
    padding-top: 0 !important;
    border-top: 0 !important;
  }

  /* 002 - COMPRE 3: center on the PRICE width only so R$/pix/parcelas
     share one left edge under "COMPRE 3"; "preco unitario" hangs right */
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    position: absolute !important;
    top: 72px !important;
    left: 50% !important;
    right: auto !important;
    display: flex !important;
    flex-direction: column !important;
    flex-wrap: nowrap !important;
    align-items: flex-start !important;
    justify-content: flex-start !important;
    width: max-content !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: visible !important;
    transform: translateX(-50%) !important;
    text-align: left !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-buy-three-price {
    position: relative !important;
    display: block !important;
    flex: 0 0 auto !important;
    width: max-content !important;
    margin: 0 !important;
    color: #238482 !important;
    font-family: Roboto, Arial, sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 28px !important;
    text-align: left !important;
    text-transform: uppercase !important;
    white-space: nowrap !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-unit-label {
    position: absolute !important;
    top: 10px !important;
    left: 100% !important;
    display: block !important;
    width: max-content !important;
    margin: 0 0 0 8px !important;
    padding: 0 !important;
    overflow: visible !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 8px !important;
    font-weight: 600 !important;
    line-height: 9px !important;
    text-align: left !important;
    text-transform: uppercase !important;
    white-space: nowrap !important;
    transform: none !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    position: static !important;
    display: block !important;
    flex: 0 0 auto !important;
    box-sizing: content-box !important;
    width: 0 !important;
    min-width: 0 !important;
    max-width: none !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: visible !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 14px !important;
    line-height: 18px !important;
    text-align: left !important;
    white-space: nowrap !important;
    transform: none !important;
  }
}

/* 023 mobile/tablet gallery  -  avoid cover crop */
@media (max-width: 1359px) {
  body.template-product .yamuna-product-gallery-mobile .js-product-slide-link {
    background: #fff !important;
  }

  body.template-product .yamuna-product-gallery-mobile .product-slider-image,
  body.template-product .yamuna-product-gallery-mobile .js-product-slide-img,
  body.template-product .yamuna-product-gallery-mobile .img-absolute,
  body.template-product .yamuna-product-gallery-mobile .img-absolute-centered {
    object-fit: contain !important;
    object-position: center center !important;
    padding: 16px !important;
    box-sizing: border-box !important;
    background: #fff !important;
  }
}

{# ==========================================================================
   PDP 023 + 025 (Sep 2026)
   023: gallery never crops (contain + inset; beat later cover rules)
   025: CEP BUSCAR clickable on desktop (transition-up defaults to pe:none)
   ========================================================================== #}
@media (min-width: 1360px) {
  /* 023 - force full image inside rounded frame */
  body.template-product .yamuna-product-gallery-item {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    box-sizing: border-box !important;
    padding: 36px !important;
    overflow: hidden !important;
    background: #fff !important;
  }

  body.template-product .yamuna-product-gallery-item img {
    width: auto !important;
    height: auto !important;
    max-width: calc(100% - 72px) !important;
    max-height: calc(100% - 72px) !important;
    object-fit: contain !important;
    object-position: center center !important;
  }
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form,
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form.transition-up,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form {
    display: block !important;
    position: relative !important;
    top: 0 !important;
    left: 0 !important;
    opacity: 1 !important;
    visibility: visible !important;
    pointer-events: auto !important;
    z-index: 5 !important;
    transform: none !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form *,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-calculate-shipping,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn {
    pointer-events: auto !important;
  }

  /* Prefer the visible form over the zip summary layer */
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
    overflow: visible !important;
  }
}

/* Closed minicart must not steal clicks / show ghost CEP over the PDP */
body #modal-cart:not(.modal-show):not(.modal-open),
body #modal-cart:not(.modal-show):not(.modal-open) * {
  pointer-events: none !important;
}

body #modal-cart:not(.modal-show):not(.modal-open) .js-shipping-calculator-form,
body #modal-cart:not(.modal-show):not(.modal-open) .shipping-calculator-form,
body #modal-cart:not(.modal-show):not(.modal-open) .js-shipping-calculator-head,
body #modal-cart:not(.modal-show):not(.modal-open) .js-shipping-input,
body #modal-cart:not(.modal-show):not(.modal-open) .js-calculate-shipping,
body #modal-cart:not(.modal-show):not(.modal-open) .yamuna-minicart-shipping-calc,
body #modal-cart:not(.modal-show):not(.modal-open) #cart-shipping-container {
  visibility: hidden !important;
  opacity: 0 !important;
  pointer-events: none !important;
}

body #modal-cart.modal-show,
body #modal-cart.modal-open,
body #modal-cart.modal-show *,
body #modal-cart.modal-open * {
  pointer-events: auto !important;
}

body #modal-cart.modal-show .js-calculate-shipping,
body #modal-cart.modal-open .js-calculate-shipping {
  pointer-events: auto !important;
  cursor: pointer !important;
}

/* PDP BUSCAR: always clickable, never covered by text cursor */
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form.transition-up,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form.position-absolute {
  position: relative !important;
  pointer-events: auto !important;
  z-index: 5 !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .js-calculate-shipping,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-calculate-shipping * {
  pointer-events: auto !important;
  cursor: pointer !important;
  position: relative !important;
  z-index: 6 !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-6.col-lg-5,
body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > [class*="col-lg-5"] {
  position: relative !important;
  z-index: 6 !important;
  pointer-events: auto !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-input {
  max-width: 100% !important;
  cursor: text !important;
}
{#/*============================================================================
  # PLP sort above cards + Home Blog font/spacing/arrows (Sep 2026)
==============================================================================*/#}

{# PLP: product grid had z-index:1 so cards painted over the sort menu. #}
body.template-category .category-controls,
body.template-search .category-controls {
  position: relative !important;
  z-index: 40 !important;
  overflow: visible !important;
}

body.template-category .category-controls .row,
body.template-search .category-controls .row,
body.template-category .yamuna-plp-sort,
body.template-search .yamuna-plp-sort {
  position: relative !important;
  z-index: 41 !important;
  overflow: visible !important;
}

body.template-category .yamuna-plp-sort-options,
body.template-search .yamuna-plp-sort-options {
  z-index: 50 !important;
}

body.template-category .yamuna-plp-body,
body.template-search .yamuna-plp-body {
  position: relative !important;
  z-index: 1 !important;
}

{# Mobile: hide desktop value span so it does not stack on "Ordenar por". #}
@media (max-width: 1023px) {
  body.template-category .yamuna-plp-sort .yamuna-plp-sort-current,
  body.template-search .yamuna-plp-sort .yamuna-plp-sort-current {
    display: none !important;
  }

  body.template-category .yamuna-plp-sort .form-select,
  body.template-category .yamuna-plp-sort select,
  body.template-search .yamuna-plp-sort .form-select,
  body.template-search .yamuna-plp-sort select {
    opacity: 0 !important;
    color: transparent !important;
    -webkit-text-fill-color: transparent !important;
  }

  body.template-category .yamuna-plp-sort-options,
  body.template-search .yamuna-plp-sort-options {
    position: absolute !important;
    top: calc(100% + 4px) !important;
    right: 0 !important;
    z-index: 60 !important;
    width: max-content !important;
    min-width: 160px !important;
    max-width: calc(100vw - 24px) !important;
    margin: 0 !important;
    padding: 4px 0 !important;
    border: 1px solid #d7c9d1 !important;
    background: #fff !important;
    box-shadow: 0 6px 14px rgba(74, 29, 58, .16) !important;
    list-style: none !important;
  }

  body.template-category .yamuna-plp-sort.is-open .yamuna-plp-sort-options,
  body.template-search .yamuna-plp-sort.is-open .yamuna-plp-sort-options {
    display: block !important;
  }
}

{# Home mobile section titles: 24px + promoções rhythm (54px above / 24px below). #}
@media (max-width: 767px) {
  body.template-home .section-featured-home,
  body.template-home [data-store^="home-products-"].section-featured-home {
    padding-top: 54px !important;
  }

  body.template-home .section-featured-home .h1,
  body.template-home .js-products-featured-title,
  body.template-home .js-products-new-title,
  body.template-home .js-products-sale-title,
  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products > .col-12 > .h1 {
    margin-bottom: 24px !important;
    color: #a31460 !important;
    font-family: 'Roboto', sans-serif !important;
    font-size: 24px !important;
    font-weight: 500 !important;
    line-height: normal !important;
    text-align: center !important;
    text-transform: uppercase !important;
  }

  body.template-home .section-testimonials-home {
    padding-top: 54px !important;
  }

  body.template-home .testimonials-title {
    margin-bottom: 24px !important;
    font-size: 24px !important;
  }

  body.template-home .section-instagram-placeholder h2,
  body.template-home .section-home-content-placeholder.section-instagram-placeholder h2 {
    font-size: 24px !important;
  }
}

{# Home Blog title: same family + medium as Promoções (Roboto 500). #}
body.template-home .yamuna-home-blog-title,
.yamuna-home-blog-title {
  color: #a31460 !important;
  font-family: 'Roboto', sans-serif !important;
  font-weight: 500 !important;
  letter-spacing: normal !important;
  text-transform: uppercase !important;
}

@media (max-width: 1023px) {
  body.template-home .yamuna-home-blog-title,
  .yamuna-home-blog-title {
    margin: 0 0 24px !important;
    font-size: 24px !important;
    line-height: normal !important;
    text-align: center !important;
  }

  {# Promoções rhythm: 54px above Blog title / 24px below. #}
  body.template-home .yamuna-home-blog {
    padding-top: 54px !important;
    padding-bottom: 32px !important;
  }

  {# 32 + 32 = 64px between "VER TODOS OS POSTS" and Instagram. #}
  body.template-home .yamuna-home-blog-all {
    margin: 32px 0 0 !important;
  }

  body.template-home .section-instagram-placeholder,
  body.template-home .section-home-content-placeholder.section-instagram-placeholder,
  body.template-home .section-instafeed-home {
    padding-top: 32px !important;
  }
}

@media (min-width: 1024px) {
  body.template-home .yamuna-home-blog-title,
  .yamuna-home-blog-title {
    margin: 0 0 64px !important;
    font-size: 32px !important;
    line-height: 1.2 !important;
    text-align: center !important;
  }

  body.template-home .yamuna-home-blog {
    padding-top: 64px !important;
    padding-bottom: 32px !important;
  }

  body.template-home .yamuna-home-blog-all {
    margin: 32px 0 0 !important;
  }

  body.template-home .section-instagram-placeholder,
  body.template-home .section-home-content-placeholder.section-instagram-placeholder,
  body.template-home .section-instafeed-home {
    padding-top: 32px !important;
  }

  {# Product carousel arrows: glass circle kept; thicker CSS chevron inside. #}
  .section-featured-home .yamuna-home-products .swiper-button-prev,
  .section-featured-home .yamuna-home-products .swiper-button-next,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next {
    width: 48px !important;
    height: 48px !important;
    color: #238482 !important;
    fill: #238482 !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev .icon-inline,
  .section-featured-home .yamuna-home-products .swiper-button-next .icon-inline,
  .section-featured-home .yamuna-home-products .swiper-button-prev svg,
  .section-featured-home .yamuna-home-products .swiper-button-next svg,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev .icon-inline,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next .icon-inline,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev svg,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next svg {
    display: none !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev::before,
  .section-featured-home .yamuna-home-products .swiper-button-next::before,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev::before,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next::before {
    display: block !important;
    width: 14px !important;
    height: 14px !important;
    margin: 0 !important;
    border-top: 3px solid #238482 !important;
    border-right: 3px solid #238482 !important;
    background: none !important;
    content: '' !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev::before,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev::before {
    transform: rotate(-135deg) !important;
    margin-left: 3px !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-next::before,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next::before {
    transform: rotate(45deg) !important;
    margin-right: 3px !important;
  }

  .section-featured-home .yamuna-home-products .swiper-button-prev::after,
  .section-featured-home .yamuna-home-products .swiper-button-next::after,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-prev::after,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-button-next::after {
    display: none !important;
    content: none !important;
  }
}

{# Testimonials: 64px top/bottom desktop; mobile follows promoções rhythm (54px top). #}
body.template-home .section-testimonials-home,
.section-testimonials-home {
  padding: 64px 0 !important;
}

@media (max-width: 767px) {
  body.template-home .section-testimonials-home,
  .section-testimonials-home {
    padding: 54px 0 64px !important;
  }
}

{#/*============================================================================
  # Cenarios 092-095: loop, banner tags, 1440 borders, cart contrast
==============================================================================*/#}

{# 094: kill grey gutters from Bootstrap p-md-1 on product carousels. #}
@media (min-width: 768px) {
  body.template-home .section-featured-home .yamuna-home-products .swiper-container,
  body.template-home .section-featured-home .yamuna-home-products .swiper-container.p-md-1,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-container {
    padding: 0 !important;
  }

  body.template-home .section-featured-home .yamuna-home-products .swiper-slide,
  [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-slide {
    padding: 0 !important;
    background: transparent !important;
  }
}

{# 094: product image canvas stays white (no page-grey edge lines at 1440). #}
body.template-home .section-featured-home .yamuna-home-products .item-image,
body.template-home .section-featured-home .yamuna-home-products .item-image img,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image,
[data-store^="home-products-"].section-featured-home .yamuna-home-products .item-image img {
  background-color: #fff !important;
  border: 0 !important;
  outline: 0 !important;
  box-shadow: none !important;
}

{# 103 / prod: category circles — ring border + 2px gap (no white fill). #}
.yamuna-category-slider-desktop-image,
.yamuna-category-slider-image {
  border: 1px solid #c4bfc7 !important;
  border-color: #c4bfc7 !important;
  padding: 2px !important;
  background: transparent !important;
  background-color: transparent !important;
  box-shadow: none !important;
  overflow: hidden !important;
  box-sizing: border-box !important;
}

.yamuna-category-slider-desktop-item:hover .yamuna-category-slider-desktop-image,
.yamuna-category-slider-item:hover .yamuna-category-slider-image {
  border-color: #238482 !important;
  box-shadow: none !important;
}

.yamuna-category-slider-desktop-image img,
.yamuna-category-slider-image img {
  border-radius: 50% !important;
  object-fit: cover !important;
  object-position: center center !important;
  background: transparent !important;
}

{# 094: hero full-bleed - slides must match container width. #}
body.template-home .js-home-main-slider-container,
body.template-home .js-home-slider,
body.template-home .js-home-slider .swiper-wrapper,
body.template-home .js-home-slider .swiper-slide,
body.template-home .js-home-slider .slider-slide {
  width: 100% !important;
  max-width: 100% !important;
}

body.template-home .js-home-slider .swiper-slide img,
body.template-home .js-home-slider .slider-image {
  width: 100% !important;
  max-width: none !important;
  height: 100% !important;
  object-fit: cover !important;
  object-position: center center !important;
}

{# 094: blog card images flush (no thick white inset frame). #}
body.template-home .yamuna-blog-card--home .yamuna-blog-card-image,
body.template-home .yamuna-blog-card--home .post-item-image-container,
body.template-home .yamuna-blog-card--home .yamuna-blog-card-image img,
body.template-home .yamuna-blog-card--home .post-item-image-container img {
  border: 0 !important;
  box-shadow: none !important;
}

body.template-home .yamuna-blog-card--home .yamuna-blog-card-image,
body.template-home .yamuna-blog-card--home .post-item-image-container {
  padding: 0 !important;
  margin: 0 !important;
  overflow: hidden !important;
  border-radius: 8px 8px 0 0 !important;
  background: #fff !important;
}

{# 093: banner cards match prod rounded-3xl (24px). #}
[data-store="home-image-text-module"] .js-textbanner .row {
  border-radius: 24px !important;
  overflow: hidden !important;
}

{# Selos verdes: full card width, 24px radius on all corners. #}
[data-store="home-image-text-module"] .js-textbanner-text,
[data-store="home-image-text-module"] .js-textbanner-text.col-md-6,
[data-store="home-image-text-module"] .js-textbanner-text.p-3 {
  position: absolute !important;
  top: auto !important;
  right: 0 !important;
  bottom: 0 !important;
  left: 0 !important;
  width: 100% !important;
  max-width: none !important;
  margin: 0 !important;
  flex: 0 0 100% !important;
  border-radius: 24px !important;
}

[data-store="home-image-text-module"] .js-textbanner-text .btn,
[data-store="home-image-text-module"] .js-textbanner-text .btn.btn-secondary,
[data-store="home-image-text-module"] .js-textbanner-text .btn.btn-small {
  border-radius: 999px !important;
  pointer-events: none !important;
}

[data-store="home-image-text-module"] .textbanner-link {
  display: block !important;
  color: inherit !important;
  text-decoration: none !important;
  cursor: pointer !important;
}

{# 093: category banner COMPRAR tags. #}
.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button {
  border-radius: 24px !important;
}

.section-banners-home[data-store="home-banner-categories"] .textbanner-link {
  display: block !important;
  cursor: pointer !important;
}

{# COMPRAR hover: bag icon must turn white with the label. #}
.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:hover,
.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:focus,
.section-banners-home[data-store="home-banner-categories"] .textbanner-link:hover .js-category-banner-button,
.section-banners-home[data-store="home-banner-categories"] .textbanner-link:focus .js-category-banner-button {
  background: #238482 !important;
  color: #fff !important;
  opacity: 1 !important;
}

.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button .category-banner-button-icon {
  transition: filter 0.15s ease;
}

.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:hover .category-banner-button-icon,
.section-banners-home[data-store="home-banner-categories"] .js-category-banner-button:focus .category-banner-button-icon,
.section-banners-home[data-store="home-banner-categories"] .textbanner-link:hover .category-banner-button-icon,
.section-banners-home[data-store="home-banner-categories"] .textbanner-link:focus .category-banner-button-icon {
  filter: brightness(0) invert(1) !important;
  opacity: 1 !important;
}

{# 092/benefits: smooth slide like hero banners (no hard opacity cut). #}
.yamuna-category-slider-desktop-list {
  overflow: hidden !important;
}

.yamuna-category-slider-desktop-track {
  will-change: transform;
  backface-visibility: hidden;
}

@media (max-width: 1023px) {
  [data-store="banner-services"] .js-informative-banners .swiper-wrapper {
    transition-timing-function: cubic-bezier(0.25, 0.1, 0.25, 1) !important;
  }
}

{# 095: cart badge contrast on magenta header (white bag). #}
body .head-main .yamuna-header-cart-count,
body .head-main .yamuna-header-desktop-utilities .yamuna-header-cart-count,
body .head-main .yamuna-header-mobile-cart-count,
body.template-home .head-main .yamuna-header-cart-count {
  color: #fff !important;
  background: #a31460 !important;
  background-color: #a31460 !important;
  border: 1.5px solid #fff !important;
  box-shadow: 0 0 0 1px rgba(163, 20, 96, .35);
}

body .head-main .yamuna-header-action img[src*="header-bag"],
body .head-main .yamuna-header-desktop-utilities img[src*="header-bag"],
body .head-main .yamuna-header-mobile-glyph[src*="header-cart"] {
  opacity: 1 !important;
  filter: none !important;
}

{#/*============================================================================
  # Cenarios 097-100
==============================================================================*/#}

{# Mobile continuous cream band — same #FBF7F0 as desktop (cache-bust 2026-09-17b). #}
@media (max-width: 767px) {
  body.template-home [data-store="banner-services"],
  body.template-home [data-store="banner-services"] .section-informative-banners,
  body.template-home .section-informative-banners,
  body.template-home .section-yamuna-category-slider,
  body.template-home [data-store="home-image-text-module"],
  body.template-home .section-featured-home,
  body.template-home [data-store^="home-products-"].section-featured-home,
  body.template-home .section-yamuna-information,
  body.template-home .section-yamuna-category-highlights {
    margin-left: 0 !important;
    margin-right: 0 !important;
    background: #FBF7F0 !important;
    background-color: #FBF7F0 !important;
  }

  body.template-home .js-home-sections-container {
    background: #FBF7F0 !important;
    background-color: #FBF7F0 !important;
  }
}

{# 097: desktop benefits bar — prod uses #C0BBC3 at 20% opacity + 32px gap above. #}
@media (min-width: 1024px) {
  [data-store="banner-services"] .section-informative-banners,
  body.template-home [data-store="banner-services"] .section-informative-banners {
    margin-top: 32px !important;
    background: rgba(192, 187, 195, 0.2) !important;
    background-color: rgba(192, 187, 195, 0.2) !important;
  }
}

{# 098 / 103: mobile category — 3 full circles centered (match prod img4). #}
@media (max-width: 767px) {
  .yamuna-category-slider-container {
    min-height: 120px !important;
  }

  .yamuna-category-slider-list {
    width: 284px !important;
    max-width: calc(100vw - 36px) !important;
  }

  .yamuna-category-slider-item {
    color: #4a1d3a !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 12px !important;
    font-weight: 600 !important;
    line-height: 1.2 !important;
    text-transform: uppercase !important;
    text-align: center !important;
    overflow: hidden !important;
  }

  .yamuna-category-slider-item > span:not(.yamuna-category-slider-image) {
    display: block !important;
    width: 100% !important;
    max-width: 84px !important;
    margin: 0 auto !important;
  }

  .yamuna-category-slider-image {
    width: 84px !important;
    height: 84px !important;
    max-width: 100% !important;
    margin: 0 auto 6px !important;
    padding: 2px !important;
    border: 1px solid #c4bfc7 !important;
    background: transparent !important;
    box-shadow: none !important;
  }

  .yamuna-category-slider-image img {
    object-fit: cover !important;
    object-position: center center !important;
  }

  .yamuna-category-slider-arrow {
    top: 28px !important;
    width: 18px !important;
    height: 84px !important;
  }

  .yamuna-category-slider-arrow-prev {
    left: 0 !important;
  }

  .yamuna-category-slider-arrow-next {
    right: 0 !important;
  }
}

{# 099: mobile hero overlay card match prod. #}
@media (max-width: 767px) {
  {# 107: mobile hero image size match prod (375×600 → aspect 5/8). #}
  body.template-home .js-home-mobile-slider-visibility .section-slider,
  body.template-home .js-home-mobile-slider-visibility .section-slider-auto,
  body.template-home .js-home-slider-mobile.nube-slider-home,
  body.template-home .js-home-slider-mobile {
    height: calc(100vw * 600 / 375) !important;
    max-height: none !important;
    min-height: 0 !important;
  }

  body.template-home .js-home-slider-mobile .swiper-wrapper,
  body.template-home .js-home-slider-mobile .swiper-slide,
  body.template-home .js-home-slider-mobile .slide-container,
  body.template-home .js-home-slider-mobile .slider-slide {
    height: 100% !important;
  }

  body.template-home .js-home-slider-mobile .slider-image {
    position: absolute !important;
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: 0 !important;
    width: 100% !important;
    height: 100% !important;
    object-fit: cover !important;
    object-position: center center !important;
  }

  body.template-home .js-home-slider-mobile .yamuna-home-hero-overlay {
    right: auto !important;
    bottom: 40px !important;
    left: 0 !important;
    display: flex !important;
    width: min(282px, calc(100% - 16px)) !important;
    max-width: min(282px, calc(100% - 16px)) !important;
    height: auto !important;
    min-height: 170px !important;
    padding: 16px !important;
    flex-direction: column !important;
    justify-content: flex-start !important;
    align-items: flex-start !important;
    border-radius: 0 24px 24px 0 !important;
    background: #fff !important;
    box-sizing: border-box !important;
  }

  body.template-home .yamuna-home-hero-overlay-title {
    position: static !important;
    top: auto !important;
    left: auto !important;
    width: 100% !important;
    max-width: 250px !important;
    margin: 0 0 4px !important;
    color: #a31460 !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 20px !important;
    font-weight: 800 !important;
    line-height: 1.2 !important;
    text-align: left !important;
    white-space: normal !important;
  }

  body.template-home .yamuna-home-hero-overlay-description {
    position: static !important;
    top: auto !important;
    left: auto !important;
    width: 100% !important;
    max-width: 250px !important;
    margin: 0 0 12px !important;
    color: #4a1d3a !important;
    font-family: 'Dosis', sans-serif !important;
    font-size: 18px !important;
    font-weight: 500 !important;
    line-height: 1.3 !important;
    text-align: left !important;
    opacity: 1 !important;
  }

  body.template-home .yamuna-home-hero-overlay-button {
    position: static !important;
    top: auto !important;
    left: auto !important;
    display: inline-flex !important;
    width: auto !important;
    min-width: 0 !important;
    min-height: 38px !important;
    height: 38px !important;
    padding: 8px 32px !important;
    align-items: center !important;
    justify-content: center !important;
    border-radius: 24px !important;
    background: #238482 !important;
    color: #fff !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 14px !important;
    font-weight: 700 !important;
    line-height: 1 !important;
    text-transform: uppercase !important;
  }
}

{# Testimonials arrows: circular cards with thicker chevron inside. #}
.section-testimonials-home .testimonials-nav,
.section-testimonials-home .testimonials-nav--prev,
.section-testimonials-home .testimonials-nav--next {
  display: flex !important;
  width: 48px !important;
  height: 48px !important;
  align-items: center !important;
  justify-content: center !important;
  border: 1px solid rgba(35, 132, 130, 0.22) !important;
  border-radius: 50% !important;
  background: #fff !important;
  background-color: #fff !important;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
  color: #238482 !important;
}

.section-testimonials-home .testimonials-nav:after {
  display: block !important;
  width: 14px !important;
  height: 14px !important;
  border: solid currentColor !important;
  border-width: 0 0 3px 3px !important;
  content: '' !important;
}

@media (max-width: 1023px) {
  .section-testimonials-home > .container-fluid {
    padding-left: 12px !important;
    padding-right: 12px !important;
  }

  .section-testimonials-home .testimonials-slider {
    overflow: hidden !important;
    padding-left: 36px !important;
    padding-right: 36px !important;
  }

  .section-testimonials-home .testimonials-grid.swiper-wrapper {
    overflow: visible !important;
    align-items: stretch !important;
  }

  {# Flow layout on mobile so wrapped quotes never overlap the author. #}
  .section-testimonials-home .testimonial-card.swiper-slide {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: flex-start !important;
    box-sizing: border-box !important;
    width: 100% !important;
    height: auto !important;
    min-height: 210px !important;
    padding: 56px 12px 24px !important;
    flex: 0 0 100% !important;
  }

  .section-testimonials-home .testimonial-card.swiper-slide:before {
    top: 40px !important;
    left: 50% !important;
    width: min(248px, calc(100% - 16px)) !important;
    height: calc(100% - 48px) !important;
    transform: translateX(-50%) !important;
  }

  .section-testimonials-home .testimonial-quote {
    position: absolute !important;
    top: 22px !important;
    left: calc(50% - min(124px, 38%)) !important;
    width: min(67px, 22vw) !important;
    transform: none !important;
  }

  .section-testimonials-home .testimonial-stars,
  .section-testimonials-home .testimonial-text,
  .section-testimonials-home .testimonial-author,
  .section-testimonials-home .testimonial-card--long .testimonial-author {
    position: relative !important;
    top: auto !important;
    left: auto !important;
    transform: none !important;
    box-sizing: border-box !important;
  }

  .section-testimonials-home .testimonial-stars {
    width: min(220px, calc(100% - 24px)) !important;
    margin: 0 0 12px !important;
  }

  .section-testimonials-home .testimonial-text {
    width: min(220px, calc(100% - 32px)) !important;
    max-width: min(220px, calc(100% - 32px)) !important;
    margin: 0 0 12px !important;
    font-size: 14px !important;
    line-height: 1.35 !important;
    overflow-wrap: anywhere !important;
    word-break: break-word !important;
    box-sizing: border-box !important;
  }

  .section-testimonials-home .testimonial-author,
  .section-testimonials-home .testimonial-card--long .testimonial-author {
    width: min(200px, calc(100% - 32px)) !important;
    margin: 0 !important;
  }

  .section-testimonials-home .testimonials-nav,
  .section-testimonials-home .testimonials-nav--prev,
  .section-testimonials-home .testimonials-nav--next {
    width: 40px !important;
    height: 40px !important;
    top: 50% !important;
  }

  .section-testimonials-home .testimonials-nav--prev {
    left: 2px !important;
    transform: translateY(-50%) !important;
  }

  .section-testimonials-home .testimonials-nav--next {
    right: 2px !important;
    transform: translateY(-50%) !important;
  }
}

@media (max-width: 374px) {
  .section-testimonials-home .testimonials-slider {
    padding-left: 28px !important;
    padding-right: 28px !important;
  }

  .section-testimonials-home .testimonial-card.swiper-slide {
    min-height: 200px !important;
    padding: 52px 8px 22px !important;
  }

  .section-testimonials-home .testimonial-quote {
    top: 18px !important;
    width: 52px !important;
  }

  .section-testimonials-home .testimonial-stars {
    width: min(200px, calc(100% - 16px)) !important;
    margin-bottom: 10px !important;
  }

  .section-testimonials-home .testimonial-text {
    width: min(200px, calc(100% - 20px)) !important;
    margin-bottom: 10px !important;
    font-size: 13px !important;
    line-height: 1.35 !important;
  }

  .section-testimonials-home .testimonial-author,
  .section-testimonials-home .testimonial-card--long .testimonial-author {
    width: min(180px, calc(100% - 20px)) !important;
  }
}

{# ==========================================================================
   PDP Cenarios 025-030 (Sep 2026)
   025: CEP quotes must not float/collapse (overlap description)
   026: 25px between CTA row and CEP block
   028/030: favorite heart centered on #a31460 circle (no square border)
   029: hide benefits strip on mobile
   ========================================================================== #}

/* 025 - shipping response containment (all breakpoints; beat .float-left) */
body.template-product .yamuna-pdp-summary #product-shipping-container,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-wrap,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-inner,
body.template-product .yamuna-pdp-summary #product-shipping-container [data-store="shipping-calculator"] {
  float: none !important;
  height: auto !important;
  min-height: 0 !important;
  overflow: visible !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response.float-left,
body.template-product .yamuna-pdp-summary #product-shipping-container .float-left.js-shipping-calculator-response {
  float: none !important;
  clear: both !important;
  display: block !important;
  width: 100% !important;
  max-width: 100% !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
}

/* Spinner: kill float only — never force display (inline display:none must win on load) */
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-spinner {
  float: none !important;
  clear: both !important;
  width: 100% !important;
  max-width: 100% !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container [data-store="shipping-calculator"]::after {
  content: "" !important;
  display: block !important;
  clear: both !important;
}

/* 025 - with-form vs with-zip as normal flow (no absolute stack) */
body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-head {
  position: relative !important;
  height: auto !important;
  min-height: 0 !important;
  overflow: visible !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-form,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode {
  position: relative !important;
  top: auto !important;
  left: auto !important;
  transform: none !important;
  opacity: 1 !important;
  pointer-events: auto !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head.with-form .js-shipping-calculator-with-zipcode,
body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head:not(.with-zip) .js-shipping-calculator-with-zipcode {
  display: none !important;
  visibility: hidden !important;
  pointer-events: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head.with-form .js-shipping-calculator-form,
body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head:not(.with-zip) .js-shipping-calculator-form {
  display: block !important;
  visibility: visible !important;
  pointer-events: auto !important;
  height: auto !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head.with-zip .js-shipping-calculator-form {
  display: none !important;
  visibility: hidden !important;
  pointer-events: none !important;
  height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-head.with-zip .js-shipping-calculator-with-zipcode {
  display: block !important;
  visibility: visible !important;
  pointer-events: auto !important;
  height: auto !important;
  margin: 0 0 12px !important;
  padding: 0 !important;
  overflow: visible !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode .row {
  display: flex !important;
  align-items: center !important;
  justify-content: space-between !important;
  width: 100% !important;
  margin: 0 !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-change-zipcode {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  height: 28px !important;
  padding: 0 12px !important;
  border: 1px solid #a31460 !important;
  border-radius: 20px !important;
  background: #fff !important;
  color: #a31460 !important;
  font-family: Dosis, Arial, sans-serif !important;
  font-size: 12px !important;
  font-weight: 600 !important;
  text-transform: uppercase !important;
  white-space: nowrap !important;
}

/* 026 - 25px CTA->line (form-row pad) + 25px line->CEP phrase */
body.template-product .yamuna-pdp-summary #product_form > .form-row {
  padding-bottom: 25px !important;
  margin-bottom: 0 !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container {
  margin-top: 0 !important;
  padding-top: 25px !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-label,
body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-label,
body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .yamuna-pdp-shipping-label {
  margin-top: 0 !important;
}

@media (min-width: 1360px) {
  body.template-product .yamuna-pdp-summary #product_form > .form-row {
    padding: 0 0 25px !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container {
    margin-top: 0 !important;
    padding-top: 25px !important;
  }
}

/* 028/030 - PDP favorite: #a31460 circle, heart centered, no square border */
body.template-product .yamuna-pdp-summary .yamuna-pdp-favorite,
body.template-product .yamuna-pdp-favorite {
  flex: 0 0 32px !important;
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  box-sizing: border-box !important;
  width: 32px !important;
  height: 32px !important;
  min-width: 32px !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 50% !important;
  outline: 0 !important;
  background: #a31460 !important;
  background-color: #a31460 !important;
  box-shadow: none !important;
  line-height: 0 !important;
  cursor: pointer !important;
  overflow: hidden !important;
}

body.template-product .yamuna-pdp-summary .yamuna-pdp-favorite svg,
body.template-product .yamuna-pdp-favorite svg {
  display: block !important;
  width: 16px !important;
  height: 16px !important;
  margin: 0 !important;
  flex: 0 0 16px !important;
}

body.template-product .yamuna-pdp-summary .yamuna-pdp-favorite svg circle,
body.template-product .yamuna-pdp-favorite svg circle {
  display: none !important;
}

/* 030 - header favorites: no wrong circle/border; white glyph centered like prod */
body[class] .head-main .yamuna-header-desktop-utilities .yamuna-header-action[aria-label="Favoritos"],
body[class] .head-main .yamuna-header-desktop-utilities a.yamuna-header-action[href*="favoritos"] {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  width: 32px !important;
  height: 32px !important;
  min-width: 32px !important;
  padding: 0 !important;
  border: 0 !important;
  border-radius: 0 !important;
  background: transparent !important;
  background-color: transparent !important;
  box-shadow: none !important;
}

body[class] .head-main .yamuna-header-desktop-utilities .yamuna-header-action[aria-label="Favoritos"] img,
body[class] .head-main .yamuna-header-desktop-utilities a.yamuna-header-action[href*="favoritos"] img {
  display: block !important;
  width: 20px !important;
  height: 20px !important;
  margin: 0 auto !important;
}

/* 029 - benefits strip only on desktop */
@media (max-width: 1023px) {
  body.template-product .yamuna-pdp-summary .yamuna-pdp-benefits,
  body.template-product .yamuna-pdp-benefits {
    display: none !important;
  }
}

{# ==========================================================================
   PDP shipping quotes typography (after CEP search)
   #393747: method name + "Chega em…" (circled)
   #a31460: price + "Ver mais"
   Do NOT recolor: CEP line, Opções ao…, Envio a domicílio, disclaimer
   Titles 16px desk / 14px mobile; subtitles 14px; Dosis
   ========================================================================== #}

/* Keep surrounding copy on default foreground (not inherited pink) */
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-product-shipping-label,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-section-label,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-response > .font-small {
  color: inherit !important;
  font-family: 'Dosis', Arial, sans-serif !important;
}

/* Circled: method name → #393747 */
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-name {
  color: #393747 !important;
  font-family: 'Dosis', Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 600 !important;
  line-height: 1.3 !important;
}

/* Price stays brand pink */
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price h5,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price .text-primary,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price .t-primary {
  color: #a31460 !important;
  font-family: 'Dosis', Arial, sans-serif !important;
  font-size: 16px !important;
  font-weight: 600 !important;
  line-height: 1.3 !important;
}

/* Circled: delivery time subtitle → #393747 */
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-time,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-time span,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-time svg,
body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-time .svg-icon-text {
  color: #393747 !important;
  fill: #393747 !important;
  font-family: 'Dosis', Arial, sans-serif !important;
  font-size: 14px !important;
  font-weight: 400 !important;
  line-height: 1.3 !important;
  opacity: 1 !important;
}

/* "Ver mais/menos opções de envio" stays pink */
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-see-more,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-see-less,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-toggle-more-shipping-options a {
  color: #a31460 !important;
  font-family: 'Dosis', Arial, sans-serif !important;
  font-size: 14px !important;
}

@media (max-width: 1023px) {
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-name,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price h5,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price .text-primary,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-shipping-quote-price .t-primary {
    font-size: 14px !important;
  }
}

{# ==========================================================================
   PDP Cenarios 031-037 (mobile)
   031: UNIDADE header bg #4A1D3A like prod
   032: PRECO UNITARIO alignment
   033: CEP input/BUSCAR match CTA/qty sizes
   034: description H2 + related title → 16px
   035: 20px above TABELA NUTRICIONAL + related title margin
   036: Dosis/Raleway fonts per Figma
   037: VOCE PODE GOSTAR mobile carousel layout
   ========================================================================== #}
@media (max-width: 1023px) {
  /* 031 - UNIDADE filled header like prod */
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-unit::before {
    height: 48px !important;
    border: 0 !important;
    border-radius: 46px !important;
    background: #4a1d3a !important;
    background-color: #4a1d3a !important;
    color: #fff !important;
    font-size: 20px !important;
    font-weight: 400 !important;
    line-height: 48px !important;
  }

  /* 032 - COMPRE 3: price + PRECO UNITARIO as centered hanging pair */
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-body {
    position: absolute !important;
    top: 72px !important;
    left: 50% !important;
    right: auto !important;
    display: flex !important;
    flex-direction: column !important;
    flex-wrap: nowrap !important;
    align-items: flex-start !important;
    justify-content: flex-start !important;
    width: max-content !important;
    max-width: calc(100% - 24px) !important;
    margin: 0 !important;
    padding: 0 !important;
    transform: translateX(-50%) !important;
    text-align: left !important;
    grid-template-columns: none !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-buy-three-price {
    position: relative !important;
    display: block !important;
    width: max-content !important;
    margin: 0 !important;
    text-align: left !important;
    justify-self: auto !important;
    grid-column: auto !important;
    grid-row: auto !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-unit-label {
    position: absolute !important;
    top: 4px !important;
    left: 100% !important;
    display: block !important;
    width: max-content !important;
    margin: 0 0 0 8px !important;
    padding: 0 !important;
    color: #9e929e !important;
    font-family: Dosis, Arial, sans-serif !important;
    font-size: 8px !important;
    font-weight: 600 !important;
    line-height: 9px !important;
    text-align: left !important;
    text-transform: uppercase !important;
    white-space: normal !important;
    grid-column: auto !important;
    grid-row: auto !important;
    justify-self: auto !important;
  }

  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-pix,
  body.template-product .yamuna-pdp-summary .yamuna-pdp-price-card-buy-three .yamuna-pdp-price-card-installments {
    position: static !important;
    display: block !important;
    width: max-content !important;
    margin: 2px 0 0 !important;
    text-align: left !important;
    grid-column: auto !important;
    grid-row: auto !important;
    justify-self: auto !important;
  }

  /* 033 - CEP row matches CTA + qty (168x40 / 108x40), wrap so input stays visible */
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline {
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: center !important;
    justify-content: center !important;
    column-gap: 20px !important;
    row-gap: 8px !important;
    width: 100% !important;
    max-width: 100% !important;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12.form-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .yamuna-pdp-shipping-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12.mb-2 {
    flex: 0 0 100% !important;
    width: 100% !important;
    max-width: 100% !important;
    float: none !important;
    margin: 0 0 8px !important;
    padding: 0 !important;
    text-align: left !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-6.col-lg-7,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > [class*="col-lg-7"],
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .form-control-container {
    flex: 0 0 168px !important;
    width: 168px !important;
    max-width: 168px !important;
    float: none !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-6.col-lg-5,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > [class*="col-lg-5"] {
    flex: 0 0 108px !important;
    width: 108px !important;
    max-width: 108px !important;
    float: none !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12:has(.js-shipping-zipcode-help),
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12:has(.yamuna-pdp-shipping-help),
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-group-inline > .col-12 {
    flex: 0 0 100% !important;
    width: 100% !important;
    max-width: 100% !important;
    float: none !important;
    margin: 4px 0 0 !important;
    padding: 0 !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-control,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-shipping-input {
    display: block !important;
    width: 168px !important;
    max-width: 168px !important;
    height: 40px !important;
    min-height: 40px !important;
    border-radius: 23px !important;
    line-height: 40px !important;
    font-size: 12px !important;
  }

  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .btn,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .js-calculate-shipping {
    width: 108px !important;
    max-width: 108px !important;
    height: 40px !important;
    min-height: 40px !important;
    border-radius: 23px !important;
    font-size: 12px !important;
  }

  /* 034 - description subheading "Pode tomar..." → 16px (was 28px Montserrat) */
  body.template-product #product-description .yamuna-product-description-main h2,
  body.template-product #product-description .yamuna-product-description-main h2 strong,
  body.template-product #product-description .user-content h2,
  body.template-product #product-description .user-content h2 strong {
    margin: 20px 0 12px !important;
    color: #393747 !important;
    font-family: 'Dosis', Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 700 !important;
    line-height: 1.35 !important;
    letter-spacing: normal !important;
  }

  /* 034 - VOCÊ PODE GOSTAR title → 16px */
  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .products-section-title.h1,
  body.template-product .yamuna-pdp-related .h1 {
    font-size: 16px !important;
    line-height: 1.2 !important;
  }

  /* 035 - 20px above TABELA NUTRICIONAL (was ~48) */
  body.template-product #product-description .yamuna-product-description-main > p:has(+ .yamuna-pdp-nutrition-btn) {
    margin-bottom: 0 !important;
  }

  body.template-product #product-description .yamuna-pdp-nutrition-btn,
  body.template-product #product-description button.yamuna-pdp-nutrition-btn,
  body.template-product #product-description a.yamuna-pdp-nutrition-btn {
    margin-top: 20px !important;
    margin-bottom: 20px !important;
  }

  /* 035 - 20px below VOCÊ PODE GOSTAR title (was 32px) */
  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .products-section-title.h1,
  body.template-product .yamuna-pdp-related .h1 {
    margin: 0 0 20px !important;
  }

  body.template-product .yamuna-pdp-related .products-section-title-container,
  body.template-product .yamuna-pdp-related .text-center.px-3 {
    margin-bottom: 0 !important;
    padding-bottom: 0 !important;
  }

  /* 036 - fonts per Figma: Dosis in description/table; Raleway section title */
  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .yamuna-product-description-main p,
  body.template-product #product-description .yamuna-product-description-main li,
  body.template-product #product-description .yamuna-product-description-main strong,
  body.template-product #product-description .yamuna-product-description-main em {
    font-family: 'Dosis', Arial, sans-serif !important;
  }

  body.template-product #product-description .infoToOpen,
  body.template-product #product-description .infoToOpen td,
  body.template-product #product-description .infoToOpen td p,
  body.template-product #product-description-accordions .infoToOpen,
  body.template-product #product-description-accordions .infoToOpen td,
  body.template-product #product-description-accordions .infoToOpen td p {
    font-family: 'Dosis', Arial, sans-serif !important;
    color: #393747 !important;
  }

  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .products-section-title.h1,
  body.template-product .yamuna-pdp-related .h1 {
    color: #a31460 !important;
    font-family: 'Raleway', sans-serif !important;
    font-weight: 600 !important;
    text-transform: uppercase !important;
  }

  body.template-product .yamuna-pdp-related .item-name,
  body.template-product .yamuna-pdp-related .item-name a,
  body.template-product .yamuna-pdp-related .item-price,
  body.template-product .yamuna-pdp-related .item-installments,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-payment {
    font-family: 'Dosis', Arial, sans-serif !important;
    color: #393747 !important;
  }

  /* Keep CEP label Dosis (prior work) */
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .shipping-calculator-form .form-label,
  body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-zipcode-help,
  body.template-product .yamuna-pdp-summary #product-shipping-container .yamuna-pdp-shipping-help {
    font-family: Dosis, Arial, sans-serif !important;
  }

  /* 037 - VOCÊ PODE GOSTAR mobile: 1 card + peek, title/cards rhythm */
  body.template-product .yamuna-pdp-related {
    margin: 24px 0 0 !important;
    padding: 4px 0 32px !important;
    overflow-x: clip !important;
    overflow-y: visible !important;
  }

  body.template-product .yamuna-pdp-related .container {
    max-width: 100% !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-product .yamuna-pdp-related .products-section-title-container,
  body.template-product .yamuna-pdp-related .text-center.px-3 {
    padding-left: 16px !important;
    padding-right: 16px !important;
    overflow: visible !important;
  }

  body.template-product .yamuna-pdp-related .products-section-container,
  body.template-product .yamuna-pdp-related .js-swiper-related {
    overflow: visible !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-product .yamuna-pdp-related .swiper-slide {
    height: auto !important;
    min-height: 0 !important;
    box-sizing: border-box !important;
  }

  body.template-product .yamuna-pdp-related .item {
    width: 100% !important;
    max-width: 100% !important;
    min-height: 0 !important;
    height: auto !important;
    margin: 0 !important;
    background: #fff !important;
    border-radius: 8px !important;
    box-shadow: 0 2px 10px rgba(57, 55, 71, .08) !important;
    overflow: hidden !important;
  }

  body.template-product .yamuna-pdp-related .item-image {
    height: 220px !important;
    margin: 10px 10px 0 !important;
  }

  body.template-product .yamuna-pdp-related .item-description {
    padding: 8px 12px 0 !important;
  }

  body.template-product .yamuna-pdp-related .item-name,
  body.template-product .yamuna-pdp-related .item-name a {
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.25 !important;
  }

  body.template-product .yamuna-pdp-related .item-price {
    font-size: 18px !important;
    font-weight: 700 !important;
  }

  body.template-product .yamuna-pdp-related .item-actions {
    margin: 12px 12px 20px !important;
  }

  body.template-product .yamuna-pdp-related .swiper-button-prev,
  body.template-product .yamuna-pdp-related .swiper-button-next {
    display: none !important;
  }
}

/* Closed minicart shipping: hard kill (ghost CEP was stealing PDP BUSCAR clicks) */
body.template-product #modal-cart:not(.modal-show):not(.modal-open) .yamuna-minicart-shipping-calc,
body.template-product #modal-cart:not(.modal-show):not(.modal-open) #cart-shipping-container,
body.template-product #modal-cart:not(.modal-show):not(.modal-open) .js-shipping-calculator-form,
body.template-product #modal-cart:not(.modal-show):not(.modal-open) .js-shipping-input,
body.template-product #modal-cart:not(.modal-show):not(.modal-open) .js-calculate-shipping {
  display: none !important;
  visibility: hidden !important;
  opacity: 0 !important;
  pointer-events: none !important;
  height: 0 !important;
  max-height: 0 !important;
  overflow: hidden !important;
}

{# Kill Bootstrap .col padding-left (bare .col is NOT matched by [class*="col-"]) #}
body.template-product .yamuna-pdp-summary #product-shipping-container .col,
body.template-product .yamuna-pdp-summary #product-shipping-container .col.pr-0,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode .col,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode .row > .col,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode .row > [class*="col"] {
  padding-left: 0 !important;
  padding-right: 0 !important;
}

body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode .container,
body.template-product .yamuna-pdp-summary #product-shipping-container .js-shipping-calculator-with-zipcode .row {
  margin-left: 0 !important;
  margin-right: 0 !important;
  padding-left: 0 !important;
  padding-right: 0 !important;
  width: 100% !important;
  max-width: 100% !important;
}

{# Mobile only: accordion margin-top (img1) + description padding-bottom (img2) #}
@media (max-width: 1023px) {
  body.template-product #product-description-accordions,
  body.template-product #product-description #product-description-accordions {
    margin-top: 0 !important;
  }

  body.template-product #product-description .yamuna-product-description-main,
  body.template-product #product-description .product-description.yamuna-product-description-main {
    padding-bottom: 0 !important;
  }

  {# VOCÊ PODE GOSTAR — Figma mobile: Roboto 18/500; line-height >100% so Ê accent is not clipped #}
  body.template-product .yamuna-pdp-related .products-section-title,
  body.template-product .yamuna-pdp-related .products-section-title.h1,
  body.template-product .yamuna-pdp-related h2.products-section-title,
  body.template-product .yamuna-pdp-related .h1 {
    color: #a31460 !important;
    font-family: 'Roboto', Arial, sans-serif !important;
    font-size: 18px !important;
    font-weight: 500 !important;
    line-height: 1.3 !important;
    text-align: center !important;
    text-transform: uppercase !important;
    overflow: visible !important;
    padding-top: 2px !important;
  }
}

{# Compre 3 label: 12px below 425px; 14px stays above #}
@media (max-width: 424px) {
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-label,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-prefix,
  body.template-product .yamuna-pdp-related .yamuna-pdp-spot-buy-three-price {
    font-size: 12px !important;
  }
}

{# Reviews empty — hide until Konfidency is ready #}
body.template-product .yamuna-pdp-reviews {
  display: none !important;
  visibility: hidden !important;
  min-height: 0 !important;
  height: 0 !important;
  max-height: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  pointer-events: none !important;
}

{# ==========================================================================
   Home cenários 101–106 (match yamuna.com.br)
   101 hover · 102 card clip · 103 category center · 104 bar/btn size
   105 Raleway · 106 32px gap
   ========================================================================== #}

{# 101 — VER MAIS hover (prod: hover:bg-white hover:text-black) #}
body.template-home [data-store="home-image-text-module"] .js-textbanner-text .btn,
body.template-home [data-store="home-image-text-module"] .js-textbanner-text .btn span {
  transition: all 0.3s ease !important;
}

body.template-home [data-store="home-image-text-module"] .js-textbanner-text .btn:hover,
body.template-home [data-store="home-image-text-module"] .js-textbanner-text .btn:focus,
body.template-home [data-store="home-image-text-module"] .textbanner-link:hover .js-textbanner-text .btn,
body.template-home [data-store="home-image-text-module"] .textbanner-link:focus .js-textbanner-text .btn {
  background: #fff !important;
  color: #000 !important;
  border-color: #fff !important;
}

body.template-home [data-store="home-image-text-module"] .textbanner-link:hover .yamuna-home-module-cta-icon,
body.template-home [data-store="home-image-text-module"] .js-textbanner-text .btn:hover .yamuna-home-module-cta-icon {
  fill: #000 !important;
}

{# 101 — LEIA MAIS hover #}
body.template-home .yamuna-blog-cta-more,
.yamuna-home-blog .yamuna-blog-cta-more {
  transition: all 0.3s ease !important;
}

body.template-home .yamuna-blog-cta-more:hover,
body.template-home .yamuna-blog-cta-more:focus,
.yamuna-home-blog .yamuna-blog-cta-more:hover,
.yamuna-home-blog .yamuna-blog-cta-more:focus {
  background: #238482 !important;
  border-color: #238482 !important;
  color: #fff !important;
}

body.template-home .yamuna-blog-cta-more:hover::after,
body.template-home .yamuna-blog-cta-more:focus::after,
.yamuna-home-blog .yamuna-blog-cta-more:hover::after,
.yamuna-home-blog .yamuna-blog-cta-more:focus::after {
  color: #fff !important;
}

{# 102 — Home product carousels: match prod (3 cards, 32px gap, no side peeks) #}
@media (min-width: 1200px) {
  body.template-home [data-store^="home-products-"].section-featured-home .container {
    max-width: 1312px !important;
    overflow: visible !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products > .col-12.p-0 {
    position: relative !important;
    padding-left: 0 !important;
    padding-right: 0 !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-container {
    overflow: hidden !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-wrapper {
    align-items: stretch !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .swiper-slide {
    height: auto !important;
    overflow: visible !important;
    box-sizing: border-box !important;
    padding: 0 !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .item,
  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-product {
    height: 100% !important;
    overflow: visible !important;
    border: 0 !important;
    border-radius: 8px !important;
    background: #fff !important;
    box-shadow: 0 2px 12px rgba(57, 55, 71, 0.1) !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-price-row {
    display: flex !important;
    flex-direction: column !important;
    align-items: flex-start !important;
    gap: 0 !important;
    width: 100% !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .yamuna-home-spot-payment {
    display: block !important;
    margin-top: 4px !important;
    white-space: normal !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 14px !important;
    color: #9e929e !important;
  }

  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-name,
  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-price,
  body.template-home [data-store^="home-products-"].section-featured-home .yamuna-home-products .item-description {
    text-align: left !important;
    font-family: 'Raleway', sans-serif !important;
  }
}

{# Keep blog card shadows without breaking product carousels #}
body.template-home .yamuna-home-blog .swiper-container {
  overflow: visible !important;
  padding: 12px 8px 28px !important;
  margin: -12px -8px 0 !important;
}

body.template-home .yamuna-home-blog .swiper-slide {
  overflow: visible !important;
  height: auto !important;
}

body.template-home .yamuna-home-blog .yamuna-blog-card--home {
  overflow: visible !important;
  border: 0 !important;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.18), 0 1px 4px rgba(0, 0, 0, 0.08) !important;
}

{# 103 — Category slider: 3 full circles, centered, no side crop (prod img4). #}
@media (max-width: 767px) {
  body.template-home .yamuna-category-slider-container {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
  }

  body.template-home .yamuna-category-slider-list {
    width: 284px !important;
    max-width: calc(100vw - 36px) !important;
    margin: 0 auto !important;
    overflow: hidden !important;
  }

  body.template-home .yamuna-category-slider-item {
    text-align: center !important;
    overflow: hidden !important;
  }

  body.template-home .yamuna-category-slider-item > span:not(.yamuna-category-slider-image) {
    display: block !important;
    width: 100% !important;
    max-width: 84px !important;
    margin: 0 auto !important;
  }

  body.template-home .yamuna-category-slider-image {
    width: 84px !important;
    height: 84px !important;
    max-width: 100% !important;
    margin-left: auto !important;
    margin-right: auto !important;
    padding: 2px !important;
    border: 1px solid #c4bfc7 !important;
    background: transparent !important;
    box-shadow: none !important;
  }

  body.template-home .yamuna-category-slider-image img {
    object-fit: cover !important;
    object-position: center center !important;
  }

  body.template-home .yamuna-category-slider-arrow-prev {
    left: 0 !important;
  }

  body.template-home .yamuna-category-slider-arrow-next {
    right: 0 !important;
  }
}

{# 104 / 105 / 106 — Module bar: 343×48, btn 120×32, Raleway, gap 32px #}
@media (max-width: 1023px) {
  body.template-home [data-store="home-image-text-module"] {
    padding-left: 16px !important;
    padding-right: 16px !important;
  }

  body.template-home [data-store="home-image-text-module"] .js-banner-container {
    gap: 32px !important;
  }

  body.template-home [data-store="home-image-text-module"] .js-textbanner,
  body.template-home [data-store="home-image-text-module"] .js-textbanner.mb-4,
  body.template-home [data-store="home-image-text-module"] .js-banner.flexible-banner {
    margin-bottom: 0 !important;
    padding-bottom: 0 !important;
  }

  body.template-home [data-store="home-image-text-module"] .js-textbanner .row {
    border-radius: 24px !important;
    overflow: hidden !important;
  }

  body.template-home [data-store="home-image-text-module"] .js-textbanner-text {
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    width: 100% !important;
    max-width: 100% !important;
    height: 48px !important;
    min-height: 48px !important;
    padding: 8px 16px !important;
    border-radius: 24px !important;
    background: #238482 !important;
    box-sizing: border-box !important;
  }

  body.template-home [data-store="home-image-text-module"] .textbanner-title {
    margin: 0 !important;
    color: #fff !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1 !important;
    text-transform: uppercase !important;
  }

  body.template-home [data-store="home-image-text-module"] .js-textbanner-text .btn {
    display: inline-flex !important;
    width: 120px !important;
    min-width: 120px !important;
    max-width: 120px !important;
    height: 32px !important;
    min-height: 32px !important;
    padding: 0 12px !important;
    border: 1px solid #fff !important;
    border-radius: 999px !important;
    background: transparent !important;
    color: #fff !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    line-height: 1 !important;
    text-transform: uppercase !important;
  }
}

{# 105 — Blog LEIA MAIS + summary Raleway (prod sizes) #}
body.template-home .yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-card-title,
body.template-home .yamuna-home-blog .yamuna-blog-card--home .item-name,
body.template-home .yamuna-home-blog .yamuna-blog-card--home .item-name a {
  font-family: 'Raleway', sans-serif !important;
  font-size: 18px !important;
  font-weight: 700 !important;
}

body.template-home .yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-card-summary,
body.template-home .yamuna-home-blog .yamuna-blog-card--home .post-item-summary,
body.template-home .yamuna-home-blog .yamuna-blog-card--home .item-description,
body.template-home .yamuna-home-blog .yamuna-blog-card--home .item-description p {
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 400 !important;
  line-height: 1.45 !important;
}

body.template-home .yamuna-home-blog .yamuna-blog-cta-more {
  min-width: 120px !important;
  height: 36px !important;
  min-height: 36px !important;
  font-family: 'Raleway', sans-serif !important;
}

body.template-home .yamuna-home-blog .yamuna-blog-cta-more::after {
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 600 !important;
}

{# Force blog card summary + LEIA MAIS to 16px (exact DevTools selectors). #}
body.template-home .yamuna-home-blog .post-item-summary.yamuna-blog-card-summary,
body.template-home .yamuna-home-blog .yamuna-blog-card--home .post-item-summary,
body.template-home .yamuna-home-blog .yamuna-blog-card--home .yamuna-blog-card-summary,
body.template-home .yamuna-home-blog article.yamuna-blog-card .post-item-summary,
body.template-home .yamuna-home-blog article.yamuna-blog-card .yamuna-blog-card-summary {
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 400 !important;
  line-height: 1.45 !important;
  color: #6b6570 !important;
}

body.template-home .yamuna-home-blog .yamuna-blog-cta-more,
body.template-home .yamuna-home-blog a.yamuna-blog-cta-more {
  font-size: 0 !important;
}

body.template-home .yamuna-home-blog .yamuna-blog-cta-more::after,
body.template-home .yamuna-home-blog a.yamuna-blog-cta-more::after {
  content: "Leia mais →" !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 600 !important;
  line-height: 1 !important;
}
{#/*============================================================================
  # Cenário 108: search input contrast, suggest typography, description size
==============================================================================*/#}

{# 1) Search fill field — solid bg so white typed text never disappears on white panel. #}
@media (min-width: 768px) {
  body .head-main .yamuna-header-desktop-search .search-input,
  body .head-main .yamuna-header-desktop-search .js-search-input,
  body .head-main .yamuna-header-desktop-search .form-control.search-input,
  body.template-home .head-main .yamuna-header-desktop-search .search-input,
  body.template-product .head-main .yamuna-header-desktop-search .search-input,
  body.template-category .head-main .yamuna-header-desktop-search .search-input,
  body.template-search .head-main .yamuna-header-desktop-search .search-input {
    color: #fff !important;
    -webkit-text-fill-color: #fff !important;
    caret-color: #fff !important;
    font-family: 'Raleway', sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    background: transparent !important;
    background-color: transparent !important;
    border: 1px solid #fff !important;
    border-radius: 32px !important;
    box-shadow: none !important;
  }

  body .head-main .yamuna-header-desktop-search .search-input::placeholder,
  body .head-main .yamuna-header-desktop-search .js-search-input::placeholder {
    color: rgba(255, 255, 255, .84) !important;
    -webkit-text-fill-color: rgba(255, 255, 255, .84) !important;
    opacity: 1 !important;
  }

  body .head-main .yamuna-header-desktop-search .search-input:-webkit-autofill,
  body .head-main .yamuna-header-desktop-search .search-input:-webkit-autofill:hover,
  body .head-main .yamuna-header-desktop-search .search-input:-webkit-autofill:focus,
  body .head-main .yamuna-header-desktop-search .js-search-input:-webkit-autofill,
  body .head-main .yamuna-header-desktop-search .js-search-input:-webkit-autofill:focus {
    -webkit-text-fill-color: #fff !important;
    caret-color: #fff !important;
    box-shadow: 0 0 0 1000px #a31460 inset !important;
    transition: background-color 99999s ease-out !important;
  }

  {# Keep typed text readable when suggest white panel is open behind input. #}
  body .head-main.yamuna-dropdown-open .yamuna-header-desktop-search .search-input,
  body .head-main.yamuna-dropdown-open .yamuna-header-desktop-search .js-search-input {
    background: #a31460 !important;
    background-color: #a31460 !important;
  }
}

{# 2) Search suggest name/price — larger type + prod brand colors. #}
body .search-suggest .search-suggest-link,
body .yamuna-mobile-search-suggest .search-suggest-link,
body .head-main .yamuna-mobile-search-suggest .search-suggest-link {
  color: #4a1d3a !important;
}

body .search-suggest .search-suggest-name,
body .search-suggest .search-suggest-text p.search-suggest-name,
body .yamuna-mobile-search-suggest .search-suggest-name,
body .yamuna-mobile-search-suggest .search-suggest-text p.search-suggest-name {
  color: #4a1d3a !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 500 !important;
  line-height: 1.3 !important;
}

body .search-suggest .search-suggest-name strong,
body .search-suggest .search-suggest-name b,
body .yamuna-mobile-search-suggest .search-suggest-name strong,
body .yamuna-mobile-search-suggest .search-suggest-name b {
  color: #a31460 !important;
  font-weight: 700 !important;
}

body .search-suggest .search-suggest-text > p:not(.search-suggest-name),
body .yamuna-mobile-search-suggest .search-suggest-text > p:not(.search-suggest-name) {
  color: #a31460 !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: 16px !important;
  font-weight: 500 !important;
  line-height: 1.3 !important;
}

{# 3) PDP description body — bump font size. #}
body.template-product #product-description .yamuna-product-description-main,
body.template-product #product-description .yamuna-product-description-main p,
body.template-product #product-description .yamuna-product-description-main li,
body.template-product #product-description .yamuna-product-description-main strong,
body.template-product #product-description .yamuna-product-description-main em {
  font-size: 18px !important;
  line-height: 1.55 !important;
}


{#/*============================================================================
  # C108 navbar + panels (prod tuck-under)
  # Bugs fixed here:
  # 1) z-index on .nav / .search TRAPS fixed panels → white panel covers magenta
  #    chrome. Keep containers z-index:auto; raise only chrome nodes.
  # 2) -webkit-text-fill #fff on ALL .nav-list-link made mega-menu labels
  #    invisible (white on white). Scope white fill to top-level links only.
  # Stack inside .yamuna-header-desktop:
  #   panels z=2 < capsule ::before z=4 < chrome (logo/links/search/utils) z=5
==============================================================================*/#}
@media (min-width: 1024px) {
  body[class] .head-main .yamuna-header-desktop,
  body.template-home .head-main .yamuna-header-desktop,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop {
    display: flex !important;
  }

  {# Do NOT create stacking contexts on nav/search — panels must sit under capsule. #}
  body[class] .head-main .yamuna-header-desktop-nav,
  body[class] .head-main .yamuna-header-desktop-search,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-nav,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-nav,
  body.template-home .head-main .yamuna-header-desktop-search {
    z-index: auto !important;
  }

  body[class] .head-main .yamuna-header-desktop::before,
  body.template-home .head-main .yamuna-header-desktop::before,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop::before,
  body[class] .head-main.compress .yamuna-header-desktop::before {
    z-index: 4 !important;
    opacity: 1 !important;
    pointer-events: none !important;
    background: #a31460 !important;
    background-color: #a31460 !important;
    border-top-left-radius: 0 !important;
    border-top-right-radius: 0 !important;
    border-bottom-left-radius: 54px !important;
    border-bottom-right-radius: 54px !important;
    border-radius: 0 0 54px 54px !important;
  }

  {# Chrome above capsule (logo + utilities + top-level controls only). #}
  body[class] .head-main .yamuna-header-desktop-logo,
  body[class] .head-main .yamuna-header-desktop-utilities,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-logo,
  html.yamuna-header-scrolled body[class] .head-main .yamuna-header-desktop-utilities {
    z-index: 5 !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav > .nav-list-link,
  body[class] .head-main .yamuna-products-menu > .nav-item-container,
  body[class] .head-main .yamuna-products-menu > .nav-item-container > .nav-list-link,
  body[class] .head-main .yamuna-header-desktop-search .js-search-container,
  body[class] .head-main .yamuna-header-desktop-search .search-container {
    position: relative !important;
    z-index: 5 !important;
  }

  {# Top-level header links only (NOT mega-menu items). #}
  body[class] .head-main .yamuna-header-desktop-nav > .nav-list-link,
  body[class] .head-main .yamuna-products-menu > .nav-item-container > .nav-list-link {
    color: #fff !important;
    -webkit-text-fill-color: #fff !important;
  }

  {# Mega-menu labels: teal on white (override any white fill leak). #}
  body[class] .head-main .yamuna-products-dropdown .nav-list-link,
  body[class] .head-main .desktop-dropdown .nav-list-link,
  body[class] .head-main .desktop-list-subitems > .nav-item > .nav-list-link,
  body.template-home .head-main .desktop-list-subitems > .nav-item > .nav-list-link {
    color: #238482 !important;
    -webkit-text-fill-color: #238482 !important;
    opacity: 1 !important;
    visibility: visible !important;
  }

  body[class] .head-main .yamuna-header-desktop-utilities img,
  body[class] .head-main .yamuna-header-desktop-utilities svg,
  body[class] .head-main .yamuna-header-desktop-utilities .icon-2x,
  body[class] .head-main .yamuna-header-desktop-utilities .yamuna-header-action img {
    filter: brightness(0) invert(1) !important;
    opacity: 1 !important;
    visibility: visible !important;
  }

  {# Panels tuck under capsule; must stay below chrome. #}
  body[class] .head-main .yamuna-header-desktop-search .search-suggest,
  body[class] .head-main .yamuna-header-desktop-search .js-search-suggest,
  body.template-home .head-main .yamuna-header-desktop-search .search-suggest,
  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown,
  body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-dropdown,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown {
    top: var(--yamuna-panel-top, 0px) !important;
    left: var(--yamuna-menu-left, 50%) !important;
    width: var(--yamuna-menu-width, min(1312px, calc(100vw - 48px))) !important;
    z-index: 2 !important;
    padding-top: var(--yamuna-panel-overlap, 105px) !important;
    margin-top: 0 !important;
    border-radius: 0 0 54px 54px !important;
    background: #fff !important;
  }

  body[class] .head-main .yamuna-header-desktop-search .search-suggest,
  body[class] .head-main .yamuna-header-desktop-search .js-search-suggest {
    box-shadow: 4px 4px 8px rgba(0, 0, 0, .15) !important;
  }

  body[class] #modal-cart,
  body[class] #modal-cart.modal,
  body.template-home #modal-cart,
  body:not(.template-home) #modal-cart {
    top: var(--yamuna-panel-top, 0px) !important;
    border-radius: 0 0 54px 54px !important;
    overflow: hidden !important;
  }

  body[class] #modal-cart.modal-show,
  body[class] #modal-cart.modal.modal-show {
    top: var(--yamuna-panel-top, 0px) !important;
  }

  body[class] .head-main .yamuna-header-desktop-search,
  body.template-home .head-main .yamuna-header-desktop-search {
    display: block !important;
    visibility: visible !important;
    opacity: 1 !important;
  }

  body[class] .head-main .yamuna-header-desktop-search .search-input,
  body[class] .head-main .yamuna-header-desktop-search .js-search-input {
    display: block !important;
    visibility: visible !important;
    opacity: 1 !important;
    background: transparent !important;
    background-color: transparent !important;
    color: #fff !important;
    -webkit-text-fill-color: #fff !important;
  }

  {# Products promo image: fill full right column (incl. tuck-under top),
     no white strip in the top-right corner. #}
  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown,
  body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-dropdown {
    overflow: hidden !important;
  }

  body[class] .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown::after,
  body[class] .head-main .yamuna-header-desktop-nav .yamuna-products-dropdown::after,
  body.template-home .head-main .yamuna-header-desktop-nav .nav-main-item.nav-dropdown .desktop-dropdown::after {
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: auto !important;
    width: min(420px, 38%) !important;
    height: auto !important;
    border-radius: 0 0 54px 0 !important;
    background-position: center right !important;
    background-size: cover !important;
    background-repeat: no-repeat !important;
    opacity: 1 !important;
  }
}
