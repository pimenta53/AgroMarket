// ==================================================== //
//                 Pedidos AJAX                         //
// ==================================================== //
var ready;
ready = function() {

      /*
      *  Cria um novo comentario na pagina de um anuncio
      */
      $("#comment_ad").submit(function() {
        var valuesToSubmit = $(this).serialize();
        $.ajax({
          url: $(this).attr('ajax_path'),  
          data: valuesToSubmit,
          async: true,
          dataType: 'script',
          type: "POST",
          success: function(data)
          {
              //alert(data)
            $("#text_comment").val("");

          },
          error: function(request,error) 
          {
           alert ( "Não foi possivel inserir o seu comentario!!" + error);
          }       
        });
        
        return false;
      });

};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);
      