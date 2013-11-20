


function scrollToPosition(id) {
   if (id !== undefined) {
       $('html,body').animate({
         scrollTop: $('#'+id).offset().top},
       'slow');
   }
 }

 $(function() {

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
  
 });


//sddsaasdasdasdasd




