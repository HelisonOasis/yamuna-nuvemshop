{{ component('nubesdk-slot', { type: "before_line_items" }) }}

<style>
  #modal-cart .yamuna-cart-discount {
    font-family: 'Dosis', sans-serif !important;
  }

  /* O drawer mobile abaixo segue o frame de 320px do Figma em style-async.scss.tpl.
     Estas regras complementam somente a apresentação desktop. */
  @media (min-width: 1024px) {
    body #modal-cart.modal {
      position: fixed !important;
      /* O drawer inicia após a cápsula de navegação; antes ele ficava
         escondido sob o header e encobria título, fechar e recomendações. */
      top: calc(var(--yamuna-header-top, 25px) + 80px) !important;
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
      z-index: 29000 !important;
      background: #fff !important;
    }

    body #modal-cart.modal.modal-show {
      right: var(--yamuna-header-right, max(24px, calc((100vw - 1320px) / 2))) !important;
      top: calc(var(--yamuna-header-top, 25px) + 80px) !important;
      opacity: 1 !important;
    }

    body #modal-cart .modal-header {
      box-sizing: border-box !important;
      flex: 0 0 57px !important;
      height: 57px !important;
      margin: 0 !important;
      padding: 19px 42px 0 20px !important;
      border-bottom: 1px solid #d8d0d6 !important;
      background: #fff !important;
      color: #4a1d3a !important;
      font-family: Roboto, Arial, sans-serif !important;
      font-size: 16px !important;
      font-weight: 700 !important;
      line-height: normal !important;
      text-transform: uppercase !important;
    }

    body #modal-cart .modal-header .modal-close {
      top: 19px !important;
      right: 20px !important;
      left: auto !important;
      display: flex !important;
      width: 24px !important;
      height: 24px !important;
      align-items: center !important;
      justify-content: center !important;
      border: 0 !important;
      border-radius: 50% !important;
      background: #f2edf0 !important;
      color: #4a1d3a !important;
    }

    body #modal-cart .js-ajax-cart-list {
      /* Reserva o espaço do aviso de CEP sem encobrir o primeiro produto. */
      padding: 53px 20px 0 !important;
    }

    body #modal-cart .yamuna-cart-shipping-promo {
      /* O aviso começa 16px após o cabeçalho de 57px. */
      position: absolute !important;
      top: 73px !important;
      right: 20px !important;
      left: 20px !important;
      box-sizing: border-box !important;
      height: 24px !important;
      padding: 2px 4px 0 !important;
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
    body #modal-cart.yamuna-cart-is-empty .modal-header {
      display: block !important;
      flex: 0 0 80px !important;
      height: 80px !important;
      padding: 26px 62px 0 24px !important;
      border-bottom: 1px solid #c0bbc3 !important;
      color: #4a1d3a !important;
      font-family: 'Raleway', sans-serif !important;
      font-size: 16px !important;
      font-weight: 600 !important;
      line-height: 20px !important;
    }

    body #modal-cart.yamuna-cart-is-empty .modal-header .modal-close {
      top: 23px !important;
      right: 24px !important;
      display: block !important;
      width: 24px !important;
      height: 24px !important;
      border-radius: 50% !important;
      background: #f2edf0 url('{{ 'images/yamuna/cart-close.svg' | static_url }}') center / 18px 18px no-repeat !important;
    }

    body #modal-cart.yamuna-cart-is-empty .modal-header .modal-close svg {
      display: none !important;
    }

    body #modal-cart.yamuna-cart-is-empty .js-ajax-cart-list,
    body #modal-cart.yamuna-cart-is-empty .yamuna-cart-shipping-promo,
    body #modal-cart.yamuna-cart-is-empty .js-visible-on-cart-filled,
    body #modal-cart.yamuna-cart-is-empty .yamuna-cart-dropdown-footer,
    body #modal-cart.yamuna-cart-is-empty .cart-item-delete,
    body #modal-cart.yamuna-cart-is-empty .yamuna-cart-trash-icon {
      display: none !important;
    }

    body #modal-cart.yamuna-cart-is-empty .js-empty-ajax-cart {
      position: absolute !important;
      top: 34px !important;
      right: 40px !important;
      bottom: 120px !important;
      left: 40px !important;
      display: block !important;
    }

    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-content {
      position: static !important;
      display: block !important;
      color: #4a1d3a !important;
      text-align: center !important;
    }

    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-content > p,
    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-content > strong {
      display: block !important;
      font-family: 'Dosis', sans-serif !important;
    }

    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-content > p {
      margin: 0 0 2px !important;
      font-size: 18px !important;
      font-weight: 500 !important;
    }

    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-content > strong {
      margin: 0 0 28px !important;
      font-size: 18px !important;
      font-weight: 700 !important;
    }

    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-links {
      display: grid !important;
      gap: 28px !important;
    }

    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-link {
      position: relative !important;
      display: flex !important;
      height: 76px !important;
      align-items: flex-end !important;
      overflow: hidden !important;
      border-radius: 5px !important;
    }

    body #modal-cart.yamuna-cart-is-empty .yamuna-empty-cart-link span {
      height: 30px !important;
      padding: 4px 16px 0 !important;
      border-radius: 0 6px 0 0 !important;
      font-family: 'Dosis', sans-serif !important;
      font-size: 16px !important;
      line-height: 22px !important;
    }

    /* O estado preenchido é determinado pelo item que a própria plataforma
       mantém no DOM. Isso impede que o rodapé vazio persista após o AJAX. */
    body #modal-cart:has(.js-cart-item) .js-empty-ajax-cart,
    body #modal-cart:has(.js-cart-item) .yamuna-cart-empty-footer {
      display: none !important;
    }

    body #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer,
    body #modal-cart:has(.js-cart-item) .yamuna-cart-shipping-promo {
      display: block !important;
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
      width: calc(100% - 44px) !important;
      margin: 16px 22px 0 !important;
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
      width: 88px !important;
      height: 32px !important;
      margin: 0 !important;
      padding: 0 !important;
      align-items: center !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity {
      overflow: hidden !important;
      border: 0 !important;
      border-radius: 4px !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity-icon,
    body #modal-cart .cart-item-quantity .form-control {
      box-sizing: border-box !important;
      height: 32px !important;
      min-height: 32px !important;
      margin: 0 !important;
      border-radius: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity-icon {
      display: flex !important;
      flex: 0 0 25.5px !important;
      width: 25.5px !important;
      padding: 0 !important;
      align-items: center !important;
      justify-content: center !important;
      border: 1px solid #c0bbc3 !important;
      background: rgba(192, 187, 195, 0.28) !important;
      color: #9e929e !important;
      font-family: 'Inter', sans-serif !important;
      font-size: 18px !important;
      line-height: 30px !important;
    }

    body #modal-cart .cart-item-quantity .yamuna-cart-minus {
      border-radius: 4px 0 0 4px !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity-icon:last-child {
      border-radius: 0 4px 4px 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity .col {
      flex: 0 0 37px !important;
      width: 37px !important;
      max-width: 37px !important;
      padding: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-control {
      display: block !important;
      width: 37px !important;
      padding: 0 !important;
      border-top: 1px solid #c0bbc3 !important;
      border-right: 0 !important;
      border-bottom: 1px solid #c0bbc3 !important;
      border-left: 0 !important;
      background: #fff !important;
      color: #393747 !important;
      font-family: 'Inter', sans-serif !important;
      font-size: 18px !important;
      font-weight: 400 !important;
      line-height: 30px !important;
      text-align: center !important;
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

    /* Figma: breathing room under COMPRAR CTA - keep button in normal flow */
    body #modal-cart .yamuna-cart-dropdown-footer {
      padding-bottom: 28px !important;
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
      z-index: 31000 !important;
    }

    body .js-modal-overlay[data-modal-id="#modal-cart"] {
      z-index: 30000 !important;
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
      width: 81px !important;
      height: 30px !important;
      margin: 0 !important;
      padding: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-quantity-icon {
      flex: 0 0 23px !important;
      width: 23px !important;
      height: 30px !important;
    }

    body #modal-cart .cart-item-quantity .form-control-container {
      flex: 0 0 35px !important;
      width: 35px !important;
      max-width: 35px !important;
      padding: 0 !important;
    }

    body #modal-cart .cart-item-quantity .form-control {
      width: 35px !important;
      height: 30px !important;
      min-height: 30px !important;
      padding: 0 !important;
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
      height: 120px !important;
    }

    body #modal-cart .yamuna-cart-checkout {
      bottom: 23px !important;
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
      overflow-x: hidden !important;
      overflow-y: auto !important;
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
      height: 28px !important;
      min-height: 28px !important;
      margin: 16px 12px 14px 12px !important;
      padding: 0 8px 4px 8px !important;
      background: #f7f5f6 !important;
      border-radius: 2px !important;
      overflow: hidden !important;
    }

    body #modal-cart .yamuna-cart-shipping-promo .yamuna-cart-promo-text,
    body #modal-cart .yamuna-cart-shipping-promo > span {
      display: block !important;
      color: #a31460 !important;
      font-family: 'Raleway', sans-serif !important;
      font-size: 11px !important;
      font-weight: 700 !important;
      line-height: 16px !important;
      text-align: center !important;
      text-transform: uppercase !important;
      letter-spacing: 0.04em !important;
      white-space: nowrap !important;
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

    body #modal-cart .modal-body > .js-ajax-cart-list {
      width: 100% !important;
      margin: 0 !important;
      padding: 0 12px !important;
      box-sizing: border-box !important;
    }

    body #modal-cart .modal-body > .cart-row:not(.js-ajax-cart-list):not(.js-empty-ajax-cart) {
      display: none !important;
    }

    body #modal-cart .modal-body > .js-ajax-cart-list {
      display: block !important;
    }

    /* Never force-show empty cards when AJAX already injected line items
       (that overlay crushed the first product on mobile). */
    body #modal-cart .modal-body > .js-empty-ajax-cart {
      display: none !important;
    }

    body #modal-cart:not(:has(.js-cart-item)) .modal-body > .js-empty-ajax-cart,
    body #modal-cart.yamuna-cart-is-empty .modal-body > .js-empty-ajax-cart {
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

    body #modal-cart:has(.js-cart-item) .yamuna-cart-dropdown-footer {
      display: block !important;
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

