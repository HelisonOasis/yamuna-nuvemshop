{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
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
	<div class="js-live-preview-home-slider-container {% if mobile %}js-home-mobile-slider{% else %}js-home-main-slider{% endif %}-visibility {% if has_main_slider and has_mobile_slider %}{% if mobile %}d-md-none{% else %}d-none d-md-block{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %} {% if not settings.slider_full %} mt-4{% endif %} mb-4">
		<div class="container{% if settings.slider_full %}-fluid{% endif %}">
			<div class="row">
				<div class="col js-home-slider-col section-slider{% if settings.slider_full %} p-0{% endif %}{% if has_auto_height_slider %} section-slider-auto{% endif %}">
					<div class="js-home-slider{% if mobile %}-mobile{% endif %} nube-slider-home swiper-container{% if settings.theme_rounded and not settings.slider_full %} box-rounded{% endif %} js-swiper-roundable-border swiper-container-horizontal">
						<div class="swiper-wrapper">
							{% if mobile %}
								{% set slider = settings.slider_mobile %}
							{% else %}
								{% set slider = settings.slider %}
							{% endif %}
							{# Keep hero navigation testable when the store has only one configured slide. #}
							{% set hero_controls_demo = slider | length == 1 %}
							{% if hero_controls_demo %}
								{% set slider = slider | merge(slider) %}
							{% endif %}
							{% for slide in slider %}
								<div class="swiper-slide slide-container">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
									{% endif %}	
									{% set has_text =  slide.title or slide.description or slide.button %}
									<div class="slider-slide{% if has_auto_height_slider %} position-relative h-auto{% endif %}">

										{% set apply_lazy_load = 
											settings.home_order_position_0 != 'slider' 
											or not (
												loop.first and (
													(has_main_slider and not has_mobile_slider) or 
													(has_mobile_slider and mobile)
												)
											) 
										%}

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
											class="slider-image {% if apply_lazy_load %}swiper-lazy fade-in{% endif %}{% if has_auto_height_slider %} d-block{% endif %}" alt="{{ 'Carrusel' | translate }} {{ loop.index }}"
										/>
										<div class="placeholder-fade"></div>

										{% if has_text %}
											<div class="swiper-text swiper-{{ slide.color }}">	
										{% if slide.title %}
											<div class="swiper-title{% if has_auto_height_slider and not has_mobile_slider %} swiper-title-small{% endif %}">{{ slide.title }}</div>
										{% endif %}
										{% if slide.description %}
											<div class="swiper-description {% if has_auto_height_slider and not has_mobile_slider %}font-small font-md-normal mb-md-3 mb-2{% else %}mb-3{% endif %}">{{ slide.description }}</div>
										{% endif %}
												{% if slide.button and slide.link %}
													<div class="btn btn-primary btn-small swiper-btn {% if has_auto_height_slider and not has_mobile_slider %} btn-extra-small btn-extra-small-md mt-md-4 mt-2  px-md-4{% else %}mt-4 px-4{% endif %}">{{ slide.button }}</div>
												{% endif %}
											</div>
										{% endif %}

										{% if loop.first or hero_controls_demo %}
											<div class="yamuna-home-hero-overlay">
												<h2 class="yamuna-home-hero-overlay-title">Creme de Castanhas</h2>
												<p class="yamuna-home-hero-overlay-description"><span class="yamuna-home-hero-copy-desktop">Feitos em moinho de pedra<br>para um sabor fabuloso</span><span class="yamuna-home-hero-copy-mobile">Feitos em moinho de pedra para<br>um sabor fabuloso</span></p>
												{% if slide.link %}
													<span class="yamuna-home-hero-overlay-button">Compre agora</span>
												{% else %}
													<a class="yamuna-home-hero-overlay-button" href="{{ '/produtos' | setting_url }}">Compre agora</a>
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
							<img class="yamuna-home-hero-arrow-icon" src="{{ 'images/yamuna/hero-arrow-prev.svg' | static_url }}" alt="" style="transform: scaleX(-1);">
						</div>
						<div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next d-none d-md-block" aria-label="Próximo slide">
							<img class="yamuna-home-hero-arrow-icon" src="{{ 'images/yamuna/hero-arrow-next.svg' | static_url }}" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{% if not mobile %}
</div>
{% endif %}
