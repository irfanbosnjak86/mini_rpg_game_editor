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
    var char_attr_id = $(this).attr("data-char-attr");

    if(char_attr_id) {
      var url = "/character_types/" + char_id + "/character_attributes/" + char_attr_id
    }
    else{
      var url = "/character_types/" + char_id + "/character_attributes/"
    }

    e.preventDefault();

    $.ajax({
      url: url,
      data: $("#attr-form").serialize(),
      type: "POST",
      dataType: "script"
    });
  });

  $(document).on('click', "#edit-attr-form", function(e){
    var char_id = $(this).attr("data-char-id");
    var char_attr_id = $(this).attr("data-char-attr");


      var url = "/character_types/" + char_id + "/character_attributes/" + char_attr_id

    e.preventDefault();

    $.ajax({
      url: url,
      data: $("#attr-form").serialize(),
      type: "PUT",
      dataType: "script"
    });
  });

  // Displaying the Add Attribute button after modal dissmiss
  $(document).on("click", "[data-dismiss=modal]", function() {
    $("#add-attribute").show();
  });


  // Character Attributes Image preview
  $(document).on("click", "#logoSelect" ,function(){
    $("#char-attr-avatar").click();
  });

  $("#myModal").on("change", "#char-attr-avatar", function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      img.className = "char-image"
      $('#imagePreview').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
});
