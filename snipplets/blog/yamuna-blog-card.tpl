{% set variant = variant | default('grid') %}
{% set slide_item = slide_item | default(false) %}

<article class="yamuna-blog-card yamuna-blog-card--{{ variant }}{% if slide_item %} swiper-slide{% endif %} js-yamuna-blog-card">
	{{ component(
		'blog/blog-post-item', {
			image_lazy: true,
			image_lazy_js: true,
			image_data_expand: '600',
			post_item_classes: {
				item: 'yamuna-blog-card-inner',
				image_container: 'yamuna-blog-card-image',
				image: 'img-absolute img-absolute-centered fade-in',
				information: 'yamuna-blog-card-info',
				title: 'yamuna-blog-card-title',
				summary: 'yamuna-blog-card-summary',
				read_more: variant == 'featured' ? 'yamuna-blog-cta yamuna-blog-cta-continue' : 'yamuna-blog-cta yamuna-blog-cta-more',
			},
		})
	}}
</article>
