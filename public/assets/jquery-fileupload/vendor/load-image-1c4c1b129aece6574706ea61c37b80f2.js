!function(e){"use strict";var t=function(e,n,i){var r,a,o=document.createElement("img");return o.onerror=n,o.onload=function(){!a||i&&i.noRevoke||t.revokeObjectURL(a),n(t.scale(o,i))},r=window.Blob&&e instanceof Blob||window.File&&e instanceof File?a=t.createObjectURL(e):e,r?(o.src=r,o):t.readFile(e,function(e){o.src=e})},n=window.createObjectURL&&window||window.URL&&URL.revokeObjectURL&&URL||window.webkitURL&&webkitURL;t.scale=function(e,t){t=t||{};var n=document.createElement("canvas"),i=e.width,r=e.height,a=Math.max((t.minWidth||i)/i,(t.minHeight||r)/r);return a>1&&(i=parseInt(i*a,10),r=parseInt(r*a,10)),a=Math.min((t.maxWidth||i)/i,(t.maxHeight||r)/r),1>a&&(i=parseInt(i*a,10),r=parseInt(r*a,10)),e.getContext||t.canvas&&n.getContext?(n.width=i,n.height=r,n.getContext("2d").drawImage(e,0,0,i,r),n):(e.width=i,e.height=r,e)},t.createObjectURL=function(e){return n?n.createObjectURL(e):!1},t.revokeObjectURL=function(e){return n?n.revokeObjectURL(e):!1},t.readFile=function(e,t){if(window.FileReader&&FileReader.prototype.readAsDataURL){var n=new FileReader;return n.onload=function(e){t(e.target.result)},n.readAsDataURL(e),n}return!1},"function"==typeof define&&define.amd?define(function(){return t}):e.loadImage=t}(this);