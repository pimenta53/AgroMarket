


function scrollToPosition(id) {
   if (id !== undefined) {
    
       $('html,body').animate({
         scrollTop: $('#'+id).offset().top},
       'slow');


   }
 }

 $(function() {

  var $obj = $(this);
 
  $(window).scroll(function() {

    var yPos = -($(window).scrollTop() / $obj.data('speed')); 
 
    var bgpos = '50% '+ yPos + 'px';
 
    $obj.css('background-position', bgpos );
 
  }); 


   //Create an Array of posts
   var posts = $('.teste');
    var position = 1; //Start Position
    var next = $('#next');
   var prev = $('#prev').hide();

   //Better performance to use Id selectors than class selectors
   next.click(function(evt) {
       //Scroll to next position
       n = posts[position++];
       if(position === posts.length ) {
         scrollToPosition(n.id);
         next.hide();
         prev.show();
       } else {
         scrollToPosition(n.id);
       }
   });

   prev.click(function(evt) {
     scrollToPosition(posts[0].id);
     next.show();
     prev.hide();
     position=1;
   });


var $productImage=$('#section-video');
var $icon=$('.btn-load-video');
var close_button = $('.close').hide();

    $('.btn-load-video').click(function() {
      
       
       event.preventDefault(); 
       var video = '<div class="video-container"><iframe height="500" width="100%" src="'+ $('.btn-load-video').attr('data-video') +'"></iframe></div>';
      
       $('.tube').append(video);
   
       $('.btn-load-video').hide();
       $('.close').show();

      });

      $('.close').click(function() {
      

       $('.tube').append();
   
       $('.btn-load-video').show();
      });





  $(".frame").fancybox({

      tpl: {
        closeBtn: '<a title="Close" class="fancybox-item fancybox-close myClose" href="javascript:;"></a>'
      },
      maxWidth  : 800,
      maxHeight : 600,
      fitToView : false,
      width   : '70%',
      height    : '70%',
      autoSize  : false,
      closeClick  : false,
      openEffect  : 'none',
      closeEffect : 'none',
      padding: 0,
      modal: false,
      helpers:{
        overlay:{
          locked:false
        }
      }
    });




  $(".icon-shopping-cart").hover((function() {
      $(this).removeClass("icon-shopping-cart");
      return $(this).addClass("icon-play-circle");
    }), function() {
      $(this).removeClass("icon-play-circle");
      return $(this).addClass("icon-shopping-cart");
    });
    $(".icon-male").hover((function() {
      $(this).removeClass("icon-male");
      return $(this).addClass("icon-play-circle");
    }), function() {
      $(this).removeClass("icon-play-circle");
      return $(this).addClass("icon-male");
    });
    $(".icon-group").hover((function() {
      $(this).removeClass("icon-group");
      return $(this).addClass("icon-play-circle");
    }), function() {
      $(this).removeClass("icon-play-circle");
      return $(this).addClass("icon-group");
    });
    $(".icon-bullhorn").hover((function() {
      $(this).removeClass("icon-bullhorn");
      return $(this).addClass("icon-play-circle");
    }), function() {
      $(this).removeClass("icon-play-circle");
      return $(this).addClass("icon-bullhorn");
    });
    $(".icon-calendar-empty").hover((function() {
      $(this).removeClass("icon-calendar-empty");
      return $(this).addClass("icon-play-circle");
    }), function() {
      $(this).removeClass("icon-play-circle");
      return $(this).addClass("icon-calendar-empty");
    });

    
  

    $('input.datepicker').datepicker({"format": "yyyy-mm-dd",autoclose: true});


 });





//sddsaasdasdasdasd




