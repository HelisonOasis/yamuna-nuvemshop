{# Quick links to the main Yamuna product families. #}
{# Desktop keeps the original four-link composition. #}
<section class="section-yamuna-category-slider-desktop" aria-label="{{ 'Categorias' | translate }}" data-store="home-category-slider-desktop">
  <div class="yamuna-category-slider-desktop-container">
    <button class="yamuna-category-slider-desktop-arrow yamuna-category-slider-desktop-arrow-prev" type="button" aria-label="{{ 'Anterior' | translate }}">&lsaquo;</button>
    <div class="yamuna-category-slider-desktop-list">
      <div class="yamuna-category-slider-desktop-track">
      <a class="yamuna-category-slider-desktop-item" href="{{ '/nutraceuticos-capsulas' | setting_url }}">
        <span class="yamuna-category-slider-desktop-image"><img src="{{ 'images/yamuna/category-slider/nutraceuticos.png' | static_url }}" alt="Nutracêuticos" loading="lazy"></span>
        <span>Nutracêuticos</span>
      </a>
      <a class="yamuna-category-slider-desktop-item" href="{{ '/leites-vegetais' | setting_url }}">
        <span class="yamuna-category-slider-desktop-image"><img src="{{ 'images/yamuna/category-slider/leites-vegetais.png' | static_url }}" alt="Leites vegetais" loading="lazy"></span>
        <span>Leites vegetais</span>
      </a>
      <a class="yamuna-category-slider-desktop-item" href="{{ '/kits-presentes' | setting_url }}">
        <span class="yamuna-category-slider-desktop-image"><img src="{{ 'images/yamuna/category-slider/kits-presentes.png' | static_url }}" alt="Kits e presentes" loading="lazy"></span>
        <span>Kits e presentes</span>
      </a>
      <a class="yamuna-category-slider-desktop-item" href="{{ '/manteiga-ghee' | setting_url }}">
        <span class="yamuna-category-slider-desktop-image"><img src="{{ 'images/yamuna/category-slider/manteiga-ghee.png' | static_url }}" alt="Manteiga ghee" loading="lazy"></span>
        <span>Manteiga ghee</span>
      </a>
      </div>
    </div>
    <button class="yamuna-category-slider-desktop-arrow yamuna-category-slider-desktop-arrow-next" type="button" aria-label="{{ 'Próximo' | translate }}">&rsaquo;</button>
  </div>
</section>

{# Mobile follows the Figma rail, three cards visible at a time. #}
<section class="section-yamuna-category-slider" data-store="home-category-slider">
  <div class="yamuna-category-slider-container">
    <button class="yamuna-category-slider-arrow yamuna-category-slider-arrow-prev" type="button" aria-label="{{ 'Anterior' | translate }}">&lsaquo;</button>
    <div class="yamuna-category-slider-list swiper-container" id="home-category-slider">
      <div class="yamuna-category-slider-track swiper-wrapper">
      <a class="yamuna-category-slider-item swiper-slide" href="{{ '/manteiga-ghee' | setting_url }}">
        <span class="yamuna-category-slider-image"><img src="{{ 'images/yamuna/category-slider/figma-manteiga-ghee.png' | static_url }}" alt="Manteiga ghee" loading="lazy"></span>
        <span>Manteiga ghee</span>
      </a>
      <a class="yamuna-category-slider-item swiper-slide" href="{{ '/kits-presentes' | setting_url }}">
        <span class="yamuna-category-slider-image"><img src="{{ 'images/yamuna/category-slider/figma-kits-presentes.png' | static_url }}" alt="Kits e presentes" loading="lazy"></span>
        <span>Kits e presentes</span>
      </a>
      <a class="yamuna-category-slider-item swiper-slide" href="{{ '/cremes-de-castanhas' | setting_url }}">
        <span class="yamuna-category-slider-image"><img src="{{ 'images/yamuna/category-slider/figma-creme-castanhas.png' | static_url }}" alt="Creme de castanhas" loading="lazy"></span>
        <span>Creme de castanhas</span>
      </a>
      <a class="yamuna-category-slider-item swiper-slide" href="{{ '/nutraceuticos-capsulas' | setting_url }}">
        <span class="yamuna-category-slider-image"><img src="{{ 'images/yamuna/category-slider/nutraceuticos.png' | static_url }}" alt="Nutracêuticos" loading="lazy"></span>
        <span>Nutracêuticos</span>
      </a>
      <a class="yamuna-category-slider-item swiper-slide" href="{{ '/leites-vegetais' | setting_url }}">
        <span class="yamuna-category-slider-image"><img src="{{ 'images/yamuna/category-slider/leites-vegetais.png' | static_url }}" alt="Leites vegetais" loading="lazy"></span>
        <span>Leites vegetais</span>
      </a>
      </div>
    </div>
    <button class="yamuna-category-slider-arrow yamuna-category-slider-arrow-next" type="button" aria-label="{{ 'Próximo' | translate }}">&rsaquo;</button>
  </div>
</section>

<script>
  (function () {
    function initYamunaCategorySlider() {
      var section = document.querySelector('[data-store="home-category-slider"]');
      if (!section || section.dataset.sliderInitialized || window.innerWidth >= 768 || !window.Swiper) {
        return;
      }

      var slider = section.querySelector('.yamuna-category-slider-list');
      var previous = section.querySelector('.yamuna-category-slider-arrow-prev');
      var next = section.querySelector('.yamuna-category-slider-arrow-next');
      if (!slider || !previous || !next) {
        return;
      }

      section.dataset.sliderInitialized = 'true';
      new window.Swiper(slider, {
        slidesPerView: 'auto',
        spaceBetween: 24,
        initialSlide: 0,
        centeredSlides: false,
        slidesPerGroup: 1,
        loop: true,
        loopedSlides: 5,
        loopAdditionalSlides: 3,
        speed: 0,
        grabCursor: true,
        watchOverflow: false,
        navigation: {
          prevEl: previous,
          nextEl: next
        }
      });
    }

    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', initYamunaCategorySlider);
    } else {
      initYamunaCategorySlider();
    }
    window.addEventListener('load', initYamunaCategorySlider);
  })();
</script>

<script>
  (function () {
    function initYamunaDesktopCategorySlider() {
      var section = document.querySelector('[data-store="home-category-slider-desktop"]');
      if (!section || section.dataset.sliderInitialized || window.innerWidth < 768) {
        return;
      }

      var track = section.querySelector('.yamuna-category-slider-desktop-track');
      var previous = section.querySelector('.yamuna-category-slider-desktop-arrow-prev');
      var next = section.querySelector('.yamuna-category-slider-desktop-arrow-next');
      if (!track || !previous || !next || track.children.length < 2) {
        return;
      }

      section.dataset.sliderInitialized = 'true';
      function moveItems(direction) {
        if (direction === 'next') {
          track.appendChild(track.firstElementChild);
        } else {
          track.insertBefore(track.lastElementChild, track.firstElementChild);
        }
      }

      next.addEventListener('click', function () { moveItems('next'); });
      previous.addEventListener('click', function () { moveItems('previous'); });
    }

    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', initYamunaDesktopCategorySlider);
    } else {
      initYamunaDesktopCategorySlider();
    }
    window.addEventListener('load', initYamunaDesktopCategorySlider);
  })();
</script>
