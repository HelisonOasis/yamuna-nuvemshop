# Relatório de Performance — Yamuna Nuvemshop

**Branch:** `perf/opt-pack-v1`  
**Data das medições:** 2026-09-23 (UTC-3)  
**Escopo:** diagnóstico apenas — **nenhuma alteração publicada em produção / FTP**  
**Regra do projeto:** `.cursor/rules/no-prod-ftp-during-perf.mdc`  
**Loja medida:** https://yamuna.com.br/  
**Modelo de tema:** legado FTP (sem preview/draft Ipanema)

Este documento é a base para um pacote futuro de otimizações. Cada item tem evidência, impacto estimado e direção de solução (sem implementar agora).

---

## 1. Resumo executivo

O site está lento principalmente por **peso estrutural do tema**, repetido em **todas** as páginas:

1. **HTML enorme** (0,5–1,3 MB por página no download; DOM até ~2 MB na home).
2. **CSS async monólito** (~1,17 MB no repo, ~10,7k `!important`).
3. **JS do store inline** no HTML (`external.js` + `store-v2.js` ≈ 385 KB no disco).
4. **6 famílias de Google Fonts** bloqueantes (+ pipeline duplicada do tema).
5. **Imagens hero/PLP/minicart** pesadas e muitas no DOM.
6. **Third-party** (Meta Pixel) + fetch do `/blog/` na home (~788 KB decodificados).
7. **TTFB** tipicamente **800–1500 ms** (plataforma/CDN) — o tema agrava o efeito após a resposta.

Não é um único bug: é acumulação. Otimizar “tudo de uma vez” em prod é arriscado; o plano deve ser **pacotes pequenos**, medidos, só na branch até autorização.

---

## 2. Método

| Camada | Como |
|--------|------|
| HTML por página | `docs/perf/measure-pages.ps1` → `html-weight-by-page.json` |
| Inventário tema | `theme-asset-inventory.json` |
| Runtime (DOM/nav/paint) | Browser + CDP em home, PLP, PDP, cart |
| Código | Grep/leitura de `layout.tpl`, CSS/JS, cart, grid |

**Limitações:** Lighthouse formal não rodou nesta sessão; LCP via PerformanceObserver nem sempre populou; alguns `transferSize` vieram 0 (cache). O peso de HTML e inventário de assets são os sinais mais confiáveis.

Arquivos desta auditoria:
- `docs/perf/PERFORMANCE_AUDIT.md` (este)
- `docs/perf/html-weight-by-page.json`
- `docs/perf/theme-asset-inventory.json`
- `docs/perf/measure-pages.ps1`
- `docs/perf/_measure_snippet.js`

---

## 3. Inventário de assets do tema (disco)

| Arquivo | Tamanho |
|---------|---------|
| `static/css/style-async.scss.tpl` | **1169 KB** (~32k linhas, **10730** `!important`) |
| `static/css/style-critical.tpl` | 111 KB (inline no HTML) |
| `static/css/style-colors.scss.tpl` | 92 KB (`static_inline`) |
| `static/js/external.js.tpl` | 193 KB (include no footer) |
| `static/js/store-v2.js.tpl` | 192 KB (include no footer) |
| `static/js/store.js.tpl` | 152 KB (alternativa) |
| `layouts/layout.tpl` | 137 KB |
| `snipplets/cart-panel.tpl` | 82 KB (quase todas as páginas) |
| `static/checkout.scss.tpl` | 63 KB |
| `templates/cart.tpl` | 34 KB (+ `<style>` grande) |
| Hero `static/images/yamuna/hero/` | **8,53 MB** / 24 arquivos |

Piores heroes:
- `mobile/11-golden-milk-blend-mobile.png` — **1838 KB**
- `mobile/12-creme-de-castanhas-mobile.png` — **1311 KB**
- `desktop/05-casa-sustentavel-desktop.png` — **634 KB**
- Vários JPG desktop 300–500 KB em 1920px

---

## 4. Medições por página (HTML download)

Fonte: `html-weight-by-page.json` (GET cold-ish, Cache-Control: no-cache).

