(function(a){return a.fn.phitBorder=function(b){var c,d;return c=a(window),d=a.extend({minWidth:Number.NEGATIVE_INFINITY,maxWidth:Number.POSITIVE_INFINITY,sides:["top","bottom","left","right"],container:""},b),this.each(function(){var b;return b=a(this),function(a){var b,e;return a(),c[(b=(e=d.resizeEvent)!=null?e:c.smartresize?"smartresize":void 0)!=null?b:"resize"](a)}(a.proxy(function(){var c,e,f,g,h;b=a(this),g=d.sides,h=[];for(e=0,f=g.length;e<f;e++)c=g[e],h.push(function(a){var c,e,f;return b.css("border-"+a+"-width",Math.max(Math.min(((c=(e=d.ratio)!=null?e:b.data("phitBorder."+a+".ratio"))!=null?c:function(c){return b.data("phitBorder."+a+".ratio",c),c}(parseFloat(b.css("border-"+a+"-width"))/d.refWidth))*((f=typeof d.container==="function"?d.container():void 0)!=null?f:b.parents(d.container)).width(),parseFloat(d.maxWidth)),parseFloat(d.minWidth)))}(c));return h},b))}),this}})(jQuery);