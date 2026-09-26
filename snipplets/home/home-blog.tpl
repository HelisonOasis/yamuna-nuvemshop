<section class="yamuna-home-blog" data-store="home-blog">
	<div class="container">
		<h2 class="yamuna-home-blog-title">Aprenda</h2>
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
			<div class="js-swiper-blog-prev yamuna-home-blog-arrow yamuna-home-blog-arrow-prev" aria-label="Anterior">
				<svg class="yamuna-product-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
					<polyline points="15 6 9 12 15 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
				</svg>
			</div>
			<div class="js-swiper-blog-next yamuna-home-blog-arrow yamuna-home-blog-arrow-next" aria-label="Próximo">
				<svg class="yamuna-product-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
					<polyline points="9 6 15 12 9 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
				</svg>
			</div>
		</div>
		<div class="js-swiper-blog-pagination yamuna-home-blog-pagination swiper-pagination"></div>
		<p class="yamuna-home-blog-all">
			<a href="{{ store.blog_url }}">Ver todos os posts</a>
		</p>
	</div>
</section>
