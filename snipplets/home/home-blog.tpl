<section class="yamuna-home-blog" data-store="home-blog">
	<div class="container">
		<h2 class="yamuna-home-blog-title">Blog</h2>
		<div class="yamuna-home-blog-slider">
			<div class="js-swiper-blog swiper-container">
				<div class="swiper-wrapper js-yamuna-home-blog-track">
					{% if blog.posts %}
						{% for post in blog.posts %}
							{% if loop.index <= 12 %}
								{% include 'snipplets/blog/yamuna-blog-card.tpl' with { variant: 'home', slide_item: true } %}
							{% endif %}
						{% endfor %}
					{% endif %}
				</div>
			</div>
			<div class="js-swiper-blog-prev yamuna-home-blog-arrow yamuna-home-blog-arrow-prev" aria-label="Anterior"></div>
			<div class="js-swiper-blog-next yamuna-home-blog-arrow yamuna-home-blog-arrow-next" aria-label="Próximo"></div>
		</div>
		<div class="js-swiper-blog-pagination yamuna-home-blog-pagination swiper-pagination"></div>
		<p class="yamuna-home-blog-all">
			<a href="{{ store.blog_url }}">Ver todos os posts</a>
		</p>
	</div>
</section>
