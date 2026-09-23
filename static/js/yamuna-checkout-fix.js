/**
 * Yamuna checkout QA fixes.
 * Loaded only on /checkout/ via yamuna-checkout-fix-loader.js
 *
 * 018 — Carrinho step → /comprar/
 * 021 — product name clamp + validation focus UX
 */
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
    if (/\/checkout\/v3\/next\//i.test(path) || /\/payment/i.test(path)) {
      body.classList.add('yamuna-step-pagamento');
    } else if (/\/checkout\//i.test(path)) {
      body.classList.add('yamuna-step-entrega');
    }
  }

  /* ——— 021: validation focus UX + CEP empty message ——— */
  var EMPTY_FIELD_MSG = 'Este campo deve ser preenchido';

  function isVisible(el) {
    if (!el || el.disabled || el.readOnly) return false;
    var cs = window.getComputedStyle(el);
    if (cs.display === 'none' || cs.visibility === 'hidden') return false;
    return el.offsetWidth > 0 || el.offsetHeight > 0 || el.getClientRects().length > 0;
  }

  function isEmptyValue(el) {
    var v = (el.value || '').replace(/\s/g, '');
    return v.length === 0;
  }

  function getZipInput() {
    return document.querySelector(
      '[name="shippingAddress.zipCode"], [name="shippingAddress.zipcode"], #shippingAddress\\.zipCode, #shippingAddress\\.zipcode, [data-testid="shippingAddress.zipCode"], [data-testid="shippingAddress_zipcode"]'
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

  function run() {
    wrapProductNames(document);
    enableCarrinhoStep();
    markCheckoutStep();
    normalizeCepEmptyErrors();
  }

  run();

  var debounce = null;
  var obs = new MutationObserver(function (mutations) {
    clearTimeout(debounce);
    debounce = setTimeout(function () {
      wrapProductNames(document);
      enableCarrinhoStep();
      normalizeCepEmptyErrors();
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
      attributeFilter: ['class', 'aria-invalid']
    });
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
    var nubeBox = findNubeReviewsBox();
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

  function ensureCheckoutReviews() {
    if (document.getElementById('yamuna-checkout-extras')) {
      initLocalReviewCarousel(
        document.querySelector('#yamuna-checkout-extras .yamuna-cart-depositions')
      );
      return;
    }
    /* New Nube paste already has single-card carousel */
    var nube = document.getElementById('yamuna-cart-reviews');
    if (nube && nube.querySelector('#yamuna-review-next')) return;

    if (!findNubeReviewsBox() && !document.getElementById('nube-sdk-slot-after_main_content')) {
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
})();
