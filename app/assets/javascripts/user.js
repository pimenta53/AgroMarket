$(function() {
          


            //select inputs
            $("select").select2();

            //

            $('input.datepicker').datepicker({"format": "dd/mm/yyyy",autoclose: true});


            var panels = $('.user-infos');
            var panelsButton = $('.dropdown-user');
            panels.hide();

            //Click dropdown
            panelsButton.click(function() {
                 alert("ads");
                //get data-for attribute
                var dataFor = $(this).attr('data-for');
                var idFor = $(dataFor);


                //current button
                var currentButton = $(this);
                idFor.slideToggle(400, function() {

                    //Completed slidetoggle
                    if(idFor.is(':visible'))
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
                    }
                    else
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
                    }
                })
            });


            //$('[data-toggle="tooltip"]').tooltip();

            $('button').click(function(e) {
                e.preventDefault();
                
            });

             $(".followToggle").click(function(){
               $id=$(this).val();
               if ($(this).text() == "follow"){
                 $(this).text("unfollow");
               }
               else{
                 $(this).text("follow");
               }
               //$.post("./"+$id+"/follow");
               $.ajax({
                  url: "./"+$id+"/follow",
                  async: true,
                  dataType: 'script',
                  type: "POST",
                  beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));}
               });
               location.reload();
             }
          );

             $("#message_private").submit(function() {
                var valuesToSubmit = $(this).serialize();
                $.ajax({
                  url: $(this).attr('ajax_path'),
                  data: valuesToSubmit,
                  async: true,
                  dataType: 'script',
                  type: "POST",
                  beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                  success: function(data){
                    $("#text_comment").val("");
                  },
                  error: function(request,error){
                    alert ( "Não foi possivel inserir a tua resposta!!");
                  }
                });
                return false;
              });

     });

