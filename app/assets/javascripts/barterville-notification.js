$(function() {
	$('div.closed').hide();
	$('body').on('click','.show-closed',showClosed);
	$('body').on('click','.hide-closed',hideClosed);

});
	function showClosed () {
		$('.show-closed').text('Hide Closed').removeClass('show-closed').addClass('hide-closed').removeClass('btn-success').addClass('btn-danger');
		$('.closed').slideDown();
	}

	function hideClosed () {
		$('.hide-closed').text('Show Closed').removeClass('hide-closed').addClass('show-closed').removeClass('btn-danger').addClass('btn-success');
		$('.closed').slideUp('slow');
	}