| Página | URL | HTML KB | `<style>` | `<script>` | `<img>` | download ms | Cart panel | FB |
|--------|-----|---------|-----------|------------|---------|-------------|------------|-----|
| Home | `/` | **1265** | 34 | 58 | **226** | 2087 | sim | sim |
| PDP | `/produtos/ghee-yamuna-300g/` | **1074** | 28 | 45 | 135 | 2075 | sim | sim |
| PLP all | `/produtos/` | 960 | 27 | 46 | 115 | 1659 | sim | sim |
| Search | `/search/?q=ghee` | 942 | 27 | 46 | 116 | 2054 | sim | sim |
| PLP cat | `/cremes-de-castanhas/` | 938 | 27 | 46 | 114 | 1514 | sim | sim |
| Cart | `/comprar/` | 906 | 26 | 48 | 83 | 1591 | sim | sim |
| Blog | `/blog/` | 746 | 28 | 50 | 75 | 1294 | sim | sim |
| Aprenda | `/aprenda/` | 746 | 28 | 50 | 75 | 1484 | sim | sim |
| Revenda | `/revenda/` | 651 | 27 | 35 | 84 | 1040 | sim | sim |
| Quem somos | `/quem-somos/` | 648 | 27 | 36 | 63 | 995 | sim | sim |
| Login | `/account/login/` | **494** | 25 | 28 | 25 | 848 | sim | sim |

**Conclusão:** até o login (página “leve”) carrega ~0,5 MB de HTML + minicart + fonts + async CSS + store JS. O piso do tema é alto.

Em todas: `hasStyleAsync`, `hasStoreJsInline`, `hasCartPanel`, `googleFontsMentions ≥ 4`.

---

## 5. Runtime (browser) — amostra

### 5.1 Home `/?perf=home`
- DOM HTML ≈ **2,16 MB**; inline CSS ≈ **290 KB**; inline JS ≈ **434 KB**
- Imagens no DOM: **442** (415 complete)
- Nav: TTFB **946 ms**, FCP **1204 ms**, DCL **1349 ms**, load **2710 ms**
- Doc decoded ≈ **1289 KB**
- Fetch **`/blog/`** ≈ **788 KB** decoded / **144 KB** transfer
- Facebook `fbevents.js` ≈ **425 KB** decoded
- Logos “reference” **1080×879**; vários heroes desktop **1920×800** já carregados
- **3** links Google Fonts no documento

### 5.2 PLP `/produtos/?perf=plp`
- DOM ≈ **0,99 MB**; inline CSS **250 KB**; inline JS **319 KB**
- Imagens **117**; ~12 cards; ~11 hints de imagem secundária
- TTFB **1558 ms**, FCP **1740 ms**, load **2814 ms**
- Doc decoded ≈ **985 KB**

### 5.3 PDP `/produtos/ghee-yamuna-300g/?perf=pdp`
- DOM ≈ **1,29 MB**; inline CSS **319 KB**; inline JS **438 KB**
- Imagens **162**
- TTFB **794 ms**, FCP **960 ms**, load **1991 ms**
- Galeria principal em WebP 512 (bom); peso vem de related + chrome global

### 5.4 Cart `/comprar/?perf=cart`
- DOM ≈ **0,92 MB**; inline CSS **219 KB**; inline JS **280 KB**
- Imagens **77**; recomendações **~14** cards
- TTFB **807 ms**, FCP **996 ms**, load **1874 ms**
- Doc decoded ≈ **888 KB**
- CSS do cart ainda duplicado (critical em `cart.tpl` + bloco em `style-async`)

---

## 6. Achados priorizados (backlog de otimização)

Use estes IDs ao pedir implementação futura.

### P0 — Alto impacto / relativamente isolável

#### OPT-01 — Reduzir Google Fonts (todas as páginas)
- **Evidência:** `layouts/layout.tpl` L7–9 — stylesheet síncrono com Dosis+Inter+Montserrat+Poppins+Raleway+Roboto (dezenas de pesos); + pipeline `fonts` do tema / Montserrat 400,700.
- **Impacto:** bloqueio de render, bytes de fonte, CLS/FOUT em mobile.
- **Direção:** 1–2 famílias (ex. Raleway + Roboto), 2–3 pesos; um só carregamento; `font-display: swap` já existe.
- **Risco:** visual — precisa checklist de tipografia por template.
- **Páginas:** todas.

