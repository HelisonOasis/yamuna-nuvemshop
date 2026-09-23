<section class="section-testimonials-home" data-store="home-testimonials">
    <style id="testimonials-layout-mobile-fix">
        .section-testimonials-home .testimonials-slider {
            position: relative;
            overflow: hidden;
        }

        .section-testimonials-home .testimonials-nav {
            display: flex;
            position: absolute;
            top: 50%;
            z-index: 5;
            width: 40px;
            height: 40px;
            margin: 0;
            padding: 0;
            align-items: center;
            justify-content: center;
            border: 1px solid rgba(35, 132, 130, 0.35);
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.92);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            color: #238482;
            line-height: 0;
            overflow: hidden;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .section-testimonials-home .testimonials-nav:after {
            display: block;
            width: 9px;
            height: 9px;
            border: solid currentColor;
            border-width: 0 0 2.5px 2.5px;
            box-sizing: border-box;
            content: '';
        }

        .section-testimonials-home .testimonials-nav--prev {
            left: 4px;
            right: auto;
        }

        .section-testimonials-home .testimonials-nav--prev:after {
            transform: translateX(1.5px) rotate(45deg);
        }

        .section-testimonials-home .testimonials-nav--next {
            right: 4px;
            left: auto;
        }

        .section-testimonials-home .testimonials-nav--next:after {
            transform: translateX(-1.5px) rotate(225deg);
        }

        @media (min-width: 768px) {
            .section-testimonials-home .testimonials-nav {
                width: 48px;
                height: 48px;
            }

            .section-testimonials-home .testimonials-nav--prev {
                left: 12px;
            }

            .section-testimonials-home .testimonials-nav--next {
                right: 12px;
            }
        }

        /* Desktop: 3 cards; arrows sit centered in the gutters between cards. */
        @media (min-width: 1024px) {
            .section-testimonials-home .testimonials-slider {
                width: 100% !important;
                max-width: none !important;
                margin: 0 !important;
                overflow: hidden !important;
                padding-left: 0 !important;
                padding-right: 0 !important;
            }

            /* spaceBetween: 24 → gap centers at ~1/3 and ~2/3 of the track */
            .section-testimonials-home .testimonials-nav {
                transform: translate(-50%, -50%) !important;
            }

            .section-testimonials-home .testimonials-nav--prev {
                left: calc((100% - 48px) / 3 + 12px) !important;
                right: auto !important;
            }

            .section-testimonials-home .testimonials-nav--next {
                left: calc(2 * ((100% - 48px) / 3) + 36px) !important;
                right: auto !important;
            }

            .section-testimonials-home .testimonials-grid.swiper-wrapper {
                display: flex !important;
                width: 100% !important;
                align-items: stretch !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide {
                display: flex !important;
                flex-direction: column !important;
                align-items: center !important;
                justify-content: flex-start !important;
                box-sizing: border-box !important;
                /* Do NOT set width:!important — Swiper inline width must win over 460px. */
                min-width: 0 !important;
                max-width: none !important;
                flex: 0 0 auto !important;
                height: 300px !important;
                min-height: 300px !important;
                padding: 72px 24px 28px !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                top: 90px !important;
                left: 50% !important;
                width: min(400px, calc(100% - 48px)) !important;
                height: 210px !important;
                transform: translateX(-50%) !important;
                display: block !important;
            }

            .section-testimonials-home .testimonial-quote {
                position: absolute !important;
                top: 72px !important;
                left: calc(50% - min(200px, 42%)) !important;
                width: 108px !important;
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
                width: min(360px, 90%) !important;
                margin-left: auto !important;
                margin-right: auto !important;
            }

            .section-testimonials-home .testimonial-stars {
                margin: 0 0 16px !important;
                justify-content: center !important;
            }

            .section-testimonials-home .testimonial-text {
                margin: 0 0 12px !important;
            }

            .section-testimonials-home .testimonial-author {
                margin: 0 !important;
            }
        }

        @media (min-width: 1024px) and (max-width: 1199px) {
            .section-testimonials-home .testimonial-card.swiper-slide {
                height: 260px !important;
                min-height: 260px !important;
                padding: 56px 18px 18px !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                top: 70px !important;
                height: 180px !important;
            }

            .section-testimonials-home .testimonial-quote {
                top: 54px !important;
                width: 76px !important;
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

            .section-testimonials-home .testimonials-nav--prev {
                left: 2px;
                right: auto;
            }

            .section-testimonials-home .testimonials-nav--next {
                right: 2px;
                left: auto;
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
                overflow: hidden !important;
                padding-left: 40px !important;
                padding-right: 40px !important;
            }

            .section-testimonials-home .testimonials-grid.swiper-wrapper {
                display: flex !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide {
                width: 100% !important;
                max-width: 100% !important;
                min-width: 0 !important;
                flex: 0 0 100% !important;
                min-height: 230px !important;
                padding: 64px 18px 28px !important;
                overflow: hidden !important;
            }

            .section-testimonials-home .testimonial-card.swiper-slide:before {
                width: min(340px, calc(100% - 24px)) !important;
            }

            .section-testimonials-home .testimonial-quote {
                top: 28px !important;
                width: 80px !important;
            }

            .section-testimonials-home .testimonial-stars,
            .section-testimonials-home .testimonial-text,
            .section-testimonials-home .testimonial-author,
            .section-testimonials-home .testimonial-card--long .testimonial-author {
                width: min(280px, calc(100% - 32px)) !important;
            }

            .section-testimonials-home .testimonial-stars {
                margin-bottom: 14px !important;
            }

            .section-testimonials-home .testimonial-text {
                font-size: 15px !important;
            }

            .section-testimonials-home .testimonial-author,
            .section-testimonials-home .testimonial-card--long .testimonial-author {
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
        <a class="yamuna-google-reviews-badge" href="https://www.google.com/maps/place/Yamuna+Artesanal" target="_blank" rel="noopener" aria-label="Mais de 1300 avaliações 5 estrelas no Google">
            <span class="yamuna-google-reviews-badge__stars" aria-hidden="true">★★★★★</span>
            <span class="yamuna-google-reviews-badge__text">+ de <strong>1.300</strong> avaliações 5 estrelas no Google</span>
        </a>
        <style>
          .yamuna-google-reviews-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            width: fit-content;
            max-width: 100%;
            margin: 0 auto 28px;
            padding: 10px 18px;
            border-radius: 999px;
            background: rgba(163, 20, 96, 0.08);
            color: #4a1d3a !important;
            text-decoration: none !important;
            font-family: 'Dosis', sans-serif;
            font-size: 15px;
            line-height: 1.3;
          }
          .yamuna-google-reviews-badge__stars { color: #f4b400; letter-spacing: 1px; font-size: 16px; }
          .yamuna-google-reviews-badge__text strong { color: #a31460; }
        </style>
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
            <article class="testimonial-card testimonial-card--long swiper-slide">
                <img class="testimonial-quote" src="{{ 'images/yamuna/icone-aspas.png' | static_url }}" alt="" aria-hidden="true" />
                <div class="testimonial-stars" aria-label="5 de 5 estrelas">
                    {% for i in 1..5 %}<img src="{{ 'images/yamuna/icone-estrela.svg' | static_url }}" alt="" />{% endfor %}
                </div>
                <p class="testimonial-text">Apaixonada pelos produtos! Qualidade e carinho em cada detalhe.</p>
                <p class="testimonial-author">Kelly C.</p>
            </article>
            <article class="testimonial-card testimonial-card--short swiper-slide">
                <img class="testimonial-quote" src="{{ 'images/yamuna/icone-aspas.png' | static_url }}" alt="" aria-hidden="true" />
                <div class="testimonial-stars" aria-label="5 de 5 estrelas">
                    {% for i in 1..5 %}<img src="{{ 'images/yamuna/icone-estrela.svg' | static_url }}" alt="" />{% endfor %}
                </div>
                <p class="testimonial-text">Golden Milk e Ghee são meus queridinhos. Surreal!</p>
                <p class="testimonial-author">Raquel C.</p>
            </article>
            <article class="testimonial-card testimonial-card--long swiper-slide">
                <img class="testimonial-quote" src="{{ 'images/yamuna/icone-aspas.png' | static_url }}" alt="" aria-hidden="true" />
                <div class="testimonial-stars" aria-label="5 de 5 estrelas">
                    {% for i in 1..5 %}<img src="{{ 'images/yamuna/icone-estrela.svg' | static_url }}" alt="" />{% endfor %}
                </div>
                <p class="testimonial-text">Atendimento impecável e produtos de altíssima qualidade.</p>
                <p class="testimonial-author">Thiago P.</p>
            </article>
            </div>
            <button type="button" class="testimonials-nav testimonials-nav--prev js-swiper-testimonials-prev" aria-label="Depoimento anterior"></button>
            <button type="button" class="testimonials-nav testimonials-nav--next js-swiper-testimonials-next" aria-label="Próximo depoimento"></button>
        </div>
        <script>
            (function () {
                function isDesktop() {
                    return window.matchMedia('(min-width: 1024px)').matches;
                }

                function lockWidths(sw) {
                    if (!sw || !sw.slides) return;
                    Array.prototype.forEach.call(sw.slides, function (slide) {
                        if (isDesktop()) {
                            if (slide.style.width) {
                                slide.style.setProperty('width', slide.style.width, 'important');
                            }
                        } else {
                            /* Tablet/mobile: one full card — never leave a cut neighbor peeking. */
                            slide.style.setProperty('width', '100%', 'important');
                            slide.style.setProperty('max-width', '100%', 'important');
                            slide.style.setProperty('flex', '0 0 100%', 'important');
                        }
                    });
                }

                function bind(sw) {
                    if (!sw || sw.__yamunaTestimonialsLocked) return;
                    sw.__yamunaTestimonialsLocked = true;
                    if (!isDesktop()) {
                        sw.params.slidesPerView = 1;
                        sw.params.slidesPerGroup = 1;
                        sw.params.spaceBetween = 0;
                        if (sw.params.breakpoints) {
                            Object.keys(sw.params.breakpoints).forEach(function (bp) {
                                if (parseInt(bp, 10) < 1024) {
                                    sw.params.breakpoints[bp].slidesPerView = 1;
                                    sw.params.breakpoints[bp].spaceBetween = 0;
                                }
                            });
                        }
                        sw.update();
                    }
                    lockWidths(sw);
                    sw.on('resize', function () {
                        if (!isDesktop()) {
                            sw.params.slidesPerView = 1;
                            sw.params.spaceBetween = 0;
                            sw.update();
                        }
                        lockWidths(sw);
                    });
                    sw.on('breakpoint', function () {
                        requestAnimationFrame(function () {
                            if (!isDesktop()) {
                                sw.params.slidesPerView = 1;
                                sw.params.spaceBetween = 0;
                                sw.update();
                            }
                            lockWidths(sw);
                        });
                    });
                    sw.on('slideChangeTransitionEnd', function () { lockWidths(sw); });
                }

                function tryBind() {
                    var el = document.querySelector('.js-swiper-testimonials');
                    if (!el || !el.swiper) return false;
                    var sw = el.swiper;
                    if (!isDesktop()) {
                        sw.params.slidesPerView = 1;
                        sw.params.slidesPerGroup = 1;
                        sw.params.spaceBetween = 0;
                    }
                    sw.update();
                    lockWidths(sw);
                    if (sw.slideToLoop) sw.slideToLoop(0, 0, false);
                    lockWidths(sw);
                    bind(sw);
                    return true;
                }

                function start() {
                    if (tryBind()) return;
                    var tries = 0;
                    var timer = setInterval(function () {
                        tries += 1;
                        if (tryBind() || tries > 40) clearInterval(timer);
                    }, 150);
                }

                if (document.readyState === 'loading') {
                    document.addEventListener('DOMContentLoaded', start);
                } else {
                    start();
                }
                window.addEventListener('load', function () {
                    setTimeout(tryBind, 100);
                });
            })();
        </script>
    </div>
</section>
