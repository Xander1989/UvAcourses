$(document).ready(function() {
recent = 0;
  $('.accordion-toggle').click(function() {

  	// show only last clicked course
	$('.collapse.in').collapse('hide');

	// send data to update recently viewed courses
	recent += $(this).data('target'); 
	jQuery.ajax({
  	  data: 'id=' + recent,
  	  dataType: 'script',
  	  type: 'post',
  	  url: "/recent"
	});
  });
});