{# Mobile navigation adapted to the Yamuna Figma menu. #}
<nav class="yamuna-mobile-menu" aria-label="{{ 'Menú' | translate }}">
    <div class="yamuna-mobile-menu-account">
        {% if customer %}
            <a href="{{ store.customer_home_url }}" class="yamuna-mobile-menu-login">
                <img src="{{ 'images/yamuna/menu-user.svg' | static_url }}" alt="" />
                <span>{{ 'Mi cuenta' | translate }}</span>
            </a>
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
        <button type="submit" class="yamuna-mobile-menu-search-submit" aria-label="{{ 'Buscar' | translate }}">
            <img src="{{ 'images/yamuna/menu-search.svg' | static_url }}" alt="" aria-hidden="true" />
        </button>
    </form>

    <div class="yamuna-mobile-menu-search-suggest js-search-suggest"></div>

    <section class="yamuna-mobile-menu-products">
        <h2>PRODUTOS</h2>
        <ul>
            <li><a href="{{ '/degustacao' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-degustacao.svg' | static_url }}" alt="" />DEGUSTAÇÃO</a></li>
            <li><a href="{{ '/kits-presentes' | setting_url }}"><img src="{{ 'images/yamuna/menu-category-kits.svg' | static_url }}" alt="" />KITS E PRESENTES</a></li>
            <li><a href="{{ '/manteiga-ghee' | setting_url }}"><img src="{{ 'images/yamuna/menu-category-manteiga.svg' | static_url }}" alt="" />MANTEIGA GHEE</a></li>
            <li><a href="{{ '/cremes-de-castanhas' | setting_url }}"><img src="{{ 'images/yamuna/menu-category-castanhas.svg' | static_url }}" alt="" />CREME DE CASTANHAS</a></li>
            <li><a href="{{ '/alimentos-de-coco' | setting_url }}"><img src="{{ 'images/yamuna/menu-category-coco.svg' | static_url }}" alt="" />ALIMENTOS DE COCO</a></li>
            <li><a href="{{ '/shampoos-e-condicionadores-naturais' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-shampoo.svg' | static_url }}" alt="" />SHAMPOO E CONDICIONADOR EM BARRA</a></li>
            <li><a href="{{ '/cafes-especiais' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-chocolates.svg' | static_url }}" alt="" />CAFÉS</a></li>
            <li><a href="{{ '/chocolates-e-cacau' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-chocolates.svg' | static_url }}" alt="" />CHOCOLATES E CACAU</a></li>
            <li><a href="{{ '/sabonetes-naturais' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-sabonetes.svg' | static_url }}" alt="" />SABONETES</a></li>
            <li><a href="{{ '/temperos-e-massalas' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-temperos.svg' | static_url }}" alt="" />TEMPEROS E MASSALAS</a></li>
            <li><a href="{{ '/oleos-corporais' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-oleos.svg' | static_url }}" alt="" />ÓLEOS CORPORAIS</a></li>
            <li><a href="{{ '/adocantes-naturais' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-oleos.svg' | static_url }}" alt="" />ADOÇANTES NATURAIS</a></li>
            <li><a href="{{ '/leites-vegetais' | setting_url }}"><img src="{{ 'images/yamuna/menu-category-coco.svg' | static_url }}" alt="" />LEITES VEGETAIS</a></li>
            <li><a href="{{ '/nutraceuticos-capsulas' | setting_url }}"><img src="{{ 'images/yamuna/menu-icon-oleos.svg' | static_url }}" alt="" />NUTRACÊUTICOS/CÁPSULAS</a></li>
            <li><a href="{{ '/casa-sustentavel' | setting_url }}"><img src="{{ 'images/yamuna/menu-category-kits.svg' | static_url }}" alt="" />CASA SUSTENTÁVEL</a></li>
        </ul>
    </section>

    <section class="yamuna-mobile-menu-links">
        <a href="/quem-somos">QUEM SOMOS</a>
        <a href="/nossomanifesto">MANIFESTO</a>
        <a href="{{ store.blog_url }}">BLOG</a>
    </section>
    <section class="yamuna-mobile-menu-links yamuna-mobile-menu-links-last">
        <a href="{{ store.whatsapp }}" target="_blank" rel="noopener">ATENDIMENTO AO CLIENTE</a>
        <a href="/revenda">SEJA UM REVENDEDOR</a>
    </section>
</nav>
