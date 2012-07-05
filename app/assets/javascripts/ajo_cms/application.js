// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require_tree .

jQuery(function($){
   $(".phone").mask("(999) 999-9999");
   $('#myCarousel').carousel()
   $('.dropdown-toggle').dropdown()
   $('.datepicker').datepicker()
   $('tbody.sort').sortable({
         axis: 'y',
         helper: fixHelper,
         update: function() {
            return $.post($(this).data('update-url'), $(this).sortable('serialize'))
         }
   })

   $('.modal-backdrop:not(.admin)').click(function() {
   		url = $(this).data('url')
   		window.location = url
   })

   $(document).keyup(function(e) {
   		if (e.keyCode == 27) {
   			url = $('.modal-backdrop').data('url')
   			if (url != undefined) {
   				window.location = url;
   			}
   		}

   		if (e.keyCode == 39) {
   			url = $('.modal-backdrop').data('next')
   			if (url != undefined) {
   				window.location = url;
   			}
   		}

   		if (e.keyCode == 37) {
   			url = $('.modal-backdrop').data('last')
   			if (url != undefined) {
   				window.location = url
		   }
   		}

   })

});

var ImageCropper;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
jQuery(function() {
  return new ImageCropper();
});
ImageCropper = (function() {
  function ImageCropper() {
    this.update = __bind(this.update, this);    $('#cropbox').Jcrop({
      aspectRatio: 2.7,
      setSelect: [0, 0, 200, 540],
      onSelect: this.update,
      onChange: this.update
    });
  }
  ImageCropper.prototype.update = function(coords) {
    $('#post_crop_x').val(coords.x);
    $('#post_crop_y').val(coords.y);
    $('#post_crop_w').val(coords.w);
    return $('#post_crop_h').val(coords.h);
  };
  return ImageCropper;
})();


var fixHelper;
fixHelper = function(e, tr) {
  var $helper, $originals;
  $originals = tr.children();
  $helper = tr.clone();
  $helper.children().each(function(index) {
    return $(this).width($originals.eq(index).width());
  });
  return $helper;
};
