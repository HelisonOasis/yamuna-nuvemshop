# Plano de otimização — Yamuna (branch `perf/opt-pack-v1`)

**Regra:** zero FTP / zero prod até autorização explícita.  
**Baseline:** `docs/perf/PERFORMANCE_AUDIT.md`  
**Objetivo:** reduzir peso de HTML/CSS/JS/imagens e melhorar FCP/LCP/TBT em mobile e desktop.

---

## Princípios

1. Um pacote por vez → medir → só então o próximo.
2. Preferir cortes seguros (assets, lazy, defer) antes de refactors grandes (CSS monólito, minicart).
3. Não migrar para Tailwind nesta fase (custo alto, ganho incerto).
4. Imagens de marketing: caminho ideal = mídia Nuvemshop + `settings_image_url` (fase futura).

---

## Fases

### Fase 1 — Quick wins no código (aplicada nesta branch)
| ID | Ação | Status |
|----|------|--------|
| F1-A | Fontes: só Raleway + Roboto + Dosis (pesos usados) | Aplicado |
| F1-B | Hero: lazy só no 1º slide; preload LCP Yamuna | Aplicado |
| F1-C | Blog home: fetch `/blog/` adiado (idle + viewport) | Aplicado |
| F1-D | PLP: secondary image só em category/search (não home/slide) | Aplicado |
| F1-E | PDP: galeria display em `large`/`huge`; preload sem 4k | Aplicado |
| F1-F | Logos header → WebP + width/height | Aplicado |

### Fase 2 — Assets (próximo, ainda sem FTP até OK)
| ID | Ação |
|----|------|
| F2-A | Reencode heroes PNG→WebP/JPG (&lt;200 KB); ou subir no admin Nuvemshop |
| F2-B | Trocar hero Yamuna para `settings.slider` + `settings_image_url` (srcset) |
| F2-C | Revisar PLP banners em `static/images/yamuna/plp-banners/` |

### Fase 3 — JS / DOM global
| ID | Ação |
|----|------|
| F3-A | Externalizar `external.js` + `store-v2.js` (src cacheável) |
| F3-B | Lazy-load markup do minicart |
| F3-C | Reduzir MutationObservers de document-wide |
| F3-D | Defer Meta Pixel (após load / consent) |

### Fase 4 — CSS
| ID | Ação |
|----|------|
| F4-A | Unificar CSS do cart (fim da duplicação critical×async) |
| F4-B | Slim `style-async` por template; cortar `!important` morto |
| F4-C | Critical real ≤ ~20 KB above-the-fold |

### Fase 5 — Validação e publicação
| ID | Ação |
|----|------|
| F5-A | Lighthouse cold: home, PLP, PDP, cart (antes/depois) |
| F5-B | QA checklist do audit |
| F5-C | Publicar **somente** com autorização explícita (FTP pontual) |

---

## Como medir nesta branch

```powershell
powershell -NoProfile -File docs/perf/measure-pages.ps1
```

Comparar `htmlKB`, FCP/TTFB no browser, e (quando autorizado em staging) Lighthouse.

---

## Ordem recomendada após Fase 1

1. Fase 2 (imagens) — maior ROI visual/LCP  
2. Fase 3-A/B (JS + minicart)  
3. Fase 4 (CSS) — maior risco visual; fazer por fatias  
4. Fase 5 — só então prod
