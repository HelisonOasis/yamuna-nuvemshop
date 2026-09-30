/**
 * Yamuna — NubeSDK checkout snippet
 *
 * 018 — Custom checkout steps (same UI as /comprar) in after_header
 * Reviews + footer (after_main_content)
 *
 * Paste into Admin → Configurações → Checkout → Códigos personalizados.
 */
const YAMUNA_STATIC = "https://d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static/images/yamuna";
const YAMUNA_CHECKOUT_FIX_BASE = "https://d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static";
const YAMUNA_CHECKOUT_FIX_V = "123";
const PAYMENT_LOGOS = "https://d26lpennugtm8s.cloudfront.net/assets/common/img/logos/payment/new_logos_payment";
const FOOTER_TEXT = "#f3f3f3";
const ACCENT = "#a31460";
const MUTED = "#9a9a9a";
const LINE = "#d9d9d9";
const ROBOTO_FONT_HREF =
  "https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700&display=swap";

const browser = nube.getBrowserAPIs();

function getCheckoutDoc() {
  try {
    return (browser && browser.document) || (typeof document !== "undefined" ? document : null);
  } catch (e) {
    return null;
  }
}

function ensureDualCta(doc) {
  if (!doc) return;
  try {
    const CART =
      (doc.defaultView && doc.defaultView.location
        ? String(doc.defaultView.location.origin).replace(/\/$/, "")
        : "") + "/comprar";
    function visible(el) {
      if (!el) return false;
      if (el.disabled) return false;
      const cs = (doc.defaultView || window).getComputedStyle(el);
      if (cs.display === "none" || cs.visibility === "hidden" || cs.opacity === "0") return false;
      return el.offsetWidth > 0 || el.offsetHeight > 0 || el.getClientRects().length > 0;
    }
    function findPrimary() {
      const finish = doc.getElementById("btnFinishCheckout");
      if (finish && finish.parentNode && visible(finish)) return finish;
      const selectors = [
        "#main-column #btn-submit-step",
        "#main-column .btn-submit-step.btn-primary",
        "#main-column button.btn-primary.btn-submit-step",
        "#main-column form button.btn-primary[type='submit']",
        "#main-column button.btn-primary",
        "#main-column .btn.btn-primary",
        "button.btn-submit-step.btn-primary",
        "button#btn-submit-step",
        ".btn-submit-step",
      ];
      for (let s = 0; s < selectors.length; s++) {
        const nodes = doc.querySelectorAll(selectors[s]);
        for (let i = 0; i < nodes.length; i++) {
          if (nodes[i].parentNode && visible(nodes[i])) return nodes[i];
        }
      }
      return null;
    }
    const primary = findPrimary();
    if (!primary || !primary.parentNode) return;
    let row = doc.getElementById("yamuna-checkout-cta-row");
    if (!row) {
      row = doc.createElement("div");
      row.id = "yamuna-checkout-cta-row";
      row.className = "yamuna-checkout-cta-row";
      primary.parentNode.insertBefore(row, primary);
    }
    if (primary.parentNode !== row) row.appendChild(primary);
    let link = doc.getElementById("yamuna-continue-shopping");
    if (!link) {
      link = doc.createElement("a");
      link.id = "yamuna-continue-shopping";
      link.className = "yamuna-continue-shopping";
      link.textContent = "Continuar comprando";
      row.insertBefore(link, primary);
    }
    link.href = CART;
    if (link.parentNode !== row) row.insertBefore(link, primary);
    if (primary.id === "btnFinishCheckout") row.classList.add("yamuna-checkout-cta-row--finish");
    else row.classList.remove("yamuna-checkout-cta-row--finish");
  } catch (e) {}
}

