!function(n){n.fn.charCounter=function(t,e){function i(i,c){i=n(i),i.val().length>t&&(i.val(i.val().substring(0,t)),e.pulse&&!o&&a(c,!0)),e.delay>0?(r&&window.clearTimeout(r),r=window.setTimeout(function(){c.html(e.format.replace(/%1/,t-i.val().length))},e.delay)):c.html(e.format.replace(/%1/,t-i.val().length))}function a(t,e){o&&(window.clearTimeout(o),o=null),t.animate({opacity:.1},100,function(){n(this).animate({opacity:1},100)}),e&&(o=window.setTimeout(function(){a(t)},200))}t=t||100,e=n.extend({container:"<span></span>",classname:"charcounter",format:"(%1 characters remaining)",pulse:!0,delay:0},e);var o,r;return this.each(function(){var t;e.container.match(/^<.+>$/)?(n(this).next("."+e.classname).remove(),t=n(e.container).insertAfter(this).addClass(e.classname)):t=n(e.container),n(this).unbind(".charCounter").bind("keydown.charCounter",function(){i(this,t)}).bind("keypress.charCounter",function(){i(this,t)}).bind("keyup.charCounter",function(){i(this,t)}).bind("focus.charCounter",function(){i(this,t)}).bind("mouseover.charCounter",function(){i(this,t)}).bind("mouseout.charCounter",function(){i(this,t)}).bind("paste.charCounter",function(){var n=this;setTimeout(function(){i(n,t)},10)}),this.addEventListener&&this.addEventListener("input",function(){i(this,t)},!1),i(this,t)})}}(jQuery);