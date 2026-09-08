{% set reseller_url = 'https://revendedor.yamuna.com.br' %}
{% if store.whatsapp %}
	{% set whatsapp_url = store.whatsapp %}
{% else %}
	{% set whatsapp_url = 'https://api.whatsapp.com/send?phone=554884361522' %}
{% endif %}

<section class="yamuna-resale-page">
	<section class="yamuna-resale-hero">
		<a class="yamuna-resale-hero-media" href="{{ reseller_url }}" target="_blank" rel="noopener">
			<picture>
				<source media="(max-width: 430px)" srcset="{{ 'images/yamuna/revenda/hero-mb.png' | static_url }}">
				<img src="{{ 'images/yamuna/revenda/hero.png' | static_url }}" alt="Seja um revendedor Yamuna" width="1920" height="580">
			</picture>
		</a>
		<div class="yamuna-resale-hero-card">
			<h1>Seja um revendedor Yamuna!</h1>
			<p>Alimentos saudáveis e naturais de verdade, inspirados no Yoga e Ayurveda, prontos para encantar os seus clientes!</p>
			<a class="yamuna-resale-btn yamuna-resale-btn-teal" href="{{ reseller_url }}" target="_blank" rel="noopener">Clique aqui</a>
			<p class="yamuna-resale-hero-note">*Preços e condições especiais para lojistas.</p>
		</div>
	</section>

	<section class="yamuna-resale-section yamuna-resale-intro">
		<div class="yamuna-resale-intro-copy">
			<p>Há mais de 17 anos, a Yamuna Artesanal escreve uma história que une <strong>tradição, inovação e paixão pela alimentação saudável.</strong> Pioneiros no Brasil na produção de manteiga Ghee, expandimos nosso portfólio com uma linha única de produtos que apaixonam os clientes: <strong>ghee, cremes de castanhas, leites vegetais, alimentos de coco, adoçantes naturais, temperos, massalas e muito mais.</strong></p>
			<p>Cada produto é cuidadosamente elaborado com ingredientes puros e naturais de verdade, garantindo qualidade e sabor que conquistam o coração dos consumidores. Nossa inspiração no Yoga e na Ayurveda traz um diferencial autêntico que se reflete na experiência de saúde e bem-estar que oferecemos.</p>
			<a class="yamuna-resale-btn yamuna-resale-btn-magenta yamuna-resale-btn-wide" href="{{ reseller_url }}" target="_blank" rel="noopener">Clique aqui para revender nossos produtos</a>
		</div>
		<img class="yamuna-resale-people" src="{{ 'images/yamuna/revenda/people.png' | static_url }}" alt="Fundadores Yamuna" width="464" height="557">
	</section>

	<section class="yamuna-resale-section yamuna-resale-video">
		<div class="yamuna-resale-video-frame">
			<iframe src="https://drive.google.com/file/d/1QGPMxzElg_VO3QRNwEEG86uPKsyQf_bO/preview" title="Vídeo Yamuna Revenda" allow="autoplay" allowfullscreen loading="lazy"></iframe>
		</div>
	</section>

	<section class="yamuna-resale-section yamuna-resale-seals">
		<div class="yamuna-resale-seals-featured">
			<img src="{{ 'images/yamuna/revenda/seal-yamuna.png' | static_url }}" alt="Yamuna artesanal" width="196" height="196">
		</div>
		<div class="yamuna-resale-seals-grid">
			<img src="{{ 'images/yamuna/revenda/seal-sem-acucar.png' | static_url }}" alt="Sem açúcar" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-pouco-acucar.png' | static_url }}" alt="Pouco açúcar" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-vacas-pasto.png' | static_url }}" alt="Vacas de pasto" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-organico.png' | static_url }}" alt="Orgânico" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-vegano.png' | static_url }}" alt="Vegano" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-sem-lactose.png' | static_url }}" alt="Sem lactose" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-sem-gluten.png' | static_url }}" alt="Sem glúten" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-cruelty-free.png' | static_url }}" alt="Não testado em animais" width="196" height="196">
			<img src="{{ 'images/yamuna/revenda/seal-qualidade.png' | static_url }}" alt="Controle de qualidade" width="196" height="196">
		</div>
	</section>

	<section class="yamuna-resale-banner">
		<picture>
			<source media="(max-width: 767px)" srcset="{{ 'images/yamuna/revenda/banner-spices-mb.png' | static_url }}">
			<img src="{{ 'images/yamuna/revenda/banner-spices.png' | static_url }}" alt="Cúrcuma Yamuna" width="1319" height="494">
		</picture>
	</section>

	<section class="yamuna-resale-section yamuna-resale-why">
		<h2>Por que revender Yamuna?</h2>
		<p><strong>Produtos puros</strong> que encantam e fidelizam os clientes.</p>
		<p><strong>Linha diversificada</strong> para atender diferentes perfis de consumidores.</p>
		<p><strong>Qualidade</strong> que transforma a compra em uma escolha consciente.</p>
		<p><strong>Apoio exclusivo para nossos parceiros,</strong> com materiais de divulgação e estratégias de vendas.</p>
	</section>

	<section class="yamuna-resale-section yamuna-resale-diffs">
		<h2>Nossos diferenciais</h2>
		<div class="yamuna-resale-diffs-grid">
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-1.png' | static_url }}" alt="Fabricação própria" width="164" height="164">
				<figcaption>Fabricação própria</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-2.png' | static_url }}" alt="Produtos Ayurvédicos" width="164" height="164">
				<figcaption>Produtos Ayurvédicos</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-4.png' | static_url }}" alt="Alimentos puros sem aditivo" width="164" height="164">
				<figcaption>Alimentos puros sem aditivo</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-3.png' | static_url }}" alt="Avaliação 5 no Google" width="164" height="164">
				<figcaption>Avaliação 5 no Google</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-5.png' | static_url }}" alt="Lançamentos recorrentes" width="164" height="164">
				<figcaption>Lançamentos recorrentes</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-6.png' | static_url }}" alt="Embalagem sustentável" width="164" height="164">
				<figcaption>Embalagem sustentável</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-8.png' | static_url }}" alt="Selo eureciclo" width="164" height="164">
				<figcaption>Selo eureciclo</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-7.png' | static_url }}" alt="Revendedoras ativas" width="164" height="164">
				<figcaption>revendedoras ativas</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-9.png' | static_url }}" alt="Já consumiram nossas delícias" width="164" height="164">
				<figcaption>já consumiram nossas delícias</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-10.png' | static_url }}" alt="Positivas de clientes" width="164" height="164">
				<figcaption>positivas de clientes</figcaption>
			</figure>
			<figure>
				<img src="{{ 'images/yamuna/revenda/dif-11.png' | static_url }}" alt="De história" width="164" height="164">
				<figcaption>de história</figcaption>
			</figure>
		</div>
		<a class="yamuna-resale-btn yamuna-resale-btn-teal yamuna-resale-btn-wide" href="{{ reseller_url }}" target="_blank" rel="noopener">Revenda Yamuna e surpreenda seus clientes!</a>
	</section>

	<section class="yamuna-resale-banner">
		<picture>
			<source media="(max-width: 767px)" srcset="{{ 'images/yamuna/revenda/banner-jars-mb.png' | static_url }}">
			<img src="{{ 'images/yamuna/revenda/banner-jars.png' | static_url }}" alt="Produtos Yamuna" width="1319" height="492">
		</picture>
	</section>

	<section class="yamuna-resale-section yamuna-resale-join">
		<h2>Faça parte dessa jornada!</h2>
		<p>Se você quer levar inovação, saúde e sabor para os seus clientes, torne-se um revendedor Yamuna e conquiste um mercado que não para de crescer.</p>
		<p><strong>Cadastre-se agora</strong> e tenha acesso ao nosso catálogo completo e condições especiais.</p>
		<a class="yamuna-resale-btn yamuna-resale-btn-magenta" href="{{ whatsapp_url }}" target="_blank" rel="noopener">Quero falar pelo WhatsApp</a>
	</section>
</section>
