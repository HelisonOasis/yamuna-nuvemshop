/**
 * Yamuna checkout QA fixes.
 * Loaded only on /checkout/ via yamuna-checkout-fix-loader.js
 *
 * 018 — Carrinho step → /comprar/
 * 021 — product name clamp + validation focus UX
 * 082 — auto-open native coupon form (input + APLICAR desde o load)
 */
(function () {
  if (!/\/checkout\//i.test(location.pathname)) return;
  if (window.__yamuna082open) return;
  window.__yamuna082open = 1;

  var PLACEHOLDER = 'Adicionar cupom';
  /* Espaço não-vazio: mantém :placeholder-shown=true quando input vazio (overlay CSS) */
  var PH_ATTR = ' ';

  function wirePlaceholder(input) {
    if (!input) return;
    function restore() {
      if (!(input.value || '').trim()) {
        input.value = '';
        input.setAttribute('placeholder', PH_ATTR);
        input.placeholder = PH_ATTR;
      }
    }
    restore();
    if (input.getAttribute('data-yamuna-ph') === '1') return;
    input.setAttribute('data-yamuna-ph', '1');
    input.addEventListener('focus', function () {
      input.setAttribute('placeholder', PH_ATTR);
      input.placeholder = PH_ATTR;
    });
    input.addEventListener('blur', restore);
    input.addEventListener('input', function () {
      if (!(input.value || '').trim()) restore();
    });
  }

  function openCouponForm() {
    try {
      var root = document.querySelector('#secondary-column .summary-coupon:not(.d-md-none)');
      if (!root) return false;
      var input = root.querySelector('input#coupon, input[name="coupon"]');
      if (input) {
        wirePlaceholder(input);
        return true;
      }
      if (root.querySelector('#removeCoupon')) return true;
      var link =
        root.querySelector('.box-discount-coupon-applied .btn-link') ||
        root.querySelector('.box-discount-coupon-applied [role="button"]');
      if (!link) return false;
      link.click();
      setTimeout(function () {
        var again = root.querySelector('input#coupon, input[name="coupon"]');
        if (again) wirePlaceholder(again);
      }, 350);
      return true;
    } catch (e) {
      return false;
    }
  }

  var tries = 0;
  function tick() {
    tries++;
    openCouponForm();
    if (tries > 40) return;
    setTimeout(tick, 250);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', tick);
  } else {
    tick();
  }
  window.addEventListener('load', tick);
  setTimeout(tick, 800);
  setTimeout(tick, 2000);

  if (window.MutationObserver) {
    var t = null;
    new MutationObserver(function () {
      clearTimeout(t);
      t = setTimeout(function () {
        var input = document.querySelector(
          '#secondary-column .summary-coupon input#coupon, #secondary-column .summary-coupon input[name="coupon"]'
        );
        if (input) wirePlaceholder(input);
      }, 200);
    }).observe(document.documentElement, { childList: true, subtree: true });
  }
})();

(function () {
  if (!/\/checkout\//i.test(location.pathname)) return;

  var MOBILE_MAX = 1024;
  var focusTimer = null;
  var CART_URL = location.origin.replace(/\/$/, '') + '/comprar/';

  /* ——— product name 2-line clamp ——— */
  function wrapProductNames(root) {
    var scope = root || document;
    var cells = scope.querySelectorAll(
      '.table-product-name, td.table-product-name, [data-testid="product-name-qty"]'
    );
    for (var i = 0; i < cells.length; i++) {
      var td = cells[i];
      if (td.querySelector('.yamuna-name-clamp')) continue;
      var clamp = document.createElement('span');
      clamp.className = 'yamuna-name-clamp';
      while (td.firstChild) clamp.appendChild(td.firstChild);
      td.appendChild(clamp);
    }
  }

  /* ——— 039: remove white JPG bg from summary thumbs ——— */
  var WHITE_THRESH = 245;

  function clearBg(el) {
    if (!el || !el.style) return;
    el.style.setProperty('background', 'transparent', 'important');
    el.style.setProperty('background-color', 'transparent', 'important');
    el.style.setProperty('box-shadow', 'none', 'important');
  }

  function punchWhitePixels(img) {
    try {
      var w = img.naturalWidth;
      var h = img.naturalHeight;
      if (!w || !h) return false;
      var canvas = document.createElement('canvas');
      canvas.width = w;
      canvas.height = h;
      var ctx = canvas.getContext('2d');
      if (!ctx) return false;
      ctx.drawImage(img, 0, 0);
      var imageData = ctx.getImageData(0, 0, w, h);
      var px = imageData.data;
      for (var i = 0; i < px.length; i += 4) {
        if (px[i] >= WHITE_THRESH && px[i + 1] >= WHITE_THRESH && px[i + 2] >= WHITE_THRESH) {
          px[i + 3] = 0;
        }
      }
      ctx.putImageData(imageData, 0, 0);
      img.src = canvas.toDataURL('image/png');
      img.style.setProperty('mix-blend-mode', 'normal', 'important');
      return true;
    } catch (e) {
      return false;
    }
  }

  function processSummaryThumb(img) {
    if (!img || img.getAttribute('data-yamuna-039') === '1') return;
    clearBg(img);
    img.style.setProperty('mix-blend-mode', 'darken', 'important');

    function finishBlendOnly() {
      img.setAttribute('data-yamuna-039', '1');
      img.style.setProperty('mix-blend-mode', 'darken', 'important');
    }

    function tryPunch() {
      if (punchWhitePixels(img)) {
        img.setAttribute('data-yamuna-039', '1');
      } else {
        finishBlendOnly();
      }
    }

    if (img.getAttribute('data-yamuna-039-cors') !== '1') {
      img.setAttribute('data-yamuna-039-cors', '1');
      var src = img.getAttribute('src') || img.src;
      if (src && src.indexOf('data:') !== 0) {
        img.crossOrigin = 'anonymous';
        img.addEventListener(
          'load',
          function onCorsLoad() {
            img.removeEventListener('load', onCorsLoad);
            tryPunch();
          },
          { once: true }
        );
        img.addEventListener(
          'error',
          function onCorsErr() {
            img.removeEventListener('error', onCorsErr);
            try {
              img.removeAttribute('crossorigin');
              img.crossOrigin = null;
            } catch (e) {}
            img.src = src;
            finishBlendOnly();
          },
          { once: true }
        );
        img.src = src;
        return;
      }
    }

    if (img.complete && img.naturalWidth) {
      tryPunch();
    } else {
      img.addEventListener(
        'load',
        function () {
          tryPunch();
        },
        { once: true }
      );
      finishBlendOnly();
    }
  }

  function removeSummaryThumbWhiteBg(root) {
    var scope = root || document;
    var wraps = scope.querySelectorAll('.summary-img-wrap, td.summary-img-wrap');
    for (var i = 0; i < wraps.length; i++) {
      var wrap = wraps[i];
      clearBg(wrap);
      var inner = wrap.querySelectorAll('.summary-img, .summary-img-thumb');
      for (var j = 0; j < inner.length; j++) clearBg(inner[j]);
      var imgs = wrap.querySelectorAll('img');
      for (var k = 0; k < imgs.length; k++) processSummaryThumb(imgs[k]);
    }
    /* also catch thumbs outside wrap */
    var loose = scope.querySelectorAll(
      '.summary-img-thumb img, .summary-img img, .summary .summary-img-thumb img'
    );
    for (var n = 0; n < loose.length; n++) processSummaryThumb(loose[n]);
  }

  /* ——— 018: enable Carrinho breadcrumb → /comprar/ ——— */
  function goToCart(e) {
    if (e) {
      e.preventDefault();
      e.stopPropagation();
      if (e.stopImmediatePropagation) e.stopImmediatePropagation();
    }
    window.location.assign(CART_URL);
  }

  function bindCartNav(node) {
    if (!node || node.getAttribute('data-yamuna-cart-nav') === '1') return;
    node.setAttribute('data-yamuna-cart-nav', '1');
    node.addEventListener('click', goToCart, true);
    node.addEventListener('auxclick', goToCart, true);
  }

  function firstTimelineStep(ul) {
    if (!ul) return null;
    var kids = ul.children;
    for (var i = 0; i < kids.length; i++) {
      var li = kids[i];
      if (li.tagName === 'LI' && !li.classList.contains('breadcrumb-timeline-line')) {
        return li;
      }
    }
    return null;
  }

  function enableCarrinhoStep() {
    var ul = document.querySelector('#breadcrumb ul.breadcrumb-timeline');
    var li = firstTimelineStep(ul);
    if (!li) return;

    var el = li.querySelector('a.breadcrumb-timeline-item, button.breadcrumb-timeline-item');
    if (!el) return;

    var text = ((el.textContent || '') + '').replace(/\s+/g, ' ').trim().toLowerCase();
    if (text && text.indexOf('carrinho') === -1) return;

    if (el.tagName === 'A') {
      if (el.getAttribute('href') !== CART_URL) el.setAttribute('href', CART_URL);
      el.classList.remove('disabled');
      el.removeAttribute('aria-disabled');
      el.removeAttribute('tabindex');
      el.classList.add('yamuna-breadcrumb-carrinho');
      el.style.pointerEvents = 'auto';
      el.style.cursor = 'pointer';
      bindCartNav(el);
      bindCartNav(li);
      return;
    }

    var a = document.createElement('a');
    a.className = String(el.className || 'breadcrumb-timeline-item')
      .replace(/\bdisabled\b/g, '')
      .replace(/\s+/g, ' ')
      .trim();
    if (a.className.indexOf('yamuna-breadcrumb-carrinho') === -1) {
      a.className += (a.className ? ' ' : '') + 'yamuna-breadcrumb-carrinho';
    }
    a.setAttribute('href', CART_URL);
    a.setAttribute('aria-label', 'Carrinho');
    a.style.cursor = 'pointer';
    a.style.pointerEvents = 'auto';
    a.style.textDecoration = 'none';
    a.style.color = 'inherit';
    while (el.firstChild) a.appendChild(el.firstChild);
    el.parentNode.replaceChild(a, el);
    bindCartNav(a);
    bindCartNav(li);
  }

  /* 018c — body step class for progress colors */
  function markCheckoutStep() {
    var path = location.pathname || '';
    var body = document.body;
    if (!body) return;
    body.classList.remove('yamuna-step-entrega', 'yamuna-step-pagamento');
    if (
      /\/checkout\/v3\/next\//i.test(path) ||
      /\/payment/i.test(path) ||
      /\/checkout\/v3\/success\//i.test(path) ||
      /\/success/i.test(path) ||
      document.querySelector('.status-content, .status.panel, .success-order-id, [test-id="order-id"]')
    ) {
      body.classList.add('yamuna-step-pagamento');
    } else if (/\/checkout\//i.test(path)) {
      body.classList.add('yamuna-step-entrega');
    }
  }

  /* Cenário 078: Na tela de pedido concluído, o progresso deve ser Pagamento */
  function fixNubeStepsOnSuccess() {
    var path = location.pathname || '';
    var isSuccess =
      /\/checkout\/v3\/success\//i.test(path) ||
      /\/success/i.test(path) ||
      document.querySelector('.status-content, .status.panel, .success-order-id, [test-id="order-id"]');
    if (!isSuccess) return;

    var container = document.querySelector('#nube-sdk-slot-after_header > .nube-box');
    if (!container) return;

    var kids = container.children;
    if (kids.length < 5) return;

    // Coluna 3 (Entrega) -> concluída (fundo branco, borda #a31460, ícone step-truck.svg)
    var entregaCol = kids[2];
    if (entregaCol) {
      var c3 = entregaCol.firstElementChild;
      if (c3) {
        c3.style.setProperty('background', '#ffffff', 'important');
        c3.style.setProperty('border-color', '#a31460', 'important');
        var img3 = c3.querySelector('img');
        if (img3 && img3.src.indexOf('truck-white') !== -1) {
          img3.src = img3.src.replace('truck-white', 'truck');
        }
      }
      var t3 = entregaCol.querySelector('.nube-text, [class*="nube-text"]');
      if (t3) t3.style.setProperty('color', '#a31460', 'important');
    }

    // Linha 2 (entre Entrega e Pagamento) -> vira #a31460
    var line2 = kids[3];
    if (line2) {
      line2.style.setProperty('background', '#a31460', 'important');
      line2.style.setProperty('background-color', '#a31460', 'important');
    }

    // Coluna 5 (Pagamento) -> vira ativa/current (círculo preenchido #a31460, ícone branco, texto #a31460)
    var pagCol = kids[4];
    if (pagCol) {
      var c5 = pagCol.firstElementChild;
      if (c5) {
        c5.style.setProperty('background', '#a31460', 'important');
        c5.style.setProperty('border-color', '#a31460', 'important');
        var img5 = c5.querySelector('img');
        if (img5) {
          if (img5.src.indexOf('card-muted') !== -1) {
            img5.src = img5.src.replace('card-muted', 'card-white');
          } else if (img5.src.indexOf('card.svg') !== -1) {
            img5.src = img5.src.replace('card.svg', 'card-white.svg');
          }
        }
      }
      var t5 = pagCol.querySelector('.nube-text, [class*="nube-text"]');
      if (t5) t5.style.setProperty('color', '#a31460', 'important');
    }
  }

  /* ——— Finish CTA label: match cart step 1 ("Finalizar compra") ——— */
  var FINISH_LABEL = 'Finalizar compra';

  function looksLikeFazerPedido(text) {
    var t = ((text || '') + '').replace(/\s+/g, ' ').trim().toLowerCase();
    return t === 'fazer pedido' || /fazer\s+pedido/.test(t);
  }

  function setFinishLabel(node) {
    if (!node) return;
    var current = ((node.textContent || '') + '').replace(/\s+/g, ' ').trim();
    if (!looksLikeFazerPedido(current)) return;
    if (node.childNodes.length === 1 && node.firstChild && node.firstChild.nodeType === 3) {
      node.textContent = FINISH_LABEL;
      return;
    }
    var span =
      (node.id === 'btn-text' && node) ||
      node.querySelector('#btn-text, span.btn-text, .btn-text, .text-pre-line, span');
    if (span && span !== node) {
      span.textContent = FINISH_LABEL;
      return;
    }
    node.textContent = FINISH_LABEL;
  }

  function normalizeFinishButtonLabel() {
    var label = FINISH_LABEL;
    var finish = document.getElementById('btnFinishCheckout');
    if (finish) {
      var spans = finish.querySelectorAll('span, #btn-text, .btn-text, .text-pre-line');
      if (spans.length) {
        for (var i = 0; i < spans.length; i++) {
          var t = ((spans[i].textContent || '') + '').replace(/\s+/g, ' ').trim().toLowerCase();
          if (!t || looksLikeFazerPedido(t) || t !== label.toLowerCase()) {
            if (looksLikeFazerPedido(t) || t === 'fazer pedido') spans[i].textContent = label;
          }
        }
      } else if (looksLikeFazerPedido(finish.textContent)) {
        finish.textContent = label;
      }
    }
    var btnText = document.getElementById('btn-text');
    if (btnText && looksLikeFazerPedido(btnText.textContent)) btnText.textContent = label;

    var nodes = document.querySelectorAll(
      '.btn-submit-step span, button.btn-primary.btn-submit-step span'
    );
    for (var j = 0; j < nodes.length; j++) setFinishLabel(nodes[j]);
  }

  /* ——— 021: validation focus UX + CEP empty message ——— */
  var EMPTY_FIELD_MSG = 'Este campo deve ser preenchido';

  function isVisible(el) {
    if (!el) return false;
    if (el.disabled) return false;
    var cs = window.getComputedStyle(el);
    if (cs.display === 'none' || cs.visibility === 'hidden' || cs.opacity === '0') return false;
    return el.offsetWidth > 0 || el.offsetHeight > 0 || el.getClientRects().length > 0;
  }

  /* Dual CTA: Continuar comprando → /comprar + primary checkout button */
  function findPrimaryCheckoutCta() {
    var finish = document.getElementById('btnFinishCheckout');
    if (finish && finish.parentNode && isVisible(finish)) return finish;

    var selectors = [
      '#main-column #btn-submit-step',
      '#main-column .btn-submit-step.btn-primary',
      '#main-column button.btn-primary.btn-submit-step',
      '#main-column form button.btn-primary[type="submit"]',
      '#main-column button.btn-primary',
      '#main-column .btn.btn-primary',
      'button.btn-submit-step.btn-primary',
      'button#btn-submit-step',
      '.btn-submit-step'
    ];
    for (var s = 0; s < selectors.length; s++) {
      var nodes = document.querySelectorAll(selectors[s]);
      for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].parentNode && isVisible(nodes[i])) return nodes[i];
      }
    }
    return null;
  }

  function ensureContinueShoppingCta() {
    var primary = findPrimaryCheckoutCta();
    if (!primary || !primary.parentNode) return;

    var row = document.getElementById('yamuna-checkout-cta-row');
    if (!row) {
      row = document.createElement('div');
      row.id = 'yamuna-checkout-cta-row';
      row.className = 'yamuna-checkout-cta-row';
      primary.parentNode.insertBefore(row, primary);
    }
    if (primary.parentNode !== row) row.appendChild(primary);

    var link = document.getElementById('yamuna-continue-shopping');
    if (!link) {
      link = document.createElement('a');
      link.id = 'yamuna-continue-shopping';
      link.className = 'yamuna-continue-shopping';
      link.href = CART_URL;
      link.textContent = 'Continuar comprando';
      row.insertBefore(link, primary);
    } else {
      link.href = CART_URL;
      link.textContent = 'Continuar comprando';
      if (link.parentNode !== row) row.insertBefore(link, primary);
      if (primary.parentNode !== row) row.appendChild(primary);
      else if (link.nextSibling !== primary) row.insertBefore(link, primary);
    }

    if (primary.id === 'btnFinishCheckout') {
      row.classList.add('yamuna-checkout-cta-row--finish');
    } else {
      row.classList.remove('yamuna-checkout-cta-row--finish');
    }
  }

  function isEmptyValue(el) {
    var v = (el.value || '').replace(/\s/g, '');
    return v.length === 0;
  }

  function getZipInput() {
    return document.querySelector(
      '#shipping-section input, ' +
      '.shipping-calculator input, ' +
      'input[name*="zip" i], ' +
      'input[name*="cep" i], ' +
      'input[id*="zip" i], ' +
      'input[id*="cep" i], ' +
      'input[data-testid*="zip" i], ' +
      'input[placeholder*="CEP" i], ' +
      '[name="shippingAddress.zipCode"], [name="shippingAddress.zipcode"], ' +
      '#shippingAddress\\.zipCode, #shippingAddress\\.zipcode'
    );
  }

  function isCepValidAlert(el) {
    var t = ((el && el.textContent) || '').replace(/\s+/g, ' ').trim().toLowerCase();
    return /digite um cep v[aá]lido/.test(t);
  }

  function ensureZipEmptyBagError(zip) {
    if (!zip) return;
    var group = zip.closest('.form-group');
    if (!group) return;
    group.classList.add('form-group-error');
    var existing = group.querySelector('.alert-danger-bagged');
    if (existing) {
      if (!((existing.textContent || '').trim())) {
        existing.textContent = EMPTY_FIELD_MSG;
      }
      existing.classList.remove('yamuna-hide-cep-step-alert');
      existing.style.removeProperty('display');
      return;
    }
    var div = document.createElement('div');
    div.className = 'alert alert-danger-bagged yamuna-cep-empty-msg';
    div.setAttribute('role', 'alert');
    div.textContent = EMPTY_FIELD_MSG;
    group.appendChild(div);
  }

  function clearInjectedZipEmptyError(zip) {
    if (!zip) return;
    var group = zip.closest('.form-group');
    if (!group) return;
    var injected = group.querySelector('.yamuna-cep-empty-msg');
    if (injected) injected.remove();
  }

  /**
 * Empty CEP + Continuar/Enter: platform shows "Digite um CEP válido" under the button
 * and drops the field message. Rewrite that alert into the field-level message and
 * move it under the CEP input.
 */
  function normalizeCepEmptyErrors() {
    var zip = getZipInput();
    var empty = !!(zip && isEmptyValue(zip));
    var group = zip && zip.closest('.form-group');
    var alerts = document.querySelectorAll(
      '.alert.alert-danger, .alert.full-width.alert-danger, .alert.m-top.alert-danger, .alert.m-top-half.alert-danger, .general-error'
    );

    for (var i = 0; i < alerts.length; i++) {
      var alertEl = alerts[i];
      if (alertEl.classList.contains('alert-danger-bagged') || alertEl.classList.contains('yamuna-cep-empty-msg')) {
        continue;
      }
      if (!isCepValidAlert(alertEl)) continue;

      if (empty && group) {
        while (alertEl.firstChild) alertEl.removeChild(alertEl.firstChild);
        alertEl.appendChild(document.createTextNode(EMPTY_FIELD_MSG));
        alertEl.className = 'alert alert-danger-bagged yamuna-cep-empty-msg';
        alertEl.removeAttribute('aria-hidden');
        alertEl.style.removeProperty('display');
        group.classList.add('form-group-error');
        if (alertEl.parentNode !== group) {
          group.appendChild(alertEl);
        }
      } else if (!empty) {
        alertEl.classList.remove('yamuna-hide-cep-step-alert');
        alertEl.removeAttribute('aria-hidden');
      } else {
        alertEl.classList.add('yamuna-hide-cep-step-alert');
        alertEl.setAttribute('aria-hidden', 'true');
      }
    }

    if (empty) ensureZipEmptyBagError(zip);
    else clearInjectedZipEmptyError(zip);
  }

  function pickFocusTarget() {
    var main =
      document.querySelector('#main-column') ||
      document.querySelector('.form-step') ||
      document;

    var errored = main.querySelectorAll(
      '.form-group-error .form-control, .form-group.has-error .form-control, .form-control.is-invalid, [aria-invalid="true"]'
    );
    for (var i = 0; i < errored.length; i++) {
      if (isVisible(errored[i])) return errored[i];
    }

    var bagged = main.querySelectorAll('.alert-danger-bagged');
    for (var b = 0; b < bagged.length; b++) {
      var alertEl = bagged[b];
      if (!isVisible(alertEl) && alertEl.offsetHeight === 0) continue;
      var group = alertEl.closest('.form-group, .input-group, .has-float-label');
      var input =
        (group && group.querySelector('input.form-control, textarea.form-control, select.form-control')) ||
        alertEl.previousElementSibling;
      if (input && input.classList && input.classList.contains('form-control') && isVisible(input)) {
        return input;
      }
      if (input && input.querySelector) {
        var nested = input.querySelector('input.form-control, textarea.form-control');
        if (nested && isVisible(nested)) return nested;
      }
    }

    var stepAlerts = main.querySelectorAll(
      '.alert.alert-danger, .alert.full-width.alert-danger, .general-error'
    );
    var hasStepAlert = false;
    for (var a = 0; a < stepAlerts.length; a++) {
      var t = (stepAlerts[a].textContent || '').trim();
      if (t && isVisible(stepAlerts[a])) {
        hasStepAlert = true;
        break;
      }
    }
    if (hasStepAlert) {
      var zip = main.querySelector(
        '[name="shippingAddress.zipcode"], [name="shippingAddress.zipCode"], #shippingAddress\\.zipcode, #shippingAddress\\.zipCode, [data-testid="shippingAddress_zipcode"], [data-testid="shippingAddress.zipCode"]'
      );
      if (zip && isVisible(zip) && isEmptyValue(zip)) return zip;
    }

    var anyDanger = main.querySelector(
      '.alert-danger, .alert-danger-bagged, .form-group-error, .general-error'
    );
    if (!anyDanger) return null;

    var fields = main.querySelectorAll(
      'input.form-control:not([type="hidden"]):not([type="checkbox"]):not([type="radio"]), textarea.form-control'
    );
    for (var f = 0; f < fields.length; f++) {
      if (isVisible(fields[f]) && isEmptyValue(fields[f])) return fields[f];
    }
    return null;
  }

  function focusInvalidField() {
    var target = pickFocusTarget();
    if (!target) return;
    try {
      target.focus({ preventScroll: false });
    } catch (e) {
      try {
        target.focus();
      } catch (e2) {}
    }
  }

  function scheduleFocus() {
    if (focusTimer) clearTimeout(focusTimer);
    focusTimer = setTimeout(function () {
      normalizeCepEmptyErrors();
      focusInvalidField();
      setTimeout(function () {
        normalizeCepEmptyErrors();
        focusInvalidField();
      }, 80);
      setTimeout(function () {
        normalizeCepEmptyErrors();
        focusInvalidField();
      }, 220);
    }, 30);
  }

  function hasValidationUi(node) {
    if (!node || node.nodeType !== 1) return false;
    if (node.matches && node.matches('.alert-danger, .alert-danger-bagged, .form-group-error, .general-error')) {
      return true;
    }
    if (node.querySelector && node.querySelector('.alert-danger, .alert-danger-bagged, .form-group-error, .general-error')) {
      return true;
    }
    return false;
  }

  /* ——— Cenário 079: Botão "Buscar" dentro do campo de CEP ——— */
  function ensureCepBuscarBtn() {
    var zip = getZipInput();
    if (!zip || !isVisible(zip)) return;

    var group = zip.closest('.form-group') || zip.closest('.has-float-label') || zip.parentNode;
    if (!group) return;

    // Evita duplicação
    if (group.querySelector('.yamuna-cep-buscar-btn')) return;

    // Garante position:relative no container para o botão absoluto funcionar
    if (window.getComputedStyle(group).position === 'static') {
      group.style.position = 'relative';
    }
    zip.style.paddingRight = '90px';

    var btn = document.createElement('button');
    btn.type = 'button';
    btn.className = 'yamuna-cep-buscar-btn';
    btn.textContent = 'Buscar';
    btn.setAttribute('aria-label', 'Buscar CEP');

    btn.addEventListener('click', function (e) {
      e.preventDefault();
      e.stopPropagation();

      // 1. Clica o botão de envio oficial de CEP da Nuvemshop se existir
      var officialSubmit = document.querySelector('[data-testid="btnSubmitZipCode"]');
      if (officialSubmit) {
        officialSubmit.click();
      }

      // 2. Dispara Enter no campo de CEP
      zip.focus();
      ['keydown', 'keypress', 'keyup'].forEach(function (evtType) {
        zip.dispatchEvent(new KeyboardEvent(evtType, {
          key: 'Enter', code: 'Enter', keyCode: 13, which: 13,
          bubbles: true, cancelable: true
        }));
      });
      zip.dispatchEvent(new Event('change', { bubbles: true }));
      zip.dispatchEvent(new Event('input', { bubbles: true }));

      // 3. Tenta submeter o formulário
      var form = zip.closest('form');
      if (form) {
        var submitBtn = form.querySelector('button[type="submit"]:not(.hide)');
        if (submitBtn) submitBtn.click();
      }
    });

    group.appendChild(btn);
  }

  /* ——— Cenário 079: Remover os 2 botões indesejados no fluxo de CEP / novo endereço ——— */
  function removeUnwantedShippingButtons() {
    var btns = document.querySelectorAll(
      '[data-testid="btnSubmitZipCode"], ' +
      '#main-column button.hide, ' +
      '#main-column .btn.hide, ' +
      '#main-column .btn-submit-step.hide, ' +
      '#main-column [class*="btnSubmitZipCode"], ' +
      'button.hide.btn-submit-step'
    );
    for (var i = 0; i < btns.length; i++) {
      btns[i].style.setProperty('display', 'none', 'important');
      btns[i].style.setProperty('visibility', 'hidden', 'important');
      btns[i].setAttribute('aria-hidden', 'true');
    }
  }

  /* ——— Cenário 079: Esconder CTAs CONTINUAR quando form de novo endereço está aberto ——— */
  function hideCTAWhenNewAddressOpen() {
    removeUnwantedShippingButtons();

    var zip = getZipInput();
    var newAddrFormOpen = !!(zip && isVisible(zip));

    // Esconde/mostra outros botões de checkout enquanto preenche CEP
    var otherBtns = document.querySelectorAll(
      '#yamuna-checkout-cta-row, ' +
      '.yamuna-checkout-cta-row'
    );

    for (var i = 0; i < otherBtns.length; i++) {
      var el = otherBtns[i];
      if (newAddrFormOpen) {
        el.setAttribute('data-yamuna-cta-hidden', '1');
        el.style.display = 'none';
      } else if (el.getAttribute('data-yamuna-cta-hidden')) {
        el.removeAttribute('data-yamuna-cta-hidden');
        el.style.removeProperty('display');
      }
    }
  }

  /* ——— Cenário 079: Desativar sticky nos headers e fixar "Sem número" dentro do input ——— */
  function fixLayoutAndStickyHeaders() {
    var stickyHeaders = document.querySelectorAll('.panel-header-sticky, [class*="panel-header-sticky"]');
    for (var i = 0; i < stickyHeaders.length; i++) {
      stickyHeaders[i].style.setProperty('position', 'static', 'important');
      stickyHeaders[i].style.setProperty('top', 'auto', 'important');
    }

    var numInput = document.querySelector('[name="shippingAddress.number"]');
    var inputBtn = document.querySelector('.input-button');
    if (numInput && inputBtn) {
      var wrap = numInput.closest('.has-float-label');
      if (wrap && inputBtn.parentNode !== wrap) {
        wrap.style.setProperty('position', 'relative', 'important');
        wrap.appendChild(inputBtn);
      }
      inputBtn.style.setProperty('position', 'absolute', 'important');
      inputBtn.style.setProperty('top', '0', 'important');
      inputBtn.style.setProperty('bottom', '0', 'important');
      inputBtn.style.setProperty('height', '100%', 'important');
      inputBtn.style.setProperty('transform', 'none', 'important');
      inputBtn.style.setProperty('right', '14px', 'important');
      inputBtn.style.setProperty('display', 'flex', 'important');
      inputBtn.style.setProperty('align-items', 'center', 'important');
      inputBtn.style.setProperty('justify-content', 'center', 'important');
      inputBtn.style.setProperty('margin', '0', 'important');
      inputBtn.style.setProperty('padding', '0', 'important');

      var innerGroup = inputBtn.querySelector('.form-group');
      if (innerGroup) {
        innerGroup.style.setProperty('margin', '0', 'important');
        innerGroup.style.setProperty('padding', '0', 'important');
        innerGroup.style.setProperty('height', '100%', 'important');
        innerGroup.style.setProperty('display', 'flex', 'important');
        innerGroup.style.setProperty('align-items', 'center', 'important');
      }
      var innerLabel = inputBtn.querySelector('label');
      if (innerLabel) {
        innerLabel.style.setProperty('margin', '0', 'important');
        innerLabel.style.setProperty('padding', '0', 'important');
        innerLabel.style.setProperty('height', '100%', 'important');
        innerLabel.style.setProperty('display', 'flex', 'important');
        innerLabel.style.setProperty('align-items', 'center', 'important');
      }
    }

    var outerFormless = document.querySelector('[data-testid="shipping_formless"]');
    if (outerFormless) {
      outerFormless.style.setProperty('background', 'transparent', 'important');
      outerFormless.style.setProperty('padding', '0', 'important');
    }
  }

  function run() {
    wrapProductNames(document);
    removeSummaryThumbWhiteBg(document);
    enableCarrinhoStep();
    markCheckoutStep();
    fixNubeStepsOnSuccess();
    normalizeFinishButtonLabel();
    ensureContinueShoppingCta();
    normalizeCepEmptyErrors();
    ensureCepBuscarBtn();
    removeUnwantedShippingButtons();
    hideCTAWhenNewAddressOpen();
    fixLayoutAndStickyHeaders();
  }

  run();

  var debounce = null;
  var obs = new MutationObserver(function (mutations) {
    clearTimeout(debounce);
    debounce = setTimeout(function () {
      wrapProductNames(document);
      removeSummaryThumbWhiteBg(document);
      enableCarrinhoStep();
      markCheckoutStep();
      fixNubeStepsOnSuccess();
      normalizeFinishButtonLabel();
      ensureContinueShoppingCta();
      normalizeCepEmptyErrors();
      ensureCepBuscarBtn();
      removeUnwantedShippingButtons();
      hideCTAWhenNewAddressOpen();
      fixLayoutAndStickyHeaders();
    }, 40);
    for (var i = 0; i < mutations.length; i++) {
      var m = mutations[i];
      if (m.type === 'childList') {
        for (var j = 0; j < m.addedNodes.length; j++) {
          if (hasValidationUi(m.addedNodes[j])) {
            scheduleFocus();
            return;
          }
        }
      } else if (m.type === 'attributes') {
        if (hasValidationUi(m.target)) {
          scheduleFocus();
          return;
        }
      }
    }
  });

  if (document.body) {
    obs.observe(document.body, {
      childList: true,
      subtree: true,
      attributes: true,
      characterData: true,
      attributeFilter: ['class', 'aria-invalid', 'id']
    });
  }

  /* Keep label correct even if platform rewrites #btn-text after paint */
  setInterval(function () {
    normalizeFinishButtonLabel();
    ensureContinueShoppingCta();
  }, 800);

  /* Payment alert: Raleway + padding + move above FINALIZAR COMPRA */
  function isPaymentSelectAlert(el) {
    var t = ((el && el.textContent) || '').toLowerCase();
    return (
      t.indexOf('pagamento') !== -1 &&
      (t.indexOf('selecione') !== -1 || t.indexOf('escolha') !== -1) &&
      (t.indexOf('op') !== -1 || t.indexOf('forma') !== -1)
    );
  }

  function stylePaymentAlert(el) {
    if (!el || !el.style) return;
    el.classList.add('yamuna-payment-option-alert');
    el.style.setProperty('font-family', 'Raleway, sans-serif', 'important');
    el.style.setProperty('font-size', '13px', 'important');
    el.style.setProperty('font-weight', '500', 'important');
    el.style.setProperty('font-style', 'normal', 'important');
    el.style.setProperty('line-height', '1.4', 'important');
    el.style.setProperty('color', '#db3e3e', 'important');
    el.style.setProperty('padding', '10px 20px', 'important');
    el.style.setProperty('margin', '14px 0 12px', 'important');
    el.style.setProperty('box-sizing', 'border-box', 'important');
    el.style.setProperty('width', '100%', 'important');
    el.style.setProperty('max-width', '100%', 'important');
    el.style.setProperty('display', 'flex', 'important');
    el.style.setProperty('align-items', 'center', 'important');
    el.style.setProperty('justify-content', 'flex-start', 'important');
    el.style.setProperty('text-align', 'left', 'important');
    el.style.setProperty('background', 'transparent', 'important');
    el.style.setProperty('border', '0', 'important');
    el.style.setProperty('border-left', '0', 'important');
    el.style.setProperty('box-shadow', 'none', 'important');
    var spans = el.querySelectorAll('span');
    for (var i = 0; i < spans.length; i++) {
      if (!spans[i].style) continue;
      spans[i].style.setProperty('font-family', 'Raleway, sans-serif', 'important');
      spans[i].style.setProperty('font-size', '13px', 'important');
      spans[i].style.setProperty('font-weight', '500', 'important');
      spans[i].style.setProperty('color', '#db3e3e', 'important');
    }
  }

  function ensurePaymentAlertCss() {
    if (document.getElementById('yamuna-payment-alert-css')) return;
    var style = document.createElement('style');
    style.id = 'yamuna-payment-alert-css';
    style.textContent = [
      'html body .alert.alert-danger,html body .alert.m-bottom.full-width.alert-danger,html body #main-column .alert.m-bottom.full-width.alert-danger,html body .yamuna-payment-option-alert{',
      'box-sizing:border-box!important;display:flex!important;align-items:center!important;justify-content:flex-start!important;',
      'width:100%!important;max-width:100%!important;margin:14px 0 12px!important;padding:10px 20px!important;',
      'background:transparent!important;border:0!important;border-left:0!important;box-shadow:none!important;',
      'font-family:Raleway,sans-serif!important;font-size:13px!important;font-weight:500!important;',
      'line-height:1.4!important;text-align:left!important;color:#db3e3e!important;}',
      'html body .alert.alert-danger span,html body .yamuna-payment-option-alert span{',
      'font-family:Raleway,sans-serif!important;font-size:13px!important;font-weight:500!important;color:#db3e3e!important;}',
      '#checkout-payment-options{display:flex!important;flex-direction:column!important;}',
      '#checkout-payment-options>.alert.alert-danger{order:99!important;padding:10px 20px!important;}'
    ].join('');
    (document.head || document.documentElement).appendChild(style);
  }

  function normalizePaymentOptionAlert() {
    ensurePaymentAlertCss();
    var finish = document.getElementById('btnFinishCheckout');
    var alerts = document.querySelectorAll(
      '#checkout-payment-options .alert.alert-danger, .payment-option-group > .alert.alert-danger, .radio-group-accordion > .alert.alert-danger, #main-column .alert.alert-danger.full-width, #main-column .alert.m-bottom.alert-danger'
    );
    for (var i = 0; i < alerts.length; i++) {
      var el = alerts[i];
      if (!isPaymentSelectAlert(el)) continue;
      stylePaymentAlert(el);
      if (finish && finish.parentNode) {
        var row = document.getElementById('yamuna-checkout-cta-row');
        var anchor = row || finish;
        if (anchor.parentNode && anchor.previousElementSibling !== el) {
          anchor.parentNode.insertBefore(el, anchor);
        }
      }
    }
  }

  setTimeout(normalizePaymentOptionAlert, 50);
  setTimeout(normalizePaymentOptionAlert, 300);
  setInterval(normalizePaymentOptionAlert, 600);
  if (window.MutationObserver) {
    var payAlertTimer = null;
    new MutationObserver(function () {
      clearTimeout(payAlertTimer);
      payAlertTimer = setTimeout(normalizePaymentOptionAlert, 60);
    }).observe(document.documentElement, { childList: true, subtree: true, characterData: true });
  }

  document.addEventListener(
    'click',
    function (e) {
      var btn = e.target && e.target.closest
        ? e.target.closest(
            'button.btn-primary, .btn-submit-step, #btnFinishCheckout, #btn-submit-step, button[type="submit"]'
          )
        : null;
      if (btn) scheduleFocus();
    },
    true
  );

  document.addEventListener(
    'keydown',
    function (e) {
      if (e.key !== 'Enter') return;
      var zip = getZipInput();
      if (zip && (e.target === zip || (zip.form && zip.form.contains(e.target)))) {
        scheduleFocus();
      }
    },
    true
  );

  document.addEventListener(
    'input',
    function (e) {
      var t = e.target;
      if (!t || !t.name) return;
      if (t.name === 'shippingAddress.zipCode' || t.name === 'shippingAddress.zipcode') {
        if (!isEmptyValue(t)) clearInjectedZipEmptyError(t);
        normalizeCepEmptyErrors();
      }
    },
    true
  );

  window.addEventListener('resize', function () {
    if (window.innerWidth <= MOBILE_MAX) wrapProductNames(document);
  });

  /* ——— Reviews: fixed card + autoplay/swiper (align with form fields) ——— */
  var REVIEW_CACHE = null;
  var REVIEW_FETCHING = false;

  function findNubeReviewsBox() {
    var byId = document.getElementById('yamuna-cart-reviews');
    if (byId) return byId;
    var slot = document.getElementById('nube-sdk-slot-after_main_content');
    if (!slot) return null;
    var kids = slot.children;
    for (var i = 0; i < kids.length; i++) {
      var el = kids[i];
      if ((el.textContent || '').indexOf('O que estão dizendo') !== -1) return el;
    }
    /* O SDK pode inserir a avaliação dentro de uma caixa intermediária. */
    var descendants = slot.querySelectorAll('*');
    for (var j = 0; j < descendants.length; j++) {
      var candidate = descendants[j];
      var candidateText = (candidate.textContent || '').toLowerCase();
      if (candidateText.indexOf('o que est') === -1 || candidateText.indexOf('dizendo') === -1) continue;
      while (candidate.parentElement && candidate.parentElement !== slot) candidate = candidate.parentElement;
      if (candidate.parentElement === slot) return candidate;
    }
    return null;
  }

  function initLocalReviewCarousel(root) {
    if (!root || root.getAttribute('data-yamuna-dep-init') === '1') return;
    var el = root.querySelector('.js-swiper-cart-dep');
    if (!el) return;
    root.setAttribute('data-yamuna-dep-init', '1');
    if (typeof window.yamunaInitCartDepositions === 'function') {
      try { window.yamunaInitCartDepositions(); } catch (e) {}
      return;
    }
    if (typeof Swiper !== 'undefined') {
      try {
        if (el.swiper) el.swiper.destroy(true, true);
        new Swiper(el, {
          slidesPerView: 1,
          slidesPerGroup: 1,
          spaceBetween: 0,
          loop: el.querySelectorAll('.swiper-slide').length > 1,
          autoplay: { delay: 5500, disableOnInteraction: false },
          navigation: {
            nextEl: root.querySelector('.js-swiper-cart-dep-next'),
            prevEl: root.querySelector('.js-swiper-cart-dep-prev'),
          },
        });
        return;
      } catch (e2) {}
    }
    var slides = el.querySelectorAll('.swiper-slide');
    if (slides.length < 2) return;
    var idx = 0;
    function show(i) {
      for (var n = 0; n < slides.length; n++) {
        slides[n].style.display = n === i ? 'block' : 'none';
      }
      idx = i;
    }
    show(0);
    var prev = root.querySelector('.js-swiper-cart-dep-prev');
    var next = root.querySelector('.js-swiper-cart-dep-next');
    if (prev) prev.onclick = function () { show((idx - 1 + slides.length) % slides.length); };
    if (next) next.onclick = function () { show((idx + 1) % slides.length); };
    setInterval(function () { show((idx + 1) % slides.length); }, 5500);
  }

  function findActualNubeReviewsBox() {
    var slot = document.getElementById('nube-sdk-slot-after_main_content');
    if (!slot) return null;
    var kids = slot.children;
    for (var i = 0; i < kids.length; i++) {
      var text = (kids[i].textContent || '').toLowerCase();
      if (text.indexOf('yamuna') !== -1 && text.indexOf('raquel') !== -1) return kids[i];
    }
    return null;
  }

  function mountCartDepositions(html) {
    if (document.getElementById('yamuna-checkout-extras')) return;
    var doc;
    try {
      doc = new DOMParser().parseFromString(html, 'text/html');
    } catch (e) {
      return;
    }
    var dep = doc.querySelector('.yamuna-cart-depositions');
    if (!dep) return;

    var slot = document.getElementById('nube-sdk-slot-after_main_content');
    var nubeBox = findActualNubeReviewsBox();
    var wrap = document.createElement('div');
    wrap.id = 'yamuna-checkout-extras';
    wrap.className = 'yamuna-checkout-extras';
    wrap.appendChild(document.importNode(dep, true));

    if (nubeBox && nubeBox.parentNode) {
      nubeBox.style.display = 'none';
      nubeBox.setAttribute('data-yamuna-hidden-reviews', '1');
      nubeBox.parentNode.insertBefore(wrap, nubeBox);
    } else if (slot) {
      slot.insertBefore(wrap, slot.firstChild);
    } else {
      return;
    }

    try {
      var scripts = wrap.querySelectorAll('script');
      for (var i = 0; i < scripts.length; i++) {
        var s = document.createElement('script');
        s.textContent = scripts[i].textContent;
        scripts[i].parentNode.replaceChild(s, scripts[i]);
      }
    } catch (e2) {}

    setTimeout(function () {
      initLocalReviewCarousel(wrap.querySelector('.yamuna-cart-depositions'));
    }, 80);
  }

  /* The checkout is isolated from the storefront theme, so importing the live
   * /comprar DOM is unreliable. Render the same, self-contained markup here. */
  function mountStaticCartDepositions() {
    if (document.getElementById('yamuna-checkout-extras')) return true;

    var slot = document.getElementById('nube-sdk-slot-after_main_content');
    if (!slot) return false;

    var reviews = [
      ['Produtos de excelente qualidade! Vale muito a pena o investimento. Meu queridinho é o Golden Milk e também a Ghee. E que dizer desses cafés? Gente do céu... surreal de maravilhoso. Gosto de tudo e estou sempre comprando os meus queridos e experimentando novas opções. Obrigada, Yamuna, pelo carinho e amor de vocês em forma de nutrição com excelência.', 'Raquel Cassiano'],
      ['Todos os produtos são de altíssima qualidade e deliciosos, nenhuma outra marca chega perto, especialmente o Ghee, ideal de coco e melhor de tamarindo. Se não bastasse isso, ainda prestam o melhor atendimento ao consumidor que já vi no Brasil! O cuidado e carinho com os clientes é sensacional!', 'Thiago P'],
      ['Apaixonada pelos produtos da Yamuna! Tudo muito bem feito, com produtos de qualidade, as embalagens são lindas e quando eu abro a caixa eu sinto o carinho que eles colocaram em cada detalhe.', 'Kelly Cristina Amaral'],
      ['Destaque para o cuidado na embalagem dos produtos, e agora é só saborear tudo perfeitamente preparado e oferecido com carinho, a energia e grande luz da Deusa Yamuna!', 'Bernadete Pinho']
    ];
    var stars = '<span class="yamuna-cart-deposition-stars" aria-label="5 de 5 estrelas">★★★★★</span>';
    var slides = reviews.map(function (review) {
      return '<article class="yamuna-cart-deposition-card">' + stars +
        '<div class="yamuna-cart-deposition-content"><p>' + review[0] +
        '</p><span class="yamuna-cart-deposition-author">' + review[1] +
        '</span></div></article>';
    }).join('');
    var wrap = document.createElement('section');
    wrap.id = 'yamuna-checkout-extras';
    wrap.className = 'yamuna-checkout-extras';
    wrap.innerHTML = '<section class="yamuna-cart-depositions" aria-label="Avaliações">' +
      '<div class="yamuna-cart-depositions-header"><span class="yamuna-cart-depositions-icon-wrapper" aria-hidden="true">★</span>' +
      '<h2 class="yamuna-cart-depositions-title">O que estão dizendo sobre a Yamuna</h2></div>' +
      '<div class="yamuna-cart-depositions-body"><div class="yamuna-cart-depositions-carousel">' + slides +
      '</div><div class="yamuna-cart-depositions-nav"><button type="button" class="yamuna-cart-dep-prev" aria-label="Depoimento anterior">‹</button>' +
      '<button type="button" class="yamuna-cart-dep-next" aria-label="Próximo depoimento">›</button></div></div></section>';

    var footer = slot.lastElementChild;
    slot.insertBefore(wrap, footer || null);
    var actualNube = findActualNubeReviewsBox();
    if (actualNube) actualNube.style.display = 'none';

    var cards = wrap.querySelectorAll('.yamuna-cart-deposition-card');
    var index = 0;
    function show(next) {
      index = (next + cards.length) % cards.length;
      var mobile = window.matchMedia('(max-width: 767px)').matches;
      cards.forEach(function (card, i) { card.style.display = mobile && i !== index ? 'none' : 'flex'; });
    }
    var prev = wrap.querySelector('.yamuna-cart-dep-prev');
    var next = wrap.querySelector('.yamuna-cart-dep-next');
    if (prev) prev.onclick = function () { show(index - 1); };
    if (next) next.onclick = function () { show(index + 1); };
    show(0);
    window.addEventListener('resize', function () { show(index); });
    return true;
  }

  /* 097 - box de avaliacoes do NubeSDK: 15px laterais no mobile, forcados inline com !important
   * (o CSS nativo do checkout zera margin-left/right e forca width:100% com !important). */
  function applyReviewsSpacing() {
    var slot = document.getElementById('nube-sdk-slot-after_main_content');
    if (!slot) return;
    var mobile = window.innerWidth <= 767;
    var kids = slot.children;
    for (var i = 0; i < kids.length; i++) {
      var el = kids[i];
      if (el.id === 'yamuna-checkout-extras' || el.getAttribute('data-yamuna-hidden-reviews') === '1') continue;
      var txt = (el.textContent || '').toLowerCase();
      if (txt.indexOf('dizendo sobre a yamuna') === -1) continue;
      var want = mobile
        ? { 'margin-left': '15px', 'margin-right': '15px', 'width': 'calc(100% - 30px)', 'max-width': 'calc(100% - 30px)', 'box-sizing': 'border-box' }
        : null;
      if (!want) continue;
      for (var k in want) {
        if (el.style.getPropertyValue(k) !== want[k] || el.style.getPropertyPriority(k) !== 'important') {
          el.style.setProperty(k, want[k], 'important');
        }
      }
    }
  }
  function ensureCheckoutReviews() {
    applyReviewsSpacing();
    if (mountStaticCartDepositions()) return;
    if (document.getElementById('yamuna-checkout-extras')) {
      initLocalReviewCarousel(
        document.querySelector('#yamuna-checkout-extras .yamuna-cart-depositions')
      );
      return;
    }
    /* Replace the NubeSDK carousel with the exact /comprar component. */
    var nube = document.getElementById('yamuna-cart-reviews');
    if (nube && nube.querySelector('#yamuna-review-next')) {
      nube.style.display = 'none';
      nube.setAttribute('data-yamuna-hidden-reviews', '1');
    }

    if (!findActualNubeReviewsBox() && !document.getElementById('nube-sdk-slot-after_main_content')) {
      return;
    }

    if (REVIEW_CACHE) {
      mountCartDepositions(REVIEW_CACHE);
      return;
    }
    if (REVIEW_FETCHING) return;
    REVIEW_FETCHING = true;
    var cartUrl = location.origin.replace(/\/$/, '') + '/comprar';
    fetch(cartUrl, { credentials: 'same-origin', cache: 'force-cache' })
      .then(function (r) {
        if (!r.ok) throw new Error('cart ' + r.status);
        return r.text();
      })
      .then(function (html) {
        REVIEW_CACHE = html;
        mountCartDepositions(html);
      })
      .catch(function () {})
      .finally(function () {
        REVIEW_FETCHING = false;
      });
  }

  function scheduleReviews() {
    setTimeout(ensureCheckoutReviews, 200);
    setTimeout(ensureCheckoutReviews, 1200);
  }

  /* Also run on success/order confirmation page */
  var path = location.pathname || '';
  var isCheckout = /\/checkout\//i.test(path);
  var isSuccess = /\/checkout\/v3\/success\//i.test(path) || /\/success/i.test(path) ||
                  document.querySelector('.status-content, .status.panel, .success-order-id, [test-id="order-id"]');

  if (isCheckout || isSuccess) {
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', scheduleReviews);
    } else {
      scheduleReviews();
    }
    if (window.MutationObserver) {
      var revTimer = null;
      new MutationObserver(function () {
        clearTimeout(revTimer);
        revTimer = setTimeout(ensureCheckoutReviews, 400);
      }).observe(document.documentElement, { childList: true, subtree: true });
    }
  }
})();

