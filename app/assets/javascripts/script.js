var ready;
ready = function() {

  //select inputs
  $("select").select2();

};

//em rails 4 so funciona assim
// por causa do turboLink
$(document).ready(ready);
$(document).on('page:load', ready);