<form class="js-search-container js-search-form search-container" action="{{ store.search_url }}" method="get">
	<div class="form-group m-0">
        <input class="js-search-input form-control search-input" autocomplete="off" type="search" name="q" placeholder="{{ '¿Qué estás buscando?' | translate }}" aria-label="{{ '¿Qué estás buscando?' | translate }}" />
        <button type="submit" class="btn search-input-submit" value="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscar' | translate }}">
            <svg class="icon-inline icon-2x"><use xlink:href="#search"/></svg>
        </button>
	</div>
</form>
<div class="js-search-suggest search-suggest">
    <div class="yamuna-search-default">
        <strong class="yamuna-search-default-title">Sugestões de Pesquisa</strong>
        <div class="yamuna-search-chips">
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Manteiga Ghee">Manteiga Ghee</button>
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Creme de Castanhas">Creme de Castanhas</button>
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Alimentos de Coco">Alimentos de Coco</button>
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Shampoo em Barra">Shampoo em Barra</button>
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Condicionador em Barra">Condicionador em Barra</button>
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Chocolates">Chocolates</button>
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Cafés">Cafés</button>
            <button type="button" class="yamuna-search-chip" data-yamuna-search-suggestion="Veganos">Veganos</button>
        </div>
    </div>
</div>
