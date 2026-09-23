{{ component('nubesdk-slot', { type: "before_line_items" }) }}

<style>
  /* Cenário 011 — top promo: bg 32px, fonte 16px */
  body #modal-cart .yamuna-cart-top-promo,
  body[class] #modal-cart .yamuna-cart-top-promo {
    display: flex !important;
    flex: 0 0 32px !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 12px !important;
    box-sizing: border-box !important;
    width: 100% !important;
    height: 32px !important;
    min-height: 32px !important;
    max-height: 32px !important;
    margin: 0 !important;
    padding: 0 12px !important;
    background: #a31460 !important;
    color: #fff !important;
    font-family: Dosis, Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 800 !important;
    line-height: 16px !important;
    text-transform: uppercase !important;
    letter-spacing: 0.02em !important;
  }

  body #modal-cart .yamuna-cart-top-promo span,
  body[class] #modal-cart .yamuna-cart-top-promo span {
    font-size: 16px !important;
    font-weight: 800 !important;
    line-height: 16px !important;
    color: #fff !important;
  }

  body #modal-cart .yamuna-cart-top-promo img,
  body[class] #modal-cart .yamuna-cart-top-promo img {
    width: 18px !important;
    height: 18px !important;
    flex: 0 0 18px !important;
  }

  #modal-cart .yamuna-cart-discount {
    font-family: 'Dosis', sans-serif !important;
  }

  /* O drawer mobile abaixo segue o frame de 320px do Figma em style-async.scss.tpl.
     Estas regras complementam somente a apresentação desktop. */
  @media (min-width: 1024px) {
    /* display only when .modal-show — otherwise .hide()/close cannot win over !important */
    body #modal-cart.modal {
      position: fixed !important;
      /* White panel starts at the viewport top so no gap sits above the capsule. */
      top: var(--yamuna-panel-top, 0px) !important;
      right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important;
      left: auto !important;
      display: none !important;
      flex-direction: column !important;
      width: 424px !important;
      max-width: calc(100vw - 32px) !important;
      height: min(920px, calc(100vh - var(--yamuna-panel-top, 0px) - 16px)) !important;
      min-height: 0 !important;
      padding: 0 !important;
      overflow: hidden !important;
      border-radius: 0 0 54px 54px !important;
      box-shadow: 4px 4px 8px rgba(0, 0, 0, .15) !important;
      transform: none !important;
      z-index: 29000 !important;
      background: #fff !important;
      opacity: 0 !important;
      visibility: hidden !important;
      pointer-events: none !important;
    }

    body #modal-cart.modal.modal-show {
      display: flex !important;
      right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important;
      top: var(--yamuna-panel-top, 0px) !important;
      opacity: 1 !important;
      visibility: visible !important;
      pointer-events: auto !important;
    }

    body #modal-cart .modal-header,
    body #modal-cart .yamuna-cart-modal-header {
      box-sizing: border-box !important;
      flex: 0 0 auto !important;
      height: auto !important;
      min-height: 0 !important;
      max-height: none !important;
      margin: 0 !important;
      padding: calc(var(--yamuna-panel-overlap, 105px) + 16px) 20px 16px 20px !important;
      border-bottom: 1px solid #d8d0d6 !important;
      background: #fff !important;
      color: #4a1d3a !important;
      font-family: Roboto, Arial, sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: normal !important;
      text-transform: uppercase !important;
    }

    body #modal-cart .modal-header .modal-close,
    body #modal-cart .yamuna-cart-modal-close {
      top: auto !important;
      right: 20px !important;
      position: static !important;
    }

    body #modal-cart .js-ajax-cart-list {
      padding: 16px 20px 0 !important;
    }

    body #modal-cart .yamuna-cart-shipping-promo {
      position: relative !important;
      top: auto !important;
      right: auto !important;
      left: auto !important;
      box-sizing: border-box !important;
      width: calc(100% - 24px) !important;
      height: 32px !important;
      min-height: 32px !important;
      max-height: 32px !important;
      margin: 12px 12px 8px !important;
      padding: 0 8px 4px !important;
      overflow: hidden !important;
    }

    body #modal-cart .js-empty-ajax-cart {
      position: absolute !important;
      top: 73px !important;
      right: 0 !important;
      bottom: 120px !important;
      left: 0 !important;
      padding: 0 !important;
    }

    /* Estado vazio no desktop: espelha o painel de recomendação do Figma. */
    body #modal-cart:not(:has(.js-cart-item)) .modal-header {
      display: flex !important;
      flex: 0 0 auto !important;
      height: auto !important;
      min-height: 0 !important;
      max-height: none !important;
      padding: calc(var(--yamuna-panel-overlap, 105px) + 16px) 20px 16px 20px !important;
      border-bottom: 1px solid #c0bbc3 !important;
      color: #4a1d3a !important;
      font-family: 'Raleway', sans-serif !important;
      font-size: 16px !important;
      font-weight: 600 !important;
      line-height: 20px !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .modal-header .modal-close {
      position: static !important;
      top: auto !important;
      right: auto !important;
      display: flex !important;
      width: 24px !important;
      height: 24px !important;
      border-radius: 50% !important;
      background: #f2edf0 url('{{ 'images/yamuna/cart-close.svg' | static_url }}') center / 18px 18px no-repeat !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .modal-header .modal-close svg {
      display: none !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .js-ajax-cart-list,
    body #modal-cart:not(:has(.js-cart-item)) .yamuna-minicart-scroll,
    body #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-shipping-promo,
    body #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-top-promo,
    body #modal-cart:not(:has(.js-cart-item)) .js-visible-on-cart-filled,
    body #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-dropdown-footer,
    body #modal-cart:not(:has(.js-cart-item)) .cart-item-delete,
    body #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-trash-icon {
      display: none !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .js-empty-ajax-cart {
      position: relative !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      display: block !important;
      flex: 1 1 auto !important;
      padding: 20px !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-content {
      position: static !important;
      display: block !important;
      color: #4a1d3a !important;
      text-align: center !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-content > p,
    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-content > strong {
      display: block !important;
      font-family: 'Dosis', sans-serif !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-content > p {
      margin: 0 0 2px !important;
      font-size: 18px !important;
      font-weight: 500 !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-content > strong {
      margin: 0 0 28px !important;
      font-size: 18px !important;
      font-weight: 700 !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-links {
      display: grid !important;
      gap: 28px !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-link {
      position: relative !important;
      display: flex !important;
      height: 110px !important;
      padding: 0 !important;
      align-items: flex-end !important;
      overflow: hidden !important;
      border-radius: 8px !important;
      background: #d9d9d9 !important;
      filter: none !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-link::before {
      position: absolute !important;
      inset: 0 !important;
      background-position: center !important;
      background-size: cover !important;
      filter: grayscale(1) !important;
      content: '' !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-link-super::before {
      background-image: url('{{ 'images/yamuna/cart-empty-superfoods.png' | static_url }}') !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-link-cosmetics::before {
      background-image: url('{{ 'images/yamuna/cart-empty-cosmetics.png' | static_url }}') !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-empty-cart-link span {
      position: relative !important;
      z-index: 1 !important;
      display: inline-flex !important;
      height: 30px !important;
      margin: 0 !important;
      padding: 0 16px !important;
      align-items: center !important;
      border-radius: 0 6px 0 0 !important;
      background: #4a1d3a !important;
      color: #fff !important;
      font-family: 'Dosis', sans-serif !important;
      font-size: 14px !important;
      font-weight: 700 !important;
      line-height: 1 !important;
      text-transform: uppercase !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer {
      position: relative !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      display: flex !important;
      flex: 0 0 auto !important;
      flex-direction: column !important;
      height: auto !important;
      min-height: 0 !important;
      padding: 0 0 24px !important;
      background: #fff !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .yamuna-cart-empty-footer .yamuna-cart-checkout,
    body #modal-cart .yamuna-cart-empty-footer .yamuna-cart-checkout {
      position: relative !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      box-sizing: border-box !important;
      width: calc(100% - 40px) !important;
      max-width: none !important;
      height: 40px !important;
      min-height: 40px !important;
      margin: 16px 20px 8px !important;
      padding: 0 !important;
    }

    /* O estado preenchido é determinado pelo item que a própria plataforma
       mantém no DOM. Isso impede que o rodapé vazio persista após o AJAX. */
    body #modal-cart:has(.js-cart-item) .js-empty-ajax-cart,
    body #modal-cart:has(.js-cart-item) .yamuna-cart-empty-footer {
      display: none !important;
    }

    body #modal-cart:has(.js-cart-item) .yamuna-minicart-scroll,
    body #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer,
    body #modal-cart:has(.js-cart-item) .yamuna-cart-shipping-promo,
    body #modal-cart:has(.js-cart-item) .yamuna-cart-top-promo {
      display: flex !important;
    }

    body #modal-cart:has(.js-cart-item) .yamuna-minicart-scroll {
      flex: 1 1 auto !important;
      flex-direction: column !important;
      width: 100% !important;
      min-height: 240px !important;
      max-height: none !important;
      overflow-x: hidden !important;
      overflow-y: auto !important;
    }

    body #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer {
      flex: 0 0 auto !important;
      flex-direction: column !important;
      max-height: none !important;
      overflow: visible !important;
    }

    /* Figma sacola desktop: image | body; controls under body column. */
    body #modal-cart .yamuna-minicart-item,
    body #modal-cart .cart-item.yamuna-minicart-item {
      position: relative !important;
      display: grid !important;
      grid-template-columns: 88px minmax(0, 1fr) !important;
      grid-template-rows: auto auto !important;
      align-items: start !important;
      column-gap: 16px !important;
      row-gap: 0 !important;
      min-height: 0 !important;
      height: auto !important;
      margin: 0 !important;
      padding: 16px 0 !important;
      border-bottom: 1px solid #c0bbc3 !important;
      box-sizing: border-box !important;
    }

    body #modal-cart .yamuna-minicart-item-image {
      grid-column: 1 !important;
      grid-row: 1 / span 2 !important;
      flex: none !important;
      width: 88px !important;
      max-width: 88px !important;
      padding: 0 !important;
    }

    body #modal-cart .yamuna-minicart-item-body {
      grid-column: 2 !important;
      grid-row: 1 !important;
      display: flex !important;
      flex-direction: column !important;
      min-width: 0 !important;
      padding: 0 !important;
    }

    body #modal-cart .yamuna-minicart-item-controls {
      grid-column: 2 !important;
      grid-row: 2 !important;
      display: flex !important;
      flex-direction: row !important;
      flex-wrap: wrap !important;
      align-items: center !important;
      justify-content: space-between !important;
      gap: 12px !important;
      width: 100% !important;
      margin: 12px 0 0 !important;
      float: none !important;
    }

    body #modal-cart .yamuna-minicart-item-image a,
    body #modal-cart .yamuna-minicart-item-image img {
      display: block !important;
      width: 88px !important;
      height: 88px !important;
      object-fit: contain !important;
    }

    body #modal-cart .yamuna-minicart-item-body {
      position: relative !important;
      grid-column: 2 !important;
      grid-row: 1 !important;
      display: flex !important;
      flex: none !important;
      flex-direction: column !important;
      align-items: stretch !important;
      min-width: 0 !important;
      padding: 0 !important;
      float: none !important;
    }

    /* Kill Bootstrap floats/margins that collapse the name column and orphan the trash. */
    body #modal-cart .yamuna-minicart-item .form-group,
    body #modal-cart .yamuna-minicart-item .form-quantity,
    body #modal-cart .yamuna-minicart-item .yamuna-minicart-qty,
    body #modal-cart .yamuna-minicart-item .cart-item-quantity,
    body #modal-cart .yamuna-minicart-item .row {
      float: none !important;
      clear: none !important;
      margin: 0 !important;
      margin-bottom: 0 !important;
    }

    body #modal-cart .yamuna-minicart-item .form-group::after,
    body #modal-cart .yamuna-minicart-item .form-group::before,
    body #modal-cart .yamuna-minicart-item .row::after,
    body #modal-cart .yamuna-minicart-item .row::before {
      display: none !important;
      content: none !important;
    }

    body #modal-cart .yamuna-minicart-item-top {
      display: flex !important;
      flex-direction: row !important;
      align-items: flex-start !important;
      justify-content: space-between !important;
      gap: 12px !important;
      width: 100% !important;
    }

    body #modal-cart .cart-item-name,
    body #modal-cart .cart-item-name a {
      display: -webkit-box !important;
      -webkit-box-orient: vertical !important;
      -webkit-line-clamp: 2 !important;
      overflow: hidden !important;
      text-overflow: ellipsis !important;
      word-break: break-word !important;
      overflow-wrap: anywhere !important;
    }

    body #modal-cart .cart-item-name {
      flex: 1 1 auto !important;
      min-width: 0 !important;
      max-width: none !important;
      width: auto !important;
      margin: 0 !important;
      padding: 0 !important;
      color: #393747 !important;
      font-family: 'Dosis', sans-serif !important;
      font-size: 18px !important;
      font-weight: 600 !important;
      line-height: 22px !important;
    }

    body #modal-cart .cart-item-name a {
      color: inherit !important;
      text-decoration: none !important;
      width: 100% !important;
    }

    /* Hide platform cart labels that inflate the name block. */
    body #modal-cart .cart-item-name [data-store="cart-item-labels"],
    body #modal-cart .cart-item-name .mt-2 {
      display: none !important;
    }

    body #modal-cart .yamuna-cart-dropdown-footer {
      box-sizing: border-box !important;
      display: flex !important;
      flex-direction: column !important;
      align-items: stretch !important;
      height: auto !important;
      min-height: 160px !important;
      padding: 0 0 28px !important;
    }

    body #modal-cart .yamuna-cart-dropdown-footer > p {
      position: static !important;
      margin: 12px 20px 0 !important;
      color: #000 !important;
      font-size: 16px !important;
      font-weight: 400 !important;
      line-height: 1.25 !important;
      text-align: center !important;
    }

    body #modal-cart .yamuna-cart-checkout {
      position: relative !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      gap: 10px !important;
      box-sizing: border-box !important;
      width: calc(100% - 32px) !important;
      height: 40px !important;
      min-height: 40px !important;
      margin: 16px 16px 0 !important;
      padding: 0 16px !important;
      border: 0 !important;
      border-radius: 999px !important;
      font-family: Raleway, sans-serif !important;
      font-size: 14px !important;
      font-weight: 600 !important;
      letter-spacing: 0.04em !important;
      text-transform: uppercase !important;
    }

    body #modal-cart .yamuna-cart-item-promo {
      display: none !important;
    }

    body #modal-cart .cart-item-subtotal {
      position: static !important;
      top: auto !important;
      right: auto !important;
      flex: 0 0 auto !important;
      margin: 0 !important;
      padding: 0 !important;
    }

    body #modal-cart .cart-item-subtotal,
    body #modal-cart .cart-item-subtotal .js-cart-item-subtotal {
      color: #4a1d3a !important;
      font-family: 'Dosis', sans-serif !important;
      font-size: 20px !important;
      font-weight: 700 !important;
      line-height: 22px !important;
      text-align: right !important;
      white-space: nowrap !important;
    }

    /* Cenário 019: buy-3 unit price as De / Por (prod) */
    body #modal-cart .yamuna-minicart-unit-promo {
      display: flex !important;
      flex-direction: column !important;
      align-items: flex-end !important;
      gap: 0 !important;
      margin: 0 !important;
      padding: 0 !important;
      text-align: right !important;
      white-space: nowrap !important;
    }

    body #modal-cart .yamuna-minicart-unit-promo.is-hidden,
    body #modal-cart .js-cart-item-subtotal.is-hidden {
      display: none !important;
    }

    body #modal-cart .yamuna-minicart-unit-de,
    body #modal-cart .yamuna-minicart-unit-por {
      margin: 0 !important;
      padding: 0 !important;
      font-family: 'Dosis', sans-serif !important;
      font-weight: 800 !important;
      line-height: 1.15 !important;
    }

    body #modal-cart .yamuna-minicart-unit-de {
      color: #4a1d3a !important;
      font-size: 14px !important;
    }

    body #modal-cart .yamuna-minicart-unit-de-value {
      text-decoration: line-through !important;
    }

    body #modal-cart .yamuna-minicart-unit-por {
      color: #238482 !important;
      font-size: 18px !important;
    }

    body #modal-cart .yamuna-minicart-unit-por-label {
      font-size: 14px !important;
      font-weight: 800 !important;
    }

    body #modal-cart .yamuna-minicart-item-controls {
      display: flex !important;
      flex-direction: row !important;
      align-items: center !important;
      justify-content: space-between !important;
      gap: 12px !important;
      width: 100% !important;
      margin-top: 10px !important;
    }

    body #modal-cart .yamuna-minicart-item-controls .cart-item-quantity {
      position: static !important;
      top: auto !important;
      left: auto !important;
      width: 88px !important;
      margin: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-group,
    body #modal-cart .cart-item-quantity .form-quantity,
    body #modal-cart .cart-item-quantity .form-quantity .row {
      display: flex !important;
      flex-wrap: nowrap !important;
      width: 96px !important;
      height: 34px !important;
      margin: 0 !important;
      padding: 0 !important;
      align-items: center !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity {
      overflow: hidden !important;
      border: 1px solid #c0bbc3 !important;
      border-radius: 999px !important;
      background: #fff !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity-icon,
    body #modal-cart .cart-item-quantity .form-control {
      box-sizing: border-box !important;
      height: 34px !important;
      min-height: 34px !important;
      margin: 0 !important;
      border: 0 !important;
      border-radius: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity-icon {
      display: flex !important;
      flex: 0 0 30px !important;
      width: 30px !important;
      padding: 0 !important;
      align-items: center !important;
      justify-content: center !important;
      background: #f4f4f4 !important;
      color: #4a1d3a !important;
      font-family: Dosis, Roboto, Arial, sans-serif !important;
      font-size: 16px !important;
      line-height: 1 !important;
    }

    body #modal-cart .cart-item-quantity .yamuna-cart-minus,
    body #modal-cart .cart-item-quantity .form-quantity-icon:last-child {
      border-radius: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity .col {
      flex: 0 0 34px !important;
      width: 34px !important;
      max-width: 34px !important;
      padding: 0 !important;
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
    }

    body #modal-cart .cart-item-quantity .form-control,
    body #modal-cart .cart-item-quantity .js-cart-quantity-input {
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      width: 32px !important;
      height: 34px !important;
      min-height: 34px !important;
      padding: 0 !important;
      margin: 0 !important;
      border: 0 !important;
      background: #fff !important;
      color: #111827 !important;
      -webkit-text-fill-color: #111827 !important;
      font-family: Dosis, Roboto, Arial, sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 34px !important;
      text-align: center !important;
      appearance: textfield !important;
      -moz-appearance: textfield !important;
      transition: none !important;
      animation: none !important;
      opacity: 1 !important;
      visibility: visible !important;
    }

    body #modal-cart .cart-item-quantity .js-cart-quantity-input::-webkit-outer-spin-button,
    body #modal-cart .cart-item-quantity .js-cart-quantity-input::-webkit-inner-spin-button {
      -webkit-appearance: none !important;
      margin: 0 !important;
    }

    body #modal-cart .cart-item-delete {
      position: static !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      z-index: 1 !important;
      display: flex !important;
      flex: 0 0 auto !important;
      align-items: center !important;
      justify-content: flex-end !important;
      width: 24px !important;
      height: 32px !important;
      margin: 0 0 0 auto !important;
      padding: 0 !important;
    }

    body #modal-cart .cart-item-delete .btn {
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      width: 24px !important;
      height: 24px !important;
      margin: 0 !important;
      padding: 0 !important;
      border: 0 !important;
      background: transparent !important;
    }

    body #modal-cart .yamuna-cart-trash-icon {
      display: block !important;
      width: 14px !important;
      height: 16px !important;
    }

    body #modal-cart .yamuna-cart-subscription {
      position: static !important;
      top: auto !important;
      left: auto !important;
      right: auto !important;
      bottom: auto !important;
      float: none !important;
      clear: both !important;
      display: inline-flex !important;
      align-items: center !important;
      justify-content: center !important;
      align-self: flex-start !important;
      width: auto !important;
      min-width: 150px !important;
      max-width: 180px !important;
      height: 26px !important;
      margin: 10px 0 0 !important;
      padding: 0 8px !important;
      border: 1px solid #a31460 !important;
      border-radius: 2px !important;
      color: #a31460 !important;
      font-family: 'Dosis', sans-serif !important;
      font-size: 14px !important;
      font-weight: 500 !important;
      line-height: 24px !important;
      text-align: center !important;
      white-space: nowrap !important;
    }

    body #modal-cart .yamuna-minicart-item-controls {
      display: flex !important;
      flex-direction: row !important;
      flex-wrap: wrap !important;
      align-items: center !important;
      justify-content: space-between !important;
      gap: 12px !important;
      width: 100% !important;
      margin: 12px 0 0 !important;
      float: none !important;
    }

    /* Desktop Figma: qty | trash, then ASSINAR on the next line */
    body #modal-cart .yamuna-minicart-item-controls .cart-item-quantity {
      order: 1 !important;
    }

    body #modal-cart .yamuna-minicart-item-controls .cart-item-delete {
      order: 2 !important;
      margin-left: auto !important;
    }

    body #modal-cart .yamuna-minicart-item-controls .yamuna-cart-subscription {
      order: 3 !important;
      flex: 0 0 100% !important;
      width: auto !important;
      max-width: none !important;
      margin: 0 !important;
    }

    body #modal-cart .cart-item-delete {
      position: static !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      float: none !important;
      z-index: 1 !important;
      display: flex !important;
      flex: 0 0 auto !important;
      align-items: center !important;
      justify-content: flex-end !important;
      width: 24px !important;
      height: 32px !important;
      margin: 0 !important;
      padding: 0 !important;
    }

    /* Hide trash icon when cart is empty */
    body #modal-cart .js-empty-ajax-cart .cart-item-delete,
    body #modal-cart .js-empty-ajax-cart .yamuna-cart-trash-icon,
    body #modal-cart .js-ajax-cart-list:empty ~ .cart-item-delete {
      display: none !important;
    }

    /* Breathing room under COMPRAR — match prod (20px) */
    body #modal-cart .yamuna-cart-dropdown-footer {
      padding-bottom: 20px !important;
    }

    body #modal-cart .yamuna-cart-checkout {
      position: relative !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
    }
  }

  /* Ajustes mobile do frame do Figma: rodapé em 120px, faixa em y=448 e CTA em y=503. */
  @media (max-width: 1023px) {
    /* O drawer do Figma ocupa todo o viewport no mobile e fica acima do cabeçalho da loja. */
    body #modal-cart.modal {
      position: fixed !important;
      top: 0 !important;
      right: 0 !important;
      bottom: 0 !important;
      left: 0 !important;
      display: none !important;
      flex-direction: column !important;
      width: 100vw !important;
      max-width: none !important;
      height: 100dvh !important;
      max-height: none !important;
      padding: 0 !important;
      margin: 0 !important;
      overflow: hidden !important;
      border: 0 !important;
      border-radius: 0 !important;
      background: #fff !important;
      z-index: 41000 !important;
      opacity: 0 !important;
      visibility: hidden !important;
      pointer-events: none !important;
    }

    body #modal-cart.modal.modal-show {
      display: flex !important;
      opacity: 1 !important;
      visibility: visible !important;
      pointer-events: auto !important;
    }

    body .js-modal-overlay[data-modal-id="#modal-cart"] {
      z-index: 40500 !important;
    }

    /* Mobile minicart item — image|body on top, full-width qty|ASSINAR|trash. */
    body #modal-cart .yamuna-minicart-item,
    body #modal-cart .cart-item.yamuna-minicart-item {
      position: relative !important;
      display: grid !important;
      grid-template-columns: 80px minmax(0, 1fr) !important;
      grid-template-rows: auto auto !important;
      align-items: start !important;
      column-gap: 13px !important;
      row-gap: 8px !important;
      min-height: 0 !important;
      height: auto !important;
      margin: 0 !important;
      padding: 12px 0 !important;
      border-bottom: 1px solid #c0bbc3 !important;
    }

    body #modal-cart .yamuna-minicart-item-image {
      grid-column: 1 !important;
      grid-row: 1 !important;
      flex: none !important;
      width: 80px !important;
      max-width: 80px !important;
      padding: 0 !important;
    }

    body #modal-cart .yamuna-minicart-item-body {
      grid-column: 2 !important;
      grid-row: 1 !important;
      display: flex !important;
      flex: none !important;
      flex-direction: column !important;
      min-width: 0 !important;
      padding: 0 !important;
    }

    body #modal-cart .yamuna-minicart-item-controls {
      grid-column: 1 / -1 !important;
      grid-row: 2 !important;
      display: flex !important;
      flex-direction: row !important;
      flex-wrap: nowrap !important;
      align-items: center !important;
      justify-content: flex-start !important;
      gap: 8px !important;
      width: 100% !important;
      margin: 0 !important;
    }

    body #modal-cart .yamuna-minicart-item-image a,
    body #modal-cart .yamuna-minicart-item-image img {
      display: block !important;
      width: 80px !important;
      height: 80px !important;
      object-fit: contain !important;
    }

    body #modal-cart .yamuna-minicart-item-top {
      display: flex !important;
      flex-direction: row !important;
      align-items: flex-start !important;
      justify-content: space-between !important;
      gap: 8px !important;
      width: 100% !important;
    }

    body #modal-cart .cart-item-name {
      flex: 1 1 auto !important;
      min-width: 0 !important;
      width: auto !important;
      margin: 0 !important;
      padding: 0 !important;
      color: #393747 !important;
      font-family: 'Raleway', sans-serif !important;
      font-size: 14px !important;
      font-weight: 600 !important;
      line-height: 17px !important;
      display: -webkit-box !important;
      -webkit-box-orient: vertical !important;
      -webkit-line-clamp: 2 !important;
      overflow: hidden !important;
      text-overflow: ellipsis !important;
    }

    body #modal-cart .cart-item-name a { color: inherit !important; text-decoration: none !important; }
    body #modal-cart .cart-item-name small,
    body #modal-cart .cart-item-name [data-component="cart-labels"],
    body #modal-cart .js-cart-item-subtotal-compare-price-container { display: none !important; }

    body #modal-cart .cart-item-subtotal,
    body #modal-cart .cart-item-subtotal .js-cart-item-subtotal {
      position: static !important;
      flex: 0 0 auto !important;
      margin: 0 !important;
      color: var(--brand-blue-secondary-800, #238482) !important;
      font-family: 'Inter', sans-serif !important;
      font-size: 14px !important;
      font-weight: 700 !important;
      line-height: 17px !important;
      text-align: right !important;
      white-space: nowrap !important;
    }

    body #modal-cart .yamuna-minicart-unit-promo {
      display: flex !important;
      flex-direction: column !important;
      align-items: flex-end !important;
      gap: 0 !important;
      margin: 0 !important;
      padding: 0 !important;
      text-align: right !important;
      white-space: nowrap !important;
    }

    body #modal-cart .yamuna-minicart-unit-promo.is-hidden,
    body #modal-cart .js-cart-item-subtotal.is-hidden {
      display: none !important;
    }

    body #modal-cart .yamuna-minicart-unit-de,
    body #modal-cart .yamuna-minicart-unit-por {
      margin: 0 !important;
      padding: 0 !important;
      font-family: 'Dosis', sans-serif !important;
      font-weight: 800 !important;
      line-height: 1.15 !important;
    }

    body #modal-cart .yamuna-minicart-unit-de {
      color: #4a1d3a !important;
      font-size: 14px !important;
    }

    body #modal-cart .yamuna-minicart-unit-de-value {
      text-decoration: line-through !important;
    }

    body #modal-cart .yamuna-minicart-unit-por {
      color: #238482 !important;
      font-size: 18px !important;
    }

    body #modal-cart .yamuna-minicart-unit-por-label {
      font-size: 14px !important;
      font-weight: 800 !important;
    }

    body #modal-cart .yamuna-cart-item-promo {
      position: static !important;
      display: flex !important;
      flex-direction: column !important;
      justify-content: center !important;
      width: 99px !important;
      min-height: 30px !important;
      margin: 8px 0 0 !important;
      padding: 4px 6px !important;
      border-radius: 3px !important;
      background: rgba(192, 187, 195, .2) !important;
      color: var(--neutral-gray-600, #393747) !important;
      font-family: 'Dosis', sans-serif !important;
      font-size: 10px !important;
      font-weight: 400 !important;
      line-height: 115% !important;
      text-align: center !important;
    }

    body #modal-cart .yamuna-cart-item-promo > span {
      display: block !important;
      white-space: nowrap !important;
    }

    body #modal-cart .yamuna-minicart-item-controls .cart-item-quantity,
    body #modal-cart .cart-item-quantity .form-group,
    body #modal-cart .cart-item-quantity .form-quantity,
    body #modal-cart .cart-item-quantity .form-quantity .row {
      position: static !important;
      top: auto !important;
      left: auto !important;
      display: flex !important;
      flex-wrap: nowrap !important;
      align-items: center !important;
      width: 96px !important;
      height: 34px !important;
      margin: 0 !important;
      padding: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity {
      overflow: hidden !important;
      border: 1px solid #c0bbc3 !important;
      border-radius: 999px !important;
      background: #fff !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity-icon {
      display: flex !important;
      flex: 0 0 30px !important;
      width: 30px !important;
      height: 34px !important;
      min-height: 34px !important;
      align-items: center !important;
      justify-content: center !important;
      border: 0 !important;
      background: #f4f4f4 !important;
      color: #4a1d3a !important;
      font-family: Dosis, Roboto, Arial, sans-serif !important;
      font-size: 16px !important;
      line-height: 1 !important;
    }

    body #modal-cart .cart-item-quantity .form-control-container,
    body #modal-cart .cart-item-quantity .form-quantity .col {
      display: flex !important;
      flex: 0 0 32px !important;
      width: 32px !important;
      max-width: 32px !important;
      padding: 0 !important;
      align-items: center !important;
      justify-content: center !important;
    }

    body #modal-cart .cart-item-quantity .form-control,
    body #modal-cart .cart-item-quantity .js-cart-quantity-input {
      display: block !important;
      box-sizing: border-box !important;
      width: 32px !important;
      height: 34px !important;
      min-height: 34px !important;
      margin: 0 !important;
      padding: 0 !important;
      border: 0 !important;
      background: #fff !important;
      color: #111827 !important;
      -webkit-text-fill-color: #111827 !important;
      font-family: Dosis, Roboto, Arial, sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 34px !important;
      text-align: center !important;
      vertical-align: middle !important;
      appearance: textfield !important;
      -moz-appearance: textfield !important;
      transition: none !important;
      animation: none !important;
      opacity: 1 !important;
      visibility: visible !important;
    }

    /* Cenário 013: número não pisca no +/- (disabled/spinner da plataforma) */
    body #modal-cart input.js-cart-quantity-input[disabled],
    body #modal-cart input.js-cart-quantity-input[readonly],
    body #modal-cart input.js-cart-quantity-input:disabled {
      display: block !important;
      opacity: 1 !important;
      visibility: visible !important;
      color: #111827 !important;
      -webkit-text-fill-color: #111827 !important;
      background: #fff !important;
      background-color: #fff !important;
    }
    body #modal-cart .js-cart-input-spinner,
    body #modal-cart .cart-item-spinner {
      display: none !important;
      width: 0 !important;
      height: 0 !important;
      opacity: 0 !important;
      visibility: hidden !important;
      pointer-events: none !important;
    }
    body #modal-cart .cart-item-quantity.opacity-40,
    body #modal-cart .form-quantity.opacity-40,
    body #modal-cart .form-control-container.opacity-40 {
      opacity: 1 !important;
    }

    body #modal-cart .cart-item-delete {
      position: static !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      display: flex !important;
      align-items: center !important;
      justify-content: flex-end !important;
      width: 18px !important;
      height: 28px !important;
      margin: 0 0 0 auto !important;
    }

    body #modal-cart .cart-item-delete .btn {
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      width: 18px !important;
      height: 18px !important;
      margin: 0 !important;
      padding: 0 !important;
      border: 0 !important;
      background: transparent !important;
    }

    body #modal-cart .yamuna-cart-trash-icon {
      display: block !important;
      width: 14px !important;
      height: 16px !important;
    }

    body #modal-cart .yamuna-cart-subscription {
      position: static !important;
      top: auto !important;
      left: auto !important;
      display: inline-flex !important;
      align-items: center !important;
      justify-content: center !important;
      box-sizing: border-box !important;
      width: 138px !important;
      height: 30px !important;
      margin: 0 !important;
      padding: 0 4px !important;
      border: 1px solid #a31460 !important;
      border-radius: 2px !important;
      color: #a31460 !important;
      font-family: 'Inter', sans-serif !important;
      font-size: 10px !important;
      font-weight: 500 !important;
      line-height: 28px !important;
      white-space: nowrap !important;
    }

    body #modal-cart .yamuna-cart-dropdown-footer,
    body #modal-cart .yamuna-cart-empty-footer {
      height: auto !important;
      min-height: 0 !important;
      padding-bottom: 16px !important;
    }

    body #modal-cart .yamuna-cart-checkout,
    body #modal-cart .yamuna-cart-empty-footer .yamuna-cart-checkout {
      position: relative !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      box-sizing: border-box !important;
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      gap: 10px !important;
      width: calc(100% - 24px) !important;
      height: 40px !important;
      min-height: 40px !important;
      margin: 16px 12px 0 !important;
      border: 0 !important;
      border-radius: 999px !important;
      font-family: Raleway, sans-serif !important;
      font-size: 14px !important;
      font-weight: 600 !important;
      letter-spacing: 0.04em !important;
      text-transform: uppercase !important;
    }

    /* Exact Figma geometry (node 286:12876). These rules stay in the cart template so the
       fullscreen-cart defaults from the platform cannot override the drawer. */
    body #modal-cart .modal-header {
      position: relative !important;
      display: flex !important;
      align-items: center !important;
      justify-content: space-between !important;
      flex: 0 0 58px !important;
      height: 58px !important;
      min-height: 58px !important;
      max-height: 58px !important;
      padding: 0 12px !important;
      margin: 0 !important;
      box-sizing: border-box !important;
      border-bottom: 1px solid #d8d0d6 !important;
      background: #fff !important;
      color: #4a1d3a !important;
      font-family: 'Raleway', sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 1 !important;
      text-transform: uppercase !important;
      letter-spacing: 0.02em !important;
      visibility: visible !important;
      opacity: 1 !important;
      z-index: 10 !important;
    }

    body #modal-cart .yamuna-cart-modal-header,
    body #modal-cart .yamuna-cart-header-title,
    body #modal-cart .modal-header::before {
      color: #4a1d3a !important;
      font-family: 'Raleway', sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 1 !important;
      text-transform: uppercase !important;
      letter-spacing: 0.02em !important;
      display: flex !important;
      align-items: center !important;
      margin: 0 !important;
      padding: 0 !important;
    }

    body #modal-cart .modal-header:not(:has(.yamuna-cart-header-title))::before {
      content: 'SACOLA DE COMPRAS' !important;
    }

    /* Ensure Nuvemshop admin bar button does not overlay the close button */
    #store_bar_expand_btn {
      z-index: 1000 !important;
    }

    body #modal-cart .modal-header .modal-close,
    body #modal-cart .yamuna-cart-modal-close {
      position: static !important;
      top: auto !important;
      right: auto !important;
      left: auto !important;
      transform: none !important;
      display: flex !important;
      align-items: center !important;
      justify-content: center !important;
      width: 24px !important;
      height: 24px !important;
      min-width: 24px !important;
      min-height: 24px !important;
      margin: 0 !important;
      padding: 0 !important;
      border: 0 !important;
      border-radius: 50% !important;
      background: #f3eef1 !important;
      cursor: pointer !important;
      z-index: 31010 !important;
      pointer-events: auto !important;
      visibility: visible !important;
      opacity: 1 !important;
      flex-shrink: 0 !important;
    }

    body #modal-cart .modal-header .modal-close svg,
    body #modal-cart .yamuna-cart-modal-close svg {
      display: block !important;
      width: 10px !important;
      height: 10px !important;
      stroke: #4a1d3a !important;
      fill: none !important;
    }

    /* Fluxo do Figma: cabeçalho, linha, banner de desconto e produto */
    body #modal-cart .modal-body {
      position: relative !important;
      display: flex !important;
      flex: 1 1 auto !important;
      min-height: 0 !important;
      padding: 0 !important;
      flex-direction: column !important;
      overflow: hidden !important;
    }

    body #modal-cart .modal-body > .js-nubesdk-slot {
      display: none !important;
    }

    body #modal-cart .modal-body > .yamuna-cart-shipping-promo,
    body #modal-cart .yamuna-cart-shipping-promo {
      position: relative !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      box-sizing: border-box !important;
      display: flex !important;
      flex-direction: column !important;
      justify-content: center !important;
      width: calc(100% - 24px) !important;
      height: 32px !important;
      min-height: 32px !important;
      max-height: 32px !important;
      margin: 12px 12px 8px !important;
      padding: 0 8px 4px !important;
      background: #f7f5f6 !important;
      border-radius: 2px !important;
      overflow: hidden !important;
      flex: 0 0 auto !important;
    }

    body #modal-cart .yamuna-cart-shipping-promo .yamuna-cart-promo-text,
    body #modal-cart .yamuna-cart-shipping-promo > span {
      display: block !important;
      color: #a31460 !important;
      font-family: 'Raleway', sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: 16px !important;
      text-align: center !important;
      text-transform: uppercase !important;
      letter-spacing: 0.04em !important;
      white-space: normal !important;
    }

    body #modal-cart .yamuna-cart-shipping-promo i,
    body #modal-cart .yamuna-cart-shipping-promo .yamuna-cart-promo-bar {
      position: absolute !important;
      right: 0 !important;
      bottom: 0 !important;
      left: 0 !important;
      display: block !important;
      width: 100% !important;
      height: 3px !important;
      background: rgba(192, 187, 195, 0.4) !important;
    }

    body #modal-cart .yamuna-cart-shipping-promo i::before,
    body #modal-cart .yamuna-cart-shipping-promo .yamuna-cart-promo-progress {
      position: absolute !important;
      top: 0 !important;
      bottom: 0 !important;
      left: 0 !important;
      display: block !important;
      height: 3px !important;
      background: #a31460 !important;
      content: '' !important;
    }

    body #modal-cart .yamuna-minicart-scroll {
      width: 100% !important;
      margin: 0 !important;
      padding: 0 !important;
      box-sizing: border-box !important;
      display: flex !important;
      flex: 1 1 auto !important;
      flex-direction: column !important;
      min-height: 200px !important;
      max-height: none !important;
      overflow-x: hidden !important;
      overflow-y: auto !important;
    }

    body #modal-cart .yamuna-minicart-scroll .js-ajax-cart-list {
      width: 100% !important;
      margin: 0 !important;
      padding: 0 12px !important;
      box-sizing: border-box !important;
      display: block !important;
      overflow: visible !important;
      flex: 0 0 auto !important;
    }

    body #modal-cart .modal-body > .cart-row:not(.js-ajax-cart-list):not(.js-empty-ajax-cart) {
      display: none !important;
    }

    /* Never force-show empty cards when AJAX already injected line items
       (that overlay crushed the first product on mobile). */
    body #modal-cart .modal-body > .js-empty-ajax-cart {
      display: none !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .modal-body > .js-empty-ajax-cart,
    body #modal-cart:not(:has(.js-cart-item)) .modal-body > .js-empty-ajax-cart {
      display: block !important;
      position: relative !important;
      top: auto !important;
      right: auto !important;
      bottom: auto !important;
      left: auto !important;
      padding: 12px !important;
    }

    body #modal-cart:has(.js-cart-item) .js-empty-ajax-cart,
    body #modal-cart:has(.js-cart-item) .yamuna-cart-empty-footer {
      display: none !important;
    }

    body #modal-cart:has(.js-cart-item) .yamuna-minicart-scroll {
      display: flex !important;
    }

    body #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer {
      display: flex !important;
      flex: 0 0 auto !important;
      flex-direction: column !important;
      max-height: none !important;
      overflow: visible !important;
    }

    /* Mobile Figma: qty | ASSINAR | trash on one row */
    body #modal-cart .yamuna-minicart-item-controls {
      flex-wrap: nowrap !important;
      justify-content: flex-start !important;
      gap: 8px !important;
    }

    body #modal-cart .yamuna-minicart-item-controls .cart-item-quantity {
      order: 1 !important;
      flex: 0 0 auto !important;
    }

    body #modal-cart .yamuna-minicart-item-controls .yamuna-cart-subscription {
      order: 2 !important;
      flex: 0 0 auto !important;
      width: 138px !important;
      max-width: none !important;
      margin: 0 !important;
    }

    body #modal-cart .yamuna-minicart-item-controls .cart-item-delete {
      order: 3 !important;
      flex: 0 0 auto !important;
      margin: 0 0 0 auto !important;
    }

    /* The storefront can render the cart empty and inject line items by AJAX.
       Reveal the Figma shipping counter as soon as an item is present. */
    body #modal-cart:has(.js-cart-item) .yamuna-cart-shipping-promo {
      display: flex !important;
    }

  }

  /* Platform progressive-discount label → short "5% Off:" (label only).
     Never target .cart-promotion-number — that cell must keep the money value. */
  body #modal-cart .cart-promotion-detail,
  body #modal-cart .cart-promotion-label {
    font-size: 0 !important;
    line-height: 0 !important;
  }

  body #modal-cart .js-total-promotions-detail-row > :first-child:not(.cart-promotion-number):not(.text-right) {
    font-size: 0 !important;
    line-height: 0 !important;
  }

  body #modal-cart .cart-promotion-detail > *:not(.cart-promotion-number),
  body #modal-cart .cart-promotion-label > *:not(.cart-promotion-number) {
    display: none !important;
  }

  body #modal-cart .cart-promotion-detail::before,
  body #modal-cart .cart-promotion-label::before,
  body #modal-cart .js-total-promotions-detail-row > :first-child:not(.cart-promotion-number):not(.text-right)::before {
    content: "5% Off:";
    font-family: Dosis, Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.4 !important;
    color: #000 !important;
  }

  /* Discount value: real money, brand pink — beats :first-child font-size:0 */
  body #modal-cart .cart-promotion-number,
  body #modal-cart .js-total-promotions-detail-row > .cart-promotion-number,
  body #modal-cart .js-total-promotions-detail-row > :first-child.cart-promotion-number {
    font-size: 16px !important;
    line-height: 1.4 !important;
    color: #a31460 !important;
  }

  body #modal-cart .cart-promotion-number::before,
  body #modal-cart .cart-promotion-number::after,
  body #modal-cart .js-total-promotions-detail-row > .cart-promotion-number::before,
  body #modal-cart .js-total-promotions-detail-row > :first-child.cart-promotion-number::before {
    content: none !important;
  }

  /* Cenário 010: CEP — 20px top/bottom; remove paddings/margins empilhados */
  body #modal-cart .js-shipping-calculator-head,
  body #modal-cart .shipping-calculator-head {
    padding: 20px 32px !important;
    margin: 0 !important;
    box-sizing: border-box !important;
  }
  body #modal-cart .js-shipping-calculator-form,
  body #modal-cart .shipping-calculator-form {
    padding: 0 !important;
    margin: 0 !important;
  }
  body #modal-cart .yamuna-minicart-shipping-calc,
  body #modal-cart .shipping-calculator-form .form-group,
  body #modal-cart .shipping-calculator-form .form-group-inline,
  body #modal-cart .shipping-calculator-form .mb-3,
  body #modal-cart .js-shipping-calculator-spinner,
  body #modal-cart .js-shipping-calculator-response {
    margin-top: 0 !important;
    margin-bottom: 0 !important;
  }
  body #modal-cart .js-shipping-calculator-response {
    padding: 0 !important;
  }

  /* Cenário 012: CEP input + BUSCAR — 42px e fonte alinhada à prod */
  body #modal-cart .shipping-calculator-form .js-shipping-input,
  body #modal-cart .shipping-calculator-form input.js-shipping-input,
  body #modal-cart .shipping-calculator-form input.form-control,
  body #modal-cart .shipping-calculator-form input.form-control-inline,
  body #modal-cart .shipping-calculator-form .js-calculate-shipping,
  body #modal-cart .shipping-calculator-form button.js-calculate-shipping {
    box-sizing: border-box !important;
    height: 42px !important;
    min-height: 42px !important;
    max-height: 42px !important;
    margin: 0 !important;
    padding-top: 0 !important;
    padding-bottom: 0 !important;
    line-height: 42px !important;
    font-family: Dosis, Roboto, Arial, sans-serif !important;
    font-size: 16px !important;
  }
  body #modal-cart .shipping-calculator-form .js-shipping-input,
  body #modal-cart .shipping-calculator-form input.form-control {
    padding-left: 16px !important;
    padding-right: 16px !important;
    font-weight: 400 !important;
  }
  body #modal-cart .shipping-calculator-form .js-calculate-shipping {
    padding-left: 18px !important;
    padding-right: 18px !important;
    font-weight: 700 !important;
  }

