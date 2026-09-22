{% set use_yamuna_prod_hero = true %}
{% set yamuna_hero_banners = [
	{ 'desktop': 'images/yamuna/hero/desktop/01-kit-degustacao-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/01-kit-degustacao-mobile.jpg', 'link': '/degustacao/', 'title': 'Kit Degustação', 'description': 'Seis sabores em pequenas versões especiais para degustar e presentear', 'button': 'Comprar agora' },
	{ 'desktop': 'images/yamuna/hero/desktop/02-chocolates-yamuna-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/02-chocolates-yamuna-mobile.jpg', 'link': '/chocolates-e-cacau/', 'title': 'Chocolates Yamuna', 'description': 'Naturais, apaixonantes e feitos com puro cacau', 'button': 'Comprar' },
	{ 'desktop': 'images/yamuna/hero/desktop/03-tahines-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/03-tahines-mobile.jpg', 'link': '/tahines-e-gergelim/', 'title': 'Tahines', 'description': 'Abra-te Sésamo! Pasta de gergelim puro, na versão tradicional e com tâmaras', 'button': 'Comprar agora' },
	{ 'desktop': 'images/yamuna/hero/desktop/04-temperos-e-massalas-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/04-temperos-e-massalas-mobile.jpg', 'link': '/temperos-e-massalas/', 'title': 'Temperos e Massalas', 'description': 'Transforme seus pratos com sabores intensos e aromas envolventes', 'button': 'Comprar agora' },
	{ 'desktop': 'images/yamuna/hero/desktop/05-casa-sustentavel-desktop.png', 'mobile': 'images/yamuna/hero/mobile/05-casa-sustentavel-mobile.jpg', 'link': '/casa-sustentavel/', 'title': 'Casa Sustentável', 'description': 'Alternativas ecológicas para seu dia a dia', 'button': 'Comprar' },
	{ 'desktop': 'images/yamuna/hero/desktop/06-leites-concentrados-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/06-leites-concentrados-mobile.jpg', 'link': '/leites-vegetais/', 'title': 'Leites Concentrados', 'description': 'Rende muito, tem mais sabor e não gera lixo! Sem lactose, sem glúten e vegano', 'button': 'Comprar' },
	{ 'desktop': 'images/yamuna/hero/desktop/07-cafes-especiais-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/07-cafes-especiais-mobile.jpg', 'link': '/cafes-especiais/', 'title': 'Cafés Especiais', 'description': 'Naturalmente doces para estimular seu dia', 'button': 'Comprar' },
	{ 'desktop': 'images/yamuna/hero/desktop/08-sabonetes-vegetal-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/08-sabonetes-vegetal-mobile.jpg', 'link': '/sabonetes-naturais/', 'title': 'Sabonetes 100% vegetal', 'description': 'Perfumes naturais e nutrição para a sua pele', 'button': 'Comprar agora' },
	{ 'desktop': 'images/yamuna/hero/desktop/09-manteiga-ghee-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/09-manteiga-ghee-mobile.jpg', 'link': '/manteiga-ghee/', 'title': 'Manteiga ghee', 'description': 'Desde a antiguidade, o óleo mais saudável para consumo humano', 'button': 'Comprar agora' },
	{ 'desktop': 'images/yamuna/hero/desktop/10-leite-coco-po-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/10-leite-coco-po-mobile.jpg', 'link': '/produtos/leite-de-coco-em-po-zero-acucar-200g/', 'title': 'Leite de Coco em Pó', 'description': 'Novo Leite de Coco em Pó! Ainda mais saudável, mais funcional e zero açúcar', 'button': 'Comprar agora' },
	{ 'desktop': 'images/yamuna/hero/desktop/11-golden-milk-blend-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/11-golden-milk-blend-mobile.png', 'link': '/produtos/milk-golden-blend-400g/', 'title': 'Golden Milk Blend', 'description': 'Um elixir para saúde e vitalidade. Feito com amêndoas e especiarias', 'button': 'Comprar agora' },
	{ 'desktop': 'images/yamuna/hero/desktop/12-creme-de-castanhas-desktop.jpg', 'mobile': 'images/yamuna/hero/mobile/12-creme-de-castanhas-mobile.png', 'link': '/cremes-de-castanhas/', 'title': 'Creme de Castanhas', 'description': 'Feitos em moinho de pedra para um sabor fabuloso', 'button': 'Comprar agora' }
] %}

{% set has_main_slider = use_yamuna_prod_hero or (settings.slider and settings.slider is not empty) %}
{% set has_mobile_slider = use_yamuna_prod_hero or (settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty) %}
{% set has_auto_height_slider = not settings.slider_viewport_height %}
{% set use_smaller_thumbs = (has_auto_height_slider and not has_mobile_slider) or has_mobile_slider %}

{% if not mobile %}
	<style>
		.js-home-main-slider-container .js-swiper-home-pagination .swiper-pagination-bullet,
		.js-home-slider-mobile .js-swiper-home-pagination-mobile .swiper-pagination-bullet {
			background-color: #fff !important;
			background-image: none !important;
			opacity: .7 !important;
		}
		.js-home-main-slider-container .js-swiper-home-pagination .swiper-pagination-bullet-active,
		.js-home-slider-mobile .js-swiper-home-pagination-mobile .swiper-pagination-bullet-active {
			background-color: #fff !important;
			opacity: 1 !important;
		}
	</style>
{% endif %}

