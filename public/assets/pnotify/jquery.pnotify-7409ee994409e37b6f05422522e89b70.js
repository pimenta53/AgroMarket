!function(e){var i,t,o,n=e(window),s={jqueryui:{container:"ui-widget ui-widget-content ui-corner-all",notice:"ui-state-highlight",notice_icon:"ui-icon ui-icon-info",info:"",info_icon:"ui-icon ui-icon-info",success:"ui-state-default",success_icon:"ui-icon ui-icon-circle-check",error:"ui-state-error",error_icon:"ui-icon ui-icon-alert",closer:"ui-icon ui-icon-close",pin_up:"ui-icon ui-icon-pin-w",pin_down:"ui-icon ui-icon-pin-s",hi_menu:"ui-state-default ui-corner-bottom",hi_btn:"ui-state-default ui-corner-all",hi_btnhov:"ui-state-hover",hi_hnd:"ui-icon ui-icon-grip-dotted-horizontal"},bootstrap:{container:"alert",notice:"",notice_icon:"icon-exclamation-sign",info:"alert-info",info_icon:"icon-info-sign",success:"alert-success",success_icon:"icon-ok-sign",error:"alert-error",error_icon:"icon-warning-sign",closer:"icon-remove",pin_up:"icon-pause",pin_down:"icon-play",hi_menu:"well",hi_btn:"btn",hi_btnhov:"",hi_hnd:"icon-chevron-down"}},a=function(){o=e("body"),n=e(window),n.bind("resize",function(){t&&clearTimeout(t),t=setTimeout(e.pnotify_position_all,10)})};document.body?a():e(a),e.extend({pnotify_remove_all:function(){var i=n.data("pnotify");i&&i.length&&e.each(i,function(){this.pnotify_remove&&this.pnotify_remove()})},pnotify_position_all:function(){t&&clearTimeout(t),t=null;var i=n.data("pnotify");i&&i.length&&(e.each(i,function(){var e=this.opts.stack;e&&(e.nextpos1=e.firstpos1,e.nextpos2=e.firstpos2,e.addpos2=0,e.animation=!0)}),e.each(i,function(){this.pnotify_position()}))},pnotify:function(a){var c,r;"object"!=typeof a?(r=e.extend({},e.pnotify.defaults),r.text=a):r=e.extend({},e.pnotify.defaults,a);for(var p in r)"string"==typeof p&&p.match(/^pnotify_/)&&(r[p.replace(/^pnotify_/,"")]=r[p]);if(r.before_init&&r.before_init(r)===!1)return null;var l,u=function(i,t){h.css("display","none");var o=document.elementFromPoint(i.clientX,i.clientY);h.css("display","block");var n=e(o),s=n.css("cursor");h.css("cursor","auto"!=s?s:"default"),l&&l.get(0)==o||(l&&(d.call(l.get(0),"mouseleave",i.originalEvent),d.call(l.get(0),"mouseout",i.originalEvent)),d.call(o,"mouseenter",i.originalEvent),d.call(o,"mouseover",i.originalEvent)),d.call(o,t,i.originalEvent),l=n},f=s[r.styling],h=e("<div />",{"class":"ui-pnotify "+r.addclass,css:{display:"none"},mouseenter:function(e){r.nonblock&&e.stopPropagation(),r.mouse_reset&&"out"==c&&(h.stop(!0),c="in",h.css("height","auto").animate({width:r.width,opacity:r.nonblock?r.nonblock_opacity:r.opacity},"fast")),r.nonblock&&h.stop().animate({opacity:r.nonblock_opacity},"fast"),r.hide&&r.mouse_reset&&h.pnotify_cancel_remove(),r.sticker&&!r.nonblock&&h.sticker.trigger("pnotify_icon").css("visibility","visible"),r.closer&&!r.nonblock&&h.closer.css("visibility","visible")},mouseleave:function(i){r.nonblock&&i.stopPropagation(),l=null,h.css("cursor","auto"),r.nonblock&&"out"!=c&&h.stop().animate({opacity:r.opacity},"fast"),r.hide&&r.mouse_reset&&h.pnotify_queue_remove(),r.sticker_hover&&h.sticker.css("visibility","hidden"),r.closer_hover&&h.closer.css("visibility","hidden"),e.pnotify_position_all()},mouseover:function(e){r.nonblock&&e.stopPropagation()},mouseout:function(e){r.nonblock&&e.stopPropagation()},mousemove:function(e){r.nonblock&&(e.stopPropagation(),u(e,"onmousemove"))},mousedown:function(e){r.nonblock&&(e.stopPropagation(),e.preventDefault(),u(e,"onmousedown"))},mouseup:function(e){r.nonblock&&(e.stopPropagation(),e.preventDefault(),u(e,"onmouseup"))},click:function(e){r.nonblock&&(e.stopPropagation(),u(e,"onclick"))},dblclick:function(e){r.nonblock&&(e.stopPropagation(),u(e,"ondblclick"))}});h.opts=r,h.container=e("<div />",{"class":f.container+" ui-pnotify-container "+("error"==r.type?f.error:"info"==r.type?f.info:"success"==r.type?f.success:f.notice)}).appendTo(h),""!=r.cornerclass&&h.container.removeClass("ui-corner-all").addClass(r.cornerclass),r.shadow&&h.container.addClass("ui-pnotify-shadow"),h.pnotify_version="1.2.2",h.pnotify=function(i){var t=r;"string"==typeof i?r.text=i:r=e.extend({},r,i);for(var o in r)"string"==typeof o&&o.match(/^pnotify_/)&&(r[o.replace(/^pnotify_/,"")]=r[o]);return h.opts=r,r.cornerclass!=t.cornerclass&&h.container.removeClass("ui-corner-all").addClass(r.cornerclass),r.shadow!=t.shadow&&(r.shadow?h.container.addClass("ui-pnotify-shadow"):h.container.removeClass("ui-pnotify-shadow")),r.addclass===!1?h.removeClass(t.addclass):r.addclass!==t.addclass&&h.removeClass(t.addclass).addClass(r.addclass),r.title===!1?h.title_container.slideUp("fast"):r.title!==t.title&&(r.title_escape?h.title_container.text(r.title).slideDown(200):h.title_container.html(r.title).slideDown(200)),r.text===!1?h.text_container.slideUp("fast"):r.text!==t.text&&(r.text_escape?h.text_container.text(r.text).slideDown(200):h.text_container.html(r.insert_brs?String(r.text).replace(/\n/g,"<br />"):r.text).slideDown(200)),h.pnotify_history=r.history,h.pnotify_hide=r.hide,r.type!=t.type&&h.container.removeClass(f.error+" "+f.notice+" "+f.success+" "+f.info).addClass("error"==r.type?f.error:"info"==r.type?f.info:"success"==r.type?f.success:f.notice),(r.icon!==t.icon||r.icon===!0&&r.type!=t.type)&&(h.container.find("div.ui-pnotify-icon").remove(),r.icon!==!1&&e("<div />",{"class":"ui-pnotify-icon"}).append(e("<span />",{"class":r.icon===!0?"error"==r.type?f.error_icon:"info"==r.type?f.info_icon:"success"==r.type?f.success_icon:f.notice_icon:r.icon})).prependTo(h.container)),r.width!==t.width&&h.animate({width:r.width}),r.min_height!==t.min_height&&h.container.animate({minHeight:r.min_height}),r.opacity!==t.opacity&&h.fadeTo(r.animate_speed,r.opacity),!r.closer||r.nonblock?h.closer.css("display","none"):h.closer.css("display","block"),!r.sticker||r.nonblock?h.sticker.css("display","none"):h.sticker.css("display","block"),h.sticker.trigger("pnotify_icon"),r.sticker_hover?h.sticker.css("visibility","hidden"):r.nonblock||h.sticker.css("visibility","visible"),r.closer_hover?h.closer.css("visibility","hidden"):r.nonblock||h.closer.css("visibility","visible"),r.hide?t.hide||h.pnotify_queue_remove():h.pnotify_cancel_remove(),h.pnotify_queue_position(),h},h.pnotify_position=function(e){var i=h.opts.stack;if(i){i.nextpos1||(i.nextpos1=i.firstpos1),i.nextpos2||(i.nextpos2=i.firstpos2),i.addpos2||(i.addpos2=0);var t="none"==h.css("display");if(!t||e){var o,s,a,c={};switch(i.dir1){case"down":a="top";break;case"up":a="bottom";break;case"left":a="right";break;case"right":a="left"}o=parseInt(h.css(a)),isNaN(o)&&(o=0),"undefined"!=typeof i.firstpos1||t||(i.firstpos1=o,i.nextpos1=i.firstpos1);var r;switch(i.dir2){case"down":r="top";break;case"up":r="bottom";break;case"left":r="right";break;case"right":r="left"}if(s=parseInt(h.css(r)),isNaN(s)&&(s=0),"undefined"!=typeof i.firstpos2||t||(i.firstpos2=s,i.nextpos2=i.firstpos2),("down"==i.dir1&&i.nextpos1+h.height()>n.height()||"up"==i.dir1&&i.nextpos1+h.height()>n.height()||"left"==i.dir1&&i.nextpos1+h.width()>n.width()||"right"==i.dir1&&i.nextpos1+h.width()>n.width())&&(i.nextpos1=i.firstpos1,i.nextpos2+=i.addpos2+("undefined"==typeof i.spacing2?25:i.spacing2),i.addpos2=0),i.animation&&i.nextpos2<s)switch(i.dir2){case"down":c.top=i.nextpos2+"px";break;case"up":c.bottom=i.nextpos2+"px";break;case"left":c.right=i.nextpos2+"px";break;case"right":c.left=i.nextpos2+"px"}else i.nextpos2&&h.css(r,i.nextpos2+"px");switch(i.dir2){case"down":case"up":h.outerHeight(!0)>i.addpos2&&(i.addpos2=h.height());break;case"left":case"right":h.outerWidth(!0)>i.addpos2&&(i.addpos2=h.width())}if(i.nextpos1)if(i.animation&&(o>i.nextpos1||c.top||c.bottom||c.right||c.left))switch(i.dir1){case"down":c.top=i.nextpos1+"px";break;case"up":c.bottom=i.nextpos1+"px";break;case"left":c.right=i.nextpos1+"px";break;case"right":c.left=i.nextpos1+"px"}else h.css(a,i.nextpos1+"px");switch((c.top||c.bottom||c.right||c.left)&&h.animate(c,{duration:this.opts.position_animate_speed,queue:!1}),i.dir1){case"down":case"up":i.nextpos1+=h.height()+("undefined"==typeof i.spacing1?25:i.spacing1);break;case"left":case"right":i.nextpos1+=h.width()+("undefined"==typeof i.spacing1?25:i.spacing1)}}}},h.pnotify_queue_position=function(i){t&&clearTimeout(t),i||(i=10),t=setTimeout(e.pnotify_position_all,i)},h.pnotify_display=function(){_=n.data("pnotify"),_&&_.length>r.maxonscreen&&e.each(_.slice(0,_.length-r.maxonscreen),function(){this.pnotify_remove&&this.pnotify_remove()}),h.parent().length||h.appendTo(o),r.before_open&&r.before_open(h)===!1||("top"!=r.stack.push&&h.pnotify_position(!0),"fade"==r.animation||"fade"==r.animation.effect_in?h.show().fadeTo(0,0).hide():1!=r.opacity&&h.show().fadeTo(0,r.opacity).hide(),h.animate_in(function(){r.after_open&&r.after_open(h),h.pnotify_queue_position(),r.hide&&h.pnotify_queue_remove()}))},h.pnotify_remove=function(){h.timer&&(window.clearTimeout(h.timer),h.timer=null),r.before_close&&r.before_close(h)===!1||h.animate_out(function(){r.after_close&&r.after_close(h)===!1||(h.pnotify_queue_position(),r.remove&&h.detach())})},h.animate_in=function(e){c="in";var i;i="undefined"!=typeof r.animation.effect_in?r.animation.effect_in:r.animation,"none"==i?(h.show(),e()):"show"==i?h.show(r.animate_speed,e):"fade"==i?h.show().fadeTo(r.animate_speed,r.opacity,e):"slide"==i?h.slideDown(r.animate_speed,e):"function"==typeof i?i("in",e,h):h.show(i,"object"==typeof r.animation.options_in?r.animation.options_in:{},r.animate_speed,e)},h.animate_out=function(e){c="out";var i;i="undefined"!=typeof r.animation.effect_out?r.animation.effect_out:r.animation,"none"==i?(h.hide(),e()):"show"==i?h.hide(r.animate_speed,e):"fade"==i?h.fadeOut(r.animate_speed,e):"slide"==i?h.slideUp(r.animate_speed,e):"function"==typeof i?i("out",e,h):h.hide(i,"object"==typeof r.animation.options_out?r.animation.options_out:{},r.animate_speed,e)},h.pnotify_cancel_remove=function(){h.timer&&window.clearTimeout(h.timer)},h.pnotify_queue_remove=function(){h.pnotify_cancel_remove(),h.timer=window.setTimeout(function(){h.pnotify_remove()},isNaN(r.delay)?0:r.delay)},h.closer=e("<div />",{"class":"ui-pnotify-closer",css:{cursor:"pointer",visibility:r.closer_hover?"hidden":"visible"},click:function(){h.pnotify_remove(),h.sticker.css("visibility","hidden"),h.closer.css("visibility","hidden")}}).append(e("<span />",{"class":f.closer,title:r.labels.close})).appendTo(h.container),(!r.closer||r.nonblock)&&h.closer.css("display","none"),h.sticker=e("<div />",{"class":"ui-pnotify-sticker",css:{cursor:"pointer",visibility:r.sticker_hover?"hidden":"visible"},click:function(){r.hide=!r.hide,r.hide?h.pnotify_queue_remove():h.pnotify_cancel_remove(),e(this).trigger("pnotify_icon")}}).bind("pnotify_icon",function(){e(this).children().removeClass(f.pin_up+" "+f.pin_down).addClass(r.hide?f.pin_up:f.pin_down)}).append(e("<span />",{"class":f.pin_up,title:r.labels.stick})).appendTo(h.container),(!r.sticker||r.nonblock)&&h.sticker.css("display","none"),r.icon!==!1&&e("<div />",{"class":"ui-pnotify-icon"}).append(e("<span />",{"class":r.icon===!0?"error"==r.type?f.error_icon:"info"==r.type?f.info_icon:"success"==r.type?f.success_icon:f.notice_icon:r.icon})).prependTo(h.container),h.title_container=e("<h4 />",{"class":"ui-pnotify-title"}).appendTo(h.container),r.title===!1?h.title_container.hide():r.title_escape?h.title_container.text(r.title):h.title_container.html(r.title),h.text_container=e("<div />",{"class":"ui-pnotify-text"}).appendTo(h.container),r.text===!1?h.text_container.hide():r.text_escape?h.text_container.text(r.text):h.text_container.html(r.insert_brs?String(r.text).replace(/\n/g,"<br />"):r.text),"string"==typeof r.width&&h.css("width",r.width),"string"==typeof r.min_height&&h.container.css("min-height",r.min_height),h.pnotify_history=r.history,h.pnotify_hide=r.hide;var _=n.data("pnotify");if((null==_||"object"!=typeof _)&&(_=[]),_="top"==r.stack.push?e.merge([h],_):e.merge(_,[h]),n.data("pnotify",_),"top"==r.stack.push&&h.pnotify_queue_position(1),r.after_init&&r.after_init(h),r.history){var y=n.data("pnotify_history");if("undefined"==typeof y){y=e("<div />",{"class":"ui-pnotify-history-container "+f.hi_menu,mouseleave:function(){y.animate({top:"-"+i+"px"},{duration:100,queue:!1})}}).append(e("<div />",{"class":"ui-pnotify-history-header",text:r.labels.redisplay})).append(e("<button />",{"class":"ui-pnotify-history-all "+f.hi_btn,text:r.labels.all,mouseenter:function(){e(this).addClass(f.hi_btnhov)},mouseleave:function(){e(this).removeClass(f.hi_btnhov)},click:function(){return e.each(_,function(){this.pnotify_history&&(this.is(":visible")?this.pnotify_hide&&this.pnotify_queue_remove():this.pnotify_display&&this.pnotify_display())}),!1}})).append(e("<button />",{"class":"ui-pnotify-history-last "+f.hi_btn,text:r.labels.last,mouseenter:function(){e(this).addClass(f.hi_btnhov)},mouseleave:function(){e(this).removeClass(f.hi_btnhov)},click:function(){var e,i=-1;do{if(e=-1==i?_.slice(i):_.slice(i,i+1),!e[0])break;i--}while(!e[0].pnotify_history||e[0].is(":visible"));return e[0]?(e[0].pnotify_display&&e[0].pnotify_display(),!1):!1}})).appendTo(o);var m=e("<span />",{"class":"ui-pnotify-history-pulldown "+f.hi_hnd,mouseenter:function(){y.animate({top:"0"},{duration:100,queue:!1})}}).appendTo(y);i=m.offset().top+2,y.css({top:"-"+i+"px"}),n.data("pnotify_history",y)}}return r.stack.animation=!1,r.auto_display&&h.pnotify_display(),h}});var c=/^on/,r=/^(dbl)?click$|^mouse(move|down|up|over|out|enter|leave)$|^contextmenu$/,p=/^(focus|blur|select|change|reset)$|^key(press|down|up)$/,l=/^(scroll|resize|(un)?load|abort|error)$/,d=function(i,t){var o;if(i=i.toLowerCase(),document.createEvent&&this.dispatchEvent){if(i=i.replace(c,""),i.match(r)?(e(this).offset(),o=document.createEvent("MouseEvents"),o.initMouseEvent(i,t.bubbles,t.cancelable,t.view,t.detail,t.screenX,t.screenY,t.clientX,t.clientY,t.ctrlKey,t.altKey,t.shiftKey,t.metaKey,t.button,t.relatedTarget)):i.match(p)?(o=document.createEvent("UIEvents"),o.initUIEvent(i,t.bubbles,t.cancelable,t.view,t.detail)):i.match(l)&&(o=document.createEvent("HTMLEvents"),o.initEvent(i,t.bubbles,t.cancelable)),!o)return;this.dispatchEvent(o)}else i.match(c)||(i="on"+i),o=document.createEventObject(t),this.fireEvent(i,o)};e.pnotify.defaults={title:!1,title_escape:!1,text:!1,text_escape:!1,styling:"bootstrap",addclass:"",cornerclass:"",nonblock:!1,nonblock_opacity:.2,history:!0,maxonscreen:1/0,auto_display:!0,width:"300px",min_height:"16px",type:"notice",icon:!0,animation:"fade",animate_speed:"slow",position_animate_speed:500,opacity:1,shadow:!0,closer:!0,closer_hover:!0,sticker:!0,sticker_hover:!0,hide:!0,delay:8e3,mouse_reset:!0,remove:!0,insert_brs:!0,stack:{dir1:"down",dir2:"left",push:"bottom",spacing1:25,spacing2:25},labels:{redisplay:"Redisplay",all:"All",last:"Last",close:"Close",stick:"Stick"}}}(jQuery);