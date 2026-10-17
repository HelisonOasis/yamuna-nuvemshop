{#/*============================================================================
    #Specific store JS functions: product variants, cart, shipping, etc
==============================================================================*/#}

{#/*============================================================================

	Table of Contents

	#Lazy load
	#Notifications and tooltips
	#Modals
	#Cards
	#Accordions
	#Header and nav
		// Header
		// Utilities
		// Nav
		// Search suggestions
	#Sliders
		// Home slider
		// Banners slider
		// Products slider
		// Brand slider
		// Product related
		// Banner services slider
	#Social
		// Youtube or Vimeo video
		// Instagram feed
	#Product grid
		// Product item slider
		// Fixed category controls
		// Filters
		// Infinite scroll
		// Quickshop
	#Product detail functions
		// Installments
		// Change Variant
		// Submit to contact form
		// Product labels on variant change
		// Color and size variants change
		// Custom mobile variants change
		// Submit to contact
		// Product slider
		// Pinterest sharing
		// Add to cart
		// Product quantity
	#Cart
		// Free shipping bar
		// Add to cart
		// Cart quantitiy changes
		// Empty cart alert
	#Shipping calculator
		// Select and save shipping function
		// Calculate shipping function
		// Calculate shipping by submit
		// Shipping and branch click
		// Select shipping first option on results
		// Toggle branches link
		// Toggle more shipping options
		// Calculate shipping on page load
		// Shipping provinces
		// Change store country
	#Forms
	#Footer
	#Empty placeholders

==============================================================================*/#}

// Move to our_content
window.urls = {
    "shippingUrl": "{{ store.shipping_calculator_url | escape('js') }}"
}

{#/*============================================================================
  #Lazy load
==============================================================================*/ #}

{# Keep the compact mobile sort trigger text in sync with its native select. #}
;(function () {
    {# The PLP sorting menu is initialized globally in layout.tpl so it also survives dynamic content updates. #}
    return;

    function updateYamunaSortLabel(select) {
        var sort = select.closest('.yamuna-plp-sort');
        var label = sort && sort.querySelector('.yamuna-plp-sort-label');

        if (label) {
            label.textContent = select.options[select.selectedIndex].text;
        }
    }

    function setInitialYamunaSortLabel() {
        document.querySelectorAll('.yamuna-plp-sort .js-sort-by').forEach(function (select) {
            if (window.innerWidth <= 1023 && window.location.search.indexOf('sort_by=') !== -1) {
                updateYamunaSortLabel(select);
            }
            initializeYamunaMobileSortMenu(select);
        });
    }

    function initializeYamunaMobileSortMenu(select) {
        var sort = select.closest('.yamuna-plp-sort');
        var label = sort && sort.querySelector('.yamuna-plp-sort-label');

        if (!sort || !label || sort.querySelector('.yamuna-plp-sort-options')) {
            return;
        }

        var options = document.createElement('ul');
        options.className = 'yamuna-plp-sort-options';
        options.setAttribute('role', 'listbox');

        Array.prototype.forEach.call(select.options, function (option) {
            var item = document.createElement('li');
            var button = document.createElement('button');
            button.type = 'button';
            button.className = 'yamuna-plp-sort-option';
            button.textContent = option.text;
            button.setAttribute('role', 'option');
            button.dataset.value = option.value;

            button.addEventListener('click', function () {
                select.value = button.dataset.value;
                updateYamunaSortLabel(select);
                sort.classList.remove('is-open');
                label.setAttribute('aria-expanded', 'false');
                select.dispatchEvent(new Event('change', { bubbles: true }));
            });

            item.appendChild(button);
            options.appendChild(item);
        });

        label.setAttribute('role', 'button');
        label.setAttribute('tabindex', '0');
        label.setAttribute('aria-haspopup', 'listbox');
        label.setAttribute('aria-expanded', 'false');
        sort.appendChild(options);

        document.addEventListener('click', function (event) {
            if (!sort.contains(event.target)) {
                sort.classList.remove('is-open');
                label.setAttribute('aria-expanded', 'false');
            }
        });
    }

    document.addEventListener('change', function (event) {
        if (window.innerWidth <= 1023 && event.target.matches('.yamuna-plp-sort .js-sort-by')) {
            updateYamunaSortLabel(event.target);
        }
    }, true);

    function toggleYamunaMobileSortMenu(label, event) {
        if (window.innerWidth > 1023) {
            return;
        }

        var sort = label.closest('.yamuna-plp-sort');
        var select = sort && sort.querySelector('.js-sort-by');

        if (!sort || !select) {
            return;
        }

        initializeYamunaMobileSortMenu(select);
        event.preventDefault();
        event.stopPropagation();
        var isOpen = sort.classList.toggle('is-open');
        label.setAttribute('aria-expanded', String(isOpen));
    }

    document.addEventListener('click', function (event) {
        var label = event.target.closest('.yamuna-plp-sort-label');
        if (label) {
            toggleYamunaMobileSortMenu(label, event);
        }
    }, true);

    document.addEventListener('keydown', function (event) {
        var label = event.target.closest('.yamuna-plp-sort-label');
        if (label && (event.key === 'Enter' || event.key === ' ')) {
            toggleYamunaMobileSortMenu(label, event);
        }
    });

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', setInitialYamunaSortLabel);
    } else {
        setInitialYamunaSortLabel();
    }
})();

document.addEventListener('lazybeforeunveil', function(e){
    if ((e.target.parentElement) && (e.target.nextElementSibling)) {
        var parent = e.target.parentElement;
        var sibling = e.target.nextElementSibling;
        if (sibling.classList.contains('js-lazy-loading-preloader')) {
            sibling.style.display = 'none';
            parent.style.display = 'block';
        }
    }
});

{# Newsletter da home: o envio padrão fica bloqueado para nunca expor dados na URL (Perfit). #}
(function () {
    var newsletterFeedbackHideTimer = null;

    function hideNewsletterFeedback(feedback) {
        if (newsletterFeedbackHideTimer) {
            clearTimeout(newsletterFeedbackHideTimer);
            newsletterFeedbackHideTimer = null;
        }
        if (feedback) {
            feedback.hidden = true;
        }
    }

    function showNewsletterFeedback(feedback, message, text) {
        if (feedback && message) {
            message.textContent = text;
            feedback.hidden = false;
            if (newsletterFeedbackHideTimer) {
                clearTimeout(newsletterFeedbackHideTimer);
            }
            newsletterFeedbackHideTimer = setTimeout(function () {
                hideNewsletterFeedback(feedback);
            }, 5000);
        }
    }

    window.submitYamunaNewsletter = function (form) {
        if (!form || !form.checkValidity()) {
            if (form) { form.reportValidity(); }
            return false;
        }

        var feedback = document.getElementById('home-newsletter-feedback');
        var message = feedback && feedback.querySelector('.newsletter-feedback-message');
        var button = form.querySelector('button[type="submit"]');
        var name = form.querySelector('[name="name"]');
        var email = form.querySelector('[name="email"]');
        var payload = new URLSearchParams();

        payload.append('fields[1]', name ? name.value.trim() : '');
        payload.append('fields[3]', email ? email.value.trim() : '');

        if (button) {
            button.disabled = true;
            button.textContent = '{{ "Enviando..." | translate | escape('js') }}';
        }

        fetch('https://pubapi.myperfit.com/v2/optin/yamuna/KNcmLsC8', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: payload.toString()
        })
            .then(function (response) {
                if (!response.ok) { throw new Error('newsletter_signup_failed'); }
                return response.json();
            })
            .then(function (result) {
                form.reset();
                showNewsletterFeedback(feedback, message, 'Obrigado por se inscrever em nossa newsletter! Se não receber o email de confirmação, lembre-se de conferir sua pasta de spam e lixo eletrônico.');
            })
            .catch(function () {
                showNewsletterFeedback(feedback, message, '{{ "Não foi possível concluir sua inscrição. Tente novamente." | translate | escape('js') }}');
            })
            .finally(function () {
                if (button) {
                    button.disabled = false;
                    button.textContent = '{{ "Enviar" | translate | escape('js') }}';
                }
            });

        return false;
};

    function initializeYamunaNewsletter() {
        var feedback = document.getElementById('home-newsletter-feedback');
        var close = feedback && feedback.querySelector('.newsletter-feedback-close');
        var phone = document.getElementById('newsletter-phone');

        if (close) {
            close.addEventListener('click', function () { hideNewsletterFeedback(feedback); });
        }

        if (phone) {
            phone.addEventListener('input', function () {
                var digits = phone.value.replace(/\D/g, '').slice(0, 11);
                if (digits.length <= 2) {
                    phone.value = digits ? '(' + digits : '';
                } else if (digits.length <= 6) {
                    phone.value = '(' + digits.slice(0, 2) + ') ' + digits.slice(2);
                } else if (digits.length <= 10) {
                    phone.value = '(' + digits.slice(0, 2) + ') ' + digits.slice(2, 6) + '-' + digits.slice(6);
                } else {
                    phone.value = '(' + digits.slice(0, 2) + ') ' + digits.slice(2, 7) + '-' + digits.slice(7);
                }
            });
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initializeYamunaNewsletter);
    } else {
        initializeYamunaNewsletter();
    }
})();


window.lazySizesConfig = window.lazySizesConfig || {};
lazySizesConfig.hFac = 0.4;


DOMContentLoaded.addEventOrExecute(() => {

	{#/*============================================================================
	  #Notifications and tooltips
	==============================================================================*/ #}

    {# /* // Close notification and tooltip */ #}

    jQueryNuvem(".js-notification-close, .js-tooltip-close").on( "click", function(e) {
        e.preventDefault();
        jQueryNuvem(e.currentTarget).closest(".js-notification, .js-tooltip").hide();
        jQueryNuvem(".js-quick-login-badge").hide();
    });

    {# Notifications variables #}

    var $notification_status_page = jQueryNuvem(".js-notification-status-page");
    var $quick_login_notification = jQueryNuvem(".js-notification-quick-login");
    var $fixed_bottom_button = jQueryNuvem(".js-btn-fixed-bottom");

	{# /* // Follow order status notification */ #}

    if ($notification_status_page.length > 0){
        if (LS.shouldShowOrderStatusNotification($notification_status_page.data('url'))){
            $notification_status_page.show();
        };
        jQueryNuvem(".js-notification-status-page-close").on( "click", function(e) {
            e.preventDefault();
            LS.dontShowOrderStatusNotificationAgain($notification_status_page.data('url'));
        });
    }

    {# /* // Cart notification: Dismiss notification */ #}

    jQueryNuvem(".js-cart-notification-close").on("click", function(){
        jQueryNuvem(".js-alert-added-to-cart").removeClass("notification-visible").addClass("notification-hidden");
        setTimeout(function(){
            jQueryNuvem('.js-cart-notification-item-img').attr('src', '');
            jQueryNuvem(".js-alert-added-to-cart").hide();
        },2000);
    });

    {% if not settings.head_fix %}

        {# /* // Add to cart notification on non fixed header */ #}

        var topBarHeight = jQueryNuvem(".js-topbar").outerHeight();
        var logoBarHeight = jQueryNuvem(".js-nav-logo-bar").outerHeight();
        var searchBarHeight = jQueryNuvem(".js-search-container").outerHeight();
        if (window.innerWidth > 768) {
            var fixedNotificationPosition = topBarHeight + logoBarHeight;
        }else{
            var fixedNotificationPosition = logoBarHeight - searchBarHeight;
        }
        var $addedToCartNotification = jQueryNuvem(".js-alert-added-to-cart");
        var $addedToCartNotificationArrow = $addedToCartNotification.find(".js-cart-notification-arrow-up");

        function updateNotificationPosition() {
            if (window.pageYOffset == 0) {
                $addedToCartNotification.css("top", fixedNotificationPosition.toString() + 'px').css("marginTop", "-10px");
                $addedToCartNotificationArrow.css("visibility", "visible");
            } else {
                $addedToCartNotification.css("top", "10px").css("marginTop", "0px");
                $addedToCartNotificationArrow.css("visibility", "hidden");
            }
        }

        // Set initial position based on current scroll
        updateNotificationPosition();

        // Update position on scroll
        !function () {
            window.addEventListener("scroll", function (e) {
                updateNotificationPosition();
            });
        }();

    {% endif %}

    {# /* // Quick Login notification */ #}

    {% if not customer and template == 'home' %}

        {# Show quick login messages if it is returning customer #}

        setTimeout(function(){
            if (cookieService.get('returning_customer') && LS.shouldShowQuickLoginNotification()) {
                {% if store.country == 'AR' %}
                    jQueryNuvem(".js-quick-login-badge").fadeIn();
                    jQueryNuvem(".js-login-tooltip").show();
                    jQueryNuvem(".js-login-tooltip-desktop").show().addClass("visible");
                {% else %}
                    $quick_login_notification.fadeIn();
                {% endif %}
                return;
            }

        },500);

    {% endif %}

    {# Dismiss quick login notifications #}

    jQueryNuvem(".js-dismiss-quicklogin").on( "click", function(e) {
        LS.dontShowQuickLoginNotification();
    });


    setTimeout(function(){
        jQueryNuvem(".js-quick-login-success").fadeOut();
    },8000);

    {% if not params.preview %}

        {# /* // Legal footer visibility */ #}

        const footerLegal = jQueryNuvem(".js-footer-legal");

        let footerOffset = 20;

        if (window.innerWidth > 768) {
            footerOffset = 60;
        }

        {% if store.whatsapp %}
            footerLegal.css("paddingBottom", footerOffset + "px");
        {% endif %}

        {# /* // Cookie banner notification */ #}

        restoreNotifications = function(){

            // Whatsapp button position
            if (window.innerWidth < 768) {
                $fixed_bottom_button.css("marginBottom", "20px");
            }

            footerLegal.css("paddingBottom", footerOffset + "px");
        };

        if (!window.cookieNotificationService.isAcknowledged()) {
            jQueryNuvem(".js-notification-cookie-banner").show();

            {# Offset to show legal footer #}

            const cookieBannerHeight = jQueryNuvem(".js-notification-cookie-banner").outerHeight();
            footerLegal.css("paddingBottom", cookieBannerHeight + footerOffset + "px");

            {# Whatsapp button position #}
            if (window.innerWidth < 768) {
                $fixed_bottom_button.css("marginBottom", "50px");
            }
        }

        jQueryNuvem(".js-acknowledge-cookies").on( "click", function(e) {
            window.cookieNotificationService.acknowledge();

            footerLegal.removeAttr("style");
            restoreNotifications();
        });

    {% endif %}
    
    setTimeout(() => {
        $fixed_bottom_button.css("opacity", "1");
    }, 1000);

    {#/*============================================================================
      #Modals
    ==============================================================================*/ #}

    {# Full screen mobile modals back events #}

    if (window.innerWidth < 768) {

        {# Clean url hash function #}

        cleanURLHash = function(){
            const uri = window.location.toString();
            const clean_uri = uri.substring(0, uri.indexOf("#"));
            window.history.replaceState({}, document.title, clean_uri);
        };

        {# Go back 1 step on browser history #}

        goBackBrowser = function(){
            cleanURLHash();
            history.back();
        };

        {# Clean url hash on page load: All modals should be closed on load #}

        if(window.location.href.indexOf("modal-fullscreen") > -1) {
            cleanURLHash();
        }

        {# Open full screen modal and url hash #}

        jQueryNuvem(document).on("click", ".js-fullscreen-modal-open", function(e) {
            e.preventDefault();
            var modal_url_hash = jQueryNuvem(this).data("modalUrl");
            window.location.hash = modal_url_hash;
        });

        {# Close full screen modal: Remove url hash #}

        jQueryNuvem(document).on("click", ".js-fullscreen-modal-close", function(e) {
            e.preventDefault();
            goBackBrowser();
        });

        {# Hide panels or modals on browser backbutton #}

        window.onhashchange = function() {
            if(window.location.href.indexOf("modal-fullscreen") <= -1) {

                {# Close opened modal #}

                if(jQueryNuvem(".js-fullscreen-modal").hasClass("modal-show")){

                    {# Remove body lock only if a single modal is visible on screen #}

                    if(jQueryNuvem(".js-modal.modal-show").length == 1){
                        jQueryNuvem("body").removeClass("overflow-none");
                    }
                    var $opened_modal = jQueryNuvem(".js-fullscreen-modal.modal-show");
                    var $opened_modal_overlay = $opened_modal.prev();

                    $opened_modal.removeClass("modal-show");
                    setTimeout(() => $opened_modal.hide(), 500);
                    $opened_modal_overlay.fadeOut(500);
                }
            }
        }

    }

    modalOpen = function(modal_id, openType){
        var $overlay_id = jQueryNuvem('.js-modal-overlay[data-modal-id="' + modal_id + '"]');
        if (jQueryNuvem(modal_id).hasClass("modal-show")) {
            let modal = jQueryNuvem(modal_id).removeClass("modal-show");
            setTimeout(() => modal.hide(), 500);
            $overlay_id.fadeOut(500);
            if(jQueryNuvem(".js-modal.modal-show").length <= 1){
                jQueryNuvem("body").removeClass("overflow-none");
            }
        } else {
            {# Lock body scroll if there is no modal visible on screen, except desktop minicart #}

            if(!jQueryNuvem(".js-modal.modal-show").length && (window.innerWidth < 1024 || modal_id !== '#modal-cart')){
                jQueryNuvem("body").addClass("overflow-none");
            }
            jQueryNuvem(modal_id).detach().appendTo("body");
            jQueryNuvem(modal_id).show().addClass("modal-show");

            {# Show overlay for all modals #}
            $overlay_id.fadeIn(400);
            $overlay_id.detach().insertBefore(modal_id);
        }

        {# Add url hash to full screen modal if it is opened without click #}

        if(openType == 'openFullScreenWithoutClick' && window.innerWidth < 768 && jQueryNuvem(modal_id).hasClass("js-fullscreen-modal")){
            var modal_url_hash = jQueryNuvem(modal_id).data("modalUrl");
            window.location.hash = modal_url_hash;
        }
    };
    window.modalOpen = modalOpen;

    jQueryNuvem(document).on("click", ".js-modal-open", function(e) {
        e.preventDefault();
        var modal_id = jQueryNuvem(this).data('toggle');
        modalOpen(modal_id);
    });

    jQueryNuvem(document).on("click", ".js-modal-close", function(e) {
        e.preventDefault();

        {# Remove body lock only if a single modal is visible on screen #}

        if(jQueryNuvem(".js-modal.modal-show").length == 1){
            jQueryNuvem("body").removeClass("overflow-none");
        }
        var $modal = jQueryNuvem(this).closest(".js-modal");
        var modal_id = $modal.attr('id');
        var $overlay_id = jQueryNuvem('.js-modal-overlay[data-modal-id="#' + modal_id + '"]');
        $modal.removeClass("modal-show");
        setTimeout(() => $modal.hide(), 500);
        $overlay_id.fadeOut(500);

        {# Close full screen modal: Remove url hash #}

        if ((window.innerWidth < 768) && (jQueryNuvem(this).hasClass(".js-fullscreen-modal-close"))) {
            goBackBrowser();
        }
    });

    jQueryNuvem(document).on("click", ".js-modal-overlay", function(e) {
        e.preventDefault();

        {# Remove body lock only if a single modal is visible on screen #}

        if(jQueryNuvem(".js-modal.modal-show").length == 1){
            jQueryNuvem("body").removeClass("overflow-none");
        }

        var modal_id = jQueryNuvem(this).data('modalId');
        let modal = jQueryNuvem(modal_id).removeClass("modal-show");
        setTimeout(() => modal.hide(), 500);
        jQueryNuvem(this).fadeOut(500);
    });

    {% if template == 'home' and settings.home_promotional_popup %}

        {# /* // Home popup and newsletter popup */ #}

        jQueryNuvem('#news-popup-form').on("submit", function () {
            jQueryNuvem(".js-news-spinner").show();
            jQueryNuvem(".js-news-send, .js-news-popup-submit").hide();
            jQueryNuvem(".js-news-popup-submit").prop("disabled", true);
        });

        LS.newsletter('#news-popup-form-container', '#home-modal', '{{ store.contact_url | escape('js') }}', function (response) {
            jQueryNuvem(".js-news-spinner").hide();
            jQueryNuvem(".js-news-send, .js-news-popup-submit").show();
            var selector_to_use = response.success ? '.js-news-popup-success' : '.js-news-popup-failed';
            let newPopupAlert = jQueryNuvem(this).find(selector_to_use).fadeIn(100);
            setTimeout(() => newPopupAlert.fadeOut(500), 4000);
            if (jQueryNuvem(".js-news-popup-success").css("display") == "block") {
                setTimeout(function () {
                    jQueryNuvem('[data-modal-id="#home-modal"]').fadeOut(500);
                    let homeModal = jQueryNuvem("#home-modal").removeClass("modal-show");
                    setTimeout(() => homeModal.hide(), 500);
                }, 2500);
            }
            jQueryNuvem(".js-news-popup-submit").prop("disabled", false);
        });


        var callback_show = function(){
            jQueryNuvem('.js-modal-overlay[data-modal-id="#home-modal"]').fadeIn(500);
            jQueryNuvem("#home-modal").detach().appendTo("body").show().addClass("modal-show");
        }
        var callback_hide = function(){
            jQueryNuvem('.js-modal-overlay[data-modal-id="#home-modal"]').fadeOut(500);
            let homeModal = jQueryNuvem("#home-modal").removeClass("modal-show");
            setTimeout(() => homeModal.hide(), 500);
        }
        LS.homePopup({
            selector: "#home-modal",
            timeout: 10000
        }, callback_hide, callback_show);

    {% endif %}

    {#/*============================================================================
      #Cards
    ==============================================================================*/ #}
    jQueryNuvem(document).on("click", ".js-card-collapse-toggle", function(e) {
        e.preventDefault();
        jQueryNuvem(this).toggleClass('active');
        jQueryNuvem(this).closest(".js-card-collapse").toggleClass('active');
    });

    {#/*============================================================================
      #Accordions
    ==============================================================================*/ #}
    jQueryNuvem(document).on("click", ".js-accordion-toggle", function(e) {
        e.preventDefault();
        if(jQueryNuvem(this).hasClass("js-accordion-show-only")){
            jQueryNuvem(this).hide();
        }else{
            jQueryNuvem(this).find(".js-accordion-toggle-inactive").toggle();
            jQueryNuvem(this).find(".js-accordion-toggle-active").toggle();
        }
        jQueryNuvem(this).prev(".js-accordion-container").slideToggle();
    });

	{#/*============================================================================
      #Header and nav
    ==============================================================================*/ #}

    {# /* // Header */ #}

        {% if template == 'home' and settings.head_transparent %}
            {% if settings.slider and settings.slider is not empty %}

                var $swiper_height = window.innerHeight - 100;

                document.addEventListener("scroll", function() {
                    if (document.documentElement.scrollTop > $swiper_height ) {
                        jQueryNuvem(".js-head-main").removeClass("head-transparent");
                    } else {
                        jQueryNuvem(".js-head-main").addClass("head-transparent");
                    }
                });

            {% endif %}
        {% endif %}

    {% if settings.head_fix %}

        {# Slim header on scroll #}

        window.addEventListener("scroll", function() {

            var scrolledPosition = window.pageYOffset;

            var header = jQueryNuvem(".js-head-main");
            var navbarHeight = header.outerHeight();
            var topbarHeight = jQueryNuvem(".js-topbar").outerHeight();

            if (scrolledPosition > navbarHeight) {
                header.addClass('compress').css('top', (window.innerWidth < 1024 ? 0 : -topbarHeight) + 'px' );
                if (window.innerWidth < 768) {
                    $category_controls.css('top', (navbarHeight - topbarHeight - 2).toString() + 'px' );
                }
            } else {
                header.removeClass('compress').css("top", "0px");
                if (window.innerWidth < 768) {
                    $category_controls.css('top', navbarHeight.toString() + 'px' );
                }
            }
        });


    {% endif %}


    {# /* // Utilities */ #}

        jQueryNuvem(".js-utilities-item").on("mouseenter", function (e) {
            e.preventDefault();
            jQueryNuvem(e.currentTarget).toggleClass("active");
        }).on("mouseleave", function(e) {
            e.preventDefault();
            jQueryNuvem(e.currentTarget).toggleClass("active");
        });

    {# /* // Adbar slider */ #}

        {% set adbarMessage01 = settings.ad_text %}
        {% set adbarMessage02 = settings.ad_02_text %}
        {% set adbarMessage03 = settings.ad_03_text %}
        {% set adbarMultipleMessages = (adbarMessage01 and adbarMessage02) or (adbarMessage01 and adbarMessage03) or (adbarMessage02 and adbarMessage03) %}

        {% if settings.ad_bar and adbarMultipleMessages %}

            createSwiper('.js-swiper-adbar', {
                loop: true,
                watchOverflow: true,
                centerInsufficientSlides: true,
                centeredSlides: true,
                threshold: 5,
                slidesPerView: 1,
                navigation: {
                    nextEl: '.js-swiper-adbar-next',
                    prevEl: '.js-swiper-adbar-prev',
                },
            });

        {% endif %}


    {# /* // Nav */ #}

        var $top_nav = jQueryNuvem(".js-mobile-nav");
        var $page_main_content = jQueryNuvem(".js-main-content");
        var $search_backdrop = jQueryNuvem(".js-search-backdrop");

        $top_nav.addClass("move-down").removeClass("move-up");


        {# Nav subitems #}

        jQueryNuvem(".js-toggle-page-accordion").on("click", function (e) {
            e.preventDefault();
            jQueryNuvem(e.currentTarget).toggleClass("active").closest(".js-nav-list-toggle-accordion").next(".js-pages-accordion").slideToggle(300);
        });

        var win_height = window.innerHeight;
        var head_height = jQueryNuvem(".js-head-main").height();

        jQueryNuvem(".js-desktop-dropdown").css('maxHeight', (win_height - head_height - 50).toString() + 'px');

        jQueryNuvem(".js-item-desktop").on("mouseenter", function (e) {
            jQueryNuvem(e.currentTarget).addClass("active");
        }).on("mouseleave", function(e) {
            jQueryNuvem(e.currentTarget).removeClass("active");
        });

        jQueryNuvem(".js-item-desktop").on("mouseenter", function (e) {
            jQueryNuvem('.js-nav-desktop-list').children(".selected").removeClass("selected");
            jQueryNuvem(e.currentTarget).addClass("selected");
        }).on("mouseleave", function(e) {
            const self = jQueryNuvem(this);
            setTimeout(function(){
                self.removeClass("selected");
            },500);
        });

        {# Avoid megamenu dropdown flickering when mouse leave #}

        jQueryNuvem(".js-desktop-dropdown").on("mouseleave", function (e) {
            const self = jQueryNuvem(this);
            self.css("pointer-events" , "none");
            setTimeout(function(){
                self.css("pointer-events" , "initial");
            },1000);
        });

        {# Focus search #}

        jQueryNuvem(".js-toggle-search").on("click", function (e) {
            e.preventDefault;
            jQueryNuvem(".js-search-input").trigger('focus');
        });


    {# /* // Search suggestions */ #}

        LS.search(jQueryNuvem(".js-search-input"), function (html, count) {
            $search_suggests = jQueryNuvem(this).closest(".js-search-container").next(".js-search-suggest");
            if (count > 0) {
                $search_suggests.html(html).show();
            } else {
                $search_suggests.hide();
            }
            if (jQueryNuvem(this).val().length == 0) {
                $search_suggests.hide();
            }
        }, {
            snipplet: 'header/header-search-results.tpl'
        });

        if (window.innerWidth > 768) {

            {# Hide search suggestions if user click outside results #}

            jQueryNuvem("body").on("click", function () {
                jQueryNuvem(".js-search-suggest").hide();
            });

            {# Maintain search suggestions visibility if user click on links inside #}

            jQueryNuvem(document).on("click", ".js-search-suggest a", function () {
                jQueryNuvem(".js-search-suggest").show();
            });
        }

        jQueryNuvem(".js-search-suggest").on("click", ".js-search-suggest-all-link", function (e) {
            e.preventDefault();
            $this_closest_form = jQueryNuvem(this).closest(".js-search-suggest").prev(".js-search-form");
            $this_closest_form.submit();
        });

        {# Yamuna desktop search panel #}
        jQueryNuvem(document).on("focus", ".yamuna-header-desktop-search .js-search-input", function () {
            jQueryNuvem(this).closest(".js-search-container").next(".js-search-suggest").addClass("yamuna-search-open").show();
            jQueryNuvem(".head-main").addClass("yamuna-dropdown-open");
        });
        jQueryNuvem(document).on("click", ".yamuna-search-chip", function () {
            var $input = jQueryNuvem(this).closest(".js-search-suggest").prev(".js-search-container").find(".js-search-input");
            $input.val(jQueryNuvem(this).data("yamuna-search-suggestion")).trigger("input").trigger('focus');
        });
        jQueryNuvem(document).on("click", function (e) {
            if (!jQueryNuvem(e.target).closest(".yamuna-header-desktop-search").length) {
                jQueryNuvem(".yamuna-header-desktop-search .js-search-suggest").removeClass("yamuna-search-open").hide();
                jQueryNuvem(".head-main").removeClass("yamuna-dropdown-open");
            }
        });


	{#/*============================================================================
	  #Sliders
	==============================================================================*/ #}

        /*
         * Home performance: defer below-the-fold Swipers until they are near
         * the viewport. The Hero remains eager because it is part of the
         * first paint. The helper is idempotent so MutationObserver/resize
         * activity cannot create duplicate instances.
         */
        function createHomeSwiperWhenVisible(selector, swiperParams, callback, rootMargin) {
            var initialized = false;
            var margin = rootMargin || '800px 0px';

            function init() {
                if (initialized) return;
                var element = document.querySelector(selector);
                if (!element || typeof Swiper === 'undefined') return;
                initialized = true;
                createSwiper(selector, swiperParams, callback);
            }

            var element = document.querySelector(selector);
            if (!element) return;

            if (!('IntersectionObserver' in window)) {
                init();
                return;
            }

            var observer = new IntersectionObserver(function(entries) {
                for (var i = 0; i < entries.length; i++) {
                    if (entries[i].isIntersecting || entries[i].intersectionRatio > 0) {
                        observer.disconnect();
                        init();
                        break;
                    }
                }
            }, { rootMargin: margin, threshold: 0 });

            observer.observe(element);
        }

	{# Hide arrow controls when swiper is not swipable #}

	hideSwiperControls = function(elemPrev, elemNext) {
		if((jQueryNuvem(elemPrev).hasClass("swiper-button-disabled") && jQueryNuvem(elemNext).hasClass("swiper-button-disabled"))){
			jQueryNuvem(elemPrev).remove();
			jQueryNuvem(elemNext).remove();
		}
	};

	{% if template == 'home' %}

		{# /* // Home slider */ #}


        var width = window.innerWidth;
        if (width > 767) {
            var slider_autoplay = {delay: 3000, disableOnInteraction: false};
        } else {
            var slider_autoplay = {delay: 3000, disableOnInteraction: false};
        }

        var preloadImagesValue = false;
        var loopValue = true;
        var paginationClickableValue = true;

        var yamunaHomeSliderDesktopInit = function () {
        createSwiper(
            '.js-home-slider', {
                preloadImages: preloadImagesValue,
                watchSlidesVisibility: true,
                loop: document.querySelectorAll('.js-home-slider > .swiper-wrapper > .swiper-slide').length > 1,
                loopAdditionalSlides: 2,
                autoplay: slider_autoplay,
                speed: 500,
                pagination: {
                    el: '.js-swiper-home-pagination',
                    clickable: paginationClickableValue,
                },
                navigation: {
                    nextEl: '.js-swiper-home-next',
                    prevEl: '.js-swiper-home-prev',
                },
                on: {
                    init: function () {
                        this.updateSize();
                        this.updateSlides();
                    },
                    resize: function () {
                        this.updateSize();
                        this.updateSlides();
                    }
                }
            },
            function(swiperInstance) {
                window.homeSwiper = swiperInstance;
                yamunaStripHeroClonePriority('.js-home-slider');
            }
        );
        };

        var yamunaHomeSliderMobileInit = function () {
        createSwiper(
            '.js-home-slider-mobile', {
                preloadImages: preloadImagesValue,
                watchSlidesVisibility: true,
                loop: document.querySelectorAll('.js-home-slider-mobile > .swiper-wrapper > .swiper-slide').length > 1,
                loopAdditionalSlides: 2,
                autoplay: slider_autoplay,
                speed: 500,
                pagination: {
                    el: '.js-swiper-home-pagination-mobile',
                    clickable: paginationClickableValue,
                },
                navigation: {
                    nextEl: '.js-swiper-home-next-mobile',
                    prevEl: '.js-swiper-home-prev-mobile',
                }
            },
            function(swiperInstance) {
                window.homeMobileSwiper = swiperInstance;
                yamunaStripHeroClonePriority('.js-home-slider-mobile');
            }
        );
        };

        {# yamuna-perf: inicializa so o slider do breakpoint atual (o outro fica oculto e custava ~0,2-2s de CPU) #}
        function yamunaStripHeroClonePriority(selector) {
            var root = document.querySelector(selector);
            if (!root) return;
            var clones = root.querySelectorAll('.swiper-slide-duplicate img');
            for (var i = 0; i < clones.length; i++) {
                clones[i].removeAttribute('fetchpriority');
                clones[i].setAttribute('loading', 'lazy');
                clones[i].setAttribute('decoding', 'async');
            }
        }
        var yamunaHomeSlidersDone = { d: false, m: false };
        function yamunaInitHomeSliders(all) {
            var isMobile = window.innerWidth <= 767;
            var hasMobileSlider = !!document.querySelector('.js-home-slider-mobile');
            var selector = (isMobile && hasMobileSlider) ? '.js-home-slider-mobile' : '.js-home-slider';
            if (window.yamunaHydrateHero) window.yamunaHydrateHero(selector, !!all);
            if (isMobile && hasMobileSlider) {
                if (!yamunaHomeSlidersDone.m) { yamunaHomeSlidersDone.m = true; yamunaHomeSliderMobileInit(); }
            } else if (!yamunaHomeSlidersDone.d) {
                yamunaHomeSlidersDone.d = true;
                yamunaHomeSliderDesktopInit();
            }
        }
        yamunaInitHomeSliders(false);
        window.addEventListener('resize', function () { yamunaInitHomeSliders(true); });

        {# /* // Banners slider */ #}

        {# Image and text modules #}

        var itemSwiperSpaceBetween = 30;

        {% if settings.module and settings.module is not empty %}

            createHomeSwiperWhenVisible('.js-swiper-modules', {
                lazy: true,
                watchOverflow: true,
                threshold: 5,
                watchSlideProgress: true,
                watchSlidesVisibility: true,
                slideVisibleClass: 'js-swiper-slide-visible',
                spaceBetween: itemSwiperSpaceBetween,
                centerInsufficientSlides: true,
                loop: true,
                speed: 500,
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false,
                },
                navigation: {
                    nextEl: '.js-swiper-modules-next',
                    prevEl: '.js-swiper-modules-prev',
                },
                pagination: {
                    el: '.js-swiper-modules-pagination',
                    clickable: paginationClickableValue,
                },
                slidesPerView: 1.25,
                breakpoints: {
                    768: {
                        slidesPerView: 1,
                    }
                },
                on: {
                    afterInit: function () {
                        hideSwiperControls(".js-swiper-modules-prev", ".js-swiper-modules-next");
                    },
                },
            },
            function(swiperInstance) {
                window.homeModuleSwiper = swiperInstance;
            });

        {% endif %}

        {% set columns = settings.grid_columns %}


        {# /* // Products slider */ #}

        {% set has_featured_products_slider = sections.primary.products and settings.featured_products_format != 'grid' %}
        {% set has_new_products_slider = sections.new.products and settings.new_products_format != 'grid' %}
        {% set has_sale_products_slider = sections.sale.products and settings.sale_products_format != 'grid' %}

        {% if has_featured_products_slider or has_new_products_slider or has_sale_products_slider %}

            var watchOverflowVal = true;
            var centerInsufficientSlidesVal = true;
            var slidesPerViewDesktopVal = 3;
            var slidesPerViewTabletVal = 2;
            var slidesPerViewMobileVal = 1;

            {% if has_featured_products_slider %}

                /* Keep the first product rail eager so its desktop 3-card
                   layout is established before the user sees the section. */
                createSwiper('.js-swiper-featured', {
                    watchOverflow: watchOverflowVal,
                    centerInsufficientSlides: centerInsufficientSlidesVal,
                    threshold: 5,
                    watchSlideProgress: true,
                    watchSlidesVisibility: true,
                    slideVisibleClass: 'js-swiper-slide-visible',
                    rewind: true,
                    speed: 500,
                    navigation: {
                        nextEl: '.js-swiper-featured-next',
                        prevEl: '.js-swiper-featured-prev',
                    },
                    pagination: {
                        el: '.js-swiper-featured-pagination',
                        clickable: true,
                    },
                    slidesPerView: slidesPerViewMobileVal,
                    spaceBetween: 16,
                    breakpoints: {
                        768: {
                            slidesPerView: slidesPerViewTabletVal,
                            spaceBetween: 24,
                        },
                        1200: {
                            slidesPerView: slidesPerViewDesktopVal,
                            spaceBetween: 32,
                        }
                    }
                });

            {% endif %}

            {% if has_new_products_slider %}

                createHomeSwiperWhenVisible('.js-swiper-new', {
                    watchOverflow: watchOverflowVal,
                    centerInsufficientSlides: centerInsufficientSlidesVal,
                    threshold: 5,
                    watchSlideProgress: true,
                    watchSlidesVisibility: true,
                    slideVisibleClass: 'js-swiper-slide-visible',
                    rewind: true,
                    speed: 500,
                    navigation: {
                        nextEl: '.js-swiper-new-next',
                        prevEl: '.js-swiper-new-prev',
                    },
                    pagination: {
                        el: '.js-swiper-new-pagination',
                        clickable: true,
                    },
                    slidesPerView: slidesPerViewMobileVal,
                    spaceBetween: 16,
                    breakpoints: {
                        768: {
                            slidesPerView: slidesPerViewTabletVal,
                            spaceBetween: 24,
                        },
                        1200: {
                            slidesPerView: slidesPerViewDesktopVal,
                            spaceBetween: 32,
                        }
                    }
                });

            {% endif %}

            {% if has_sale_products_slider %}

                createHomeSwiperWhenVisible('.js-swiper-sale', {
                    watchOverflow: watchOverflowVal,
                    centerInsufficientSlides: centerInsufficientSlidesVal,
                    threshold: 5,
                    watchSlideProgress: true,
                    watchSlidesVisibility: true,
                    slideVisibleClass: 'js-swiper-slide-visible',
                    rewind: true,
                    speed: 500,
                    navigation: {
                        nextEl: '.js-swiper-sale-next',
                        prevEl: '.js-swiper-sale-prev',
                    },
                    pagination: {
                        el: '.js-swiper-sale-pagination',
                        clickable: true,
                    },
                    slidesPerView: slidesPerViewMobileVal,
                    spaceBetween: 16,
                    breakpoints: {
                        768: {
                            slidesPerView: slidesPerViewTabletVal,
                            spaceBetween: 24,
                        },
                        1200: {
                            slidesPerView: slidesPerViewDesktopVal,
                            spaceBetween: 32,
                        }
                    }
                });

            {% endif %}

        {% endif %}

        {# /* // Home demo products slider */ #}

        ['featured', 'sale', 'new'].forEach(setting => {
            createHomeSwiperWhenVisible(`.js-swiper-featured-demo-${setting}`, {
                loop: true,
                watchOverflow: true,
                centerInsufficientSlides: true,
                slidesPerView: 1.5,
                navigation: {
                    nextEl: `.js-swiper-featured-demo-next-${setting}`,
                    prevEl: `.js-swiper-featured-demo-prev-${setting}`
                },
                breakpoints: {
                    640: {
                        slidesPerView: {% if columns == 2 %}4{% else %}3{% endif %},
                    }
                }
            });
        });

        {# /* // Testimonials slider */ #}

        createHomeSwiperWhenVisible('.js-swiper-testimonials', {
            loop: true,
            loopedSlides: 6,
            loopAdditionalSlides: 6,
            watchOverflow: true,
            grabCursor: true,
            centeredSlides: false,
            centerInsufficientSlides: false,
            slidesPerView: 1,
            slidesPerGroup: 1,
            spaceBetween: 0,
            speed: 500,
            observer: true,
            observeParents: true,
            watchSlidesProgress: true,
            navigation: {
                nextEl: '.js-swiper-testimonials-next',
                prevEl: '.js-swiper-testimonials-prev',
            },
            breakpoints: {
                1024: {
                    slidesPerView: 3,
                    slidesPerGroup: 1,
                    spaceBetween: 24,
                },
            },
        }, function(swiperInstance) {
            function lockSlideWidths(sw) {
                if (!sw || !sw.slides) return;
                var desktop = window.matchMedia('(min-width: 1024px)').matches;
                Array.prototype.forEach.call(sw.slides, function (slide) {
                    if (desktop) {
                        if (slide.style.width) {
                            slide.style.setProperty('width', slide.style.width, 'important');
                        }
                    } else {
                        slide.style.setProperty('width', '100%', 'important');
                        slide.style.setProperty('max-width', '100%', 'important');
                        slide.style.setProperty('flex', '0 0 100%', 'important');
                    }
                });
            }
            requestAnimationFrame(function () {
                swiperInstance.update();
                lockSlideWidths(swiperInstance);
                if (swiperInstance.slideToLoop) {
                    swiperInstance.slideToLoop(0, 0, false);
                }
                lockSlideWidths(swiperInstance);
            });
            swiperInstance.on('resize', function () {
                lockSlideWidths(swiperInstance);
            });
            swiperInstance.on('breakpoint', function () {
                requestAnimationFrame(function () {
                    lockSlideWidths(swiperInstance);
                });
            });
        });

        {# /* // Home blog carousel */ #}

        function initYamunaHomeBlogSwiper() {
            if (!document.querySelector('.js-swiper-blog')) return;
            createSwiper('.js-swiper-blog', {
                watchOverflow: true,
                grabCursor: true,
                rewind: true,
                speed: 600,
                centeredSlides: false,
                slidesPerView: 1,
                spaceBetween: 16,
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false,
                    pauseOnMouseEnter: true,
                },
                navigation: {
                    nextEl: '.js-swiper-blog-next',
                    prevEl: '.js-swiper-blog-prev',
                },
                pagination: {
                    el: '.js-swiper-blog-pagination',
                    clickable: true,
                },
                breakpoints: {
                    426: {
                        slidesPerView: 1,
                        spaceBetween: 20,
                    },
                    768: {
                        slidesPerView: 2,
                        spaceBetween: 24,
                    },
                    1024: {
                        slidesPerView: 3,
                        spaceBetween: 24,
                    }
                },
            }, function(swiperInstance) {
                requestAnimationFrame(function () {
                    swiperInstance.update();
                    if (swiperInstance.autoplay && swiperInstance.autoplay.start) {
                        swiperInstance.autoplay.start();
                    }
                });
            });
        }

        var yamunaHomeBlogImages = {
            '2402-yamuna-making-of-@angelomaragno-angl8214-1216x1824.jpg': '{{ 'images/yamuna/blog-home/2402-yamuna-making-of--angelomaragno-angl8214-1216x1824.webp' | static_url }}',
            'cacau_mais_e_astecas_1.jpg': '{{ 'images/yamuna/blog-home/cacau_mais_e_astecas_1.webp' | static_url }}',
            'chocolate_tpm.jpg': '{{ 'images/yamuna/blog-home/chocolate_tpm.webp' | static_url }}',
            'curcumina-com-pimenta-preta-4-1216x1216.jpg': '{{ 'images/yamuna/blog-home/curcumina-com-pimenta-preta-4-1216x1216.webp' | static_url }}',
            'endometriose.jpg': '{{ 'images/yamuna/blog-home/endometriose.webp' | static_url }}',
            'entrega-yamuna-angl7445-1216x1824.jpg': '{{ 'images/yamuna/blog-home/entrega-yamuna-angl7445-1216x1824.webp' | static_url }}',
            'fotos-conceito-de-produto-cacau_caju.low-1x1-700px-1.jpg': '{{ 'images/yamuna/blog-home/fotos-conceito-de-produto-cacau_caju.low-1x1-700px-1.webp' | static_url }}',
            'ghee_2.jpg': '{{ 'images/yamuna/blog-home/ghee_2.webp' | static_url }}',
            'massala-chai-2_(1).jpg': '{{ 'images/yamuna/blog-home/massala-chai-2_-1-.webp' | static_url }}',
            'pre-treino-natural-yamuna-1.png': '{{ 'images/yamuna/blog-home/pre-treino-natural-yamuna-1.webp' | static_url }}',
            'textura-_ghee-yamuna.jpg': '{{ 'images/yamuna/blog-home/textura-_ghee-yamuna.webp' | static_url }}'
        };

        function yamunaHomeBlogSrc(url) {
            if (!url || url.indexOf('fbitsstatic.net') === -1) return url;
            var file = url.split('?')[0].split('/').pop();
            try { file = decodeURIComponent(file); } catch (e) {}
            return yamunaHomeBlogImages[file] || url;
        }

        function prepareYamunaHomeBlogCard(card) {
            var slide = card.cloneNode(true);
            slide.classList.remove('yamuna-blog-card--grid', 'yamuna-blog-card--featured');
            slide.classList.add('swiper-slide', 'yamuna-blog-card--home');
            slide.querySelectorAll('img').forEach(function(img) {
                var realSrc = img.getAttribute('data-src')
                    || img.getAttribute('data-original')
                    || (img.getAttribute('data-srcset') || '').split(' ')[0]
                    || '';
                if (realSrc && realSrc.indexOf('data:image') !== 0) {
                    img.setAttribute('src', yamunaHomeBlogSrc(realSrc));
                }
                img.removeAttribute('srcset');
                img.removeAttribute('data-srcset');
                img.classList.remove('lazyload', 'lazyloading');
                img.classList.add('lazyloaded');
                img.style.opacity = '1';
            });
            return slide;
        }

        var homeBlogTrack = document.querySelector('.js-yamuna-home-blog-track');
        if (homeBlogTrack && !homeBlogTrack.children.length) {
            fetch('/blog/').then(function(res) { return res.text(); }).then(function(html) {
                var doc = new DOMParser().parseFromString(html, 'text/html');
                var cards = doc.querySelectorAll('.yamuna-blog-grid .js-yamuna-blog-card');
                cards.forEach(function(card, index) {
                    if (index > 11) return;
                    homeBlogTrack.appendChild(prepareYamunaHomeBlogCard(card));
                });
                initYamunaHomeBlogSwiper();
            }).catch(function() {
                initYamunaHomeBlogSwiper();
            });
        } else if (homeBlogTrack) {
            homeBlogTrack.querySelectorAll('.js-yamuna-blog-card').forEach(function(card) {
                card.classList.remove('yamuna-blog-card--grid');
                card.classList.add('yamuna-blog-card--home');
            });
            initYamunaHomeBlogSwiper();
        } else {
            initYamunaHomeBlogSwiper();
        }

        (function initYamunaBlogFilters() {
            var grid = document.querySelector('.yamuna-blog-grid');
            if (!grid) return;
            var cards = grid.querySelectorAll('.js-yamuna-blog-card');
            var empty = document.querySelector('.js-yamuna-blog-empty');
            var search = document.querySelector('.js-yamuna-blog-q');
            var form = document.querySelector('.js-yamuna-blog-search');
            var catButtons = document.querySelectorAll('.js-yamuna-blog-cat');
            var activeCat = 'all';

            function cardMatchesCat(card, cat) {
                if (cat === 'all') return true;
                var text = (card.textContent || '').toLowerCase();
                try { text = text.normalize('NFD').replace(/[\u0300-\u036f]/g, ''); } catch (e) {}
                if (cat === 'receitas') return /receita|gelato|muffin|panqueca|levain|pao|energy ball/.test(text);
                if (cat === 'saude') return /saude|colesterol|lactose|intestino|gordura|vitamina/.test(text);
                if (cat === 'ayurveda') return /ayurveda|massala|masala|dosha/.test(text);
                if (cat === 'conhecimento') return /beneficio|ciencia|conhecimento|colesterol|gordura/.test(text);
                return true;
            }

            function applyFilter() {
                var q = (search && search.value ? search.value : '').toLowerCase().trim();
                try { q = q.normalize('NFD').replace(/[\u0300-\u036f]/g, ''); } catch (e) {}
                var visible = 0;
                cards = grid.querySelectorAll('.js-yamuna-blog-card');
                cards.forEach(function(card) {
                    var text = (card.textContent || '').toLowerCase();
                    try { text = text.normalize('NFD').replace(/[\u0300-\u036f]/g, ''); } catch (e) {}
                    var catOk = cardMatchesCat(card, activeCat);
                    var qOk = !q || text.indexOf(q) !== -1;
                    var show = catOk && qOk;
                    card.hidden = !show;
                    card.classList.toggle('is-search-hidden', !show);
                    if (show) visible += 1;
                });
                if (empty) {
                    empty.hidden = visible !== 0;
                    empty.classList.toggle('is-visible', visible === 0);
                }
            }

            if (search) {
                search.addEventListener('input', applyFilter);
            }
            if (form) {
                form.addEventListener('submit', function(event) {
                    event.preventDefault();
                    applyFilter();
                });
            }
            catButtons.forEach(function(btn) {
                btn.addEventListener('click', function() {
                    activeCat = btn.getAttribute('data-cat') || 'all';
                    catButtons.forEach(function(other) {
                        other.classList.toggle('is-active', other === btn);
                    });
                    applyFilter();
                });
            });

            /* Keep infinite-scroll / AJAX cards in the filtered set */
            var cardsObserver = window.MutationObserver ? new MutationObserver(function() {
                cards = grid.querySelectorAll('.js-yamuna-blog-card');
                applyFilter();
            }) : null;
            if (cardsObserver) {
                cardsObserver.observe(grid, { childList: true });
            }
        })();


        {# /* // Brands slider */ #}

        createHomeSwiperWhenVisible('.js-swiper-brands', {
            lazy: true,
            {% if settings.brands | length > 4 %}
                loop: true,
            {% endif %}
            watchOverflow: true,
            centerInsufficientSlides: true,
            spaceBetween: 30,
            slidesPerView: 1.5,
            navigation: {
                nextEl: '.js-swiper-brands-next',
                prevEl: '.js-swiper-brands-prev',
            },
            breakpoints: {
                640: {
                    slidesPerView: 5,
                }
            }
        },function(swiperInstance) {
            window.brandsSwiper = swiperInstance;
        });


	{% endif %}

    {# /* // Empty PLP / 404 related products — same config as PDP related */ #}
    if (document.querySelector('.yamuna-empty-related .js-swiper-related')) {
        createSwiper('.yamuna-empty-related .js-swiper-related', {
            lazy: true,
            loop: true,
            watchOverflow: true,
            centerInsufficientSlides: false,
            centeredSlides: false,
            threshold: 5,
            watchSlideProgress: true,
            watchSlidesVisibility: true,
            slideVisibleClass: 'js-swiper-slide-visible',
            slidesPerView: 1,
            spaceBetween: 0,
            navigation: {
                nextEl: '.yamuna-empty-related .js-swiper-related-next',
                prevEl: '.yamuna-empty-related .js-swiper-related-prev',
            },
            pagination: {
                el: '.yamuna-empty-related .js-swiper-related-pagination',
                clickable: true,
            },
            breakpoints: {
                768: {
                    slidesPerView: 2,
                    slidesPerGroup: 1,
                    spaceBetween: 0,
                },
                1200: {
                    slidesPerView: 3,
                    slidesPerGroup: 1,
                    spaceBetween: 30,
                }
            }
        });

        (function () {
            function yamunaForceEmptyRelatedOneCard() {
                var el = document.querySelector('.yamuna-empty-related .js-swiper-related');
                var sw = el && el.swiper;
                if (!sw) return;
                var w = window.innerWidth || document.documentElement.clientWidth || 0;
                if (w >= 768) return;
                sw.params.slidesPerView = 1;
                sw.params.spaceBetween = 0;
                sw.params.centeredSlides = false;
                sw.params.centerInsufficientSlides = false;
                sw.currentBreakpoint = false;
                if (typeof sw.update === 'function') sw.update();
                if (typeof sw.updateSlides === 'function') sw.updateSlides();
                if (typeof sw.updateSize === 'function') sw.updateSize();
                if (typeof sw.slideTo === 'function') sw.slideTo(0, 0);
            }

            {# /* 014: keep product photos inside white cards on empty-related carousel.
               Live root causes: width:100%+margin:10px, img-absolute-centered translateX(-50%),
               padding-bottom:100% aspect box, overflow:visible on .item */ #}
            function yamunaFixEmptyRelatedSpotImages() {
                var root = document.querySelector('.yamuna-empty-related');
                if (!root) return;

                if (!document.getElementById('yamuna-empty-related-spot-fix')) {
                    var style = document.createElement('style');
                    style.id = 'yamuna-empty-related-spot-fix';
                    style.textContent = [
                        '.yamuna-pdp-related.yamuna-empty-related .swiper-slide,',
                        '.yamuna-pdp-related.yamuna-empty-related .js-item-product,',
                        '.yamuna-pdp-related.yamuna-empty-related .item,',
                        '.yamuna-pdp-related.yamuna-empty-related .item-product,',
                        '.yamuna-pdp-related.yamuna-empty-related .js-product-container{',
                        'overflow:hidden!important;border-radius:12px!important;}',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image{',
                        'position:relative!important;box-sizing:border-box!important;',
                        'width:calc(100% - 24px)!important;max-width:calc(100% - 24px)!important;',
                        'margin:12px auto 0!important;padding:0!important;',
                        'overflow:hidden!important;border-radius:8px!important;}',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image a,',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image .js-product-item-image-link-private{',
                        'position:absolute!important;top:0!important;right:0!important;',
                        'bottom:0!important;left:0!important;display:block!important;',
                        'width:100%!important;height:100%!important;overflow:hidden!important;}',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image img,',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image .img-absolute,',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image .img-absolute-centered,',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image .js-item-image,',
                        '.yamuna-pdp-related.yamuna-empty-related .item-image .js-product-item-image-private{',
                        'position:absolute!important;top:0!important;right:0!important;',
                        'bottom:0!important;left:0!important;width:100%!important;',
                        'max-width:100%!important;height:100%!important;max-height:100%!important;',
                        'margin:0!important;object-fit:contain!important;object-position:center center!important;',
                        'transform:none!important;-webkit-transform:none!important;-ms-transform:none!important;}'
                    ].join('');
                    document.head.appendChild(style);
                }

                root.querySelectorAll('.item-image').forEach(function (wrap) {
                    wrap.style.setProperty('overflow', 'hidden', 'important');
                    wrap.style.setProperty('width', 'calc(100% - 24px)', 'important');
                    wrap.style.setProperty('max-width', 'calc(100% - 24px)', 'important');
                    wrap.style.setProperty('margin', '12px auto 0', 'important');
                    wrap.style.setProperty('box-sizing', 'border-box', 'important');

                    Array.prototype.forEach.call(wrap.children, function (child) {
                        if (child.tagName === 'DIV' && /padding-bottom/i.test(child.getAttribute('style') || '')) {
                            child.style.setProperty('position', 'absolute', 'important');
                            child.style.setProperty('top', '0', 'important');
                            child.style.setProperty('right', '0', 'important');
                            child.style.setProperty('bottom', '0', 'important');
                            child.style.setProperty('left', '0', 'important');
                            child.style.setProperty('width', '100%', 'important');
                            child.style.setProperty('height', '100%', 'important');
                            child.style.setProperty('padding', '0', 'important');
                            child.style.setProperty('margin', '0', 'important');
                            child.style.setProperty('overflow', 'hidden', 'important');
                        }
                    });

                    wrap.querySelectorAll('a, .js-product-item-image-link-private').forEach(function (link) {
                        link.style.setProperty('position', 'absolute', 'important');
                        link.style.setProperty('top', '0', 'important');
                        link.style.setProperty('right', '0', 'important');
                        link.style.setProperty('bottom', '0', 'important');
                        link.style.setProperty('left', '0', 'important');
                        link.style.setProperty('width', '100%', 'important');
                        link.style.setProperty('height', '100%', 'important');
                        link.style.setProperty('overflow', 'hidden', 'important');
                    });

                    wrap.querySelectorAll('img').forEach(function (img) {
                        img.style.setProperty('position', 'absolute', 'important');
                        img.style.setProperty('top', '0', 'important');
                        img.style.setProperty('right', '0', 'important');
                        img.style.setProperty('bottom', '0', 'important');
                        img.style.setProperty('left', '0', 'important');
                        img.style.setProperty('width', '100%', 'important');
                        img.style.setProperty('max-width', '100%', 'important');
                        img.style.setProperty('height', '100%', 'important');
                        img.style.setProperty('max-height', '100%', 'important');
                        img.style.setProperty('margin', '0', 'important');
                        img.style.setProperty('object-fit', 'contain', 'important');
                        img.style.setProperty('object-position', 'center center', 'important');
                        img.style.setProperty('transform', 'none', 'important');
                        img.style.setProperty('-webkit-transform', 'none', 'important');
                    });
                });

                root.querySelectorAll('.item, .js-item-product, .js-product-container').forEach(function (card) {
                    card.style.setProperty('overflow', 'hidden', 'important');
                    card.style.setProperty('border-radius', '12px', 'important');
                });
            }

            yamunaForceEmptyRelatedOneCard();
            yamunaFixEmptyRelatedSpotImages();
            setTimeout(yamunaForceEmptyRelatedOneCard, 100);
            setTimeout(yamunaFixEmptyRelatedSpotImages, 100);
            setTimeout(yamunaForceEmptyRelatedOneCard, 400);
            setTimeout(yamunaFixEmptyRelatedSpotImages, 400);
            window.addEventListener('resize', yamunaForceEmptyRelatedOneCard);
            window.addEventListener('resize', yamunaFixEmptyRelatedSpotImages);
        })();
    }

    {# /* // Blog related products — clone PDP related slides (spot markup) from a topic seed product */ #}
    (function yamunaBlogRelatedFromSeed() {
        var section = document.querySelector('.yamuna-blog-related[data-yamuna-seed]');
        if (!section) return;

        var seedUrl = section.getAttribute('data-yamuna-seed');
        var maxItems = parseInt(section.getAttribute('data-yamuna-max') || '8', 10) || 8;
        var wrapper = section.querySelector('.swiper-wrapper');
        var sliderEl = section.querySelector('.js-swiper-related');
        if (!seedUrl || !wrapper || !sliderEl) return;

        function fixBlogRelatedSpotImages() {
            section.querySelectorAll('.item-image').forEach(function (wrap) {
                wrap.style.setProperty('overflow', 'hidden', 'important');
                wrap.style.setProperty('width', 'calc(100% - 24px)', 'important');
                wrap.style.setProperty('max-width', 'calc(100% - 24px)', 'important');
                wrap.style.setProperty('margin', '12px auto 0', 'important');
                wrap.querySelectorAll('img').forEach(function (img) {
                    img.style.setProperty('object-fit', 'contain', 'important');
                    img.style.setProperty('object-position', 'center center', 'important');
                    img.style.setProperty('transform', 'none', 'important');
                    img.style.setProperty('-webkit-transform', 'none', 'important');
                    if (img.getAttribute('data-src') && (!img.getAttribute('src') || img.classList.contains('lazyload'))) {
                        img.setAttribute('src', img.getAttribute('data-src'));
                    }
                    if (img.getAttribute('data-srcset') && !img.getAttribute('srcset')) {
                        img.setAttribute('srcset', img.getAttribute('data-srcset'));
                    }
                });
            });
            section.querySelectorAll('.item, .js-item-product, .js-product-container').forEach(function (card) {
                card.style.setProperty('overflow', 'hidden', 'important');
                card.style.setProperty('border-radius', '12px', 'important');
            });
            if (window.lazySizes && window.lazySizes.autoSizer) {
                try { window.lazySizes.autoSizer.checkElems(); } catch (e) {}
            }
        }

        function initBlogRelatedSwiper() {
            section.classList.add('yamuna-empty-related');
            createSwiper('.yamuna-blog-related .js-swiper-related', {
                lazy: true,
                loop: wrapper.children.length > 3,
                watchOverflow: true,
                centerInsufficientSlides: false,
                centeredSlides: false,
                threshold: 5,
                watchSlideProgress: true,
                watchSlidesVisibility: true,
                slideVisibleClass: 'js-swiper-slide-visible',
                slidesPerView: 1,
                spaceBetween: 0,
                navigation: {
                    nextEl: '.yamuna-blog-related .js-swiper-related-next',
                    prevEl: '.yamuna-blog-related .js-swiper-related-prev',
                },
                pagination: {
                    el: '.yamuna-blog-related .js-swiper-related-pagination',
                    clickable: true,
                },
                breakpoints: {
                    768: {
                        slidesPerView: 2,
                        slidesPerGroup: 1,
                        spaceBetween: 0,
                    },
                    1200: {
                        slidesPerView: 3,
                        slidesPerGroup: 1,
                        spaceBetween: 30,
                    }
                }
            });

            function forceOne() {
                var sw = sliderEl.swiper;
                if (!sw) return;
                var w = window.innerWidth || document.documentElement.clientWidth || 0;
                if (w >= 768) return;
                sw.params.slidesPerView = 1;
                sw.params.spaceBetween = 0;
                if (typeof sw.update === 'function') sw.update();
            }
            forceOne();
            setTimeout(forceOne, 100);
            setTimeout(forceOne, 400);
            fixBlogRelatedSpotImages();
            setTimeout(fixBlogRelatedSpotImages, 100);
            setTimeout(fixBlogRelatedSpotImages, 400);
        }

        fetch(seedUrl, { credentials: 'same-origin', cache: 'no-store' })
            .then(function (res) { return res.ok ? res.text() : Promise.reject(res.status); })
            .then(function (html) {
                var doc = new DOMParser().parseFromString(html, 'text/html');
                var related = doc.querySelector('.yamuna-pdp-related[data-store="related-products"]')
                    || doc.querySelector('.yamuna-pdp-related');
                if (!related) {
                    section.style.display = 'none';
                    return;
                }

                var sourceSlides = related.querySelectorAll('.swiper-wrapper > .swiper-slide');
                var count = 0;
                var seenIds = {};

                sourceSlides.forEach(function (slide) {
                    if (count >= maxItems) return;
                    if (slide.classList.contains('swiper-slide-duplicate')) return;
                    if (!slide.querySelector('.yamuna-pdp-spot-buy-one')) return;

                    var productEl = slide.querySelector('.js-item-product');
                    var productId = productEl && productEl.getAttribute('data-product-id');
                    if (productId && seenIds[productId]) return;
                    if (productId) seenIds[productId] = true;

                    var clone = document.importNode(slide, true);
                    clone.classList.remove('swiper-slide-duplicate', 'swiper-slide-active', 'swiper-slide-next', 'swiper-slide-prev', 'js-swiper-slide-visible');
                    clone.removeAttribute('style');
                    wrapper.appendChild(clone);
                    count += 1;
                });

                if (count === 0) {
                    section.style.display = 'none';
                    return;
                }
                section.setAttribute('data-yamuna-loaded', String(count));
                initBlogRelatedSwiper();
            })
            .catch(function () {
                section.style.display = 'none';
            });
    })();

    {% if template == 'product' %}

        {# /* // Product Related */ #}

        // Set loop for related products products sliders

        const desktopColumns = {% if settings.grid_columns == 2 %}4{% else %}3{% endif %};

        function calculateRelatedLoopVal(sectionSelector) {
            let productsAmount = jQueryNuvem(sectionSelector).attr("data-related-amount");
            let loopVal = false;
            const applyLoop = (window.innerWidth < 768 && productsAmount > 2) || (window.innerWidth > 768 && productsAmount > desktopColumns);

            if (applyLoop) {
                loopVal = true;
            }

            return loopVal;
        }

        let alternativeLoopVal = calculateRelatedLoopVal(".js-related-products");
        let complementaryLoopVal = calculateRelatedLoopVal(".js-complementary-products");

        {# Alternative products #}

        var yamunaRelatedPagination = document.querySelector('.yamuna-pdp-related .js-swiper-related-pagination');
        var yamunaRelatedSlider = document.querySelector('.yamuna-pdp-related .js-swiper-related');
        if (yamunaRelatedSlider && !yamunaRelatedPagination) {
            yamunaRelatedPagination = document.createElement('div');
            yamunaRelatedPagination.className = 'js-swiper-related-pagination swiper-pagination';
            yamunaRelatedSlider.appendChild(yamunaRelatedPagination);
        }

        createSwiper('.yamuna-pdp-related .js-swiper-related', {
            lazy: true,
            loop: alternativeLoopVal,
            watchOverflow: true,
            centerInsufficientSlides: false,
            centeredSlides: false,
            threshold: 5,
            watchSlideProgress: true,
            watchSlidesVisibility: true,
            slideVisibleClass: 'js-swiper-slide-visible',
            slidesPerView: 1,
            spaceBetween: 0,
            navigation: {
                nextEl: '.yamuna-pdp-related .js-swiper-related-next',
                prevEl: '.yamuna-pdp-related .js-swiper-related-prev',
            },
            pagination: {
                el: '.yamuna-pdp-related .js-swiper-related-pagination',
                clickable: true,
            },
            breakpoints: {
                768: {
                    slidesPerView: 2,
                    slidesPerGroup: 1,
                    spaceBetween: 0,
                },
                1200: {
                    slidesPerView: 3,
                    slidesPerGroup: 1,
                    spaceBetween: 30,
                }
            }
        });

        {# Force 1 card on mobile / 2 on tablet — Swiper can keep wrong breakpoint after init. #}
        (function () {
            function yamunaForceRelatedSlides() {
                var el = document.querySelector('.yamuna-pdp-related .js-swiper-related');
                var sw = el && el.swiper;
                if (!sw) return;
                var w = window.innerWidth || document.documentElement.clientWidth || 0;
                if (w < 768) {
                    sw.params.slidesPerView = 1;
                    sw.params.spaceBetween = 0;
                    sw.params.centeredSlides = false;
                    sw.params.centerInsufficientSlides = false;
                    sw.currentBreakpoint = false;
                } else if (w < 1200) {
                    sw.params.slidesPerView = 2;
                    sw.params.slidesPerGroup = 1;
                    sw.params.spaceBetween = 0;
                    sw.params.centeredSlides = false;
                    sw.params.centerInsufficientSlides = false;
                } else {
                    return;
                }
                if (typeof sw.update === 'function') sw.update();
                if (typeof sw.updateSlides === 'function') sw.updateSlides();
                if (typeof sw.updateSize === 'function') sw.updateSize();
            }
            yamunaForceRelatedSlides();
            setTimeout(yamunaForceRelatedSlides, 100);
            setTimeout(yamunaForceRelatedSlides, 400);
            window.addEventListener('resize', yamunaForceRelatedSlides);
        })();

        {# Complementary products #}

        createSwiper('.js-swiper-complementary', {
            lazy: true,
            loop: complementaryLoopVal,
            watchOverflow: true,
            centerInsufficientSlides: true,
            threshold: 5,
            watchSlideProgress: true,
            watchSlidesVisibility: true,
            slideVisibleClass: 'js-swiper-slide-visible',
            slidesPerView: 1.5,
            navigation: {
                nextEl: '.js-swiper-complementary-next',
                prevEl: '.js-swiper-complementary-prev',
            },
            breakpoints: {
                640: {
                    slidesPerView: desktopColumns,
                }
            }
        });

    {% endif %}

	{% set has_banner_services = settings.banner_services %}

	{% if has_banner_services %}

		{# /* // Banner services slider */ #}

        if (window.innerWidth < 1024 && !window.yamunaBenefitsSwiperInitialized && document.querySelector('.js-informative-banners')) {
            window.yamunaBenefitsSwiperInitialized = true;
            var yamunaBenefitsAutoplay = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches ? false : {
                delay: 3600,
                disableOnInteraction: false,
                pauseOnMouseEnter: true,
            };
            createHomeSwiperWhenVisible('.js-informative-banners', {
                slidesPerView: 1,
                speed: 500,
                loop: true,
                loopAdditionalSlides: 2,
                watchOverflow: true,
                centerInsufficientSlides: true,
                autoplay: yamunaBenefitsAutoplay,
                pagination: {
                    el: '.js-informative-banners-pagination',
                    clickable: true,
                },
                breakpoints: {
                    480: {
                        slidesPerView: 2,
                    },
                    768: {
                        slidesPerView: 2,
                        autoplay: yamunaBenefitsAutoplay,
                    },
                    1024: {
                        slidesPerView: 5,
                        autoplay: false,
                        allowTouchMove: false,
                        loop: false,
                    }
                },
                on: {
                    breakpoint: function () {
                        this.slideTo(0, 0, false);
                    }
                }
            });
        }

    {% endif %}

	{#/*============================================================================
	  #Social
	==============================================================================*/ #}

    {% if template == 'home' %}
        {% set video_url = settings.video_embed %}
    {% elseif template == 'product' and product.video_url %}
        {% set video_url = product.video_url %}
    {% endif %}

	{% if video_url %}

        {# /* // Youtube or Vimeo video for home or each product */ #}

        LS.loadVideo('{{ video_url }}');

    {% endif %}

	{#/*============================================================================
	  #Product grid
	==============================================================================*/ #}

    {# /* // Secondary image on mouseover (077/078/079 — match prod hover swap) */ #}
    if (window.innerWidth > 767) {
        jQueryNuvem(document).on("mouseenter", ".js-item-with-secondary-image:not(.item-with-two-images), .js-product-item-private-with-secondary-images:not(.item-with-two-images)", function () {
            var $item = jQueryNuvem(this);
            var secondary = this.querySelector(".js-item-image-secondary, .item-image-secondary, .js-product-item-secondary-image-private, .js-product-item-image-secondary-private");
            if (!secondary) return;

            secondary.style.display = "block";
            $item.addClass("product-item-secondary-images-loaded");

            var onLoaded = function () {
                $item.addClass("item-with-two-images");
                secondary.removeEventListener("lazyloaded", onLoaded);
            };

            if (secondary.classList.contains("lazyloaded") || (secondary.complete && secondary.naturalWidth > 1)) {
                $item.addClass("item-with-two-images");
            } else {
                secondary.addEventListener("lazyloaded", onLoaded);
                if (window.lazySizes && typeof window.lazySizes.loader !== "undefined") {
                    try { window.lazySizes.loader.unveil(secondary); } catch (e) {}
                }
                {# Fallback if lazyloaded never fires #}
                setTimeout(function () {
                    if (!$item.hasClass("item-with-two-images")) {
                        $item.addClass("item-with-two-images");
                    }
                }, 400);
            }
        });

        {# Re-scan lazy images after home carousels finish layout #}
        setTimeout(function () {
            if (window.lazySizes && window.lazySizes.loader && typeof window.lazySizes.loader.checkElems === "function") {
                try { window.lazySizes.loader.checkElems(); } catch (e) {}
            }
        }, 600);
    }

    var $category_controls = jQueryNuvem(".js-category-controls");
    var mobile_nav_height = jQueryNuvem(".js-head-main").innerHeight();

	{% if template == 'category'%}

        {# /* // Fixed category controls */ #}

        if (window.innerWidth < 768) {

            {% if settings.head_fix %}
                $category_controls.css("top" , mobile_nav_height.toString() + 'px');
            {% else %}
                jQueryNuvem(".js-category-controls").css("top" , "0px");
            {% endif %}

            {# Detect if category controls are sticky and add css #}

            var observer = new IntersectionObserver(function(entries) {
                if(entries[0].intersectionRatio === 0)
                    jQueryNuvem(".js-category-controls").addClass("is-sticky");
                else if(entries[0].intersectionRatio === 1)
                    jQueryNuvem(".js-category-controls").removeClass("is-sticky");
                }, { threshold: [0,1]
            });

            observer.observe(document.querySelector(".js-category-controls-prev"));
        }
    {% endif %}
    {% if template == 'category' or template == 'search' %}
        {# /* // Filters */ #}

        jQueryNuvem(document).on("click", ".js-apply-filter, .js-remove-filter", function(e) {
            e.preventDefault();
            var filter_name = jQueryNuvem(this).attr('data-filter-name');
            var filter_value = jQueryNuvem(this).attr('data-filter-value');
            if(jQueryNuvem(this).hasClass("js-apply-filter")){
                jQueryNuvem(this).find("[type=checkbox]").prop("checked", true);
                LS.urlAddParam(
                    filter_name,
                    filter_value,
                    true
                );
            }else{
                jQueryNuvem(this).find("[type=checkbox]").prop("checked", false);
                LS.urlRemoveParam(
                    filter_name,
                    filter_value
                );
            }

            {# Toggle class to avoid adding double parameters in case of double click and show applying changes feedback #}

            if (jQueryNuvem(this).hasClass("js-filter-checkbox")){
                if (window.innerWidth < 768) {
                    jQueryNuvem(".js-filters-overlay").show();
                    if(jQueryNuvem(this).hasClass("js-apply-filter")){
                        jQueryNuvem(".js-applying-filter").show();
                    }else{
                        jQueryNuvem(".js-removing-filter").show();
                    }
                }
                jQueryNuvem(this).toggleClass("js-apply-filter js-remove-filter");
            }
        });

        jQueryNuvem(document).on("click", ".js-remove-all-filters", function(e) {
            e.preventDefault();
            LS.urlRemoveAllParamsExceptQuerySort();
        });

        (function initYamunaPlpFilters() {
            var options = document.querySelectorAll('.js-yamuna-plp-filter');
            if (!options.length) return;

            var modal = document.getElementById('nav-filters');
            var overlay = document.querySelector('.js-modal-overlay[data-modal-id="#nav-filters"]');
            if (overlay && overlay.parentElement !== document.body) {
                document.body.appendChild(overlay);
            }
            if (modal && modal.parentElement !== document.body) {
                document.body.appendChild(modal);
            }

            function closeYamunaFiltersNow() {
                if (!modal) return;
                modal.classList.remove('modal-show');
                modal.style.display = 'none';
                if (overlay) overlay.style.display = 'none';
                document.documentElement.classList.remove('yamuna-filters-open');
                document.body.classList.remove('overflow-none');
                if (window.location.hash.indexOf('modal-fullscreen') !== -1) {
                    history.replaceState('', document.title, window.location.pathname + window.location.search);
                }
            }

            document.addEventListener('click', function(e) {
                var applyBtn = e.target.closest('#nav-filters .js-yamuna-plp-apply');
                if (applyBtn) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    applyYamunaFilters();
                    closeYamunaFiltersNow();
                    return;
                }

                var closeBtn = e.target.closest('#nav-filters .js-modal-close');
                var overlayClick = e.target.closest('.js-modal-overlay[data-modal-id="#nav-filters"]');
                if (!closeBtn && !overlayClick) return;
                e.preventDefault();
                e.stopImmediatePropagation();
                closeYamunaFiltersNow();
            }, true);

            if (modal && window.MutationObserver) {
                new MutationObserver(function() {
                    var isOpen = modal.classList.contains('modal-show');
                    document.documentElement.classList.toggle('yamuna-filters-open', isOpen);
                    if (isOpen) {
                        document.body.classList.remove('overflow-none');
                    }
                }).observe(modal, { attributes: true, attributeFilter: ['class'] });
            }

            function normalize(value) {
                return String(value || '')
                    .toLowerCase()
                    .normalize('NFD')
                    .replace(/[\u0300-\u036f]/g, '')
                    .replace(/ç/g, 'c');
            }

            function selectedFilters() {
                var selected = [];
                document.querySelectorAll('.js-yamuna-plp-filter').forEach(function(option) {
                    var input = option.querySelector('input');
                    var isOn = option.classList.contains('is-selected') || (input && input.checked);
                    if (isOn) {
                        selected.push(normalize(option.getAttribute('data-yamuna-filter')));
                    }
                });
                return selected;
            }

            var yamunaFilterByProductId = {"364441596":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"364437592":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"360843941":["sem acucar","sem gluten","sem lactose"],"360843891":["sem acucar","sem gluten","sem lactose"],"360843842":["sem acucar","sem gluten","sem lactose"],"360258715":["sem acucar","sem gluten","sem lactose"],"360195322":["sem acucar","sem gluten","sem lactose"],"359634279":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359634271":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359634266":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359634255":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359634238":["organico","sem gluten","sem lactose","vegano"],"359634222":["vegano"],"359634216":["vegano"],"359634205":["vegano"],"359634194":["vegano"],"359633797":["vegano"],"359633788":["vegano"],"359633783":["vegano"],"359633776":["vegano"],"359633768":["vegano"],"359633756":["vegano"],"359633748":["vegano"],"359633741":["vegano"],"359633732":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359633726":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359633719":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359633712":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359633706":["organico","sem acucar","sem gluten","sem lactose","vegano"],"359633668":["sem acucar","sem gluten","sem lactose","vegano"],"359633653":["moinho de pedra","pouco acucar","sem gluten","sem lactose","vegano"],"359633647":["vegano"],"359633639":["vegano"],"359633632":["vegano"],"359633625":["vegano"],"359633615":["vegano"],"359633607":["vegano"],"359633603":["vegano"],"359633596":["vegano"],"359633589":["vegano"],"359633583":["sem acucar","sem gluten","sem lactose","vegano"],"359633578":["sem acucar","sem gluten","sem lactose","vegano"],"359633568":["sem acucar","sem gluten","sem lactose","vegano"],"359633558":["sem acucar","sem gluten","sem lactose","vegano"],"359633547":["organico","sem acucar","sem gluten","sem lactose","vegano"],"359633528":["sem acucar","sem gluten","sem lactose","vegano"],"359633476":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359633452":["sem acucar","sem gluten","sem lactose"],"359633432":["sem acucar","sem gluten","sem lactose"],"359633415":["sem acucar","sem gluten","sem lactose"],"359633389":["sem acucar","sem gluten","sem lactose"],"359633358":["pouco acucar","sem gluten","sem lactose","vegano"],"359633329":["sem acucar","sem gluten","sem lactose","vegano"],"359633315":["sem acucar","sem gluten","sem lactose","vegano"],"359633301":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359633285":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359633266":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359633228":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359633198":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359633177":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359633145":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359624539":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359624514":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359624490":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359624468":["moinho de pedra","sem acucar","sem gluten","sem lactose","vegano"],"359624441":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359624413":["sem acucar","sem gluten","sem lactose"],"359624390":["sem acucar","sem gluten","sem lactose","vegano"],"359624361":["moinho de pedra","sem gluten","sem lactose","vegano"],"359624323":["moinho de pedra","sem acucar","sem gluten","sem lactose"],"359624293":["moinho de pedra","pouco acucar","sem gluten","sem lactose"],"359624264":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359624239":["sem acucar","sem gluten","sem lactose","vegano"],"359624204":["sem acucar","sem gluten","sem lactose","vegano"],"359624181":["organico","sem acucar","sem gluten","sem lactose","vegano"],"359624153":["vegano"],"359624133":["moinho de pedra","sem acucar","sem gluten","sem lactose"],"359624114":["moinho de pedra","sem gluten"],"359624110":["moinho de pedra","sem acucar","sem gluten","sem lactose"],"359624102":["moinho de pedra","pouco acucar","sem gluten","sem lactose"],"359624099":["moinho de pedra","pouco acucar","sem gluten","sem lactose","vegano"],"359624084":["moinho de pedra","organico","sem acucar","sem gluten","sem lactose","vegano"],"359624048":["sem acucar","sem gluten","sem lactose","vegano","organico"],"359624026":["moinho de pedra","pouco acucar","sem gluten","sem lactose"],"359623998":["moinho de pedra","pouco acucar","sem gluten","sem lactose"],"359623976":["sem acucar","sem gluten","sem lactose","vacas de pasto"],"359623961":["sem gluten","sem lactose","vegano"],"359634179":["vegano"],"359634165":["vegano"],"359633801":["vegano"],"359633506":["sem acucar","sem gluten","sem lactose","vegano"],"359624346":["organico","sem acucar","sem gluten","sem lactose","vegano"],"359624169":["vegano"],"359624162":["vegano"],"359624157":["vegano"]};

            var filterAliases = {
                'moinho de pedra': ['moinho de pedra'],
                'organico': ['organico', 'organica', 'organicos'],
                'pouco acucar': ['pouco acucar', 'baixo acucar'],
                'sem acucar': ['sem acucar', 'zero acucar', '0 acucar'],
                'sem gluten': ['sem gluten'],
                'sem lactose': ['sem lactose'],
                'vacas de pasto': ['vacas de pasto', 'vacas a pasto'],
                'vegano': ['vegano', 'vegana']
            };

            function itemMatchesFilter(tags, filter) {
                var aliases = filterAliases[filter] || [filter];
                for (var i = 0; i < aliases.length; i++) {
                    if (tags.indexOf(aliases[i]) !== -1) return true;
                }
                return false;
            }

            function renderActiveFilterChips() {
                var wrap = document.querySelector('.js-yamuna-plp-active-filters');
                if (!wrap) return;

                var chips = [];
                document.querySelectorAll('.js-yamuna-plp-filter').forEach(function(option) {
                    var input = option.querySelector('input');
                    var isOn = option.classList.contains('is-selected') || (input && input.checked);
                    if (!isOn) return;
                    var labelEl = option.querySelector('.checkbox-text');
                    var label = labelEl ? labelEl.textContent.trim() : (option.getAttribute('data-yamuna-filter') || '');
                    var key = option.getAttribute('data-yamuna-filter') || '';
                    chips.push({ key: key, label: label });
                });

                if (!chips.length) {
                    wrap.innerHTML = '';
                    wrap.hidden = true;
                    wrap.classList.remove('is-visible');
                    return;
                }

                var html = '<span class="yamuna-plp-active-filters-label">Filtros ativos:</span>';
                chips.forEach(function(chip) {
                    html += '<button type="button" class="yamuna-plp-active-filter-chip js-yamuna-plp-active-chip" data-yamuna-filter="' + chip.key.replace(/"/g, '&quot;') + '">' +
                        '<span>' + chip.label + '</span><span class="yamuna-plp-active-filter-chip-remove" aria-hidden="true">×</span></button>';
                });
                html += '<a href="#" class="yamuna-plp-active-filters-clear js-yamuna-plp-clear">Limpar filtros</a>';
                wrap.innerHTML = html;
                wrap.hidden = false;
                wrap.classList.add('is-visible');
            }

            function applyYamunaFilters() {
                var selected = selectedFilters();
                var items = document.querySelectorAll('.yamuna-plp-body .js-item-product');
                var visible = 0;
                items.forEach(function(item) {
                    var mapped = yamunaFilterByProductId[item.getAttribute('data-product-id')] || [];
                    var tags = normalize((item.getAttribute('data-yamuna-tags') || '') + ' ' + mapped.join(' '));
                    var match = !selected.length || selected.every(function(filter) {
                        return itemMatchesFilter(tags, filter);
                    });
                    item.classList.toggle('is-yamuna-filtered-out', !match);
                    if (match) visible += 1;
                });
                var empty = document.querySelector('.yamuna-plp-body [data-component="filter.message"]');
                if (empty) {
                    empty.hidden = visible > 0;
                    empty.style.setProperty('display', visible ? 'none' : 'block', 'important');
                }
                var table = document.querySelector('.yamuna-plp-body .js-product-table');
                if (table) table.classList.toggle('is-yamuna-filter-empty', visible === 0 && selected.length > 0);
                renderActiveFilterChips();
            }

            window.yamunaApplyPlpFilters = applyYamunaFilters;

            options.forEach(function(option) {
                option.addEventListener('click', function(e) {
                    e.preventDefault();
                    option.classList.toggle('is-selected');
                    var input = option.querySelector('input');
                    if (input) input.checked = option.classList.contains('is-selected');
                });
            });

            document.addEventListener('click', function(e) {
                var chip = e.target.closest('.js-yamuna-plp-active-chip');
                if (!chip) return;
                e.preventDefault();
                var key = chip.getAttribute('data-yamuna-filter');
                document.querySelectorAll('.js-yamuna-plp-filter').forEach(function(option) {
                    if (option.getAttribute('data-yamuna-filter') !== key) return;
                    option.classList.remove('is-selected');
                    var input = option.querySelector('input');
                    if (input) input.checked = false;
                });
                applyYamunaFilters();
            });

            document.querySelectorAll('.js-yamuna-plp-clear').forEach(function(button) {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    document.querySelectorAll('.js-yamuna-plp-filter').forEach(function(option) {
                        option.classList.remove('is-selected');
                        var input = option.querySelector('input');
                        if (input) input.checked = false;
                    });
                    applyYamunaFilters();
                });
            });

            document.addEventListener('click', function(e) {
                var clearLink = e.target.closest('.js-yamuna-plp-active-filters .js-yamuna-plp-clear');
                if (!clearLink) return;
                e.preventDefault();
                document.querySelectorAll('.js-yamuna-plp-filter').forEach(function(option) {
                    option.classList.remove('is-selected');
                    var input = option.querySelector('input');
                    if (input) input.checked = false;
                });
                applyYamunaFilters();
            });
        })();

	{% endif %}

    {% set has_item_slider = settings.product_item_slider %}
    {% if template == 'category' or template == 'search' %}

        {# /* // Product item slider */ #}

        function updateItemSliderElementsPosition(selector){
            const $productContainer = selector.closest('.js-product-container');
            const $itemColors = $productContainer.find('.js-item-colors');
            const $itemPagination = $productContainer.find('.js-product-item-slider-pagination-container-private');
            const $itemMoreImagesMessage = $productContainer.find('.js-product-item-more-images-message-private');
            if($itemColors.length){
                $itemPagination.addClass('with-colors');
                $itemMoreImagesMessage.addClass('with-colors');
            }
        }

        {% if has_item_slider %}

            LS.productItemSlider({ 
                onInit: function(){
                    updateItemSliderElementsPosition(jQueryNuvem(this.el));
                }
            });

        {% endif %}

        !function() {

        {# /* // Infinite scroll */ #}

        {% if pages.current == 1 and not pages.is_last %}
            LS.hybridScroll({
                productGridSelector: '.js-product-table',
                spinnerSelector: '#js-infinite-scroll-spinner',
                loadMoreButtonSelector: '.js-load-more',
                hideWhileScrollingSelector: ".js-hide-footer-while-scrolling",
                productsBeforeLoadMoreButton: 50,
                productsPerPage: 12,
                afterLoaded: function(){
                    {% if has_item_slider %}
                        LS.productItemSlider({ 
                            onInit: function(){
                                updateItemSliderElementsPosition(jQueryNuvem(this.el));
                            }
                        });
                    {% endif %}
                    if (typeof window.yamunaApplyPlpFilters === 'function') {
                        window.yamunaApplyPlpFilters();
                    }
                },
            });
        {% endif %}
    }();

    {% endif %}

    {# /* // Variants without stock */ #}

    {% set is_button_variant = template == 'product' and (settings.bullet_variants or settings.image_color_variants) %}

    {% if is_button_variant %}
        const noStockVariants = (container = null) => {

            {# Configuration for variant elements #}
            const config = {
                variantsGroup: ".js-product-variants-group",
                variantButton: ".js-insta-variant",
                noStockClass: "btn-variant-no-stock",
                dataVariationId: "data-variation-id",
                dataOption: "data-option"
            };

            {# Product container wrapper #}
            const wrapper = container ? container : jQueryNuvem('#single-product');
            if (!wrapper) return;

            {# Fetch the variants data from the container #}
            const dataVariants = wrapper.data('variants');
            const variantsLength = wrapper.find(config.variantsGroup).length;

            {# Get selected options from product variations #}
            const getOptions = (productVariationId, variantOption) => {
                if (productVariationId === 2) {
                    return {
                        option0: String(wrapper.find(`${config.variantsGroup}[${config.dataVariationId}="0"] select`).val()),
                        option1: String(wrapper.find(`${config.variantsGroup}[${config.dataVariationId}="1"] select`).val()),
                        option2: String(jQueryNuvem(variantOption).attr('data-option')),
                    };
                } else if (productVariationId === 1) {
                    return {
                        option0: String(wrapper.find(`${config.variantsGroup}[${config.dataVariationId}="0"] select`).val()),
                        option1: String(jQueryNuvem(variantOption).attr('data-option')),
                    };
                } else {
                    return {
                        option0: String(jQueryNuvem(variantOption).attr('data-option')),
                    };
                }
            };

            {# Filter available variants based on selected options #}
            const filterVariants = (options) => {
                return dataVariants.filter(variant => {
                    return Object.keys(options).every(optionKey => variant[optionKey] === options[optionKey]) && variant.available;
                });
            };

            {# Update stock status for variant buttons #}
            const updateStockStatus = (productVariationId) => {
                const variationGroup = wrapper.find(`${config.variantsGroup}[${config.dataVariationId}="${productVariationId}"]`);
                variationGroup.find(`${config.variantButton}.${config.noStockClass}`).removeClass(config.noStockClass);

                variationGroup.find(config.variantButton).each((variantOption, item) => {
                    const options = getOptions(productVariationId, variantOption);
                    const itemsAvailable = filterVariants(options);
                    const button = wrapper.find(`${config.variantsGroup}[${config.dataVariationId}="${productVariationId}"] ${config.variantButton}[${config.dataOption}="${options[`option${productVariationId}`].replace(/"/g, '\\"')}"]`);

                    if (!itemsAvailable.length) {
                        button.addClass(config.noStockClass);
                    }
                });
            };

            {# Iterate through all variant and update stock status #}
            for (let productVariationId = variantsLength - 1; productVariationId >= 0; productVariationId--) {
                updateStockStatus(productVariationId);
            }
        };

        noStockVariants();

    {% endif %}

    {% if settings.quick_shop %}

        {# /* // Quickshop */ #}

        jQueryNuvem(document).on("click", ".js-item-buy-open", function(e) {
            e.preventDefault();
            jQueryNuvem(this).toggleClass("btn-primary btn-secondary");
            jQueryNuvem(this).closest(".js-quickshop-container").find(".js-item-variants").fadeToggle(300);

            var elementTop = jQueryNuvem(this).closest(".js-product-container").offset().top;
            var viewportTop = window.pageYOffset;

            if(elementTop < viewportTop){
                document.documentElement.scroll({
                    top: jQueryNuvem(this).closest(".js-product-container").offset().top - 180,
                    behavior: 'smooth'
                });
            }

        });

        jQueryNuvem(document).on("click", ".js-item-buy-close", function(e) {
            e.preventDefault();
            jQueryNuvem(this).closest(".js-item-variants").fadeToggle(300);
            jQueryNuvem(this).closest(".js-quickshop-container").find(".js-item-buy-open").toggleClass("btn-primary btn-secondary");
        });

    {% endif %}

    {% if settings.product_color_variants %}

        {# Product color variations #}

        jQueryNuvem(document).on("click", ".js-color-variant", function(e) {
            e.preventDefault();
            $this = jQueryNuvem(this);

            var option_id = $this.data('option');
            $selected_option = $this.closest('.js-item-product').find('.js-variation-option option').filter(function(el) {
                return el.value == option_id;
            });
            $selected_option.prop('selected', true).trigger('change');
            var available_variant = jQueryNuvem(this).closest(".js-quickshop-container").data('variants');

            var available_variant_color = jQueryNuvem(this).closest('.js-color-variant-active').data('option');

            for (var variant in available_variant) {
                if (option_id == available_variant[variant]['option'+ available_variant_color ]) {

                    if (available_variant[variant]['stock'] == null || available_variant[variant]['stock'] > 0 ) {

                        var otherOptions = getOtherOptionNumbers(available_variant_color);

                        var otherOption = available_variant[variant]['option' + otherOptions[0]];
                        var anotherOption = available_variant[variant]['option' + otherOptions[1]];

                        changeSelect(jQueryNuvem(this), otherOption, otherOptions[0]);
                        changeSelect(jQueryNuvem(this), anotherOption, otherOptions[1]);
                        break;

                    }
                }
            }

            $this.siblings().removeClass("selected");
            $this.addClass("selected");
        });

        function getOtherOptionNumbers(selectedOption) {
            switch (selectedOption) {
                case 0:
                    return [1, 2];
                case 1:
                    return [0, 2];
                case 2:
                    return [0, 1];
            }
        }

        function changeSelect(element, optionToSelect, optionIndex) {
            if (optionToSelect != null) {
                var selected_option_attribute = element.closest('.js-item-product').find('.js-color-variant-available-' + (optionIndex + 1)).data('value');
                var selected_option = element.closest('.js-item-product').find('#' + selected_option_attribute + " option").filter(function(el) {
                    return el.value == optionToSelect;
                });

                selected_option.prop('selected', true).trigger('change');
            }
        }
    {% endif %}

    {% if is_button_variant %}
        changeVariantButton = function(selector, parentSelector) {
            selector.siblings().removeClass("selected");
            selector.addClass("selected");
            var option_id = selector.attr('data-option');
            var parent = selector.closest(parentSelector);
            var selected_option = parent.find('.js-variation-option option').filter(function (el) {
                return el.value == option_id;
            });
            selected_option.prop('selected', true).trigger('change');
            parent.find('.js-insta-variation-label').html(option_id);
        }

        {# /* // Color and size variations */ #}

        jQueryNuvem(document).on("click", ".js-insta-variant", function (e) {
            e.preventDefault();
            $this = jQueryNuvem(this);
            changeVariantButton($this, '.js-product-variants-group');
        });

    {% endif %}

    {% if settings.quick_shop or settings.product_color_variants %}

        LS.registerOnChangeVariant(function(variant){
            {# Show product image on color change #}
            const productContainer = jQueryNuvem('.js-item-product[data-product-id="'+variant.product_id+'"]');
            const current_image = productContainer.find('.js-item-image');
            current_image.attr('srcset', variant.image_url);

                {% if has_item_slider %}

                {# Remove slider when variant changes #}

                const swiperElement = productContainer.find('.js-product-item-slider-container-private.swiper-container-initialized');

                if(swiperElement.length){
                    productContainer.find('.js-product-item-slider-slide-private').removeClass('item-image-slide');
                    setTimeout(function(){
                        const productImageLink = productContainer.find('.js-product-item-image-link-private');
                        const imageToKeep = productContainer.find('.js-swiper-slide-visible img').clone();
                        
                        // Destroy the Swiper instance
                        if (itemProductSliders[variant.product_id]) {
                            itemProductSliders[variant.product_id].destroy(true, true);
                            delete itemProductSliders[variant.product_id];
                        }
                         // Remove the Swiper elements
                         swiperElement.remove();
                         productContainer.find('.js-product-item-slider-pagination-container').remove();

                        // Insert the cloned image into the link
                        productImageLink.append(imageToKeep);

                    },300);
                }
            {% endif %}

            {% if settings.product_hover %}
                {# Remove secondary feature on image updated from changeVariant #}
                productContainer.find(".js-product-item-private-with-secondary-images").addClass("product-item-secondary-images-disabled");
            {% endif %}
        });

    {% endif %}

    {#/*============================================================================
	  #Product detail functions
	==============================================================================*/ #}

	{# /* // Installments */ #}

	{# Installments without interest #}

	function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
	    if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
	        if (installment_data.without_interests) {
	            return [number_of_installment, installment_data.installment_value.toFixed(2)];
	        }
	    }
	    return max_installments_without_interests;
	}

	{# Installments with interest #}

	function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
	    if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
	        if (installment_data.without_interests == false) {
	            return [number_of_installment, installment_data.installment_value.toFixed(2)];
	        }
	    }
	    return max_installments_with_interests;
	}

	{# Updates installments on payment popup for native integrations #}

	function refreshInstallmentv2(price){
        jQueryNuvem(".js-modal-installment-price" ).each(function( el ) {
	        const installment = Number(jQueryNuvem(el).data('installment'));
	        jQueryNuvem(el).text(LS.currency.display_short + (price/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
	    });
	}

	{# /* // Change variant */ #}

	{# Updates price, installments, labels and CTA on variant change #}

	function changeVariant(variant) {
        jQueryNuvem(".js-product-detail .js-shipping-calculator-response").hide();
        jQueryNuvem("#shipping-variant-id").val(variant.id);

	    var parent = jQueryNuvem("body");
	    if (variant.element) {
	        parent = jQueryNuvem(variant.element);
	    }

        {% if is_button_variant %}
            {# Updates variants without stock #}
            noStockVariants();
        {% endif %}

	    var sku = parent.find('#sku');
	    if(sku.length) {
	        sku.text(variant.sku).show();
	    }

	    {% if settings.product_stock or settings.latest_products_available %}
	        var stock = parent.find('.js-product-stock');
	        stock.text(variant.stock).show();
	    {% endif %}

        {# Updates installments on list item and inside payment popup for Payments Apps #}

	    var installment_helper = function($element, amount, price){
	        $element.find('.js-installment-amount').text(amount);
	        $element.find('.js-installment-price').attr("data-value", price);
	        $element.find('.js-installment-price').text(LS.currency.display_short + parseFloat(price).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
	        if(variant.price_short && Math.abs(variant.price_number - price * amount) < 1) {
	            $element.find('.js-installment-total-price').text((variant.price_short).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
	        } else {
	            $element.find('.js-installment-total-price').text(LS.currency.display_short + (price * amount).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
	        }
	    };

	    var $payments_module = jQueryNuvem(variant.element + ' .js-product-payments-container');

	    if (variant.installments_data) {
	        var variant_installments = JSON.parse(variant.installments_data);
	        var max_installments_without_interests = [0,0];
	        var max_installments_with_interests = [0,0];

	        {# Hide all installments rows on payments modal #}
	        jQueryNuvem('.js-payment-provider-installments-row').hide();

	        for (let payment_method in variant_installments) {

	            {# Identifies the minimum installment value #}
	            var paymentMethodId = '#installment_' + payment_method.replace(" ", "_") + '_1';
	            var minimumInstallmentValue = jQueryNuvem(paymentMethodId).closest('.js-info-payment-method').attr("data-minimum-installment-value");

                let installments = variant_installments[payment_method];
	            for (let number_of_installment in installments) {
                    let installment_data = installments[number_of_installment];
	                max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
	                max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
	                var installment_container_selector = '#installment_' + payment_method.replace(" ", "_") + '_' + number_of_installment;

	                {# Shows installments rows on payments modal according to the minimum value #}
	                if(minimumInstallmentValue <= installment_data.installment_value) {
	                    jQueryNuvem(installment_container_selector).show();
	                }

	                if(!parent.hasClass("js-quickshop-container")){
	                    installment_helper(jQueryNuvem(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
	                }
	            }
	        }
	        var $installments_container = jQueryNuvem(variant.element + ' .js-max-installments-container .js-max-installments');
	        var $installments_modal_link = jQueryNuvem(variant.element + ' #btn-installments');
	        var $installmens_card_icon = jQueryNuvem(variant.element + ' .js-installments-credit-card-icon');

	        {% if product.has_direct_payment_only %}
	        var installments_to_use = max_installments_without_interests[0] >= 1 ? max_installments_without_interests : max_installments_with_interests;

	        if(installments_to_use[0] <= 0 ) {
	        {%  else %}
	        var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

	        if(installments_to_use[0] <= 1 ) {
	        {% endif %}
	            $installments_container.hide();
	            $installments_modal_link.hide();
	            $payments_module.hide();
	            $installmens_card_icon.hide();
	        } else {
	            $installments_container.show();
	            $installments_modal_link.show();
	            $payments_module.show();
	            $installmens_card_icon.show();
	            installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
	        }
	    }

	    if (variant.contact) {
	        $payments_module.hide();
	    }

	    if(!parent.hasClass("js-quickshop-container")){
            jQueryNuvem('#installments-modal .js-installments-one-payment').text(variant.price_short).attr("data-value", variant.price_number);
		}

	    if (variant.price_short){
	        parent.find('.js-price-display').text(variant.price_short).show();
	        parent.find('.js-price-display').attr("content", variant.price_number).data('productPrice', variant.price_number_raw);
            
            parent.find('.js-price-without-taxes').text(variant.price_without_taxes);
            parent.find('.js-price-without-taxes-container').show();
	    } else {
	        parent.find('.js-price-display, .js-price-without-taxes-container').hide();
	    }

	    if ((variant.compare_at_price_short) && !(parent.find(".js-price-display").css("display") == "none")) {
	        parent.find('.js-compare-price-display').text(variant.compare_at_price_short).show();

            if(variant.compare_at_price_number > variant.price_number){
                const saved_compare_price_money = variant.compare_at_price_number - variant.price_number;
                parent.find('.js-offer-saved-money').text(LS.formatToCurrency(saved_compare_price_money));
                parent.find(".js-saved-money-message").show();
            }else {
                parent.find(".js-saved-money-message").hide();
            }
	    } else {
	        parent.find('.js-compare-price-display, .js-saved-money-message').hide();
	    }

	    var button = parent.find('.js-addtocart');
	    button.removeClass('cart').removeClass('contact').removeClass('nostock');
	    var $product_shipping_calculator = parent.find("#product-shipping-container");

        {# Update CTA wording and status #}

	    {% if not store.is_catalog %}
	    if (!variant.available){
	        button.val('{{ "Sin stock" | translate }}');
	        button.addClass('nostock');
	        button.attr('disabled', 'disabled');
	        $product_shipping_calculator.hide();
	    } else if (variant.contact) {
	        button.val('{{ "Consultar precio" | translate }}');
	        button.addClass('contact');
	        button.removeAttr('disabled');
	        $product_shipping_calculator.hide();
	    } else {
	        button.val({% if template == 'product' %}'Adicionar à sacola'{% else %}'{{ "Agregar al carrito" | translate }}'{% endif %});
	        button.addClass('cart');
	        button.removeAttr('disabled');
	        $product_shipping_calculator.show();
	    }

	    {% endif %}

        {# Sync Figma PDP price cards with the selected variant. #}
        {% if template == 'product' %}
            const base_price = Number(jQueryNuvem("#price_display").attr("content"));
            refreshInstallmentv2(base_price);

            {% if settings.last_product and product.variations %}
                if(variant.stock == 1) {
                    jQueryNuvem('.js-last-product').show();
                } else {
                    jQueryNuvem('.js-last-product').hide();
                }
                {% if settings.latest_products_available %}
                    const stock_limit = jQueryNuvem(".js-latest-products-available").attr("data-limit");
                    if(variant.stock < stock_limit && variant.stock != null && variant.stock != 1 && variant.stock != 0) {
                        jQueryNuvem('.js-latest-products-available').show();
                    } else {
                        jQueryNuvem('.js-latest-products-available').hide();
                    }
                {% endif %}
            {% endif %}
        {% endif %}


        {# Update shipping on variant change #}

        LS.updateShippingProduct();

        zipcode_on_changevariant = jQueryNuvem("#product-shipping-container .js-shipping-input").val();
        jQueryNuvem("#product-shipping-container .js-shipping-calculator-current-zip").text(zipcode_on_changevariant);

        {% if cart.free_shipping.min_price_free_shipping.min_price %}
            {# Updates free shipping bar #}

            LS.freeShippingProgress(true, parent);

        {% endif %}

        LS.subscriptionChangeVariant(variant);
	}

	{# /* // Trigger change variant */ #}

    jQueryNuvem(document).on("change", ".js-variation-option", function(e) {
        var $parent = jQueryNuvem(this).closest(".js-product-variants");
        var $variants_group = jQueryNuvem(this).closest(".js-product-variants-group");
        var quick_id = jQueryNuvem(this).closest(".js-quickshop-container").attr("id");
        if($parent.hasClass("js-product-quickshop-variants")){
            {% if template == 'home' %}
                LS.changeVariant(changeVariant, '.js-swiper-slide-visible #' + quick_id);
            {% else %}
                LS.changeVariant(changeVariant, '#' + quick_id);
            {% endif %}

            {% if settings.product_color_variants %}
                {# Match selected color variant with selected quickshop variant #}
                if(($variants_group).hasClass("js-color-variants-container")){
                    var selected_option_id = jQueryNuvem(this).find("option").filter((el) => el.selected).val();
                    jQueryNuvem('#' + quick_id).find('.js-color-variant').removeClass("selected");
                    jQueryNuvem('#' + quick_id).find('.js-color-variant[data-option="'+selected_option_id+'"]').addClass("selected");
                }
            {% endif %}
        } else {
            LS.changeVariant(changeVariant, '#single-product');
        }

        {# Offer and discount labels update #}

        var $this_product_container = jQueryNuvem(this).closest(".js-product-container");
        var $this_compare_price = $this_product_container.find(".js-compare-price-display");
        var $this_price = $this_product_container.find(".js-price-display");
        var $installment_container = $this_product_container.find(".js-product-payments-container");
        var $installment_text = $this_product_container.find(".js-max-installments-container");
        var $this_add_to_cart =  $this_product_container.find(".js-prod-submit-form");

        // Get the current product discount percentage value
        var current_percentage_value = $this_product_container.find(".js-offer-percentage");

        // Get the current product price and promotional price
        var compare_price_value = $this_compare_price.html();
        var price_value = $this_price.html();

        // Calculate new discount percentage based on difference between filtered old and new prices
        const percentageDifference = window.moneyDifferenceCalculator.percentageDifferenceFromString(compare_price_value, price_value);
        var offerPct = Number(percentageDifference) || 0;
        if(offerPct > 0){
            $this_product_container.find(".js-offer-percentage").text(percentageDifference);
            $this_product_container.find(".js-offer-label").removeClass("d-none yamuna-offer-zero").css("display" , "flex");
        }

        if ($this_compare_price.css("display") == "none" || offerPct <= 0) {
            $this_product_container.find(".js-offer-label").addClass("d-none yamuna-offer-zero").hide();
        }
        if ($this_add_to_cart.hasClass("nostock")) {
            var $stockLabel = $this_product_container.find(".js-stock-label");
            if (!$stockLabel.text().trim()) {
                $stockLabel.text($stockLabel.data('label'));
            }
            $stockLabel.show();
        }
        else {
            $this_product_container.find(".js-stock-label").hide();
	    }
	    if ($this_price.css('display') == 'none'){
	        $installment_container.hide();
	        $installment_text.hide();
	    }else{
	        $installment_text.show();
	    }
	});

	{# Tipo pills (Moído / Grão) keep the native select in sync. #}
	jQueryNuvem(document).on("click", ".js-yamuna-tipo-option", function (e) {
		e.preventDefault();
		var $btn = jQueryNuvem(this);
		var optionId = String($btn.attr("data-option"));
		var optionName = $btn.attr("data-name");
		var $group = $btn.closest(".js-product-variants-group");
		$group.find(".js-yamuna-tipo-option").removeClass("is-selected").attr("aria-pressed", "false");
		$btn.addClass("is-selected").attr("aria-pressed", "true");
		$group.find(".js-insta-variation-label").text(optionName);
		var $option = $group.find(".js-variation-option option").filter(function (el) {
			return String(el.value) === optionId;
		});
		if ($option.length) {
			$option.prop("selected", true);
			$option.closest("select").trigger("change");
		}
	});

	{# /* // Submit to contact */ #}

	{# Submit to contact form when product has no price #}

    jQueryNuvem(".js-product-form").on("submit", function (e) {
	    var button = jQueryNuvem(e.currentTarget).find('[type="submit"]');
	    if ((button.hasClass('contact')) || (button.hasClass('catalog'))) {
	        e.preventDefault();
	        button.attr('disabled', 'disabled');
	        var product_id = jQueryNuvem(e.currentTarget).find("input[name='add_to_cart']").val();
	        window.location = "{{ store.contact_url | escape('js') }}?product=" + product_id;
	    } else if (button.hasClass('cart') || button.hasClass('js-addtocart')) {
	        {# Safety net: never navigate to /comprar/; AJAX click handler owns the UX. #}
	        e.preventDefault();
	    }
	});

	{% if template == 'product' %}

        {% set native_videos_enabled = false %}
        {% if product.hasNativeVideos %}
            {% set native_videos_enabled = true %}
        {% endif %}
       
        {% if native_videos_enabled %}
            var stream_videos = [];
            function initAllVideos(){
                jQueryNuvem(".js-external-video-iframe").each(function($el){
                    const player = Stream(document.getElementById($el.id));
                    stream_videos.push(player);
                });
            }
            initAllVideos();
            function pauseAllVideos(){
                stream_videos.forEach(function(player){
                    player.pause();
                });
            }
            jQueryNuvem(".js-play-native-button").on("click", function($el){
                pauseAllVideos();
                const link = jQueryNuvem(this);
                const id = jQueryNuvem(this).data("video_uid");
                const iframe = jQueryNuvem("#video-" + id);
                const image = jQueryNuvem("img[data-video_uid='" + id + "']");
                const parent = jQueryNuvem(this).parent(".embed-responsive-16by9");
                const container = jQueryNuvem("div[data-video_uid='" + id + "']");
                iframe.attr("src", iframe.data("src"));
                container.show();
                image.hide();
                link.hide().removeClass("d-md-block");
                parent.removeClass("embed-responsive-16by9");

                let allowAttr = iframe.attr("allow");

                if (allowAttr) {
                    allowAttr = allowAttr
                        .split(";")
                        .map(item => item.trim())
                        .filter(item => item && item !== "autoplay")
                        .join("; ");

                    iframe.attr("allow", allowAttr + ";");
                }

            });
        {% endif %}

        {% set has_multiple_slides = product.media_count > 1 or video_url %}

	    {# /* // Product slider */ #}

            var width = window.innerWidth;
            if (width > 767 && width < 1360) {
                var speedVal = 0;
                var spaceBetweenVal = 12;
                var slidesPerViewVal = 2;
            } else {
                var speedVal = 300;
                var spaceBetweenVal = 0;
                var slidesPerViewVal = 1;
            }

            var productSwiper = null;
            createSwiper(
                '.js-swiper-product', {
                    lazy: true,
                    speed: speedVal,
                    {% if has_multiple_slides %}
                    slidesPerView: slidesPerViewVal,
                    centeredSlides: false,
                    spaceBetween: spaceBetweenVal,
                    breakpoints: {
                        0: {
                            slidesPerView: 1,
                            spaceBetween: 0,
                            speed: 300,
                        },
                        768: {
                            slidesPerView: 2,
                            spaceBetween: 12,
                            speed: 0,
                        },
                        1360: {
                            slidesPerView: 1,
                            spaceBetween: 0,
                            speed: 0,
                        },
                    },
                    {% else %}
                    slidesPerView: 1,
                    spaceBetween: 0,
                    {% endif %}
                    pagination: {
                        el: '.js-swiper-product-pagination',
                        type: 'bullets',
                        clickable: true,
                    },
                    navigation: {
                        nextEl: '.js-swiper-product-next',
                        prevEl: '.js-swiper-product-prev',
                    },
                    on: {
                        init: function () {
                            jQueryNuvem(".js-product-slider-placeholder").hide();
                            jQueryNuvem(".js-swiper-product").css("visibility", "visible").css("height", "auto");
                            {% if has_multiple_slides %}
                            /* Tablet: 2 images when gallery has 2+; single stays full-width. */
                            if (window.innerWidth >= 768 && window.innerWidth < 1360) {
                                this.params.slidesPerView = 2;
                                this.params.spaceBetween = 12;
                                this.update();
                            }
                            {% endif %}
                            {% if product.video_url %}
                                if (window.innerWidth < 768) {
                                    productSwiperHeight = jQueryNuvem(".js-swiper-product").height();
                                    jQueryNuvem(".js-product-video-slide").height(productSwiperHeight);
                                }
                            {% endif %}
                        },
                        resize: function () {
                            {% if has_multiple_slides %}
                            if (window.innerWidth >= 768 && window.innerWidth < 1360) {
                                this.params.slidesPerView = 2;
                                this.params.spaceBetween = 12;
                            } else if (window.innerWidth < 768) {
                                this.params.slidesPerView = 1;
                                this.params.spaceBetween = 0;
                            }
                            {% else %}
                            this.params.slidesPerView = 1;
                            this.params.spaceBetween = 0;
                            {% endif %}
                            this.update();
                        },
                        {% if product.video_url %}
                            slideChangeTransitionEnd: function () {
                                const $parent = jQueryNuvem(this.el).closest(".js-product-detail");
                                const $labelsFloatingGroup = $parent.find(".js-labels-floating-group");
                                if(jQueryNuvem(".js-product-video-slide").hasClass("swiper-slide-active")){
                                    $labelsFloatingGroup.fadeOut(100);
                                }else{
                                    $labelsFloatingGroup.fadeIn(100);
                                }
                                jQueryNuvem('.js-video').show();
                                jQueryNuvem('.js-video-iframe').hide().find("iframe").remove();
                            },
                        {% endif %}
                        {% if native_videos_enabled %}
                            slideChange : function () {
                                pauseAllVideos();
                            },
                        {% endif %}
                    },
                },
                function(swiperInstance) {
                    productSwiper = swiperInstance;
                }
            );

            {% if store.useNativeJsLibraries() %}

                Fancybox.bind('[data-fancybox="product-gallery"], [data-fancybox="product-gallery-desktop"]', {
                    Toolbar: { display: ['counter', 'close'] },
                    Thumbs: { autoStart: false },
                    dragToClose: true,
                    on: {
                        shouldClose: (fancybox, slide) => {
                            // Update position of the slider
                            if (productSwiper && fancybox.getSlide()) {
                                productSwiper.slideTo( fancybox.getSlide().index, 0 );
                            }
                            jQueryNuvem(".js-product-thumb").removeClass("selected");

                            var $product_thumbnail = jQueryNuvem(".js-product-thumb[data-thumb-loop='"+fancybox.getSlide().index+"']").addClass("selected");
                            if($product_thumbnail.length){
                                $product_thumbnail.addClass("selected");
                            }else{
                                jQueryNuvem(".js-product-thumb[data-thumb-loop='4']").addClass("selected");
                            }
                        },
                        {% if native_videos_enabled %}
                        "Carousel.change": (fancybox) => {
                            pauseAllVideos();
                        },
                        {% endif %}
                    },
                });

            {% else %}

                $().fancybox({
                    selector : '[data-fancybox="product-gallery"], [data-fancybox="product-gallery-desktop"]',
                    toolbar  : true,
                    buttons: ['close'],
                    smallBtn : false,
                    beforeClose : function(instance) {
                        // Update position of the slider
                        productSwiper.slideTo( instance.currIndex, 0 );
                        jQueryNuvem(".js-product-thumb").removeClass("selected");

                        var $product_thumbnail = jQueryNuvem(".js-product-thumb[data-thumb-loop='"+instance.currIndex+"']").addClass("selected");
                        if($product_thumbnail.length){
                            $product_thumbnail.addClass("selected");
                        }else{
                            jQueryNuvem(".js-product-thumb[data-thumb-loop='4']").addClass("selected");
                        }
                    },
                });

            {% endif %}

	    {% if has_multiple_slides %}
	        LS.registerOnChangeVariant(function(variant){
	            var liImage = jQueryNuvem('.js-swiper-product').find("[data-image='"+variant.image+"']");
	            var selectedPosition = liImage.data('imagePosition');
                var slideToGo = parseInt(selectedPosition);
                productSwiper.slideTo(slideToGo);
                jQueryNuvem(".js-product-slide-img").removeClass("js-active-variant");
                liImage.find(".js-product-slide-img").addClass("js-active-variant");
	        });

            jQueryNuvem(".js-product-thumb").on("click", function(e){
                e.preventDefault();
                jQueryNuvem(".js-product-thumb").removeClass("selected");
                jQueryNuvem(e.currentTarget).addClass("selected");
                var thumbLoop = jQueryNuvem(e.currentTarget).data("thumbLoop");
                var slideToGo = parseInt(thumbLoop);
                productSwiper.slideTo(slideToGo);
                
                if(jQueryNuvem(e.currentTarget).hasClass("js-product-thumb-modal")){
                    var video_id = jQueryNuvem(e.currentTarget).data("video_id");
                    if(video_id){
                        jQueryNuvem('#trigger-video-modal-' + video_id).trigger('click');
                        return;
                    }
                    jQueryNuvem('.js-swiper-product').find("[data-image-position='"+slideToGo+"'] .js-product-slide-link").trigger('click');
                }
            });
	    {% endif %}

        {# /* // Pinterest sharing */ #}

        jQueryNuvem('.js-pinterest-share').on("click", function(e){
            e.preventDefault();
            jQueryNuvem(".pinterest-hidden a").get()[0].click();
        });

        {# Product show description and relocate on mobile #}

        if (window.innerWidth > 767) {
            jQueryNuvem("#product-description").show();
        }else{
            jQueryNuvem("#product-description").insertAfter("#product_form").show();
        }

	{% endif %}

    {# Product quantitiy #}

    jQueryNuvem('.js-quantity .js-quantity-up').on('click', function(e) {
        $quantity_input = jQueryNuvem(e.currentTarget).closest(".js-quantity").find(".js-quantity-input");
        $quantity_input.val( parseInt($quantity_input.val(), 10) + 1);
    });

    jQueryNuvem('.js-quantity .js-quantity-down').on('click', function(e) {
        $quantity_input = jQueryNuvem(e.currentTarget).closest(".js-quantity").find(".js-quantity-input");
        quantity_input_val = $quantity_input.val();
        if (quantity_input_val>1) {
            $quantity_input.val( parseInt($quantity_input.val(), 10) - 1);
        }
    });


	{#/*============================================================================
	  #Cart
	==============================================================================*/ #}

    {# /* // Free shipping bar */ #}

    {% if cart.free_shipping.min_price_free_shipping.min_price %}

        {# Updates free progress on page load #}

        LS.freeShippingProgress(true);

    {% endif %}

    {# /* // Position of cart page summary */ #}

    var head_height = jQueryNuvem(".js-head-main").outerHeight();

    if (window.innerWidth > 768) {
        {% if settings.head_fix %}
            jQueryNuvem("#cart-sticky-summary").css("top" , (head_height + 10).toString() + 'px');
        {% else %}
            jQueryNuvem("#cart-sticky-summary").css("top" , "10px");
        {% endif %}
    }


    {# /* // Add to cart */ #}

   function getQuickShopImgSrc(element){
        const image = jQueryNuvem(element).closest('.js-quickshop-container').find('img');
        return String(image.attr('srcset'));
    }

    {# jQueryNuvem has no .is(); older handlers and plugins still call it. #}
    if (window.jQueryNuvem && jQueryNuvem.fn && typeof jQueryNuvem.fn.is !== 'function') {
        jQueryNuvem.fn.is = function(selector) {
            if (!this.length || !selector || !this[0] || typeof this[0].matches !== 'function') {
                return false;
            }
            try {
                return this[0].matches(selector);
            } catch (err) {
                return false;
            }
        };
    }

    {# Capture-phase AJAX add-to-cart for home spots AND PDP CTA.
       Mirrors home behavior and blocks native submit to /comprar/. #}
    document.addEventListener('click', function(event) {
        var button = event.target.closest('.yamuna-home-spot-buy-one, .yamuna-home-spot-buy-three, .yamuna-pdp-spot-buy-one, .yamuna-pdp-spot-buy-three, .yamuna-plp-buy-one, .yamuna-plp-buy-three');

        if (!button) {
            button = event.target.closest('#product_form .js-addtocart.js-prod-submit-form, .yamuna-pdp-summary .js-addtocart.js-prod-submit-form');
            if (button && (
                button.classList.contains('js-addtocart-placeholder')
                || button.classList.contains('contact')
                || button.classList.contains('catalog')
                || button.classList.contains('nostock')
            )) {
                button = null;
            }
        }

        if (!button || button.disabled || !window.LS || !LS.addToCartEnhanced) {
            return;
        }

        event.preventDefault();
        event.stopImmediatePropagation();

        var form = button.closest('form');
        if (!form) {
            return;
        }

        var spotQuantityInput = form.querySelector('.js-home-spot-add-quantity, .js-pdp-spot-add-quantity');
        if (spotQuantityInput && button.getAttribute('data-quantity')) {
            spotQuantityInput.value = button.getAttribute('data-quantity') || '1';
        }

        var toastQuantityInput = form.querySelector('.js-quantity-input, .js-home-spot-add-quantity, .js-pdp-spot-add-quantity');
        var toastQuantity = parseInt(
            button.getAttribute('data-quantity') || (toastQuantityInput && toastQuantityInput.value) || '1',
            10
        ) || 1;

        var originalLabel = button.tagName === 'INPUT' ? button.value : (button.textContent || '').trim();
        var originalHtml = button.tagName === 'INPUT' ? '' : button.innerHTML;
        button.disabled = true;

        LS.addToCartEnhanced(
            jQueryNuvem(form),
            originalLabel || '{{ "Comprar" | translate }}',
            '{{ "Agregando..." | translate }}',
            '{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito." | translate }}',
            {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }},
            function() {
                button.disabled = false;
                if (button.tagName === 'INPUT' && originalLabel) {
                    button.value = originalLabel;
                } else if (originalHtml) {
                    button.innerHTML = originalHtml;
                }
                if (window.yamunaShowCartToast) {
                    window.yamunaShowCartToast(toastQuantity);
                }
                {# Cenário 044: open minicart via navbar sacola trigger after successful add. #}
                setTimeout(function() {
                    if (window.yamunaAutoOpenCart) {
                        window.yamunaAutoOpenCart();
                    }
                }, 50);
            },
            function() {
                button.disabled = false;
                if (button.tagName === 'INPUT' && originalLabel) {
                    button.value = originalLabel;
                } else if (originalHtml) {
                    button.innerHTML = originalHtml;
                }
            }
        );
    }, true);

    jQueryNuvem(document).on("click", ".js-addtocart:not(.js-addtocart-placeholder)", function (e) {
    
        {# Button variables for transitions on add to cart #}

        var $productContainer = jQueryNuvem(this).closest('.js-product-container');
        var $productVariants = $productContainer.find(".js-variation-option");
        var $productButton = $productContainer.find(".js-addtocart:not(.js-addtocart-placeholder)");
        var $productForm = jQueryNuvem(this).closest("form");
        var $clickedAddButton = jQueryNuvem(this);
        var isPlpButton = $clickedAddButton.hasClass('yamuna-plp-buy-one')
            || $clickedAddButton.hasClass('yamuna-plp-buy-three');
        var isHomeSpotButton = $clickedAddButton.hasClass('yamuna-home-spot-buy-one')
            || $clickedAddButton.hasClass('yamuna-home-spot-buy-three')
            || $clickedAddButton.hasClass('yamuna-pdp-spot-buy-one')
            || $clickedAddButton.hasClass('yamuna-pdp-spot-buy-three');
        var clickedButtonTop = isHomeSpotButton ? $clickedAddButton.position().top : 0;
        var clickedButtonHeight = isHomeSpotButton ? $clickedAddButton.outerHeight() : 0;
        var productFormHeight = isHomeSpotButton ? $productForm.outerHeight() : 0;
        var requestedQuantity = jQueryNuvem(this).data('quantity') || 1;
        $productContainer.find('.js-home-spot-add-quantity, .js-pdp-spot-add-quantity').val(requestedQuantity);
        var $productButtonPlaceholder = $productContainer.find(".js-addtocart-placeholder");
        var $productButtonText = $productButtonPlaceholder.find(".js-addtocart-text");
        var $productButtonAdding = $productButtonPlaceholder.find(".js-addtocart-adding");
        var $productButtonSuccess = $productButtonPlaceholder.find(".js-addtocart-success");

        {# Define if event comes from quickshop, product page or cross selling #}

        var isQuickShop = $productContainer.hasClass('js-quickshop-container');
        var isCrossSelling = $productContainer.hasClass('js-cross-selling-container');

        {# Added item information for notification #}

        if (isCrossSelling) {
            var imageSrc = $productContainer.find('.js-cross-selling-product-image').attr('src');
            var quantity = $productContainer.data('quantity')
            var name = $productContainer.find('.js-cross-selling-product-name').text();
            var price = $productContainer.find('.js-cross-selling-promo-price').text();
            var addedToCartCopy = $productContainer.data('add-to-cart-translation');
        } else if (!isQuickShop) {
            if(jQueryNuvem(".js-product-slide-img.js-active-variant").length) {
                var $activeVariantImg = $productContainer.find('.js-product-slide-img.js-active-variant');
                var imageSrc = $activeVariantImg.attr('srcset') || $activeVariantImg.data('srcset');
            } else {
                var $defaultImg = $productContainer.find('.js-product-slide-img');
                var imageSrc = $defaultImg.attr('srcset') || $defaultImg.data('srcset');
            }
            
            imageSrc = imageSrc ? imageSrc.split(' ')[0] : '';
            var quantity = $productContainer.find('.js-quantity-input').val();
            var name = $productContainer.find('.js-product-name').text();
            var price = $productContainer.find('.js-price-display').text();
            var addedToCartCopy = {% if template == 'product' %}"Adicionar à sacola"{% else %}"{{ 'Agregar al carrito' | translate }}"{% endif %};
        } else {
            var imageSrc = getQuickShopImgSrc(this);
            var quantity = requestedQuantity;
            var name = $productContainer.find('.js-item-name').text();
            var price = $productContainer.find('.js-price-display').text().trim();
            var addedToCartCopy = "{{ 'Comprar' | translate }}";
            if ($productContainer.hasClass("js-quickshop-has-variants")) {
                var addedToCartCopy = "{{ 'Agregar al carrito' | translate }}";
            }else{
                var addedToCartCopy = "{{ 'Comprar' | translate }}";
            }
        }

        if (!jQueryNuvem(this).hasClass('contact') && !jQueryNuvem(this).hasClass('catalog')) {

            {# Always AJAX add-to-cart (same as home). Never navigate to /comprar/. #}
            e.preventDefault();

            {# Hide real button and show button placeholder during event #}

            if (!isPlpButton) {
                $productButtonPlaceholder.insertAfter(jQueryNuvem(this));
                if (isHomeSpotButton) {
                    $productForm.css({
                        position: 'relative',
                        minHeight: productFormHeight + 'px'
                    });
                    $productButtonPlaceholder.css({
                        display: 'flex',
                        position: 'absolute',
                        top: clickedButtonTop + 'px',
                        left: 0,
                        width: '100%',
                        height: clickedButtonHeight + 'px',
                        minHeight: clickedButtonHeight + 'px',
                        margin: 0
                    });
                }
                $productButton.hide();
                if (!isHomeSpotButton) {
                    $productButtonPlaceholder.css('display' , 'inline-block');
                }
                $productButtonText.fadeOut();
                $productButtonAdding.addClass("active");
            }

            {# Keep original CTA label to restore after AJAX (LS sets "Incluindo..."). #}
            var originalAddLabel = $productButton.attr('data-yamuna-original-label');
            if (!originalAddLabel) {
                originalAddLabel = ($productButton.val() || $productButton.text() || 'Adicionar à sacola').toString().trim();
                $productButton.attr('data-yamuna-original-label', originalAddLabel);
            }

            {# Restore button state in case of error #}

            function restore_button_initial_state(){
                $productButtonAdding.removeClass("active");
                $productButtonText.fadeIn();
                $productButtonPlaceholder.removeAttr("style").hide();
                if (isHomeSpotButton) {
                    $productForm.css({ position: '', minHeight: '' });
                }
                if ($productButton[0] && $productButton[0].tagName === 'INPUT') {
                    $productButton.val(originalAddLabel);
                }
                $productButton.prop('disabled', false).removeAttr('disabled').show();
            }

            {# Do not call LS.subscriptionSubmit here: it can natively submit the
               product form and redirect to /comprar/. Subscription fields still
               go through LS.addToCartEnhanced via the form (same as home CTAs). #}

            {% if settings.ajax_cart or true %}

                var callback_add_to_cart = function(html_notification_related_products, html_notification_cross_selling) {

                    if (window.yamunaShowCartToast) {
                        window.yamunaShowCartToast(quantity || requestedQuantity || 1);
                    }

                    {# Animate cart amount #}

                    jQueryNuvem(".js-cart-widget-amount").addClass("swing");

                    setTimeout(function(){
                        jQueryNuvem(".js-cart-widget-amount").removeClass("swing");
                    },6000);

                    {# Fill notification info #}

                    jQueryNuvem('.js-cart-notification-item-img').attr('srcset', imageSrc);
                    jQueryNuvem('.js-cart-notification-item-name').text(name);
                    jQueryNuvem('.js-cart-notification-item-quantity').text(quantity);
                    jQueryNuvem('.js-cart-notification-item-price').text(price);

                    LS.updateNotificationDiscountLabel($productContainer[0]);

                    if($productVariants.length){
                        var output = [];

                        $productVariants.each( function(el){
                            var variants = jQueryNuvem(el);
                            output.push(variants.val());
                        });
                        jQueryNuvem(".js-cart-notification-item-variant-container").show();
                        jQueryNuvem(".js-cart-notification-item-variant").text(output.join(', '))
                    }else{
                        jQueryNuvem(".js-cart-notification-item-variant-container").hide();
                    }

                    {# Set products amount wording visibility #}

                    var cartItemsAmount = jQueryNuvem(".js-cart-widget-amount").text();

                    if(cartItemsAmount > 1){
                        jQueryNuvem(".js-cart-counts-plural").show();
                        jQueryNuvem(".js-cart-counts-singular").hide();
                    }else{
                        jQueryNuvem(".js-cart-counts-singular").show();
                        jQueryNuvem(".js-cart-counts-plural").hide();
                    }

                    {# Show button placeholder with transitions #}

                    $productButtonAdding.removeClass("active");
                    $productButtonSuccess.addClass("active");
                    setTimeout(function(){
                        $productButtonSuccess.removeClass("active");
                        $productButtonText.fadeIn();
                    },2000);
                    setTimeout(function(){
                        $productButtonPlaceholder.removeAttr("style").hide();
                        if (isHomeSpotButton) {
                            $productForm.css({ position: '', minHeight: '' });
                        }
                        if ($productButton[0] && $productButton[0].tagName === 'INPUT') {
                            $productButton.val(originalAddLabel);
                        }
                        $productButton.prop('disabled', false).removeAttr('disabled').show();
                    },3000);

                    $productContainer.find(".js-added-to-cart-product-message").slideDown();

                    let notificationWithRelatedProducts = false;

                    {% if settings.add_to_cart_recommendations %}

                        {# Show added to cart product related products #}

                        function recommendProductsOnAddToCart(){
                            jQueryNuvem('.js-related-products-notification-container').html("");
                            modalOpen('#related-products-notification');
                            jQueryNuvem('.js-related-products-notification-container').html(html_notification_related_products).show();

                            {# Recommendations swiper #}

                            // Set loop for recommended products

                            function calculateRelatedNotificationLoopVal(sectionSelector) {
                                let productsAmount = jQueryNuvem(sectionSelector).attr("data-related-amount");
                                let loopVal = false;
                                const applyLoop = productsAmount > 3;

                                if (applyLoop) {
                                    loopVal = true;
                                }

                                return loopVal;
                            }

                            let cartRelatedLoopVal = calculateRelatedNotificationLoopVal(".js-related-products-notification");

                            // Create new swiper on add to cart

                            createSwiper('.js-swiper-related-products-notification', {
                                lazy: true,
                                loop: cartRelatedLoopVal,
                                watchOverflow: true,
                                threshold: 5,
                                watchSlideProgress: true,
                                watchSlidesVisibility: true,
                                spaceBetween: 15,
                                slideVisibleClass: 'js-swiper-slide-visible',
                                slidesPerView: 2.75,
                                navigation: {
                                    nextEl: '.js-swiper-related-products-notification-next',
                                    prevEl: '.js-swiper-related-products-notification-prev',
                                },
                                breakpoints: {
                                    768: {
                                        slidesPerView: 3,
                                    }
                                }
                            });
                        }

                        notificationWithRelatedProducts = html_notification_related_products != null;

                        if(notificationWithRelatedProducts){
                            recommendProductsOnAddToCart();
                        }
                    {% endif %}

                    let shouldShowCrossSellingModal = html_notification_cross_selling != null;

                    {# Cenário 044: recommendations must not prevent the minicart from opening.
                       Cross-selling remains the only modal that takes precedence. #}
                    if(!shouldShowCrossSellingModal){
                        setTimeout(function() {
                            if (window.yamunaAutoOpenCart) {
                                window.yamunaAutoOpenCart();
                            } else if (!jQueryNuvem('#modal-cart').hasClass('modal-show')) {
                                modalOpen('#modal-cart', 'openFullScreenWithoutClick');
                            }
                        }, 50);
                    }

                    {# Display cross-selling promotion modal #}

                    if (shouldShowCrossSellingModal) {
                        jQueryNuvem('.js-cross-selling-modal-body').html("");
                        modalOpen('#js-cross-selling-modal');
                        jQueryNuvem('.js-cross-selling-modal-body').html(html_notification_cross_selling).show();
                    }

                    {# Change prices on cross-selling promotion modal #}

                    const crossSellingContainer = document.querySelector('.js-cross-selling-container');

                    if (crossSellingContainer) {
                        LS.fillCrossSelling(crossSellingContainer);
                    }

                    {# Yamuna: never copy/save CEP into the minicart on add-to-cart.
                       User must type CEP + Buscar every time (no cookie / no auto-calc). #}
                    try { cookieService.remove('calculator_zipcode'); } catch (err) {}
                    jQueryNuvem("#modal-cart #cart-shipping-container .js-shipping-input").val('');
                    jQueryNuvem("#modal-cart .js-shipping-calculator-current-zip").text('');
                    jQueryNuvem("#modal-cart .js-shipping-calculator-response").empty().hide();
                    jQueryNuvem("#modal-cart .js-shipping-calculator-spinner").hide();
                    jQueryNuvem("#modal-cart .js-shipping-calculator-head").addClass("with-form").removeClass("with-zip");
                    jQueryNuvem("#modal-cart").removeClass("yamuna-shipping-searched");

                    {# Update free shipping wording #}

                    jQueryNuvem(".js-fs-add-this-product").hide();
                    jQueryNuvem(".js-fs-add-one-more").show();

                    {# Automatically close the cross-selling modal by triggering its close button #}

                    if (isCrossSelling) {
                        jQueryNuvem('#js-cross-selling-modal .js-modal-close').trigger('click');
                    }
                }
                var callback_error = function(){
                    {# Restore real button visibility in case of error #}

                    restore_button_initial_state();
                }
                $prod_form = jQueryNuvem(this).closest("form");
                LS.addToCartEnhanced(
                    $prod_form,
                    addedToCartCopy,
                    '{{ "Agregando..." | translate }}',
                    '{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito." | translate }}',
                    {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }},
                        callback_add_to_cart,
                        callback_error
                );
            {% endif %}
        }
    });


    {# /* // Cart quantitiy changes */ #}

    jQueryNuvem(document).on("keypress", ".js-cart-quantity-input", function (e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });

    jQueryNuvem(document).on("focusout", ".js-cart-quantity-input", function (e) {
        var itemID = jQueryNuvem(this).attr("data-item-id");
        var itemVAL = jQueryNuvem(this).val();
        if (itemVAL == 0) {
            var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
            if (r == true) {
                LS.removeItem(itemID, true);
            } else {
                jQueryNuvem(this).val(1);
            }
        } else {
            LS.changeQuantity(itemID, itemVAL, true);
        }
    });

    {# /* // Empty cart alert */ #}

    jQueryNuvem(".js-trigger-empty-cart-alert").on("click", function (e) {
        e.preventDefault();
        let emptyCartAlert = jQueryNuvem(".js-mobile-nav-empty-cart-alert").fadeIn(100);
        setTimeout(() => emptyCartAlert.fadeOut(500), 1500);
    });

    {# /* // Go to checkout */ #}

    {# Clear cart notification cookie after consumers continues to checkout #}

    jQueryNuvem('form[action="{{ store.cart_url | escape('js') }}"]').on("submit", function() {
        cookieService.remove('first_product_added_successfully');
    });


	{#/*============================================================================
	  #Shipping calculator
	==============================================================================*/ #}

    {# /* // Update calculated cost wording */ #}

    {% set shipping_calculator_enabled = settings.shipping_calculator_cart_page %}

    {% if shipping_calculator_enabled %}
        var $selectedShipping = jQueryNuvem('.js-selected-shipping-method');
        if ($selectedShipping.length) {
            LS.ShippingDiscountRow.apply($selectedShipping[0], { containerSelector: '#cart-shipping-container' });
            jQueryNuvem("#shipping-cost").removeClass('opacity-40');
        }
    {% endif %}

	{# /* // Select and save shipping function */ #}

    selectShippingOption = function(elem, save_option) {
        jQueryNuvem(".js-shipping-method, .js-branch-method").removeClass('js-selected-shipping-method');
        jQueryNuvem(elem).addClass('js-selected-shipping-method');

        {% if shipping_calculator_enabled %}

            LS.ShippingDiscountRow.apply(elem, { containerSelector: '#cart-shipping-container' });
            jQueryNuvem("#shipping-cost").removeClass('opacity-40');

        {% endif %}

        if (save_option) {
            LS.saveCalculatedShipping(true);
        }
        if (jQueryNuvem(elem).hasClass("js-shipping-method-hidden")) {
            {# Toggle other options visibility depending if they are pickup or delivery for cart and product at the same time #}
            if (jQueryNuvem(elem).hasClass("js-pickup-option")) {
                jQueryNuvem(".js-other-pickup-options, .js-show-other-pickup-options .js-shipping-see-less").show();
                jQueryNuvem(".js-show-other-pickup-options .js-shipping-see-more").hide();
            } else {
                jQueryNuvem(".js-other-shipping-options, .js-other-shipping-item, .js-show-more-shipping-options .js-shipping-see-less").show();
                jQueryNuvem(".js-show-more-shipping-options .js-shipping-see-more").hide()
            }
        }
    };

    {# Apply zipcode saved by cookie if there is no zipcode saved on cart from backend #}

    {% if template == 'product' %}
        {# PDP: always start with a fresh CEP form. Clear cookie too so linkedstore-v2
           cannot auto-restore / auto-calculate after our initial reset. #}
        var resetProductShippingCalculator = function () {
            try { cookieService.remove('calculator_zipcode'); } catch (err) {}
            jQueryNuvem('#product-shipping-container .js-shipping-input').val('');
            jQueryNuvem('#product-shipping-container .js-shipping-calculator-response').empty().hide();
            jQueryNuvem('#product-shipping-container .js-shipping-calculator-spinner').hide();
            jQueryNuvem('#product-shipping-container .js-shipping-calculator-head').addClass('with-form').removeClass('with-zip');
            jQueryNuvem('#product-shipping-container .js-shipping-calculator-with-zipcode').removeClass('transition-up-active');
            jQueryNuvem('#product-shipping-container .js-shipping-calculator-form').addClass('transition-up-active');
        };
        resetProductShippingCalculator();
        {# Beat platform auto-calc that runs after DOM ready when cookie was present. #}
        window.setTimeout(resetProductShippingCalculator, 0);
        window.setTimeout(resetProductShippingCalculator, 150);
        window.setTimeout(resetProductShippingCalculator, 500);
        window.setTimeout(resetProductShippingCalculator, 1200);
    {% endif %}

    {# Minicart: never restore CEP from cookie — always empty input + Buscar. #}
    (function resetMinicartCepFromCookie() {
        try { cookieService.remove('calculator_zipcode'); } catch (err) {}
        jQueryNuvem('#modal-cart #cart-shipping-container .js-shipping-input').val('');
        jQueryNuvem('#modal-cart .js-shipping-calculator-current-zip').text('');
        jQueryNuvem('#modal-cart .js-shipping-calculator-response').empty().hide();
        jQueryNuvem('#modal-cart .js-shipping-calculator-spinner').hide();
        jQueryNuvem('#modal-cart .js-shipping-calculator-head').addClass('with-form').removeClass('with-zip');
        jQueryNuvem('#modal-cart .js-shipping-calculator-with-zipcode').removeClass('transition-up-active');
        jQueryNuvem('#modal-cart .js-shipping-calculator-form').addClass('transition-up-active');
        jQueryNuvem('#modal-cart').removeClass('yamuna-shipping-searched');
    })();

    {# Keep form visible (no auto-search). PDP product input may still show empty form. #}
    jQueryNuvem("#product-shipping-container .js-shipping-calculator-form, #modal-cart .js-shipping-calculator-form").addClass("transition-up-active");

    {# Remove shipping suboptions from DOM to avoid duplicated modals #}

    removeShippingSuboptions = function(){
        var shipping_suboptions_id = jQueryNuvem(".js-modal-shipping-suboptions").attr("id");
        jQueryNuvem("#" + shipping_suboptions_id).remove();
        jQueryNuvem('.js-modal-overlay[data-modal-id="#' + shipping_suboptions_id + '"').remove();
    };

    {# /* // Calculate shipping function */ #}


    jQueryNuvem(".js-calculate-shipping").on("click", function (e) {
	    e.preventDefault();

        {# Take the Zip code to all shipping calculators on screen #}
        let shipping_input_val = jQueryNuvem(e.currentTarget).closest(".js-shipping-calculator-form").find(".js-shipping-input").val();

        jQueryNuvem(".js-shipping-input").val(shipping_input_val);

        {# Calculate on page load for both calculators: Product and Cart #}
        {% if template == 'product' %}
             if (!vanillaJS) {
                LS.calculateShippingAjax(
                    jQueryNuvem('#product-shipping-container').find(".js-shipping-input").val(),
                    '{{store.shipping_calculator_url | escape('js')}}',
                    jQueryNuvem("#product-shipping-container").closest(".js-shipping-calculator-container") );
             } else if (typeof LS !== 'undefined' && typeof LS.calculateShippingAjax === 'function') {
                LS.calculateShippingAjax(
                    jQueryNuvem('#product-shipping-container').find(".js-shipping-input").val(),
                    '{{store.shipping_calculator_url | escape('js')}}',
                    jQueryNuvem("#product-shipping-container").closest(".js-shipping-calculator-container") );
             }
        {% endif %}

        if (jQueryNuvem(".js-cart-item").length) {
            LS.calculateShippingAjax(
            jQueryNuvem('#cart-shipping-container').find(".js-shipping-input").val(),
            '{{store.shipping_calculator_url | escape('js')}}',
            jQueryNuvem("#cart-shipping-container").closest(".js-shipping-calculator-container") );
        }

        jQueryNuvem(".js-shipping-calculator-current-zip").html(shipping_input_val);
        removeShippingSuboptions();

        {% if template == 'product' %}
            {# 025: show "Entregas para o CEP" summary after calculate (native with-zip) #}
            jQueryNuvem("#product-shipping-container .js-shipping-calculator-head").addClass("with-zip").removeClass("with-form");
            jQueryNuvem("#product-shipping-container .js-shipping-calculator-with-zipcode").addClass("transition-up-active");
            jQueryNuvem("#product-shipping-container .js-shipping-calculator-form").removeClass("transition-up-active");
        {% endif %}
	});

	{# /* // Calculate shipping by submit */ #}

    jQueryNuvem(".js-shipping-input").on('keydown', function (e) {
	    var key = e.which ? e.which : e.keyCode;
	    var enterKey = 13;
	    if (key === enterKey) {
	        e.preventDefault();
            jQueryNuvem(e.currentTarget).closest(".js-shipping-calculator-form").find(".js-calculate-shipping").trigger('click');
	        if (window.innerWidth < 768) {
                jQueryNuvem(e.currentTarget).trigger('blur');
	        }
	    }
	});

    {# /* // Shipping and branch click */ #}

    jQueryNuvem(document).on("change", ".js-shipping-method, .js-branch-method", function (e) {
        selectShippingOption(this, true);
        jQueryNuvem(".js-shipping-method-unavailable").hide();
    });

    {# /* // Select shipping first option on results */ #}

    jQueryNuvem(document).on('shipping.options.checked', '.js-shipping-method', function (e) {
        let shippingPrice = jQueryNuvem(this).attr("data-price");
        LS.addToTotal(shippingPrice);

        let total = (LS.data.cart.total / 100) + parseFloat(shippingPrice);
        jQueryNuvem(".js-cart-widget-total").html(LS.formatToCurrency(total));

        selectShippingOption(this, false);
    });

    {# /* // Toggle branches link */ #}

    jQueryNuvem(document).on("click", ".js-toggle-branches", function (e) {
        e.preventDefault();
        jQueryNuvem(".js-store-branches-container").slideToggle("fast");
        jQueryNuvem(".js-see-branches, .js-hide-branches").toggle();
    });

    {# /* // Toggle more shipping options */ #}

    jQueryNuvem(document).on("click", ".js-toggle-more-shipping-options", function(e) {
	    e.preventDefault();

        {# Toggle other options depending if they are pickup or delivery for cart and product at the same time #}

        if(jQueryNuvem(this).hasClass("js-show-other-pickup-options")){
            jQueryNuvem(".js-other-pickup-options").slideToggle(600);
            jQueryNuvem(".js-show-other-pickup-options .js-shipping-see-less, .js-show-other-pickup-options .js-shipping-see-more").toggle();
        }else{
            jQueryNuvem(".js-other-shipping-options, .js-other-shipping-item").slideToggle(600);
            jQueryNuvem(".js-show-more-shipping-options .js-shipping-see-less, .js-show-more-shipping-options .js-shipping-see-more").toggle();
        }
	});

    {# /* // Calculate shipping on page load */ #}

    {# Only shipping input has value, cart has saved shipping and there is no branch selected #}

    calculateCartShippingOnLoad = function() {
        {# Yamuna minicart: never auto-search CEP. Always empty input + Buscar. #}
        try { cookieService.remove('calculator_zipcode'); } catch (err) {}
        var $minicartShip = jQueryNuvem("#modal-cart #cart-shipping-container");
        if ($minicartShip.length) {
            jQueryNuvem("#modal-cart #cart-shipping-container .js-shipping-input").val('');
            jQueryNuvem("#modal-cart .js-shipping-calculator-current-zip").text('');
            jQueryNuvem("#modal-cart .js-shipping-calculator-response").empty().hide();
            jQueryNuvem("#modal-cart .js-shipping-calculator-spinner").hide();
            jQueryNuvem("#modal-cart .js-shipping-calculator-head").addClass("with-form").removeClass("with-zip");
            jQueryNuvem("#modal-cart .js-shipping-calculator-with-zipcode").removeClass("transition-up-active");
            jQueryNuvem("#modal-cart .js-shipping-calculator-form").addClass("transition-up-active");
            jQueryNuvem("#modal-cart").removeClass("yamuna-shipping-searched");
            jQueryNuvem("#modal-cart #shipping-cost").hide().text('');
            jQueryNuvem("#modal-cart .js-calculating-shipping-cost").hide();
            jQueryNuvem("#modal-cart .js-shipping-cost-empty").show();
        }
        {# Do NOT call LS.calculateShippingAjax for cart/minicart on load. #}

        if (jQueryNuvem(".js-branch-method").hasClass('js-selected-shipping-method')) {
            {% if store.branches|length > 1 %}
                jQueryNuvem(".js-store-branches-container").slideDown("fast");
                jQueryNuvem(".js-see-branches").hide();
                jQueryNuvem(".js-hide-branches").show();
            {% endif %}
        }
    };

    {% if cart.has_shippable_products %}
        calculateCartShippingOnLoad();
    {% endif %}


    {% if template == 'product' %}
        if (!vanillaJS) {
            {# PDP starts with empty CEP — do not auto-calculate from cookie/prefilled input. #}
        }

        {# /* // Pitch login instead of zipcode helper if is returning customer */ #}

        {% if not customer %}
            if (cookieService.get('returning_customer')) {
                jQueryNuvem('.js-shipping-zipcode-help').remove();
            } else {
                jQueryNuvem('.js-product-quick-login').remove();
            }
        {% endif %}

    {% endif %}

    {# /* // Change CP */ #}

    jQueryNuvem(document).on("click", ".js-shipping-calculator-change-zipcode", function(e) {
        e.preventDefault();
        jQueryNuvem(".js-shipping-calculator-response").fadeOut(100);
        jQueryNuvem(".js-shipping-calculator-head").addClass("with-form").removeClass("with-zip");
        jQueryNuvem(".js-shipping-calculator-with-zipcode").removeClass("transition-up-active");
        jQueryNuvem(".js-shipping-calculator-form").addClass("transition-up-active");
    });

	{# /* // Shipping provinces */ #}

	{% if provinces_json %}
        {# Match province select (LS.swapProvinces) to country form-select styling #}
        function yamunaStyleProvinceSelect() {
            var form = document.querySelector('#address-form, form.yamuna-account-form');
            if (!form) return;
            var province = form.querySelector('#province, select[name="province"]');
            if (!province || province.tagName !== 'SELECT') return;
            province.classList.add('form-select', 'yamuna-login-input');
            var group = province.closest('.form-group');
            if (group && !group.querySelector('.form-select-icon')) {
                var icon = document.createElement('div');
                icon.className = 'form-select-icon';
                icon.innerHTML = '<svg class="icon-inline icon-w-14 icon-lg"><use xlink:href="#chevron-down"/></svg>';
                province.insertAdjacentElement('afterend', icon);
            }
        }
        jQueryNuvem('select[name="country"]').on("change", function (e) {
		    var provinces = {{ provinces_json | default('{}') | raw }};
		    LS.swapProvinces(provinces[jQueryNuvem(e.currentTarget).val()]);
            yamunaStyleProvinceSelect();
		}).trigger('change');
	{% endif %}


    {# /* // Change store country: From invalid zipcode message */ #}

    jQueryNuvem(document).on("click", ".js-save-shipping-country", function(e) {

        e.preventDefault();

        {# Change shipping country #}

        var selected_country_url = jQueryNuvem(this).closest(".js-modal-shipping-country").find(".js-shipping-country-select option").filter((el) => el.selected).attr("data-country-url");
        location.href = selected_country_url;

        jQueryNuvem(this).text('{{ "Aplicando..." | translate }}').addClass("disabled");
    });

    {#/*============================================================================
      #Forms
    ==============================================================================*/ #}

    jQueryNuvem(".js-winnie-pooh-form").on("submit", function (e) {
        jQueryNuvem(e.currentTarget).attr('action', '');
    });

    jQueryNuvem(".js-form").on("submit", function (e) {
        jQueryNuvem(e.currentTarget).find('.js-form-spinner').show();
    });

    {% if template == 'account.login' %}
        {% if result.invalid %}
            jQueryNuvem(".js-account-input").addClass("alert-danger");
            jQueryNuvem(".js-account-input.alert-danger").on("focus", function() {
                jQueryNuvem(".js-account-input").removeClass("alert-danger");
            });
        {% endif %}
    {% endif %}

    {% if template == 'account.register' %}
        (function () {
            var pf = document.querySelector('.js-yamuna-signup-pf');
            var pj = document.querySelector('.js-yamuna-signup-pj');
            var typeInputs = document.querySelectorAll('.js-yamuna-signup-type');
            var back = document.querySelector('.js-yamuna-signup-pj-back');

            function setType(type) {
                if (!pf || !pj) { return; }
                var isCompany = type === 'company';
                pj.hidden = !isCompany;
                pf.hidden = isCompany;
                typeInputs.forEach(function (input) {
                    input.checked = input.value === type;
                });
            }

            typeInputs.forEach(function (input) {
                input.addEventListener('change', function () {
                    setType(input.value);
                });
            });

            if (back) {
                back.addEventListener('click', function () {
                    setType('person');
                });
            }

            function maskCpf(value) {
                var digits = value.replace(/\D/g, '').slice(0, 11);
                return digits
                    .replace(/(\d{3})(\d)/, '$1.$2')
                    .replace(/(\d{3})(\d)/, '$1.$2')
                    .replace(/(\d{3})(\d{1,2})$/, '$1-$2');
            }

            function maskDate(value) {
                var digits = value.replace(/\D/g, '').slice(0, 8);
                return digits
                    .replace(/(\d{2})(\d)/, '$1/$2')
                    .replace(/(\d{2})(\d)/, '$1/$2');
            }

            function maskPhone(value) {
                var digits = value.replace(/\D/g, '').slice(0, 11);
                if (digits.length > 10) {
                    return digits.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
                }
                return digits.replace(/(\d{2})(\d{4})(\d{0,4})/, '($1) $2-$3');
            }

            function isValidBirth(value) {
                var match = /^(\d{2})\/(\d{2})\/(\d{4})$/.exec(value);
                if (!match) { return false; }
                var day = parseInt(match[1], 10);
                var month = parseInt(match[2], 10);
                var year = parseInt(match[3], 10);
                var date = new Date(year, month - 1, day);
                if (date.getFullYear() !== year || date.getMonth() !== month - 1 || date.getDate() !== day) { return false; }
                var today = new Date();
                today.setHours(0, 0, 0, 0);
                return year >= 1900 && date <= today;
            }

            function birthMessage(value) {
                if (!value) { return 'Informe a data de nascimento.'; }
                return 'Informe uma data válida no formato dd/mm/aaaa.';
            }

            function phoneMessage(value) {
                if (!value) { return 'Informe o telefone.'; }
                return 'Informe um telefone válido com DDD.';
            }

            function syncSignupRequired(show) {
                if (birth) {
                    birth.setCustomValidity(isValidBirth(birth.value) ? '' : birthMessage(birth.value.trim()));
                }
                if (phone) {
                    var digits = phone.value.replace(/\D/g, '');
                    phone.setCustomValidity((digits.length === 10 || digits.length === 11) ? '' : phoneMessage(phone.value.trim()));
                }
                if (show && form) { form.reportValidity(); }
            }

            var cpf = document.querySelector('.js-yamuna-cpf');
            var birth = document.querySelector('.js-yamuna-birthdate');
            var phone = document.querySelector('.js-yamuna-phone');
            var form = document.getElementById('login-form');
            if (cpf) {
                cpf.addEventListener('input', function () { cpf.value = maskCpf(cpf.value); });
            }
            if (birth) {
                birth.addEventListener('input', function () {
                    birth.value = maskDate(birth.value);
                    birth.setCustomValidity('');
                });
            }
            if (phone) {
                phone.addEventListener('input', function () {
                    phone.value = maskPhone(phone.value);
                    phone.setCustomValidity('');
                });
            }
            if (form) {
                form.addEventListener('submit', function (event) {
                    syncSignupRequired(false);
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        form.reportValidity();
                    }
                });
            }
        })();
    {% endif %}

    {# Show the success or error message when resending the validation link #}

    {% if template == 'account.register' or template == 'account.login' %}
        jQueryNuvem(".js-resend-validation-link").on("click", function(e){
            window.accountVerificationService.resendVerificationEmail('{{ customer_email }}');
        });
    {% endif %}

    jQueryNuvem('.js-password-view').on("click", function (e) {
        jQueryNuvem(e.currentTarget).toggleClass('password-view');

        if(jQueryNuvem(e.currentTarget).hasClass('password-view')){
            jQueryNuvem(e.currentTarget).parent().find(".js-password-input").attr('type', '');
            jQueryNuvem(e.currentTarget).find(".js-eye-open, .js-eye-closed").toggle();
        } else {
            jQueryNuvem(e.currentTarget).parent().find(".js-password-input").attr('type', 'password');
            jQueryNuvem(e.currentTarget).find(".js-eye-open, .js-eye-closed").toggle();
        }
    });

    {% if store.country == 'AR' and template == 'home' %}

        if (cookieService.get('returning_customer') && LS.shouldShowQuickLoginNotification()) {
            {# Make login link toggle quick login modal #}
            jQueryNuvem(".js-login").removeAttr("href").attr("data-toggle", "#quick-login").addClass("js-modal-open js-trigger-modal-zindex-top");
        }
    {% endif %}


    {#/*============================================================================
      #Footer
    ==============================================================================*/ #}

    {% if store.afip %}

        {# Add alt attribute to external AFIP logo to improve SEO #}

        jQueryNuvem('img[src*="www.afip.gob.ar"]').attr('alt', '{{ "Logo de AFIP" | translate }}');

    {% endif %}


    {#/*============================================================================
      #Empty placeholders
    ==============================================================================*/ #}

    {% if template == 'home' %}

        {# /* // Home slider */ #}

        var width = window.innerWidth;
        if (width > 767) {
            var slider_empty_autoplay = {delay: 6000,};
        } else {
            var slider_empty_autoplay = false;
        }

        window.homeEmptySlider = {
            getAutoRotation: function() {
                return slider_empty_autoplay;
            },
        };
        createSwiper('.js-home-empty-slider', {
            {% if not params.preview %}
            lazy: true,
            {% endif %}
            loop: true,
            autoplay: slider_empty_autoplay,
            pagination: {
                el: '.js-swiper-empty-home-pagination',
                clickable: true,
                renderBullet: function (index, className) {
                  return '<span class="' + className + '">' + (index + 1) + '</span>';
                },
            },
            navigation: {
                nextEl: '.js-swiper-empty-home-next',
                prevEl: '.js-swiper-empty-home-prev',
            },
            on: {
                init: function () {
                    jQueryNuvem(".js-home-empty-slider").css("visibility", "visible").css("height", "100%");
                },
            },
        });


        {# /* // Banner services slider */ #}
        if (window.innerWidth < 1024 && !window.yamunaBenefitsSwiperInitialized && document.querySelector('.js-informative-banners')) {
            window.yamunaBenefitsSwiperInitialized = true;
            var yamunaBenefitsAutoplay = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches ? false : {
                delay: 3600,
                disableOnInteraction: false,
                pauseOnMouseEnter: true,
            };
            createSwiper('.js-informative-banners', {
                slidesPerView: 1,
                speed: 500,
                loop: true,
                loopAdditionalSlides: 2,
                watchOverflow: true,
                centerInsufficientSlides: true,
                autoplay: yamunaBenefitsAutoplay,
                pagination: {
                    el: '.js-informative-banners-pagination',
                    clickable: true,
                },
                breakpoints: {
                    480: {
                        slidesPerView: 2,
                    },
                    768: {
                        slidesPerView: 2,
                        autoplay: yamunaBenefitsAutoplay,
                    },
                    1024: {
                        slidesPerView: 5,
                        autoplay: false,
                        allowTouchMove: false,
                        loop: false,
                    }
                },
                on: {
                    breakpoint: function () {
                        this.slideTo(0, 0, false);
                    }
                }
            });
        }

        {# /* // Brands slider */ #}
        createSwiper('.js-swiper-brands', {
            lazy: true,
            loop: true,
            watchOverflow: true,
            centerInsufficientSlides: true,
            spaceBetween: 30,
            slidesPerView: 1.5,
            navigation: {
                nextEl: '.js-swiper-brands-next',
                prevEl: '.js-swiper-brands-prev',
            },
            breakpoints: {
                640: {
                    slidesPerView: 5,
                }
            }
        });

    {% endif %}

    {% set show_help = not has_products %}
    {% if template == '404' and show_help %}

        {# /* // Product Related */ #}

        {% set columns = settings.grid_columns %}
        createSwiper('.js-swiper-related', {
            lazy: true,
            loop: true,
            watchOverflow: true,
            centerInsufficientSlides: true,
            slidesPerView: 1.5,
            watchSlideProgress: true,
            watchSlidesVisibility: true,
            slideVisibleClass: 'js-swiper-slide-visible',
            navigation: {
                nextEl: '.js-swiper-related-next',
                prevEl: '.js-swiper-related-prev',
            },
            breakpoints: {
                640: {
                    slidesPerView: {% if columns == 2 %}4{% else %}3{% endif %},
                }
            }
        });

        {# /* // Product slider */ #}

        var width = window.innerWidth;
        if (width > 767 && width < 1360) {
            var speedVal = 0;
            var loopVal = false;
            var spaceBetweenVal = 12;
            var slidesPerViewVal = 2;
        } else {
            var speedVal = 300;
            var loopVal = true;
            var spaceBetweenVal = 0;
            var slidesPerViewVal = 1;
        }

        createSwiper('.js-swiper-product', {
            lazy: true,
            speed: speedVal,
            {% if product.images_count > 1 %}
            loop: loopVal,
            slidesPerView: slidesPerViewVal,
            centeredSlides: false,
            spaceBetween: spaceBetweenVal,
            breakpoints: {
                0: {
                    slidesPerView: 1,
                    spaceBetween: 0,
                    speed: 300,
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 12,
                    speed: 0,
                    loop: false,
                },
                1360: {
                    slidesPerView: 1,
                    spaceBetween: 0,
                    speed: 0,
                },
            },
            {% else %}
            slidesPerView: 1,
            spaceBetween: 0,
            {% endif %}
            pagination: {
                el: '.js-swiper-product-pagination',
                type: 'bullets',
                clickable: true,
            },
            navigation: {
                nextEl: '.js-swiper-product-next',
                prevEl: '.js-swiper-product-prev',
            },
            on: {
                init: function () {
                    jQueryNuvem(".js-product-slider-placeholder").hide();
                    jQueryNuvem(".js-swiper-product").css("visibility", "visible").css("height", "auto");
                    {% if product.images_count > 1 %}
                    if (window.innerWidth >= 768 && window.innerWidth < 1360) {
                        this.params.slidesPerView = 2;
                        this.params.spaceBetween = 12;
                        this.update();
                    }
                    {% endif %}
                },
                resize: function () {
                    {% if product.images_count > 1 %}
                    if (window.innerWidth >= 768 && window.innerWidth < 1360) {
                        this.params.slidesPerView = 2;
                        this.params.spaceBetween = 12;
                    } else if (window.innerWidth < 768) {
                        this.params.slidesPerView = 1;
                        this.params.spaceBetween = 0;
                    }
                    {% else %}
                    this.params.slidesPerView = 1;
                    this.params.spaceBetween = 0;
                    {% endif %}
                    this.update();
                },
            },
        });

        {# /* 404 handling to show the example product */ #}

        if ( window.location.pathname === "/product/example/" || window.location.pathname === "/br/product/example/" ) {
            document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
            jQueryNuvem("#404").hide();
            jQueryNuvem("#product-example").show();
        } else {
            jQueryNuvem("#product-example").hide();
        }

        {% endif %}

        {% if template == 'product' %}
        (function () {
            var priceCards = document.querySelector('.yamuna-pdp-price-cards');
            var productPrice = document.getElementById('price_display');
            var buyThreeCard = document.querySelector('[data-yamuna-buy-three]');
            var buyOneCard = document.querySelector('[data-yamuna-buy-one]');

            if (!priceCards || !productPrice || !buyThreeCard) {
                return;
            }

            function parseBrazilianCurrency(value) {
                return Number(String(value).replace(/[^0-9,.-]/g, '').replace(/\./g, '').replace(',', '.'));
            }

            function formatBrazilianCurrency(value) {
                return value.toLocaleString('pt-BR', {
                    style: 'currency',
                    currency: 'BRL'
                });
            }

            function updateCardPrices() {
                var unitPrice = parseBrazilianCurrency(productPrice.textContent);
                var pixDiscount = Number(priceCards.getAttribute('data-yamuna-pix-discount')) || 0;

                if (!isFinite(unitPrice)) {
                    return;
                }

                var buyThreePrice = unitPrice * 0.95;
                var unitPixPrice = unitPrice * (1 - (pixDiscount / 100));
                var buyThreePixPrice = buyThreePrice * (1 - (pixDiscount / 100));

                priceCards.querySelectorAll('[data-yamuna-unit-pix-price]').forEach(function (element) {
                    element.textContent = formatBrazilianCurrency(unitPixPrice);
                });
                priceCards.querySelectorAll('[data-buy-three-price]').forEach(function (element) {
                    element.textContent = formatBrazilianCurrency(buyThreePrice);
                });
                priceCards.querySelectorAll('[data-buy-three-pix-price]').forEach(function (element) {
                    element.textContent = formatBrazilianCurrency(buyThreePixPrice);
                });
            }

            function setQuantityAndAdd(quantity) {
                var quantityInput = document.querySelector('#product_form .js-quantity-input');
                var addButton = document.querySelector('#product_form .js-addtocart.js-prod-submit-form:not(.js-addtocart-placeholder)');

                if (quantityInput) {
                    quantityInput.value = quantity;
                    quantityInput.dispatchEvent(new Event('change', { bubbles: true }));
                }

                if (buyOneCard) {
                    buyOneCard.classList.toggle('is-selected', quantity === 1);
                }
                buyThreeCard.classList.toggle('is-selected', quantity === 3);

                if (addButton && !addButton.disabled) {
                    addButton.click();
                }
            }

            if (buyOneCard) {
                buyOneCard.addEventListener('click', function () {
                    setQuantityAndAdd(1);
                });
                buyOneCard.addEventListener('keydown', function (event) {
                    if (event.key === 'Enter' || event.key === ' ') {
                        event.preventDefault();
                        setQuantityAndAdd(1);
                    }
                });
            }

            buyThreeCard.addEventListener('click', function () {
                setQuantityAndAdd(3);
            });

            new MutationObserver(updateCardPrices).observe(productPrice, {
                childList: true,
                subtree: true,
                characterData: true
            });

            updateCardPrices();
        })();
        {% endif %}

        {# Hide 0% OFF ribbons that the labels component may still emit. #}
        function yamunaHideZeroOfferLabels(root) {
            var scope = root && root.querySelectorAll ? root : document;
            scope.querySelectorAll('.js-offer-label').forEach(function (el) {
                var text = (el.textContent || '').replace(/\s+/g, ' ').trim();
                var match = text.match(/(\d+)\s*%/);
                var pct = match ? Number(match[1]) : NaN;
                if (!match || pct <= 0) {
                    el.classList.add('d-none', 'yamuna-offer-zero');
                    el.style.display = 'none';
                }
            });
        }
        yamunaHideZeroOfferLabels(document);
        document.addEventListener('yamuna:products-updated', function () {
            yamunaHideZeroOfferLabels(document);
        });
        window.yamunaHideZeroOfferLabels = yamunaHideZeroOfferLabels;

        var productTable = document.querySelector('.js-product-table');
        if (productTable && window.MutationObserver) {
            var offerHideTimer = null;
            new MutationObserver(function () {
                window.clearTimeout(offerHideTimer);
                offerHideTimer = window.setTimeout(function () {
                    yamunaHideZeroOfferLabels(productTable);
                }, 50);
            }).observe(productTable, { childList: true, subtree: true });
        }

});