/* 082 — card Cupom de desconto (prototipo). DOM proprio, fora do React. */
(function () {
  if (!/\/checkout\//i.test(location.pathname)) return;
  if (window.__yamuna082card) return;
  window.__yamuna082card = 1;

  var TAG =
    '<svg width="16" height="16" viewBox="0 0 24 24" aria-hidden="true"><path fill="#a31460" d="M21.41 11.58l-9-9A2 2 0 0 0 11 2H4a2 2 0 0 0-2 2v7a2 2 0 0 0 .59 1.42l9 9a2 2 0 0 0 2.82 0l7-7a2 2 0 0 0 0-2.84zM5.5 7A1.5 1.5 0 1 1 7 5.5 1.5 1.5 0 0 1 5.5 7z"/></svg>';
  var CHECK =
    '<svg width="16" height="16" viewBox="0 0 24 24" aria-hidden="true"><path fill="#2e7d32" d="M9.2 16.6L4.8 12.2l1.4-1.4 3 3 8-8 1.4 1.4z"/></svg>';
  var HINT =
    'Experimente: <strong>TESTE</strong> (10% off), <strong>FRETEGRATIS</strong> (frete gratis) ou <strong>BEMVINDO15</strong> (15% off)';
  var timer = null;
  var applying = false;

  function injectCss() {
    var id = 'yamuna-082-card-css';
    var el = document.getElementById(id);
    if (!el) {
      el = document.createElement('style');
      el.id = id;
      (document.body || document.documentElement).appendChild(el);
    }
    el.textContent = [
      '#yamuna-coupon-card{display:block!important;visibility:visible!important;width:100%!important;',
      'max-width:100%!important;margin:0 0 12px!important;padding:16px!important;box-sizing:border-box!important;',
      'background:#fff!important;border:1px solid rgba(0,0,0,.1)!important;border-radius:10px!important;',
      'box-shadow:0 1px 3px -1px rgba(0,0,0,.04)!important;font-family:Raleway,sans-serif!important;}',
      '#yamuna-coupon-card .yc-head{display:flex!important;align-items:center!important;gap:8px!important;',
      'margin:0 0 12px!important;color:#000!important;font-family:Raleway,sans-serif!important;',
      'font-size:24px!important;font-weight:700!important;line-height:1.25!important;}',
      '#yamuna-coupon-card .yc-head span{font:inherit!important;}',
      '#yamuna-coupon-card .yc-input,#yamuna-coupon-card .yc-hint,#yamuna-coupon-card .yc-applied,#yamuna-coupon-card .yc-err{',
      'font-family:Roboto,Arial,sans-serif!important;}',
      '#yamuna-coupon-card .yc-input{font-size:16px!important;}',
      '#yamuna-coupon-card .yc-row{display:flex!important;align-items:stretch!important;gap:10px!important;width:100%!important;}',
      '#yamuna-coupon-card .yc-input{flex:1 1 auto!important;min-width:0!important;height:42px!important;',
      'padding:0 14px!important;border:1px solid #d0ccd4!important;border-radius:8px!important;',
      'background:#fff!important;color:#000!important;font-size:16px!important;font-family:Roboto,Arial,sans-serif!important;',
      'box-sizing:border-box!important;outline:none!important;}',
      '#yamuna-coupon-card .yc-apply{flex:0 0 auto!important;min-width:110px!important;height:42px!important;',
      'padding:0 16px!important;border:0!important;border-radius:8px!important;background:#a31460!important;',
      'color:#fff!important;font-size:14px!important;font-weight:700!important;letter-spacing:.04em!important;',
      'text-transform:uppercase!important;cursor:pointer!important;font-family:Raleway,sans-serif!important;}',
      '#yamuna-coupon-card .yc-apply[disabled]{opacity:.6!important;cursor:wait!important;}',
      '#yamuna-coupon-card .yc-hint{display:block!important;margin:10px 0 0!important;color:#757575!important;',
      'font-size:12px!important;line-height:1.45!important;}',
      '#yamuna-coupon-card .yc-hint strong{color:#555!important;font-weight:700!important;}',
      '#yamuna-coupon-card .yc-applied{display:none!important;align-items:center!important;justify-content:space-between!important;',
      'gap:10px!important;margin:0!important;padding:10px 14px!important;border-radius:8px!important;',
      'background:#e8f5e9!important;color:#1b5e20!important;font-size:13px!important;font-weight:600!important;}',
      '#yamuna-coupon-card.is-applied .yc-form{display:none!important;}',
      '#yamuna-coupon-card.is-applied .yc-hint{display:none!important;}',
      '#yamuna-coupon-card.is-applied .yc-applied{display:flex!important;}',
      '#yamuna-coupon-card .yc-applied-msg{display:inline-flex!important;align-items:center!important;gap:8px!important;}',
      '#yamuna-coupon-card .yc-remove{background:none!important;border:0!important;padding:0!important;',
      'color:#1b5e20!important;font-size:13px!important;font-weight:600!important;text-decoration:underline!important;',
      'cursor:pointer!important;font-family:Raleway,sans-serif!important;}',
      '#yamuna-coupon-card .yc-err{display:none!important;margin:8px 0 0!important;color:#c62828!important;font-size:12px!important;}',
      '#yamuna-coupon-card.has-error .yc-err{display:block!important;}',
      'html body .summary-details .summary-coupon,',
      'html body #secondary-column .summary-coupon,',
      'html body #secondary-column .mobile-discount-coupon_btn,',
      'html body #secondary-column a.mobile-discount-coupon_btn{',
      'display:none!important;visibility:hidden!important;height:0!important;',
      'margin:0!important;padding:0!important;overflow:hidden!important;}',
      '#secondary-column #yamuna-coupon-card{display:block!important;}'
    ].join('');
  }

  function nativeCoupon() {
    return document.querySelector(
      '#secondary-column .summary-details > .summary-coupon:not(.d-md-none), #secondary-column .summary-coupon:not(.d-md-none)'
    );
  }

  function readAppliedCode() {
    var n = nativeCoupon();
    if (!n) return '';
    var codeEl = n.querySelector('[data-testid="coupon-code"]');
    if (!codeEl) return '';
    var t = (codeEl.textContent || '').replace(/\s+/g, ' ').trim();
    if (/adicionar/i.test(t)) return '';
    return t.replace(/^cupom\s*:?\s*/i, '').trim();
  }

  function ensureNativeFormOpen(cb) {
    var n = nativeCoupon();
    if (!n) {
      if (cb) cb(null);
      return;
    }
    var input = n.querySelector('input#coupon, input[name="coupon"]');
    if (input) {
      if (cb) cb(n);
      return;
    }
    var link = n.querySelector(
      '.box-discount-coupon-applied .btn-link, .box-discount-coupon-applied [role="button"]'
    );
    if (link && /adicionar/i.test(n.textContent || '')) {
      try {
        link.click();
      } catch (e) {}
      setTimeout(function () {
        if (cb) cb(nativeCoupon());
      }, 350);
      return;
    }
    if (cb) cb(n);
  }

  function setNativeValue(input, value) {
    var proto = window.HTMLInputElement && window.HTMLInputElement.prototype;
    var desc = proto && Object.getOwnPropertyDescriptor(proto, 'value');
    if (desc && desc.set) desc.set.call(input, value);
    else input.value = value;
    input.dispatchEvent(new Event('input', { bubbles: true }));
    input.dispatchEvent(new Event('change', { bubbles: true }));
  }

  function applyNative(code, done) {
    ensureNativeFormOpen(function (n) {
      if (!n) {
        done(false, 'Cupom indisponivel neste passo');
        return;
      }
      var input = n.querySelector('input#coupon, input[name="coupon"]');
      var btn =
        n.querySelector('button[test-id="apply-coupon-btn"]') ||
        n.querySelector('.box-discount-coupon button');
      if (!input || !btn) {
        done(false, 'Nao foi possivel aplicar o cupom');
        return;
      }
      setNativeValue(input, code);
      try {
        btn.click();
      } catch (e) {
        done(false, 'Erro ao aplicar');
        return;
      }
      setTimeout(function () {
        done(!!readAppliedCode(), readAppliedCode() ? '' : 'Cupom invalido ou nao aplicado');
      }, 900);
    });
  }

  function removeNative(done) {
    var n = nativeCoupon();
    if (n) {
      n.style.setProperty('display', 'block', 'important');
      n.style.setProperty('visibility', 'visible', 'important');
      n.style.setProperty('height', 'auto', 'important');
      n.style.setProperty('overflow', 'visible', 'important');
    }
    var rem = n && n.querySelector('#removeCoupon, [title*="xcluir" i]');
    if (rem) {
      try {
        rem.click();
      } catch (e) {}
      setTimeout(function () {
        done();
      }, 700);
      return;
    }
    done();
  }

  function mountCard() {
    injectCss();
    var sec = document.querySelector('#secondary-column');
    if (!sec) return null;
    var summary =
      sec.querySelector('.summary.d-none.d-md-block') ||
      sec.querySelector('.summary.sticky') ||
      sec.querySelector('.summary');
    var card = document.getElementById('yamuna-coupon-card');
    if (!card) {
      card = document.createElement('div');
      card.id = 'yamuna-coupon-card';
      card.innerHTML =
        '<div class="yc-head">' +
        TAG +
        '<span>Cupom de desconto</span></div>' +
        '<div class="yc-form"><div class="yc-row">' +
        '<input class="yc-input" type="text" maxlength="40" placeholder="Codigo do cupom" autocomplete="off" aria-label="Cupom de desconto" />' +
        '<button class="yc-apply" type="button">APLICAR</button></div>' +
        '<p class="yc-err" role="alert"></p></div>' +
        '<p class="yc-hint">' +
        HINT +
        '</p>' +
        '<div class="yc-applied"><span class="yc-applied-msg"></span>' +
        '<button class="yc-remove" type="button">Remover</button></div>';
      var input = card.querySelector('.yc-input');
      var applyBtn = card.querySelector('.yc-apply');
      var removeBtn = card.querySelector('.yc-remove');
      var err = card.querySelector('.yc-err');
      function showError(msg) {
        if (!msg) {
          card.classList.remove('has-error');
          err.textContent = '';
          return;
        }
        card.classList.add('has-error');
        err.textContent = msg;
      }
      applyBtn.addEventListener('click', function () {
        if (applying) return;
        var code = (input.value || '').trim();
        if (!code) {
          showError('Digite um cupom');
          return;
        }
        applying = true;
        applyBtn.disabled = true;
        showError('');
        applyNative(code, function (ok, msg) {
          applying = false;
          applyBtn.disabled = false;
          if (ok) syncCard();
          else showError(msg || 'Nao foi possivel aplicar o cupom');
        });
      });
      input.addEventListener('keydown', function (e) {
        if (e.key === 'Enter') {
          e.preventDefault();
          applyBtn.click();
        }
      });
      removeBtn.addEventListener('click', function () {
        removeNative(function () {
          input.value = '';
          syncCard();
        });
      });
    }
    if (summary && summary.parentNode) {
      if (card.parentNode !== summary.parentNode || card.nextSibling !== summary) {
        summary.parentNode.insertBefore(card, summary);
      }
    } else if (!card.parentNode) {
      sec.insertBefore(card, sec.firstChild);
    }
    return card;
  }

  function syncCard() {
    var card = mountCard();
    if (!card) return;
    var code = readAppliedCode();
    var msg = card.querySelector('.yc-applied-msg');
    if (code) {
      card.classList.add('is-applied');
      msg.innerHTML = CHECK + ' Cupom ' + code + ' aplicado!';
    } else {
      card.classList.remove('is-applied');
      msg.innerHTML = '';
    }
  }

  function tick() {
    clearTimeout(timer);
    timer = setTimeout(function () {
      try {
        syncCard();
      } catch (e) {}
    }, 200);
  }

  try {
    syncCard();
  } catch (e0) {}
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', tick);
  }
  window.addEventListener('load', tick);
  setTimeout(tick, 500);
  setTimeout(tick, 1500);
  setTimeout(tick, 3000);
  if (window.MutationObserver) {
    new MutationObserver(function (muts) {
      for (var i = 0; i < muts.length; i++) {
        var m = muts[i];
        if (m.target && m.target.closest && m.target.closest('#yamuna-coupon-card')) continue;
        if (m.target && m.target.id === 'yamuna-082-card-css') continue;
      }
      tick();
    }).observe(document.documentElement, {
      childList: true,
      subtree: true
    });
  }
})();