/* Inject checkout QA fix CSS/JS into the real checkout document */
function injectYamunaCheckoutFix() {
  try {
    const doc = getCheckoutDoc();
    if (!doc) return false;
    const head = doc.head || doc.documentElement;
    if (!head) return false;
    if (!doc.getElementById("yamuna-roboto-font")) {
      const font = doc.createElement("link");
      font.id = "yamuna-roboto-font";
      font.rel = "stylesheet";
      font.href = ROBOTO_FONT_HREF;
      head.appendChild(font);
    }
    /* 039 — inline critical thumb fix (wins even if CDN CSS lags) */
    if (!doc.getElementById("yamuna-039-thumb-bg")) {
      const style = doc.createElement("style");
      style.id = "yamuna-039-thumb-bg";
      style.textContent = [
        "html body .summary-img-wrap,",
        "html body td.summary-img-wrap,",
        "html body .summary-img,",
        "html body .summary-img-thumb,",
        "html body .summary-img-wrap .summary-img,",
        "html body .summary-img-wrap .summary-img-thumb{",
        "background:transparent!important;background-color:transparent!important;",
        "box-shadow:none!important;border:0!important;isolation:auto!important;",
        "}",
        "html body .summary-img-wrap img,",
        "html body .summary-img-thumb img,",
        "html body .summary-img img,",
        "html body td.summary-img-wrap img{",
        "background:transparent!important;background-color:transparent!important;",
        "mix-blend-mode:darken!important;",
        "}",
      ].join("");
      head.appendChild(style);
    }
    /* Force Finalizar compra on #btnFinishCheckout (any span / no id) */
    if (!doc.getElementById("yamuna-finish-label-fix")) {
      const style = doc.createElement("style");
      style.id = "yamuna-finish-label-fix";
      style.textContent = [
        "html body #btnFinishCheckout{font-size:0!important;}",
        "html body #btnFinishCheckout>*,html body #btnFinishCheckout span{",
        "display:none!important;visibility:hidden!important;opacity:0!important;",
        "font-size:0!important;color:transparent!important;width:0!important;height:0!important;",
        "overflow:hidden!important;position:absolute!important;pointer-events:none!important;",
        "}",
        "html body #btnFinishCheckout::after{",
        'content:"Finalizar compra"!important;display:inline-block!important;',
        "visibility:visible!important;opacity:1!important;position:static!important;",
        "font-size:14px!important;line-height:40px!important;",
        "font-family:Raleway,sans-serif!important;font-style:normal!important;font-weight:600!important;",
        "color:#fff!important;text-transform:uppercase!important;",
        "width:auto!important;height:auto!important;overflow:visible!important;",
        "}",
      ].join("");
      head.appendChild(style);
    }
    /* White surfaces + dual CTA (inline so it wins even if CDN lags) */
    if (!doc.getElementById("yamuna-checkout-surfaces-cta")) {
      const style = doc.createElement("style");
      style.id = "yamuna-checkout-surfaces-cta";
        "html body .form-control,html body input.form-control,html body textarea.form-control,html body select.form-control,",
        "html body .has-float-label .form-control,html body #main-column .form-control,",
        "html body #main-column .form-group input:not([type='checkbox']):not([type='radio']):not([type='hidden']),",
        "html body #main-column .has-float-label input{",
        "background:#fff!important;background-color:#fff!important;}",
        "html body .panel,html body #main-column .panel,html body .panel-header,html body .panel-header-sticky,",
        "html body #main-column h3.panel-header,html body .panel-body,html body .box-container,",
        "html body #main-column .box-container,html body .accordion,html body .form-options-content,",
        "html body #yamuna-cart-reviews,html body #secondary-column .summary,html body #secondary-column{",
        "background:transparent!important;background-color:transparent!important;box-shadow:none!important;}",
        "html body .shipping-option,html body .radio.shipping-option,html body .address-summary,",
        "html body .payment-option,html body .radio.payment-option,html body .radio-content.payment-option-content,",
        "html body .panel.summary-details,html body .summary-details,html body #secondary-column .summary-details,",
        "html body [data-testid='cart-details-desktop'],html body #shipping-review,html body #shipping-review.panel,",
        "html body .panel-saved-address-box-review-block,html body .panel.panel-saved-address-box-review-block{",
        "background:#fff!important;background-color:#fff!important;}",
        "html body .panel.summary-details,html body .summary-details,html body [data-testid='cart-details-desktop']{",
        "border:1px solid rgba(0,0,0,.1)!important;border-radius:10px!important;overflow:hidden!important;}",
        "html body .shipping-option,html body .radio.shipping-option{",
        "border-radius:10px!important;overflow:hidden!important;margin-bottom:12px!important;}",
        "html body .shipping-option.active,html body .radio.shipping-option.active{",
        "border:2px solid #a31460!important;border-radius:10px!important;overflow:hidden!important;background:#fff!important;}",
        "html body #main-column .form-group,html body #main-column .has-float-label{margin-bottom:12px!important;}",
        "html body #main-column .checkbox,html body #main-column label.checkbox{display:block!important;margin-top:12px!important;}",
        "html body .yamuna-checkout-cta-row{display:flex!important;gap:12px!important;width:100%!important;",
        "margin:16px 0 8px!important;padding:0!important;box-sizing:border-box!important;align-items:center!important;",
        "background:transparent!important;}",
        "html body a.yamuna-continue-shopping{display:flex!important;flex:1 1 0!important;align-items:center!important;",
        "justify-content:center!important;height:40px!important;min-height:40px!important;padding:0 16px!important;",
        "border:1px solid #a31460!important;border-radius:40px!important;background:#fff!important;color:#a31460!important;",
        "font-family:Raleway,sans-serif!important;font-size:14px!important;font-weight:600!important;",
        "text-decoration:none!important;text-transform:uppercase!important;box-sizing:border-box!important;}",
        "html body .yamuna-checkout-cta-row #btnFinishCheckout,",
        "html body .yamuna-checkout-cta-row--finish #btnFinishCheckout{",
        "flex:1 1 0!important;width:auto!important;max-width:none!important;margin:0!important;",
        "background:#238482!important;border:0!important;border-radius:40px!important;color:#fff!important;}",
        "html body .yamuna-checkout-cta-row .btn-primary,",
        "html body .yamuna-checkout-cta-row .btn-submit-step{",
        "flex:1 1 0!important;width:auto!important;max-width:none!important;margin:0!important;}",
        "@media (max-width:480px){html body .yamuna-checkout-cta-row{flex-direction:column!important;}",
        "html body a.yamuna-continue-shopping,html body .yamuna-checkout-cta-row .btn-primary{width:100%!important;flex:none!important;}}",
      ].join("");
      head.appendChild(style);
    }
    /* Payment select alert — Raleway + inset padding + below options */
    if (!doc.getElementById("yamuna-payment-alert-fix")) {
      const style = doc.createElement("style");
      style.id = "yamuna-payment-alert-fix";
      style.textContent = [
        "#checkout-payment-options{display:flex!important;flex-direction:column!important;}",
        "#checkout-payment-options>.alert.alert-danger,",
        "#main-column .alert.alert-danger.m-bottom.full-width{",
        "order:50!important;padding:8px 20px 10px!important;margin:12px 0 8px!important;",
        'font-family:"Raleway",Raleway,sans-serif!important;font-size:13px!important;',
        "font-weight:500!important;font-style:normal!important;line-height:1.4!important;",
        "color:#db3e3e!important;box-sizing:border-box!important;",
        "}",
        "#checkout-payment-options>.alert.alert-danger span,",
        "#checkout-payment-options>.alert.alert-danger *,",
        "#main-column .alert.alert-danger.m-bottom.full-width span,",
        "#main-column .alert.alert-danger.m-bottom.full-width *{",
        'font-family:"Raleway",Raleway,sans-serif!important;font-size:13px!important;',
        "font-weight:500!important;color:#db3e3e!important;",
        "}",
      ].join("");
      head.appendChild(style);
    }
    function renameFinish() {
      try {
        const label = "Finalizar compra";
        const finish = doc.getElementById("btnFinishCheckout");
        if (finish) {
          const spans = finish.querySelectorAll("span");
          for (let i = 0; i < spans.length; i++) {
            const t = ((spans[i].textContent || "") + "").replace(/\s+/g, " ").trim().toLowerCase();
            if (t === "fazer pedido" || /fazer\s+pedido/.test(t)) spans[i].textContent = label;
          }
        }
      } catch (e) {}
    }
    renameFinish();
    if (!doc.documentElement.getAttribute("data-yamuna-finish-obs")) {
      doc.documentElement.setAttribute("data-yamuna-finish-obs", "1");
      try {
        const win = doc.defaultView || window;
        win.setInterval(renameFinish, 600);
        if (win.MutationObserver) {
          new win.MutationObserver(renameFinish).observe(doc.documentElement, {
            childList: true,
            subtree: true,
            characterData: true,
          });
        }
      } catch (e2) {}
    }

    const cssHref = `${YAMUNA_CHECKOUT_FIX_BASE}/css/yamuna-checkout-fix.css?v=${YAMUNA_CHECKOUT_FIX_V}`;
    let link = doc.getElementById("yamuna-checkout-fix-css");
    if (!link) {
      link = doc.createElement("link");
      link.id = "yamuna-checkout-fix-css";
      link.rel = "stylesheet";
      link.href = cssHref;
      head.appendChild(link);
    }

    const jsSrc = `${YAMUNA_CHECKOUT_FIX_BASE}/js/yamuna-checkout-fix.js?v=${YAMUNA_CHECKOUT_FIX_V}`;
    let s = doc.getElementById("yamuna-checkout-fix-js");
    if (!s) {
      s = doc.createElement("script");
      s.id = "yamuna-checkout-fix-js";
      s.async = true;
      s.src = jsSrc;
      (doc.body || head).appendChild(s);
    }

    ensureDualCta(doc);
    if (!doc.documentElement.getAttribute("data-yamuna-cta-obs")) {
      doc.documentElement.setAttribute("data-yamuna-cta-obs", "1");
      try {
        const win = doc.defaultView || window;
        win.setInterval(function () {
          ensureDualCta(doc);
        }, 700);
        if (win.MutationObserver) {
          new win.MutationObserver(function () {
            ensureDualCta(doc);
          }).observe(doc.documentElement, { childList: true, subtree: true });
        }
      } catch (e3) {}
    }
    return true;
  } catch (e) {
    return false;
  }
}

