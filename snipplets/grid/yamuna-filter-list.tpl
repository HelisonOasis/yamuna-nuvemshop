<div id="filters" class="visible-when-content-ready yamuna-plp-filter-list" data-store="filters-nav">
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="moinho de pedra">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/moinho.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Moinho de Pedra</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="organico">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/organico.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Orgânico</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="pouco acucar">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/pouco-acucar.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Pouco açúcar</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="sem acucar">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/sem-acucar.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Sem açúcar</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="sem gluten">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/sem-gluten.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Sem glúten</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="sem lactose">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/sem-lactose.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Sem lactose</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="vacas de pasto">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/vacas-pasto.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Vacas de pasto</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
	<label class="js-yamuna-plp-filter checkbox-container yamuna-plp-filter-option" data-yamuna-filter="vegano">
		<input type="checkbox" autocomplete="off" />
		<span class="checkbox yamuna-plp-filter-option-content">
			<span class="checkbox-icon yamuna-plp-filter-icon" aria-hidden="true">
				<img src="{{ 'images/yamuna/plp-filters/vegano.svg' | static_url }}" alt="" />
			</span>
			<span class="checkbox-text">Vegano</span>
			<span class="yamuna-plp-filter-remove" aria-hidden="true">×</span>
		</span>
	</label>
</div>
<div class="yamuna-plp-filter-actions">
	<a href="#" class="js-yamuna-plp-apply yamuna-plp-filter-apply" role="button">{{ 'Filtrar' | translate }}</a>
	<a href="#" class="js-yamuna-plp-clear yamuna-plp-clear-filters">{{ 'Limpar filtros' | translate }}</a>
</div>
