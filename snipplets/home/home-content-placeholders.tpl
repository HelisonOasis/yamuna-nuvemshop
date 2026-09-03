{% if placeholder == 'blog' %}
  <section class="section-home-content-placeholder section-blog-placeholder" data-store="home-blog-placeholder">
    <div class="container">
      <h2>BLOG</h2>
    </div>
  </section>
{% elseif placeholder == 'instagram' %}
  <section class="section-home-content-placeholder section-instagram-placeholder" data-store="home-instagram-placeholder">
    <div class="container">
      <a href="https://www.instagram.com/yamunaartesanal/" target="_blank" rel="noopener" aria-label="Instagram da Yamuna Artesanal">
        <svg class="icon-inline" aria-hidden="true"><use xlink:href="#instagram"/></svg>
        <h2>@yamunaartesanal</h2>
      </a>
    </div>
  </section>
{% endif %}
