/*!
 * froala_editor v2.2.4 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2016 Froala Labs
 */
!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n),n}:e(jQuery)}(function(e){"use strict";e.extend(e.FE.DEFAULTS,{dragInline:!0}),e.FE.PLUGINS.draggable=function(t){function n(n){return e(n.target).hasClass("fr-draggable")?(e(n.target).addClass("fr-dragging"),t.opts.dragInline?t.$el.attr("contenteditable",!0):t.$el.attr("contenteditable",!1),t.opts.toolbarInline&&t.toolbar.hide(),t.undo.canDo()||t.undo.saveStep(),t.browser.msie||t.browser.edge||t.selection.clear(),void n.originalEvent.dataTransfer.setData("text","Froala")):(n.preventDefault(),!1)}function r(e){return!(e&&("HTML"==e.tagName||"BODY"==e.tagName||t.node.isElement(e)))}function a(e,n,r){t.opts.iframe&&(e+=t.$iframe.offset().top,n+=t.$iframe.offset().left),p.offset().top!=e&&p.css("top",e),p.offset().left!=n&&p.css("left",n),p.width()!=r&&p.css("width",r)}function o(n){var o=t.doc.elementFromPoint(n.originalEvent.pageX-t.win.pageXOffset,n.originalEvent.pageY-t.win.pageYOffset);if(!r(o)){for(var i=0,f=o;!r(f)&&f==o&&n.originalEvent.pageY-t.win.pageYOffset-i>0;)i++,f=t.doc.elementFromPoint(n.originalEvent.pageX-t.win.pageXOffset,n.originalEvent.pageY-t.win.pageYOffset-i);(!r(f)||p&&0===t.$el.find(f).length&&f!=p.get(0))&&(f=null);for(var s=0,l=o;!r(l)&&l==o&&n.originalEvent.pageY-t.win.pageYOffset+s<e(t.doc).height();)s++,l=t.doc.elementFromPoint(n.originalEvent.pageX-t.win.pageXOffset,n.originalEvent.pageY-t.win.pageYOffset+s);(!r(l)||p&&0===t.$el.find(l).length&&l!=p.get(0))&&(l=null),o=null==l&&f?f:l&&null==f?l:l&&f?s>i?f:l:null}if(e(o).hasClass("fr-drag-helper"))return!1;if(o&&!t.node.isBlock(o)&&(o=t.node.blockParent(o)),o&&["TD","TH","TR","THEAD","TBODY"].indexOf(o.tagName)>=0&&(o=e(o).parents("table").get(0)),o&&["LI"].indexOf(o.tagName)>=0&&(o=e(o).parents("UL, OL").get(0)),o&&!e(o).hasClass("fr-drag-helper")){p||(e.FE.$draggable_helper||(e.FE.$draggable_helper=e('<div class="fr-drag-helper"></div>')),p=e.FE.$draggable_helper,t.events.on("shared.destroy",function(){p.html("").removeData().remove()},!0));var g,d=n.originalEvent.pageY;g=d<e(o).offset().top+e(o).outerHeight()/2;var v=e(o),u=0;g||0!==v.next().length?(g||(v=v.next()),"before"==p.data("fr-position")&&v.is(p.data("fr-tag"))||(v.prev().length>0&&(u=parseFloat(v.prev().css("margin-bottom"))||0),u=Math.max(u,parseFloat(v.css("margin-top"))||0),a(v.offset().top-u/2-t.$box.offset().top,v.offset().left-t.win.pageXOffset-t.$box.offset().left,v.width()),p.data("fr-position","before"))):"after"==p.data("fr-position")&&v.is(p.data("fr-tag"))||(u=parseFloat(v.css("margin-bottom"))||0,a(v.offset().top+e(o).height()+u/2-t.$box.offset().top,v.offset().left-t.win.pageXOffset-t.$box.offset().left,v.width()),p.data("fr-position","after")),p.data("fr-tag",v),p.addClass("fr-visible"),p.appendTo(t.$box)}else p&&t.$box.find(p).length>0&&p.removeClass("fr-visible")}function i(e){e.originalEvent.dataTransfer.dropEffect="move",t.opts.dragInline?l()||!t.browser.msie&&!t.browser.edge||e.preventDefault():(e.preventDefault(),o(e))}function f(e){e.originalEvent.dataTransfer.dropEffect="move",t.opts.dragInline||e.preventDefault()}function s(e){t.$el.attr("contenteditable",!0);var n=t.$el.find(".fr-dragging");p&&p.hasClass("fr-visible")&&t.$box.find(p).length?g(e):n.length&&(e.preventDefault(),e.stopPropagation(),p&&!p.hasClass("fr-visible")&&n.removeClass("fr-dragging")),p&&t.$box.find(p).length&&p.removeClass("fr-visible")}function l(){for(var t=null,n=0;n<e.FE.INSTANCES.length;n++)if(t=e.FE.INSTANCES[n].$el.find(".fr-dragging"),t.length)return t.get(0)}function g(n){for(var r,a,o=0;o<e.FE.INSTANCES.length;o++)if(r=e.FE.INSTANCES[o].$el.find(".fr-dragging"),r.length){a=e.FE.INSTANCES[o];break}if(r.length){if(n.preventDefault(),n.stopPropagation(),p&&p.hasClass("fr-visible")&&t.$box.find(p).length)p.data("fr-tag")[p.data("fr-position")]('<span class="fr-marker"></span>'),p.removeClass("fr-visible");else{var i=t.markers.insertAtPoint(n.originalEvent);if(i===!1)return!1}if(t.popups.hideAll(),a==t||t.undo.canDo()||t.undo.saveStep(),t.core.isEmpty())t.$el.html(r);else{var f=t.$el.find(".fr-marker");f.replaceWith(r),r.after(e.FE.MARKERS),t.selection.restore()}return r.removeClass("fr-dragging"),t.$el.find(t.html.emptyBlockTagsQuery()).remove(),t.html.wrap(),t.undo.saveStep(),a!=t&&(a.popups.hideAll(),a.$el.find(t.html.emptyBlockTagsQuery()).remove(),a.html.wrap(),a.undo.saveStep(),a.events.trigger("element.dropped")),t.opts.iframe&&t.size.syncIframe(),t.events.trigger("element.dropped",[r]),!1}}function d(){t.opts.enter==e.FE.ENTER_BR&&(t.opts.dragInline=!0),t.events.on("dragstart",n,!0),t.events.on("dragover",i,!0),t.events.on("dragenter",f,!0),t.events.on("document.dragend",s,!0),t.events.on("document.drop",s,!0),t.events.on("drop",g,!0),t.events.on("html.get",function(e){return e=e.replace(/<(div)((?:[\w\W]*?))class="([\w\W]*?)fr-drag-helper([\w\W]*?)"((?:[\w\W]*?))>((?:[\w\W]*?))<\/(div)>/g,"")})}var p;return{_init:d}}});