injectYamunaCheckoutFix();
try {
  const bootWin =
    (getCheckoutDoc() && getCheckoutDoc().defaultView) ||
    (typeof window !== "undefined" ? window : null);
  if (bootWin && bootWin.setInterval) {
    let boots = 0;
    const bootTimer = bootWin.setInterval(function () {
      boots++;
      injectYamunaCheckoutFix();
      if (boots >= 20) bootWin.clearInterval(bootTimer);
    }, 500);
  }
} catch (eBoot) {}

const stepIcon = (name) => `${YAMUNA_STATIC}/step-${name}.svg`;

const circleStyle = (mode) => ({
  width: "36px",
  height: "36px",
  borderRadius: "50%",
  border: `2px solid ${mode === "muted" ? MUTED : ACCENT}`,
  background: mode === "current" ? ACCENT : "#ffffff",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  boxSizing: "border-box",
});

const labelStyle = (mode) => ({
  fontFamily: '"Roboto", Roboto, sans-serif',
  fontSize: "12px",
  fontWeight: "600",
  lineHeight: "1.2",
  color: mode === "muted" ? MUTED : ACCENT,
  margin: "6px 0 0",
  textAlign: "center",
});

const lineStyle = (done) => ({
  flex: "1 1 0",
  height: "2px",
  margin: "17px 4px 0",
  background: done ? ACCENT : LINE,
  alignSelf: "flex-start",
  minWidth: "8px",
});