</style>

{# Production-like minicart body (yamuna.com.br): top 5% OFF bar, free-shipping
   progress, line items, CEP + quotes, Subtotal/Frete/Total, COMPRAR.
   Keep drawer height / navbar alignment from the CSS shell above. #}

{% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
{% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

{# Always show frete-grátis progress bar in minicart (QA 011). Prefer
   platform free-shipping-bar when configured; fallback uses store claim
   "Frete grátis acima de R$350" when Nuvem min_price is missing. #}
{% set yamuna_fs_min_raw = cart.free_shipping.min_price_free_shipping.min_price_raw | default(0) %}
{% set yamuna_fs_has = cart.free_shipping.cart_has_free_shipping %}
{% set yamuna_fs_subtotal = cart.subtotal | default(0) %}
{# Nuvem raw is often in cents; store marketing threshold is R$350. #}
{% if not yamuna_fs_min_raw or yamuna_fs_min_raw == 0 %}
  {% set yamuna_fs_min_raw = 35000 %}
  {% set yamuna_fs_use_fallback_threshold = true %}
{% else %}
  {% set yamuna_fs_use_fallback_threshold = false %}
{% endif %}
{% set yamuna_fs_subtotal_cents = yamuna_fs_subtotal %}
{% if yamuna_fs_use_fallback_threshold and yamuna_fs_subtotal < 1000 %}
  {# subtotal already in reais (e.g. 827.40) → cents #}
  {% set yamuna_fs_subtotal_cents = (yamuna_fs_subtotal * 100) | round %}
{% endif %}
{% set yamuna_fs_pct = ((yamuna_fs_subtotal_cents / yamuna_fs_min_raw) * 100) %}
{% if yamuna_fs_pct > 100 %}{% set yamuna_fs_pct = 100 %}{% endif %}
{% set yamuna_fs_rest_cents = yamuna_fs_min_raw - yamuna_fs_subtotal_cents %}
{% if yamuna_fs_rest_cents < 0 %}{% set yamuna_fs_rest_cents = 0 %}{% endif %}
{% set yamuna_fs_unlocked = yamuna_fs_has or yamuna_fs_rest_cents == 0 %}

{# Top promo — full-width magenta bar directly under header (Figma / prod). #}
<div class="yamuna-cart-top-promo js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
  <img src="{{ 'images/yamuna/cart-discount.svg' | static_url }}" alt="" aria-hidden="true">
  <span>5% OFF ACIMA DE 3 UNIDADES</span>
</div>

{# Frete progress stays under the top promo (never after line items). #}
<div class="yamuna-cart-free-shipping js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
  {% include "snipplets/shipping/shipping-free-rest.tpl" %}
</div>

{# Always in DOM so AJAX qty/add can sync (QA 052). Visibility is owned by
   syncYamunaFreeShippingBar() — show when platform bar is idle. #}
{% if yamuna_fs_unlocked %}
  {% set yamuna_fs_label = 'Frete grátis garantido!' %}
{% else %}
  {% set yamuna_fs_label = 'Faltam ' ~ ((yamuna_fs_rest_cents / 100) | money) ~ ' para garantir seu frete grátis' %}
{% endif %}
<div class="yamuna-cart-shipping-promo js-visible-on-cart-filled js-yamuna-fs-fallback{% if yamuna_fs_unlocked %} is-unlocked{% endif %}{% if cart.items_count > 0 and yamuna_fs_use_fallback_threshold %} is-active{% endif %}" data-fs-min="{{ yamuna_fs_min_raw }}" data-fs-subtotal="{{ yamuna_fs_subtotal_cents }}" style="--yamuna-fs-pct: {{ yamuna_fs_pct }}%;{% if cart.items_count == 0 %}display:none;{% endif %}">
  <span class="yamuna-cart-promo-text js-yamuna-fs-text">{{ yamuna_fs_label }}</span>
  <span class="yamuna-cart-promo-text yamuna-cart-promo-text-onfill js-yamuna-fs-text" aria-hidden="true">{{ yamuna_fs_label }}</span>
  <i class="yamuna-cart-promo-bar" aria-hidden="true"><span class="yamuna-cart-promo-progress js-yamuna-fs-fill" style="width: {{ yamuna_fs_pct }}%;"></span></i>
</div>

<div class="yamuna-minicart-scroll js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
  <div class="js-ajax-cart-list cart-row" style="position:relative; z-index:1;">
      {% if cart.items %}
        {% for item in cart.items %}
          {% include "snipplets/cart-item-ajax.tpl" %}
        {% endfor %}
      {% endif %}
  </div>

  {{ component('nubesdk-slot', { type: "after_line_items" }) }}

  {% if show_cart_fulfillment %}
    <div class="js-fulfillment-info js-allows-non-shippable yamuna-minicart-fulfillment" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>
      <div class="js-visible-on-cart-filled js-has-new-shipping js-shipping-calculator-container">
        <div class="js-shipping-method-unavailable alert alert-warning row m-1" style="display: none;">
          <div class="col-11 text-left"><strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible para este carrito. ' | translate }}</strong></br>
            {{ '¡No te preocupes! Podés elegir otro.' | translate}}</div>
        </div>
        <div id="cart-shipping-container" class="yamuna-minicart-shipping" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
          <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hidden">{{ cart.shipping_data.name }}</span>
          {% if store.has_shipping %}
            {% include "snipplets/shipping/shipping-calculator.tpl" with { 'product_detail': false, 'minicart_shipping': true } %}
          {% endif %}
          {% if store.branches %}
            {% include "snipplets/shipping/branches.tpl" with {'product_detail': false} %}
          {% endif %}
        </div>
      </div>
    </div>
  {% endif %}
</div>

<div class="js-empty-ajax-cart cart-row" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
    <div class="alert alert-info" data-component="cart.empty-message">{{ "El carrito de compras está vacío." | translate }} </div>
    <div class="yamuna-empty-cart-content">
      <p>Sua sacola est&aacute; vazia!</p>
      <strong>{{ 'Comece a explorar:' | translate }}</strong>
      <div class="yamuna-empty-cart-links">
        <a href="{{ '/cremes-de-castanhas' | setting_url }}" class="yamuna-empty-cart-link yamuna-empty-cart-link-super"><span>{{ 'Superalimentos' | translate }}</span></a>
        <a href="{{ '/sabonetes-naturais' | setting_url }}" class="yamuna-empty-cart-link yamuna-empty-cart-link-cosmetics"><span>Cosm&eacute;ticos Naturais</span></a>
      </div>
    </div>
</div>

<div id="error-ajax-stock" style="display: none;">
	<div class="alert alert-warning">
     	{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
    </div>
</div>

<div class="yamuna-cart-dropdown-footer js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
  <div class="yamuna-minicart-totals">
    {{ component('cart-totals', {
      shipping_enabled: show_cart_fulfillment,
      shipping_discount_row_enabled: true,
      payment_discount_price_enabled: false,
      installments_enabled: false,
      totals_divider: false,
      text_classes: {
        subtotal: 'yamuna-minicart-totals-row',
        subtotals_row: 'yamuna-minicart-totals-row',
        subtotals_prices: 'yamuna-minicart-totals-price',
        shipping_costs: 'yamuna-minicart-totals-row',
        shipping_costs_price: 'yamuna-minicart-totals-price',
        shipping_costs_calculating: 'yamuna-minicart-totals-muted',
        shipping_costs_empty: 'yamuna-minicart-totals-muted',
        shipping_discount_row: 'yamuna-minicart-totals-row yamuna-minicart-totals-discount',
        total: 'yamuna-minicart-totals-row yamuna-minicart-totals-total',
        total_price: 'yamuna-minicart-totals-total-price',
      },
    }) }}
  </div>

  <a class="yamuna-cart-checkout" href="{{ store.cart_url }}" data-yamuna-cart-page="1" data-component="cart.checkout-button"><img src="{{ 'images/yamuna/cart-bag.svg' | static_url }}" alt="">{{ 'Comprar' | translate }}</a>
</div>
<script>
  (function () {
    function closeYamunaCartModal() {
      var modal = document.getElementById('modal-cart');
      if (!modal) return;
      modal.classList.remove('modal-show');
      modal.style.removeProperty('display');
      document.body.classList.remove('overflow-none');
      var overlay = document.querySelector('.js-modal-overlay[data-modal-id="#modal-cart"]');
      if (overlay) {
        overlay.style.display = 'none';
      }
      var header = document.querySelector('.head-main .yamuna-header-desktop');
      if (header) header.classList.remove('yamuna-cart-dropdown-open');
    }

    document.addEventListener('click', function (e) {
      var closeBtn = e.target && e.target.closest && e.target.closest('#modal-cart .js-modal-close, #modal-cart .yamuna-cart-modal-close');
      if (!closeBtn) return;
      e.preventDefault();
      e.stopPropagation();
      closeYamunaCartModal();
    }, true);

    document.addEventListener('click', function (e) {
      var link = e.target && e.target.closest && e.target.closest('a.yamuna-cart-checkout[data-yamuna-cart-page]');
      if (!link) return;
      e.preventDefault();
      e.stopImmediatePropagation();
      window.location.href = link.href;
    }, true);

    /* Shorten platform progressive-discount copy in minicart totals (label only). */
    function shortenMinicartPromoLabels() {
      var modal = document.getElementById('modal-cart');
      if (!modal) return;
      var nodes = modal.querySelectorAll(
        '.cart-promotion-detail, .cart-promotion-label, .js-total-promotions-detail-row > :first-child'
      );
      nodes.forEach(function (el) {
        if (el.classList.contains('cart-promotion-number') || el.classList.contains('text-right')) return;
        if (el.querySelector && el.querySelector('.cart-promotion-number')) return;
        var text = (el.textContent || '').replace(/\s+/g, ' ').trim();
        if (!text || /^5%\s*Off:?$/i.test(text)) return;
        if (/R\$\s*[\d.,]+/.test(text)) return;
        if (/%\s*OFF|OFF em|comprando/i.test(text)) {
          el.textContent = '5% Off:';
        }
      });
    }

    /* Cenário 019: show De/Por unit price when qty >= 3 (buy-3 promo). */
    function formatYamunaMoneyFromCents(cents) {
      var reais = (Number(cents) || 0) / 100;
      if (window.LS && typeof LS.formatToCurrency === 'function') {
        return LS.formatToCurrency(reais);
      }
      return 'R$\u00a0' + reais.toFixed(2).replace('.', ',');
    }

    /* Cenário 052 / 047: keep frete-grátis bar in sync with live cart subtotal. */
    function getYamunaCartSubtotalCents() {
      var el = document.querySelector('#modal-cart [data-component="cart.subtotal"][data-priceraw]')
        || document.querySelector('#modal-cart .js-ajax-cart-total[data-priceraw]')
        || document.querySelector('.js-yamuna-fs-subtotal-source[data-priceraw]')
        || document.querySelector('.js-cart-subtotal.hidden[data-priceraw]')
        || document.querySelector('.js-cart-subtotal[data-priceraw]');
      if (!el) return 0;
      var rawAttr = String(el.getAttribute('data-priceraw') || '').trim().replace(/\s/g, '').replace(',', '.');
      var raw = parseFloat(rawAttr);
      if (isNaN(raw) || raw < 0) return 0;
      /* Decimal string => reais. Integer => Nuvem cents (e.g. 1300 = R$13,00). */
      if (rawAttr.indexOf('.') !== -1) {
        return Math.round(raw * 100);
      }
      return Math.round(raw);
    }

    function syncYamunaFreeShippingBar() {
      if (window.LS && typeof LS.freeShippingProgress === 'function') {
        try { LS.freeShippingProgress(true); } catch (err) { /* ignore */ }
      }

      var fallback = document.querySelector('#modal-cart .js-yamuna-fs-fallback');
      if (!fallback) return;

      var cartHasItems = !!document.querySelector('#modal-cart .js-cart-item');
      /* Minicart always uses the Yamuna-synced bar (QA 052/047). Platform
         free-shipping-bar often sticks on an incomplete "condition" state. */
      var platformWrap = document.querySelector('#modal-cart .yamuna-cart-free-shipping');
      if (platformWrap) {
        platformWrap.style.setProperty('display', 'none', 'important');
      }
      fallback.classList.toggle('is-active', cartHasItems);
      if (!cartHasItems) {
        fallback.style.setProperty('display', 'none', 'important');
        return;
      }
      fallback.style.removeProperty('display');

      var min = parseFloat(fallback.getAttribute('data-fs-min') || '35000');
      if (isNaN(min) || min <= 0) min = 35000;
      var subtotal = getYamunaCartSubtotalCents();
      var rest = Math.max(0, min - subtotal);
      var pct = min > 0 ? Math.min(100, Math.max(0, (subtotal / min) * 100)) : 0;
      var unlocked = rest <= 0;

      fallback.setAttribute('data-fs-subtotal', String(subtotal));
      fallback.style.setProperty('--yamuna-fs-pct', pct.toFixed(2) + '%');
      fallback.classList.toggle('is-unlocked', unlocked);

      var label = unlocked
        ? 'Frete grátis garantido!'
        : ('Faltam ' + formatYamunaMoneyFromCents(rest) + ' para garantir seu frete grátis');
      fallback.querySelectorAll('.js-yamuna-fs-text').forEach(function (textEl) {
        if (textEl.textContent !== label) textEl.textContent = label;
      });
      var fillEl = fallback.querySelector('.js-yamuna-fs-fill');
      if (fillEl) {
        fillEl.style.width = pct.toFixed(2) + '%';
      }
    }

    function syncMinicartBuyThreeUnitPrices() {
      var modal = document.getElementById('modal-cart');
      if (!modal) return;
      modal.querySelectorAll('.js-cart-item').forEach(function (itemEl) {
        if (itemEl.getAttribute('data-gift') === 'true') return;
        var wrap = itemEl.querySelector('.cart-item-subtotal');
        if (!wrap) return;
        var promoEl = wrap.querySelector('[data-yamuna-unit-promo]');
        var subtotalEl = wrap.querySelector('.js-cart-item-subtotal');
        if (!promoEl) return;

        var qtyInput = itemEl.querySelector('.js-cart-quantity-input');
        var qty = parseInt(qtyInput && qtyInput.value, 10) || 0;
        var threshold = parseInt(wrap.getAttribute('data-yamuna-promo-threshold'), 10) || 3;
        var unitCents = parseFloat(wrap.getAttribute('data-yamuna-unit-price'));
        var rate = parseFloat(wrap.getAttribute('data-yamuna-promo-rate'));
        if (isNaN(rate)) rate = 0.95;

        if (qty >= threshold && !isNaN(unitCents)) {
          var deEl = promoEl.querySelector('[data-yamuna-unit-de]');
          var porEl = promoEl.querySelector('[data-yamuna-unit-por]');
          var promoCents = Math.floor(unitCents * rate);
          var deText = formatYamunaMoneyFromCents(unitCents);
          var porText = formatYamunaMoneyFromCents(promoCents);
          if (deEl && deEl.textContent !== deText) deEl.textContent = deText;
          if (porEl && porEl.textContent !== porText) porEl.textContent = porText;
          if (promoEl.classList.contains('is-hidden')) promoEl.classList.remove('is-hidden');
          if (subtotalEl && !subtotalEl.classList.contains('is-hidden')) subtotalEl.classList.add('is-hidden');
        } else {
          if (!promoEl.classList.contains('is-hidden')) promoEl.classList.add('is-hidden');
          if (subtotalEl && subtotalEl.classList.contains('is-hidden')) subtotalEl.classList.remove('is-hidden');
        }
      });
    }

    function refreshMinicartPromoUi() {
      shortenMinicartPromoLabels();
      syncMinicartBuyThreeUnitPrices();
      syncYamunaFreeShippingBar();
    }

    refreshMinicartPromoUi();
    var promoObserverRoot = document.getElementById('modal-cart');
    if (promoObserverRoot && window.MutationObserver) {
      var promoTimer = null;
      new MutationObserver(function () {
        if (promoTimer) clearTimeout(promoTimer);
        promoTimer = setTimeout(refreshMinicartPromoUi, 50);
      }).observe(promoObserverRoot, { childList: true, subtree: true, characterData: true, attributes: true, attributeFilter: ['data-priceraw', 'class', 'style'] });
    }

    /* Minicart CEP: always start as input+Buscar (prod), never "already searched". */
    var allowMinicartShippingReset = true;
    var shippingCalcPending = false;
    var suppressShippingErrorsUntil = 0;

    function hideEl(el) {
      if (!el) return;
      el.style.setProperty('display', 'none', 'important');
    }

    function showEl(el, display) {
      if (!el) return;
      el.style.setProperty('display', display || 'block', 'important');
    }

    function hideShippingErrors(modal) {
      var root = modal || document.getElementById('modal-cart');
      if (!root) return;
      root.querySelectorAll('.js-ship-calculator-error').forEach(hideEl);
    }

    function resetMinicartShippingUi(force) {
      if (!force && !allowMinicartShippingReset) return;
      var modal = document.querySelector('#modal-cart');
      var root = document.querySelector('#modal-cart #cart-shipping-container');
      if (!root) return;
      if (modal) modal.classList.remove('yamuna-shipping-searched');
      shippingCalcPending = false;
      var head = root.querySelector('.js-shipping-calculator-head');
      var form = root.querySelector('.js-shipping-calculator-form');
      var zipUi = root.querySelector('.js-shipping-calculator-with-zipcode');
      var resp = root.querySelector('.js-shipping-calculator-response');
      var spinner = root.querySelector('.js-shipping-calculator-spinner');
      if (head) {
        head.classList.add('with-form');
        head.classList.remove('with-zip');
      }
      if (form) form.classList.add('transition-up-active');
      if (zipUi) zipUi.classList.remove('transition-up-active');
      if (resp) {
        resp.innerHTML = '';
        hideEl(resp);
      }
      hideEl(spinner);
      hideShippingErrors(modal);
      clearShippingButtonLoading(root);
    }

    function clearShippingButtonLoading(root) {
      if (!root) return;
      root.querySelectorAll('.js-shipping-calculator-spinner, .js-calculate-shipping .loading').forEach(hideEl);
      root.querySelectorAll('.js-calculate-shipping-wording').forEach(function (element) {
        element.style.removeProperty('display');
      });
      root.querySelectorAll('.js-calculating-shipping-wording').forEach(hideEl);
    }

    function clearCartItemSpinners() {
      document.querySelectorAll('#modal-cart .js-cart-input-spinner, #modal-cart .cart-item-spinner').forEach(hideEl);
    }

    /* Cenário 013: evita "pisca" do número (LS esconde input / mostra spinner / disabled). */
    var lockingMinicartQty = false;
    function lockMinicartQtyVisibility(scope) {
      if (lockingMinicartQty) return;
      lockingMinicartQty = true;
      try {
        var root = scope || document.getElementById('modal-cart');
        if (!root) return;
        root.querySelectorAll('.js-cart-quantity-input').forEach(function (input) {
          input.style.setProperty('display', 'block', 'important');
          input.style.setProperty('opacity', '1', 'important');
          input.style.setProperty('visibility', 'visible', 'important');
          input.style.setProperty('color', '#111827', 'important');
          input.style.setProperty('-webkit-text-fill-color', '#111827', 'important');
          input.style.setProperty('background-color', '#fff', 'important');
          input.style.setProperty('caret-color', '#111827', 'important');
          input.classList.remove('opacity-40', 'opacity-50', 'opacity-60', 'hidden', 'd-none');
        });
        root.querySelectorAll('.cart-item-quantity, .form-quantity, .form-control-container').forEach(function (el) {
          el.classList.remove('opacity-40', 'opacity-50', 'opacity-60');
          el.style.setProperty('opacity', '1', 'important');
        });
        clearCartItemSpinners();
        clearDisabledMinicartControls();
      } finally {
        lockingMinicartQty = false;
      }
    }

    function optimisticMinicartQty(quantityBtn) {
      /* Do NOT mutate the input value here. LS.plusQuantity / LS.minusQuantity
         read the current input and +/- 1; pre-incrementing caused +2/-2 (QA qty bug).
         Only keep the qty visible while the platform toggles spinner/disabled. */
      if (!quantityBtn) return;
      var row = quantityBtn.closest('.js-cart-item');
      lockMinicartQtyVisibility(row || document.getElementById('modal-cart'));
    }

    function clearMinicartLoading(opts) {
      opts = opts || {};
      clearCartItemSpinners();
      if (opts.skipShipping && shippingCalcPending) return;
      var root = document.querySelector('#modal-cart #cart-shipping-container');
      clearShippingButtonLoading(root);
      shippingCalcPending = false;
    }

    function clearDisabledMinicartControls() {
      document.querySelectorAll('#modal-cart .js-cart-quantity-btn[disabled], #modal-cart [data-component="line-item.remove"][disabled]').forEach(function (element) {
        element.removeAttribute('disabled');
      });
    }

    function markEmptyingIfLastItem(cartModal, fromMinus) {
      if (!cartModal) return;
      var items = cartModal.querySelectorAll('.js-cart-item');
      if (items.length !== 1) return;
      if (fromMinus) {
        var input = items[0].querySelector('.js-cart-quantity-input');
        var qty = (input && parseInt(input.value, 10)) || 1;
        if (qty > 1) return;
      }
      cartModal.classList.add('yamuna-cart-is-emptying');
      /* The AJAX cart refresh can replace the modal class attribute. Keep the
         transition state on <body> as well, which is outside that refresh. */
      document.body.classList.add('yamuna-cart-is-emptying');
      suppressShippingErrorsUntil = Date.now() + 4000;
      hideShippingErrors(cartModal);
      shippingCalcPending = false;
      clearShippingButtonLoading(cartModal.querySelector('#cart-shipping-container'));
    }

    function resetEmptyMinicartShippingState() {
      var modal = document.getElementById('modal-cart');
      if (!modal || modal.querySelector('.js-cart-item')) {
        if (modal && modal.querySelector('.js-cart-item')) {
          modal.classList.remove('yamuna-cart-is-emptying');
          document.body.classList.remove('yamuna-cart-is-emptying');
        }
        return;
      }
      allowMinicartShippingReset = true;
      shippingCalcPending = false;
      suppressShippingErrorsUntil = Date.now() + 4000;
      hideShippingErrors(modal);
      resetMinicartShippingUi(true);
      modal.classList.remove('yamuna-cart-is-emptying');
      /* The empty-cart selector keeps shipping UI hidden after this point. */
      document.body.classList.remove('yamuna-cart-is-emptying');
    }

    function settleCartItemLoading() {
      lockMinicartQtyVisibility();
      [0, 16, 50, 100, 200, 500, 1200, 2500].forEach(function (ms) {
        window.setTimeout(lockMinicartQtyVisibility, ms);
      });
    }

    function onShippingCalcSettled() {
      var modal = document.getElementById('modal-cart');
      var root = document.querySelector('#modal-cart #cart-shipping-container');
      if (!root) return;
      var resp = root.querySelector('.js-shipping-calculator-response');
      var hasResponse = resp && resp.innerHTML && resp.innerHTML.trim() && resp.style.display !== 'none';
      var hasError = false;
      root.querySelectorAll('.js-ship-calculator-error').forEach(function (el) {
        if (el.style.display && el.style.display !== 'none') hasError = true;
      });
      if (hasResponse || hasError || !shippingCalcPending) {
        clearShippingButtonLoading(root);
        shippingCalcPending = false;
        window.clearTimeout(window.yamunaMinicartShippingFallback);
      }
      if (Date.now() < suppressShippingErrorsUntil || document.body.classList.contains('yamuna-cart-is-emptying') || (modal && (modal.classList.contains('yamuna-cart-is-emptying') || !modal.querySelector('.js-cart-item')))) {
        hideShippingErrors(modal);
      }
    }

    /* A plataforma substitui o conteúdo do minicart via AJAX. Ao concluir a
       atualização, qualquer indicador de carregamento residual é removido. */
    var minicartModal = document.getElementById('modal-cart');
    if (minicartModal && window.MutationObserver && !window.yamunaMinicartLoadingObserver) {
      window.yamunaMinicartLoadingObserver = new MutationObserver(function () {
        window.clearTimeout(window.yamunaMinicartLoadingTimer);
        window.yamunaMinicartLoadingTimer = window.setTimeout(function () {
          clearMinicartLoading({ skipShipping: true });
          clearDisabledMinicartControls();
          onShippingCalcSettled();
          resetEmptyMinicartShippingState();
        }, 120);
      });
      window.yamunaMinicartLoadingObserver.observe(minicartModal, {
        childList: true,
        subtree: true,
        attributes: true,
        attributeFilter: ['style', 'class', 'disabled']
      });
    }

    resetMinicartShippingUi();
    [0, 150, 400, 900, 1600].forEach(function (ms) {
      window.setTimeout(resetMinicartShippingUi, ms);
    });

    document.addEventListener('click', function (e) {
      if (e.target && e.target.closest && e.target.closest('#modal-cart .js-calculate-shipping')) {
        var modal = document.querySelector('#modal-cart');
        if (modal && (!modal.querySelector('.js-cart-item') || modal.classList.contains('yamuna-cart-is-emptying') || document.body.classList.contains('yamuna-cart-is-emptying'))) {
          e.preventDefault();
          e.stopPropagation();
          hideShippingErrors(modal);
          return;
        }
        allowMinicartShippingReset = false;
        shippingCalcPending = true;
        if (modal) modal.classList.add('yamuna-shipping-searched');
        window.clearTimeout(window.yamunaMinicartShippingFallback);
        window.yamunaMinicartShippingFallback = window.setTimeout(function () {
          clearMinicartLoading();
          shippingCalcPending = false;
        }, 4000);
        return;
      }
      var removeItem = e.target && e.target.closest && e.target.closest('#modal-cart [data-component="line-item.remove"]');
      var quantityAction = e.target && e.target.closest && e.target.closest('#modal-cart .js-cart-quantity-btn');
      if (removeItem || quantityAction) {
        var cartModal = document.getElementById('modal-cart');
        var isMinus = !!(quantityAction && (
          quantityAction.getAttribute('data-component') === 'quantity.minus' ||
          (quantityAction.classList && quantityAction.classList.contains('yamuna-cart-minus')) ||
          (quantityAction.closest && quantityAction.closest('[data-component="quantity.minus"], .yamuna-cart-minus'))
        ));
        if (quantityAction) {
          optimisticMinicartQty(quantityAction);
        }
        if (removeItem) {
          markEmptyingIfLastItem(cartModal, false);
        } else if (isMinus) {
          markEmptyingIfLastItem(cartModal, true);
        }
        /* Do not wipe shipping quotes on qty/remove — that triggers a platform
           CEP recalculation that fails and shows "Erro no cálculo". */
        shippingCalcPending = false;
        hideShippingErrors(cartModal);
        settleCartItemLoading();
        window.clearTimeout(window.yamunaMinicartControlsFallback);
        window.yamunaMinicartControlsFallback = window.setTimeout(clearDisabledMinicartControls, 8000);
        [0, 100, 300, 700, 1500].forEach(function (ms) {
          window.setTimeout(syncYamunaFreeShippingBar, ms);
        });
        return;
      }
      var openCart = e.target && e.target.closest && e.target.closest('[data-toggle="#modal-cart"], [data-modal="#modal-cart"], .js-modal-open[data-toggle="#modal-cart"], a[href="#modal-cart"]');
      if (openCart) {
        allowMinicartShippingReset = true;
        shippingCalcPending = false;
        window.setTimeout(resetMinicartShippingUi, 0);
        window.setTimeout(resetMinicartShippingUi, 200);
        window.setTimeout(resetMinicartShippingUi, 600);
      }
    }, true);
  })();
</script>

<div class="yamuna-cart-empty-footer" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
  <button class="yamuna-cart-checkout" type="button" disabled><img src="{{ 'images/yamuna/cart-bag.svg' | static_url }}" alt="">{{ 'Comprar' | translate }}</button>
</div>
