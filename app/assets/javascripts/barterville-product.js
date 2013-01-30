$(function() {
	$('div.clipped-image').click(expandImage);
});
	
function expandImage () {
	$('div.clipped-image').animate({height: '600px'});
}