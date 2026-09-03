<section class="section-testimonials-home" data-store="home-testimonials">
    <style id="testimonials-layout-mobile-fix">
        .section-testimonials-home .testimonials-nav {
            display: none;
        }

        @media (min-width: 1024px) {
            .section-testimonials-home .testimonials-slider {
                width: 100% !important;
                max-width: none !important;
                margin: 0 !important;
                overflow: visible !important;
            }

            .section-testimonials-home .testimonials-grid.swiper-wrapper {
                display: grid !important;
                width: 100% !important;
                grid-template-columns: repeat(3, minmax(0, 1fr));
                transform: none !important;
                transition: none !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide {
                width: auto !important;
                height: 300px;
                flex: none !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide-duplicate {
                display: none !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                display: none !important;
            }

            .section-testimonials-home .testimonial-stars,
            .section-testimonials-home .testimonial-text,
            .section-testimonials-home .testimonial-author {
                left: 50% !important;
                transform: translateX(-50%) !important;
            }

            .section-testimonials-home .testimonial-quote {
                left: 48px !important;
            }
        }

        @media (min-width: 1024px) and (max-width: 1199px) {
            .section-testimonials-home .testimonial-card.swiper-slide {
                display: flex !important;
                height: 260px;
                padding: 112px 18px 18px;
                align-items: center;
                flex-direction: column;
                justify-content: flex-start;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                top: 70px;
                height: 180px;
            }

            .section-testimonials-home .testimonial-quote {
                top: 54px;
                left: 32px !important;
                width: 76px;
            }

            .section-testimonials-home .testimonial-stars,
            .section-testimonials-home .testimonial-text,
            .section-testimonials-home .testimonial-author,
            .section-testimonials-home .testimonial-card--long .testimonial-author {
                position: relative !important;
                top: auto !important;
                left: auto !important;
                transform: none !important;
            }

            .section-testimonials-home .testimonial-stars {
                width: auto !important;
                margin: 0 0 14px !important;
            }

            .section-testimonials-home .testimonial-text {
                width: 100% !important;
                margin: 0 0 8px !important;
                font-size: 16px !important;
                line-height: 1.3 !important;
            }

            .section-testimonials-home .testimonial-author {
                width: 100% !important;
                font-size: 14px !important;
            }
        }

        .section-testimonials-home .testimonials-title {
            color: #a31460 !important;
            font-family: 'Roboto', sans-serif !important;
            font-size: 32px !important;
            font-weight: 500 !important;
            line-height: normal !important;
            margin-bottom: 0 !important;
        }

        .section-testimonials-home .testimonial-author {
            color: #4a1d3a !important;
            font-family: 'Roboto', sans-serif !important;
            font-size: 18px !important;
            font-style: italic !important;
            font-weight: 400 !important;
            line-height: 1.3 !important;
        }

        @media (max-width: 1023px) {
            .section-testimonials-home .testimonials-slider {
                max-width: none !important;
                overflow: hidden !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide {
                width: 100% !important;
                flex: 0 0 100% !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before,
            .section-testimonials-home .testimonial-stars {
                left: 50% !important;
                transform: translateX(-50%) !important;
            }

            .section-testimonials-home .testimonial-text,
            .section-testimonials-home .testimonial-author {
                left: 50% !important;
            }

            .section-testimonials-home .testimonial-quote {
                left: calc(50% - 128px) !important;
            }

            .section-testimonials-home .testimonials-slider {
                position: relative;
            }

            .section-testimonials-home .testimonials-nav {
                position: absolute;
                top: 134px;
                z-index: 3;
                display: flex;
                width: 40px;
                height: 40px;
                margin: 0;
                padding: 0;
                align-items: center;
                justify-content: center;
                border: 0;
                background: transparent;
                color: #238482;
                transform: translateY(-50%);
            }

            .section-testimonials-home .testimonials-nav:after {
                display: block;
                width: 12px;
                height: 12px;
                border: solid currentColor;
                border-width: 0 0 2px 2px;
                content: '';
            }

            .section-testimonials-home .testimonials-nav--prev {
                left: 0;
                transform: translate(-6px, -50%);
            }

            .section-testimonials-home .testimonials-nav--prev:after {
                transform: rotate(45deg);
            }

            .section-testimonials-home .testimonials-nav--next {
                right: 0;
                transform: translate(6px, -50%);
            }

            .section-testimonials-home .testimonials-nav--next:after {
                transform: rotate(225deg);
            }

            .section-testimonials-home .testimonials-title {
                color: #a31460 !important;
                font-family: 'Raleway', sans-serif !important;
                font-size: 18px !important;
                font-style: normal !important;
                font-weight: 500 !important;
                line-height: normal !important;
                text-align: center !important;
                text-transform: uppercase !important;
            }

            .section-testimonials-home .testimonial-author {
                color: #4a1d3a !important;
                font-family: 'Raleway', sans-serif !important;
                font-size: 12px !important;
                font-style: italic !important;
                font-weight: 400 !important;
                line-height: 130% !important;
                text-align: center !important;
            }
        }

        @media (min-width: 768px) and (max-width: 1023px) {
            .section-testimonials-home .testimonials-slider {
                max-width: 460px !important;
                margin: 0 auto !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide {
                height: 240px;
                min-height: 240px;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                top: 60px;
                width: min(400px, calc(100% - 48px));
                height: 160px;
            }

            .section-testimonials-home .testimonial-quote {
                top: 40px;
                left: calc(50% - 204px) !important;
                width: 64px;
            }

            .section-testimonials-home .testimonial-stars {
                top: 94px;
                width: min(400px, calc(100% - 48px));
            }

            .section-testimonials-home .testimonial-text {
                top: 118px;
                width: min(320px, calc(100% - 56px));
                font-size: 16px;
            }

            .section-testimonials-home .testimonial-author,
            .section-testimonials-home .testimonial-card--long .testimonial-author {
                top: 178px;
                font-size: 14px !important;
            }

            .section-testimonials-home .testimonials-nav {
                top: 140px;
            }
        }

        @media (max-width: 767px) {
            .section-testimonials-home .testimonial-quote {
                top: 44px;
                width: 67px;
            }

            .section-testimonials-home .testimonial-card--long .testimonial-author {
                top: 180px;
            }
        }
    </style>
    <div class="container-fluid">
        <h2 class="testimonials-title">Depoimentos</h2>
        <div class="testimonials-slider js-swiper-testimonials swiper-container" aria-label="Depoimentos de clientes">
            <div class="testimonials-grid swiper-wrapper">
            <article class="testimonial-card testimonial-card--short swiper-slide">
                <img class="testimonial-quote" src="{{ 'images/yamuna/icone-aspas.png' | static_url }}" alt="" aria-hidden="true" />
                <div class="testimonial-stars" aria-label="5 de 5 estrelas">
                    {% for i in 1..5 %}<img src="{{ 'images/yamuna/icone-estrela.svg' | static_url }}" alt="" />{% endfor %}
                </div>
                <p class="testimonial-text">Eu só uso a ghee Yamuna há tempos. Excelente!</p>
                <p class="testimonial-author">Regina S.</p>
            </article>
            <article class="testimonial-card testimonial-card--long swiper-slide">
                <img class="testimonial-quote" src="{{ 'images/yamuna/icone-aspas.png' | static_url }}" alt="" aria-hidden="true" />
                <div class="testimonial-stars" aria-label="5 de 5 estrelas">
                    {% for i in 1..5 %}<img src="{{ 'images/yamuna/icone-estrela.svg' | static_url }}" alt="" />{% endfor %}
                </div>
                <p class="testimonial-text">Excelência no que faz, dá para sentir o amor em cada produto.</p>
                <p class="testimonial-author">Denise J.</p>
            </article>
            <article class="testimonial-card testimonial-card--long swiper-slide">
                <img class="testimonial-quote" src="{{ 'images/yamuna/icone-aspas.png' | static_url }}" alt="" aria-hidden="true" />
                <div class="testimonial-stars" aria-label="5 de 5 estrelas">
                    {% for i in 1..5 %}<img src="{{ 'images/yamuna/icone-estrela.svg' | static_url }}" alt="" />{% endfor %}
                </div>
                <p class="testimonial-text">Produtos Fantásticos!! Saborosos, nutrem o corpo e a alma!</p>
                <p class="testimonial-author">Maiara R.</p>
            </article>
            </div>
            <button type="button" class="testimonials-nav testimonials-nav--prev js-swiper-testimonials-prev" aria-label="Depoimento anterior"></button>
            <button type="button" class="testimonials-nav testimonials-nav--next js-swiper-testimonials-next" aria-label="Próximo depoimento"></button>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                if (!window.matchMedia('(max-width: 1023px)').matches) return;

                var testimonialsSlider = document.querySelector('.js-swiper-testimonials');
                var previousButton = document.querySelector('.js-swiper-testimonials-prev');
                var nextButton = document.querySelector('.js-swiper-testimonials-next');

                if (!testimonialsSlider || !previousButton || !nextButton) return;

                previousButton.addEventListener('click', function () {
                    if (testimonialsSlider.swiper) testimonialsSlider.swiper.slidePrev();
                });

                nextButton.addEventListener('click', function () {
                    if (testimonialsSlider.swiper) testimonialsSlider.swiper.slideNext();
                });
            });
        </script>
    </div>
</section>
