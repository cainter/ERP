
$(function(){
	$("._footer").css("height",$(window).height()-600+"px");
	if($(window).width()<1300 && $(window).width()>900)
	{
		$("._list").css("padding-left",($(window).width()-880)/2-10+"px");
		$("._about").css({"padding-left":($(window).width()-880)/2-10+"px"});
		$("._about dl").css("margin-left","4px");
		$("._two_code").css("margin-right",($(window).width()-600)/2-40+"px");
	}else if($(window).width()<900)
	{
		$("._list").css("padding-left","0");
		$("._about").css("padding-left","0");
		$("._two_code").css("margin-right",($(window).width()-600)/2-40+"px");
	}
	$(window).resize(function(){
		$("._footer").css("height",$(window).height()-600+"px");
		if($(window).width()<1300 && $(window).width()>900)
		{
			$("._list").css("padding-left",($(window).width()-880)/2-10+"px");
			$("._about").css({"padding-left":($(window).width()-880)/2-10+"px"});
			$("._about dl").css("margin-left","4px");
			$("._two_code").css("margin-right",($(window).width()-600)/2-40+"px");
		}else if($(window).width()<900)
		{
			$("._list").css("padding-left","0");
			$("._about").css("padding-left","0");
			$("._about dl").css("margin-left","4px");
			$("._two_code").css("margin-right",($(window).width()-600)/2-40+"px");
		}else
		{
			$("._list").css("padding-left","195px");
			$("._about").css("padding-left","160px");
			$("._about dl").css("margin-left","40px");
			$("._two_code").css("margin-right","130px");
		}
	});
})