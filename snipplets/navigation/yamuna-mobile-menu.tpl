{# Mobile navigation adapted to the Yamuna Figma menu.
   Icons sourced from yamuna.com.br /img/m/ menu markers. #}
<nav class="yamuna-mobile-menu" aria-label="{{ 'Menú' | translate }}">
    <div class="yamuna-mobile-menu-account{% if customer %} yamuna-mobile-menu-account--logged{% endif %}">
        {% if customer %}
            <p class="yamuna-mobile-menu-welcome">
                <img src="{{ 'images/yamuna/menu-user.svg' | static_url }}" alt="" aria-hidden="true" />
                <span>Bem-vindo(a), {{ customer.name|split(' ')|slice(0, 1)|join }}</span>
            </p>
            <div class="yamuna-mobile-menu-account-actions">
                <a href="{{ store.customer_home_url }}" class="yamuna-mobile-menu-login">
                    <span>MINHA CONTA</span>
                </a>
                <span class="yamuna-mobile-menu-account-divider" aria-hidden="true"></span>
                <a href="{{ store.customer_logout_url }}" class="yamuna-mobile-menu-logout">SAIR</a>
            </div>
        {% else %}
            <a href="{{ store.customer_login_url }}" class="yamuna-mobile-menu-login">
                <img src="{{ 'images/yamuna/menu-user.svg' | static_url }}" alt="" />
                <span>LOGIN</span>
            </a>
            {% if 'mandatory' not in store.customer_accounts %}
                <span class="yamuna-mobile-menu-account-divider" aria-hidden="true"></span>
                <a href="{{ store.customer_register_url }}" class="yamuna-mobile-menu-register">CADASTRE-SE</a>
            {% endif %}
        {% endif %}
    </div>

    <form class="yamuna-mobile-menu-search js-search-container js-search-form" action="{{ store.search_url }}" method="get">
        <input class="yamuna-mobile-menu-search-input js-search-input" autocomplete="off" type="search" name="q" placeholder="BUSCAR POR..." aria-label="{{ 'Buscar' | translate }}" />
        <button type="button" class="yamuna-search-clear yamuna-mobile-menu-search-clear js-yamuna-search-clear" aria-label="Limpar busca">
            <svg class="icon-inline icon-w-10" aria-hidden="true"><use xlink:href="#times"/></svg>
        </button>
        <button type="submit" class="yamuna-mobile-menu-search-submit" aria-label="{{ 'Buscar' | translate }}">
            <img src="{{ 'images/yamuna/menu-search.svg' | static_url }}" alt="" aria-hidden="true" />
        </button>
    </form>

    <div class="yamuna-mobile-menu-search-suggest js-search-suggest"></div>

    <script>
    (function () {
      function bindDrawerSearch() {
        var menu = document.querySelector('#nav-hamburger .yamuna-mobile-menu');
        if (!menu) return;
        var suggest = menu.querySelector('.yamuna-mobile-menu-search-suggest');
        var input = menu.querySelector('.yamuna-mobile-menu-search-input');
        if (!suggest) return;

        function syncSearchState() {
          var hasResults = !!suggest.querySelector('.search-suggest-list, .js-search-suggest-all-link, .yamuna-search-suggest-item');
          var hidden = suggest.style.display === 'none';
          menu.classList.toggle('yamuna-menu-has-search', hasResults && !hidden);
        }

        var obs = new MutationObserver(syncSearchState);
        obs.observe(suggest, { childList: true, subtree: true, attributes: true, attributeFilter: ['style', 'class'] });

        if (input) {
          input.addEventListener('input', function () {
            if (!input.value) {
              suggest.innerHTML = '';
              suggest.style.display = 'none';
              menu.classList.remove('yamuna-menu-has-search');
            }
          });
        }

        menu.addEventListener('click', function (e) {
          var clearBtn = e.target.closest('.js-yamuna-search-clear');
          if (!clearBtn || !menu.contains(clearBtn)) return;
          e.preventDefault();
          e.stopPropagation();
          if (input) {
            input.value = '';
            input.focus();
          }
          suggest.innerHTML = '';
          suggest.style.display = 'none';
          menu.classList.remove('yamuna-menu-has-search');
        });

        syncSearchState();
      }

      if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', bindDrawerSearch);
      } else {
        bindDrawerSearch();
      }
    })();
    </script>

    <section class="yamuna-mobile-menu-products">
        <h2>PRODUTOS</h2>
        <ul>
            <li><a href="{{ '/degustacao' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/degustacao.png' | static_url }}" alt="" width="16" height="16" />DEGUSTAÇÃO</a></li>
            <li><a href="{{ '/kits-presentes' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/kits-e-presentes.png' | static_url }}" alt="" width="16" height="16" />KITS E PRESENTES</a></li>
            <li><a href="{{ '/manteiga-ghee' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/manteiga-ghee.png' | static_url }}" alt="" width="16" height="16" />MANTEIGA GHEE</a></li>
            <li><a href="{{ '/tahines' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/tahines-gergelim.png' | static_url }}" alt="" width="16" height="16" />TAHINES/GERGELIM</a></li>
            <li><a href="{{ '/cremes-de-castanhas' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/creme-de-castanhas.png' | static_url }}" alt="" width="16" height="16" />CREMES DE CASTANHAS</a></li>
            <li><a href="{{ '/creme-de-pistache' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/creme-de-pistache.png' | static_url }}" alt="" width="16" height="16" />CREME DE PISTACHE</a></li>
            <li><a href="{{ '/alimentos-de-coco' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/alimentos-de-coco.png' | static_url }}" alt="" width="16" height="16" />ALIMENTOS DE COCO</a></li>
            <li><a href="{{ '/adocantes-naturais' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/adocantes-naturais.png' | static_url }}" alt="" width="16" height="16" />ADOÇANTES NATURAIS</a></li>
            <li><a href="{{ '/chocolates-e-cacau' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/chocolates-e-cacau.png' | static_url }}" alt="" width="16" height="16" />CHOCOLATES E CACAU</a></li>
            <li><a href="{{ '/temperos-e-massalas' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/temperos-e-massalas.png' | static_url }}" alt="" width="16" height="16" />TEMPEROS E MASSALAS</a></li>
            <li><a href="{{ '/leites-vegetais' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/leites-vegetais.png' | static_url }}" alt="" width="16" height="16" />LEITES VEGETAIS</a></li>
            <li><a href="{{ '/cafes-especiais' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/cafes.png' | static_url }}" alt="" width="16" height="16" />CAFÉS ESPECIAIS</a></li>
            <li><a href="{{ '/nutraceuticos-capsulas' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/nutraceuticos-capsulas.png' | static_url }}" alt="" width="16" height="16" />NUTRACÊUTICOS/CÁPSULAS</a></li>
            <li><a href="{{ '/sabonetes-naturais' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/sabonetes.png' | static_url }}" alt="" width="16" height="16" />SABONETES</a></li>
            <li><a href="{{ '/shampoos-e-condicionadores-naturais' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/shampoo-e-condicionador-em-barra.png' | static_url }}" alt="" width="16" height="16" />SHAMPOO EM BARRA E CONDICIONADOR</a></li>
            <li><a href="{{ '/oleos-corporais' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/oleos-corporais.png' | static_url }}" alt="" width="16" height="16" />ÓLEOS CORPORAIS</a></li>
            <li><a href="{{ '/casa-sustentavel' | setting_url }}"><img src="{{ 'images/yamuna/menu-m/casa-sustentavel.png' | static_url }}" alt="" width="16" height="16" />CASA SUSTENTÁVEL</a></li>
        </ul>
    </section>

    <section class="yamuna-mobile-menu-links">
        <a href="/quem-somos">QUEM SOMOS</a>
        <a href="/nossomanifesto">MANIFESTO</a>
        <a href="{{ store.blog_url | default('/aprenda') }}">APRENDA</a>
    </section>
    <section class="yamuna-mobile-menu-links yamuna-mobile-menu-links-last">
        <a href="{{ store.whatsapp }}" target="_blank" rel="noopener">ATENDIMENTO AO CLIENTE</a>
        <a href="/revenda">SEJA UM REVENDEDOR</a>
    </section>
</nav>
