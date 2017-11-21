$(function(){
//设置div根据像素变化，包括导航条的宽度，菜单的宽度和高度，以及当页面像素过低时，导航条字体大小和间距也变小
if($(window).width()>1000)
{
	$("._nav").css({"width":$(window).width()-200+"px","left":"200px"});
	$("._menu").css({"width":"200px","height":$(window).height()-80+"px"});
	$("._content").css({"width":$(window).width()-200+"px"});
}else{
	$("._nav").css({"width":"800px","left":"200px"});
	$("._menu").css({"width":"200px","height":$(window).height()-80+"px"});
	$("._content").css({"width":"800px"});
}
if($(window).width()<1100)
{
	$(".erp_navList li").css({"font-size":"14px","margin-left":"6px"});
}else
{
	$(".erp_navList li").css({"font-size":"18px","margin-left":"14px"});
}
$(window).resize(function(){
	if($(window).width()>1000)
	{
		$("._nav").css({"width":$(window).width()-200+"px","left":"200px"});
		$("._menu").css({"width":"200px","height":$(window).height()-80+"px"});
		$("._content").css({"width":$(window).width()-200+"px"});
		//alert(menuWidth);
	}else{
		$("._nav").css({"width":"800px","left":"200px"});
		$("._menu").css({"width":"200px","height":$(window).height()-80+"px"});
		$("._content").css({"width":"800px"});
	}
	if($(window).width()<1100)
	{
		$(".erp_navList li").css({"font-size":"14px","margin-left":"6px"});
	}else
	{
		$(".erp_navList li").css({"font-size":"18px","margin-left":"14px"});
	}
});
//导入将菜单和内容导入iframe中
//定义菜单栏和内容模块的高度和宽度
var menuHeight=$(window).height()-160;
var menuWidth=$("._menu").width();
var contentHeight=$(window).height()+$(window).scrollTop()-160;
var contentWidth=$(window).width()+$(window).scrollLeft()-220;
//当屏幕宽度小于1100时，content的iframe宽度为800px
if($(window).width()<1100)
{
	contentWidth=800;
}
//alert($(window).width()-220+"  "+contentWidth+" "+$(window).scrollTop());
//alert(contentHeight);
$("._menu").append("<iframe id='menu-iframe' src='client_menu.html' frameborder='0' height='"+menuHeight+"px' width='"+menuWidth+"px' ></iframe>");
$("._content").append("<iframe id='content-iframe' src='client_content.html' frameborder='0' width='"+contentWidth+"px' height='"+contentHeight+"px'></iframe>");
//在改变窗口大小时，刷新整个页面
$(window).bind("resize",function(){
	window.location.reload();
})
//当屏幕点击之后，窗口不在刷新
$(window).click(function(){
	$(this).unbind();
});
$("iframe").load(function(){
	$(this).contents().find("body").bind("click",function(){
		$(window).unbind();
	});
});
//点击导航栏按钮，改变菜单栏内容，加载iframe页面
$(".erp_navList li a").bind("click",function(){
	$(".erp_navList li a").css("color","#696969");
	$(this).css("color","red");
});
$("#client").click(function(){
	//客户业务
	$("#menu-iframe").attr("src","client_menu.html");
	$("#content-iframe").attr("src","client_content.html");
});
$("#make").click(function(){
	//加工制作
	$("#menu-iframe").attr("src","make_menu.html");
	$("#content-iframe").attr("src","make_content.html");
});
$("#cooperator").click(function(){
	//标识汇交易
	$("#menu-iframe").attr("src","cooperator_menu.html");
	$("#content-iframe").attr("src","cooperator_content.html");
});
$("#purchase").click(function(){
	//采购管理
	$("#menu-iframe").attr("src","purchase_menu.html");
	$("#content-iframe").attr("src","purchase_content.html");
});
$("#stock").click(function(){
	//库存管理
	$("#menu-iframe").attr("src","stock_memu.html");
	$("#content-iframe").attr("src","stock_content.html");
});
$("#accounts").click(function(){
	//财务管理
	$("#menu-iframe").attr("src","accouns_menu.html");
	$("#content-iframe").attr("src","accounts_content.html");
});
$("#profit").click(function(){
	//产值管理
	$("#menu-iframe").attr("src","profit_menu.html");
	$("#content-iframe").attr("src","profit_content.html");
});
$("#statistics").click(function(){
	//统计报表
	$("#menu-iframe").attr("src","statistics_menu.html");
	$("#content-iframe").attr("src","statistics_content.html");
});
$("#data").click(function(){
	//基础数据
	$("#menu-iframe").attr("src","make_menu.html");
	$("#content-iframe").attr("src","make_content.html");
});
$("#teamwork").click(function(){
	//团队管理
	$("#menu-iframe").attr("src","teamwork_memu.html");
	$("#content-iframe").attr("src","teamwork_content.html");
});
$("#system").click(function(){
	//系统管理
	$("#menu-iframe").attr("src","system_menu.html");
	$("#content-iframe").attr("src","system_content.html");
});
//在主界面中加载二级页面
$("#content-iframe").load(function(){
	$(this).contents().find("#_select_customer").bind("click",function(){
		$("._modal").css("left",($(window).width()-$("._modal").width())/2+$(window).scrollLeft()+"px");
		$("._modal").css("top",($(window).height()-$("._modal").height())/2+$(window).scrollTop()+"px");
		if($(window).scrollTop()==0)
		{
			$("._modal").css("top",20+"px");
		}
		$("._shade").css("display","block").show();
		$("._modal").fadeIn();
		});
	});
	
})