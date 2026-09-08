<section class="yamuna-about-page">
	<div class="yamuna-about-layout">
		{% include 'snipplets/pages/institutional-sidebar.tpl' %}

		<article class="yamuna-about-content">
			<h1>Nosso Manifesto</h1>

			<p class="yamuna-about-lead">A saúde é reflexo da harmonia entre corpo, mente e espírito, está ligada essencialmente ao que consumimos. Essa verdade já estava em nós antes mesmo do nascimento da Yamuna. O Ayurveda e o Yoga são presentes há muito tempo em nossas vidas e tudo começou nas panelas de casa, antes de nos conhecermos.</p>

			<p>Eu (Daiane) e Bernardo já fazíamos ghee em 2002: ele para as dietas yóguis e eu para tratamentos ayurvédicos. Somos buscadores de saúde e conhecimento e isso se espelha diariamente em nosso estilo de vida, em como nos alimentamos e na forma de criar nossos produtos e nossos três filhos.</p>

			<figure class="yamuna-about-media">
				<img src="{{ 'images/yamuna/manifesto/ghee.png' | static_url }}" alt="Ghee Yamuna" width="760" height="197">
			</figure>

			<p>Cozinhar é um ato de amor, cuidado e muita arte. Somos apaixonados por criar alimentos que promovem nutrição elevada, provando que saúde e sabor podem, sim, andar juntas. Criamos alimentos naturais também para a pele – óleos, sabonetes e shampoos que são bálsamos de cuidado, iluminam os sentidos e transformam emoções.</p>

			<figure class="yamuna-about-media yamuna-about-media--soaps">
				<img src="{{ 'images/yamuna/manifesto/sabonetes.png' | static_url }}" alt="Sabonetes artesanais Yamuna" width="800" height="1080">
			</figure>

			<p class="yamuna-about-highlight">Da natureza às suas mãos, buscamos mais respeito ao planeta, animais e às pessoas.</p>

			<p>Produzimos em pequenos lotes, escolhemos matérias primas de pequenos produtores confiáveis – agroecológicos e orgânicos, compostamos nossos resíduos e investimos bastante em reciclagem. Tudo isso para que nossos produtos sejam mais justos, saudáveis e saborosos para você. Para que te inspirem, assim como inspiram nossa vida.</p>

			<figure class="yamuna-about-media">
				<img src="{{ 'images/yamuna/manifesto/equipe.png' | static_url }}" alt="Yamuna Artesanal" width="1200" height="600">
			</figure>

			<div class="yamuna-about-closing">
				<p>Agora que você sabe um pouco mais sobre nós, também queremos te conhecer! Esse é um espaço de troca, de aprendizados e de inspiração. Pode nos enviar sua dúvida, deixar sugestões, uma dose de amor… e bem-vindo à família Yamuna!</p>
				{% if store.whatsapp %}
					<a class="yamuna-about-btn" href="{{ store.whatsapp }}" target="_blank" rel="noopener">Fale conosco</a>
				{% else %}
					<a class="yamuna-about-btn" href="https://api.whatsapp.com/send?phone=5548984591522" target="_blank" rel="noopener">Fale conosco</a>
				{% endif %}
			</div>
		</article>
	</div>
</section>
