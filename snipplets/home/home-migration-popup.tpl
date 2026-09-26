{# Site update notice shown whenever the home page is opened. #}
<div id="yamuna-migration-popup" class="yamuna-migration-popup" hidden aria-hidden="true">
	<div class="yamuna-migration-popup__backdrop js-yamuna-migration-close" tabindex="-1"></div>
	<div class="yamuna-migration-popup__dialog" role="dialog" aria-modal="true" aria-labelledby="yamuna-migration-title">
		<button type="button" class="yamuna-migration-popup__close js-yamuna-migration-close" aria-label="Fechar">×</button>
		<div class="yamuna-migration-popup__brand">
			<img src="{{ 'images/yamuna/logo-yamuna-branco.png' | static_url }}" alt="Yamuna" />
		</div>
		<div class="yamuna-migration-popup__content">
			<h2 id="yamuna-migration-title" class="yamuna-migration-popup__title">Nosso site mudou pra <span>melhor</span>. Ao final da compra atualize seu cadastro.</h2>
		</div>
	</div>
</div>

<style>
.yamuna-migration-popup {
	position: fixed;
	inset: 0;
	z-index: 10050;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 24px;
}
.yamuna-migration-popup[hidden] { display: none !important; }
.yamuna-migration-popup__backdrop {
	position: absolute;
	inset: 0;
	background: rgba(58, 20, 46, 0.58);
	backdrop-filter: blur(2px);
}
.yamuna-migration-popup__dialog {
	position: relative;
	z-index: 1;
	width: 100%;
	max-width: 650px;
	overflow: hidden;
	border: 1px solid rgba(163, 20, 96, 0.16);
	border-radius: 20px;
	background: #fff;
	box-shadow: 0 24px 70px rgba(58, 20, 46, 0.36);
	text-align: center;
}
.yamuna-migration-popup__close {
	position: absolute;
	top: 14px;
	right: 14px;
	z-index: 2;
	display: grid;
	width: 34px;
	height: 34px;
	place-items: center;
	border: 0;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.18);
	color: #fff;
	font-size: 27px;
	font-weight: 400;
	line-height: 1;
	cursor: pointer;
	transition: background .2s ease, transform .2s ease;
}
.yamuna-migration-popup__close:hover { background: rgba(255, 255, 255, 0.32); transform: scale(1.08); }
.yamuna-migration-popup__brand {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 108px;
	padding: 0 52px;
	background: linear-gradient(118deg, #741442 0%, #a31460 52%, #c50b6a 100%);
}
.yamuna-migration-popup__brand img {
	width: 132px;
	height: 68px;
	margin: 0;
	object-fit: contain;
}
.yamuna-migration-popup__content {
	position: relative;
	padding: 52px 68px 58px;
	background: linear-gradient(145deg, #fff 0%, #fff8fb 100%);
}
.yamuna-migration-popup__title {
	margin: 0;
	color: #4a1d3a;
	font-family: 'Raleway', sans-serif;
	font-size: 31px;
	font-weight: 700;
	line-height: 1.35;
}
.yamuna-migration-popup__title span { color: #c50b6a; }
@media (max-width: 767px) {
	.yamuna-migration-popup { padding: 18px; }
	.yamuna-migration-popup__brand { height: 88px; }
	.yamuna-migration-popup__brand img { width: 112px; height: 58px; }
	.yamuna-migration-popup__content { padding: 40px 30px 44px; }
	.yamuna-migration-popup__title { font-size: 24px; line-height: 1.4; }
}
</style>

<script>
(function () {
	var root = document.getElementById('yamuna-migration-popup');
	if (!root) return;
	function openPopup() {
		root.hidden = false;
		root.setAttribute('aria-hidden', 'false');
		document.documentElement.classList.add('yamuna-migration-open');
	}
	function closePopup() {
		root.hidden = true;
		root.setAttribute('aria-hidden', 'true');
		document.documentElement.classList.remove('yamuna-migration-open');
	}

	root.querySelectorAll('.js-yamuna-migration-close').forEach(function (el) {
		el.addEventListener('click', closePopup);
	});
	document.addEventListener('keydown', function (event) {
		if (event.key === 'Escape' && !root.hidden) closePopup();
	});

	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', function () { setTimeout(openPopup, 600); });
	} else {
		setTimeout(openPopup, 600);
	}
})();
</script>