const stepColumnStyle = {
  flex: "0 1 auto",
  minWidth: "0",
  maxWidth: "80px",
  textAlign: "center",
  alignItems: "center",
};

function renderCheckoutSteps(step) {
  injectYamunaCheckoutFix();
  const pago = step === "pagamento";
  const entregaMode = pago ? "done" : "current";
  const pagamentoMode = pago ? "current" : "muted";

  nube.render("after_header", [
    <Box
      key="yamuna-018-steps"
      id="yamuna-018-steps"
      direction="row"
      alignItems="flex-start"
      justifyContent="space-between"
      width="100%"
      style={{
        width: "100%",
        maxWidth: "420px",
        margin: "8px auto 20px",
        padding: "8px 4px 4px",
        boxSizing: "border-box",
      }}
    >
      <Box direction="col" alignItems="center" style={{ flex: "0 1 auto", minWidth: "0", maxWidth: "80px", textAlign: "center", alignItems: "center", position: "relative" }}>
        <Box style={circleStyle("done")}>
          <Image src={stepIcon("cart")} alt="" width="18px" height="18px" style={{ width: "18px", height: "18px" }} />
        </Box>
        <Text style={labelStyle("done")}>Carrinho</Text>
        <Button
          id="yamuna-018-carrinho-hit"
          variant="transparent"
          ariaLabel="Voltar ao carrinho"
          onClick={() => browser.navigate("/comprar")}
          style={{
            position: "absolute",
            left: "0",
            top: "0",
            width: "100%",
            height: "100%",
            opacity: 0.01,
            cursor: "pointer",
            margin: "0",
            padding: "0",
            border: "none",
            background: "transparent",
            zIndex: 2,
          }}
        >
          Carrinho
        </Button>
      </Box>

      <Box style={lineStyle(true)} />

      <Box direction="col" alignItems="center" style={stepColumnStyle}>
        <Box style={circleStyle(entregaMode)}>
          <Image
            src={stepIcon(entregaMode === "current" ? "truck-white" : "truck")}
            alt=""
            width="18px"
            height="18px"
            style={{ width: "18px", height: "18px" }}
          />
        </Box>
        <Text style={labelStyle(entregaMode === "muted" ? "muted" : "done")}>Entrega</Text>
      </Box>

      <Box style={lineStyle(pago)} />

      <Box direction="col" alignItems="center" style={stepColumnStyle}>
        <Box style={circleStyle(pagamentoMode)}>
          <Image
            src={stepIcon(
              pagamentoMode === "current" ? "card-white" : pagamentoMode === "done" ? "card" : "card-muted"
            )}
            alt=""
            width="18px"
            height="18px"
            style={{ width: "18px", height: "18px" }}
          />
        </Box>
        <Text style={labelStyle(pagamentoMode === "current" ? "done" : "muted")}>Pagamento</Text>
      </Box>
    </Box>,
  ]);
}

