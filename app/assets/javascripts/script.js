var ready;
ready = function() {

  //select inputs
  $("select").select2();


  //
  $("#name_sign_up").blur(function() {
         //alert($(this).val());
         $("#name_extra").html("Olá "+ $(this).val() +"!! Bem vindo!!");
   });
};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);