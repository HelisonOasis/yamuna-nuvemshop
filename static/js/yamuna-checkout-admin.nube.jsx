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
const YAMUNA_CHECKOUT_FIX_V = "131";
const PAYMENT_LOGOS = "https://d26lpennugtm8s.cloudfront.net/assets/common/img/logos/payment/new_logos_payment";
const FOOTER_TEXT = "#f3f3f3";
const ACCENT = "#a31460";
const MUTED = "#9a9a9a";
const LINE = "#d9d9d9";

const browser = nube.getBrowserAPIs();

/* Carrega a versão atual das correções DOM (setas do slider, CTA e ajustes nativos). */
(function injectYamunaCheckoutFix() {
  try {
    const doc = (browser && browser.document) || (typeof document !== "undefined" ? document : null);
    if (!doc) return;
    const head = doc.head || doc.documentElement;
    const cssHref = `${YAMUNA_CHECKOUT_FIX_BASE}/css/yamuna-checkout-fix.css?v=${YAMUNA_CHECKOUT_FIX_V}`;
    const jsHref = `${YAMUNA_CHECKOUT_FIX_BASE}/js/yamuna-checkout-fix.js?v=${YAMUNA_CHECKOUT_FIX_V}`;
    let css = doc.getElementById("yamuna-checkout-fix-css");
    if (!css) {
      css = doc.createElement("link");
      css.id = "yamuna-checkout-fix-css";
      css.rel = "stylesheet";
      head.appendChild(css);
    }
    if (css.href !== cssHref) css.href = cssHref;
    const oldScript = doc.getElementById("yamuna-checkout-fix-js");
    if (oldScript && oldScript.src !== jsHref) oldScript.remove();
    if (!doc.getElementById("yamuna-checkout-fix-js")) {
      const script = doc.createElement("script");
      script.id = "yamuna-checkout-fix-js";
      script.async = true;
      script.src = jsHref;
      (doc.body || head).appendChild(script);
    }
  } catch (e) {}
})();

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
  fontFamily: "Raleway, sans-serif",
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

const CONTINUE_SHOPPING_SLOTS = {
  entrega: "after_billing_form",
  pagamento: "after_payment_options",
};

function renderContinueShopping(step) {
  const slot = CONTINUE_SHOPPING_SLOTS[step];
  Object.keys(CONTINUE_SHOPPING_SLOTS).forEach((key) => {
    if (CONTINUE_SHOPPING_SLOTS[key] !== slot) nube.clearSlot(CONTINUE_SHOPPING_SLOTS[key]);
  });
  nube.render(slot, [
    <Button
      key="yamuna-continue-shopping"
      id="yamuna-continue-shopping"
      variant="transparent"
      ariaLabel="Continuar comprando"
      onClick={() => browser.navigate("/comprar")}
    >
      Continuar comprando
    </Button>,
  ]);
}

function renderStep(payload) {
  const step = detectCheckoutStep(payload);
  renderCheckoutSteps(step);
  renderContinueShopping(step);
}

let initialState = null;
try {
  initialState = nube.getState();
} catch (e) {}
renderStep(initialState);
nube.on("checkout:ready", renderStep);
nube.on("location:updated", renderStep);

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

function goReview(delta) {
  reviewIndex = (reviewIndex + delta + REVIEWS.length) % REVIEWS.length;
  renderAfterMain();
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
  nube.render("after_main_content", [
  <Box
    key="yamuna-cart-reviews"
    id="yamuna-cart-reviews"
    width="calc(100% - 30px)"
    direction="col"
    gap={12}
    padding="16px"
    margin="32px 15px 0"
    style={{
      display: "flex",
      width: "calc(100% - 30px)",
      maxWidth: "calc(100% - 30px)",
      marginLeft: "15px",
      marginRight: "15px",
      boxSizing: "border-box",
      border: "1px solid #d9d9d9",
      borderRadius: "16px",
      background: "#ffffff",
      minHeight: "364px",
    }}
  >
    <Box direction="row" alignItems="center" gap={8} style={{ paddingBottom: "10px", borderBottom: "1px solid #eeeeee" }}>
      <Text
        color="#ffffff"
        style={{
          width: "20px",
          height: "20px",
          borderRadius: "50%",
          background: "#5fbbc6",
          fontSize: "13px",
          fontWeight: "700",
          lineHeight: "20px",
          textAlign: "center",
          margin: "0",
        }}
      >
        ★
      </Text>
      <Text color="#a31460" style={{ fontFamily: "Dosis, sans-serif", fontSize: "16px", fontWeight: "700", margin: "0" }}>
        O que estão dizendo sobre a Yamuna
      </Text>
    </Box>

    <Box direction="row" gap={16} style={{ flex: "1 1 auto", minHeight: "0", width: "100%", overflow: "hidden" }}>
      {REVIEWS.map((review, index) => (
        <Box
          key={`yamuna-review-${index}`}
          direction="col"
          gap={8}
          style={{
            display: index === reviewIndex ? "flex" : "none",
            flex: "1 1 0",
            minWidth: "0",
            overflow: "hidden",
          }}
        >
          <Text color="#F4C744" style={{ fontSize: "14px", letterSpacing: "1px", margin: "0" }}>★★★★★</Text>
          <Text color="#393747" style={{ fontFamily: "Roboto, Arial, sans-serif", fontSize: "12px", lineHeight: "1.45", margin: "0" }}>
            {review.text}
          </Text>
          <Text color="#393747" style={{ fontWeight: "700", fontSize: "13px", margin: "auto 0 0" }}>
            {review.author}
          </Text>
        </Box>
      ))}
    </Box>

    <Box direction="row" alignItems="center" justifyContent="center" gap={12} style={{ flexShrink: "0", marginTop: "4px" }}>
      <Button id="yamuna-review-prev" variant="transparent" ariaLabel="Depoimento anterior" onClick={() => goReview(-1)} style={navBtnStyle("prev")}> </Button>
      <Button id="yamuna-review-next" variant="transparent" ariaLabel="Próximo depoimento" onClick={() => goReview(1)} style={navBtnStyle("next")}> </Button>
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