#### OPT-02 — Parar de inlinar `external.js` + `store-v2.js`
- **Evidência:** `layout.tpl` ~2005–2012 `{% include %}` dentro de `LS.ready`.
- **Impacto:** HTML +400 KB em toda página; sem cache HTTP separado; TBT.
- **Direção:** servir como `<script src="…">` estático versionado (padrão Nuvemshop se permitido) ou split por rota.
- **Risco:** médio — ordem de load / dependências LS.
- **Páginas:** todas.

#### OPT-03 — Slim `style-async.scss.tpl`
- **Evidência:** 1169 KB, 10730 `!important`, hacks `body[class]`.
- **Impacto:** parse/recalc CSS em mobile fraco; banda.
- **Direção:** fatiar por template (home/cart/plp); remover overrides mortos; reduzir `!important`; unificar com critical.
- **Risco:** alto visual — fazer por pacotes + QA screenshots.
- **Páginas:** todas (pior onde há mais overrides Yamuna).

#### OPT-04 — Hero: comprimir + lazy real + preload só LCP
- **Evidência:** pasta hero 8,5 MB; PNGs 1,3–1,8 MB; vários 1920px complete na home; preload do tema aponta para slider admin, não Yamuna hero.
- **Impacto:** LCP home.
- **Direção:** WebP/AVIF; reencode PNG→JPG/WebP; `srcset`; eager só slide 1; preload correto.
- **Risco:** baixo se assets forem swap-in.
- **Páginas:** home.

#### OPT-05 — Remover ou limitar fetch `/blog/` na home
- **Evidência:** resource fetch `/blog/` ~788 KB decoded na home.
- **Impacto:** concorrência com LCP; main thread.
- **Direção:** API/JSON enxuto, cache, ou seção estática; não puxar HTML completo do blog.
- **Risco:** baixo/médio (feature “aprenda/blog” na home).
- **Páginas:** home (+ talvez layout global).

### P1 — Alto impacto / mais refactor

#### OPT-06 — Adiar minicart (`cart-panel.tpl`)
- **Evidência:** ~82 KB template; presente até no login; `hasCartPanel: true` em todas as páginas medidas.
- **Impacto:** HTML/DOM/JS observers em páginas que não abrem a sacola.
- **Direção:** carregar markup/JS do drawer sob demanda (primeiro clique / idle).
- **Risco:** médio (AJAX cart, frete grátis bar, qty sync).
- **Páginas:** todas exceto talvez cart page.

#### OPT-07 — Unificar CSS do cart (fim da duplicação)
- **Evidência:** `templates/cart.tpl` `<style>` com centenas de `!important` “para ganhar do async stale” + mesmo bloco em `style-async`.
- **Impacto:** bytes e cascade; manutenção.
- **Direção:** uma fonte da verdade; cache-bust do async; critical mínimo.
- **Risco:** médio (regressão layout mobile cart).
- **Páginas:** `/comprar/`.

#### OPT-08 — PLP: secondary image / densidade de cards
- **Evidência:** `snipplets/grid/item.tpl` `show_secondary_image = true`; PLP ~11 secondary hints com 12 cards.
- **Impacto:** quase 2× imagens por card.
- **Direção:** secondary só desktop hover ou sob `prefers-reduced-data`; lazy estrito.
- **Risco:** baixo visual.
- **Páginas:** PLP, search, related, cart reco.

#### OPT-09 — Third-party (Meta Pixel) load strategy
- **Evidência:** `fbevents.js` ~425 KB decoded na home.
- **Impacto:** TBT / rede em 3G.
- **Direção:** defer após load / Partytown / consent mode; revisar se config duplicada.
- **Risco:** tracking (marketing).
- **Páginas:** todas com pixel.

#### OPT-10 — MutationObservers globais
- **Evidência:** ~23 `new MutationObserver` (layout 4, store-v2 4, header 3, cart 3, checkout extras, etc.), alguns em `documentElement` subtree.
- **Impacto:** INP/TBT em PLP/cart AJAX.
- **Direção:** escopo menor; disconnect quando idle; debounce maior; preferir eventos LS.
- **Risco:** médio (bugs de UI que o observer “consertava”).
- **Páginas:** PLP, PDP, cart, header.

### P2 — Médio

#### OPT-11 — Logos header em resolução absurda
- **Evidência:** `logo-yamuna-reference.png` / branco em **1080×879** no DOM da home.
- **Direção:** SVG ou PNG ~2× do display (~200–400 px).
- **Páginas:** todas.

