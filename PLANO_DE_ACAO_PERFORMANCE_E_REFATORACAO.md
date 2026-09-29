# Plano de Ação: Performance da Home e Refatoração Segura
**Yamuna E-commerce (Nuvemshop)**  
**Data:** 29/09/2026  
**Escopo prioritário:** velocidade de carregamento, estabilidade visual e fluidez da Home (`/`)  
**Status:** execução controlada, com aprovação obrigatória entre passos

---

## 1. Objetivo

Reduzir o trabalho realizado no carregamento inicial da Home sem alterar o design, o conteúdo essencial ou o funcionamento dos componentes.

Cada passo deve ser pequeno, reversível e validável. Depois de cada passo, o trabalho será pausado para inspeção da loja e aprovação do responsável. Nenhum passo seguinte será iniciado sem essa aprovação explícita.

O checkout, a remoção definitiva de arquivos e mudanças amplas de CSS ficam fora do primeiro ciclo da Home.

---

## 2. Diagnóstico atual

| Métrica | Home (`/`) | PLP (`/produtos/`) | PDP (Produto) | Hipótese de impacto |
| :--- | :---: | :---: | :---: | :--- |
| **Peso do HTML** | **1.275 KB** (~1,3 MB) | 965 KB | 882 KB | Mais markup, dados e CSS inline para processar |
| **Imagens totais** | **229** | 116 | 92 | Muitas requisições e decodificações no carregamento inicial |
| **Imagens sem lazy loading** | **199** | 114 | 88 | Disputa de banda com conteúdo acima da dobra |
| **Carrosséis Swiper ativos** | **9 (64 slides)** | 0 | 2 (8 slides) | Inicialização e cálculo de layout em massa |
| **Tags de script** | **58** | 46 | 42 | Mais inicializações e trabalho no DOM |
| **CSS principal** | **assíncrono (`media="print"`)** | síncrono | assíncrono | Possível atraso de estilos, a confirmar por métrica |

Esses números são o baseline disponível e devem ser confirmados no Passo 1 em condições controladas.

O checkout possui carregamento próprio de correções. `static/js/yamuna-checkout-admin.nube.jsx` injeta `yamuna-checkout-fix.css` e `yamuna-checkout-fix.js`; portanto, não será alterado nos primeiros passos da Home.

---

## 3. Regras do fluxo de aprovação

### Antes de cada passo

1. Confirmar o escopo exato do passo.
2. Verificar o estado atual do código e o último ponto aprovado.
3. Sincronizar/publicar somente se houver conexão FTP disponível e credenciais já configuradas com segurança.
4. Registrar backup ou commit de rollback.

### Depois de cada passo

1. Interromper novas alterações.
2. Informar arquivos alterados, comportamento esperado e validações realizadas.
3. Solicitar que o responsável verifique a loja, especialmente a Home em desktop e mobile.
4. Aguardar aprovação explícita ou relato de problema.
5. Se houver quebra, corrigir ou reverter apenas o passo atual antes de prosseguir.

**Importante:** neste ambiente não há integração FTP disponível entre as ferramentas conectadas. A sincronização remota só poderá ser feita se o projeto fornecer um comando/configuração FTP local já existente ou se o usuário disponibilizar uma integração segura. Não serão armazenadas nem solicitadas credenciais em texto aberto.

---

## 4. Passos de execução

### PASSO 1 — Baseline e primeira otimização segura da Home

**Objetivo:** medir o estado atual e reduzir requisições desnecessárias de imagens abaixo da dobra, sem alterar o layout.

1. Criar um ponto de rollback local.
2. Medir/cachear o baseline da Home em mobile e desktop, quando as ferramentas de teste estiverem disponíveis:
   - LCP, FCP, CLS e INP;
   - tamanho de HTML, CSS e JavaScript;
   - imagens requisitadas nos primeiros segundos;
   - Swipers inicializados no carregamento.
3. Identificar as imagens comprovadamente abaixo da dobra.
4. Adicionar `loading="lazy"` e `decoding="async"` somente nessas imagens.
5. Preservar o Hero como `loading="eager"` e usar `fetchpriority="high"` apenas quando ele for o recurso principal do primeiro viewport.
6. Garantir `width`/`height` ou `aspect-ratio` nas imagens alteradas para evitar CLS.
7. Validar que imagens de carrosséis continuam disponíveis ao navegar e rolar.

**Não fazer neste passo:** alterar Swipers, CSS global, fontes, checkout ou apagar arquivos.

**Critério de saída:** menos imagens requisitadas no carregamento inicial, sem imagem quebrada, sem aumento de CLS e sem diferença visual perceptível.

