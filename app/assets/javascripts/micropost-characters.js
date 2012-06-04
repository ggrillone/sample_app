$(document).ready(function() {
	var chars_left = 140;
	var chars_typed = 0;
	$("#micropost_content").keypress(function() {
		var chars_total = 140;

		chars_typed = $(this).val().length;
		chars_left = chars_total - chars_typed;
		$(".characters-left").html(chars_left);
	});
});