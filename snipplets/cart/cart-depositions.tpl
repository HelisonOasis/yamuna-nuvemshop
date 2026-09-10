{# Checkout depositions — copy/layout from yamuna.com.br/checkout #}
<section class="yamuna-cart-depositions" data-store="cart-depositions">
  <div class="yamuna-cart-depositions-header">
    <div class="yamuna-cart-depositions-icon-wrapper" aria-hidden="true">
      <svg class="yamuna-cart-depositions-icon" viewBox="0 0 24 24" fill="#fff" width="14" height="14" aria-hidden="true">
        <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"></path>
      </svg>
    </div>
    <h2 class="yamuna-cart-depositions-title">O que estão dizendo sobre a Yamuna</h2>
  </div>
  <div class="yamuna-cart-depositions-body">
    <div class="yamuna-cart-depositions-grid js-cart-depositions-carousel" id="cart-depositions-carousel">
      <article class="yamuna-cart-deposition-card">
        <div class="yamuna-cart-deposition-stars" aria-label="5 de 5 estrelas">
          {% for i in 1..5 %}
            <svg width="12" height="12" viewBox="0 0 24 24" fill="#F4C744" aria-hidden="true"><path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"></path></svg>
          {% endfor %}
        </div>
        <div class="yamuna-cart-deposition-content">
          <p>Produtos de excelente qualidade! Vale muito a pena o investimento. Meu queridinho é o Golden Milk e também a Ghee. E que dizer desses cafés? Gente do céu... surreal de maravilhoso. Gosto de tudo e estou sempre comprando os meus queridos e experimentando novas opções. Obrigada, Yamuna, pelo carinho e amor de vocês em forma de nutrição com excelência.</p>
          <span class="yamuna-cart-deposition-author">Raquel Cassiano</span>
        </div>
      </article>
      <article class="yamuna-cart-deposition-card">
        <div class="yamuna-cart-deposition-stars" aria-label="5 de 5 estrelas">
          {% for i in 1..5 %}
            <svg width="12" height="12" viewBox="0 0 24 24" fill="#F4C744" aria-hidden="true"><path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"></path></svg>
          {% endfor %}
        </div>
        <div class="yamuna-cart-deposition-content">
          <p>Todos os produtos são de altíssima qualidade e deliciosos, nenhuma outra marca chega perto, especialmente o Ghee, ideal de coco e melhor de tamarindo. Se não bastasse isso, ainda prestam o melhor atendimento ao consumidor que já vi no Brasil! Tive um problema com o melhor de tamarindo, entrei em contato e me enviaram um novo pote sem custo, mesmo o problema ocorrendo vários meses após a compra. O cuidado e carinho com os clientes é sensacional!</p>
          <span class="yamuna-cart-deposition-author">Thiago P</span>
        </div>
      </article>
      <article class="yamuna-cart-deposition-card">
        <div class="yamuna-cart-deposition-stars" aria-label="5 de 5 estrelas">
          {% for i in 1..5 %}
            <svg width="12" height="12" viewBox="0 0 24 24" fill="#F4C744" aria-hidden="true"><path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"></path></svg>
          {% endfor %}
        </div>
        <div class="yamuna-cart-deposition-content">
          <p>Apaixonada pelos produtos da Yamuna! Tudo muito bem feito, com produtos de qualidade, as embalagens são lindas e quando eu abro a caixa eu sinto o carinho que eles colocaram em cada detalhe. Além de tudo isso, eles contribuem com a minha saúde com esses produtos tão especiais que a gente não encontra em qualquer lugar! Obrigada por existirem!</p>
          <span class="yamuna-cart-deposition-author">Kelly Cristina Amaral</span>
        </div>
      </article>
      <article class="yamuna-cart-deposition-card">
        <div class="yamuna-cart-deposition-stars" aria-label="5 de 5 estrelas">
          {% for i in 1..5 %}
            <svg width="12" height="12" viewBox="0 0 24 24" fill="#F4C744" aria-hidden="true"><path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"></path></svg>
          {% endfor %}
        </div>
        <div class="yamuna-cart-deposition-content">
          <p>Destaque para o cuidado na embalagem dos produtos, e agora é só saborear tudo perfeitamente preparado e oferecido com carinho, a energia e grande luz da Deusa Yamuna!</p>
          <span class="yamuna-cart-deposition-author">Bernadete Pinho</span>
        </div>
      </article>
    </div>
    <div class="yamuna-cart-depositions-nav d-md-none">
      <button type="button" class="yamuna-cart-dep-prev js-cart-dep-prev" aria-label="Depoimento anterior"></button>
      <button type="button" class="yamuna-cart-dep-next js-cart-dep-next" aria-label="Próximo depoimento"></button>
    </div>
  </div>
</section>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    if (!window.matchMedia('(max-width: 767px)').matches) return;
    var grid = document.querySelector('.js-cart-depositions-carousel');
    if (!grid) return;
    var cards = Array.prototype.slice.call(grid.querySelectorAll('.yamuna-cart-deposition-card'));
    if (cards.length < 2) return;
    var index = 0;
    function show(i) {
      cards.forEach(function (card, n) {
        card.style.display = n === i ? 'flex' : 'none';
      });
      index = i;
    }
    show(0);
    var prev = document.querySelector('.js-cart-dep-prev');
    var next = document.querySelector('.js-cart-dep-next');
    if (prev) prev.addEventListener('click', function () { show((index - 1 + cards.length) % cards.length); });
    if (next) next.addEventListener('click', function () { show((index + 1) % cards.length); });
  });
</script>
