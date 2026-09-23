{% set show_thumbs = product.media_count > 1 or product.video_url %}
{% if product.media_count > 0 or product.video_url %}
    {# Cenário 051: desktop gallery includes images + videos; own Fancybox group. #}
    <div class="yamuna-product-gallery-desktop">
        {% for media in product.media %}
            {% if media.isImage %}
                <a href="{{ media | product_image_url('original') }}" data-fancybox="product-gallery-desktop" class="yamuna-product-gallery-item">
                    <img src="{{ media | product_image_url('original') }}" alt="{{ media.alt }}" loading="{{ loop.first ? 'eager' : 'lazy' }}" {% if loop.first %}fetchpriority="high"{% endif %} />
                </a>
            {% elseif media.isVideo %}
                <a href="#product-video-modal-{{ media.id }}" data-fancybox="product-gallery-desktop" class="yamuna-product-gallery-item yamuna-product-gallery-item--video" aria-label="{{ 'Video de' | translate }} {{ product.name }}">
                    <img src="{{ media.thumbnail }}" alt="{{ 'Video de' | translate }} {{ product.name }}" loading="lazy" />
                    <span class="yamuna-product-gallery-play" aria-hidden="true">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M8 5.14v13.72L19 12 8 5.14z" fill="#fff"/></svg>
                    </span>
                </a>
            {% endif %}
        {% endfor %}
        {% if product.video_url %}
            {% set yamuna_yt_id = product.video_url | split('v=') | last | split('&') | first | split('/') | last %}
            <a href="#product-video-modal-" data-fancybox="product-gallery-desktop" class="yamuna-product-gallery-item yamuna-product-gallery-item--video" aria-label="{{ 'Video de' | translate }} {{ product.name }}">
                <img src="https://img.youtube.com/vi/{{ yamuna_yt_id }}/maxresdefault.jpg" alt="{{ 'Video de' | translate }} {{ product.name }}" loading="lazy" onerror="this.onerror=null;this.src='https://img.youtube.com/vi/{{ yamuna_yt_id }}/hqdefault.jpg';" />
                <span class="yamuna-product-gallery-play" aria-hidden="true">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M8 5.14v13.72L19 12 8 5.14z" fill="#fff"/></svg>
                </span>
            </a>
        {% endif %}
    </div>
{% endif %}
<div class="yamuna-product-gallery-mobile d-lg-none{% if product.media_count <= 1 %} yamuna-gallery-single{% else %} yamuna-gallery-multi{% endif %}">
<div class="row" data-store="product-image-{{ product.id }}"> 
	{% if show_thumbs %}
		<div class="col-2 d-none d-md-block">

			{# If product has more than 5 images truncate thumbs #}
			
			{% if product.media_count > 5 %}
				{% for media in product.media | take(5) %}
					{% include 'snipplets/product/product-image-thumbs.tpl' with {last_open_modal: product.media_count > 5} %}
				{% endfor %}
			{% else %}
				{% for media in product.media %}
					{% include 'snipplets/product/product-image-thumbs.tpl' %}
				{% endfor %}
			{% endif %}

			{# Video thumb #}

			{% if product.media_count > 5 %}
				<div class="mt-2">
			{% endif %}
					{% include 'snipplets/product/product-video.tpl' with {thumb: true} %}
			{% if product.media_count > 5 %}
				</div>
			{% endif %}
		</div> 
	{% endif %}
	{% if product.media_count > 0 %}
		<div class="product-image-container {% if show_thumbs %}col-12 col-md-10{% else %}col-12{% endif %} p-0">
			<div class="js-swiper-product nube-slider-product swiper-container"  data-product-images-amount="{{ product.media_count }}">

				{{ component('nubesdk-slot', { type: "product_detail_image" }) }}

				{% include 'snipplets/labels.tpl' with {'product_detail': true} %}
				<div class="swiper-wrapper">
					{% for media in product.media %}
						{% if media.isImage %}
							<div class="swiper-slide js-product-slide slider-slide" data-image="{{media.id}}" data-image-position="{{loop.index0}}">
								<a href="{{ media | product_image_url('4k') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block p-relative" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
										
									{% set apply_lazy_load = not loop.first %}

									{% if apply_lazy_load %}
										{% set product_image_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
									{% else %}
										{% set product_image_src = media | product_image_url('large') %}
									{% endif %}
									<img
										{% if not apply_lazy_load %}fetchpriority="high"{% endif %}
										{% if apply_lazy_load %}data-{% endif %}src="{{ product_image_src }}"
										{% if apply_lazy_load %}data-{% endif %}srcset='{{  media | product_image_url('large') }} 480w, {{  media | product_image_url('huge') }} 640w, {{  media | product_image_url('original') }} 1024w, {{  media | product_image_url('1080p') }} 1920w, {{  media | product_image_url('1440p') }} 2560w, {{  media | product_image_url('4k') }} 3840w' 
										class="js-product-slide-img product-slider-image img-absolute img-absolute-centered {% if apply_lazy_load %}lazyautosizes lazyload{% endif %}{% if settings.theme_rounded %} box-rounded{% endif %}" 
										{% if apply_lazy_load %}data-sizes="auto"{% endif %}
										{% if media.dimensions.width and media.dimensions.height %}width="{{ media.dimensions.width }}" height="{{ media.dimensions.height }}"{% endif %}
										{% if media.alt %}alt="{{media.alt}}"{% endif %} />
								</a>
							</div>
						{% else %}
							{% include 'snipplets/product/product-video.tpl' with {video_id: media.next_video, product_native_video: true} %}
						{% endif %}
					{% endfor %}
					{% include 'snipplets/product/product-video.tpl' %}
				</div>
				{% if product.media_count > 1 %}
					<button type="button" class="js-swiper-product-prev yamuna-pdp-gallery-arrow yamuna-pdp-gallery-arrow-prev" aria-label="{{ 'Anterior' | translate }}"></button>
					<button type="button" class="js-swiper-product-next yamuna-pdp-gallery-arrow yamuna-pdp-gallery-arrow-next" aria-label="{{ 'Próximo' | translate }}"></button>
					<div class="js-swiper-product-pagination swiper-pagination yamuna-pdp-gallery-pagination"></div>
				{% endif %}
			</div>
		</div>
	{% endif %}
</div>
</div>
