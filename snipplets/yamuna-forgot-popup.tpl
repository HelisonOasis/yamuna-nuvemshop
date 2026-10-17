{# Forgot-password notice for customers migrated from the old platform. Intercepts every link to the reset page and shows the migration popup first. Included from header.tpl and account/login.tpl; guarded so it only runs once per page. #}
<template id="yamuna-forgot-popup-tpl">
<div id="yamuna-forgot-popup" class="yamuna-migration-popup yamuna-forgot-popup" aria-hidden="false">
	<div class="yamuna-migration-popup__backdrop" data-yamuna-forgot-close tabindex="-1"></div>
	<div class="yamuna-migration-popup__dialog" role="dialog" aria-modal="true" aria-labelledby="yamuna-forgot-title">
		<button type="button" class="yamuna-migration-popup__close" data-yamuna-forgot-close aria-label="Fechar popup">&times;</button>
		<div class="yamuna-migration-popup__brand">
			<img src="{{ 'images/yamuna/logo-yamuna-branco.png' | static_url }}" alt="Yamuna" />
		</div>
		<div class="yamuna-migration-popup__content">
			<h2 id="yamuna-forgot-title" class="yamuna-migration-popup__title"><strong>Nosso site mudou para melhor</strong>.</h2>
			<p class="yamuna-forgot-popup__text">Se voc&ecirc; comprou em nosso site antes de 23/09/26, <strong>registre-se novamente</strong> e crie sua nova senha.</p>
			<div class="yamuna-forgot-popup__actions">
				<a class="yamuna-forgot-popup__btn yamuna-forgot-popup__btn--primary" href="{{ store.customer_register_url }}">Criar novo cadastro</a>
				<a class="yamuna-forgot-popup__btn yamuna-forgot-popup__btn--ghost" data-yamuna-forgot-continue href="{{ store.customer_reset_password_url }}">J&aacute; me cadastrei no novo site, redefinir senha</a>
			</div>
		</div>
	</div>
</div>
</template>
<style>
.yamuna-migration-popup{position:fixed;inset:0;z-index:100000!important;display:flex;align-items:center;justify-content:center;padding:24px}
.yamuna-migration-popup__backdrop{position:absolute;inset:0;z-index:1;background:rgba(58,20,46,.58);backdrop-filter:blur(2px);cursor:pointer}
.yamuna-migration-popup__dialog{position:relative;z-index:2;width:100%;max-width:650px;border:1px solid rgba(163,20,96,.16);border-radius:20px;background:#fff;box-shadow:0 24px 70px rgba(58,20,46,.36);text-align:center}
.yamuna-migration-popup__close{position:absolute;top:14px;right:14px;z-index:10;display:inline-flex;align-items:center;justify-content:center;width:40px;height:40px;margin:0;padding:0;border:0;border-radius:50%;background:rgba(255,255,255,.22);color:#fff;font-size:30px;line-height:1;cursor:pointer;-webkit-appearance:none;appearance:none}
.yamuna-migration-popup__brand{display:flex;align-items:center;justify-content:center;height:108px;padding:0 52px;border-radius:20px 20px 0 0;background:linear-gradient(118deg,#741442 0%,#a31460 52%,#c50b6a 100%)}
.yamuna-migration-popup__brand img{width:132px;height:68px;object-fit:contain}
.yamuna-migration-popup__content{padding:44px 56px 48px;background:linear-gradient(145deg,#fff 0%,#fff8fb 100%);border-radius:0 0 20px 20px}
.yamuna-migration-popup__title{margin:0;color:#4a1d3a;font-family:'Raleway',sans-serif;font-size:28px;font-weight:500;line-height:1.35}
.yamuna-forgot-popup__text{margin:14px 0 0;color:#4a1d3a;font-family:'Raleway',sans-serif;font-size:18px;line-height:1.5}
.yamuna-forgot-popup__actions{display:flex;flex-direction:column;gap:12px;margin-top:28px}
.yamuna-forgot-popup__btn{display:block;padding:13px 20px;border-radius:999px;font-family:'Raleway',sans-serif;font-size:15px;font-weight:700;text-decoration:none!important;border:1px solid #a31460}
.yamuna-forgot-popup__btn--primary{background:#a31460;color:#fff!important;text-transform:uppercase}
.yamuna-forgot-popup__btn--ghost{background:#fff;color:#a31460!important}
html.yamuna-forgot-open{overflow:hidden}
@media (max-width:767px){.yamuna-migration-popup{padding:18px}.yamuna-migration-popup__brand{height:88px}.yamuna-migration-popup__brand img{width:112px;height:58px}.yamuna-migration-popup__content{padding:34px 24px 36px}.yamuna-migration-popup__title{font-size:22px}.yamuna-forgot-popup__text{font-size:16px}}
</style>
<script>
(function () {
	if (window.__yamunaForgotPopup) return;
	window.__yamunaForgotPopup = true;
	var tpl = document.getElementById('yamuna-forgot-popup-tpl');
	if (!tpl) return;
	var root = null;
	function isResetLink(a) {
		if (!a || !a.getAttribute) return false;
		if (a.hasAttribute('data-yamuna-forgot-continue')) return false;
		var h = a.getAttribute('href') || '';
		return /\/account\/reset\/?(\?|#|$)/.test(h);
	}
	function close(e) { if (e) e.preventDefault(); if (root) { root.parentNode.removeChild(root); root = null; } document.documentElement.classList.remove('yamuna-forgot-open'); }
	function open() {
		if (root) return;
		var frag = tpl.content ? tpl.content.cloneNode(true) : null;
		if (!frag) return false;
		document.body.appendChild(frag);
		root = document.getElementById('yamuna-forgot-popup');
		document.documentElement.classList.add('yamuna-forgot-open');
		root.addEventListener('click', function (e) { if (e.target.closest && e.target.closest('[data-yamuna-forgot-close]')) close(e); });
		return true;
	}
	window.yamunaOpenForgotPopup = open;
	document.addEventListener('click', function (e) {
		var a = e.target && e.target.closest ? e.target.closest('a') : null;
		if (!isResetLink(a)) return;
		if (open()) { e.preventDefault(); e.stopPropagation(); }
	}, true);
	document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && root) close(e); });
})();
</script>