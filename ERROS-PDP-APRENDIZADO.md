# PDP — Erros Identificados e Aprendizado

> Documento de referência para correções da PDP.
> Sempre comparar **cada elemento individualmente** entre Figma e site antes de declarar "OK".

## Erros que o humano encontrou e a IA não

### 1. Botão "ADICIONAR À SACOLA" — font/radius incorretos
- **Figma (node 807-7931)**: bg `#238482`, border-radius `23px`, font Roboto **SemiBold (600)** `14px`, uppercase, padding `12px 24px`, ícone bag `14×14`
- **Site antes**: bg `#238482` ✅, border-radius `22px` ❌, font Roboto `700` `16px` ❌
- **Correção**: radius→23, font-size→14, font-weight→600, icon size→14
- **Lição**: 1px de diferença no radius importa. Font-weight 600 vs 700 muda a aparência.

### 2. Botão "BUSCAR" (CEP) — cor e fonte incorretas
- **Figma (node 829-4084)**: bg `#e5c3da` (pink-100), text `#4a1d3a` (purple-800), Roboto **Bold** `14px`, uppercase, radius `23px`
- **Site antes**: bg `#e6bfd7` ❌, text `#4b1b3a` ≈ ok, Dosis 16px ❌, radius `22px` ❌
- **Correção**: bg→#e5c3da, font→Roboto Bold 14px, radius→23
- **Lição**: #e6bfd7 vs #e5c3da são rosas diferentes. Sempre extrair valor exato do Figma.

### 3. CEP Input — font, border, uppercase incorretos
- **Figma (node 829-4083)**: border `1px solid #c0bbc3`, placeholder Dosis Regular `18px` uppercase cor `#9e929e`, radius `23px`
- **Site antes**: border `#c9c3ca` ❌, font `16px` ❌, sem uppercase ❌, radius `22px` ❌
- **Correção**: border-color→#c0bbc3, font-size→18, text-transform→uppercase, radius→23
- **Lição**: Placeholder text styling (size, transform, color) precisa ser verificado.

### 4. "Não sei meu CEP" — posição e tamanho errados
- **Figma (node 829-4085)**: x:1239 y:737 (à **direita** do botão Buscar), Dosis **Bold** `12px`, cor `#238482`, underline
- **Site antes**: posicionado **abaixo** do input, `14px`, sem bold
- **Correção**: Movido para 3ª coluna do grid, font-size→12, font-weight→700, cor→#238482
- **Lição**: Verificar posição relativa (acima/abaixo/ao lado) é CRÍTICO. Não basta o elemento existir.

### 5. Alinhamento dos botões Add to Cart + Quantity Selector — NÃO ALINHADOS À ESQUERDA
- **Figma**: Botão começa na borda esquerda da coluna (x=848 = coluna x), gap **32px**, quantity à direita
- **Site antes**: Botão com 50px de offset à direita! Causa: `flex-direction: row-reverse` sem `justify-content: flex-end`, gap `24px` em vez de `32px`
- **Correção**: Adicionado `justify-content: flex-end` e `gap: 32px`
- **Lição**: `flex-direction: row-reverse` inverte o significado de `flex-end`/`flex-start`. Verificar SEMPRE o `left` position do elemento em relação ao container.

### 6. Espaçamento entre linhas divisórias e elementos DIFERENTE
- **Figma Y coordinates**: Line9→PriceCards = 32px, PriceCards→Line10 = 32px, Line10→Button = 19px, Button→Line11 = 21px, Line11→CEP = 16px
- **Site antes**: margin price cards: 24px (vs 32px), form-row margin-top: 24px (vs 19px), padding-bottom: 24px (vs 21px)
- **Correção**: price cards margin: 32px 0; form-row margin-top: 19px; padding-bottom: 21px
- **Lição**: Calcular gaps do Figma usando coordenadas Y dos elementos. Cada pixel importa.

### 7. Alinhamento de textos geral
- **Figma**: Textos de preço centralizados no card, label do CEP alinhado à esquerda
- **Site**: Precisava ajustes finos
- **Lição**: text-align, margin, padding devem ser verificados para cada bloco de texto.

---

## Erros adicionais encontrados pela IA (antes da correção)

### 7. Trust badges "Compra protegida" / "Trocas e devoluções" presentes no site mas ausentes no Figma
- **Ação**: Esconder via CSS na PDP

### 8. Social share icons presentes no site mas ausentes no Figma
- **Ação**: Esconder via CSS na PDP

### 9. Título "Produtos similares" em vez de "VOCÊ PODE GOSTAR"
- **Ação**: `config/defaults.txt` já alterado mas precisa sync FTP

### 10. Acordeões da descrição vazios
- **Causa**: Produto no admin Nuvemshop não possui marcadores `<!--block:-->` no conteúdo
- **Ação**: Precisa editar conteúdo do produto no painel admin

---

## Checklist de Comparação Figma vs Site (usar SEMPRE antes de declarar algo como OK)

Para cada elemento visível:
- [ ] Cor de fundo (`background-color`) — valor exato hex
- [ ] Cor do texto (`color`) — valor exato hex
- [ ] Tamanho do texto (`font-size`) — px exato
- [ ] Peso do texto (`font-weight`) — 400/700/800 etc.
- [ ] Família da fonte (`font-family`) — Dosis, Roboto, Montserrat
- [ ] Transformação do texto (`text-transform`) — uppercase, lowercase, none
- [ ] Largura do elemento (`width`) — px ou porcentagem
- [ ] Altura do elemento (`height`) — px exato
- [ ] Border radius (`border-radius`) — px exato
- [ ] Espaçamento (`margin`, `padding`, `gap`) — px exato
- [ ] Alinhamento (`text-align`, `align-items`, `justify-content`)
- [ ] **Posição relativa** a outros elementos (acima, abaixo, ao lado)
- [ ] Border (`border`) — cor, espessura, estilo
- [ ] Display e layout (`display`, `flex-direction`, `grid-template-columns`)

## Como investigar corretamente

1. **Figma**: Usar `get_design_context` com o nodeId específico de CADA sub-elemento
2. **Site**: Usar `browser_cdp` → `Runtime.evaluate` para ler `getComputedStyle()` do elemento
3. **Comparar** os valores um a um usando o checklist acima
4. **Nunca** assumir que um valor está correto sem verificar o Figma primeiro
5. **Sempre** verificar a posição relativa dos elementos, não apenas seus estilos individuais

## Referência Figma

- **Arquivo**: `03VLeo0v7ZIFa1SztUs54g`
- **PDP Frame**: `798-5606`
- **Botão Add to Cart (Frame 8)**: `807-7931` — 304×48px no Figma, x:848 y:603
- **Quantity Selector**: `810-7937` — 150×48px, x:1184 y:603
- **CEP Input (Group 241)**: `829-4083` — 224×48px, x:850 y:720
- **CEP Button (Group 242)**: `829-4084` — 125×48px, x:1090 y:720
- **"Não sei meu CEP"**: `829-4085` — x:1239 y:737 (à direita do botão Buscar)
- **Unit Price Card (Group 235)**: `807-5656` — 248×170px
- **Buy Three Card (Group 284)**: `847-9252` — 248×170px
