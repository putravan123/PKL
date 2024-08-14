(function( $ ) {
    "use strict";
    
    $('.woocommerce-form-coupon-toggle .showcoupon').on("click", function(){
        $(this).toggleClass( "active" );
        if ($(this).hasClass( "active" )) {
            $('.woocommerce-form-coupon').stop(true, true).slideDown();
        }else{
            $('.woocommerce-form-coupon').stop(true, true).slideUp();
        }
    });
    /* ========================================== 
	Sticky Header 1
	========================================== */
	$(window).on("scroll", function(){
		if ( $( '#site-header' ).hasClass( "sticky-header" ) ) {
			var site_header = $('#site-header').outerHeight() + 30;	
			
		    if ($(window).scrollTop() >= site_header) {	    	
		        $('.sticky-header .octf-main-header, .mobile-header-sticky .header_mobile').addClass('is-stuck');	        
		    }else {
		        $('.sticky-header .octf-main-header, .mobile-header-sticky .header_mobile').removeClass('is-stuck');		              
		    }
		}
	});
})( jQuery );

