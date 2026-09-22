{# Mobile navigation adapted to the Yamuna Figma menu.
   Icons sourced from yamuna.com.br /img/m/ menu markers. #}
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
