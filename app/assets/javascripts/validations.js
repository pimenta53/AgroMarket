var ready;
ready = function() {


  /******       New Tutorial VALIDATION     */
  $('#new_academy_tutorial').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "academy_tutorial[title]" : {required: true, maxlength: 255},
      "academy_tutorial[rapid_description]" : {required: true, maxlength: 255}
    },
    messages: {
        "academy_tutorial[rapid_description]": "Insira uma descrição, ela ajudará os utilizadores a identificarem melhor o que desejam"
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

  /******       New USER, CREATE ACCOUNT      */
  $('#new_user').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "user[email]": { email: true, maxlength: 255, required: true },
      "user[avatar]": { required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" },
      "user[name]": { accept: "[a-zA-Z ]", required: true, maxlength: 255 },
      "user[city_id]": { required: true },
      "user[password]": {minlength: 5, maxlength: 15, required: true },
      "user[password_confirmation]": { minlength: 5, maxlength: 15, required: true },
      "user[birthday]": {date: true, required: true },
      "user[phone]": { telefone: true }
    },
    messages: {
        "user[avatar]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg"
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

    /*****      REQUEST PASSWORD            */
    $('#request_password').validate({
        errorElement: 'label',
        errorClass: 'help-inline',
        rules: {
            "user[email]": { email: true, required: true }
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

  /*****        NEW CATEGORY                */
  $('#new_category').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "category[name]": { required: true, minlength: 3 },
      "category[color]": { required: true },
      "category[description]": { required: true, minlength: 5 }
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

  /*****        NEW CITY                */
  $('#new_city').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "city[city]": { minlength: 4 }
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

  /*****        NEW AD                             */
  $('#ad-form').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "ad[category_id]": { required: true },
      "ad[title]": {minlength: 2, maxlength: 50, required: true },
      "ad[description]": { minlength: 5, maxlength: 255, required: true },
      "ad[price]": { minlength: 1, maxlength: 6, number: true, required: true },
      "ad[expire_date]": { date: true, required: true },
      "ad[location]": { minlength:2, maxlength: 255, required: true },
      "ad[type_price_id]": { required: true },
      "ad[city_id]": { required: true },
      "ad[ad_images_attributes][1][image]":{ required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" },
      "ad[ad_images_attributes][2][image]":{ required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" },
      "ad[ad_images_attributes][3][image]":{ required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" },
      "ad[ad_images_attributes][4][image]":{ required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" },
      "ad[ad_images_attributes][5][image]":{ required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" },
      "ad[ad_images_attributes][6][image]":{ required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" }
    },
      messages: {
          "ad[ad_images_attributes][1][image]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg",
          "ad[ad_images_attributes][2][image]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg",
          "ad[ad_images_attributes][3][image]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg",
          "ad[ad_images_attributes][4][image]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg",
          "ad[ad_images_attributes][5][image]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg",
          "ad[ad_images_attributes][6][image]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg"
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


  /*****
  * New AD ADmin zone    (pq é que nao se usa a mesma validação do new ad ?)
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

  //VAlidar um nº de telefone com 9 digitos
  jQuery.validator.addMethod("telefone", function(phone_number, element) {
      phone_number = phone_number.replace(/\s+/g, "");
      return ((this.optional(element) || phone_number.length == 9 ) && $.isNumeric(phone_number) || phone_number.length == 0) ;
  }, "Introduza um telefone válido!");

  jQuery.extend(jQuery.validator.messages, {
    required: "Obrigatório!",
    remote: "Please fix this field.",
    email: "Introduza um email válido.",
    url: "Please enter a valid URL.",
    date: "Introduza uma data válida.",
    dateISO: "Please enter a valid date (ISO).",
    number: "Introduza um número válido.",
    digits: "Please enter only digits.",
    creditcard: "Please enter a valid credit card number.",
    equalTo: "Please enter the same value again.",
    accept: "Insira um valor válido!",
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


function showNotify(text_noti,type_noti) {
  $(function() {
    $.pnotify({
        text: text_noti,
        history: false,
        type: type_noti,
        delay: 2000,
        icon: true,
        closer: true,
        closer_hover: true,
        styling: 'bootstrap'
    });
  });
}



