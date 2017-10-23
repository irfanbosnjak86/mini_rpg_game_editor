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
//= require_tree .


$(function(){

  // Removing or Hiding the char attr form depending on action performed
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

  // Ajax delete attr
  $(document).on('click', ".delete-attr", function(e){
    var char_attr_id = $(this).attr("data-char-attr");
    var char_id = $(this).attr("data-char-id");
    var url = $(this).attr("href");

    $.ajax({
      url: url,
      data: { character_type_id: char_id,
              id: char_attr_id
              },
      type: "DELETE",
      success: function() {
        $("#char-attr-" + char_attr_id).remove();
      },
      dataType: "script"
    });
  });

    // Ajax delete attr
  $(document).on('click', ".delete-char", function(){
    var char_id = $(this).attr("data-char-id");
    $(".col-md-6 .panel-primary#char-" + char_id).remove();
  });

  // Carrierwave Issue
  $(document).on('click', "#submit-attr-form", function(e){
    var char_id = $(this).attr("data-char-id");
    var url = "/character_types/" + char_id + "/character_attributes/"
    e.preventDefault();

    $.ajax({
      url: url,
      data: $("#attr-form").serialize(),
      type: "POST",
      dataType: "script"
    });
  });
});