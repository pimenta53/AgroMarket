!function(t,i,o,s){function n(i,o){this.element=i,this.$elem=t(this.element),this.options=t.extend({},a,o),this._defaults=a,this._name=e,this.init()}var e="progression",a={tooltipWidth:"200",tooltipPosition:"right",tooltipOffset:"50",showProgressBar:!0,showHelper:!0,validator:!1,tooltipFontSize:"14",tooltipFontColor:"ffffff",progressBarBackground:"ffffff",progressBarColor:"6EA5E1",tooltipBackgroundColor:"a2cbfa",tooltipPadding:"10",tooltipAnimate:!0};n.prototype={init:function(){function i(t,i){return 100*(i/t)}data_prog=this.$elem.css("position","relative").find("[data-progression]"),items=data_prog.length,thisid=this.$elem.attr("id"),firstoffset=data_prog.first().position().top,firsthelper=data_prog.first().attr("data-helper"),firsthelper=data_prog.first().attr("data-helper")!==s?data_prog.first().attr("data-helper"):"",$display=this.options.showProgressBar===!1?"display:none;":"",$display2=this.options.showHelper===!1?"display:none;":"";var o=this.options.tooltipAnimate?"-webkit-transition: top .3s ease-in-out;-moz-transition: top .3s ease-in-out;-o-transition: top .3s ease-in-out;transition: top .3s ease-in-out;":"",n=this.options.tooltipAnimate?"-webkit-transition: width .3s ease-in-out;-moz-transition: width .3s ease-in-out;-o-transition: width .3s ease-in-out;transition: width .3s ease-in-out;":"",e="right"==this.options.tooltipPosition?"border-color: transparent #"+this.options.tooltipBackgroundColor+" transparent transparent;":"border-color: transparent transparent transparent #"+this.options.tooltipBackgroundColor;marginRight=parseInt(this.options.tooltipWidth)+parseInt(this.options.tooltipOffset),myhtml=t('<div class="syco_tooltip" data-tooltip="'+thisid+'" style="'+o+"padding:"+this.options.tooltipPadding+"px;top:"+firstoffset+"px;position:absolute;background:#"+this.options.tooltipBackgroundColor+";"+this.options.tooltipPosition+":-"+marginRight+"px;width:"+this.options.tooltipWidth+'px" ><span class="triangle_'+this.options.tooltipPosition+'" style="'+e+'"></span><p style="'+$display2+"font-size:"+this.options.tooltipFontSize+"px;color:#"+this.options.tooltipFontColor+'"><span class="tooltip_helper"><span data-index="1" >1</span>/'+items+"</span> "+firsthelper+'</p><div class="percentagebar" style="'+$display+"background:#"+this.options.progressBarBackground+'""><div class="percentagebarinner" style="'+n+"background:#"+this.options.progressBarColor+'"></div><span class="percent" '+$display+">0%</span></div></div>"),this.$elem.prepend(myhtml),thiswidth=this.$elem.find(".syco_tooltip").width(),data_prog.each(function(){var o=t(this),n=o.position().top;o.bind("live focus change",function(){thisprogressionlength=o.parent().parent().find("[data-progression]").length,alldataprogression=o.parent().parent().find("[data-progression]"),thisid2=o.parent().parent().attr("id"),thistooltip=t('[data-tooltip="'+thisid2+'"]'),thishelper=o.attr("data-helper"),thishelper=o.attr("data-helper")!==s?o.attr("data-helper"):"",index=parseInt(t("#"+thisid2).find("[data-progression]").index(o))+1,percentage=i(thisprogressionlength,index).toFixed(0),thistooltip.find("p").html('<span class="tooltip_helper"><span data-index="1" >'+index+"</span>/"+thisprogressionlength+"</span> "+thishelper).parent().find(".percentagebarinner").css("width",parseInt(percentage)+"%").next().html(parseInt(percentage)+"%"),thistooltip.css("top",n+"px")})})},yourOtherFunction:function(){}},t.fn[e]=function(i){return this.each(function(){t.data(this,"plugin_"+e)||t.data(this,"plugin_"+e,new n(this,i))})}}(jQuery,window,document);