/*!
 * froala_editor v2.2.4 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2016 Froala Labs
 */
!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(n,t){return void 0===t&&(t="undefined"!=typeof window?require("jquery"):require("jquery")(n)),e(t),t}:e(jQuery)}(function(e){"use strict";e.extend(e.FE.DEFAULTS,{fontFamily:{"Arial,Helvetica,sans-serif":"Arial","Georgia,serif":"Georgia","Impact,Charcoal,sans-serif":"Impact","Tahoma,Geneva,sans-serif":"Tahoma","Times New Roman,Times,serif":"Times New Roman","Verdana,Geneva,sans-serif":"Verdana"},fontFamilySelection:!1,fontFamilyDefaultSelection:"Font Family"}),e.FE.PLUGINS.fontFamily=function(n){function t(e){n.commands.applyProperty("font-family",e)}function i(e,n){n.find(".fr-command.fr-active").removeClass("fr-active"),n.find('.fr-command[data-param1="'+r()+'"]').addClass("fr-active");var t=n.find(".fr-dropdown-list"),i=n.find(".fr-active").parent();i.length?t.parent().scrollTop(i.offset().top-t.offset().top-(t.parent().outerHeight()/2-i.outerHeight()/2)):t.parent().scrollTop(0)}function o(n){var t=n.replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'| /g,"").split(",");return e.grep(t,function(e){return e.length>0})}function a(e,n){for(var t=0;t<e.length;t++)for(var i=0;i<n.length;i++)if(e[t]==n[i])return[t,i];return null}function r(){var t=e(n.selection.element()).css("font-family"),i=o(t),r=[];for(var f in n.opts.fontFamily)if(n.opts.fontFamily.hasOwnProperty(f)){var l=o(f),s=a(i,l);s&&r.push([f,s])}return 0===r.length?null:(r.sort(function(e,n){var t=e[1][0]-n[1][0];return 0===t?e[1][1]-n[1][1]:t}),r[0][0])}function f(t){if(n.opts.fontFamilySelection){var i=e(n.selection.element()).css("font-family").replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'|/g,"").split(",");t.find("> span").text(n.opts.fontFamily[r()]||i[0]||n.opts.fontFamilyDefaultSelection)}}return{apply:t,refreshOnShow:i,refresh:f}},e.FE.RegisterCommand("fontFamily",{type:"dropdown",displaySelection:function(e){return e.opts.fontFamilySelection},defaultSelection:function(e){return e.opts.fontFamilyDefaultSelection},displaySelectionWidth:120,html:function(){var e='<ul class="fr-dropdown-list">',n=this.opts.fontFamily;for(var t in n)n.hasOwnProperty(t)&&(e+='<li><a class="fr-command" data-cmd="fontFamily" data-param1="'+t+'" style="font-family: '+t+'" title="'+n[t]+'">'+n[t]+"</a></li>");return e+="</ul>"},title:"Font Family",callback:function(e,n){this.fontFamily.apply(n)},refresh:function(e){this.fontFamily.refresh(e)},refreshOnShow:function(e,n){this.fontFamily.refreshOnShow(e,n)},plugin:"fontFamily"}),e.FE.DefineIcon("fontFamily",{NAME:"font"})});