<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>部门与员工 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<script src="js/popup_ext.js"></script><script language="javascript">
	function doInit(){
		document.getElementById("rightDiv").style.width=(document.getElementById("mainDiv").clientWidth-document.getElementById("leftDiv").offsetWidth)+"px";
		document.getElementById("mainFrame").src="departStaff_toStafferList";
	}
	//子窗口使用的函数
	function refreshStaWin(){
		document.getElementById("mainFrame").contentWindow.refreshWin();
	}
	function doDelSta(id){
		if(popRetVal!=null){
			document.getElementById("mainFrame").contentWindow.doDelAct(id);
		}
	}
	function refreshDepWin(){
		if(popRetVal!=null){
			document.getElementById("leftFrame").contentWindow.refreshWin(popRetVal);
		}
	}
	function doDelDep(id){
		if(popRetVal!=null){
			document.getElementById("leftFrame").contentWindow.doDelAct(id);
		}
	}
</script></head>


<body oncontextmenu="return false" class="sheet" onload="doInit();" style="text-align:center;" scroll="no">
<div class="sheet-main" style="width:850px; text-align:left;margin:auto;">
	<div class="sheet-top">
	  <div class="content">
	    <h2>部门与员工</h2>
	    <p>管理部门与员工信息</p>
	  </div>
	</div>

	<div class="sheet-list" id="mainDiv" style="height:508px;">
		
		<div class="nav" id="leftDiv" style="float:left;width:160px;height:100%;">
			<iframe id="leftFrame" scrolling="no" src="departStaff_toDepartmentList" height="508px" frameborder="0" width="100%"></iframe>
		</div>
		<div class="main search-business" id="rightDiv" style="float: left; height: 100%; width: 686px;">
			<iframe id="mainFrame" scrolling="no" src="departStaff_toStafferList" height="100%" frameborder="0" width="100%"></iframe>
		</div>
  </div>
</div>

</body></html>