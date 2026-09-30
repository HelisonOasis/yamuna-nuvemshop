/**
 * Injects yamuna-checkout-fix.css + .js on platform checkout pages.
 * Appends AFTER dart-checkout so our â‰¤1024 layout rules win.
 */
(function () {
  if (!/\/checkout\//i.test(location.pathname)) return;

  var base =
    'https://d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static';
  var v = '140';

  function injectCss() {
    var existing = document.getElementById('yamuna-checkout-fix-css');
    if (existing) existing.remove();
    var link = document.createElement('link');
    link.id = 'yamuna-checkout-fix-css';
    link.rel = 'stylesheet';
    link.href = base + '/css/yamuna-checkout-fix.css?v=' + v;
    (document.body || document.documentElement).appendChild(link);
  }

  function injectJs() {
    if (document.getElementById('yamuna-checkout-fix-js')) return;
    var s = document.createElement('script');
    s.id = 'yamuna-checkout-fix-js';
    s.async = true;
    s.src = base + '/js/yamuna-checkout-fix.js?v=' + v;
    (document.body || document.documentElement).appendChild(s);
  }

  function run() {
    injectCss();
    injectJs();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', run);
  } else {
    run();
  }
  // Re-append after late dart-checkout link if needed
  window.addEventListener('load', function () {
    injectCss();
  });
})();
