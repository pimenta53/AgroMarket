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

};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);