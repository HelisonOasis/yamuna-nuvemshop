<div class="yamuna-blog-post-page">
	<div class="container">
		{% embed "snipplets/page-header.tpl" with { breadcrumbs: true, page_header_title_class: 'yamuna-blog-post-title' } %}
			{% block page_header_text %}{{ post.title }}{% endblock page_header_text %}
		{% endembed %}
		<article class="yamuna-blog-post">
			{{ component(
				'blog/blog-post-content', {
					image_lazy: true,
					image_lazy_js: true,
					post_content_classes: {
						date: 'yamuna-blog-post-date',
						image: 'yamuna-blog-post-image img-fluid fade-in',
						content: 'yamuna-blog-post-body',
					},
				})
			}}
		</article>
	</div>
</div>

{# Produtos relacionados ao tema do post (prod: yamuna.com.br/aprenda/*) #}
{% include 'snipplets/blog/blog-related-products.tpl' %}
