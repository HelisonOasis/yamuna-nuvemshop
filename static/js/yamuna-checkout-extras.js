/**
 * Yamuna checkout extras — imports the SAME nodes from /comprar
 * (.yamuna-cart-depositions + .yamuna-cart-checkout-footer).
 * Does not recreate markup; clones live cart HTML.
 */
(function () {
  'use strict';

  var ROOT_ID = 'yamuna-checkout-extras';
  var FOOTER_ID = 'yamuna-checkout-extras-footer-root';
  var FETCHING = false;
  var CACHE = null;

  function isCheckoutPage() {
    return /\/checkout\//i.test(window.location.pathname);
  }

  function cartUrl() {
    try {
      if (window.LS && LS.store && LS.store.url) {
        return String(LS.store.url).replace(/\/$/, '') + '/comprar';
      }
    } catch (e) {}
    return window.location.origin + '/comprar';
  }

  function alreadyMounted() {
    if (document.getElementById(ROOT_ID) && document.getElementById(FOOTER_ID)) return true;
    /* NubeSDK already renders reviews + footer — avoid duplicate */
    if (document.getElementById('yamuna-cart-reviews') || document.getElementById('yamuna-018-steps')) {
      return true;
    }
    return false;
  }

  function initDepositionsCarousel(root) {
    if (!root) return;
    if (typeof window.yamunaInitCartDepositions === 'function') {
      try { window.yamunaInitCartDepositions(); } catch (e) {}
      return;
    }
    var el = root.querySelector('.js-swiper-cart-dep');
    if (!el) return;
    var slides = el.querySelectorAll('.swiper-slide');
    if (slides.length < 2) return;
    var idx = 0;
    function show(i) {
      slides.forEach(function (s, n) {
        s.style.display = n === i ? 'block' : 'none';
      });
      idx = i;
    }
    show(0);
    var prev = root.querySelector('.js-swiper-cart-dep-prev');
    var next = root.querySelector('.js-swiper-cart-dep-next');
    if (prev) prev.onclick = function () { show((idx - 1 + slides.length) % slides.length); };
    if (next) next.onclick = function () { show((idx + 1) % slides.length); };
    setInterval(function () { show((idx + 1) % slides.length); }, 5500);
  }

  function mountFromHtml(html) {
    if (alreadyMounted()) return true;
    var doc;
    try {
      doc = new DOMParser().parseFromString(html, 'text/html');
    } catch (e) {
      return false;
    }

    var dep = doc.querySelector('.yamuna-cart-depositions');
    var foot = doc.querySelector('.yamuna-cart-checkout-footer');
    if (!dep || !foot) return false;

    var wrap = document.createElement('div');
    wrap.id = ROOT_ID;
    wrap.className = 'yamuna-checkout-extras';
    wrap.appendChild(document.importNode(dep, true));

    var footerWrap = document.createElement('div');
    footerWrap.id = FOOTER_ID;
    footerWrap.className = 'yamuna-checkout-extras-footer-root';
    footerWrap.appendChild(document.importNode(foot, true));

    document.body.appendChild(wrap);
    document.body.appendChild(footerWrap);

    /* Run inline scripts from cloned dep (init function) + local carousel */
    try {
      var scripts = wrap.querySelectorAll('script');
      scripts.forEach(function (old) {
        var s = document.createElement('script');
        s.textContent = old.textContent;
        old.parentNode.replaceChild(s, old);
      });
    } catch (e2) {}
    setTimeout(function () {
      initDepositionsCarousel(wrap.querySelector('.yamuna-cart-depositions'));
    }, 50);
    return true;
  }

  function fetchAndMount() {
    if (!isCheckoutPage() || alreadyMounted() || FETCHING) return;
    if (CACHE) {
      mountFromHtml(CACHE);
      return;
    }
    FETCHING = true;
    fetch(cartUrl(), { credentials: 'same-origin', cache: 'force-cache' })
      .then(function (r) {
        if (!r.ok) throw new Error('cart fetch ' + r.status);
        return r.text();
      })
      .then(function (html) {
        CACHE = html;
        mountFromHtml(html);
      })
      .catch(function () {
        /* silent — checkout must not break */
      })
      .finally(function () {
        FETCHING = false;
      });
  }

  function hideRemoveButtons() {
    var sels = [
      '.summary [data-testid="remove-product"]',
      '.summary [data-testid="product-remove"]',
      '.summary button[aria-label*="emove" i]',
      '.summary a[aria-label*="emove" i]',
      '.table-product-name button',
      '.summary .js-remove-product',
      '.summary .product-remove'
    ];
    sels.forEach(function (sel) {
      try {
        document.querySelectorAll(sel).forEach(function (el) {
          el.style.display = 'none';
        });
      } catch (e) {}
    });
  }

  function run() {
    if (!isCheckoutPage()) return;
    fetchAndMount();
    hideRemoveButtons();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', run);
  } else {
    run();
  }

  if (window.MutationObserver) {
    var timer = null;
    new MutationObserver(function () {
      clearTimeout(timer);
      timer = setTimeout(run, 300);
    }).observe(document.documentElement, { childList: true, subtree: true });
  }
})();
