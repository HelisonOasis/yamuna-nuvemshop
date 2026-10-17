<div class="yamuna-blog-page">
	<div class="container">
		<style>
			/* Force prod-like featured cards even while async CSS refreshes */
			/* Cenário 019: white header from first paint on blog mobile */
			@media (max-width: 1023px) {
				body.template-blog .head-main,
				body.template-blog .head-main.head-fixed,
				body.template-blog-post .head-main,
				body.template-blog-post .head-main.head-fixed,
				body.template-blog .head-main .yamuna-header-mobile,
				body.template-blog-post .head-main .yamuna-header-mobile {
					background: #fff !important;
					background-color: #fff !important;
					box-shadow: 0 1px 0 rgba(54, 53, 68, .08) !important;
				}
				/* Hide APRENDA on all mobile/tablet widths */
				body.template-blog .yamuna-blog-page-title {
					display: none !important;
					margin: 0 !important;
					padding: 0 !important;
					height: 0 !important;
					overflow: hidden !important;
				}
				/* Clearance via .yamuna-header-spacer + 16px breathing room on mobile */
				body.template-blog > .yamuna-resale-wrap,
				body.template-blog-post > .yamuna-resale-wrap,
				body.template-blog .yamuna-resale-wrap,
				body.template-blog-post .yamuna-resale-wrap {
					padding-top: 16px !important;
					margin-top: 0 !important;
					box-sizing: border-box !important;
				}
				body.template-blog .yamuna-blog-page {
					padding-top: 0 !important;
					background: #f6f6f6 !important;
				}
				body.template-blog .yamuna-blog-page > .container {
					padding-top: 0 !important;
				}
				/* Mobile search stack: title→input 18px, input→Categorias 24px */
				body.template-blog .yamuna-blog-search-row {
					gap: 18px !important;
					margin: 0 0 24px !important;
				}
			}
			.yamuna-blog-page-title { color: #a31460 !important; }
			.yamuna-blog-featured {
				display: grid !important;
				gap: 16px !important;
				margin-bottom: 48px !important;
			}
			@media (min-width: 768px) {
				.yamuna-blog-featured {
					grid-template-columns: 1.35fr 1fr !important;
					grid-template-rows: 1fr 1fr !important;
					min-height: 560px !important;
				}
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child {
					grid-row: span 2 !important;
					min-height: 560px !important;
				}
			}
			.yamuna-blog-card--featured {
				position: relative !important;
				overflow: hidden !important;
				min-height: 280px !important;
				border-radius: 16px !important;
				/* Transparent: solid wine + radius AA bled as light crescents at corners */
				background: transparent !important;
				isolation: isolate;
			}
			.yamuna-blog-card--featured .yamuna-blog-card-inner {
				position: relative !important;
				display: block !important;
				height: 100% !important;
				min-height: inherit !important;
				overflow: hidden !important;
				border-radius: inherit !important;
				background: transparent !important;
			}
			.yamuna-blog-card--featured .yamuna-blog-card-image,
			.yamuna-blog-card--featured .post-item-image-container {
				position: absolute !important;
				inset: 0 !important;
				height: 100% !important;
				min-height: 100% !important;
				margin: 0 !important;
				padding: 0 !important;
				border: 0 !important;
				border-radius: inherit !important;
				overflow: hidden !important;
				background: transparent !important;
			}
			.yamuna-blog-card--featured .yamuna-blog-card-image img,
			.yamuna-blog-card--featured .post-item-image-container img,
			.yamuna-blog-card--featured .yamuna-blog-card-image .img-absolute-centered,
			.yamuna-blog-card--featured .post-item-image-container .img-absolute-centered {
				left: 0 !important;
				top: 0 !important;
				right: 0 !important;
				bottom: 0 !important;
				width: 100% !important;
				height: 100% !important;
				max-width: none !important;
				transform: none !important;
				-webkit-transform: none !important;
				object-fit: cover !important;
				border-radius: 0 !important;
			}
			.yamuna-blog-card--featured .yamuna-blog-card-info,
			.yamuna-blog-card--featured .post-item-info,
			.yamuna-blog-card--featured .post-item-link {
				position: absolute !important;
				right: 0 !important;
				bottom: 0 !important;
				left: 0 !important;
				z-index: 2 !important;
				display: flex !important;
				flex-direction: column !important;
				align-items: center !important;
				justify-content: flex-end !important;
				box-sizing: border-box !important;
				padding: 32px 20px 20px !important;
				background: linear-gradient(180deg, rgba(74,29,58,0) 0%, rgba(74,29,58,.88) 55%) !important;
				text-align: center !important;
			}
			.yamuna-blog-card--featured .yamuna-blog-card-title,
			.yamuna-blog-card--featured .yamuna-blog-card-title a,
			.yamuna-blog-card--featured .item-name,
			.yamuna-blog-card--featured .item-name a {
				width: 100% !important;
				margin: 0 0 8px !important;
				color: #fff !important;
				font-family: Raleway, sans-serif !important;
				font-size: 20px !important;
				font-weight: 700 !important;
				line-height: 1.3 !important;
				letter-spacing: 0.01em !important;
				text-align: center !important;
				text-transform: uppercase !important;
				display: -webkit-box !important;
				-webkit-line-clamp: 3 !important;
				-webkit-box-orient: vertical !important;
				overflow: hidden !important;
				/* Avoid ascender clipping from tight line-box + overflow */
				padding-top: 0.15em !important;
			}
			.yamuna-blog-card--featured .yamuna-blog-card-summary,
			.yamuna-blog-card--featured .post-item-summary,
			.yamuna-blog-card--featured .item-description,
			.yamuna-blog-card--featured .item-description p {
				display: -webkit-box !important;
				width: 100% !important;
				max-width: 100% !important;
				margin: 0 0 12px !important;
				color: #fff !important;
				font-family: Raleway, sans-serif !important;
				font-size: 14px !important;
				font-weight: 400 !important;
				line-height: 1.4 !important;
				text-align: center !important;
				-webkit-line-clamp: 3 !important;
				-webkit-box-orient: vertical !important;
				overflow: hidden !important;
			}
			.yamuna-blog-card--featured .yamuna-blog-cta,
			.yamuna-blog-card--featured .yamuna-blog-cta-continue {
				display: inline-flex !important;
				align-items: center !important;
				justify-content: center !important;
				align-self: center !important;
				margin: 4px auto 0 !important;
				min-height: 36px !important;
				padding: 8px 16px !important;
				border-radius: 999px !important;
				background: #238482 !important;
				color: transparent !important;
				font-size: 0 !important;
				line-height: 0 !important;
				overflow: hidden !important;
				text-align: center !important;
			}
			.yamuna-blog-card--featured .yamuna-blog-cta-continue::after {
				content: 'CONTINUE LENDO' !important;
				color: #fff !important;
				font-family: Roboto, sans-serif !important;
				font-size: 12px !important;
				font-weight: 700 !important;
				line-height: 1 !important;
				letter-spacing: 0.04em !important;
				text-transform: uppercase !important;
			}
			@media (max-width: 767px) {
				.yamuna-blog-card--featured {
					min-height: 300px !important;
				}
				.yamuna-blog-card--featured .yamuna-blog-card-info,
				.yamuna-blog-card--featured .post-item-info,
				.yamuna-blog-card--featured .post-item-link {
					padding: 40px 16px 18px !important;
				}
				.yamuna-blog-card--featured .yamuna-blog-card-title,
				.yamuna-blog-card--featured .yamuna-blog-card-title a,
				.yamuna-blog-card--featured .item-name,
				.yamuna-blog-card--featured .item-name a {
					/* Match prod mobile: smaller title so 3 lines fit without top clipping */
					font-size: 16px !important;
					line-height: 1.35 !important;
					-webkit-line-clamp: 3 !important;
					padding-top: 0.2em !important;
				}
				.yamuna-blog-card--featured .yamuna-blog-card-summary,
				.yamuna-blog-card--featured .post-item-summary,
				.yamuna-blog-card--featured .item-description,
				.yamuna-blog-card--featured .item-description p {
					font-size: 13px !important;
					line-height: 1.4 !important;
					-webkit-line-clamp: 3 !important;
					margin-bottom: 10px !important;
				}
				.yamuna-blog-card--featured .yamuna-blog-cta-continue::after {
					font-size: 11px !important;
				}
			}
			@media (min-width: 768px) {
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .yamuna-blog-card-title,
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .yamuna-blog-card-title a,
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .item-name,
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .item-name a {
					font-size: 24px !important;
					line-height: 1.28 !important;
				}
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .yamuna-blog-card-summary,
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .post-item-summary,
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .item-description,
				.yamuna-blog-featured .yamuna-blog-card--featured:first-child .item-description p {
					font-size: 15px !important;
					-webkit-line-clamp: 4 !important;
				}
			}
			/* Grid cards: image + title + summary + button (prod metric) */
			.yamuna-blog-card--grid .yamuna-blog-card-image,
			.yamuna-blog-card--grid .post-item-image-container {
				height: 240px !important;
				margin: 0 !important;
				border: 0 !important;
				border-radius: 12px 12px 0 0 !important;
			}
			.yamuna-blog-card--grid .yamuna-blog-card-summary,
			.yamuna-blog-card--grid .post-item-summary,
			.yamuna-blog-card--grid .item-description,
			.yamuna-blog-card--grid .item-description p {
				display: -webkit-box !important;
				-webkit-line-clamp: 3 !important;
				-webkit-box-orient: vertical !important;
				overflow: hidden !important;
				margin: 8px 0 0 !important;
				color: #444 !important;
				font-family: Raleway, sans-serif !important;
				font-size: 15px !important;
				line-height: 1.45 !important;
			}
			.yamuna-blog-card--grid .yamuna-blog-card-title,
			.yamuna-blog-card--grid .item-name,
			.yamuna-blog-card--grid .item-name a {
				display: -webkit-box !important;
				-webkit-line-clamp: 2 !important;
				-webkit-box-orient: vertical !important;
				overflow: hidden !important;
				font-size: 18px !important;
			}
			.yamuna-blog-card--grid .yamuna-blog-cta-more {
				font-size: 0 !important;
			}
			.yamuna-blog-card--grid .yamuna-blog-cta-more::after {
				content: 'Leia mais →' !important;
				font-size: 16px !important;
				font-weight: 600 !important;
				color: inherit !important;
			}
			.yamuna-blog-pagination.js-yamuna-blog-pagination { display: none !important; }
			.yamuna-blog-infinite-status { text-align: center; padding: 16px; color: #a31460; }
			/* Mobile: search label 20px + category pills 42px + cats dropdown */
			@media (max-width: 767px) {
				.yamuna-blog-search-label {
					font-size: 20px !important;
					line-height: 1.2 !important;
				}
				.yamuna-blog-cats-title,
				.yamuna-blog-shop-btn {
					display: none !important;
				}
				.yamuna-blog-cats-toggle {
					display: flex !important;
					align-items: center !important;
					justify-content: center !important;
					gap: 10px !important;
					box-sizing: border-box !important;
					width: 100% !important;
					height: 42px !important;
					min-height: 42px !important;
					margin: 0 0 12px !important;
					padding: 0 18px !important;
					border: 1px solid #a31460 !important;
					border-radius: 999px !important;
					background: #fff !important;
					color: #a31460 !important;
					font-family: Roboto, sans-serif !important;
					font-size: 16px !important;
					font-weight: 700 !important;
					letter-spacing: 0.02em !important;
					text-transform: none !important;
					cursor: pointer !important;
				}
				.yamuna-blog-cats-toggle-chevron {
					display: inline-block !important;
					width: 10px !important;
					height: 10px !important;
					margin-top: -4px !important;
					border-right: 2px solid #a31460 !important;
					border-bottom: 2px solid #a31460 !important;
					transform: rotate(45deg) !important;
					transition: transform 0.2s ease !important;
				}
				.yamuna-blog-cats-wrap.is-open .yamuna-blog-cats-toggle-chevron {
					margin-top: 2px !important;
					transform: rotate(-135deg) !important;
				}
				.yamuna-blog-cats {
					display: none !important;
					flex-direction: column !important;
					gap: 10px !important;
					margin: 0 0 16px !important;
					padding: 0 !important;
				}
				.yamuna-blog-cats-wrap.is-open .yamuna-blog-cats {
					display: flex !important;
				}
				.yamuna-blog-cats button,
				.yamuna-blog-cats button.js-yamuna-blog-cat {
					height: 42px !important;
					min-height: 42px !important;
					max-height: 42px !important;
					box-sizing: border-box !important;
				}
			}
			@media (min-width: 768px) {
				.yamuna-blog-cats-toggle {
					display: none !important;
				}
				/* Desktop: featured banners above search (HTML order is mobile-first). */
				.yamuna-blog-page > .container {
					display: flex !important;
					flex-direction: column !important;
				}
				.yamuna-blog-page-title { order: 0 !important; }
				.yamuna-blog-featured { order: 1 !important; }
				.yamuna-blog-search-row { order: 2 !important; }
				.yamuna-blog-layout { order: 3 !important; }
				.yamuna-blog-infinite-sentinel,
				.yamuna-blog-infinite-status,
				.yamuna-blog-pagination,
				.js-yamuna-blog-next { order: 4 !important; }
			}
			/* Cenário 019: mobile — hide featured banners; APRENDA hidden ≤1023 above */
			@media (max-width: 767px) {
				.yamuna-blog-featured {
					display: none !important;
				}
			}
			/* Search field + suggestions. These rules are missing from the published async CSS, so the input stayed a native box and the results ran together. */
			body.template-blog .yamuna-blog-search-row {
				display: flex !important;
				flex-wrap: nowrap !important;
				align-items: center !important;
				gap: 28px !important;
				width: 100% !important;
				margin: 0 0 36px !important;
			}
			body.template-blog .yamuna-blog-search-label {
				flex: 0 0 auto !important;
				margin: 0 !important;
				color: #a31460 !important;
				font-family: Roboto, sans-serif !important;
				font-size: 22px !important;
				font-weight: 700 !important;
				letter-spacing: 0.02em !important;
				line-height: 1.1 !important;
				text-transform: uppercase !important;
				white-space: nowrap !important;
			}
			body.template-blog .yamuna-blog-search {
				position: relative !important;
				flex: 1 1 auto !important;
				width: auto !important;
				max-width: none !important;
				min-width: 0 !important;
			}
			body.template-blog .yamuna-blog-search-field {
				display: flex !important;
				position: relative !important;
				align-items: center !important;
				width: 100% !important;
				height: 42px !important;
				min-height: 42px !important;
				margin: 0 !important;
				padding: 0 4px 0 16px !important;
				border: 1px solid #a31460 !important;
				border-radius: 999px !important;
				background: #fff !important;
				box-sizing: border-box !important;
			}
			body.template-blog .yamuna-blog-search.is-suggest-open .yamuna-blog-search-field {
				border-radius: 28px 28px 0 0 !important;
			}
			body.template-blog .yamuna-blog-search-float {
				position: absolute !important;
				top: -10px !important;
				left: 22px !important;
				z-index: 1 !important;
				padding: 0 8px !important;
				color: #a31460 !important;
				background: #fff !important;
				font-family: Poppins, Raleway, sans-serif !important;
				font-size: 13px !important;
				font-weight: 600 !important;
				line-height: 1.2 !important;
			}
			body.template-blog .yamuna-blog-search input,
			body.template-blog .yamuna-blog-search input[type="search"] {
				flex: 1 1 auto !important;
				width: 100% !important;
				max-width: none !important;
				height: 40px !important;
				min-height: 0 !important;
				margin: 0 !important;
				padding: 0 8px 0 4px !important;
				border: 0 !important;
				border-radius: 0 !important;
				box-shadow: none !important;
				color: #333 !important;
				background: transparent !important;
				font-family: Poppins, Raleway, sans-serif !important;
				font-size: 15px !important;
				outline: none !important;
				appearance: none !important;
				-webkit-appearance: none !important;
			}
			body.template-blog .yamuna-blog-search input::-webkit-search-decoration,
			body.template-blog .yamuna-blog-search input::-webkit-search-cancel-button,
			body.template-blog .yamuna-blog-search input::-webkit-search-results-button {
				-webkit-appearance: none !important;
				appearance: none !important;
				display: none !important;
			}
			body.template-blog .yamuna-blog-search-submit {
				display: flex !important;
				flex: 0 0 auto !important;
				align-items: center !important;
				justify-content: center !important;
				width: 40px !important;
				height: 40px !important;
				margin: 0 !important;
				padding: 0 !important;
				border: 0 !important;
				background: transparent !important;
				cursor: pointer !important;
			}
			body.template-blog .yamuna-blog-search-submit img {
				display: block !important;
				width: 20px !important;
				height: 20px !important;
			}
			body.template-blog .yamuna-blog-search-suggest {
				position: absolute !important;
				top: 100% !important;
				left: 0 !important;
				z-index: 40 !important;
				display: none !important;
				width: 100% !important;
				max-height: 320px !important;
				overflow: auto !important;
				margin: 0 !important;
				padding: 0 !important;
				border: 1px solid #a31460 !important;
				border-top: 0 !important;
				border-radius: 0 0 28px 28px !important;
				background: #fff !important;
				box-shadow: 0 12px 20px rgba(74, 29, 58, 0.14) !important;
				box-sizing: border-box !important;
			}
			body.template-blog .yamuna-blog-search-suggest.is-open { display: block !important; }
			body.template-blog .yamuna-blog-search-suggest a,
			body.template-blog .yamuna-blog-search-suggest .yamuna-blog-search-pending {
				display: flex !important;
				align-items: center !important;
				justify-content: space-between !important;
				gap: 16px !important;
				padding: 14px 18px !important;
				border-bottom: 1px solid #f0edf0 !important;
				color: #4a1d3a !important;
				font-family: Roboto, sans-serif !important;
				font-size: 15px !important;
				font-weight: 500 !important;
				line-height: 1.3 !important;
				text-decoration: none !important;
				white-space: normal !important;
			}
			body.template-blog .yamuna-blog-search-suggest a::after {
				content: '' !important;
				flex: 0 0 auto !important;
				width: 8px !important;
				height: 8px !important;
				margin-left: 8px !important;
				border-right: 2px solid #a31460 !important;
				border-top: 2px solid #a31460 !important;
				transform: rotate(45deg) !important;
			}
			body.template-blog .yamuna-blog-search-suggest a:last-child,
			body.template-blog .yamuna-blog-search-suggest .yamuna-blog-search-pending:last-child {
				border-bottom: 0 !important;
				border-radius: 0 0 27px 27px !important;
			}
			body.template-blog .yamuna-blog-search-suggest a:hover,
			body.template-blog .yamuna-blog-search-suggest a:focus {
				background: #fdf5f9 !important;
				color: #a31460 !important;
			}
			body.template-blog .yamuna-blog-search-suggest .yamuna-blog-search-pending {
				color: #8a6a7c !important;
				font-weight: 500 !important;
			}
			body.template-blog .yamuna-blog-search-suggest .yamuna-blog-search-pending::after { content: none !important; }
			@media (max-width: 767px) {
				body.template-blog .yamuna-blog-search-row {
					flex-direction: column !important;
					align-items: stretch !important;
					gap: 14px !important;
					margin-bottom: 24px !important;
				}
				body.template-blog .yamuna-blog-search-label {
					font-size: clamp(14px, 4.2vw, 18px) !important;
				}
				body.template-blog .yamuna-blog-search {
					width: 100% !important;
					max-width: none !important;
					flex-basis: auto !important;
				}
			}
			body.template-blog .yamuna-blog-cats-title {
				margin: 0 0 16px !important;
				color: #4a1d3a !important;
				font-family: Roboto, sans-serif !important;
				font-size: 28px !important;
				font-weight: 800 !important;
				letter-spacing: 0.02em !important;
				line-height: 1.15 !important;
			}
			body.template-blog .yamuna-blog-cats button,
			body.template-blog .yamuna-blog-cats button.js-yamuna-blog-cat {
				display: flex !important;
				align-items: center !important;
				justify-content: center !important;
				width: 100% !important;
				min-height: 44px !important;
				margin: 0 !important;
				padding: 0 16px !important;
				border: 1px solid #d1d5db !important;
				border-radius: 999px !important;
				color: #4a1d3a !important;
				background: #fff !important;
				font-family: Roboto, sans-serif !important;
				font-size: 14px !important;
				font-weight: 600 !important;
				letter-spacing: 0.04em !important;
				text-transform: uppercase !important;
				cursor: pointer !important;
				box-sizing: border-box !important;
			}
			body.template-blog .yamuna-blog-cats button:hover,
			body.template-blog .yamuna-blog-cats button.is-active {
				border-color: #a31460 !important;
				color: #a31460 !important;
				background: #fff !important;
			}
			@media (min-width: 768px) {
				body.template-blog .yamuna-blog-layout {
					display: grid !important;
					grid-template-columns: 240px minmax(0, 1fr) !important;
					gap: 28px !important;
					align-items: start !important;
				}
				body.template-blog .yamuna-blog-cats {
					display: flex !important;
					flex-direction: column !important;
					gap: 12px !important;
					margin: 0 0 16px !important;
				}
				body.template-blog .yamuna-blog-shop-btn {
					display: inline-flex !important;
					align-items: center !important;
					justify-content: center !important;
					width: 100% !important;
					min-height: 48px !important;
					margin-top: 4px !important;
					padding: 10px 16px !important;
					border-radius: 999px !important;
					background: #238482 !important;
					color: #fff !important;
					font-family: Roboto, sans-serif !important;
					font-size: 14px !important;
					font-weight: 600 !important;
					letter-spacing: 0.04em !important;
					text-align: center !important;
					text-decoration: none !important;
					text-transform: uppercase !important;
					box-sizing: border-box !important;
				}
			}
			.js-yamuna-blog-card.is-search-hidden { display: none !important; }
		</style>

		<h1 class="yamuna-blog-page-title">Aprenda</h1>
		<p class="yamuna-blog-page-seo-label visually-hidden">Blog Yamuna — receitas, saúde e conhecimento</p>

		{% if blog.posts %}
			{# Mobile (prod): search + categories first, then cards.
			   Desktop: featured banners remain above via CSS order. #}
			<div class="yamuna-blog-search-row">
				<p class="yamuna-blog-search-label">Procurando algum assunto?</p>
				<form class="yamuna-blog-search js-yamuna-blog-search" action="{{ store.blog_url }}" method="get" role="search">
					<label class="yamuna-blog-search-field">
						<span class="yamuna-blog-search-float">Pesquisar post</span>
						<input class="js-yamuna-blog-q" type="search" name="q" autocomplete="off" />
						<button class="yamuna-blog-search-submit" type="submit" aria-label="Pesquisar">
							<img src="{{ 'images/yamuna/menu-search.svg' | static_url }}" alt="" width="20" height="20" />
						</button>
					</label>
					<div class="yamuna-blog-search-suggest" aria-live="polite"></div>
				</form>
			</div>

			<div class="yamuna-blog-layout">
				<aside class="yamuna-blog-sidebar">
					<div class="yamuna-blog-cats-wrap js-yamuna-blog-cats-wrap">
						<button type="button" class="yamuna-blog-cats-toggle js-yamuna-blog-cats-toggle" aria-expanded="false" aria-controls="yamuna-blog-cats-panel">
							<span class="yamuna-blog-cats-toggle-label">Categorias</span>
							<span class="yamuna-blog-cats-toggle-chevron" aria-hidden="true"></span>
						</button>
						<p class="yamuna-blog-cats-title">Categorias</p>
						<nav id="yamuna-blog-cats-panel" class="yamuna-blog-cats" aria-label="Categorias do blog">
							<button type="button" class="js-yamuna-blog-cat is-active" data-cat="all">Todos</button>
							<button type="button" class="js-yamuna-blog-cat" data-cat="receitas">Receitas</button>
							<button type="button" class="js-yamuna-blog-cat" data-cat="saude">Saúde</button>
							<button type="button" class="js-yamuna-blog-cat" data-cat="conhecimento">Conhecimento</button>
							<button type="button" class="js-yamuna-blog-cat" data-cat="ayurveda">Ayurveda</button>
						</nav>
					</div>

					<a class="yamuna-blog-shop-btn" href="{{ store.url }}/produtos/">Comprar produtos</a>
				</aside>

				<section class="yamuna-blog-grid" aria-label="Todos os posts">
					{% for post in blog.posts %}
						{% include 'snipplets/blog/yamuna-blog-card.tpl' with { variant: 'grid' } %}
					{% endfor %}
					<p class="yamuna-blog-empty js-yamuna-blog-empty" hidden>Poxa, não encontramos nenhum post relacionado a sua busca.</p>
				</section>
			</div>

			{% if not blog.pages.current or blog.pages.current == 1 %}
				<section class="yamuna-blog-featured" aria-label="Destaques">
					{% for post in blog.posts %}
						{% if loop.index <= 3 %}
							{% include 'snipplets/blog/yamuna-blog-card.tpl' with { variant: 'featured' } %}
						{% endif %}
					{% endfor %}
				</section>
			{% endif %}
		{% else %}
			<p class="yamuna-blog-empty is-visible">Em breve, novos conteúdos por aqui.</p>
		{% endif %}

		{% if blog.pages and blog.pages.next %}
			<a class="js-yamuna-blog-next" href="{{ blog.pages.next }}" hidden aria-hidden="true">Próxima</a>
			<div class="yamuna-blog-infinite-sentinel js-yamuna-blog-infinite-sentinel" aria-hidden="true"></div>
			<p class="yamuna-blog-infinite-status js-yamuna-blog-infinite-status" hidden>Carregando mais posts...</p>
		{% endif %}

		{% if blog.pages and (blog.pages.next or blog.pages.previous or blog.pages.numbers) %}
			<div class="yamuna-blog-pagination js-yamuna-blog-pagination" hidden>
				{% include 'snipplets/grid/pagination.tpl' with {'pages': blog.pages} %}
			</div>
		{% endif %}
	</div>
</div>

<script>
  (function () {
    var search = document.querySelector('.js-yamuna-blog-q');
    var form = document.querySelector('.js-yamuna-blog-search');
    var dropdown = document.querySelector('.yamuna-blog-search-suggest');
    var grid = document.querySelector('.yamuna-blog-grid');
    var empty = document.querySelector('.js-yamuna-blog-empty');
    var catButtons = document.querySelectorAll('.js-yamuna-blog-cat');
    var activeCat = 'all';

    function normalize(value) {
      return (value || '').replace(/\s+/g, ' ').trim();
    }

    function fold(value) {
      try {
        return normalize(value).toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
      } catch (err) {
        return normalize(value).toLowerCase();
      }
    }

    function cardMatchesCat(card, cat) {
      if (cat === 'all') return true;
      var text = fold(card.textContent || '');
      if (cat === 'receitas') return /receita|gelato|muffin|panqueca|levain|pao|energy ball/.test(text);
      if (cat === 'saude') return /saude|colesterol|lactose|intestino|gordura|vitamina/.test(text);
      if (cat === 'ayurveda') return /ayurveda|massala|masala|dosha/.test(text);
      if (cat === 'conhecimento') return /beneficio|ciencia|conhecimento|colesterol|gordura/.test(text);
      return true;
    }

    /* Filter the visible grid and pull matches from later blog pages into the results. */
    function applyFilter() {
      if (!grid) return;
      grid.querySelectorAll('[data-yamuna-search-extra]').forEach(function (node) {
        node.parentNode && node.parentNode.removeChild(node);
      });
      var q = fold(search && search.value ? search.value : '');
      var present = {};
      var visible = 0;
      grid.querySelectorAll('.js-yamuna-blog-card').forEach(function (card) {
        var url = cardUrl(card);
        if (url) present[url] = true;
        var text = fold(card.textContent || '');
        var show = cardMatchesCat(card, activeCat) && (!q || text.indexOf(q) !== -1);
        card.hidden = !show;
        card.classList.toggle('is-search-hidden', !show);
        if (show) visible += 1;
      });
      if (q) {
        catalogList.forEach(function (post) {
          if (present[post.url]) return;
          if (post.text.indexOf(q) === -1) return;
          if (!cardMatchesCat({ textContent: post.raw }, activeCat)) return;
          var holder = document.createElement('div');
          holder.innerHTML = post.html;
          var node = holder.firstElementChild;
          if (!node) return;
          node.setAttribute('data-yamuna-search-extra', '1');
          node.hidden = false;
          node.classList.remove('is-search-hidden');
          node.querySelectorAll('img[data-src]').forEach(function (img) {
            img.setAttribute('src', img.getAttribute('data-src'));
          });
          grid.appendChild(node);
          present[post.url] = true;
          visible += 1;
        });
      }
      if (empty) {
        empty.hidden = visible !== 0;
        empty.classList.toggle('is-visible', visible === 0);
      }
    }

    function closeDropdown() {
      if (!dropdown || !form) return;
      dropdown.classList.remove('is-open');
      form.classList.remove('is-suggest-open');
      dropdown.innerHTML = '';
    }

    var catalogByUrl = {};
    var catalogList = [];
    var catalogDone = false;

    function absUrl(href) {
      try { return new URL(href, window.location.origin).href.split('#')[0]; } catch (err) { return href || ''; }
    }

    function rememberCard(card) {
      if (!card) return;
      var link = card.querySelector('a[href*="/blog/posts/"]') || card.querySelector('a[href]');
      var titleEl = card.querySelector('.yamuna-blog-card-title, .item-name');
      if (!link || !titleEl) return;
      var url = absUrl(link.getAttribute('href') || link.href);
      if (!url || catalogByUrl[url]) return;
      var title = normalize(titleEl.textContent);
      var raw = card.textContent || '';
      var post = {
        title: title,
        url: url,
        text: fold(title + ' ' + raw + ' ' + url),
        raw: title + ' ' + raw,
        html: card.outerHTML
      };
      catalogByUrl[url] = post;
      catalogList.push(post);
    }

    function harvestHtml(html) {
      var doc = new DOMParser().parseFromString(html, 'text/html');
      var before = catalogList.length;
      doc.querySelectorAll('.yamuna-blog-grid .js-yamuna-blog-card').forEach(rememberCard);
      return {
        grew: catalogList.length > before,
        hasNext: !!doc.querySelector('.js-yamuna-blog-next')
      };
    }

    function cardUrl(card) {
      var link = card.querySelector('a[href*="/blog/posts/"]') || card.querySelector('a[href]');
      return link ? absUrl(link.getAttribute('href') || link.href) : '';
    }

    function loadCatalog() {
      if (grid) grid.querySelectorAll('.js-yamuna-blog-card').forEach(rememberCard);
      var page = 2;
      function step() {
        if (page > 40) {
          catalogDone = true;
          applyFilter();
          updateDropdown();
          return;
        }
        fetch(window.location.pathname + '?page=' + page, { credentials: 'same-origin' })
          .then(function (res) { return res.text(); })
          .then(function (html) {
            var result = harvestHtml(html);
            if (!result.hasNext || !result.grew) {
              catalogDone = true;
              applyFilter();
              updateDropdown();
              return;
            }
            page += 1;
            step();
          })
          .catch(function () {
            catalogDone = true;
            applyFilter();
            updateDropdown();
          });
      }
      step();
    }

    function updateDropdown() {
      if (!search || !dropdown || !form) return;
      var query = fold(search.value);
      if (!query) {
        closeDropdown();
        return;
      }

      var matches = catalogList.filter(function (post) {
        return post.text.indexOf(query) !== -1 && cardMatchesCat({ textContent: post.raw }, activeCat);
      }).slice(0, 6);

      dropdown.innerHTML = '';
      matches.forEach(function (post) {
        var link = document.createElement('a');
        link.href = post.url;
        link.textContent = post.title;
        dropdown.appendChild(link);
      });
      if (!catalogDone && matches.length < 6) {
        var pending = document.createElement('div');
        pending.className = 'yamuna-blog-search-pending';
        pending.textContent = 'Buscando nos demais posts...';
        dropdown.appendChild(pending);
      }
      var open = matches.length > 0 || !catalogDone;
      dropdown.classList.toggle('is-open', open);
      form.classList.toggle('is-suggest-open', open);
    }

    if (search) {
      search.addEventListener('input', function () {
        applyFilter();
        updateDropdown();
      });
      search.addEventListener('focus', updateDropdown);
      search.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') closeDropdown();
      });
    }

    if (form) {
      form.addEventListener('submit', function (event) {
        event.preventDefault();
        closeDropdown();
        applyFilter();
        if (grid && grid.scrollIntoView) {
          grid.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      });
    }

    if (form && dropdown) {
      document.addEventListener('click', function (event) {
        if (!form.contains(event.target) && !dropdown.contains(event.target)) closeDropdown();
      });
    }

    catButtons.forEach(function (btn) {
      btn.addEventListener('click', function () {
        activeCat = btn.getAttribute('data-cat') || 'all';
        catButtons.forEach(function (other) {
          other.classList.toggle('is-active', other === btn);
        });
        applyFilter();
        updateDropdown();
      });
    });

    /* Cenário 018: mobile categories as filter/dropdown (prod-like). */
    (function initYamunaBlogCatsDropdown() {
      var wrap = document.querySelector('.js-yamuna-blog-cats-wrap');
      var toggle = document.querySelector('.js-yamuna-blog-cats-toggle');
      if (!wrap || !toggle) return;

      function setOpen(open) {
        wrap.classList.toggle('is-open', open);
        toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
      }

      toggle.addEventListener('click', function () {
        setOpen(!wrap.classList.contains('is-open'));
      });

      wrap.querySelectorAll('.js-yamuna-blog-cat').forEach(function (btn) {
        btn.addEventListener('click', function () {
          if (window.matchMedia && window.matchMedia('(max-width: 767px)').matches) {
            setOpen(false);
          }
        });
      });

      document.addEventListener('click', function (event) {
        if (!wrap.contains(event.target) && wrap.classList.contains('is-open')) {
          setOpen(false);
        }
      });
    })();

    loadCatalog();

    var sentinel = document.querySelector('.js-yamuna-blog-infinite-sentinel');
    var statusEl = document.querySelector('.js-yamuna-blog-infinite-status');
    var nextLink = document.querySelector('.js-yamuna-blog-next');
    if (!grid || !sentinel || !nextLink) return;

    var nextUrl = nextLink.getAttribute('href');
    if (!nextUrl) return;

    var loading = false;

    function loadMore() {
      if (loading || !nextUrl) return;
      loading = true;
      if (statusEl) statusEl.hidden = false;

      fetch(nextUrl, { credentials: 'same-origin' })
        .then(function (res) { return res.text(); })
        .then(function (html) {
          var doc = new DOMParser().parseFromString(html, 'text/html');
          var newCards = doc.querySelectorAll('.yamuna-blog-grid .js-yamuna-blog-card');
          var seen = {};
          grid.querySelectorAll('.js-yamuna-blog-card').forEach(function (existing) {
            var existingUrl = cardUrl(existing);
            if (existingUrl) seen[existingUrl] = true;
          });
          newCards.forEach(function (card) {
            var url = cardUrl(card);
            if (url && seen[url]) return;
            var node = document.importNode(card, true);
            rememberCard(node);
            grid.appendChild(node);
            if (url) seen[url] = true;
          });
          applyFilter();
          var newNext = doc.querySelector('.js-yamuna-blog-next');
          nextUrl = newNext ? newNext.getAttribute('href') : null;
          if (!nextUrl && sentinel.parentNode) sentinel.parentNode.removeChild(sentinel);
        })
        .catch(function () {})
        .finally(function () {
          loading = false;
          if (statusEl) statusEl.hidden = true;
        });
    }

    if ('IntersectionObserver' in window) {
      var io = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) loadMore();
        });
      }, { rootMargin: '600px 0px' });
      io.observe(sentinel);
    }
  })();
</script>
