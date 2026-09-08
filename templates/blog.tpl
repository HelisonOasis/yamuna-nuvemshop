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
