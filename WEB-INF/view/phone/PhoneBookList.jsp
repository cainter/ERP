<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://115.28.87.22:8888/base/PhoneBookList.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>我的通讯录 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script src="js/popup_ext.js"></script>
<script language="javascript">
	function doNew(){
		var url="phone_toPhoneBookNew";
		ShowIframeNoScroll("通讯录",url,320,440,"refreshWin()",760,400);
	}
	function refreshWin(){
		window.location.reload(true);
	}
	function doEdit(id){
		var url="phone_toPhoneBookEdit?id="+id;
		ShowIframeNoScroll("通讯录",url,320,440,"refreshWin()",760,400);
	}
	function doDelete(id){
		ShowConfirm('确认框','确定删除吗？',340,80,"doDelAct("+id+")");
	}
	function doDelAct(id){
		if(popRetVal!=null){
			window.location="./PhoneBookDelete.html?id="+id+"&from_url="+encodeURIComponent(window.location);
		}
	}
	function doCancel(){
		window.close();
	}
	function doGo(pageIndex){
		var searchKey=encodeURIComponent("");
		window.location="./PhoneBookList.html?search_key="+searchKey+"&current_page="+pageIndex;
	}
	function doJump(pageIndex){
		if(window.event.keyCode==13){
			doGo(pageIndex);
		}
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function doSearch(){
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		window.location="./PhoneBookList.html?search_key="+searchKey;
	}
	function doSms(receiver){
		showWin(900,500,"/sms/SmsSendForm.html?receiver="+encodeURIComponent(receiver));
	}
	function doMutiSms(){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		for (i=0;i<ob_arr.length;i++){
			if ((ob_arr[i].checked == true)){
				if(str!=""){
					str=str+"\n";
				}
				str = str+ob_arr[i].getAttribute("phone")+"<"+ob_arr[i].getAttribute("per_name")+">";
			}
		}
		if(str!=""){
			doSms(str);
		}else{
			ShowAlert('提示框','请选择要发短信的对象',200,100);
		}
	}
	function DoubleClick(it){
	}
	function doInit(){
		//Window_Onload();
		document.getElementById("search_key").focus();
	}
</script>
</head>


<body oncontextmenu="return false" onload="doInit();" class="sheet" style="text-align:center;">
<div class="sheet-main" style="width:710px;text-align:left;margin:auto;">
  <div class="sheet-top">
    <div class="content">
      <h2>我的通讯录</h2>
      <p>管理自己的联系人，用于发送手机短信</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
		 <div class="content">
	        <table width="600">
	          <tbody>
	            <tr>
	              <td align="right">
		              <input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" style="width:100px" value="" title="以联系人姓名、联系人姓名拼音字头进行模糊查询">
		              <input type="button" class="buttom search-but" value=" 查 询" onclick="doSearch();">
					  <input type="button" value=" 新 增" onclick="doNew();" class="buttom search-add">
					  <input type="button" value=" 发短信" onclick="doMutiSms();" id="sSmsButton" name="sSmsButton" class="buttom search-sms">
				  </td>
	            </tr>    
	           </tbody>      
	        </table>
	      </div>
		 
<table width="98%" border="0" cellpadding="0" cellspacing="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
	     <div class="table-list">
	        <table width="100%">
	          <tbody><tr>
			  	<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
				<th width="10%">姓名</th>
				<th width="12%">职位</th>
				<th width="23%">公司</th>
				<th width="14%">手机</th>
				<th width="24%">QQ</th>
				<th width="18%">操作</th>
			 </tr>
			<s:iterator value="phoneBooks">
				<tr>
					<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
					<td>${perName }</td>
					<td>${possie }</td>
					<td>${companyName }</td>
					<td>${mobile }</td>
					<td>${qq }</td>
					<td>
					<a href="phone_toPhoneBookEdit?phoneBook.id=${id }">编辑</a>
					<a>删除</a>
					<a>发短信</a>
					</td>
				</tr>
			</s:iterator>
		</tbody></table>
			
    <div class="table-bot">
    	
    	
    	 
    	  <img src="images/but001.gif">
    	  <img src="images/but002.gif">
    	    	
    	第 <input type="text" name="pageNumber" style="width:30px" value="0" onkeydown="javascript:doJump(this.value);" class="TextBox"> 页 
    	共0页
		
		
        <img src="images/but003.gif">
        <img src="images/but004.gif">
		
    </div>
     </div>  
   </div>  
  </div>
<div class="blank12">
</div>

</div><audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>