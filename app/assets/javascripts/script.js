var ready;
ready = function() {
  //select inputs
  $("select").select2();

  //
  $("#name_sign_up").blur(function() {
       //alert($(this).val());
       $("#name_extra").html("Olá "+ $(this).val() +"!! Bem vindo!!");
   });

   $(".counted").charCounter(144,{container: "#counter"});

   $(".pick-a-color").pickAColor();

   $('input.datepicker').datepicker({"format": "yyyy-mm-dd",autoclose: true});

   $('.typeahead').typeahead({                               
        name: "cities",                
        local: ['couves', 'cenas', 'laranjas', 'coisass', 'anuncios', 'babes','boobs','big boobs','buceta']                                              
   });

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    $('.tt-query').css('background-color','#fff');                                  

    $("abbr.timeago").timeago();


  // Script do Isotope Example
  var things = $('#things');
  var filters = {};
  
  things.isotope({
    itemSelector : '.thing'
  });
  
  // when everything loads, make the "all" options selected
  $('.filter a[data-filter-value=""]').addClass('selected');

  // filter buttons
  $('.filter a').click(
    function(e){
      e.preventDefault();
      var clicked_filter = $(this);
    
      // if the clicked link is already selected, don't do anything
      if ( clicked_filter.hasClass('selected') ) {
        return;
      }
      var optionSet = clicked_filter.parents('.option-set');
    
      // get rid of the ".selected" class on any links in this group and put it on the clicked link
      optionSet.find('.selected').removeClass('selected');
      clicked_filter.addClass('selected');
      
      // store the filters in the filters object, indexed by the group they're in
      // i.e. filters.category = 'animal'
      var group = optionSet.attr('data-filter-group');
      filters[ group ] = clicked_filter.attr('data-filter-value');
    
      // convert the filters object into an array of strings which are CSS class selectors
      var filters_to_use = [];
      for ( var group in filters ) {
        filters_to_use.push( filters[ group ] )
      }
      
      // smash the array together to get a big selector which will filter all elements with the filter classes
      var selector = filters_to_use.join('');
      
      // run the filter on the isotope element
      things.isotope({ filter: selector });
    }
    

    
  );

  //PRETTYPHOTO
  $("a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal', theme:'light_square'});
  

  $(".followToggle").click(function(){
  	   $id=$(this).val();
  	   if ($(this).text() == "follow"){
  	     $(this).text("unfollow");
  	   }
  	   else{
  	     $(this).text("follow");
  	   }
  	   //$.post("./"+$id+"/follow");
  	   $.ajax({
          url: "./"+$id+"/follow",
          async: true,
          dataType: 'script',
          type: "POST",     
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
      });
  	 }
  )
  
  $(".starrr").starrr();

        
  $('#stars').on('starrr:change', function(e, value){
    $('#count').html(value);
    $('#rating_rate').val(value);
  });
  
  $('#stars-existing').on('starrr:change', function(e, value){
    $('#count-existing').html(value);
    $('#rating_rate').val(value);
  });

  //prettycheckable
  //for customized checkbox
   $('input.myClass').prettyCheckable({
    color: 'green'
   });


   /*
   * Progress Bar Form
   */
   var total_percent = 0;
   $("input").on('blur',function () {

          var value = $(this).val();

          if ( value !== ""){
            var perc = $(this).attr("data-percentage");
            total_percent += 10;
            $(".progress-bar").css("width", + total_percent +"%");
          }else if ( value === ""){
            var perc = $(this).attr("data-percentage");
            total_percent -= 10;
            $(".progress-bar").css("width", + total_percent +"%");
          }
              
      });





};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);