function detectCheckoutStep(payload) {
  try {
    const page = payload && payload.location && payload.location.page;
    const step = page && page.data && page.data.step;
    if (step === "payment" || step === "next" || step === "pagamento" || step === "success") return "pagamento";
  } catch (e) {}
  try {
    const path = String((payload && payload.location && payload.location.url) || "");
    if (/\/checkout\/v3\/next\//i.test(path) || /\/payment/i.test(path) || /\/checkout\/v3\/success\//i.test(path) || /\/success/i.test(path)) return "pagamento";
  } catch (e2) {}
  return "entrega";
}

renderCheckoutSteps("entrega");
nube.on("checkout:ready", (payload) => {
  injectYamunaCheckoutFix();
  renderCheckoutSteps(detectCheckoutStep(payload));
});
nube.on("location:updated", (payload) => {
  injectYamunaCheckoutFix();
  renderCheckoutSteps(detectCheckoutStep(payload));
});

const REVIEWS = [
  {
    text: "Produtos de excelente qualidade! Vale muito a pena o investimento. Meu queridinho é o Golden Milk e também a Ghee. E que dizer desses cafés? Gente do céu... surreal de maravilhoso. Gosto de tudo e estou sempre comprando os meus queridos e experimentando novas opções. Obrigada, Yamuna, pelo carinho e amor de vocês em forma de nutrição com excelência.",
    author: "Raquel Cassiano",
  },
  {
    text: "Todos os produtos são de altíssima qualidade e deliciosos, nenhuma outra marca chega perto, especialmente o Ghee, ideal de coco e melhor de tamarindo. Se não bastasse isso, ainda prestam o melhor atendimento ao consumidor que já vi no Brasil! Tive um problema com o melhor de tamarindo, entrei em contato e me enviaram um novo pote sem custo, mesmo o problema ocorrendo vários meses após a compra. O cuidado e carinho com os clientes é sensacional!",
    author: "Thiago P",
  },
  {
    text: "Apaixonada pelos produtos da Yamuna! Tudo muito bem feito, com produtos de qualidade, as embalagens são lindas e quando eu abro a caixa eu sinto o carinho que eles colocaram em cada detalhe. Além de tudo isso, eles contribuem com a minha saúde com esses produtos tão especiais que a gente não encontra em qualquer lugar! Obrigada por existirem!",
    author: "Kelly Cristina Amaral",
  },
  {
    text: "Destaque para o cuidado na embalagem dos produtos, e agora é só saborear tudo perfeitamente preparado e oferecido com carinho, a energia e grande luz da Deusa Yamuna!",
    author: "Bernadete Pinho",
  },
];

let reviewIndex = 0;
let reviewAutoplayTimer = null;

const navBtnStyle = (dir) => ({
  width: "32px",
  height: "32px",
  minWidth: "32px",
  minHeight: "32px",
  margin: "0",
  padding: "0",
  border: "none",
  borderRadius: "50%",
  background:
    dir === "prev"
      ? "#238482 url(\"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='15 18 9 12 15 6'/%3E%3C/svg%3E\") center / 14px 14px no-repeat"
      : "#238482 url(\"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='9 18 15 12 9 6'/%3E%3C/svg%3E\") center / 14px 14px no-repeat",
  cursor: "pointer",
});

function goReview(delta, fromAutoplay) {
  reviewIndex = (reviewIndex + delta + REVIEWS.length) % REVIEWS.length;
  renderAfterMain();
  if (!fromAutoplay) startReviewAutoplay();
}

function startReviewAutoplay() {
  try {
    const doc = (browser && browser.document) || (typeof document !== "undefined" ? document : null);
    const win = (doc && doc.defaultView) || (typeof window !== "undefined" ? window : null);
    if (!win) return;
    if (reviewAutoplayTimer) {
      try { win.clearInterval(reviewAutoplayTimer); } catch (e) {}
    }
    reviewAutoplayTimer = win.setInterval(function () {
      goReview(1, true);
    }, 5500);
  } catch (e2) {}
}

const footerHeading = (label, margin) => (
  <Text
    color={FOOTER_TEXT}
    style={{
      fontFamily: "Raleway, sans-serif",
      fontSize: "16px",
      fontWeight: "700",
      lineHeight: "1.5",
      margin: margin || "0 0 16px",
      textTransform: "uppercase",
    }}
  >
    {label}
  </Text>
);

const footerItem = (label) => (
  <Text
    color={FOOTER_TEXT}
    style={{ fontFamily: "Raleway, sans-serif", fontSize: "16px", fontWeight: "300", lineHeight: "1.5", margin: "0 0 4px" }}
  >
    {label}
  </Text>
);

const footerColumnStyle = { flex: "1 1 150px", minWidth: "150px" };

const socialIcon = (name) => (
  <Image src={`${YAMUNA_STATIC}/${name}.svg`} alt={name} width="20px" height="20px" style={{ width: "20px", height: "20px" }} />
);

const paymentLogo = (path, alt) => (
  <Image
    src={`${PAYMENT_LOGOS}/${path}@2x.png`}
    alt={alt}
    height="22px"
    style={{ height: "22px", width: "auto", margin: "2px 4px 2px 0" }}
  />
);

function renderAfterMain() {
  const current = REVIEWS[reviewIndex] || REVIEWS[0];

  nube.render("after_main_content", [
  <Box
    key="yamuna-cart-reviews"
    id="yamuna-cart-reviews"
    width="100%"
    direction="col"
    gap={12}
    padding="16px"
    margin="24px 0 0"
    style={{
      width: "100%",
      maxWidth: "100%",
      minWidth: "0",
      marginLeft: "0",
      marginRight: "0",
      boxSizing: "border-box",
      border: "1px solid #d9d9d9",
      borderRadius: "16px",
      background: "#ffffff",
    }}
  >
    <Box
      direction="col"
      gap={8}
      className="yamuna-nube-review-body"
      style={{
        flex: "1 1 auto",
        minHeight: "0",
        width: "100%",
        overflow: "hidden",
      }}
    >
      <Text color="#F4C744" style={{ fontSize: "14px", letterSpacing: "1px", margin: "0" }}>★★★★★</Text>
      <Text color="#393747" style={{ fontSize: "12px", lineHeight: "1.45", margin: "0", fontFamily: "Poppins, Roboto, sans-serif" }}>
        {current.text}
      </Text>
      <Text color="#393747" style={{ fontWeight: "700", fontSize: "13px", margin: "8px 0 0", fontFamily: "Raleway, sans-serif" }}>
        {current.author}
      </Text>
    </Box>

    <Box direction="row" alignItems="center" justifyContent="center" gap={12} className="yamuna-nube-review-nav" style={{ flexShrink: "0", marginTop: "4px" }}>
      <Button
        id="yamuna-review-prev"
        variant="transparent"
        ariaLabel="Depoimento anterior"
        onClick={() => goReview(-1)}
        style={navBtnStyle("prev")}
      >
        {" "}
      </Button>
      <Button
        id="yamuna-review-next"
        variant="transparent"
        ariaLabel="Próximo depoimento"
        onClick={() => goReview(1)}
        style={navBtnStyle("next")}
      >
        {" "}
      </Button>
    </Box>
  </Box>,

  <Box
    key="yamuna-checkout-footer"
    direction="col"
    style={{
      width: "100vw",
      maxWidth: "100vw",
      marginLeft: "calc(50% - 50vw)",
      marginRight: "calc(50% - 50vw)",
      marginTop: "48px",
      background: "#4a1d3a",
      color: FOOTER_TEXT,
      fontFamily: "Dosis, sans-serif",
      boxSizing: "border-box",
    }}
  >
    <Box
      direction="col"
      style={{ width: "100%", maxWidth: "1536px", margin: "0 auto", padding: "58px 48px 0", boxSizing: "border-box" }}
    >
      <Box
        direction="row"
        style={{
          flexWrap: "wrap",
          justifyContent: "space-between",
          alignItems: "flex-start",
          columnGap: "32px",
          rowGap: "32px",
          width: "100%",
          paddingBottom: "32px",
          boxSizing: "border-box",
        }}
      >
        <Box direction="col" style={{ flex: "0 0 22%", minWidth: "180px" }}>
          <Image
            src={`${YAMUNA_STATIC}/logo-yamuna-branco.png`}
            alt="Yamuna"
            width="174px"
            style={{ width: "174px", maxWidth: "100%", height: "auto", margin: "0 0 48px" }}
          />
          <Box direction="row" gap={12} alignItems="center">
            {socialIcon("facebook")}
            {socialIcon("instagram")}
            {socialIcon("youtube")}
            {socialIcon("whatsapp")}
          </Box>
        </Box>

        <Box direction="col" style={footerColumnStyle}>
          {footerHeading("Vendas")}
          {footerItem("Atendimento ao Cliente")}
          {footerItem("Revenda e Lojistas")}
          {footerItem("Contato via E-mail")}
          {footerItem("Comprar com WhatsApp")}
        </Box>

        <Box direction="col" style={footerColumnStyle}>
          {footerHeading("Institucional")}
          {footerItem("Quem Somos")}
          {footerItem("Aprenda")}
          {footerItem("Nosso Manifesto")}
          {footerItem("Política de Privacidade")}
          {footerItem("Trabalhe conosco")}
        </Box>

        <Box direction="col" style={footerColumnStyle}>
          {footerHeading("SAC")}
          {footerItem("Regras de frete grátis")}
          {footerItem("Trocas e Reembolsos")}
          {footerItem("Dúvidas frequentes")}
          {footerItem("Avalie-nos no Google")}
        </Box>

        <Box direction="col" style={footerColumnStyle}>
          {footerHeading("Entre em contato")}
          {footerItem("554884591522")}
          {footerItem("48984591522")}
          {footerItem("contato@yamuna.com.br")}
          {footerItem("Estrada Rozália Paulina Ferreira 1897")}
        </Box>

        <Box direction="col" style={footerColumnStyle}>
          {footerHeading("Minha conta")}
          {footerItem("Meus pedidos")}
          {footerItem("Minha conta")}
          {footerItem("Editar Cadastro")}
          {footerItem("Meus Endereços")}
        </Box>
      </Box>

      <Box
        direction="row"
        style={{
          flexWrap: "wrap",
          justifyContent: "space-between",
          alignItems: "center",
          columnGap: "32px",
          rowGap: "24px",
          width: "100%",
          padding: "24px 0",
          borderTop: "1px solid #a31460",
          borderBottom: "1px solid #a31460",
          boxSizing: "border-box",
        }}
      >
        <Box direction="row" alignItems="center" style={{ flexWrap: "wrap", columnGap: "48px", rowGap: "12px" }}>
          {footerHeading("Formas de pagamento", "0")}
          <Box direction="row" alignItems="center" style={{ flexWrap: "wrap" }}>
            {paymentLogo("visa", "visa")}
            {paymentLogo("mastercard", "mastercard")}
            {paymentLogo("amex", "amex")}
            {paymentLogo("diners", "diners")}
            {paymentLogo("br/aura", "aura")}
            {paymentLogo("br/bradesco", "bradesco")}
            {paymentLogo("br/elo", "elo")}
            {paymentLogo("br/hipercard", "hipercard")}
            {paymentLogo("br/discover", "discover")}
            {paymentLogo("santander", "santander")}
            {paymentLogo("payment-method-types/pix", "pix")}
          </Box>
        </Box>

        <Box direction="row" alignItems="center" style={{ flexWrap: "wrap", columnGap: "42px", rowGap: "12px" }}>
          {footerHeading("Segurança", "0")}
          <Box direction="row" alignItems="center" gap={16}>
            <Image src={`${YAMUNA_STATIC}/security-google.svg`} alt="Google Safe Browsing" style={{ width: "101px", height: "26px", objectFit: "contain" }} />
            <Image src={`${YAMUNA_STATIC}/security-site.svg`} alt="Site seguro" style={{ width: "68px", height: "32px", objectFit: "contain" }} />
            <Image src={`${YAMUNA_STATIC}/security-ssl.svg`} alt="SSL seguro" style={{ width: "57px", height: "41px", objectFit: "contain" }} />
          </Box>
        </Box>
      </Box>

      <Box
        direction="row"
        style={{
          flexWrap: "wrap",
          justifyContent: "space-between",
          alignItems: "center",
          columnGap: "24px",
          rowGap: "12px",
          width: "100%",
          padding: "17px 0",
          boxSizing: "border-box",
        }}
      >
        <Text color={FOOTER_TEXT} style={{ fontFamily: "Dosis, sans-serif", fontSize: "12px", fontWeight: "300", lineHeight: "1.5", margin: "0" }}>
          Copyright Yamuna Fábrica e Comercio de Produtos Naturais - 21555703000156 - 2026. Todos os direitos reservados. - Estrada Rozália Paulina Ferreira 1897
        </Text>
        <Image
          src={`${YAMUNA_STATIC}/logo-oasis-commerce.png`}
          alt="Oásis Commerce"
          width="72px"
          style={{ width: "72px", height: "auto", maxHeight: "22px" }}
        />
      </Box>
    </Box>
  </Box>,
  ]);
}

renderAfterMain();
startReviewAutoplay();
