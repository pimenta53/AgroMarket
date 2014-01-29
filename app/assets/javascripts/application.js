// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require bootstrap-datepicker
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require_tree .
//= require jquery.inview.min.js


// http://timeago.yarp.com/
// https://github.com/rmm5t/jquery-timeago/tree/master/locales
jQuery.timeago.settings.strings = {
   suffixAgo: "atrás",
   suffixFromNow: "a partir de agora",
   seconds: "menos de um minuto",
   minute: "cerca de um minuto",
   minutes: "%d minutos",
   hour: "cerca de uma hora",
   hours: "cerca de %d horas",
   day: "um dia",
   days: "%d dias",
   month: "cerca de um mês",
   months: "%d meses",
   year: "cerca de um ano",
   years: "%d anos"
};