</style>

{# Progress / Promo Banner from Figma #}
{% set cart_qty = cart.items_count %}
{% set promo_text = 'FALTAM 2 PRODUTOS PARA GARANTIR 5% OFF' %}
{% set promo_progress = '33%' %}
{% if cart_qty == 1 %}
  {% set promo_text = 'FALTAM 2 PRODUTOS PARA GARANTIR 5% OFF' %}
  {% set promo_progress = '33%' %}
{% elseif cart_qty == 2 %}
  {% set promo_text = 'FALTA 1 PRODUTO PARA GARANTIR 5% OFF' %}
  {% set promo_progress = '66%' %}
{% elseif cart_qty >= 3 %}
  {% set promo_text = 'VOCÊ GARANTIU 15% OFF!' %}
  {% set promo_progress = '100%' %}
{% endif %}

<div class="yamuna-cart-shipping-promo js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
  <span class="yamuna-cart-promo-text">{{ promo_text }}</span>
  <i class="yamuna-cart-promo-bar" aria-hidden="true"><b class="yamuna-cart-promo-progress" style="width: {{ promo_progress }};"></b></i>
</div>

<div class="js-ajax-cart-list cart-row" style="position:relative; z-index:1; padding:0 12px;">
    {# Cart panel items #}
    {% if cart.items %}
      {% for item in cart.items %}
        {% include "snipplets/cart-item-ajax.tpl" %}
      {% endfor %}
    {% endif %}
</div>

{{ component('nubesdk-slot', { type: "after_line_items" }) }}

<div class="js-empty-ajax-cart cart-row" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
 	{# Cart panel empty #}
    <div class="alert alert-info" data-component="cart.empty-message">{{ "El carrito de compras está vacío." | translate }} </div>
    <div class="yamuna-empty-cart-content">
      <p>Sua sacola est&aacute; vazia!</p>
      <strong>{{ 'Comece a explorar:' | translate }}</strong>
      <div class="yamuna-empty-cart-links">
        <a href="{{ store.products_url }}" class="yamuna-empty-cart-link yamuna-empty-cart-link-super"><span>{{ 'Superalimentos' | translate }}</span></a>
        <a href="{{ store.products_url }}" class="yamuna-empty-cart-link yamuna-empty-cart-link-cosmetics"><span>Cosm&eacute;ticos Naturais</span></a>
      </div>
    </div>
</div>
<div id="error-ajax-stock" style="display: none;">
	<div class="alert alert-warning">
     	{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
    </div>
</div>

<div class="yamuna-cart-dropdown-footer js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
  <div class="yamuna-cart-discount">15% OFF ACIMA DE 3 UNIDADES</div>
  <p>{{ 'Digite seu cep para consultar as opções de entrega' | translate }}</p>
  <a class="yamuna-cart-checkout" href="{{ store.cart_url }}" data-yamuna-cart-page="1" data-component="cart.checkout-button"><img src="{{ 'images/yamuna/cart-bag.svg' | static_url }}" alt="">{{ 'Comprar' | translate }}</a>
</div>
<script>
  (function () {
    document.addEventListener('click', function (e) {
      var link = e.target && e.target.closest && e.target.closest('a.yamuna-cart-checkout[data-yamuna-cart-page]');
      if (!link) return;
      e.preventDefault();
      e.stopImmediatePropagation();
      {# Force a top-level GET — POST to /comprar/ without go_to_checkout returns an empty 200. #}
      window.location.href = link.href;
    }, true);
  })();
</script>

<div class="yamuna-cart-empty-footer" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
  <div class="yamuna-cart-discount">15% OFF ACIMA DE 3 UNIDADES</div>
  <button class="yamuna-cart-checkout" type="button" disabled><img src="{{ 'images/yamuna/cart-bag.svg' | static_url }}" alt="">{{ 'Comprar' | translate }}</button>
</div>
