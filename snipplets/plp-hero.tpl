{% set plp_title = category.name | default('Todos os produtos') %}
{% set plp_handle = category.handle | default('') %}
{% set plp_image = 'images/yamuna/plp-banners/todos-os-produtos.jpg' %}
{% set plp_is_all_products = false %}

{% if plp_handle == 'kits-presentes' or plp_handle == 'degustacao' %}
    {% set plp_description = 'Nossos Kits e produtos de degustação são um delicioso convite para explorar o universo Yamuna e conhecer nossos sabores, texturas e aromas - antes de se aventurar em potes maiores. Perfeitos também para quem já conhece nossas criações e quer presentear alguém especial. Mimos e kits com todo amor para encantar e inspirar uma vida mais saudável.' %}
    {% set plp_image = 'images/yamuna/plp-banners/kits-presentes.jpg' %}
{% elseif plp_handle == 'manteiga-ghee' %}
    {% set plp_description = 'Somos pioneiros na fabricação de ghee no Brasil, iniciamos há mais de 16 anos fazendo ghee para tratamentos Ayurvédicos e aos poucos fomos melhorando nossa produção. Utilizamos as melhores manteigas de gado de pasto de Santa Catarina, provenientes de vacas criadas soltas, sem uso de antibióticos e alimentadas com pasto sem pesticidas. Nosso compromisso com a qualidade e pureza da manteiga garante um ghee perfeito, brilhante, bem amarelo e verdadeiramente saudável.' %}
    {% set plp_image = 'images/yamuna/plp-banners/manteiga-ghee.jpg' %}
{% elseif plp_handle == 'creme-de-pistache' %}
    {% set plp_description = 'Os cremes de castanhas são feitos em moinho de pedra, num processo longo de 3 a 5 dias para que seja possível alcançar uma cremosidade finíssima sem aquecer os ingredientes. Assim conseguimos uma elevada qualidade nutricional porque os óleos naturais presentes nas castanhas e no cacau se mantém saudáveis. Seu corpo absorve muito mais e você sente um sabor incrível.' %}
    {% set plp_image = 'images/yamuna/plp-banners/creme-de-pistache.jpg' %}
{% elseif plp_handle == 'tahines' %}
    {% set plp_description = 'Os cremes de castanhas são feitos em moinho de pedra, num processo longo de 3 a 5 dias para que seja possível alcançar uma cremosidade finíssima sem aquecer os ingredientes. Assim conseguimos uma elevada qualidade nutricional porque os óleos naturais presentes nas castanhas e no cacau se mantém saudáveis. Seu corpo absorve muito mais e você sente um sabor incrível.' %}
    {% set plp_image = 'images/yamuna/plp-banners/tahines.jpg' %}
{% elseif plp_handle == 'cremes-de-castanhas' %}
    {% set plp_description = 'Os cremes de castanhas são feitos em moinho de pedra, num processo longo de 3 a 5 dias para que seja possível alcançar uma cremosidade finíssima sem aquecer os ingredientes. Assim conseguimos uma elevada qualidade nutricional porque os óleos naturais presentes nas castanhas e no cacau se mantém saudáveis. Seu corpo absorve muito mais e você sente um sabor incrível.' %}
    {% set plp_image = 'images/yamuna/plp-banners/cremes-de-castanhas.jpg' %}
{% elseif plp_handle == 'alimentos-de-coco' %}
    {% set plp_description = 'Deliciosos e naturais, nossos produtos à base de coco são feitos com ingredientes selecionados para trazer saúde e sabor ao seu dia a dia. Desde o óleo de coco extra virgem até o leite de coco em pó, oferecemos qualidade e praticidade para enriquecer suas receitas e sua alimentação. Experimente a versatilidade e os benefícios do coco na sua rotina com a Yamuna.' %}
    {% set plp_image = 'images/yamuna/plp-banners/alimentos-de-coco.jpg' %}
{% elseif plp_handle == 'shampoos-e-condicionadores-naturais' %}
    {% set plp_description = 'Combinando tradição e inovação, nossos shampoos e condicionadores naturais utilizam ingredientes puros para limpar e hidratar profundamente, mantendo o equilíbrio dos fios e couro cabeludo. Biodegradáveis e livres de químicos agressivos, cuidam do seu cabelo de forma suave, promovendo saúde e brilho natural. Aromas feitos com óleos essenciais puros de verdade, oferecendo um cuidado terapêutico e transformador que você sente em cada banho.' %}
    {% set plp_image = 'images/yamuna/plp-banners/shampoos-e-condicionadores.jpg' %}
{% elseif plp_handle == 'sabonetes-naturais' %}
    {% set plp_description = 'Nossos sabonetes são elaborados com óleos essenciais puros, que conferem propriedades naturalmente terapêuticas a cada barra. Biodegradáveis e suaves para a pele, eles limpam sem agredir, devolvendo a hidratação natural e mantendo o equilíbrio cutâneo. Descubra a pureza e a eficácia dos sabonetes Yamuna, onde tradição e inovação se unem para cuidar de você e do meio ambiente.' %}
    {% set plp_image = 'images/yamuna/plp-banners/sabonetes-naturais.jpg' %}
{% elseif plp_handle == 'cafes-especiais' %}
    {% set plp_description = 'Cafés Especiais Yamuna: Descubra o verdadeiro sabor do café com nossa seleção de grãos 100% arábica, cultivados em terroirs únicos do Brasil. Cada pacote é resultado de um processo cuidadoso, desde a colheita manual até a torra média artesanal, que realça o perfil sensorial de cada variedade. Nossos cafés são escolhidos a dedo para proporcionar uma experiência rica e aromática, sendo um excelente aliado para te dar energia com saúde.' %}
    {% set plp_image = 'images/yamuna/plp-banners/cafes-especiais.jpg' %}
{% elseif plp_handle == 'chocolates-e-cacau' %}
    {% set plp_description = 'Produzidos com cacau da Bahia, originário de pequenos produtores que seguem práticas orgânicas e agroecológicas, nossas criações exaltam a riqueza e a diversidade do cacau brasileiro. Combinando tradição e inovação, nossos chocolates e produtos de cacau são perfeitos para quem busca qualidade, sabor potente e compromisso com a sustentabilidade. Sinta a diferença no sabor e benefícios com Yamuna.' %}
    {% set plp_image = 'images/yamuna/plp-banners/chocolates-e-cacau.jpg' %}
{% elseif plp_handle == 'temperos-e-massalas' %}
    {% set plp_description = 'Traga a mágica das especiarias para a sua cozinha e transforme seus pratos com sabores intensos e aromas envolventes. Nossos temperos e massalas são preparados para enriquecer suas receitas e oferecer benefícios naturais à sua saúde. São combinações únicas da culinária indiana para criar sabores complexos e harmoniosos e elevar seu paladar.' %}
    {% set plp_image = 'images/yamuna/plp-banners/temperos-e-massalas.jpg' %}
{% elseif plp_handle == 'oleos-corporais' %}
    {% set plp_description = 'No Ayurveda, os óleos corporais são essenciais para equilibrar os doshas, nutrir a pele e promover bem-estar. Nossos óleos, feitos com ingredientes naturais e óleos essenciais puros, são formulados para atender às necessidades de cada biotipo. Ideais para automassagem e uso diário, os óleos Yamuna trazem equilíbrio e bem-estar, enraizados na tradição Ayurvédica.' %}
    {% set plp_image = 'images/yamuna/plp-banners/oleos-corporais.jpg' %}
{% elseif plp_handle == 'adocantes-naturais' %}
    {% set plp_description = 'Adicione doçura à sua vida de forma saudável e equilibrada com nossos adoçantes naturais. Feitos a partir de ingredientes puros, minimamente processados, nossos produtos oferecem uma alternativa mais saudável ao açúcar refinado, mantendo o sabor sem comprometer o bem-estar. Seja para adoçar bebidas, sobremesas ou receitas, os adoçantes naturais Yamuna são a escolha perfeita para quem busca uma alimentação mais saudável.' %}
    {% set plp_image = 'images/yamuna/plp-banners/adocantes-naturais.jpg' %}
{% elseif plp_handle == 'leites-vegetais' %}
    {% set plp_description = 'Feitos com ingredientes puros e naturais, nossos leites vegetais concentrados são produzidos em moinho de pedra, preservando o sabor e os nutrientes. Cada pote rende litros de bebida, oferecendo uma opção saudável, econômica e sustentável para o seu dia a dia. Desfrute da cremosidade e do frescor de nossos leites vegetais, feitos com cuidado e respeito à natureza.' %}
    {% set plp_image = 'images/yamuna/plp-banners/leites-vegetais.jpg' %}
{% elseif plp_handle == 'nutraceuticos-capsulas' %}
    {% set plp_description = 'Em uma dieta equilibrada, certos nutrientes essenciais podem ser difíceis de obter nas quantidades ideais. Nossos nutracêuticos são formulados para preencher essas lacunas, oferecendo suporte natural e eficaz à sua saúde. Com ingredientes de alta qualidade, ajudamos você a fazer as melhores escolhas para elevar seu bem-estar e manter o equilíbrio com segurança.' %}
    {% set plp_image = 'images/yamuna/plp-banners/nutraceuticos-capsulas.jpg' %}
{% elseif plp_handle == 'casa-sustentavel' %}
    {% set plp_description = 'Da nossa casa para a sua, trazemos soluções práticas e conscientes para um lar equilibrado. Produtos naturais e ecológicos, feitos para durar e reduzir o impacto ambiental. Criados por pequenos produtores com respeito à natureza e atenção aos detalhes, eles oferecem funcionalidade, beleza e sustentabilidade no seu dia a dia.' %}
    {% set plp_image = 'images/yamuna/plp-banners/casa-sustentavel.jpg' %}
{% elseif plp_handle == 'produtos' or plp_handle == '' or plp_title == 'Todos os produtos' or plp_title == 'Produtos' %}
    {% set plp_title = 'Produtos' %}
    {% set plp_is_all_products = true %}
    {% set plp_image = 'images/yamuna/plp-banners/todos-os-produtos.jpg' %}
{% else %}
    {% set plp_description = category.description %}
{% endif %}

<section class="yamuna-plp-hero" aria-labelledby="yamuna-plp-hero-title">
    <div class="yamuna-plp-hero-image">
        <img
            src="{{ plp_image | static_url }}"
            alt="{{ plp_title }}"
            width="1724"
            height="508"
            decoding="async"
            fetchpriority="high"
        />
    </div>
    <div class="yamuna-plp-hero-content">
        <h1 id="yamuna-plp-hero-title">{{ plp_title }}</h1>
        {% if plp_is_all_products %}
        <div class="yamuna-plp-hero-description">
            <p><strong>Escolher bem faz bem.</strong> Cada produto Yamuna nasce de boas escolhas: ingredientes de qualidade, processos cuidadosos, menos excessos e mais sabor. Aqui você encontra tudo o que fazemos, pensado para fazer bem à sua vida. Escolha os seus favoritos e vamos juntos numa vida mais saudável.</p>
        </div>
        {% elseif plp_description %}
        <div class="yamuna-plp-hero-description">{{ plp_description }}</div>
        {% endif %}
    </div>
</section>
