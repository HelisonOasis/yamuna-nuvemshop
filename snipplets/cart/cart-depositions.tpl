{# Checkout/cart depositions — fixed card + Swiper autoplay (1 review at a time on mobile) #}
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
    <div class="js-swiper-cart-dep swiper-container yamuna-cart-depositions-carousel">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
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
        </div>
        <div class="swiper-slide">
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
        </div>
        <div class="swiper-slide">
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
        </div>
        <div class="swiper-slide">
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
      </div>
    </div>
    <div class="yamuna-cart-depositions-nav">
      <button type="button" class="yamuna-cart-dep-prev js-swiper-cart-dep-prev" aria-label="Depoimento anterior"></button>
      <button type="button" class="yamuna-cart-dep-next js-swiper-cart-dep-next" aria-label="Próximo depoimento"></button>
    </div>
  </div>
</section>
<script>
  (function () {
    function initCartDepositions() {
      var root = document.querySelector('.yamuna-cart-depositions');
      var el = root && root.querySelector('.js-swiper-cart-dep');
      if (!el) return;
      if (el.swiper) {
        try { el.swiper.destroy(true, true); } catch (e) {}
      }
      var w = window.innerWidth || document.documentElement.clientWidth || 0;
      var mobile = w < 768;
      if (typeof Swiper === 'undefined') {
        /* Fallback: simple show/hide + autoplay */
        var slides = el.querySelectorAll('.swiper-slide');
        if (slides.length < 2) return;
        var idx = 0;
        function show(i) {
          slides.forEach(function (s, n) { s.style.display = n === i ? 'block' : 'none'; });
          idx = i;
        }
        show(0);
        var prev = root.querySelector('.js-swiper-cart-dep-prev');
        var next = root.querySelector('.js-swiper-cart-dep-next');
        if (prev) prev.onclick = function () { show((idx - 1 + slides.length) % slides.length); };
        if (next) next.onclick = function () { show((idx + 1) % slides.length); };
        if (mobile) setInterval(function () { show((idx + 1) % slides.length); }, 5500);
        return;
      }
      new Swiper(el, {
        slidesPerView: mobile ? 1 : 4,
        slidesPerGroup: 1,
        spaceBetween: mobile ? 0 : 16,
        watchOverflow: true,
        loop: mobile && el.querySelectorAll('.swiper-slide').length > 1,
        autoplay: mobile ? { delay: 5500, disableOnInteraction: false } : false,
        navigation: {
          nextEl: root.querySelector('.js-swiper-cart-dep-next'),
          prevEl: root.querySelector('.js-swiper-cart-dep-prev'),
        },
        breakpoints: {
          768: { slidesPerView: 2, spaceBetween: 16, loop: false, autoplay: false },
          992: { slidesPerView: 4, spaceBetween: 16, loop: false, autoplay: false },
        },
      });
    }
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', initCartDepositions);
    } else {
      initCartDepositions();
    }
    window.yamunaInitCartDepositions = initCartDepositions;
  })();
</script>
