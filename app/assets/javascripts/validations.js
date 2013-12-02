var ready;
ready = function() {


  /**
  * New USER, CREATE ACCOUNT
  */

  $('#new_user').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "user[email]": {
        email: true
      },
      "user[name]": {
        accept: "[a-zA-Z ]" /*Está a deixar passar coisas como 123JorgeDaniel */
      },
      "user_city_id": {
        required: true
      },
      "user[password]": {
        minlength: 5,
        maxlength: 15
      },
      "user[phone]": {
        accept: "[0-9]",
        minlength: 9
      },
    },
    messages: {
      "user[name]": "Este nome não parece ser válido",
      "user[email]": "Email inválido",
      "user[phone]": "O seu contacto não parece válido"
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


  /**
  * NEW CATEGORY
  */

  $('#new_category').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "category[name]": {
        required: true,
        minlength: 3
      },
      "category[color]": {
        required: true
      },
      "category[description]": {
        required: true,
        minlength: 5
      }
    },
    messages: {
      "category[color]": "Adicione uma cor."
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

  /**
  * NEW CITY
  */

  $('#new_city').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "city[city]": {
        minlength: 4
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

  /*****************************************************************
  * NEW AD
  *****************************************************************/
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
        minlength: 5,
        required: true,
      },
      "ad[price]": {
        minlength: 1,
        required: true
      },
      "ad[expire_date]": {
        date: true,
        required: true
      },
      "ad[location]": {
        minlength:2,
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
      .text('OK!').addClass('valid')
      .closest('.control-group').removeClass('error').addClass('success');
    }
  });


  /**
  * New AD ADmin zone
  */

  $('#new_ad').validate({
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
        number: true,
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

  jQuery.extend(jQuery.validator.messages, {
    required: "Obrigatório!",
    remote: "Please fix this field.",
    email: "Please enter a valid email address.",
    url: "Please enter a valid URL.",
    date: "Please enter a valid date.",
    dateISO: "Please enter a valid date (ISO).",
    number: "Please enter a valid number.",
    digits: "Please enter only digits.",
    creditcard: "Please enter a valid credit card number.",
    equalTo: "Please enter the same value again.",
    accept: "Please enter a value with a valid extension.",
    maxlength: jQuery.validator.format("Por favor insira menos de {0} caracteres."),
    minlength: jQuery.validator.format("Por favor insira mais de {0} caracteres."),
    rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
    range: jQuery.validator.format("Please enter a value between {0} and {1}."),
    max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
    min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
  });
};


//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);



