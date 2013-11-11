var ready;
ready = function() {
  //RATING

  var __slice = [].slice;

  (function($, window) {
    var Starrr;

    Starrr = (function() {
      Starrr.prototype.defaults = {
        rating: void 0,
        numStars: 5,
        change: function(e, value) {}
      };

      function Starrr($el, options) {
        var i, _, _ref,
          _this = this;

        this.options = $.extend({}, this.defaults, options);
        this.$el = $el;
        _ref = this.defaults;
        for (i in _ref) {
          _ = _ref[i];
          if (this.$el.data(i) != null) {
            this.options[i] = this.$el.data(i);
          }
        }
        this.createStars();
        this.syncRating();
        this.$el.on('mouseover.starrr', 'span', function(e) {
          return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
        });
        this.$el.on('mouseout.starrr', function() {
          return _this.syncRating();
        });
        this.$el.on('click.starrr', 'span', function(e) {
          return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
        });
        this.$el.on('starrr:change', this.options.change);
      }

      Starrr.prototype.createStars = function() {
        var _i, _ref, _results;

        _results = [];
        for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
          _results.push(this.$el.append("<span class='icon_rating icon_rating-nocolor'></span>"));
        }
        return _results;
      };

      Starrr.prototype.setRating = function(rating) {
        if (this.options.rating === rating) {
          rating = void 0;
        }
        this.options.rating = rating;
        this.syncRating();
        return this.$el.trigger('starrr:change', rating);
      };

      Starrr.prototype.syncRating = function(rating) {
        var i, _i, _j, _ref;

        rating || (rating = this.options.rating);
        if (rating) {
          for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
            this.$el.find('span').eq(i).removeClass('icon_rating-nocolor').addClass('icon_rating');
          }
        }
        if (rating && rating < 5) {
          for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
            this.$el.find('span').eq(i).removeClass('icon_rating').addClass('icon_rating-nocolor');
          }
        }
        if (!rating) {
          return this.$el.find('span').removeClass('icon_rating').addClass('icon_rating-nocolor');
        }
      };

      return Starrr;

    })();
    return $.fn.extend({
      starrr: function() {
        var args, option;

        option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
        return this.each(function() {
          var data;

          data = $(this).data('star-rating');
          if (!data) {
            $(this).data('star-rating', (data = new Starrr($(this), option)));
          }
          if (typeof option === 'string') {
            return data[option].apply(data, args);
          }
        });
      }
    });
  })(window.jQuery, window);

  $(function() {
    return $(".starrr").starrr();
  });

  $( document ).ready(function() {
        
    $('#stars').on('starrr:change', function(e, value){
      $('#count').html(value);
      $('#rating_rate').val(value);
    });
    
    $('#stars-existing').on('starrr:change', function(e, value){
      $('#count-existing').html(value);
      $('#rating_rate').val(value);
    });
  });



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


};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);



