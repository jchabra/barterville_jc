$(function(){
	//nav
	$('ul.nav li').hover(toggleActiveState);

	function toggleActiveState () {
		$(this).toggleClass('active');
	}

	//product trade section
	$('div.tradeable-products').hide();
	$('.product-trading h3.btn').click(showTradeableProducts);

	function showTradeableProducts (e) {
		e.preventDefault();
		$('div.tradeable-products').show();
		$('.product-trading h3.btn').hide();
	}
});