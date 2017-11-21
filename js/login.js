
$(function(){
	if($(window).width()<1300 && $(window).width()>900)
	{
		$("._list").css("padding-left",($(window).width()-680)/2-10+"px");
		$("._about").css({"padding-left":($(window).width()-680)/2-10+"px"});
		$("._about dl").css("margin-left","4px");
		$("._two_code1").css("right",($(window).width()-600)/2-40+"px");
	}else if($(window).width()<900)
	{
		$("._list").css("padding-left","0");
		$("._about").css("padding-left","0");
		$("._two_code1").css("right",($(window).width()-600)/2-40+"px");
	}
	$(window).resize(function(){
		if($(window).width()<1300 && $(window).width()>900)
		{
			$("._list").css("padding-left",($(window).width()-680)/2-10+"px");
			$("._about").css({"padding-left":($(window).width()-680)/2-10+"px"});
			$("._about dl").css("margin-left","4px");
			$("._two_code1").css("right",($(window).width()-600)/2-40+"px");
		}else if($(window).width()<900)
		{
			$("._list").css("padding-left","0");
			$("._about").css("padding-left","0");
			$("._about dl").css("margin-left","4px");
			$("._two_code1").css("rigt",($(window).width()-600)/2-40+"px");
		}else
		{
			$("._list").css("padding-left","395px");
			$("._about").css("padding-left","160px");
			$("._about dl").css("margin-left","40px");
			$("._two_code1").css("right","130px");
		}
	});
	$("#data-login").click(function(){
		//alert(1);
		$("._register_box").css("display","none");
		$("._login_box").fadeIn();
	});
	$("#data-register").click(function(){
		//alert(1);
		$("._login_box").css("display","none");
		$("._register_box").fadeIn();
	});
})