{% if not mobile %}
<div class="js-home-main-slider-container {% if not has_main_slider %}hidden{% endif %}">
{% endif %}
	<div class="js-live-preview-home-slider-container {% if mobile %}js-home-mobile-slider{% else %}js-home-main-slider{% endif %}-visibility {% if has_main_slider and has_mobile_slider %}{% if mobile %}d-md-none{% else %}d-none d-md-block{% endif %}{% elseif not settings.toggle_slider_mobile and mobile and not use_yamuna_prod_hero %}hidden{% endif %} {% if not settings.slider_full %} mt-4{% endif %} mb-0">
		<div class="container{% if settings.slider_full %}-fluid{% endif %}">
			<div class="row">
				<div class="col js-home-slider-col section-slider{% if settings.slider_full %} p-0{% endif %}{% if has_auto_height_slider %} section-slider-auto{% endif %}">
					<div class="js-home-slider{% if mobile %}-mobile{% endif %} nube-slider-home swiper-container{% if settings.theme_rounded and not settings.slider_full %} box-rounded{% endif %} js-swiper-roundable-border swiper-container-horizontal">
						<div class="swiper-wrapper">
							{% if use_yamuna_prod_hero %}
								{% set slider = yamuna_hero_banners %}
							{% elseif mobile %}
								{% set slider = settings.slider_mobile %}
							{% else %}
								{% set slider = settings.slider %}
							{% endif %}
							{% for slide in slider %}
								<div class="swiper-slide slide-container">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}" aria-label="{{ slide.title|default('Carrusel'|translate) }} {{ loop.index }}">
									{% endif %}
									{% set has_text = slide.title or slide.description or slide.button %}
									<div class="slider-slide{% if has_auto_height_slider %} position-relative h-auto{% endif %}">

									{% if use_yamuna_prod_hero %}
										{# First + last slides stay eager so loop clones never stick on the GIF placeholder. #}
										{% set apply_lazy_load = not loop.first and not loop.last %}
									{% else %}
										{% set apply_lazy_load = settings.home_order_position_0 != 'slider' or not loop.first %}
									{% endif %}

										{% if use_yamuna_prod_hero %}
											{% if mobile %}
												{% set slide_image = slide.mobile | static_url %}
											{% else %}
												{% set slide_image = slide.desktop | static_url %}
											{% endif %}
											<img
												{% if not apply_lazy_load %}fetchpriority="high"{% endif %}
												src="{% if apply_lazy_load %}data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=={% else %}{{ slide_image }}{% endif %}"
												{% if apply_lazy_load %}data-src="{{ slide_image }}"{% endif %}
												class="slider-image {% if apply_lazy_load %}swiper-lazy fade-in{% endif %}{% if has_auto_height_slider %} d-block{% endif %}"
												alt="{{ slide.title|default('Carrusel'|translate) }} {{ loop.index }}"
											/>
										{% else %}
											{% set slide_image = slide.image | static_url %}
											{% if apply_lazy_load %}
												{% set slide_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
											{% else %}
												{% set slide_src = slide_image | settings_image_url('large') %}
											{% endif %}
											<img
												{% if not apply_lazy_load %}fetchpriority="high"{% endif %}
												{% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
												{% if apply_lazy_load %}data-{% endif %}src="{{ slide_src }}"
												{% if apply_lazy_load %}data-{% endif %}srcset="{% if use_smaller_thumbs %}{{ slide_image | settings_image_url('large') }} 480w, {{ slide_image | settings_image_url('huge') }} 640w, {% endif %}{{ slide_image | settings_image_url('original') }} 1024w, {{ slide_image | settings_image_url('1080p') }} 1920w"
												class="slider-image {% if apply_lazy_load %}swiper-lazy fade-in{% endif %}{% if has_auto_height_slider %} d-block{% endif %}"
												alt="{{ 'Carrusel' | translate }} {{ loop.index }}"
											/>
										{% endif %}
										<div class="placeholder-fade"></div>

										{% if has_text %}
											<div class="yamuna-home-hero-overlay">
												{% if slide.title %}
													<h2 class="yamuna-home-hero-overlay-title">{{ slide.title }}</h2>
												{% endif %}
												{% if slide.description %}
													<p class="yamuna-home-hero-overlay-description">{{ slide.description }}</p>
												{% endif %}
												{% if slide.button %}
													{% if slide.link %}
														<span class="yamuna-home-hero-overlay-button">{{ slide.button }}</span>
													{% else %}
														<a class="yamuna-home-hero-overlay-button" href="{{ '/produtos/' | setting_url }}">{{ slide.button }}</a>
													{% endif %}
												{% endif %}
											</div>
										{% endif %}
									</div>
									{% if slide.link %}
										</a>
									{% endif %}
								</div>
							{% endfor %}
						</div>
						<div class="js-swiper-home-control js-swiper-home-pagination{% if mobile %}-mobile{% endif %} swiper-pagination swiper-pagination-bullets d-block">
							{% if slider | length > 1 and not params.preview %}
								{% for slide in slider %}
									<span class="swiper-pagination-bullet"></span>
								{% endfor %}
							{% endif %}
						</div>
						<div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev d-none d-md-block" aria-label="Slide anterior">
							<svg class="yamuna-home-hero-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
								<polyline points="15 6 9 12 15 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
							</svg>
						</div>
						<div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next d-none d-md-block" aria-label="Próximo slide">
							<svg class="yamuna-home-hero-arrow-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
								<polyline points="9 6 15 12 9 18" fill="none" stroke="currentColor" stroke-width="3.25" stroke-linecap="round" stroke-linejoin="round"/>
							</svg>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{% if not mobile %}
</div>
{% endif %}
