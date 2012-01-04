// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the BOTTOM of the
// the compiled file.

/*
Organization convention for require statements below:
1. jquery and jquery_ujs - include jquery tools
2. initialize - dark magic to prepare JS layout: @module implementation
3. layout - shows layout of JS modules and classes; declares static members (variables, methods)
4. folders - each folder is a MODULE after the standard "Application" module (e.g. memory/ means Application::Memory)
    *each file in a folder is a CLASS
5. specific files (e.g. memories.js.coffee) - these files use the classes defined in the folders

javascripts/
    application.js
    initialize.js.coffee
    layout.js.coffee - defines classes in general (static members)
    helpers.js.coffee - defines my personalized methods
    memories.js.coffee - uses things in memory/
    memory/
        form.js.coffee - class implementation of Application.Memory.Form
        index.js.coffee
    time_frames.js.coffee - uses things in time_frame
    time_frame/
        ...
    misc.js.coffee - uses things in misc/
    misc/
        flash.js.coffee
        
Other conventions:
_methodName is a private method in a js.coffee file
*/


//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require vendor
//= require darkmagic
//= require helpers
//= require layout
//= require_tree ../javascripts/memory/
//= require_tree ../javascripts/misc/
//= require memories
//= require time_frames
//= require misc

/* Functions below here are included LAST */

/* The following functions are for complex forms & work with methods in application_helper.rb*/
function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    // $(link).parent().before(content.replace(regexp, new_id));
    // $(link).parent().after(content.replace(regexp, new_id));
    $(link).last().after(content.replace(regexp, new_id));
}

function remove_fields(link, class_name) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest("."+class_name).hide();
}