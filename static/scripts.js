"use strict";
(function initGoogleAnalytics() {  
    window.dataLayer = window.dataLayer || [];
      function gtag() {
            dataLayer.push(arguments);
              }
        gtag('js', new Date());
          gtag('config', "UA-123401300-1");
})();
var Navbar=function() {
	var e=$(".navbar"),t=$('.nav-link[href^="#"]'),n=$(".navbar-collapse"),s=$(window);
	function o() {
		e.removeClass("navbar-light").addClass("navbar-dark")
	}
	function l() {
		e.removeClass("navbar-dark").addClass("navbar-light")
	}
	function i() {
		s.scrollTop()>5?o():l()
	}i(),
	s.on({
		scroll:function(){i()},
		"activate.bs.scrollspy":function(){t.filter(".active").focus()}
	}),
	n.on({
		"show.bs.collapse":function(){o()},
		"hidden.bs.collapse":function(){0==s.scrollTop()&&l()}
	}),
	t.on(
		"click",
		function(){n.collapse("hide")}
	)
}(),
Gallery=function(){
	var e=$(".section_gallery__grid"),
	t=".section_gallery__grid__item";
	e.length&&e.each(
		function(){
			var e=$(this).isotope({itemSelector:t});
			e.imagesLoaded().progress(
				function(){
					e.isotope("layout")
				}
			)
		}
	)
}(),
Newsletter=function(){
	var e=$("#mc-embedded-subscribe-form"),
	t=$("#mce-EMAIL"),
	n=$(".section_newsletter__form_clone"),
	s=n.find('input[type="email"]');
	e.on(
		"submit",
		function(t){
			t.preventDefault(),
			$.ajax({
				type:e.attr("method"),
				url:e.attr("action"),
				data:e.serialize(),
				cache:!1,
				dataType:"json",
				contentType:"application/json; charset=utf-8",
				error:function(e){$(document).trigger("touche.alert.show",["danger","Could not connect to the registration server. Please try again later."])},
				success:function(t){
					if("success"!=t.result) {
						var n=t.msg;
						$(document).trigger("touche.alert.show",["danger",n])
					} else 
						$(document).trigger("touche.alert.show",["success",t.msg]),e[0].reset()
				}
			})
		}),
	n.on(
		"submit",
		function(t){
			t.preventDefault(),
			e&&e.submit()
		}),
	s.on(
		"keyup",
		function(){
			!function(){
				if(t.length){
					var e=s.val();
					t.val(e)
				}
			}()
		})
}(),
CurrentDate=function(){var e,t=$("#js-current-year");t.length&&(e=(new Date).getFullYear(),t.text(e))}(),
Feedback=function(){
	var e=$(".sectionFeedback");
	e.length&&e.each(
		function(){
			$(this).flickity({cellAlign:"left",wrapAround:!0,imagesLoaded:!0})
		})
}();