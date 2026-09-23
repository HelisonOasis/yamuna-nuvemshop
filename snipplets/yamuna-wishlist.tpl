{# Yamuna wishlist: PDP heart + /favoritos page (localStorage keyed by customer) #}
<script>
(function () {
  var STORAGE_PREFIX = 'yamuna_wishlist_';
  var GUEST_KEY = STORAGE_PREFIX + 'guest';
  var EVENT_NAME = 'yamuna:wishlist-change';

  function customerIdFromDom() {
    var root = document.querySelector('[data-yamuna-favoritos]');
    if (root && root.getAttribute('data-customer-id')) {
      return String(root.getAttribute('data-customer-id'));
    }
    if (document.body && document.body.classList.contains('customer-logged-in')) {
      var meta = document.querySelector('meta[name="yamuna-customer-id"]');
      if (meta && meta.content) return String(meta.content);
    }
    var cfg = document.getElementById('yamuna-wishlist-config');
    if (cfg && cfg.getAttribute('data-customer-id')) {
      return String(cfg.getAttribute('data-customer-id'));
    }
    return '';
  }

  function storageKey() {
    var id = customerIdFromDom();
    return id ? (STORAGE_PREFIX + 'c_' + id) : GUEST_KEY;
  }

  function readList(key) {
    try {
      var raw = localStorage.getItem(key || storageKey());
      if (!raw) return [];
      var parsed = JSON.parse(raw);
      return Array.isArray(parsed) ? parsed : [];
    } catch (e) {
      return [];
    }
  }

  function writeList(list, key) {
    try {
      localStorage.setItem(key || storageKey(), JSON.stringify(list || []));
    } catch (e) {}
    try {
      window.dispatchEvent(new CustomEvent(EVENT_NAME, { detail: { list: list || [] } }));
    } catch (e2) {}
  }

  function mergeGuestIntoCustomer() {
    var id = customerIdFromDom();
    if (!id) return;
    var customerKey = STORAGE_PREFIX + 'c_' + id;
    var guest = readList(GUEST_KEY);
    if (!guest.length) return;
    var current = readList(customerKey);
    var map = {};
    current.forEach(function (item) {
      if (item && item.id != null) map[String(item.id)] = item;
    });
    guest.forEach(function (item) {
      if (item && item.id != null && !map[String(item.id)]) {
        map[String(item.id)] = item;
        current.push(item);
      }
    });
    writeList(current, customerKey);
    try { localStorage.removeItem(GUEST_KEY); } catch (e) {}
  }

  function findIndex(list, productId) {
    var id = String(productId);
    for (var i = 0; i < list.length; i++) {
      if (list[i] && String(list[i].id) === id) return i;
    }
    return -1;
  }

  function productFromButton(btn) {
    return {
      id: String(btn.getAttribute('data-product-id') || ''),
      name: btn.getAttribute('data-product-name') || '',
      url: btn.getAttribute('data-product-url') || '',
      image: btn.getAttribute('data-product-image') || '',
      price: Number(btn.getAttribute('data-product-price') || 0),
      priceDisplay: btn.getAttribute('data-product-price-display') || '',
      comparePrice: Number(btn.getAttribute('data-product-compare-price') || 0),
      comparePriceDisplay: btn.getAttribute('data-product-compare-price-display') || '',
      installments: Number(btn.getAttribute('data-product-installments') || 1),
      installmentAmount: btn.getAttribute('data-product-installment-amount') || '',
      threePriceDisplay: btn.getAttribute('data-product-three-price-display') || '',
      addedAt: Date.now()
    };
  }

  function setButtonState(btn, active) {
    if (!btn) return;
    btn.classList.toggle('is-active', !!active);
    btn.setAttribute('aria-pressed', active ? 'true' : 'false');
  }

  function syncButtons(list) {
    list = list || readList();
    var ids = {};
    list.forEach(function (item) {
      if (item && item.id != null) ids[String(item.id)] = true;
    });
    document.querySelectorAll('[data-yamuna-wishlist-toggle]').forEach(function (btn) {
      var id = String(btn.getAttribute('data-product-id') || '');
      setButtonState(btn, !!ids[id]);
    });
  }

  function showToast(added) {
    if (typeof window.yamunaShowCartToast === 'function') {
      if (added) {
        window.yamunaShowCartToast('Produto adicionado!', 'Produto adicionado à sua lista de desejos');
      } else {
        window.yamunaShowCartToast('Produto removido', 'Produto removido da sua lista de desejos');
      }
    }
  }

  function toggleProduct(btn) {
    var product = productFromButton(btn);
    if (!product.id) return;
    var list = readList();
    var idx = findIndex(list, product.id);
    var added;
    if (idx >= 0) {
      list.splice(idx, 1);
      added = false;
    } else {
      list.unshift(product);
      added = true;
    }
    writeList(list);
    setButtonState(btn, added);
    showToast(added);
  }

  function escapeHtml(str) {
    return String(str == null ? '' : str)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#39;');
  }

  function formatMoneyCents(cents) {
    var value = Number(cents || 0) / 100;
    try {
      return value.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    } catch (e) {
      return 'R$' + value.toFixed(2).replace('.', ',');
    }
  }

  function formatInstallmentsPlp(item) {
    var count = Number(item.installments || 0);
    var amount = item.installmentAmount || '';
    if (count > 1 && amount) {
      return count + ' x de ' + amount;
    }
    return '';
  }

  function threePriceFor(item) {
    if (item.threePriceDisplay) return item.threePriceDisplay;
    if (item.price) return formatMoneyCents(Math.round(Number(item.price) * 0.95));
    return '';
  }

  function heartSvg() {
    return (
      '<svg width="18" height="18" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">' +
        '<path d="M14.5833 1.5975C13.645 1.6121 12.7271 1.87405 11.9223 2.3569C11.1176 2.83974 10.4545 3.52639 10 4.3475C9.54554 3.52639 8.88245 2.83974 8.0777 2.3569C7.27296 1.87405 6.35505 1.6121 5.41667 1.5975C3.92079 1.6625 2.51143 2.31688 1.49649 3.4177C0.481556 4.51851 -0.0564528 5.97627 5.93206e-06 7.4725C5.93206e-06 11.2617 3.98834 15.4 7.33334 18.2058C8.08019 18.8334 9.02447 19.1775 10 19.1775C10.9755 19.1775 11.9198 18.8334 12.6667 18.2058C16.0117 15.4 20 11.2617 20 7.4725C20.0565 5.97627 19.5185 4.51851 18.5035 3.4177C17.4886 2.31688 16.0792 1.6625 14.5833 1.5975Z" fill="#a31460"></path>' +
      '</svg>'
    );
  }

  function renderFavoritosPage() {
    var root = document.querySelector('[data-yamuna-favoritos]');
    if (!root) return;

    mergeGuestIntoCustomer();

    var grid = root.querySelector('.js-yamuna-favoritos-grid');
    var empty = root.querySelector('.js-yamuna-favoritos-empty');
    var login = root.querySelector('.js-yamuna-favoritos-login');
    var subtitle = root.querySelector('.js-yamuna-favoritos-subtitle');
    var bagIcon = root.getAttribute('data-bag-icon') || '';
    var bagIconTeal = root.getAttribute('data-bag-icon-teal') || bagIcon;
    var cartUrl = root.getAttribute('data-cart-url') || '/comprar/';
    var list = readList();

    if (login) login.hidden = true;

    if (!list.length) {
      if (grid) grid.innerHTML = '';
      if (empty) empty.hidden = false;
      if (subtitle) {
        subtitle.hidden = true;
        subtitle.textContent = '';
      }
      return;
    }

    if (empty) empty.hidden = true;
    if (subtitle) {
      subtitle.hidden = false;
      subtitle.textContent = list.length === 1
        ? '1 produto na sua lista'
        : (list.length + ' produtos na sua lista');
    }

    if (!grid) return;
    grid.innerHTML = list.map(function (item) {
      var installments = formatInstallmentsPlp(item);
      var name = escapeHtml(item.name);
      var url = escapeHtml(item.url || '#');
      var image = escapeHtml(item.image || '');
      var price = escapeHtml(item.priceDisplay || formatMoneyCents(item.price));
      var compare = escapeHtml(item.comparePriceDisplay || '');
      var showCompare = !!(item.comparePrice && item.comparePrice > item.price && compare);
      var threePrice = escapeHtml(threePriceFor(item));
      var id = escapeHtml(item.id);
      return (
        '<article class="yamuna-favoritos-card item-product" data-product-id="' + id + '">' +
          '<div class="yamuna-favoritos-card-media-wrap">' +
            '<button type="button" class="yamuna-favoritos-heart js-yamuna-favoritos-remove is-active" data-product-id="' + id + '" aria-label="Remover dos favoritos" title="Remover dos favoritos">' +
              heartSvg() +
            '</button>' +
            '<a class="yamuna-favoritos-card-media item-image" href="' + url + '">' +
              (image ? '<img src="' + image + '" alt="' + name + '" loading="lazy" width="360" height="360" />' : '') +
            '</a>' +
          '</div>' +
          '<div class="yamuna-favoritos-card-body item-description">' +
            '<a class="yamuna-favoritos-card-name item-name item-link" href="' + url + '">' + name + '</a>' +
            '<div class="yamuna-plp-price-row">' +
              '<div class="item-price-container">' +
                (showCompare ? '<span class="price-compare">' + compare + '</span>' : '') +
                '<span class="item-price">' + price + '</span>' +
              '</div>' +
              (installments ? '<span class="item-installments">' + escapeHtml(installments) + '</span>' : '') +
            '</div>' +
          '</div>' +
          '<div class="yamuna-plp-item-actions yamuna-favoritos-card-actions">' +
            '<form class="js-product-form yamuna-favoritos-card-form" method="post" action="' + escapeHtml(cartUrl) + '">' +
              '<input type="hidden" name="add_to_cart" value="' + id + '" />' +
              '<input type="hidden" name="quantity" value="1" class="js-yamuna-favoritos-qty" />' +
              '<button type="submit" class="js-addtocart js-prod-submit-form yamuna-plp-buy-one" data-quantity="1">' +
                (bagIcon ? '<img src="' + escapeHtml(bagIcon) + '" alt="" aria-hidden="true" width="14" height="14" />' : '') +
                '<span>COMPRAR</span>' +
              '</button>' +
              '<button type="submit" class="js-addtocart js-prod-submit-form yamuna-plp-buy-three" data-quantity="3">' +
                (bagIconTeal ? '<img src="' + escapeHtml(bagIconTeal) + '" alt="" aria-hidden="true" width="14" height="14" />' : '') +
                '<span class="yamuna-plp-buy-three-prefix">COMPRE 3</span>' +
                (threePrice ? '<span class="yamuna-plp-buy-three-price"> POR ' + threePrice + ' CADA</span>' : '') +
              '</button>' +
            '</form>' +
          '</div>' +
        '</article>'
      );
    }).join('');

    grid.querySelectorAll('.yamuna-favoritos-card-form').forEach(function (form) {
      form.querySelectorAll('button[data-quantity]').forEach(function (btn) {
        btn.addEventListener('click', function () {
          var qty = form.querySelector('.js-yamuna-favoritos-qty');
          if (qty) qty.value = btn.getAttribute('data-quantity') || '1';
        });
      });
    });
  }

  function onRemoveClick(e) {
    var btn = e.target.closest('.js-yamuna-favoritos-remove');
    if (!btn) return;
    e.preventDefault();
    var id = btn.getAttribute('data-product-id');
    var list = readList().filter(function (item) {
      return !(item && String(item.id) === String(id));
    });
    writeList(list);
    syncButtons(list);
    renderFavoritosPage();
    showToast(false);
  }

  function bind() {
    document.addEventListener('click', function (e) {
      var toggle = e.target.closest('[data-yamuna-wishlist-toggle]');
      if (toggle) {
        e.preventDefault();
        e.stopPropagation();
        toggleProduct(toggle);
        return;
      }
      onRemoveClick(e);
    });

    window.addEventListener(EVENT_NAME, function () {
      syncButtons();
      renderFavoritosPage();
    });

    window.addEventListener('storage', function (e) {
      if (e && e.key && e.key.indexOf(STORAGE_PREFIX) === 0) {
        syncButtons();
        renderFavoritosPage();
      }
    });
  }

  function init() {
    mergeGuestIntoCustomer();
    syncButtons();
    renderFavoritosPage();
  }

  window.YamunaWishlist = {
    get: function () { return readList(); },
    has: function (id) { return findIndex(readList(), id) >= 0; },
    refresh: function () { syncButtons(); renderFavoritosPage(); }
  };

  bind();
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
</script>
