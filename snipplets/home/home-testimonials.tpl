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
                position: relative;
                max-width: none !important;
                overflow: hidden !important;
                padding-left: 36px !important;
                padding-right: 36px !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide {
                display: flex !important;
                flex-direction: column !important;
                align-items: center !important;
                justify-content: flex-start !important;
                width: 100% !important;
                height: auto !important;
                min-height: 210px !important;
                flex: 0 0 100% !important;
                box-sizing: border-box !important;
                padding: 56px 12px 24px !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                top: 40px !important;
                left: 50% !important;
                width: min(248px, calc(100% - 16px)) !important;
                height: calc(100% - 48px) !important;
                transform: translateX(-50%) !important;
            }

            .section-testimonials-home .testimonial-quote {
                position: absolute !important;
                top: 22px !important;
                left: calc(50% - min(124px, 38%)) !important;
                width: min(67px, 22vw) !important;
                transform: none !important;
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
                width: min(220px, calc(100% - 24px)) !important;
                margin: 0 0 12px !important;
            }

            .section-testimonials-home .testimonial-text {
                width: min(220px, calc(100% - 32px)) !important;
                margin: 0 0 12px !important;
                font-size: 14px !important;
                line-height: 1.35 !important;
            }

            .section-testimonials-home .testimonial-author,
            .section-testimonials-home .testimonial-card--long .testimonial-author {
                width: min(200px, calc(100% - 32px)) !important;
                margin: 0 !important;
            }

            .section-testimonials-home .testimonials-nav {
                position: absolute;
                top: 50%;
                z-index: 3;
                display: flex;
                width: 40px;
                height: 40px;
                margin: 0;
                padding: 0;
                align-items: center;
                justify-content: center;
                border: 1px solid rgba(35, 132, 130, 0.22);
                border-radius: 50%;
                background: #fff;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                color: #238482;
                transform: translateY(-50%);
            }

            .section-testimonials-home .testimonials-nav:after {
                display: block;
                width: 14px;
                height: 14px;
                border: solid currentColor;
                border-width: 0 0 3px 3px;
                content: '';
            }

            .section-testimonials-home .testimonials-nav--prev {
                left: 2px;
                transform: translateY(-50%);
            }

            .section-testimonials-home .testimonials-nav--prev:after {
                transform: rotate(45deg);
            }

            .section-testimonials-home .testimonials-nav--next {
                right: 2px;
                transform: translateY(-50%);
            }

            .section-testimonials-home .testimonials-nav--next:after {
                transform: rotate(225deg);
            }

            .section-testimonials-home .testimonials-title {
                margin-bottom: 24px !important;
                color: #a31460 !important;
                font-family: 'Raleway', sans-serif !important;
                font-size: 24px !important;
                font-style: normal !important;
                font-weight: 500 !important;
                line-height: normal !important;
                text-align: center !important;
                text-transform: uppercase !important;
            }

            .section-testimonials-home {
                padding-top: 54px !important;
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
                min-height: 230px !important;
                padding: 64px 18px 28px !important;
                overflow: hidden !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                width: min(340px, calc(100% - 24px)) !important;
            }

            .section-testimonials-home .testimonial-quote {
                top: 28px !important;
                left: calc(50% - min(170px, 42%)) !important;
                width: 64px !important;
            }

            .section-testimonials-home .testimonial-stars,
            .section-testimonials-home .testimonial-text,
            .section-testimonials-home .testimonial-author,
            .section-testimonials-home .testimonial-card--long .testimonial-author {
                max-width: 100% !important;
                box-sizing: border-box !important;
            }

            .section-testimonials-home .testimonial-stars {
                width: min(280px, calc(100% - 56px)) !important;
            }

            .section-testimonials-home .testimonial-text {
                width: min(280px, calc(100% - 56px)) !important;
                max-width: min(280px, calc(100% - 56px)) !important;
                font-size: 14px !important;
                line-height: 1.35 !important;
                overflow-wrap: anywhere !important;
                word-break: break-word !important;
            }

            .section-testimonials-home .testimonial-author,
            .section-testimonials-home .testimonial-card--long .testimonial-author {
                width: min(240px, calc(100% - 56px)) !important;
                font-size: 13px !important;
            }
        }

        @media (max-width: 374px) {
            .section-testimonials-home .testimonials-slider {
                padding-left: 28px !important;
                padding-right: 28px !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide {
                min-height: 200px !important;
                padding: 52px 8px 22px !important;
            }

            .section-testimonials-home .testimonial-quote {
                top: 18px !important;
                width: 52px !important;
            }

            .section-testimonials-home .testimonial-text {
                width: min(200px, calc(100% - 20px)) !important;
                font-size: 13px !important;
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
