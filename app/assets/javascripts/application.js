// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function(){

  // Removing or Hiding the form depending on action performed
  $(document).on('click', "#attr-cancel", function(e){
    $("#add-attribute").show();
    var char_attr_id = $(this).attr("data-char-attr")
    var char_id = $(this).attr("data-char-id")

    if($(".attr-form-" + char_attr_id)) {
      $(".attr-form-" + char_attr_id).remove();
      $("#char-attr-" + char_attr_id).children().show();
    }
    else if($(".attr-form-")){
      $(".attr-form-").remove();
    }
  });
});