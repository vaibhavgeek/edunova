/*!
 * froala_editor v2.2.4 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2016 Froala Labs
 */
!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):"object"==typeof module&&module.exports?module.exports=function(e,o){return void 0===o&&(o="undefined"!=typeof window?require("jquery"):require("jquery")(e)),t(o),o}:t(jQuery)}(function(t){"use strict";t.extend(t.FE.POPUP_TEMPLATES,{"forms.edit":"[_BUTTONS_]","forms.update":"[_BUTTONS_][_TEXT_LAYER_]"}),t.extend(t.FE.DEFAULTS,{formEditButtons:["inputStyle","inputEdit"],formStyles:{"fr-rounded":"Rounded","fr-large":"Large"},formMultipleStyles:!0,formUpdateButtons:["inputBack","|"]}),t.FE.PLUGINS.forms=function(e){function o(o){o.preventDefault(),e.selection.clear(),t(this).data("mousedown",!0)}function n(e){t(this).data("mousedown")&&(e.stopPropagation(),t(this).removeData("mousedown"),g=this,p(this)),e.preventDefault()}function u(){e.$el.find("input, textarea, button").removeData("mousedown")}function s(){t(this).removeData("mousedown")}function r(){e.events.$on(e.$el,e._mousedown,"input, textarea, button",o),e.events.$on(e.$el,e._mouseup,"input, textarea, button",n),e.events.$on(e.$el,"touchmove","input, textarea, button",s),e.events.$on(e.$el,e._mouseup,u),e.events.$on(e.$win,e._mouseup,u),l(!0)}function i(){return g?g:null}function a(){var t="";e.opts.formEditButtons.length>0&&(t='<div class="fr-buttons">'+e.button.buildList(e.opts.formEditButtons)+"</div>");var o={buttons:t},n=e.popups.create("forms.edit",o);return e.$wp&&e.events.$on(e.$wp,"scroll.link-edit",function(){get()&&e.popups.isVisible("forms.edit")&&p(i())}),n}function p(o){var n=e.popups.get("forms.edit");n||(n=a()),g=o;var u=t(o);e.popups.refresh("forms.edit"),e.popups.setContainer("forms.edit",t(e.opts.scrollableContainer));var s=u.offset().left+u.outerWidth()/2,r=u.offset().top+u.outerHeight();e.popups.show("forms.edit",s,r,u.outerHeight())}function f(){var o=e.popups.get("forms.update"),n=i();if(n){var u=t(n);u.is("button")?o.find('input[type="text"][name="text"]').val(u.text()):o.find('input[type="text"][name="text"]').val(u.attr("placeholder"))}o.find('input[type="text"][name="text"]').trigger("change")}function d(){g=null}function l(t){if(t)return e.popups.onRefresh("forms.update",f),e.popups.onHide("forms.update",d),!0;var o="";e.opts.formUpdateButtons.length>=1&&(o='<div class="fr-buttons">'+e.button.buildList(e.opts.formUpdateButtons)+"</div>");var n="",u=0;n='<div class="fr-forms-text-layer fr-layer fr-active">',n+='<div class="fr-input-line"><input name="text" type="text" placeholder="Text" tabIndex="'+ ++u+'"></div>',n+='<div class="fr-action-buttons"><button class="fr-command fr-submit" data-cmd="updateInput" href="#" tabIndex="'+ ++u+'" type="button">'+e.language.translate("Update")+"</button></div></div>";var s={buttons:o,text_layer:n},r=e.popups.create("forms.update",s);return r}function c(){var o=i();if(o){var n=t(o),u=e.popups.get("forms.update");u||(u=l()),e.popups.isVisible("forms.update")||e.popups.refresh("forms.update"),e.popups.setContainer("forms.update",t(e.opts.scrollableContainer));var s=n.offset().left+n.outerWidth()/2,r=n.offset().top+n.outerHeight();e.popups.show("forms.update",s,r,n.outerHeight())}}function m(o,n,u){"undefined"==typeof n&&(n=e.opts.formStyles),"undefined"==typeof u&&(u=e.opts.formMultipleStyles);var s=i();if(!s)return!1;if(!u){var r=Object.keys(n);r.splice(r.indexOf(o),1),t(s).removeClass(r.join(" "))}t(s).toggleClass(o)}function v(){e.events.disableBlur(),e.selection.restore(),e.events.enableBlur();var t=i();t&&e.$wp&&("BUTTON"==t.tagName&&e.selection.restore(),p(t))}function h(){var o=e.popups.get("forms.update"),n=i();if(n){var u=t(n),s=o.find('input[type="text"][name="text"]').val()||"";s.length&&(u.is("button")?u.text(s):u.attr("placeholder",s)),e.popups.hide("forms.update"),p(n)}}function b(){r(),e.events.$on(e.$el,"submit","form",function(t){return t.preventDefault(),!1})}var g;return{_init:b,updateInput:h,getInput:i,applyStyle:m,showUpdatePopup:c,showEditPopup:p,back:v}},t.FE.RegisterCommand("updateInput",{undo:!1,focus:!1,title:"Update",callback:function(){this.forms.updateInput()}}),t.FE.DefineIcon("inputStyle",{NAME:"magic"}),t.FE.RegisterCommand("inputStyle",{title:"Style",type:"dropdown",html:function(){var t='<ul class="fr-dropdown-list">',e=this.opts.formStyles;for(var o in e)e.hasOwnProperty(o)&&(t+='<li><a class="fr-command" data-cmd="inputStyle" data-param1="'+o+'">'+this.language.translate(e[o])+"</a></li>");return t+="</ul>"},callback:function(t,e){var o=this.forms.getInput();o&&(this.forms.applyStyle(e),this.forms.showEditPopup(o))},refreshOnShow:function(e,o){var n=this.forms.getInput();if(n){var u=t(n);o.find(".fr-command").each(function(){var e=t(this).data("param1");t(this).toggleClass("fr-active",u.hasClass(e))})}}}),t.FE.DefineIcon("inputEdit",{NAME:"edit"}),t.FE.RegisterCommand("inputEdit",{title:"Edit Button",undo:!1,refreshAfterCallback:!1,callback:function(){this.forms.showUpdatePopup()}}),t.FE.DefineIcon("inputBack",{NAME:"arrow-left"}),t.FE.RegisterCommand("inputBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.forms.back()}}),t.FE.RegisterCommand("updateInput",{undo:!1,focus:!1,title:"Update",callback:function(){this.forms.updateInput()}})});