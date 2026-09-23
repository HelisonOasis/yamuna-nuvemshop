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

{# Cenário 022: remove identificação do autor (nome/e-mail), mantém só a data #}
<script>
(function () {
  function stripBlogAuthor() {
    var nodes = document.querySelectorAll('.yamuna-blog-post-date, .yamuna-blog-post-page .post-date, .yamuna-blog-post .post-date');
    for (var i = 0; i < nodes.length; i++) {
      var el = nodes[i];
      var text = (el.textContent || '').replace(/\s+/g, ' ').trim();
      if (!text) continue;
      var cleaned = text
        .replace(/\s+por\s+.+$/i, '')
        .replace(/\s+by\s+.+$/i, '')
        .replace(/\s*\([^)]*@[^)]*\)\s*/g, '')
        .trim();
      if (cleaned && cleaned !== text) {
        el.textContent = cleaned;
      }
    }
    var authors = document.querySelectorAll(
      '.yamuna-blog-post-page .post-author, .yamuna-blog-post-page .blog-post-author, .yamuna-blog-post-page .author, .yamuna-blog-post-date a'
    );
    for (var j = 0; j < authors.length; j++) {
      authors[j].style.setProperty('display', 'none', 'important');
    }
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', stripBlogAuthor);
  } else {
    stripBlogAuthor();
  }
  window.addEventListener('load', stripBlogAuthor);
})();
</script>

{# Produtos relacionados ao tema do post (prod: yamuna.com.br/aprenda/*) #}
{% include 'snipplets/blog/blog-related-products.tpl' %}
