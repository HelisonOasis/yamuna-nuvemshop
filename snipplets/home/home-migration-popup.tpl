{# One-time migration notice for Wake → Nuvemshop customers. #}
<div id="yamuna-migration-popup" class="yamuna-migration-popup" hidden aria-hidden="true">
	<div class="yamuna-migration-popup__backdrop js-yamuna-migration-close" tabindex="-1"></div>
	<div class="yamuna-migration-popup__dialog" role="dialog" aria-modal="true" aria-labelledby="yamuna-migration-title">
		<button type="button" class="yamuna-migration-popup__close js-yamuna-migration-close" aria-label="Fechar">×</button>
		<p class="yamuna-migration-popup__eyebrow">Comunicado</p>
		<h2 id="yamuna-migration-title" class="yamuna-migration-popup__title">A Yamuna segue evoluindo. Nosso site também.</h2>
		<p class="yamuna-migration-popup__text">Você já está no nosso novo site: mais leve, ágil e pensado para tornar sua experiência por aqui ainda melhor.</p>
		<p class="yamuna-migration-popup__text">Já era cliente Yamuna? Atualize seu cadastro e crie uma nova senha para acessar sua conta.</p>
		<a class="yamuna-migration-popup__cta js-yamuna-migration-cta" href="{{ store.customer_login_url | default('/account/login/') }}">Atualizar meus dados</a>
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
	background: rgba(74, 29, 58, 0.45);
}
.yamuna-migration-popup__dialog {
	position: relative;
	z-index: 1;
	width: 100%;
	max-width: 480px;
	padding: 36px 28px 32px;
	border-radius: 16px;
	background: #fff;
	box-shadow: 0 16px 48px rgba(74, 29, 58, 0.22);
	text-align: center;
}
.yamuna-migration-popup__close {
	position: absolute;
	top: 10px;
	right: 14px;
	border: 0;
	background: transparent;
	color: #4a1d3a;
	font-size: 28px;
	line-height: 1;
	cursor: pointer;
}
.yamuna-migration-popup__eyebrow {
	margin: 0 0 8px;
	color: #a31460;
	font-family: 'Dosis', sans-serif;
	font-size: 14px;
	font-weight: 700;
	letter-spacing: 0.12em;
	text-transform: uppercase;
}
.yamuna-migration-popup__title {
	margin: 0 0 16px;
	color: #4a1d3a;
	font-family: 'Raleway', sans-serif;
	font-size: 24px;
	font-weight: 700;
	line-height: 1.25;
}
.yamuna-migration-popup__text {
	margin: 0 0 12px;
	color: #363544;
	font-family: 'Dosis', sans-serif;
	font-size: 16px;
	line-height: 1.45;
}
.yamuna-migration-popup__cta {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	min-height: 48px;
	margin-top: 16px;
	padding: 12px 28px;
	border-radius: 8px;
	background: #a31460;
	color: #fff !important;
	font-family: 'Raleway', sans-serif;
	font-size: 15px;
	font-weight: 700;
	text-decoration: none !important;
	text-transform: uppercase;
}
.yamuna-migration-popup__cta:hover { background: #8c1052; color: #fff !important; }
@media (max-width: 767px) {
	.yamuna-migration-popup__dialog { padding: 28px 20px 24px; }
	.yamuna-migration-popup__title { font-size: 20px; }
}
</style>

<script>
(function () {
	var KEY = 'yamuna_migration_popup_seen_v2';
	var root = document.getElementById('yamuna-migration-popup');
	if (!root) return;
	try {
		if (window.localStorage && localStorage.getItem(KEY)) return;
	} catch (e) {}

	function markSeen() {
		try { localStorage.setItem(KEY, '1'); } catch (e) {}
	}
	function openPopup() {
		root.hidden = false;
		root.setAttribute('aria-hidden', 'false');
		document.documentElement.classList.add('yamuna-migration-open');
	}
	function closePopup() {
		root.hidden = true;
		root.setAttribute('aria-hidden', 'true');
		document.documentElement.classList.remove('yamuna-migration-open');
		markSeen();
	}

	root.querySelectorAll('.js-yamuna-migration-close').forEach(function (el) {
		el.addEventListener('click', closePopup);
	});
	var cta = root.querySelector('.js-yamuna-migration-cta');
	if (cta) {
		cta.addEventListener('click', markSeen);
	}
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
