// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker




jQuery(document).ready(function ($) {

$('div.bgParallax').each(function(){
	var $obj = $(this);
 
	$(window).scroll(function() {
		var yPos = -($(window).scrollTop() / $obj.data('speed')); 
 
		var bgpos = '50% '+ yPos + 'px';
 
		$obj.css('background-position', bgpos );
        
 
	}); 
});

/*
$(document).ready(function() {
 alert('Thanks for visiting!');
 //= require jquery.stellar
});
*/
 //$(window).stellar();
 
 htmlbody = $('html,body');
 slide = $('.slide');
 button = $('.next_section_button');

 function goToByScroll(dataslide) {

        htmlbody.animate({
            scrollTop: $('.slide[data-slide="' + dataslide + '"]').offset().top
        }, 2000, 'easeInOutQuint');
    }
 
    //When the user clicks on the button, get the get the data-slide attribute value of the button and pass that variable to the goToByScroll function
    button.click(function (e) {
    	
        e.preventDefault();
        dataslide = $(this).attr('data-slide');
        goToByScroll(dataslide);
    });

  });