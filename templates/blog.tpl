<div class="yamuna-blog-page">
	<div class="container">
		<h1 class="yamuna-blog-page-title">Blog</h1>

		{% if blog.posts %}
			{% if not blog.pages.current or blog.pages.current == 1 %}
				<section class="yamuna-blog-featured" aria-label="Destaques">
					{% for post in blog.posts %}
						{% if loop.index <= 3 %}
							{% include 'snipplets/blog/yamuna-blog-card.tpl' with { variant: 'featured' } %}
						{% endif %}
					{% endfor %}
				</section>
			{% endif %}

			<div class="yamuna-blog-search-row">
				<p class="yamuna-blog-search-label">Procurando algum assunto?</p>
				<form class="yamuna-blog-search js-yamuna-blog-search" action="{{ store.blog_url }}" method="get" role="search">
					<label class="yamuna-blog-search-field">
						<span class="yamuna-blog-search-float">Pesquisar post</span>
						<input class="js-yamuna-blog-q" type="search" name="q" autocomplete="off" />
						<button class="yamuna-blog-search-submit" type="submit" aria-label="Pesquisar">
							<img src="{{ 'images/yamuna/menu-search.svg' | static_url }}" alt="" width="20" height="20" />
						</button>
					</label>
					<div class="yamuna-blog-search-suggest" aria-live="polite"></div>
				</form>
			</div>

			<div class="yamuna-blog-layout">
				<aside class="yamuna-blog-sidebar">
					<p class="yamuna-blog-cats-title">Categorias</p>
					<nav class="yamuna-blog-cats" aria-label="Categorias do blog">
						<button type="button" class="js-yamuna-blog-cat is-active" data-cat="all">Todos</button>
						<button type="button" class="js-yamuna-blog-cat" data-cat="receitas">Receitas</button>
						<button type="button" class="js-yamuna-blog-cat" data-cat="saude">Saúde</button>
						<button type="button" class="js-yamuna-blog-cat" data-cat="conhecimento">Conhecimento</button>
						<button type="button" class="js-yamuna-blog-cat" data-cat="ayurveda">Ayurveda</button>
					</nav>

					<a class="yamuna-blog-shop-btn" href="{{ store.url }}/produtos/">Comprar produtos</a>
				</aside>

				<section class="yamuna-blog-grid" aria-label="Todos os posts">
					{% for post in blog.posts %}
						{% include 'snipplets/blog/yamuna-blog-card.tpl' with { variant: 'grid' } %}
					{% endfor %}
					<p class="yamuna-blog-empty js-yamuna-blog-empty" hidden>Poxa, não encontramos nenhum post relacionado a sua busca.</p>
				</section>
			</div>
		{% else %}
			<p class="yamuna-blog-empty is-visible">Em breve, novos conteúdos por aqui.</p>
		{% endif %}

		{% if blog.pages and (blog.pages.next or blog.pages.previous or blog.pages.numbers) %}
			<div class="yamuna-blog-pagination">
				{% include 'snipplets/grid/pagination.tpl' with {'pages': blog.pages} %}
				{% if not blog.pages.numbers %}
					<div class="d-flex justify-content-center align-items-center mt-4">
						{% if blog.pages.previous %}
							<a class="yamuna-blog-page-link" href="{{ blog.pages.previous }}">Anterior</a>
						{% endif %}
						{% if blog.pages.next %}
							<a class="yamuna-blog-page-link" href="{{ blog.pages.next }}">Próxima</a>
						{% endif %}
					</div>
				{% endif %}
			</div>
		{% endif %}
	</div>
</div>

<script>
  (function () {
    var search = document.querySelector('.js-yamuna-blog-q');
    var form = document.querySelector('.js-yamuna-blog-search');
    var dropdown = document.querySelector('.yamuna-blog-search-suggest');
    var cards = document.querySelectorAll('.yamuna-blog-grid .js-yamuna-blog-card');

    if (!search || !form || !dropdown || !cards.length) return;

    function normalize(value) {
      return (value || '').replace(/\s+/g, ' ').trim();
    }

    function getPosts() {
      var posts = [];
      cards.forEach(function (card) {
        var title = card.querySelector('.yamuna-blog-card-title');
        var link = title && title.closest('a');
        if (title && link) {
          posts.push({ title: normalize(title.textContent), url: link.href });
        }
      });
      return posts;
    }

    var posts = getPosts();

    function closeDropdown() {
      dropdown.classList.remove('is-open');
      form.classList.remove('is-suggest-open');
      dropdown.innerHTML = '';
    }

    function updateDropdown() {
      var query = normalize(search.value).toLowerCase();
      if (!query) {
        closeDropdown();
        return;
      }

      var matches = posts.filter(function (post) {
        return post.title.toLowerCase().indexOf(query) !== -1;
      }).slice(0, 5);

      dropdown.innerHTML = '';
      matches.forEach(function (post) {
        var link = document.createElement('a');
        link.href = post.url;
        link.textContent = post.title;
        dropdown.appendChild(link);
      });
      dropdown.classList.toggle('is-open', matches.length > 0);
      form.classList.toggle('is-suggest-open', matches.length > 0);
    }

    search.addEventListener('input', updateDropdown);
    search.addEventListener('focus', updateDropdown);
    search.addEventListener('keydown', function (event) {
      if (event.key === 'Escape') closeDropdown();
    });
    form.addEventListener('submit', function (event) {
      event.preventDefault();
      closeDropdown();
    });
    document.addEventListener('click', function (event) {
      if (!form.contains(event.target) && !dropdown.contains(event.target)) closeDropdown();
    });
  })();
</script>
