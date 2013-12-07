//// ==================================================== //
////                 Pedidos AJAX                         //
//// ==================================================== //
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
         beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
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


      function refresh_header(){
        $.ajax({
          url: "/refresh_header", 
          type: "GET",
          success: function(result){    
            $("#header").html(result);
          },
          error: function(){
              console.log('Error occured');
          }
        });
        return false;

      }

      setInterval(refresh_header, 700000);
      
      /*
      *  Criar nova resposta para uma pergunta com AJAX
      */
      $("#academy_answer").submit(function() {
        var valuesToSubmit = $(this).serialize();
       $.ajax({
         url: $(this).attr('ajax_path'),  
         data: valuesToSubmit,
         async: true,
         dataType: 'script',
         type: "POST",
         beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
         success: function(data)
         {
           //$("#answers").html(result);
           $("#text_comment").val("");
         },
         error: function(request,error) 
         {
          alert ( "Não foi possivel inserir a tua resposta!!");
         }       
       });
       
       return false;
      });

      

};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);
      