#### OPT-12 — Critical + colors inline demais
- **Evidência:** critical 111 KB + colors 92 KB + dezenas de `<style>` no layout (~26–34 tags).
- **Direção:** critical real ≤ 14–20 KB above-the-fold; resto async.
- **Páginas:** todas.

#### OPT-13 — Cart recommendations + depositions
- **Evidência:** ~14 reco cards + Swiper observers + depositions `setInterval`.
- **Direção:** menos cards; lazy section; pausar carrossel offscreen.
- **Páginas:** `/comprar/`.

#### OPT-14 — PDP related / srcset 4k
- **Evidência:** tema anuncia candidatos grandes em product images; PDP 162 imgs no DOM.
- **Direção:** cap 1080w; lazy related.
- **Páginas:** PDP.

#### OPT-15 — Checkout extras CSS/JS remoto
- **Evidência:** `checkout.scss.tpl` importa `yamuna-checkout-fix.css`; extras JS com observers.
- **Direção:** minify; carregar só no checkout platform; reduzir `!important`.
- **Páginas:** checkout Nuvem (pós `/comprar`).

#### OPT-16 — Login ainda “pesado”
- **Evidência:** login 494 KB HTML + cart panel + fonts + async + store JS.
- **Direção:** template account sem minicart/mega-menu pesado se possível.
- **Páginas:** account/*.

### P3 — Processo / plataforma

#### OPT-17 — TTFB 0,8–1,5 s
- Fora do alcance total do tema; medir WebPageTest; CDN/app Nuvemshop.
- Mitigar: HTML menor (OPT-02/06/12) para parse mais rápido após TTFB.

#### OPT-18 — Ambiente de teste seguro
- FTP legado = prod. Sem draft preview.
- Manter trabalho em `perf/*`; zero FTP até autorização explícita.
- Ideal: segundo tema no admin ou loja sandbox, se disponível.

#### OPT-19 — Telemetria contínua
- Rodar Lighthouse mobile cold em home/PLP/PDP/cart antes/depois de cada pacote.
- Guardar JSON em `docs/perf/runs/YYYY-MM-DD-*.json`.

---

## 7. Pacotes sugeridos (ordem segura)

| Pacote | IDs | Pode validar sem FTP? | Risco prod |
|--------|-----|----------------------|------------|
| A — Fontes | OPT-01 | Preview visual local limitado; precisa staging/FTP autorizado | Médio visual |
| B — Hero assets | OPT-04, OPT-11 | Sim (troca de arquivos de imagem) | Baixo |
| C — Blog fetch / pixel defer | OPT-05, OPT-09 | Sim com cuidado marketing | Baixo–médio |
| D — JS externalizado | OPT-02 | Alto — precisa QA funcional | Médio–alto |
| E — Minicart lazy | OPT-06 | Alto QA cart AJAX | Médio |
| F — CSS slim cart/home | OPT-03, OPT-07, OPT-12 | Alto visual | Alto |
| G — PLP/PDP images | OPT-08, OPT-13, OPT-14 | Médio | Baixo–médio |
| H — Observers | OPT-10 | Médio | Médio |

**Regra:** um pacote por vez → medir → só então próximo. Nunca FTP “tudo junto”.

---

## 8. Checklist de QA quando for implementar

- [ ] Home mobile 320 / 375 / 414 — LCP hero, menu, busca
- [ ] PLP filtros + ordenação + add to cart
- [ ] PDP variante/qty/frete/related
- [ ] Cart qty/remove/stock alert/Total/reco Comprar
- [ ] Minicart open/close + frete grátis bar
- [ ] Blog / Aprenda / Revenda / Quem somos
- [ ] Login / account
- [ ] Checkout platform (após pacotes que toquem JS/CSS global)
- [ ] Comparar HTML KB e Lighthouse antes/depois

---

## 9. O que NÃO fazer agora

- Não FTP / `theme ftp push` / watch.
- Não mergear `perf/opt-pack-v1` → `main` sem pedido explícito de publicação.
- Não “otimizar” deletando CSS com `!important` em massa sem regressão visual.
- Não remover pixel/Facebook sem alinhamento de marketing.

---

## 11. Status da implementação (branch)

Ver `docs/perf/OPTIMIZATION_PLAN.md`.

**Fase 1 aplicada em código (sem FTP):** fontes, hero lazy/preload, blog fetch defer, PLP secondary, PDP gallery/preload, logos WebP.
