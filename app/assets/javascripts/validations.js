var ready;
ready = function() {
  
  /*ordenador de colunas das tabelas*/
  $("#orderTable").tablesorter(); 

  $("#orderTableCities").tablesorter({ 
        // ordena logo a coluna com o nome da cidade
        sortList: [[1,0]] 
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
      "user[birthday]": {accept: "[\\d]{1}/[\\d]{2}/[\\d]{4}", required: false },
      "user[phone]": { telefone: true }
    },
    messages: {
        "user[avatar]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg"
    },
    highlight: function(element) {
      $(element).closest('.controls').removeClass('success').addClass('error');
    },
    success: function(element) {
        element
            .addClass('valid')
            .closest('.controls').removeClass('error').addClass('success');
      }
   });

  /******       Edit USER, CURRENT ACCOUNT      */
  $('#edit_user').validate({
    errorElement: 'label',
    errorClass: 'help-inline',
    rules: {
      "user[email]": { email: true, maxlength: 255, required: true },
      "user[avatar]": { required: false, maxlength: 255, accept: "gif|png|jpg|jpeg|pjpeg" },
      "user[name]": { accept: "[a-zA-Z ]", required: true, maxlength: 255 },
      "user[city_id]": { required: true },
      "user[password]": {minlength: 5, maxlength: 15, required: true },
      "user[password_confirmation]": { minlength: 5, maxlength: 15, required: true },
      "user[birthday]": {accept: "[\\d]{1}/[\\d]{2}/[\\d]{4}", required: true },
      "user[phone]": { telefone: true }
    },
    messages: {
        "user[avatar]": "O ficheiro que inseriu não é válido. Extensões válidas: gif|png|jpg|jpeg|pjpeg"
    },
    highlight: function(element) {
      $(element).closest('.controls').removeClass('success').addClass('error');
    },
    success: function(element) {
        element
            .addClass('valid')
            .closest('.controls').removeClass('error').addClass('success');
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
                .closest('.control-group').removeClass('error').addClass('success2');
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

  /*****        NEW QUESTION                */
  $('#question_form').validate({
        errorElement: 'label',
        errorClass: 'help-inline',
        rules: {
            "academy_question[category_id]": {required: true},
            "academy_question[title]": {minlength: 2, maxlength: 75, required: true },
            "academy_question[text]": { minlength: 5, maxlength: 1500, required: true }
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

    /*****        NEW ANSWER                */
    $('#academy_answer').validate({
        errorElement: 'label',
        errorClass: 'help-inline',
        rules: {
            "academy_answer[text]": { minlength: 2, maxlength: 255, required: true }
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

    /*****        NEW WORKSHOP                */
    $('#academy_workshop').validate({
        errorElement: 'label',
        errorClass: 'help-inline',
        rules: {
            "academy_workshop[title]": {minlength: 2, maxlength: 50, required: true },
            "academy_workshop[available_slots]": {number: true, required: true},
            "academy_workshop[price]": { preco: true, required: true },
            "academy_workshop[date]": {accept: "[\\d]{1}/[\\d]{2}/[\\d]{4}", required: true },
            "academy_workshop[description]": { minlength: 2, maxlength: 255, required: true },
            "academy_workshop[local]": { minlength:2, maxlength: 255, required: true }
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


    /*****        NEW EVENT                */
    $('#event_form').validate({
        errorElement: 'label',
        errorClass: 'help-inline',
        rules: {
            "event_event[title]": {minlength: 2, maxlength: 50, required: true },
            "event_event[start_day]": {accept: "[\\d]{1}/[\\d]{2}/[\\d]{4}", required: true },
            "event_event[end_day]": {accept: "[\\d]{1}/[\\d]{2}/[\\d]{4}", required: true },
            "event_event[description]": { minlength: 2, maxlength: 255, required: true },
            "event_event[city_id]":  { required: true }
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


    /*****        NEW TUTORIAL                */
    $('#tutorial-form').validate({
        errorElement: 'label',
        errorClass: 'help-inline',
        rules: {
            "academy_tutorial[category_id]": {required: true},
            "academy_tutorial[title]": {minlength: 2, maxlength: 75, required: true },
            "academy_tutorial[rapid_description]": { minlength: 15, maxlength: 200, required: true },
            "academy_tutorial[text]": { minlength: 30, maxlength: 200, required: true }
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
      "ad[price]": { preco: true, required: true },
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

  //serve para validar select boxes
  jQuery.validator.addMethod('selectcheck', function (value) {
    return (value != '0');
  }, "<img src=\"../../../assets/error.png\" title=\"Introduza uma categoria válida!\">");

  //VAlidar um nº de telefone com 9 digitos
  jQuery.validator.addMethod("telefone", function(phone_number, element) {
      phone_number = phone_number.replace(/\s+/g, "");
      return ((this.optional(element) || phone_number.length == 9 ) && $.isNumeric(phone_number) || phone_number.length == 0) ;
  }, "<img src=\"../../../assets/error.png\" title=\"Introduza um telefone válido!\">");

   //Validar preço
   jQuery.validator.addMethod("preco", function(valor, element) {
       var regex  = /^\d+(?:\.\d{0,2})?$/;
       valor = valor.replace(/\s+/g, "");
       return ((this.optional(element) || valor.length <= 15 ) && regex.test(valor)) ;
   }, "<img src=\"../../../assets/error.png\" title=\"Introduza um preço válido!\">");

  jQuery.extend(jQuery.validator.messages, {
    required: "<img src=\"../../../assets/error.png\" title=\"Obrigatório!\">",
    remote: "<img src=\"../../../assets/error.png\" title=\"Please fix this field.\">",
    email: "<img src=\"../../../assets/error.png\" title=\"Introduza um email válido.\">",
    url: "<img src=\"../../../assets/error.png\" title=\"Please enter a valid URL.\">",
    date: "<img src=\"../../../assets/error.png\" title=\"Introduza uma data válida.\">",
    dateISO: "<img src=\"../../../assets/error.png\" title=\"Please enter a valid date (ISO).\">",
    number: "<img src=\"../../../assets/error.png\" title=\"Introduza um número válido.\">",
    digits: "<img src=\"../../../assets/error.png\" title=\"Please enter only digits.\">",
    creditcard: "<img src=\"../../../assets/error.png\" title=\"Please enter a valid credit card number.\">",
    equalTo: "<img src=\"../../../assets/error.png\" title=\"Please enter the same value again.\">",
    accept: "<img src=\"../../../assets/error.png\" title=\"Insira um valor válido!\">",
    maxlength: jQuery.validator.format("<img src=\"../../../assets/error.png\" title=\"Por favor insira menos de {0} caracteres.\">"),
    minlength: jQuery.validator.format("<img src=\"../../../assets/error.png\" title=\"Por favor insira mais de {0} caracteres.\">"),
    rangelength: jQuery.validator.format("<img src=\"../../../assets/error.png\" title=\"Please enter a value between {0} and {1} characters long.\">"),
    range: jQuery.validator.format("<img src=\"../../../assets/error.png\" title=\"Please enter a value between {0} and {1}.\">"),
    max: jQuery.validator.format("<img src=\"../../../assets/error.png\" title=\"Por favor introduza um valor menor ou igual {0}.\">"),
    min: jQuery.validator.format("<img src=\"../../../assets/error.png\" title=\"Por favor introduza um valor maior ou igual a {0}.\">")
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



