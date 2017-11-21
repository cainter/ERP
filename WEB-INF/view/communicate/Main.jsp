<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0038)http://115.28.87.22:8888/bbs/Main.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>信息公告 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css"><script src="js/popup_ext.js"></script><script language="javascript">
/* 	function doCancel(){
		window.close();
	} */
/* 	function doInit(){
		document.getElementById("rightDiv").style.width=(document.getElementById("mainDiv").clientWidth-document.getElementById("leftDiv").offsetWidth)+"px";
    	/* 
		var defaultUrl=encodeURIComponent("");
    	var defaultId="";
    	 */
    	var url="main_toBbsColumnList"
    	document.getElementById("leftFrame").src=url;
	} */
	//子窗口调用
	/* function doDelAcc(id){
		if(popRetVal!=null){
			document.getElementById("mainFrame").contentWindow.doItemDeleteAct(id);
		}
	}
	function refreshColWin(){
		if(popRetVal!=null){
			document.getElementById("leftFrame").src="./BbsColumnList.html?default_id="+popRetVal;
		}
	}
	function doDelCol(id){
		if(popRetVal!=null){
			document.getElementById("leftFrame").src="./BbsColumnDelete.html?id="+id;
		}
	}
	function doDelRep(id){
		if(popRetVal!=null){
			document.getElementById("mainFrame").src="./BbsArticleDelete.html?id="+id;
		}
	}
	function doDelTopic(id){
		if(popRetVal!=null){
			document.getElementById("mainFrame").contentWindow.doDeleteAct(id);
		}
	}
	function showAddedAcc(){
		if(popRetVal!=null){
			document.getElementById("mainFrame").contentWindow.showAddedAccAct(popRetVal[0],popRetVal[1]);
		}
	}
	function refreshArtWin(){
		document.getElementById("mainFrame").contentWindow.refreshWin();
	} */
</script></head>



<body class="sheet" style="text-align:center;" oncontextmenu="return false" onload="doInit();">
<div class="sheet-main" style="width:950px; text-align:left;margin:auto;">
	<div class="sheet-top">
	  <div class="content">
	    <h2>信息公告</h2>
	    <p>公告是对全体员工公开的信息，所有登录系统的人员都可以在桌面看到最近一周发布的公告，可以进行回复，发表自己的意见</p>
	  </div>
	</div>

	<div class="sheet-list" id="mainDiv" style="height:468px;">	
		<div class="nav" id="leftDiv" style="float:left;height:100%;">
			<iframe width="100%" height="100%" scrolling="no" frameborder="0" id="leftFrame" src="main_toBbsColumnList"></iframe>
		</div>
		<div class="main search-business" id="rightDiv" style="float: left; height: 100%; width: 756px;">
			<iframe width="100%" height="100%" scrolling="no" frameborder="0" name="mainFrame" id="mainFrame" src="main_toBbsTopicList"></iframe>
		</div>
  </div>
  <div class="blank12"></div>
</div>


<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>