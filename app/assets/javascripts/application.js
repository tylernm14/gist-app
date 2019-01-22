// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require data-confirm-modal
//= require codemirror
// require codemirror/modes/ruby
// require codemirror/modes/python
//= require codemirror/keymaps/vim

//= require_tree .

window.setTimeout(function() {
    $(".alert-info").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
}, 4000);
window.setTimeout(function() {
    $(".alert-success").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
}, 4000);