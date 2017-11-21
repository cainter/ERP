<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0046)http://115.28.87.22:8888/base/InnerPbList.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>内部通讯录 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script language="javascript">
	function doSearch(){
		var departmentId="";
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var searchAll="";
		if(document.getElementById("search_all").checked){
			searchAll="1";
		}
		window.location="./InnerPbList.html?department_id="+departmentId+"&search_key="+searchKey+"&search_all="+searchAll;
	}
	function doDownload(){
		var departmentId="";
		var searchKey=encodeURIComponent("");
		var searchAll="1";
		window.location="./InnerPbList.html?content_type=EXCEL&department_id="+departmentId+"&search_key="+searchKey+"&search_all="+searchAll;
	}
	function doInit(){
		Window_Onload();
		document.getElementById("search_key").focus();
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function showSms(mobile,recName){
		showWin(900,500,"sms/SmsSendForm.html?mobile="+mobile+"&rec_name="+encodeURIComponent(recName));
	}
	function DoubleClick(it){
	}
</script>
</head>


<body oncontextmenu="return false" onload="doInit();" scroll="no" style="background: #EAFAFF;">
		<div id="scrollDiv" style="OVERFLOW:auto;height:508px;">
		  <div class="main search-business">
			   <div class="cue-info">
					<h4>
						所有部门
						
					</h4>				   	
			  </div>
			  <div class="content">		
				  <div align="right">
					<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="" title="以员工姓名、姓名拼音字头进行模糊查询">
					<input type="checkbox" id="search_all" name="search_all" checked="">在所有部门中查找
					<input type="button" class="buttom search-but" value=" 查 询" onclick="doSearch();" title="以员工姓名、姓名拼音字头进行模糊查询">		
					<input type="button" class="buttom search-out" value=" 导 出" onclick="doDownload();">
				  </div>
			  </div>			  
			  
			  <div class="table-list" style="width:98%; padding:15px 0 15px 10px; float:left;">
					<table width="100%">
						<tbody><tr>
							<th width="12%">部门</th>
							<th width="8%">姓名</th>
							<th width="10%">职位</th>
							<th width="12%">手机</th>
							<th width="10%">移动短号</th>
							<th width="12%">QQ</th>
							<th width="14%">邮箱</th>
							<th width="14%">电话</th>
							<th width="8%">分机</th>
						</tr>
						
						
						<s:iterator value="staffers">
						
						<tr class="query_list_data_trSelected" index="1" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this)">
							<td>
								<input type="radio" onclick="javascript:ClickCheck(this);" name="query_checkbox" value="61" style="display:none">
								${departmentId }
							</td>
							<td>${stafferName }</td>
							<td>${possie }</td>
							<td style="word-wrap:break-word;word-break:break-all;">${mobile }<a href="javascript:showSms(&#39;&#39;,&#39;何盼盼&#39;);"></a></td>
							<td style="word-wrap:break-word;word-break:break-all;">${subMobile }</td>
							<td style="word-wrap:break-word;word-break:break-all;">${qq }<a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=&amp;Site=eking;&amp;Menu=no"></a></td>
							<td style="word-wrap:break-word;word-break:break-all;">${email}<a href="mailto:"></a></td>
							<td style="word-wrap:break-word;word-break:break-all;">${phone }</td>
							<td style="word-wrap:break-word;word-break:break-all;">${subPhone }</td>
						</tr>
						</s:iterator>
					</tbody></table>
			  </div>
			</div>
		</div>

<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>