/**
 * Yamuna — COLE ESTE CÓDIGO no Admin → Checkout → Códigos personalizados
 * (pode substituir o código atual inteiro, ou colar no final se já tiver o snippet das etapas).
 *
 * Cria: Continuar comprando + botão principal (entrega/pagamento)
 * + CSS: #fff só em inputs/cards; gap 12px nos inputs
 */
const YAMUNA_CTA_V = "82";
const YAMUNA_CTA_BASE =
  "https://d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static";

(function yamunaDualCtaBoot() {
  const browser = typeof nube !== "undefined" && nube.getBrowserAPIs ? nube.getBrowserAPIs() : null;

  function doc() {
    try {
      return (browser && browser.document) || (typeof document !== "undefined" ? document : null);
    } catch (e) {
      return null;
    }
  }

  function injectCss(d) {
    if (!d || d.getElementById("yamuna-cta-inline-css")) return;
    const style = d.createElement("style");
    style.id = "yamuna-cta-inline-css";
    style.textContent = [
      "html body .panel,html body #main-column .panel,html body .panel-header,html body .panel-header-sticky,",
      "html body #main-column h3.panel-header,html body .panel-body,html body .box-container,",
      "html body #main-column .box-container,html body .form-options-content,html body #yamuna-cart-reviews{",
      "background:transparent!important;background-color:transparent!important;box-shadow:none!important;}",
      "html body .form-control,html body input.form-control,html body textarea.form-control,html body select.form-control{",
      "background:#fff!important;background-color:#fff!important;}",
      "html body .shipping-option,html body .radio.shipping-option,html body .address-summary,",
      "html body .payment-option{",
      "background:#fff!important;background-color:#fff!important;}",
      /* 082 — cupom acima do produto (inline = não depende do cache CDN) */
      "html body #secondary-column .summary-details.panel,",
      "html body #secondary-column .summary-details.panel.p-none,",
      "html body #secondary-column [data-testid='cart-details-desktop']{",
      "display:flex!important;flex-direction:column!important;gap:0!important;",
      "background:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;}",
      "html body #secondary-column .summary-details>.table.table-scrollable{",
      "order:1!important;margin:0!important;padding:16px 16px 8px!important;background:#fff!important;",
      "border:1px solid rgba(0,0,0,.1)!important;border-bottom:0!important;border-radius:10px 10px 0 0!important;}",
      "html body #secondary-column .summary-details>.table-subtotal{",
      "order:2!important;margin:0!important;padding:8px 16px 16px!important;background:#fff!important;",
      "border:1px solid rgba(0,0,0,.1)!important;border-top:0!important;border-radius:0 0 10px 10px!important;}",
      "html body .summary-details .summary-coupon,",
      "html body #secondary-column .summary-details .summary-coupon,",
      "html body #main-row #secondary-column .summary-coupon,",
      "html body #main-row #secondary-column .summary-details .summary-coupon{",
      "order:-1!important;display:flex!important;flex-direction:column!important;visibility:visible!important;",
      "height:auto!important;max-height:none!important;margin:0 0 12px!important;padding:16px!important;",
      "overflow:visible!important;opacity:1!important;width:100%!important;box-sizing:border-box!important;",
      "background:#fff!important;border:1px solid rgba(0,0,0,.1)!important;border-radius:10px!important;}",
      "html body #secondary-column .summary-coupon::before{",
      "content:'Cupom de desconto'!important;display:block!important;margin:0 0 12px!important;",
      "padding-left:24px!important;color:#000!important;font-family:Raleway,sans-serif!important;",
      "font-size:16px!important;font-weight:700!important;",
      "background:url(\"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23a31460' d='M21.41 11.58l-9-9A2 2 0 0 0 11 2H4a2 2 0 0 0-2 2v7a2 2 0 0 0 .59 1.42l9 9a2 2 0 0 0 2.82 0l7-7a2 2 0 0 0 0-2.84zM5.5 7A1.5 1.5 0 1 1 7 5.5 1.5 1.5 0 0 1 5.5 7z'/%3E%3C/svg%3E\") left center/16px no-repeat!important;}",
      "html body .summary-coupon.d-md-none{display:none!important;}",
      "html body .shipping-option,html body .radio.shipping-option{margin-bottom:12px!important;border-radius:10px!important;}",
      "html body #main-column .form-group,html body #main-column .has-float-label{margin-bottom:12px!important;}",
      "html body #main-column .checkbox,html body #main-column label.checkbox{display:block!important;margin-top:12px!important;}",
      "html body .yamuna-checkout-cta-row{display:flex!important;gap:12px!important;width:100%!important;",
      "margin:16px 0 8px!important;padding:0!important;align-items:center!important;background:transparent!important;}",
      "html body a.yamuna-continue-shopping{display:flex!important;flex:1 1 0!important;align-items:center!important;",
      "justify-content:center!important;height:40px!important;padding:0 16px!important;border:1px solid #a31460!important;",
      "border-radius:40px!important;background:#fff!important;color:#a31460!important;",
      "font-family:Raleway,sans-serif!important;font-size:14px!important;font-weight:600!important;",
      "text-decoration:none!important;text-transform:uppercase!important;}",
      "html body .yamuna-checkout-cta-row .btn-primary,html body .yamuna-checkout-cta-row .btn-submit-step,",
      "html body .yamuna-checkout-cta-row #btnFinishCheckout{flex:1 1 0!important;width:auto!important;margin:0!important;}",
      "html body .yamuna-checkout-cta-row #btnFinishCheckout{background:#238482!important;border:0!important;",
      "border-radius:40px!important;color:#fff!important;}",
    ].join("");
    (d.head || d.documentElement).appendChild(style);

    if (!d.getElementById("yamuna-checkout-fix-css")) {
      const link = d.createElement("link");
      link.id = "yamuna-checkout-fix-css";
      link.rel = "stylesheet";
      link.href = YAMUNA_CTA_BASE + "/css/yamuna-checkout-fix.css?v=" + YAMUNA_CTA_V;
      (d.head || d.documentElement).appendChild(link);
    }

    if (!d.getElementById("yamuna-checkout-fix-js")) {
      const s = d.createElement("script");
      s.id = "yamuna-checkout-fix-js";
      s.async = true;
      s.src = YAMUNA_CTA_BASE + "/js/yamuna-checkout-fix.js?v=" + YAMUNA_CTA_V;
      (d.body || d.head || d.documentElement).appendChild(s);
    }
  }

  function visible(el, d) {
    if (!el || el.disabled) return false;
    const cs = (d.defaultView || window).getComputedStyle(el);
    if (cs.display === "none" || cs.visibility === "hidden") return false;
    return el.offsetWidth > 0 || el.offsetHeight > 0 || el.getClientRects().length > 0;
  }

  function findPrimary(d) {
    const finish = d.getElementById("btnFinishCheckout");
    if (finish && finish.parentNode && visible(finish, d)) return finish;
    const sels = [
      "#main-column .btn-submit-step",
      "#main-column button.btn-primary.btn-submit-step",
      ".btn-submit-step",
      "#main-column button.btn-primary",
    ];
    for (let s = 0; s < sels.length; s++) {
      const nodes = d.querySelectorAll(sels[s]);
      for (let i = 0; i < nodes.length; i++) {
        if (nodes[i].parentNode && visible(nodes[i], d)) return nodes[i];
      }
    }
    return null;
  }

  function ensureCta() {
    const d = doc();
    if (!d) return;
    injectCss(d);
    const primary = findPrimary(d);
    if (!primary || !primary.parentNode) return;
    const CART =
      (d.defaultView && d.defaultView.location
        ? String(d.defaultView.location.origin).replace(/\/$/, "")
        : "") + "/comprar";
    let row = d.getElementById("yamuna-checkout-cta-row");
    if (!row) {
      row = d.createElement("div");
      row.id = "yamuna-checkout-cta-row";
      row.className = "yamuna-checkout-cta-row";
      primary.parentNode.insertBefore(row, primary);
    }
    if (primary.parentNode !== row) row.appendChild(primary);
    let link = d.getElementById("yamuna-continue-shopping");
    if (!link) {
      link = d.createElement("a");
      link.id = "yamuna-continue-shopping";
      link.className = "yamuna-continue-shopping";
      link.textContent = "Continuar comprando";
      row.insertBefore(link, primary);
    }
    link.href = CART;
    if (link.parentNode !== row) row.insertBefore(link, primary);
    if (primary.id === "btnFinishCheckout") row.classList.add("yamuna-checkout-cta-row--finish");
    else row.classList.remove("yamuna-checkout-cta-row--finish");
  }

  ensureCta();
  try {
    const d = doc();
    const win = (d && d.defaultView) || (typeof window !== "undefined" ? window : null);
    if (win) {
      win.setInterval(ensureCta, 700);
      if (win.MutationObserver && d) {
        new win.MutationObserver(ensureCta).observe(d.documentElement, {
          childList: true,
          subtree: true,
        });
      }
    }
  } catch (e) {}

  if (typeof nube !== "undefined" && nube.on) {
    nube.on("checkout:ready", ensureCta);
    nube.on("location:updated", ensureCta);
  }
})();
