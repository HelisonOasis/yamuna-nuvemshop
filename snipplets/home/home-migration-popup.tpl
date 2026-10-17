{# Site update notice shown only on the first visit to the home page; closing it (or seeing it once) is remembered via localStorage + cookie until the user clears site data. #}
<div id="yamuna-migration-popup" class="yamuna-migration-popup" hidden aria-hidden="true">
	<div class="yamuna-migration-popup__backdrop" data-yamuna-migration-close tabindex="-1"></div>
	<div class="yamuna-migration-popup__dialog" role="dialog" aria-modal="true" aria-labelledby="yamuna-migration-title">
		<button type="button" class="yamuna-migration-popup__close" data-yamuna-migration-close aria-label="Fechar popup">&times;</button>
		<div class="yamuna-migration-popup__brand">
			<img src="{{ 'images/yamuna/logo-yamuna-branco.png' | static_url }}" alt="Yamuna" />
		</div>
		<div class="yamuna-migration-popup__content">
			<h2 id="yamuna-migration-title" class="yamuna-migration-popup__title"><strong>Nosso site mudou para melhor</strong>. Se você já é <strong>cliente</strong> atualize seu cadastro e crie nova senha.</h2>
		</div>
	</div>
</div>

<style>
/* Must sit above #modal-cart (z-index ~29000) or cart shipping UI steals clicks/cursor */
.yamuna-migration-popup {
	position: fixed;
	inset: 0;
	z-index: 100000 !important;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 24px;
	pointer-events: auto !important;
}
.yamuna-migration-popup[hidden],
.yamuna-migration-popup.is-closed {
	display: none !important;
	pointer-events: none !important;
}
.yamuna-migration-popup__backdrop {
	position: absolute;
	inset: 0;
	z-index: 1;
	background: rgba(58, 20, 46, 0.58);
	backdrop-filter: blur(2px);
	cursor: pointer;
	pointer-events: auto !important;
}
.yamuna-migration-popup__dialog {
	position: relative;
	z-index: 2;
	width: 100%;
	max-width: 650px;
	overflow: visible;
	border: 1px solid rgba(163, 20, 96, 0.16);
	border-radius: 20px;
	background: #fff;
	box-shadow: 0 24px 70px rgba(58, 20, 46, 0.36);
	text-align: center;
	pointer-events: auto !important;
}
.yamuna-migration-popup__close {
	position: absolute;
	top: 14px;
	right: 14px;
	z-index: 10;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 40px;
	height: 40px;
	margin: 0;
	padding: 0;
	border: 0;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.22);
	color: #fff;
	font-size: 30px;
	font-weight: 400;
	line-height: 1;
	cursor: pointer !important;
	pointer-events: auto !important;
	touch-action: manipulation;
	appearance: none;
	-webkit-appearance: none;
	user-select: none;
	transition: background .2s ease, transform .2s ease;
}
.yamuna-migration-popup__close:hover,
.yamuna-migration-popup__close:focus-visible {
	background: rgba(255, 255, 255, 0.38);
	transform: scale(1.08);
	outline: none;
	cursor: pointer !important;
}
.yamuna-migration-popup__brand {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 108px;
	padding: 0 52px;
	border-radius: 20px 20px 0 0;
	background: linear-gradient(118deg, #741442 0%, #a31460 52%, #c50b6a 100%);
	pointer-events: none;
}
.yamuna-migration-popup__brand img {
	width: 132px;
	height: 68px;
	margin: 0;
	object-fit: contain;
	pointer-events: none;
}
.yamuna-migration-popup__content {
	position: relative;
	padding: 52px 68px 58px;
	background: linear-gradient(145deg, #fff 0%, #fff8fb 100%);
	border-radius: 0 0 20px 20px;
}
.yamuna-migration-popup__title {
	margin: 0;
	color: #4a1d3a;
	font-family: 'Raleway', sans-serif;
	font-size: 31px;
	font-weight: 500;
	line-height: 1.35;
}
.yamuna-migration-popup__title strong { font-weight: 700; }
html.yamuna-migration-open #modal-cart,
html.yamuna-migration-open .js-modal.modal-right {
	pointer-events: none !important;
}
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

	var SEEN_KEY = 'yamuna_migration_popup_seen_v2';

	function hasSeen() {
		try { if (window.localStorage && localStorage.getItem(SEEN_KEY) === '1') return true; } catch (e) {}
		return document.cookie.split('; ').some(function (c) { return c.indexOf(SEEN_KEY + '=1') === 0; });
	}

	function markSeen() {
		try { if (window.localStorage) localStorage.setItem(SEEN_KEY, '1'); } catch (e) {}
		try { document.cookie = SEEN_KEY + '=1; path=/; max-age=31536000; SameSite=Lax'; } catch (e) {}
	}

	if (hasSeen()) {
		root.parentNode && root.parentNode.removeChild(root);
		return;
	}

	function openPopup() {
		root.classList.remove('is-closed');
		root.hidden = false;
		root.removeAttribute('hidden');
		root.style.removeProperty('display');
		root.setAttribute('aria-hidden', 'false');
		document.documentElement.classList.add('yamuna-migration-open');
		markSeen();
	}

	function closePopup(event) {
		if (event) {
			try { event.preventDefault(); } catch (e) {}
			try { event.stopPropagation(); } catch (e) {}
		}
		root.classList.add('is-closed');
		root.hidden = true;
		root.setAttribute('hidden', 'hidden');
		root.setAttribute('aria-hidden', 'true');
		root.style.setProperty('display', 'none', 'important');
		document.documentElement.classList.remove('yamuna-migration-open');
		markSeen();
		return false;
	}

	window.yamunaCloseMigrationPopup = closePopup;

	function onCloseIntent(event) {
		var target = event.target;
		if (!target) return;
		if (target.closest && target.closest('[data-yamuna-migration-close]')) {
			closePopup(event);
		}
	}

	root.addEventListener('click', onCloseIntent);
	root.addEventListener('pointerup', onCloseIntent);

	var closeBtn = root.querySelector('.yamuna-migration-popup__close');
	if (closeBtn) {
		closeBtn.addEventListener('click', closePopup);
		closeBtn.addEventListener('pointerup', closePopup);
	}

	document.addEventListener('keydown', function (event) {
		if (event.key === 'Escape' && !root.hidden && !root.classList.contains('is-closed')) {
			closePopup(event);
		}
	});

	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', function () { setTimeout(openPopup, 600); });
	} else {
		setTimeout(openPopup, 600);
	}
})();
</script>