**Pausa obrigatória:** após concluir, aguardar aprovação do responsável antes do Passo 2.

### PASSO 2 — Inicialização sob demanda dos carrosséis

**Objetivo:** reduzir JavaScript e cálculo de layout no carregamento inicial.

1. Manter o Banner Hero com inicialização imediata.
2. Inicializar os demais Swipers com `IntersectionObserver` próximo ao viewport.
3. Garantir inicialização idempotente e fallback sem `IntersectionObserver`.
4. Preservar autoplay, navegação, paginação, resize, acessibilidade e mobile.

**Critério de saída:** somente os componentes necessários ao primeiro viewport são inicializados inicialmente e todos os carrosséis funcionam ao rolar.

**Pausa obrigatória:** aguardar aprovação após a validação da Home.

### PASSO 3 — CSS e fontes do caminho crítico

**Objetivo:** reduzir atraso visual sem trocar um bloqueio por outro.

1. Comparar o carregamento atual de `style-async.scss.tpl` com alternativas de menor risco.
2. Decidir entre preload, CSS crítico e stylesheet completo usando LCP, FCP e CLS.
3. Remover fontes/pesos somente após confirmar que não são usados na Home.
4. Preservar `font-display` e evitar FOUC ou troca inesperada de fonte.

**Critério de saída:** renderização inicial mais rápida ou equivalente, sem aumento de CLS ou alteração visual.

**Pausa obrigatória:** aguardar aprovação após a validação da Home.

### PASSO 4 — Refatoração localizada de CSS duplicado

**Objetivo:** diminuir CSS e parsing sem modificar a cascata.

1. Refatorar um componente por vez, começando pelos seletores de compra rápida da Home.
2. Registrar valores computados, especificidade, estados e breakpoints antes da alteração.
3. Usar `inherit` somente quando a equivalência estiver comprovada.
4. Não remover uma regra apenas porque aparece riscada em um elemento: verificar outros contextos, páginas e estados.
5. Comparar screenshots e métricas após cada pequeno lote.

**Critério de saída:** CSS menor, sem diferença visual ou funcional nos componentes testados.

**Pausa obrigatória:** aguardar aprovação após cada lote de CSS.

### PASSO 5 — CSS específico por página

**Objetivo:** retirar da Home estilos de Blog, 404 e Conta que não pertencem ao caminho comum.

1. Confirmar as condições Twig e as páginas afetadas.
2. Mover uma família de estilos por vez.
3. Testar Home, Blog, 404, Conta, PLP e PDP.
4. Medir o tamanho real removido do HTML, sem assumir redução proporcional ao número de linhas.

**Critério de saída:** Home menor e todas as páginas preservadas visualmente.

**Pausa obrigatória:** aguardar aprovação após cada família de estilos.

### PASSO 6 — Higienização e checkout, somente após aprovação do ciclo da Home

**Objetivo:** tratar legado sem misturar riscos com a otimização inicial.

1. Buscar referências globais antes de arquivar snippets órfãos.
2. Arquivar antes de deletar e manter rollback versionado.
3. Avaliar separadamente `yamuna-checkout-fix.css`, `yamuna-checkout-fix.js` e `yamuna-checkout-fix-loader.js`.
4. Só remover o loader após validar entrega, pagamento e sucesso, incluindo ordem de execução e cache.

**Pausa obrigatória:** cada alteração de checkout exige aprovação independente.

---

## 5. Métricas e não-regressão

Em cada passo aplicável, registrar:

- LCP, FCP, CLS e INP;
- HTML, CSS e JavaScript transferidos;
- imagens requisitadas no carregamento inicial;
- tarefas longas e tempo de execução de JavaScript;
- screenshots mobile e desktop;
- console, rede, navegação por teclado e funcionamento dos componentes.

Uma alteração será mantida somente se melhorar ou preservar as métricas e não gerar regressão visual ou funcional. Metas absolutas de tamanho, como reduzir o HTML para menos de 600 KB, só serão definidas depois do baseline real.

---

## 6. Estado de aprovação

| Passo | Estado | Aprovação |
| :--- | :--- | :--- |
| 1 — Baseline e imagens | **Aguardando execução** | — |
| 2 — Carrosséis | Bloqueado até aprovação do Passo 1 | — |
| 3 — CSS e fontes | Bloqueado até aprovação do Passo 2 | — |
| 4 — CSS duplicado | Bloqueado até aprovação do Passo 3 | — |
| 5 — CSS por página | Bloqueado até aprovação do Passo 4 | — |
| 6 — Higienização/checkout | Bloqueado até aprovação do ciclo da Home | — |
