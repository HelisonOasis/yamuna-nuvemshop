/**
 * Loader — loads yamuna-checkout-extras.js on platform checkout only.
 * Paste this into GTM / Códigos externos, OR keep as the active injection path.
 */
(function () {
  if (!/\/checkout\//i.test(location.pathname)) return;
  if (document.getElementById('yamuna-checkout-extras-loader')) return;
  var s = document.createElement('script');
  s.id = 'yamuna-checkout-extras-loader';
  s.async = true;
  s.src =
    'https://d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static/js/yamuna-checkout-extras.js?v=6';
  (document.head || document.documentElement).appendChild(s);
})();
