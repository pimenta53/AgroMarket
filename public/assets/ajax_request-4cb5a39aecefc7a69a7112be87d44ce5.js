var ready;ready=function(){function e(){return $.ajax({url:"/refresh_header",type:"GET",success:function(e){$("#header").html(e)},error:function(){console.log("Error occured")}}),!1}$("#cenas").click(function(){return alert("Não foi possivel inserir o seu comentario!!"+error),!1}),$("#message_private").submit(function(){var e=$(this).serialize();return $.ajax({url:$(this).attr("ajax_path"),data:e,async:!0,dataType:"script",type:"POST",beforeSend:function(e){e.setRequestHeader("X-CSRF-Token",$('meta[name="csrf-token"]').attr("content"))},success:function(){$("#text_comment").val("")},error:function(){alert("Não foi possivel inserir a tua resposta!!")}}),!1}),setInterval(e,7e5),$("#academy_answer").submit(function(){var e=$(this).serialize();return $.ajax({url:$(this).attr("ajax_path"),data:e,async:!0,dataType:"script",type:"POST",beforeSend:function(e){e.setRequestHeader("X-CSRF-Token",$('meta[name="csrf-token"]').attr("content"))},success:function(){$("#some-textarea").data("wysihtml5").editor.setValue("")},error:function(){alert("Não foi possivel inserir a tua resposta!!")}}),!1})},$(document).ready(ready),$(document).on("page:load",ready);