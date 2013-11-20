var ready;
ready = function() {

     /*
     * FORM VALIDATION
     */


      $('#ad-form').validate({
        errorElement: 'label',
        errorClass: 'help-inline',
        rules: {

          "ad[category_id]": {
            required: true
          },
          "ad[title]": {
            minlength: 2,
            required: true
          },
          "ad[description]": {
            required: true,
          },
          "ad[price]": {
            minlength: 2,
            required: true
          },
          "ad[expire_date]": {
             date: true,
            required: true
          },
          "ad[location]": {
            required: true
          },
          "ad[type_price_id]": {
            
            required: true
          },
          "ad[city_id]": {
        
            required: true
          }
        },
        highlight: function(element) {
          $(element).closest('.control-group').removeClass('success').addClass('error');
        },
        success: function(element) {
          element
          .addClass('valid')
          .closest('.control-group').removeClass('error').addClass('success');
        }
       });
      
      //serve para validar select boxes
      jQuery.validator.addMethod('selectcheck', function (value) {
              return (value != '0');
          }, "Categoria required");


};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);



