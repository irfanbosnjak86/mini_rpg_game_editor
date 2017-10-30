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

  // Handling the bug with bootstrap-modal
  $('#myModal').on("click", "#submit-attr-form, button[data-dismiss='modal']", function(){ 
    $(".modal-backdrop").remove(); 
  })

  // Remove delete attr element
  $(document).on('click', ".delete-attr", function(e){
    var char_attr_id = $(this).attr("data-char-attr");
    $("#char-attr-" + char_attr_id).remove();
  });

  // Remove delete char element
  $(document).on('click', ".delete-char", function(){
    var char_id = $(this).attr("data-char-id");
    $(".col-md-6 .panel-primary#char-" + char_id).remove();
  });

  // Carrierwave Issue
  // Usefull link: https://quickleft.com/blog/how-to-upload-to-carrierwave-with-javascript/
  $(document).on('click', "#submit-attr-form", function(e){
    var url = $("#attr-form").attr("action");
    var requestType = $("#attr-form").attr("method");
    var formData = new FormData($("#attr-form")[0]);

    e.preventDefault();

    $.ajax({
      url: url,
      data: formData,
      processData: false,
      contentType: false,
      type: requestType,
      dataType: "script"
    });
  });

  // Displaying the Add Attribute button after modal dissmiss
  $(document).on("click", "[data-dismiss=modal]", function() {
    $("#add-attribute").show();
  });

  // Character Type Avatar Preview
   $("#char-type-form").on("change", "#char-attr-avatar", function(event) {
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
  });

  // Character Attributes Avatar Preview
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
  });

  // hiding the notifications and alert messages

  $(".alert-danger").fadeTo(4000, 500).slideUp(500, function(){
    $(".alert-danger").slideUp(500);
  });

  $(".alert-success").fadeTo(3000, 500).slideUp(500, function(){
    $(".alert-success").slideUp(500);
  });
});
