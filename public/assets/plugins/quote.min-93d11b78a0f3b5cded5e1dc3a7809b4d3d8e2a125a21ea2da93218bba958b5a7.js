/*!
 * froala_editor v2.2.4 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2016 Froala Labs
 */


!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof module&&module.exports?module.exports=function(b,c){return void 0===c&&(c="undefined"!=typeof window?require("jquery"):require("jquery")(b)),a(c),c}:a(jQuery)}(function(a){"use strict";a.FE.PLUGINS.quote=function(b){function c(a){for(;a.parentNode&&a.parentNode!=b.$el.get(0);)a=a.parentNode;return a}function d(){var d,e=b.selection.blocks();for(d=0;d<e.length;d++)e[d]=c(e[d]);b.selection.save();var f=a("<blockquote>");for(f.insertBefore(e[0]),d=0;d<e.length;d++)f.append(e[d]);b.html.unwrap(),b.selection.restore()}function e(){var c,d=b.selection.blocks();for(c=0;c<d.length;c++)"BLOCKQUOTE"!=d[c].tagName&&(d[c]=a(d[c]).parentsUntil(b.$el,"BLOCKQUOTE").get(0));for(b.selection.save(),c=0;c<d.length;c++)d[c]&&a(d[c]).replaceWith(d[c].innerHTML);b.html.unwrap(),b.selection.restore()}function f(a){b.selection.save(),b.html.wrap(!0,!0,!0,!0),b.selection.restore(),"increase"==a?d():"decrease"==a&&e()}return{apply:f}},a.FE.RegisterShortcut(222,"quote","increase"),a.FE.RegisterShortcut(222,"quote","decrease",!0),a.FE.RegisterCommand("quote",{title:"Quote",type:"dropdown",options:{increase:"Increase",decrease:"Decrease"},callback:function(a,b){this.quote.apply(b)},plugin:"quote"}),a.FE.DefineIcon("quote",{NAME:"quote-left"})});
