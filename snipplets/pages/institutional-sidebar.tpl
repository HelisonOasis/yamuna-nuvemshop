{% set current_handle = page.handle | lower %}
<aside class="yamuna-inst-sidebar">
	<p class="yamuna-inst-title">Institucionais</p>
	<nav class="yamuna-inst-nav" aria-label="Institucionais">
		<ul>
			<li>
				<a href="/quem-somos" {% if current_handle == 'quem-somos' or current_handle == 'quemsomos' %}class="is-active"{% endif %}>Quem somos</a>
			</li>
			<li>
				<a href="/nossomanifesto" {% if current_handle == 'nossomanifesto' %}class="is-active"{% endif %}>Nosso manifesto</a>
			</li>
			<li>
				<a href="/encontrar" {% if current_handle == 'encontrar' %}class="is-active"{% endif %}>Onde encontrar</a>
			</li>
			<li>
				<a href="/PoliticaDePrivacidade" {% if current_handle == 'politicadeprivacidade' %}class="is-active"{% endif %}>Política de privacidade</a>
			</li>
			<li>
				<a href="/duvidasfrequentes" {% if current_handle == 'duvidasfrequentes' %}class="is-active"{% endif %}>Dúvidas frequentes</a>
			</li>
			<li>
				<a href="/TrocaseDevolucoes" {% if current_handle == 'trocasedevolucoes' %}class="is-active"{% endif %}>Trocas e reembolsos</a>
			</li>
			<li>
				<a href="/entrega" {% if current_handle == 'entrega' %}class="is-active"{% endif %}>Regras de frete grátis</a>
			</li>
			<li>
				<a href="/regulamento-afiliados" {% if current_handle == 'regulamento-afiliados' %}class="is-active"{% endif %}>Regulamento Afiliados</a>
			</li>
		</ul>
	</nav>
</aside>
