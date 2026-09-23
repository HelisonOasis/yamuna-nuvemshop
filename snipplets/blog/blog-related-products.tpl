{# Blog "Produtos relacionados" — spots iguais a PLP.
   Topic → seed PDP (related); JS clona e converte .item-actions → yamuna-plp-item-actions. #}

{% set max_blog_related = 8 %}
{% set title_l = post.title | lower %}
{% set summary_l = post.summary | default('') | lower %}
{% set content_l = post.content | default('') | striptags | lower %}
{% set hay = title_l ~ ' ' ~ summary_l ~ ' ' ~ content_l %}

{% set seed_url = '' %}
{% set plp_url = '' %}

{% if hay | split('ghee') | length > 1 %}
	{% set seed_url = '/produtos/ghee-yamuna-150g/' %}
	{% set plp_url = '/manteiga-ghee/' %}
{% elseif hay | split('curcumin') | length > 1 or hay | split('curcuma') | length > 1 %}
	{% set seed_url = '/produtos/capsula-curcumina-organica-yamuna-600mg/' %}
	{% set plp_url = '/nutraceuticos-capsulas/' %}
{% elseif hay | split('tahine') | length > 1 or hay | split('gergelim') | length > 1 %}
	{% set seed_url = '/produtos/tahine-yamuna-350g/' %}
	{% set plp_url = '/tahines-e-gergelim/' %}
{% elseif hay | split('pistache') | length > 1 %}
	{% set seed_url = '/produtos/pistache-e-amendoa-185g/' %}
	{% set plp_url = '/creme-de-pistache/' %}
{% elseif hay | split('castanha') | length > 1 or hay | split('amendoa') | length > 1 %}
	{% set seed_url = '/produtos/puro-caju-creme-de-castanha-de-caju-185g/' %}
	{% set plp_url = '/cremes-de-castanhas/' %}
{% elseif hay | split('sabonete') | length > 1 %}
	{% set seed_url = '/produtos/sabonete-sabao-negro-120g/' %}
	{% set plp_url = '/sabonetes-naturais/' %}
{% elseif hay | split('chocolate') | length > 1 or hay | split('cacau') | length > 1 %}
	{% set seed_url = '/produtos/chocolate-56-ao-leite-de-amendoas-mel-e-baunilha-80g/' %}
	{% set plp_url = '/chocolates-e-cacau/' %}
{% elseif hay | split('coco') | length > 1 %}
	{% set seed_url = '/produtos/leite-de-coco-em-po-zero-acucar-200g/' %}
	{% set plp_url = '/alimentos-de-coco/' %}
{% elseif hay | split('golden') | length > 1 %}
	{% set seed_url = '/produtos/milk-golden-blend-400g/' %}
	{% set plp_url = '/leites-vegetais/' %}
{% elseif hay | split('massala') | length > 1 or hay | split('tempero') | length > 1 %}
	{% set seed_url = '/produtos/degusta-massala-chai-20g/' %}
	{% set plp_url = '/temperos-e-massalas/' %}
{% elseif hay | split('cafe') | length > 1 %}
	{% set seed_url = '/produtos/bulletproof-blend-300g/' %}
	{% set plp_url = '/cafes-especiais/' %}
{% elseif hay | split('leite') | length > 1 %}
	{% set seed_url = '/produtos/castanha-de-caju-leite-concentrado-400g/' %}
	{% set plp_url = '/leites-vegetais/' %}
{% elseif hay | split('shampoo') | length > 1 or hay | split('condicionador') | length > 1 %}
	{% set seed_url = '/produtos/shampoo-solido-capim-limao-120g/' %}
	{% set plp_url = '/shampoos-e-condicionadores-naturais/' %}
{% endif %}

{% set blog_related = [] %}
{% set use_seed_fetch = seed_url != '' %}

{% if not use_seed_fetch %}
	{% if sections.primary.products %}
		{% set blog_related = sections.primary.products %}
	{% elseif sections.new.products %}
		{% set blog_related = sections.new.products %}
	{% elseif sections.sale.products %}
		{% set blog_related = sections.sale.products %}
	{% endif %}
{% endif %}

{% if use_seed_fetch or blog_related | length > 0 %}
<section class="section-products-related position-relative mb-3 yamuna-blog-related{% if not use_seed_fetch %} yamuna-blog-related--static{% endif %}" data-store="blog-related-products"{% if use_seed_fetch %} data-yamuna-seed="{{ seed_url }}" data-yamuna-plp="{{ plp_url }}" data-yamuna-max="{{ max_blog_related }}"{% endif %}>
	<div class="container">
		<div class="text-center">
			<h2 class="h1 yamuna-blog-related-title">Produtos relacionados</h2>
		</div>
		<div class="yamuna-blog-related-grid js-blog-related-grid">
			{% if not use_seed_fetch %}
				{% for product in blog_related %}
					{% if loop.index <= max_blog_related %}
						<div class="yamuna-blog-related-cell">
							{% include 'snipplets/grid/item.tpl' with {'slide_item': false, 'is_pdp_related_spot': false, 'is_blog_related_spot': true} %}
						</div>
					{% endif %}
				{% endfor %}
			{% endif %}
		</div>
	</div>
</section>

<script>
(function yamunaBlogRelatedGridInline() {
  var section = document.querySelector('.yamuna-blog-related[data-yamuna-seed]');
  if (!section || section.getAttribute('data-yamuna-grid-boot') === '1') return;
  section.setAttribute('data-yamuna-grid-boot', '1');

  var seedUrl = section.getAttribute('data-yamuna-seed');
  var plpUrl = section.getAttribute('data-yamuna-plp') || '';
  var maxItems = parseInt(section.getAttribute('data-yamuna-max') || '8', 10) || 8;
  var grid = section.querySelector('.js-blog-related-grid');
  if (!seedUrl || !grid) return;
  if (grid.children.length > 0) return;

  function hydrateLazy(root) {
    root.querySelectorAll('.item-image-secondary, .product-item-image-secondary, .js-product-item-secondary-image-private').forEach(function (img) {
      img.style.setProperty('display', 'none', 'important');
    });

    root.querySelectorAll('.item-image img, .js-item-image-container img').forEach(function (img) {
      if (img.classList.contains('item-image-secondary') || img.classList.contains('product-item-image-secondary')) return;

      img.classList.remove('img-absolute', 'img-absolute-centered', 'lazyload', 'lazyloading');
      img.classList.add('lazyloaded');
      img.removeAttribute('style');

      var ds = img.getAttribute('data-srcset') || img.getAttribute('srcset') || '';
      var best = null;
      ds.split(',').forEach(function (part) {
        var m = part.trim().match(/^(\S+)\s+(\d+)w$/);
        if (!m) return;
        var w = parseInt(m[2], 10);
        if (!best || w > best.w) best = { url: m[1], w: w };
      });

      var url = null;
      if (best && best.w >= 200) {
        url = best.url;
      } else if (img.getAttribute('data-src')) {
        url = img.getAttribute('data-src');
      } else if (best) {
        url = best.url;
      }

      if (url) {
        if (url.indexOf('//') === 0) url = 'https:' + url;
        img.setAttribute('src', url);
        img.removeAttribute('srcset');
        img.removeAttribute('data-srcset');
        img.removeAttribute('sizes');
      }
    });

    if (window.lazySizes && window.lazySizes.autoSizer) {
      try { window.lazySizes.autoSizer.checkElems(); } catch (e) {}
    }
  }

  /* Rebuild actions as PLP spot (theme .item-actions is visibility:hidden until hover). */
  function convertToPlpActions(itemEl) {
    if (!itemEl) return;
    if (itemEl.querySelector('.yamuna-plp-item-actions')) {
      itemEl.querySelectorAll('.yamuna-plp-item-actions, .yamuna-plp-buy-one, .yamuna-plp-buy-three').forEach(function (el) {
        el.style.setProperty('visibility', 'visible', 'important');
        el.style.setProperty('opacity', '1', 'important');
      });
      return;
    }

    var oldActions = itemEl.querySelector('.item-actions');
    if (!oldActions) return;

    var buyOne = oldActions.querySelector('.yamuna-pdp-spot-buy-one, .yamuna-plp-buy-one, button.btn-primary.js-addtocart, a.btn-primary');
    var buyThree = oldActions.querySelector('.yamuna-pdp-spot-buy-three, .yamuna-plp-buy-three, button.btn-secondary.js-addtocart');
    var avise = oldActions.querySelector('.yamuna-plp-avise-me, .yamuna-pdp-spot-avise-me, .yamuna-avise-me-wrap a');
    var form = oldActions.querySelector('form.js-product-form');
    var wrap = document.createElement('div');
    wrap.className = 'yamuna-plp-item-actions';

    if (avise && !buyOne) {
      var av = avise.tagName === 'A' ? avise : (avise.querySelector('a') || avise);
      av.className = 'yamuna-plp-avise-me';
      wrap.appendChild(av);
      oldActions.replaceWith(wrap);
      return;
    }

    if (form) {
      form.querySelectorAll('.js-addtocart-placeholder').forEach(function (el) { el.remove(); });
      var qty = form.querySelector('.js-pdp-spot-add-quantity, .js-home-spot-add-quantity, input[name="quantity"]');
      if (qty) {
        qty.className = 'js-home-spot-add-quantity';
        qty.setAttribute('type', 'hidden');
      }
      if (buyOne) {
        var bagWhite = buyOne.querySelector('img') || null;
        buyOne.className = 'js-addtocart js-prod-submit-form yamuna-plp-buy-one';
        if (buyOne.tagName === 'BUTTON') buyOne.setAttribute('type', 'submit');
        buyOne.removeAttribute('style');
        if (!bagWhite) {
          bagWhite = document.createElement('img');
          bagWhite.src = '//d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static/images/yamuna/home-spot-bag-white.svg';
          bagWhite.alt = '';
          bagWhite.setAttribute('aria-hidden', 'true');
          buyOne.insertBefore(bagWhite, buyOne.firstChild);
        }
      }
      if (buyThree) {
        buyThree.className = 'js-addtocart js-prod-submit-form yamuna-plp-buy-three';
        if (buyThree.tagName === 'BUTTON') buyThree.setAttribute('type', 'submit');
        buyThree.removeAttribute('style');
        if (!buyThree.querySelector('img')) {
          var bagTeal = document.createElement('img');
          bagTeal.src = '//d2az8otjr0j19j.cloudfront.net/templates/007/941/075/twig/static/images/yamuna/home-spot-bag-teal.svg';
          bagTeal.alt = '';
          bagTeal.setAttribute('aria-hidden', 'true');
          buyThree.insertBefore(bagTeal, buyThree.firstChild);
        }
      }
      wrap.appendChild(form);
      oldActions.replaceWith(wrap);
    }
  }

  function parseMoney(txt) {
    var cleaned = String(txt || '').replace(/[^\d,.-]/g, '');
    if (!cleaned) return 0;
    if (cleaned.indexOf(',') >= 0) {
      cleaned = cleaned.replace(/\./g, '').replace(',', '.');
    }
    var n = parseFloat(cleaned);
    return isNaN(n) ? 0 : n;
  }

  /* Hide fake "promo" compare (R$0,00 or compare <= price). Clone strips display:none. */
  function sanitizeComparePrices(root) {
    if (!root) return;
    root.querySelectorAll('.js-compare-price-display, .price-compare').forEach(function (el) {
      var compare = parseMoney(el.textContent);
      var row = el.closest('.item-price-container, .yamuna-plp-price-row, .yamuna-pdp-spot-price-row') || el.parentElement;
      var priceEl = row ? row.querySelector('.js-price-display, .item-price') : null;
      var price = priceEl ? parseMoney(priceEl.textContent) : 0;
      if (!compare || compare <= 0 || (price > 0 && compare <= price)) {
        el.style.setProperty('display', 'none', 'important');
        el.setAttribute('aria-hidden', 'true');
      }
    });
  }

  function appendProducts(productNodes, seenIds, count) {
    productNodes.forEach(function (productEl) {
      if (count.value >= maxItems) return;

      var hasCta = productEl.querySelector(
        '.yamuna-plp-buy-one, .yamuna-plp-buy-three, .yamuna-plp-avise-me, .yamuna-pdp-spot-buy-one, .yamuna-pdp-spot-buy-three, .yamuna-pdp-spot-avise-me, button.js-addtocart'
      );
      if (!hasCta) return;

      var productId = productEl.getAttribute('data-product-id');
      if (productId && seenIds[productId]) return;
      if (productId) seenIds[productId] = true;

      var cell = document.createElement('div');
      cell.className = 'yamuna-blog-related-cell';
      var itemClone = document.importNode(productEl, true);
      itemClone.removeAttribute('style');
      itemClone.classList.remove('swiper-slide', 'col-6', 'col-md-3', 'col-md-4', 'col-lg-3', 'col-lg-2', 'col-lg-4');
      itemClone.querySelectorAll('[style]').forEach(function (el) {
        el.removeAttribute('style');
      });
      convertToPlpActions(itemClone);
      /* Remove frete-gratis seal (PLP does not show it on spots). */
      itemClone.querySelectorAll('.js-shipping-label-private, .js-free-shipping-minimum-label, [data-store="product-item-label-shipping"]').forEach(function (el) {
        el.remove();
      });
      sanitizeComparePrices(itemClone);
      cell.appendChild(itemClone);
      grid.appendChild(cell);
      count.value += 1;
    });
  }

  function collectFromDoc(doc) {
    var nodes = [];
    var table = doc.querySelector('.js-product-table');
    if (table) {
      nodes = Array.prototype.slice.call(table.querySelectorAll('.js-item-product'));
    }
    if (!nodes.length) {
      var related = doc.querySelector('.yamuna-pdp-related[data-store="related-products"]')
        || doc.querySelector('.yamuna-pdp-related');
      if (related) {
        related.querySelectorAll('.swiper-wrapper > .swiper-slide').forEach(function (slide) {
          if (slide.classList.contains('swiper-slide-duplicate')) return;
          var el = slide.querySelector('.js-item-product');
          if (el) nodes.push(el);
        });
      }
    }
    return nodes;
  }

  function finish(count) {
    if (count === 0) {
      section.style.display = 'none';
      return;
    }
    section.setAttribute('data-yamuna-loaded', String(count));
    section.classList.add('yamuna-blog-related--ready');
    sanitizeComparePrices(section);
    hydrateLazy(section);
    setTimeout(function () {
      hydrateLazy(section);
      sanitizeComparePrices(section);
    }, 200);
  }

  var seenIds = {};
  var count = { value: 0 };

  /* 1) Prefer PLP category cards (exact markup). 2) Fill from PDP related. */
  var fetches = [];
  if (plpUrl) fetches.push(fetch(plpUrl, { credentials: 'same-origin', cache: 'no-store' }).then(function (r) { return r.ok ? r.text() : ''; }).catch(function () { return ''; }));
  fetches.push(fetch(seedUrl, { credentials: 'same-origin', cache: 'no-store' }).then(function (r) { return r.ok ? r.text() : ''; }).catch(function () { return ''; }));

  Promise.all(fetches).then(function (htmls) {
    htmls.forEach(function (html) {
      if (!html || count.value >= maxItems) return;
      var doc = new DOMParser().parseFromString(html, 'text/html');
      appendProducts(collectFromDoc(doc), seenIds, count);
    });
    finish(count.value);
  }).catch(function () {
    section.style.display = 'none';
  });
})();

/* Static related cards (no seed fetch): hide fake R$0,00 compare. */
(function yamunaBlogRelatedSanitizeStatic() {
  function parseMoney(txt) {
    var cleaned = String(txt || '').replace(/[^\d,.-]/g, '');
    if (!cleaned) return 0;
    if (cleaned.indexOf(',') >= 0) cleaned = cleaned.replace(/\./g, '').replace(',', '.');
    var n = parseFloat(cleaned);
    return isNaN(n) ? 0 : n;
  }
  function run() {
    document.querySelectorAll('.yamuna-blog-related .js-compare-price-display, .yamuna-blog-related .price-compare').forEach(function (el) {
      var compare = parseMoney(el.textContent);
      var row = el.closest('.item-price-container, .yamuna-plp-price-row, .yamuna-pdp-spot-price-row') || el.parentElement;
      var priceEl = row ? row.querySelector('.js-price-display, .item-price') : null;
      var price = priceEl ? parseMoney(priceEl.textContent) : 0;
      if (!compare || compare <= 0 || (price > 0 && compare <= price)) {
        el.style.setProperty('display', 'none', 'important');
        el.setAttribute('aria-hidden', 'true');
      }
    });
  }
  run();
  setTimeout(run, 300);
})();
</script>
{% endif %}
