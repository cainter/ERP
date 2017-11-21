//侧边导航栏
$(function() {
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {
			el: this.el,
			multiple: this.multiple
		}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
		$this = $(this),
			$next = $this.next();
		$next.slideToggle();
		$this.parent().toggleClass('open');

		if(!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}

	var accordion = new Accordion($('.accordion'), false);
});

$(document).ready(function(){
	$('.accordion').load('side-menu/client-side.html');
});

var client = $('#client'),
	make = $('#make'),
	cooperator = $('#cooperator'),
	purchase = $('#purchase'),
	stock = $('#stock'),
	accounts = $('#accounts'),
	profit = $('#profit'),
	statistics = $('#statistics'),
	data = $('#data'),
	teamwork = $('#teamwork'),
	system = $('#system'),
	accordion = $('.accordion');
$('.nav-menu li a').bind("click",function(){
	$('.nav-menu li a').css("color","#505050");
	$(this).css("color","#D9534F");
});
client.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#client-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#client-side').attr('style', 'display: block;');
	accordion.load('side-menu/client-side.html');
});
make.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#make-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#make-side').attr('style', 'display: block;');
	accordion.load('side-menu/make-side.html');
});
cooperator.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#cooperator-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#cooperator-side').attr('style', 'display: block;');
	accordion.load('side-menu/cooperator-side.html');
});
purchase.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#purchase-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#purchase-side').attr('style', 'display: block;');
	accordion.load('side-menu/purchase-side.html');
});
stock.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#stock-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#stock-side').attr('style', 'display: block;');
	accordion.load('side-menu/stock-side.html');
});
accounts.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#accounts-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#accounts-side').attr('style', 'display: block;');
	accordion.load('side-menu/accounts-side.html');
});
profit.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#profit-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#profit-side').attr('style', 'display: block;');
	accordion.load('side-menu/profit-side.html');
});
statistics.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#statistics-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#statistics-side').attr('style', 'display: block;');
	accordion.load('side-menu/statistics-side.html');
});
data.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#data-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#data-side').attr('style', 'display: block;');
	accordion.load('side-menu/data-side.html');
});
teamwork.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#teamwork-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#teamwork-side').attr('style', 'display: block;');
	accordion.load('side-menu/teamwork-side.html');
});
system.click(function() {
//	$('.accordion').css('display', 'none');
//	$('#system-side').find('.submenu').slideUp().parent().removeClass('open');
//	$('#system-side').attr('style', 'display: block;');
	accordion.load('side-menu/system-side.html');
});