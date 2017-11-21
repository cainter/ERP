<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0046)http://115.28.87.22:8888/base/InnerPbMain.ihtm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>内部通讯录 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/base.css">
<script language="javascript">
	function doInit(){
		document.getElementById("mainDiv").style.width=(document.getElementById("mainTd").clientWidth-document.getElementById("navDiv").offsetWidth)+"px";
		document.getElementById("mainFrame").src="phone_toInnerPbList";
	}
</script></head>

<body oncontextmenu="return false" onload="doInit();" class="sheet" style="text-align:center;" scroll="no">
<div class="sheet-main" style="width:980px; text-align:left;margin:auto">
	<div class="sheet-top">
	  <div class="content">
	    <h2>内部通讯录</h2>
	    <p>在这里可以给同事发邮件、QQ、发手机短信，或者导出通讯录。（数据来源于部门与员工）</p>
	  </div>
	</div>
	<div class="sheet-list" id="mainTd" style="height:508px;">
		<div class="nav" id="navDiv" style="float:left;width:160px;height:100%;">
			<iframe width="100%" height="508px" frameborder="0" id="leftFrame" scrolling="no" src="phone_toDepartmentListForInnerPb"></iframe>
		</div>
		<div id="mainDiv" class="main search-business" style="float: left; height: 100%; width: 816px;">
			<iframe width="100%" height="100%" frameborder="0" scrolling="no" id="mainFrame" src="phone_toInnerPbList"></iframe>
		</div>
  </div>
  <div class="blank12"></div>
</div>
<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>